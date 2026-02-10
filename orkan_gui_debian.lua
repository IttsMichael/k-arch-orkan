#!/usr/bin/env lua
-- ============================================================================
-- Orkan UI - GTK3 Edition (Debian / Ubuntu / apt-based)
-- A modern GUI for installing software on Debian-based distributions.
-- Requires: lua-lgi, GTK3
-- Install deps: sudo apt install lua5.3 lua-lgi libgtk-3-0
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
-- Menu Data (Debian/Ubuntu - apt-based commands)
-- ============================================================================

local MENU_DATA = {
    {
        category = "Gaming",
        subcategories = {
            {
                name = "Tools",
                items = {
                    { name = "Lutris", cmd = "sudo apt install -y lutris" },
                    { name = "Steam", cmd = "sudo apt install -y steam" },
                    { name = "Heroic Launcher", cmd = "flatpak install -y com.heroicgameslauncher.hgl" },
                    { name = "WINE (Stable)", cmd = "sudo apt install -y wine" },
                    { name = "WINE (Staging)", cmd = "sudo apt install -y wine-staging || sudo apt install -y winehq-staging" },
                    { name = "WineTricks", cmd = "sudo apt install -y winetricks" },
                    { name = "ProtonUp-Qt", cmd = "flatpak install -y net.davidotek.pupgui2" },
                }
            },
            {
                name = "Games",
                items = {
                    { name = "Sober (Roblox)", cmd = "flatpak install -y org.vinegarhq.Sober" },
                    { name = "Prism Launcher", cmd = "flatpak install -y org.prismlauncher.PrismLauncher" },
                    { name = "Lunar Client", cmd = "flatpak install -y com.lunarclient.LunarClient" },
                    { name = "Minecraft Launcher", cmd = "flatpak install -y com.mojang.Minecraft" },
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
                    { name = "LibreOffice", cmd = "sudo apt install -y libreoffice" },
                    { name = "OnlyOffice", cmd = "flatpak install -y org.onlyoffice.desktopeditors" },
                    { name = "WPS Office", cmd = "flatpak install -y com.wps.Office" },
                    { name = "Calligra Suite", cmd = "sudo apt install -y calligra" },
                }
            },
            {
                name = "Photo Editing",
                items = {
                    { name = "GIMP", cmd = "sudo apt install -y gimp" },
                    { name = "Krita", cmd = "sudo apt install -y krita" },
                    { name = "Digikam", cmd = "sudo apt install -y digikam" },
                    { name = "Inkscape", cmd = "sudo apt install -y inkscape" },
                }
            },
            {
                name = "Video Editing",
                items = {
                    { name = "Kdenlive", cmd = "sudo apt install -y kdenlive" },
                    { name = "Shotcut", cmd = "sudo apt install -y shotcut" },
                    { name = "OpenShot", cmd = "sudo apt install -y openshot-qt" },
                    { name = "Flowblade", cmd = "sudo apt install -y flowblade" },
                }
            },
            {
                name = "3D Modeling",
                items = {
                    { name = "Blender", cmd = "sudo apt install -y blender" },
                    { name = "Vinegar (Roblox Studio)", cmd = "flatpak install -y org.vinegarhq.Vinegar" },
                }
            },
            {
                name = "Text Editors",
                items = {
                    { name = "Vim", cmd = "sudo apt install -y vim" },
                    { name = "NeoVim", cmd = "sudo apt install -y neovim" },
                    { name = "Emacs", cmd = "sudo apt install -y emacs" },
                    { name = "VS Code", cmd = "sudo apt install -y wget gpg && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg && sudo install -D -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main' | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null && sudo apt update && sudo apt install -y code" },
                    { name = "VSCodium", cmd = "flatpak install -y com.vscodium.codium" },
                    { name = "Sublime Text", cmd = "sudo apt install -y apt-transport-https && wget -qO- https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null && echo 'deb https://download.sublimetext.com/ apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list && sudo apt update && sudo apt install -y sublime-text" },
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
                    { name = "Install UFW", cmd = "sudo apt install -y ufw && sudo ufw enable" },
                    { name = "Install NFTables", cmd = "sudo apt install -y nftables && sudo systemctl enable --now nftables" },
                    { name = "Install Firewalld", cmd = "sudo apt install -y firewalld && sudo systemctl enable --now firewalld" },
                    { name = "Remove UFW", cmd = "sudo ufw disable && sudo apt remove -y ufw" },
                    { name = "Remove NFTables", cmd = "sudo systemctl disable nftables && sudo apt remove -y nftables" },
                    { name = "Remove Firewalld", cmd = "sudo systemctl disable firewalld && sudo apt remove -y firewalld" },
                }
            },
            {
                name = "Drivers (NVIDIA)",
                items = {
                    { name = "Rebuild Initramfs", cmd = "sudo update-initramfs -u" },
                    { name = "Detect & Install NVIDIA", cmd = "sudo ubuntu-drivers autoinstall || sudo apt install -y nvidia-driver" },
                    { name = "Install CUDA", cmd = "sudo apt install -y nvidia-cuda-toolkit" },
                    { name = "Install nvidia-driver", cmd = "sudo apt install -y nvidia-driver" },
                    { name = "Install nvidia-dkms", cmd = "sudo apt install -y nvidia-kernel-dkms" },
                    { name = "Remove nvidia-driver", cmd = "sudo apt remove -y nvidia-driver && sudo apt autoremove -y" },
                }
            },
            {
                name = "Kernels",
                items = {
                    { name = "linux-generic", cmd = "sudo apt install -y linux-generic" },
                    { name = "linux-lowlatency", cmd = "sudo apt install -y linux-lowlatency" },
                    { name = "linux-hwe (HW Enablement)", cmd = "sudo apt install -y linux-generic-hwe-$(lsb_release -rs)" },
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
                    { name = "VLC", cmd = "sudo apt install -y vlc" },
                    { name = "MPV", cmd = "sudo apt install -y mpv" },
                    { name = "SMPlayer", cmd = "sudo apt install -y smplayer" },
                    { name = "Clementine", cmd = "sudo apt install -y clementine" },
                    { name = "Gwenview", cmd = "sudo apt install -y gwenview" },
                }
            },
            {
                name = "Browsers",
                items = {
                    { name = "Firefox", cmd = "sudo apt install -y firefox || sudo apt install -y firefox-esr" },
                    { name = "LibreWolf", cmd = "flatpak install -y io.gitlab.librewolf_community" },
                    { name = "Chromium", cmd = "sudo apt install -y chromium || sudo apt install -y chromium-browser" },
                    { name = "Mullvad Browser", cmd = "flatpak install -y net.mullvad.MullvadBrowser" },
                    { name = "Zen Browser", cmd = "flatpak install -y app.zen_browser.zen" },
                    { name = "Brave", cmd = "sudo apt install -y curl && sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && echo 'deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main' | sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update && sudo apt install -y brave-browser" },
                    { name = "Vivaldi", cmd = "sudo apt install -y wget && wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/vivaldi.gpg > /dev/null && echo 'deb [signed-by=/usr/share/keyrings/vivaldi.gpg] https://repo.vivaldi.com/archive/deb/ stable main' | sudo tee /etc/apt/sources.list.d/vivaldi.list && sudo apt update && sudo apt install -y vivaldi-stable" },
                    { name = "Tor Browser", cmd = "sudo apt install -y torbrowser-launcher" },
                }
            },
            {
                name = "System Monitors",
                items = {
                    { name = "Htop", cmd = "sudo apt install -y htop" },
                    { name = "Btop", cmd = "sudo apt install -y btop" },
                    { name = "Bpytop", cmd = "sudo apt install -y bpytop" },
                    { name = "Glances", cmd = "sudo apt install -y glances" },
                    { name = "Conky", cmd = "sudo apt install -y conky-all" },
                    { name = "Fastfetch", cmd = "sudo apt install -y fastfetch || sudo apt install -y neofetch" },
                    { name = "GNOME Monitor", cmd = "sudo apt install -y gnome-system-monitor" },
                }
            },
            {
                name = "Pen Testing",
                items = {
                    { name = "Nmap", cmd = "sudo apt install -y nmap" },
                    { name = "Metasploit", cmd = "sudo apt install -y curl && curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall && chmod 755 /tmp/msfinstall && sudo /tmp/msfinstall" },
                    { name = "Wireshark", cmd = "sudo apt install -y wireshark" },
                    { name = "Aircrack-ng", cmd = "sudo apt install -y aircrack-ng" },
                    { name = "John the Ripper", cmd = "sudo apt install -y john" },
                    { name = "Netcat", cmd = "sudo apt install -y netcat-openbsd" },
                    { name = "Hashcat", cmd = "sudo apt install -y hashcat" },
                }
            },
            {
                name = "Languages",
                items = {
                    { name = "Zsh", cmd = "sudo apt install -y zsh" },
                    { name = "PowerShell", cmd = "sudo apt install -y wget && wget -q 'https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb' -O /tmp/packages-microsoft-prod.deb && sudo dpkg -i /tmp/packages-microsoft-prod.deb && sudo apt update && sudo apt install -y powershell" },
                    { name = "Fish", cmd = "sudo apt install -y fish" },
                    { name = "Python 3", cmd = "sudo apt install -y python3 python3-venv" },
                    { name = "Pip", cmd = "sudo apt install -y python3-pip" },
                    { name = "Java (OpenJDK)", cmd = "sudo apt install -y default-jdk" },
                    { name = "Go", cmd = "sudo apt install -y golang" },
                    { name = "Rust", cmd = "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" },
                    { name = "Node.js", cmd = "sudo apt install -y nodejs npm" },
                }
            },
            {
                name = "Terminal Emulators",
                items = {
                    { name = "Kitty", cmd = "sudo apt install -y kitty" },
                    { name = "Alacritty", cmd = "sudo apt install -y alacritty" },
                    { name = "Konsole", cmd = "sudo apt install -y konsole" },
                    { name = "Xfce4-Terminal", cmd = "sudo apt install -y xfce4-terminal" },
                    { name = "GNOME Terminal", cmd = "sudo apt install -y gnome-terminal" },
                    { name = "Tilix", cmd = "sudo apt install -y tilix" },
                }
            },
            {
                name = "Package Managers",
                items = {
                    { name = "Flatpak", cmd = "sudo apt install -y flatpak && flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo" },
                    { name = "Snap", cmd = "sudo apt install -y snapd" },
                    { name = "Nala (Modern apt frontend)", cmd = "sudo apt install -y nala" },
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
                    { name = "Update System", cmd = "sudo apt update && sudo apt upgrade -y" },
                    { name = "Full Upgrade", cmd = "sudo apt update && sudo apt full-upgrade -y" },
                    { name = "Autoremove", cmd = "sudo apt autoremove -y" },
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
    title = "Orkan UI (Debian) — run from terminal for sudo prompts",
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
