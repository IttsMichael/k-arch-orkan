#!/usr/bin/env lua
-- ============================================================================
-- Orkan UI - GTK3 Edition
-- A modern GUI for installing software on Arch Linux.
-- Requires: lua-lgi, GTK3
-- ============================================================================

local lgi = require('lgi')
local Gtk = lgi.require('Gtk', '3.0')
local Gio = lgi.Gio
local GLib = lgi.GLib

-- ============================================================================
-- CSS Styling (Dark Theme)
-- ============================================================================

local CSS = [[
/* Main Window */
window {
    background-color: #1e1e2e;
}

/* Notebook Tabs */
notebook header tabs tab {
    background-color: #313244;
    color: #a6adc8;
    padding: 6px 18px;
    margin: 1px;
    border-radius: 6px 6px 0 0;
    border: 1px solid #45475a;
    border-bottom: none;
}
notebook header tabs tab:checked {
    background-color: #89b4fa;
    color: #1e1e2e;
    font-weight: bold;
}
notebook header tabs tab:hover {
    background-color: #45475a;
    color: #cdd6f4;
}
notebook header {
    background-color: #181825;
}
notebook stack {
    background-color: #1e1e2e;
    border: 1px solid #313244;
}

/* Group Frames */
frame {
    border: 1px solid #313244;
    border-radius: 8px;
    background-color: #181825;
    padding: 6px;
}
frame > label {
    color: #89b4fa;
    font-weight: bold;
    font-size: 13px;
}

/* Buttons */
.item-btn {
    background-image: none;
    background-color: #313244;
    color: #cdd6f4;
    border: 1px solid #45475a;
    border-radius: 6px;
    padding: 6px 10px;
    min-height: 20px;
    transition: 200ms ease;
}
.item-btn:hover {
    background-color: #45475a;
    border-color: #585b70;
}
.item-btn:active {
    background-color: #89b4fa;
    color: #1e1e2e;
}

/* Log Area */
.log-view text {
    background-color: #11111b;
    color: #a6adc8;
    font-family: Monospace;
}

/* Labels */
label {
    color: #cdd6f4;
}

/* Scrollbar */
scrollbar slider {
    background-color: #45475a;
    border-radius: 4px;
    min-width: 6px;
    min-height: 6px;
}
scrollbar slider:hover {
    background-color: #585b70;
}
scrollbar trough {
    background-color: #181825;
}
]]

-- ============================================================================
-- Menu Data (ported from orkan-1.2a.lua / data.py)
-- ============================================================================

local MENU_DATA = {
    {
        category = "Gaming",
        subcategories = {
            {
                name = "Tools",
                items = {
                    { name = "Lutris", cmd = "sudo pacman -S lutris --noconfirm" },
                    { name = "Steam", cmd = "sudo pacman -S steam --noconfirm" },
                    { name = "Heroic Launcher", cmd = "sudo pacman -S heroic-games-launcher --noconfirm" },
                    { name = "WINE (Stable)", cmd = "sudo pacman -S wine --noconfirm" },
                    { name = "WINE (Staging)", cmd = "sudo pacman -S wine-staging --noconfirm" },
                    { name = "WineTricks", cmd = "sudo pacman -S winetricks --noconfirm" },
                    { name = "ProtonUp-Qt", cmd = "sudo pacman -S protonup-qt --noconfirm" },
                }
            },
            {
                name = "Games",
                items = {
                    { name = "Sober (Roblox)", cmd = "flatpak install org.vinegarhq.Sober -y" },
                    { name = "Prism Launcher", cmd = "sudo pacman -S prismlauncher --noconfirm" },
                    { name = "Lunar Client", cmd = "yay -S lunar-client --noconfirm" },
                    { name = "Minecraft Launcher", cmd = "yay -S minecraft-launcher --noconfirm" },
                }
            }
        }
    },
    {
        category = "Productivity",
        subcategories = {
            {
                name = "Office",
                items = {
                    { name = "LibreOffice (Still)", cmd = "sudo pacman -S libreoffice-still --noconfirm" },
                    { name = "LibreOffice (Fresh)", cmd = "sudo pacman -S libreoffice-fresh --noconfirm" },
                    { name = "OnlyOffice", cmd = "yay -S onlyoffice-bin --noconfirm" },
                    { name = "WPS Office", cmd = "yay -S wps-office --noconfirm" },
                }
            },
            {
                name = "Photo Editing",
                items = {
                    { name = "GIMP", cmd = "sudo pacman -S gimp --noconfirm" },
                    { name = "Krita", cmd = "sudo pacman -S krita --noconfirm" },
                    { name = "Digikam", cmd = "sudo pacman -S digikam --noconfirm" },
                    { name = "Inkscape", cmd = "sudo pacman -S inkscape --noconfirm" },
                }
            },
            {
                name = "Video Editing",
                items = {
                    { name = "Kdenlive", cmd = "sudo pacman -S kdenlive --noconfirm" },
                    { name = "Shotcut", cmd = "sudo pacman -S shotcut --noconfirm" },
                    { name = "OpenShot", cmd = "sudo pacman -S openshot --noconfirm" },
                    { name = "Flowblade", cmd = "sudo pacman -S flowblade --noconfirm" },
                }
            },
            {
                name = "3D Modeling",
                items = {
                    { name = "Blender", cmd = "sudo pacman -S blender --noconfirm" },
                    { name = "Vinegar (Roblox Studio)", cmd = "flatpak install org.vinegarhq.Vinegar -y" },
                }
            },
            {
                name = "Text Editors",
                items = {
                    { name = "Vim", cmd = "sudo pacman -S vim --noconfirm" },
                    { name = "NeoVim", cmd = "sudo pacman -S neovim --noconfirm" },
                    { name = "Emacs", cmd = "sudo pacman -S emacs --noconfirm" },
                    { name = "VS Code", cmd = "yay -S visual-studio-code-bin --noconfirm" },
                    { name = "VSCodium", cmd = "yay -S vscodium --noconfirm" },
                    { name = "Code - OSS", cmd = "sudo pacman -S code --noconfirm" },
                }
            }
        }
    },
    {
        category = "Tweaks",
        subcategories = {
            {
                name = "Firewalls",
                items = {
                    { name = "Install UFW", cmd = "sudo pacman -S ufw --noconfirm && sudo systemctl enable --now ufw" },
                    { name = "Install NFTables", cmd = "sudo pacman -S nftables --noconfirm && sudo systemctl enable --now nftables" },
                    { name = "Install Firewalld", cmd = "sudo pacman -S firewalld --noconfirm && sudo systemctl enable --now firewalld" },
                    { name = "Remove UFW", cmd = "sudo systemctl disable ufw && sudo pacman -Rns ufw --noconfirm" },
                    { name = "Remove NFTables", cmd = "sudo systemctl disable nftables && sudo pacman -Rns nftables --noconfirm" },
                    { name = "Remove Firewalld", cmd = "sudo systemctl disable firewalld && sudo pacman -Rns firewalld --noconfirm" },
                }
            },
            {
                name = "Drivers (NVIDIA)",
                items = {
                    { name = "Rebuild Initramfs", cmd = "sudo mkinitcpio -P" },
                    { name = "Install CUDA", cmd = "sudo pacman -S cuda nvidia-utils nvidia-settings --noconfirm" },
                    { name = "Install OpenCL", cmd = "sudo pacman -S opencl-nvidia opencl-headers --noconfirm" },
                    { name = "Install nvidia-open", cmd = "sudo pacman -S nvidia-open --noconfirm" },
                    { name = "Install nvidia-open-lts", cmd = "sudo pacman -S nvidia-open-lts --noconfirm" },
                    { name = "Install nvidia-open-dkms", cmd = "sudo pacman -S nvidia-open-dkms --noconfirm" },
                    { name = "Remove nvidia-open", cmd = "sudo pacman -Rns nvidia-open --noconfirm" },
                    { name = "Remove nvidia-open-lts", cmd = "sudo pacman -Rns nvidia-open-lts --noconfirm" },
                    { name = "Remove nvidia-open-dkms", cmd = "sudo pacman -Rns nvidia-open-dkms --noconfirm" },
                }
            },
            {
                name = "Kernels",
                items = {
                    { name = "linux", cmd = "sudo pacman -S linux linux-headers --noconfirm" },
                    { name = "linux-lts", cmd = "sudo pacman -S linux-lts linux-lts-headers --noconfirm" },
                    { name = "linux-zen", cmd = "sudo pacman -S linux-zen linux-zen-headers --noconfirm" },
                    { name = "linux-hardened", cmd = "sudo pacman -S linux-hardened linux-hardened-headers --noconfirm" },
                }
            }
        }
    },
    {
        category = "Tools",
        subcategories = {
            {
                name = "Media Players",
                items = {
                    { name = "VLC", cmd = "sudo pacman -S vlc --noconfirm" },
                    { name = "MPV", cmd = "sudo pacman -S mpv --noconfirm" },
                    { name = "SMPlayer", cmd = "sudo pacman -S smplayer --noconfirm" },
                    { name = "Clementine", cmd = "sudo pacman -S clementine --noconfirm" },
                    { name = "Gwenview", cmd = "sudo pacman -S gwenview --noconfirm" },
                }
            },
            {
                name = "Browsers",
                items = {
                    { name = "Firefox", cmd = "sudo pacman -S firefox --noconfirm" },
                    { name = "LibreWolf", cmd = "yay -S librewolf-bin --noconfirm" },
                    { name = "Chromium", cmd = "sudo pacman -S chromium --noconfirm" },
                    { name = "Mullvad Browser", cmd = "yay -S mullvad-browser-bin --noconfirm" },
                    { name = "Zen Browser", cmd = "yay -S zen-browser-bin --noconfirm" },
                    { name = "Thorium", cmd = "yay -S thorium-browser-bin --noconfirm" },
                    { name = "Brave", cmd = "yay -S brave-bin --noconfirm" },
                    { name = "Vivaldi", cmd = "sudo pacman -S vivaldi --noconfirm" },
                    { name = "Tor Browser", cmd = "sudo pacman -S torbrowser-launcher --noconfirm" },
                }
            },
            {
                name = "System Monitors",
                items = {
                    { name = "Htop", cmd = "sudo pacman -S htop --noconfirm" },
                    { name = "Btop", cmd = "sudo pacman -S btop --noconfirm" },
                    { name = "Bpytop", cmd = "sudo pacman -S bpytop --noconfirm" },
                    { name = "Bashtop", cmd = "sudo pacman -S bashtop --noconfirm" },
                    { name = "Glances", cmd = "sudo pacman -S glances --noconfirm" },
                    { name = "Conky", cmd = "sudo pacman -S conky --noconfirm" },
                    { name = "Fastfetch", cmd = "sudo pacman -S fastfetch --noconfirm" },
                    { name = "GNOME Monitor", cmd = "sudo pacman -S gnome-system-monitor --noconfirm" },
                }
            },
            {
                name = "Pen Testing",
                items = {
                    { name = "Nmap", cmd = "sudo pacman -S nmap --noconfirm" },
                    { name = "Metasploit", cmd = "yay -S metasploit --noconfirm" },
                    { name = "Wireshark-CLI", cmd = "sudo pacman -S wireshark-cli --noconfirm" },
                    { name = "Aircrack-ng", cmd = "sudo pacman -S aircrack-ng --noconfirm" },
                    { name = "John the Ripper", cmd = "sudo pacman -S john --noconfirm" },
                    { name = "Netcat", cmd = "sudo pacman -S openbsd-netcat --noconfirm" },
                    { name = "Hashcat", cmd = "sudo pacman -S hashcat --noconfirm" },
                    { name = "BlackArch Repo", cmd = "sudo pacman -S curl --noconfirm && curl -O https://blackarch.org/strap.sh && sudo ./strap.sh && sudo pacman -Syyu --noconfirm" },
                }
            },
            {
                name = "Languages",
                items = {
                    { name = "Zsh", cmd = "sudo pacman -S zsh --noconfirm" },
                    { name = "PowerShell", cmd = "yay -S powershell-bin --noconfirm" },
                    { name = "Fish", cmd = "sudo pacman -S fish --noconfirm" },
                    { name = "Python", cmd = "sudo pacman -S python --noconfirm" },
                    { name = "Pip", cmd = "sudo pacman -S python-pip --noconfirm" },
                    { name = "Java (OpenJDK)", cmd = "sudo pacman -S jdk-openjdk --noconfirm" },
                    { name = "Go", cmd = "sudo pacman -S go --noconfirm" },
                    { name = "Rust", cmd = "sudo pacman -S rust --noconfirm" },
                    { name = "Node.js", cmd = "sudo pacman -S nodejs npm --noconfirm" },
                }
            },
            {
                name = "Terminal Emulators",
                items = {
                    { name = "Kitty", cmd = "sudo pacman -S kitty --noconfirm" },
                    { name = "Alacritty", cmd = "sudo pacman -S alacritty --noconfirm" },
                    { name = "Konsole", cmd = "sudo pacman -S konsole --noconfirm" },
                    { name = "Xfce4-Terminal", cmd = "sudo pacman -S xfce4-terminal --noconfirm" },
                }
            },
            {
                name = "AUR Helpers",
                items = {
                    { name = "YAY", cmd = "sudo pacman -S git base-devel --noconfirm && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm" },
                    { name = "PARU", cmd = "sudo pacman -S git base-devel --noconfirm && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm" },
                    { name = "Flatpak", cmd = "sudo pacman -S flatpak --noconfirm && flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo" },
                }
            }
        }
    },
    {
        category = "System",
        subcategories = {
            {
                name = "Updates",
                items = {
                    { name = "Update System", cmd = "sudo pacman -Syu --noconfirm" },
                }
            }
        }
    }
}

-- ============================================================================
-- Helper: Run command async and pipe output to the log
-- ============================================================================

local log_buffer  -- forward ref

local function log_append(text)
    if not log_buffer then return end
    local iter = log_buffer:get_end_iter()
    local msg = text .. "\n"
    log_buffer:insert(iter, msg, #msg)
end

local function run_command(cmd)
    log_append(">> " .. cmd)

    local pid, stdin, stdout, stderr = GLib.spawn_async_with_pipes(
        nil,                         -- working dir (nil = inherit)
        {"/bin/bash", "-c", cmd},    -- argv
        nil,                         -- env (nil = inherit)
        GLib.SpawnFlags.SEARCH_PATH, -- flags
        nil                          -- child_setup
    )

    -- Read stdout in an idle callback via GLib.IOChannel
    local channel = GLib.IOChannel.unix_new(stdout)
    channel:set_flags(GLib.IOFlags.NONBLOCK)

    GLib.io_add_watch(channel, GLib.PRIORITY_DEFAULT,
        GLib.IOCondition.IN + GLib.IOCondition.HUP,
        function(source, condition)
            if condition == GLib.IOCondition.HUP then
                log_append(">> Done.")
                log_append("--------------------------------------------------")
                source:shutdown(false)
                return false  -- remove watch
            end
            local line, _, _ = source:read_line()
            if line then
                -- strip trailing newline
                log_append(line:gsub("\n$", ""))
            end
            return true  -- keep watching
        end
    )
end

-- ============================================================================
-- Build the UI
-- ============================================================================

local window = Gtk.Window {
    title = "Orkan UI (Arch) — run from terminal for sudo prompts",
    default_width = 900,
    default_height = 620,
    on_destroy = Gtk.main_quit,
}

-- Apply CSS
local provider = Gtk.CssProvider()
provider:load_from_data(CSS)
local screen = window:get_screen()
Gtk.StyleContext.add_provider_for_screen(
    screen, provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
)

-- Main vertical box
local vbox = Gtk.Box {
    orientation = 'VERTICAL',
    spacing = 0,
}
window:add(vbox)

-- Notebook (tabs)
local notebook = Gtk.Notebook {
    expand = true,
}
vbox:pack_start(notebook, true, true, 0)

for _, cat in ipairs(MENU_DATA) do
    -- Each tab: scrolled window -> vbox of frames
    local scroll = Gtk.ScrolledWindow {
        hscrollbar_policy = 'NEVER',
        vscrollbar_policy = 'AUTOMATIC',
    }

    local page = Gtk.Box {
        orientation = 'VERTICAL',
        spacing = 12,
        margin = 12,
    }
    scroll:add(page)

    for _, sub in ipairs(cat.subcategories) do
        local frame = Gtk.Frame { label = sub.name }
        local grid = Gtk.Grid {
            column_spacing = 8,
            row_spacing = 8,
            margin = 10,
        }
        frame:add(grid)

        local col, row = 0, 0
        for _, item in ipairs(sub.items) do
            local btn = Gtk.Button {
                label = item.name,
                hexpand = true,
            }
            btn:get_style_context():add_class('item-btn')
            function btn:on_clicked()
                run_command(item.cmd)
            end
            grid:attach(btn, col, row, 1, 1)
            col = col + 1
            if col >= 3 then
                col = 0
                row = row + 1
            end
        end

        page:pack_start(frame, false, false, 0)
    end

    notebook:append_page(scroll, Gtk.Label { label = cat.category })
end

-- Log output area at the bottom
local log_frame = Gtk.Frame { label = "Output Log" }
local log_scroll = Gtk.ScrolledWindow {
    height_request = 140,
    hscrollbar_policy = 'AUTOMATIC',
    vscrollbar_policy = 'AUTOMATIC',
}
local log_view = Gtk.TextView {
    editable = false,
    cursor_visible = false,
    wrap_mode = 'WORD_CHAR',
    monospace = true,
}
log_view:get_style_context():add_class('log-view')
log_buffer = log_view:get_buffer()

-- Auto-scroll when text is inserted
log_buffer.on_changed = function()
    GLib.idle_add(GLib.PRIORITY_DEFAULT_IDLE, function()
        local adj = log_scroll:get_vadjustment()
        adj:set_value(adj:get_upper() - adj:get_page_size())
        return false
    end)
end

log_scroll:add(log_view)
log_frame:add(log_scroll)
vbox:pack_start(log_frame, false, false, 0)

-- Show everything and start the main loop
window:show_all()
Gtk.main()
