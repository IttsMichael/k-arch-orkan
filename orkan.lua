function Arch_category()
        os.execute("clear")

        print([[
.        :    :::.     ::::::.    :::.    .        :  .,:::::::::.    :::. ...    :::
;;,.    ;;;   ;;`;;    ;;;`;;;;,  `;;;    ;;,.    ;;; ;;;;''''`;;;;,  `;;; ;;     ;;;
[[[[, ,[[[[, ,[[ '[[,  [[[  [[[[[. '[[    [[[[, ,[[[[, [[cccc   [[[[[. '[[[['     [[[
$$$$$$$$"$$$c$$$cc$$$c $$$  $$$ "Y$c$$    $$$$$$$$"$$$ $$""""   $$$ "Y$c$$$$      $$$
888 Y88" 888o888   888,888  888    Y88    888 Y88" 888o888oo,__ 888    Y8888    .d888
MMM  M'  "MMMYMM   ""` MMM  MMM     YM    MMM  M'  "MMM""""YUMMMMMM     YM "YmmMMMM""

[1] Gaming
[2] Productivity
[3] Tweaks
[4] Tools
[0] Exit
]])

        print("Choose an option (0-4): ")
        local arch_category_choice = tonumber(io.read())

        if arch_category_choice == 1 then
                return Arch_gaming()
        end
        if arch_category_choice == 2 then
                return Arch_productivity()
        end
        if arch_category_choice == 3 then
                return Arch_tweaks()
        end
        if arch_category_choice == 4 then
                return Arch_tools()
        end
        if arch_category_choice == 0 then
                os.exit()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_category()
        end
end

function Arch_gaming()
        os.execute("clear")

        print([[
  .,-:::::/   :::.     .        :   ::::::.    :::.  .,-:::::/  
,;;-'````'    ;;`;;    ;;,.    ;;;  ;;;`;;;;,  `;;;,;;-'````'   
[[[   [[[[[[/,[[ '[[,  [[[[, ,[[[[, [[[  [[[[[. '[[[[[   [[[[[[/
"$$c.    "$$c$$$cc$$$c $$$$$$$$"$$$ $$$  $$$ "Y$c$$"$$c.    "$$ 
 `Y8bo,,,o88o888   888,888 Y88" 888o888  888    Y88 `Y8bo,,,o88o
   `'YMUP"YMMYMM   ""` MMM  M'  "MMMMMM  MMM     YM   `'YMUP"YMM

[1] Games
[2] Lutris - Managing Game Stores
[3] Steam - Game Marketplace and Launcher
[4] Heroic Games Launcher - Managing Game Stores
[5] WINE - Newest Stable Release
[6] WINE Testing - Experimental Release
[7] WineTricks - Newest Stable Release
[8] Proton-UpQt - Managing Proton, WINE-GE and other compatibility tools
[0] Go Back
]])

        print("Choose an option (0-8): ")
        local arch_gaming_choice = tonumber(io.read())

        if arch_gaming_choice == 1 then
                return Arch_gaming_games()
        end
        if arch_gaming_choice == 2 then
		os.execute("sudo pacman -S lutris")
                return Arch_gaming()
        end
        if arch_gaming_choice == 3 then
                os.execute("sudo pacman -S steam")
                return Arch_gaming()
        end
        if arch_gaming_choice == 4 then
                os.execute("sudo pacman -S heroic-games-launcher")
                return Arch_gaming()
        end
        if arch_gaming_choice == 5 then
                os.execute("sudo pacman -S wine")
                return Arch_gaming()
        end
        if arch_gaming_choice == 6 then
                os.execute("sudo pacman -S wine-staging")
                return Arch_gaming()
        end
        if arch_gaming_choice == 7 then
                os.execute(" sudo pacman -S winetricks")
                return Arch_gaming()
        end
        if arch_gaming_choice == 8 then
                os.execute("sudo pacman -S protonup-qt")
		return Arch_gaming()
        end
        if arch_gaming_choice == 0 then
                return Arch_category()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_gaming()
        end
end

function Arch_gaming_games()
        os.execute("clear")

        print([[
  .,-:::::/   :::.     .        :  .,:::::: .::::::. 
,;;-'````'    ;;`;;    ;;,.    ;;; ;;;;'''';;;`    ` 
[[[   [[[[[[/,[[ '[[,  [[[[, ,[[[[, [[cccc '[==/[[[[,
"$$c.    "$$c$$$cc$$$c $$$$$$$$"$$$ $$""""   '''    $
 `Y8bo,,,o88o888   888,888 Y88" 888o888oo,__88b    dP
   `'YMUP"YMMYMM   ""` MMM  M'  "MMM""""YUMMM"YMmMY" 

[1] Sober - Roblox Launcher by VinegarHQ
[2] Prism Launcher - FOSS, Fast and Customizable Minecraft Launcher
[3] Lunar Client - Powerful Minecraft Launcher with a ton of mods
[4] Minecraft Launcher - Official Minecraft Launcher by MOJANG
[0] Go Back
]])

	print("Choose an option (0-4): ")
        local arch_gaming_games_choice = tonumber(io.read())

        if arch_gaming_games_choice == 1 then
                os.execute("flatpak install org.vinegarhq.Sober")
                return Arch_gaming_games()
        end
	if arch_gaming_games_choice == 2 then
		os.execute("sudo pacman -S prismlauncher")
		return Arch_gaming_games()
	end
        if arch_gaming_games_choice == 3 then
                os.execute("yay -S lunar-client")
                return Arch_gaming_games()
        end
        if arch_gaming_games_choice == 4 then
                os.execute("yay -S minecraft-launcher")
                return Arch_gaming_games()
        end
        if arch_gaming_games_choice == 0 then
                return Arch_gaming()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_gaming_games()
        end
end

function Arch_productivity()
        os.execute("clear")

        print([[
::::::::::. :::::::..       ...    :::::::-.   ...    :::  .,-:::::::::::::::::::::::      .::.:::::::::::::::.-:.     ::-.
 `;;;```.;;;;;;;``;;;;   .;;;;;;;.  ;;,   `';, ;;     ;;;,;;;'````';;;;;;;;'''';;;';;,   ,;;;' ;;;;;;;;;;;'''' ';;.   ;;;;'
  `[[nnn[['  [[[,/[[['  ,[[     \[[,`[[     [[[['     [[[[[[            [[     [[[ \[[  .[[/   [[[     [[        '[[,[[['  
   $$$""     $$$$$$c    $$$,     $$$ $$,    $$$$      $$$$$$            $$     $$$  Y$c.$$"    $$$     $$          c$$"    
   888o      888b "88bo,"888,_ _,88P 888_,o8P'88    .d888`88bo,__,o,    88,    888   Y88P      888     88,       ,8P"`     
   YMMMb     MMMM   "W"   "YMMMMMP"  MMMMP"`   "YmmMMMM""  "YUMMMMMP"   MMM    MMM    MP       MMM     MMM      mM"        

[1] Office Suites
[2] Photo Editing
[3] Video Editing
[4] 3D Modeling
[5] Text Editing 
[0] Go Back
]])

        print("Choose an option (0-5): ")
        local arch_productivity_choice = tonumber(io.read())

        if arch_productivity_choice == 1 then
                return Arch_productivity_officesuites()
        end
        if arch_productivity_choice == 2 then
                return Arch_productivity_photoediting()
        end
        if arch_productivity_choice == 3 then
                return Arch_productivity_videoediting()
        end
        if arch_productivity_choice == 4 then
                return Arch_productivity_3dmodeling()
        end
        if arch_productivity_choice == 5 then
                return Arch_productivity_textediting()
        end
        if arch_productivity_choice == 0 then
                return Arch_category()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_productivity()
        end
end

function Arch_productivity_officesuites()
        os.execute("clear")

        print([[
    ...     .-:::::'.-:::::':::  .,-::::: .,::::::       .::::::.  ...    ::::::::::::::::::.,:::::: .::::::. 
 .;;;;;;;.  ;;;'''' ;;;'''' ;;;,;;;'````' ;;;;''''      ;;;`    `  ;;     ;;;;;;;;;;;;;;'''';;;;'''';;;`    ` 
,[[     \[[,[[[,,== [[[,,== [[[[[[         [[cccc       '[==/[[[[,[['     [[[[[[     [[      [[cccc '[==/[[[[,
$$$,     $$$`$$$"`` `$$$"`` $$$$$$         $$""""         '''    $$$      $$$$$$     $$      $$""""   '''    $
"888,_ _,88P 888     888    888`88bo,__,o, 888oo,__      88b    dP88    .d888888     88,     888oo,__88b    dP
  "YMMMMMP"  "MM,    "MM,   MMM  "YUMMMMMP"""""YUMMM      "YMmMY"  "YmmMMMM""MMM     MMM     """"YUMMM"YMmMY" 

[1] LibreOffice - Office Suite
[2] LibreOffice Fresh - Testing version of the LibreOffice Suite
[3] OnlyOffice - Office Suite
[4] WPS Office - Office Suite
[0] Go Back
]])

        print("Choose an option (0-3): ")
        local arch_productivity_officesuites_choice = tonumber(io.read())

        if arch_productivity_officesuites_choice == 1 then
                os.execute("sudo pacman -S libreoffice-still")
                return Arch_productivity_officesuites()
        end
        if arch_productivity_officesuites_choice == 2 then
                os.execute("sudo pacman -S libreoffice-fresh")
                return Arch_productivity_officesuites()
        end
        if arch_productivity_officesuites_choice == 3 then
                os.execute("yay -S onlyoffice-bin")
                return Arch_productivity_officesuites()
        end
        if arch_productivity_officesuites_choice == 4 then
                os.execute("yay -S wps-office")
                return Arch_productivity_officesuites()
        end
        if arch_productivity_officesuites_choice == 0 then
                return Arch_productivity()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_productivity_officesuites()
        end
end

function Arch_productivity_photoediting()
        os.execute("clear")

        print([[
:::.        :    :::.      .,-:::::/ .,::::::      .,:::::::::::::-.  :::::::::::::::   ...    :::::::..   .::::::. 
;;;;;,.    ;;;   ;;`;;   ,;;-'````'  ;;;;''''      ;;;;'''' ;;,   `';,;;;;;;;;;;;''''.;;;;;;;. ;;;;``;;;; ;;;`    ` 
[[[[[[[, ,[[[[, ,[[ '[[, [[[   [[[[[[/[[cccc        [[cccc  `[[     [[[[[     [[    ,[[     \[[,[[[,/[[[' '[==/[[[[,
$$$$$$$$$$$"$$$c$$$cc$$$c"$$c.    "$$ $$""""        $$""""   $$,    $$$$$     $$    $$$,     $$$$$$$$$c     '''    $
888888 Y88" 888o888   888,`Y8bo,,,o88o888oo,__      888oo,__ 888_,o8P'888     88,   "888,_ _,88P888b "88bo,88b    dP
MMMMMM  M'  "MMMYMM   ""`   `'YMUP"YMM""""YUMMM     """"YUMMMMMMMP"`  MMM     MMM     "YMMMMMP" MMMM   "W"  "YMmMY" 

[1] GIMP - Photo Editing
[2] Krita - Digital Painting
[3] Digikam - Photo Management
[4] Inkscape - Vector Graphics Editor
[0] Go Back
]])

        print("Choose an option (0-4): ")
        local arch_productivity_photoediting_choice = tonumber(io.read())

        if arch_productivity_photoediting_choice == 1 then
                os.execute("sudo pacman -S gimp")
                return Arch_productivity_photoediting()
        end
        if arch_productivity_photoediting_choice == 2 then
                os.execute("sudo pacman -S krita")
                return Arch_productivity_photoediting()
        end
        if arch_productivity_photoediting_choice == 3 then
                os.execute("sudo pacman -S digikam")
                return Arch_productivity_photoediting()
        end
        if arch_productivity_photoediting_choice == 4 then
                os.execute("sudo pacman -S inkscape")
                return Arch_productivity_photoediting()
        end
        if arch_productivity_photoediting_choice == 0 then
                return Arch_productivity()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_productivity_photoediting()
        end
end

function Arch_productivity_videoediting()
        os.execute("clear")

        print([[
:::      .::.::::::::::-.  .,::::::     ...         .,:::::::::::::-.  :::::::::::::::   ...    :::::::..   .::::::. 
';;,   ,;;;' ;;; ;;,   `';,;;;;''''  .;;;;;;;.      ;;;;'''' ;;,   `';,;;;;;;;;;;;''''.;;;;;;;. ;;;;``;;;; ;;;`    ` 
 \[[  .[[/   [[[ `[[     [[ [[cccc  ,[[     \[[,     [[cccc  `[[     [[[[[     [[    ,[[     \[[,[[[,/[[[' '[==/[[[[,
  Y$c.$$"    $$$  $$,    $$ $$""""  $$$,     $$$     $$""""   $$,    $$$$$     $$    $$$,     $$$$$$$$$c     '''    $
   Y88P      888  888_,o8P' 888oo,__"888,_ _,88P     888oo,__ 888_,o8P'888     88,   "888,_ _,88P888b "88bo,88b    dP
    MP       MMM  MMMMP"`   """"YUMMM "YMMMMMP"      """"YUMMMMMMMP"`  MMM     MMM     "YMMMMMP" MMMM   "W"  "YMmMY" 

[1] Kdenlive - Video Editing by KDE
[2] Shotcut - Simple Video Editor
[3] OpenShot - Video Editing
[4] Flowblade - Fast Python multi-track Video Editor
[0] Go Back
]])

        print("Choose an option (0-4): ")
        local arch_productivity_videoediting_choice = tonumber(io.read())

        if arch_productivity_videoediting_choice == 1 then
                os.execute("sudo pacman -S kdenlive")
                return Arch_productivity_videoediting()
        end
        if arch_productivity_videoediting_choice == 2 then
                os.execute("sudo pacman -S shotcut")
                return Arch_productivity_videoediting()
        end
        if arch_productivity_videoediting_choice == 3 then
                os.execute("sudo pacman -S openshot")
                return Arch_productivity_videoediting()
        end
        if arch_productivity_videoediting_choice == 4 then
                os.execute("sudo pacman -S flowblade")
                return Arch_productivity_videoediting()
        end
        if arch_productivity_videoediting_choice == 0 then
                return Arch_productivity()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_productivity_videoediting()
        end
end

function Arch_productivity_3dmodeling()
        os.execute("clear")

        print([[
 .::.  :::::::-.      .        :       ...    :::::::-.  .,::::::   :::     ::::::.    :::.  .,-:::::/  
;'`';;, ;;,   `';,    ;;,.    ;;;   .;;;;;;;.  ;;,   `';,;;;;''''   ;;;     ;;;`;;;;,  `;;;,;;-'````'   
   .n[[ `[[     [[    [[[[, ,[[[[, ,[[     \[[,`[[     [[ [[cccc    [[[     [[[  [[[[[. '[[[[[   [[[[[[/
  ``"$$$.$$,    $$    $$$$$$$$"$$$ $$$,     $$$ $$,    $$ $$""""    $$'     $$$  $$$ "Y$c$$"$$c.    "$$ 
  ,,o888"888_,o8P'    888 Y88" 888o"888,_ _,88P 888_,o8P' 888oo,__ o88oo,.__888  888    Y88 `Y8bo,,,o88o
  YMMP"  MMMMP"`      MMM  M'  "MMM  "YMMMMMP"  MMMMP"`   """"YUMMM""""YUMMMMMM  MMM     YM   `'YMUP"YMM

[1] Blender - 3D Creation Suite
[2] Vinegar - Roblox Studio Launcher via WINE
[0] Go Back
]])

        print("Choose an option (0-2): ")
        local arch_productivity_3dmodeling_choice = tonumber(io.read())

        if arch_productivity_3dmodeling_choice == 1 then
                os.execute("sudo pacman -S blender")
                return Arch_productivity_3dmodeling()
        end
        if arch_productivity_3dmodeling_choice == 2 then
                os.execute("flatpak install org.vinegarhq.Vinegar")
                return Arch_productivity_3dmodeling()
        end
        if arch_productivity_3dmodeling_choice == 0 then
                return Arch_productivity()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_productivity_3dmodeling()
        end
end

function Arch_productivity_textediting()
        os.execute("clear")

        print([[
::::::::::::.,::::::    .,::      .:::::::::::::    .,:::::::::::::-.  :::::::::::::::   ...    :::::::..   
;;;;;;;;'''';;;;''''    `;;;,  .,;; ;;;;;;;;''''    ;;;;'''' ;;,   `';,;;;;;;;;;;;''''.;;;;;;;. ;;;;``;;;;  
     [[      [[cccc       '[[,,[['       [[          [[cccc  `[[     [[[[[     [[    ,[[     \[[,[[[,/[[['  
     $$      $$""""        Y$$$P         $$          $$""""   $$,    $$$$$     $$    $$$,     $$$$$$$$$c    
     88,     888oo,__    oP"``"Yo,       88,         888oo,__ 888_,o8P'888     88,   "888,_ _,88P888b "88bo,
     MMM     """"YUMMM,m"       "Mm,     MMM         """"YUMMMMMMMP"`  MMM     MMM     "YMMMMMP" MMMM   "W" 

[1] Vim
[2] NeoVim
[3] Emacs
[4] VS Code
[5] VS Codium
[6] Code - OSS
[0] Go Back
]])
        print("Choose an option (0-6): ")
        local arch_productivity_txtedit_choice = tonumber(io.read())

        if arch_productivity_txtedit_choice == 1 then
                os.execute("sudo pacman -S vim")
                return Arch_productivity_textediting()
        end
        if arch_productivity_txtedit_choice == 2 then
                os.execute("sudo pacman -S neovim")
                return Arch_productivity_textediting()
        end
        if arch_productivity_txtedit_choice == 3 then
                os.execute("sudo pacman -S emacs")
                return Arch_productivity_textediting()
        end
        if arch_productivity_txtedit_choice == 4 then
                os.execute("yay -S visual-studio-code-bin")
                return Arch_productivity_textediting()
        end
        if arch_productivity_txtedit_choice == 5 then
                os.execute("yay -S vscodium")
                return Arch_productivity_textediting()
        end
        if arch_productivity_txtedit_choice == 6 then
                os.execute("sudo pacman -S code")
                return Arch_productivity_textediting()
        end
        if arch_productivity_txtedit_choice == 0 then
                return Arch_productivity()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_productivity_textediting()
        end
end

function Arch_tools()
        os.execute("clear")

        print([[
::::::::::::   ...         ...      :::     .::::::. 
;;;;;;;;''''.;;;;;;;.   .;;;;;;;.   ;;;    ;;;`    ` 
     [[    ,[[     \[[,,[[     \[[, [[[    '[==/[[[[,
     $$    $$$,     $$$$$$,     $$$ $$'      '''    $
     88,   "888,_ _,88P"888,_ _,88Po88oo,.__88b    dP
     MMM     "YMMMMMP"   "YMMMMMP" """"YUMMM "YMmMY" 

[1] Media Players
[2] Browsers
[3] System Monitor
[4] Pen Testing
[5] Programming Language
[6] Terminal Emulators
[7] YAY - Yet Another Yaourt AUR Helper
[8] PARU - The AUR Helper Written in RUST
[9] Flatpak - Software Made Easy
[0] Go Back
]])

        print("Choose an option (0-8): ")
        local arch_tools_choice = tonumber(io.read())

        if arch_tools_choice == 1 then
		return Arch_tools_mediaplayers()
	end
	if arch_tools_choice == 2 then
		return Arch_tools_browsers()
	end
	if arch_tools_choice == 3 then
		return Arch_tools_sysmoni()
	end
	if arch_tools_choice == 4 then
		return Arch_tools_pentesting()
	end
	if arch_tools_choice == 5 then
		return Arch_tools_languages()
	end
	if arch_tools_choice == 6 then
		return Arch_tools_terminal()
	end
	if arch_tools_choice == 7 then
		os.execute("clear && sudo pacman -S git base-devel")
		os.execute("clear && git clone https://aur.archlinux.org/yay.git")
		os.execute("clear && cd yay && makepkg -si")
		return Arch_tools()
	end
	if arch_tools_choice == 8 then
		os.execute("sudo pacman -S git base-devel")
		os.execute("clear && git clone https://aur.archlinux.org/paru.git")
		os.execute("clear && cd paru && makepkg -si")
		return Arch_tools()
	end
	if arch_tools_choice == 9 then
		os.execute("clear && sudo pacman -S flatpak && flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo")
		return Arch_tools()
	end
	if arch_tools_choice == 0 then
		return Arch_category()
	else
		print("Invalid choice! Please try again.")
		os.execute("sleep 2")
		return Arch_tools()
	end
end

function Arch_tools_mediaplayers()
        os.execute("clear")

        print([[
.        :  .,:::::::::::::-.  :::  :::.         ::::::::::. :::      :::.  .-:.     ::-..,:::::: :::::::..   
;;,.    ;;; ;;;;'''' ;;,   `';,;;;  ;;`;;         `;;;```.;;;;;;      ;;`;;  ';;.   ;;;;';;;;'''' ;;;;``;;;;  
[[[[, ,[[[[, [[cccc  `[[     [[[[[ ,[[ '[[,        `[[nnn[[' [[[     ,[[ '[[,  '[[,[[['   [[cccc   [[[,/[[['  
$$$$$$$$"$$$ $$""""   $$,    $$$$$c$$$cc$$$c        $$$""    $$'    c$$$cc$$$c   c$$"     $$""""   $$$$$$c    
888 Y88" 888o888oo,__ 888_,o8P'888 888   888,       888o    o88oo,.__888   888,,8P"`      888oo,__ 888b "88bo,
MMM  M'  "MMM""""YUMMMMMMMP"`  MMM YMM   ""`        YMMMb   """"YUMMMYMM   ""`mM"         """"YUMMMMMMM   "W" 

[1] VLC - Media Player
[2] MPV - Media Player
[3] SMPlayer - Media Player
[4] Clementine - Music Player
[5] Gwenview - Image Viewer
[0] Go Back
]])

        print("Choose an option (0-5): ")
        local arch_tools_mediaplayers_choice = tonumber(io.read())

        if arch_tools_mediaplayers_choice == 1 then
                os.execute("sudo pacman -S vlc")
                return Arch_tools_mediaplayers()
        end
        if arch_tools_mediaplayers_choice == 2 then
                os.execute("sudo pacman -S mpv")
                return Arch_tools_mediaplayers()
        end
        if arch_tools_mediaplayers_choice == 3 then
                os.execute("sudo pacman -S smplayer")
                return Arch_tools_mediaplayers()
        end
        if arch_tools_mediaplayers_choice == 4 then
                os.execute("sudo pacman -S clementine")
                return Arch_tools_mediaplayers()
        end
        if arch_tools_mediaplayers_choice == 5 then
                os.execute("sudo pacman -S gwenview")
                return Arch_tools_mediaplayers()
        end
        if arch_tools_mediaplayers_choice == 0 then
                return Arch_tools()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_tools_mediaplayers()
        end
end

function Arch_tools_browsers()
        os.execute("clear")

        print([[
:::::::. :::::::..       ...    .::    .   .:::.::::::..,:::::: :::::::..   .::::::. 
 ;;;'';;';;;;``;;;;   .;;;;;;;. ';;,  ;;  ;;;';;;`    `;;;;'''' ;;;;``;;;; ;;;`    ` 
 [[[__[[\.[[[,/[[['  ,[[     \[[,'[[, [[, [[' '[==/[[[[,[[cccc   [[[,/[[[' '[==/[[[[,
 $$""""Y$$$$$$$$c    $$$,     $$$  Y$c$$$c$P    '''    $$$""""   $$$$$$c     '''    $
_88o,,od8P888b "88bo,"888,_ _,88P   "88"888    88b    dP888oo,__ 888b "88bo,88b    dP
""YUMMMP" MMMM   "W"   "YMMMMMP"     "M "M"     "YMmMY" """"YUMMMMMMM   "W"  "YMmMY" 

[1] Firefox - THE Privacy Focused Browser
[2] LibreWolf - A Fork of Firefox focused on enhancing privacy even further than Firefox
[3] Chromium - Open Source Browser made by Google
[4] Mullvad Browser - A Privacy-Focused Browser built on Firefox
[5] Opera - Browser built by Opera Software
[6] Zen Browser - The Browser focused on Privacy and Usability
[7] Chrome - The Most Popular Browser made by Google
[8] Thorium - The Fastest Browser built on Chromium
[9] Brave - A Chromium-built Privacy-Respecting Browser
[10] Microsoft Edge - The New Chromium-based Browser by Microsoft
[11] Vivaldi - A Highly Customizable Chromium-based Browser
[12] Tor Browser - The Privacy-Focused Browser that uses the Tor Network
[0] Go Back
]])

        print("Choose an Option (0-12): ")
        local Arch_tools_browsers_choice = tonumber(io.read())

        if Arch_tools_browsers_choice == 1 then
                os.execute("sudo pacman -S firefox")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 2 then
                os.execute("yay -S librewolf-bin")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 3 then
                os.execute("sudo pacman -S chromium")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 4 then
                os.execute("yay -S mullvad-browser-bin")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 5 then
                os.execute("yay -S opera")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 6 then
                os.execute("yay -S zen-browser-bin")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 7 then
                os.execute("yay -S google-chrome")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 8 then
                os.execute("yay -S thorium-browser-bin")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 9 then
                os.execute("yay -S brave-bin")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 10 then
                os.execute("yay -S microsoft-edge-stable-bin")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 11 then
                os.execute("sudo pacman -S vivaldi")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 12 then
                os.execute("sudo pacman -S torbrowser-launcher")
                return Arch_tools_browsers()
        end
        if Arch_tools_browsers_choice == 0 then
                return Arch_tools()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_tools_browsers()
        end
end

function Arch_tools_sysmoni()
        os.execute("clear")

        print([[
 .::::::..-:.     ::-. .::::::.     .        :       ...   :::.    :::.:::::::::::::::   ...    :::::::..   
;;;`    ` ';;.   ;;;;';;;`    `     ;;,.    ;;;   .;;;;;;;.`;;;;,  `;;;;;;;;;;;;;;''''.;;;;;;;. ;;;;``;;;;  
'[==/[[[[,  '[[,[[['  '[==/[[[[,    [[[[, ,[[[[, ,[[     \[[,[[[[[. '[[[[[     [[    ,[[     \[[,[[[,/[[['  
  '''    $    c$$"      '''    $    $$$$$$$$"$$$ $$$,     $$$$$$ "Y$c$$$$$     $$    $$$,     $$$$$$$$$c    
 88b    dP  ,8P"`      88b    dP    888 Y88" 888o"888,_ _,88P888    Y88888     88,   "888,_ _,88P888b "88bo,
  "YMmMY"  mM"          "YMmMY"     MMM  M'  "MMM  "YMMMMMP" MMM     YMMMM     MMM     "YMMMMMP" MMMM   "W" 

[1] Htop
[2] Btop
[3] Bpytop
[4] bashtop
[5] glances
[6] conky
[7] neofetch - Fetch system information in an eye candy way
[8] fastfetch - A modern alternative to neofetch
[9] GNOME System Monitor
[0] Go Back
]])

        print("Choose an option (0-9): ")
        local arch_tools_sysmoni_choice = tonumber(io.read())

        if arch_tools_sysmoni_choice == 1 then
                os.execute("sudo pacman -S htop")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 2 then
                os.execute("sudo pacman -S btop")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 3 then
                os.execute("sudo pacman -S bpytop")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 4 then
                os.execute("sudo pacman -S bashtop")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 5 then
                os.execute("sudo pacman -S glances")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 6 then
                os.execute("sudo pacman -S conky")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 7 then
                os.execute("yay -S neofetch")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 8 then
                os.execute("sudo pacman -S fastfetch")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 9 then
                os.execute("sudo pacman -S gnome-system-monitor")
                return Arch_tools_sysmoni()
        end
        if arch_tools_sysmoni_choice == 0 then
                return Arch_tools()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_tools_sysmoni()
        end
end

function Arch_tools_pentesting()
        os.execute("clear")

        print([[
::::::::::. .,:::::::::.    :::.    ::::::::::::.,:::::: .::::::.::::::::::::::::::.    :::.  .,-:::::/  
 `;;;```.;;;;;;;''''`;;;;,  `;;;    ;;;;;;;;'''';;;;'''';;;`    `;;;;;;;;'''';;;`;;;;,  `;;;,;;-'````'   
  `[[nnn[['  [[cccc   [[[[[. '[[         [[      [[cccc '[==/[[[[,    [[     [[[  [[[[[. '[[[[[   [[[[[[/
   $$$""     $$""""   $$$ "Y$c$$         $$      $$""""   '''    $    $$     $$$  $$$ "Y$c$$"$$c.    "$$ 
   888o      888oo,__ 888    Y88         88,     888oo,__88b    dP    88,    888  888    Y88 `Y8bo,,,o88o
   YMMMb     """"YUMMMMMM     YM         MMM     """"YUMMM"YMmMY"     MMM    MMM  MMM     YM   `'YMUP"YMM

[1] Nmap
[2] Metasploit
[3] Wireshark-CLI (Command-Line-Interface)
[4] Aircrack-ng
[5] John the Ripper
[6] netcat
[7] Hashcat
[8] Add BlackArch repository (Not Recommended!)
[0] Go Back
]])
	
	print("Choose an option (0-8): ")
        local arch_tools_pentesting_choice = tonumber(io.read())

	if arch_tools_pentesting_choice == 1 then
		os.execute("sudo pacman -S nmap")
		return Arch_tools_pentesting()
	end
	if arch_tools_pentesting_choice == 2 then
		os.execute("yay -S metasploit")
		return Arch_tools_pentesting()
	end
	if arch_tools_pentesting_choice == 3 then
		os.execute("sudo pacman -S wireshark-cli")
		return Arch_tools_pentesting()
	end
	if arch_tools_pentesting_choice == 4 then
		os.execute("sudo pacman -S aircrack-ng")
		return Arch_tools_pentesting()
	end
	if arch_tools_pentesting_choice == 5 then
		os.execute("sudo pacman -S john")
		return Arch_tools_pentesting()
	end
	if arch_tools_pentesting_choice == 6 then
		os.execute("sudo pacman -S openbsd-netcat")
		return Arch_tools_pentesting()
	end
	if arch_tools_pentesting_choice == 7 then
		os.execute("sudo pacman -S hashcat")
		return Arch_tools_pentesting()
	end
	if arch_tools_pentesting_choice == 8 then
		os.execute("sudo pacman -S curl && curl -O https://blackarch.org/strap.sh && sudo ./strap.sh && sudo pacman -Syyu")
		return Arch_tools_pentesting()
	end
	if arch_tools_pentesting_choice == 0 then
		return Arch_tools()
	else
		print("Invalid choice! Please try again.")
		os.execute("sleep 2")
		return Arch_tools_pentesting()
	end
end

function Arch_tools_languages()
        os.execute("clear")

        print([[
 :::      :::.   :::.    :::.  .,-:::::/   ...    :::  :::.      .,-:::::/ .,:::::: .::::::. 
 ;;;      ;;`;;  `;;;;,  `;;;,;;-'````'    ;;     ;;;  ;;`;;   ,;;-'````'  ;;;;'''';;;`    ` 
 [[[     ,[[ '[[,  [[[[[. '[[[[[   [[[[[[/[['     [[[ ,[[ '[[, [[[   [[[[[[/[[cccc '[==/[[[[,
 $$'    c$$$cc$$$c $$$ "Y$c$$"$$c.    "$$ $$      $$$c$$$cc$$$c"$$c.    "$$ $$""""   '''    $
o88oo,.__888   888,888    Y88 `Y8bo,,,o88o88    .d888 888   888,`Y8bo,,,o88o888oo,__88b    dP
""""YUMMMYMM   ""` MMM     YM   `'YMUP"YMM "YmmMMMM"" YMM   ""`   `'YMUP"YMM""""YUMMM"YMmMY" 

[1] Z Shell - Modern and Powerful Shell
[2] PowerShell - Modern Shell developed by Microsoft
[3] Fish Shell - Fast, Customizable Shell
[4] Python - FOSS Programming Language developed by PSF
[5] python-pip - Python Package Manager
[6] Java (OpenJDK) - FOSS Programming Language developed by Oracle
[7] GO - FOSS Programming Language supported by Google
[8] RUST - Modern, Fast, Memory-safe Programming Language
[9] Node.js - Popular & FOSS JavaScript runtime environment
[0] Go Back
]])
	print("Choose an option (0-9): ")
        local arch_tools_languages_choice = tonumber(io.read())

        if arch_tools_languages_choice == 1 then
		os.execute("sudo pacman -S zsh")
		return Arch_tools_languages()
	end
	if arch_tools_languages_choice == 2 then
		os.execute("yay -S powershell-bin")
		return Arch_tools_languages()
	end
	if arch_tools_languages_choice == 3 then
		os.execute("sudo pacman -S fish")
		return Arch_tools_languages()
	end
	if arch_tools_languages_choice == 4 then
		os.execute("sudo pacman -S python")
		return Arch_tools_languages()
	end
	if arch_tools_languages_choice == 5 then
		os.execute("sudo pacman -S python-pip")
		return Arch_tools_languages()
	end
        if arch_tools_languages_choice == 6 then
		os.execute("sudo pacman -S jdk-openjdk")
		return Arch_tools_languages()
	end
	if arch_tools_languages_choice == 7 then
		os.execute("sudo pacman -S go")
		return Arch_tools_languages()
	end
	if arch_tools_languages_choice == 8 then
		os.execute("sudo pacman -S rust")
		return Arch_tools_languages()
	end
	if arch_tools_languages_choice == 9 then
		os.execute("sudo pacman -S nodejs npm")
		return Arch_tools_languages()
	end
	if arch_tools_languages_choice == 0 then
		return Arch_tools()
	else
		print("Invalid choice! Please try again.")
		os.execute("sleep 2")
		return Arch_tools_languages()
	end
end

function Arch_tools_terminal()
	os.execute("clear")

	print([[
::::::::::::.,:::::: :::::::..   .        :   ::::::.    :::.  :::.      :::     
;;;;;;;;'''';;;;'''' ;;;;``;;;;  ;;,.    ;;;  ;;;`;;;;,  `;;;  ;;`;;     ;;;     
     [[      [[cccc   [[[,/[[['  [[[[, ,[[[[, [[[  [[[[[. '[[ ,[[ '[[,   [[[     
     $$      $$""""   $$$$$$c    $$$$$$$$"$$$ $$$  $$$ "Y$c$$c$$$cc$$$c  $$'     
     88,     888oo,__ 888b "88bo,888 Y88" 888o888  888    Y88 888   888,o88oo,.__
     MMM     """"YUMMMMMMM   "W" MMM  M'  "MMMMMM  MMM     YM YMM   ""` """"YUMMM

[1] Kitty
[2] Alacritty
[3] Konsole
[4] Xfce4-Terminal
]])

	print("Choose an option (0-4): ")
	local arch_terminals_choice = tonumber(io.read())

        if arch_terminals_choice == 1 then
                os.execute("sudo pacman -S kitty")
                return Arch_tools_terminal()
        end
        if arch_terminals_choice == 2 then
                os.execute("sudo pacman -S alacritty")
                return Arch_tools_terminal()
        end
        if arch_terminals_choice == 3 then
                os.execute("sudo pacman -S konsole")
                return Arch_tools_terminal()
        end
        if arch_terminals_choice == 4 then
                os.execute("sudo pacman -S xfce4-terminal")
                return Arch_tools_terminal()
        end
        if arch_tools_choice == 0 then
                return Arch_tools()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_tools_terminal()
        end
end

function Arch_tweaks()
        os.execute("clear")

        print([[
::::::::::::.::    .   .:::.,::::::   :::.      :::  .    .::::::. 
;;;;;;;;''''';;,  ;;  ;;;' ;;;;''''   ;;`;;     ;;; .;;,.;;;`    ` 
     [[      '[[, [[, [['   [[cccc   ,[[ '[[,   [[[[[/'  '[==/[[[[,
     $$        Y$c$$$c$P    $$""""  c$$$cc$$$c _$$$$,      '''    $
     88,        "88"888     888oo,__ 888   888,"888"88o,  88b    dP
     MMM         "M "M"     """"YUMMMYMM   ""`  MMM "MMP"  "YMmMY" 

[1] Firewalls
[2] Drivers
[3] Kernel Manager
[0] Go Back
]])
	print("Choose an option (0-3): ")
        local arch_tweaks_choice = tonumber(io.read())
        
        if arch_tweaks_choice == 1 then
                Arch_tweaks_firewalls()
	end
        if arch_tweaks_choice == 2 then
                Arch_tweaks_drivers()
	end
        if arch_tweaks_choice == 3 then
                Arch_tweaks_kernelmanager()
	end
        if arch_tweaks_choice == 0 then
		return Arch_category()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_tweaks()
	end
end

function Arch_tweaks_firewalls()
        os.execute("clear")

        print([[
.-:::::'::::::::::..  .,::::::.::    .   .::::::.      :::      :::     .::::::. 
;;;'''' ;;;;;;;``;;;; ;;;;''''';;,  ;;  ;;;' ;;`;;     ;;;      ;;;    ;;;`    ` 
[[[,,== [[[ [[[,/[[['  [[cccc  '[[, [[, [[' ,[[ '[[,   [[[      [[[    '[==/[[[[,
`$$$"`` $$$ $$$$$$c    $$""""    Y$c$$$c$P c$$$cc$$$c  $$'      $$'      '''    $
 888    888 888b "88bo,888oo,__   "88"888   888   888,o88oo,.__o88oo,.__88b    dP
 "MM,   MMM MMMM   "W" """"YUMMM   "M "M"   YMM   ""` """"YUMMM""""YUMMM "YMmMY" 

[1] UFW
[2] NFTables
[3] firewalld
[4] REMOVE SUPPORTED FIREWALLS
[0] Go Back

WARNING! Before Installing, you should definitely disable and remove the other firewalls with 4. as multiple firewalls won't work with each other
]])

	print("Choose an option (0-4): ")
        local arch_tweaks_fw_choice = tonumber(io.read())

        if arch_tweaks_fw_choice == 1 then
		os.execute("sudo pacman -S ufw")
                os.execute("sudo systemctl enable --now ufw")
                print("UFW setup has finished.")
                os.execute("sleep 2")
                return Arch_tweaks_firewalls()
	end
	if arch_tweaks_fw_choice == 2 then
                os.execute("sudo pacman -S nftables")
                os.execute("sudo systemctl enable --now nftables")
                print("nftables setup has finished.")
                os.execute("sleep 2")
                return Arch_tweaks_firewalls()
	end
	if arch_tweaks_fw_choice == 3 then
                os.execute("sudo pacman -S firewalld")
                os.execute("sudo systemctl enable --now firewalld")
                print("firewalld setup has finished.")
                os.execute("sleep 2")
                return Arch_tweaks_firewalls()
	end
        if arch_tweaks_fw_choice == 4 then
                return Arch_removefirewalls()
	end
        if arch_tweaks_fw_choice == 0 then
                return Arch_tweaks()
	else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_tweaks_firewalls()
	end
end

function Arch_removefirewalls()
        os.execute("clear")

        print([[
.-:::::'::::::::::..  .,::::::.::    .   .::::::.      :::      :::     .::::::. 
;;;'''' ;;;;;;;``;;;; ;;;;''''';;,  ;;  ;;;' ;;`;;     ;;;      ;;;    ;;;`    ` 
[[[,,== [[[ [[[,/[[['  [[cccc  '[[, [[, [[' ,[[ '[[,   [[[      [[[    '[==/[[[[,
`$$$"`` $$$ $$$$$$c    $$""""    Y$c$$$c$P c$$$cc$$$c  $$'      $$'      '''    $
 888    888 888b "88bo,888oo,__   "88"888   888   888,o88oo,.__o88oo,.__88b    dP
 "MM,   MMM MMMM   "W" """"YUMMM   "M "M"   YMM   ""` """"YUMMM""""YUMMM "YMmMY" 

[1] UFW
[2] NFTables
[3] FirewallD
[0] Go Back
]])
	print("Choose an option (0-3): ")
        local removefirewalls_choice = tonumber(io.read())

	if removefirewalls_choice == 1 then
		os.execute("sudo systemctl disable ufw && sudo pacman -Rns --noconfirm ufw")
		return Arch_removefirewalls()
	end
	if removefirewalls_choice == 2 then
		os.execute("sudo systemctl disable nftables && sudo pacman -Rns --noconfirm nftables")
		return Arch_removefirewalls()
	end
	if removefirewalls_choice == 3 then
		os.execute("sudo systemctl disable firewalld && sudo pacman -Rns --noconfirm firewalld")
		return Arch_removefirewalls()
	end
	if removefirewalls_choice == 0 then
		return Arch_tweaks_firewalls()
	else
		print("Invalid choice! Please try again.")
		os.execute("sleep 2")
		return Arch_removefirewalls()
	end
end

function Arch_tweaks_drivers()
        os.execute("clear")

        print([[
:::::::-.  :::::::..   ::::::      .::..,:::::: :::::::..   .::::::. 
 ;;,   `';,;;;;``;;;;  ;;;';;,   ,;;;' ;;;;'''' ;;;;``;;;; ;;;`    ` 
 `[[     [[ [[[,/[[['  [[[ \[[  .[[/    [[cccc   [[[,/[[[' '[==/[[[[,
  $$,    $$ $$$$$$c    $$$  Y$c.$$"     $$""""   $$$$$$c     '''    $
  888_,o8P' 888b "88bo,888   Y88P       888oo,__ 888b "88bo,88b    dP
  MMMMP"`   MMMM   "W" MMM    MP        """"YUMMMMMMM   "W"  "YMmMY" 

WARNING! MAKE SURE THE DRIVER SUITS YOUR HARDWARE CONFIGURATION(GPU) AND KERNEL VERSION! YOU ALSO NEED TO REBUILD INITRAMFS AFTER SWITCHING DRIVER VERSIONS OR REMOVING DRIVERS! IF YOU'RE UNSURE ABOUT WHAT TO INSTALL, PLEASE RESEARCH IT FIRST!

[1] Rebuild Initramfs - REQUIRED AFTER SWITCHING DRIVER VERSIONS!!
[2] Delete (NVIDIA) Drivers
[3] Install CUDA
[4] Install OpenCL (NVIDIA)

-- NVIDIA PROPRIETARY DRIVERS FOR PASCAL AND OLDER --

[5] nvidia - linux kernel
[6] nvidia-lts - linux-lts kernel
[7] nvidia-dkms - for the gaming focused linux-zen kernel or the secure linux-hardened kernel

-- NVIDIA OPEN KERNEL MODULE DRIVERS FOR TURING AND NEWER GPUS --

[8] nvidia-open - linux kernel
[9] nvidia-open-lts - linux-lts kernel
[10] nvidia-open-dkms - for the gaming focused linux-zen kernel or the secure linux-hardened kernel
[0] Go Back
]])

	print("Choose an option (0-10): ")
        local arch_tweaks_driver_choice = tonumber(io.read())

        if arch_tweaks_driver_choice == 1 then
                os.execute("sudo mkinitcpio -P")
                return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 2 then
                return Arch_removedrivers()
	end
	if arch_tweaks_driver_choice == 3 then
                os.execute("sudo pacman -S cuda nvidia-utils nvidia-settings")
                return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 4 then
                os.execute("sudo pacman -S opencl-nvidia opencl-headers")
        	return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 5 then
                os.execute("sudo pacman -S nvidia")
                print("nvidia setup has finished. Please make sure the driver matches your hardware configuration and kernel version. You Should Also Rebuild the initramfs!")
                os.execute("sleep 10")
                return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 6 then
                os.execute("sudo pacman -S nvidia-lts")
                print("nvidia-lts setup has finished. Please make sure the driver matches your hardware configuration and kernel version. You Should Also Rebuild the initramfs!")
                os.execute("sleep 10")
                return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 7 then
                os.execute("sudo pacman -S nvidia-dkms")
                print("nvidia-dkms setup has finished. Please make sure the driver matches your hardware configuration and kernel version. You Should Also Rebuild the initramfs!")
                os.execute("sleep 10")
                return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 8 then
                os.execute("sudo pacman -S nvidia-open")
                print("nvidia-open setup has finished. Please make sure the driver matches your hardware configuration and kernel version. You Should Also Rebuild the initramfs!")
                os.execute("sleep 10")
                return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 9 then
                os.execute("sudo pacman -S nvidia-open-lts")
                print("nvidia-open-lts setup has finished. Please make sure the driver matches your hardware configuration and kernel version. You Should Also Rebuild the initramfs!")
                os.execute("sleep 10")
                return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 10 then
                os.execute("sudo pacman -S nvidia-open-dkms")
                print("nvidia-open-dkms setup has finished. Please make sure the driver matches your hardware configuration and kernel version. You Should Also Rebuild the initramfs!")
                os.execute("sleep 10")
                return Arch_tweaks_drivers()
	end
        if arch_tweaks_driver_choice == 0 then
                return Arch_tweaks()
	else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_tweaks_drivers()
	end
end

function Arch_removedrivers()
        os.execute("clear")

        print([[
:::::::-.  :::::::..   ::::::      .::..,:::::: :::::::..   .::::::. 
 ;;,   `';,;;;;``;;;;  ;;;';;,   ,;;;' ;;;;'''' ;;;;``;;;; ;;;`    ` 
 `[[     [[ [[[,/[[['  [[[ \[[  .[[/    [[cccc   [[[,/[[[' '[==/[[[[,
  $$,    $$ $$$$$$c    $$$  Y$c.$$"     $$""""   $$$$$$c     '''    $
  888_,o8P' 888b "88bo,888   Y88P       888oo,__ 888b "88bo,88b    dP
  MMMMP"`   MMMM   "W" MMM    MP        """"YUMMMMMMM   "W"  "YMmMY" 

WARNING: If you're planning to run the system without gpu drivers, make sure to rebuld initramfs after deleting the gpu driver. Also rebuild initramfs after you install a different driver.
-- NVIDIA PROPRIETARY DRIVERS FOR PASCAL AND OLDER --
        
[1] nvidia - standard driver
[2] nvidia-lts - longterm support
[3] nvidia-dkms - driver for the gaming focused linux-zen kernel or the secure linux-hardened kernel

-- NVIDIA OPEN KERNEL MODULE DRIVERS FOR TURING AND NEWER GPUS --

[4] nvidia-open - standard driver
[5] nvidia-open-lts - longterm support
[6] nvidia-open-dkms - driver for the gaming focused linux-zen kernel or the secure linux-hardened kernel
[0] Go Back
]])

        print("Choose an option (0-6): ")
        local arch_remdrivers_choice = tonumber(io.read())

        if arch_remdrivers_choice == 1 then
                os.execute("sudo pacman -Rns nvidia")
                return Arch_removedrivers()
        end
        if arch_remdrivers_choice == 2 then
                os.execute("sudo pacman -Rns nvidia-lts")
                return Arch_removedrivers()
        end
        if arch_remdrivers_choice == 3 then
                os.execute("sudo pacman -Rns nvidia-dkms")
                return Arch_removedrivers()
        end
        if arch_remdrivers_choice == 4 then
                os.execute("sudo pacman -Rns nvidia-open")
                return Arch_removedrivers()
        end
        if arch_remdrivers_choice == 5 then
                os.execute("sudo pacman -Rns nvidia-open-lts")
                return Arch_removedrivers()
        end
        if arch_remdrivers_choice == 6 then
                os.execute("sudo pacman -Rns nvidia-open-dkms")
                return Arch_removedrivers()
        end
        if arch_remdrivers_choice == 0 then
                return Arch_tweaks()
        else
                print("Invalid choice! Please try again.")
                os.execute("sleep 2")
                return Arch_removedrivers()
        end
end

function Arch_tweaks_kernelmanager()
        os.execute("clear")

        print([[
 :::  .   .,:::::: :::::::.. :::.    :::..,::::::   :::     .::::::. 
 ;;; .;;,.;;;;'''' ;;;;``;;;;`;;;;,  `;;;;;;;''''   ;;;    ;;;`    ` 
 [[[[[/'   [[cccc   [[[,/[[['  [[[[[. '[[ [[cccc    [[[    '[==/[[[[,
_$$$$,     $$""""   $$$$$$c    $$$ "Y$c$$ $$""""    $$'      '''    $
"888"88o,  888oo,__ 888b "88bo,888    Y88 888oo,__ o88oo,.__88b    dP
 MMM "MMP" """"YUMMMMMMM   "W" MMM     YM """"YUMMM""""YUMMM "YMmMY" 

[1] linux
[2] linux-lts
[3] linux-zen
[4] linux-hardened
[0] Go Back
]])

        print("Choose an option (0-4): ")
        local arch_tweaks_km_choice = tonumber(io.read())

        if arch_tweaks_km_choice == 1 then
                os.execute("sudo pacman -S linux linux-headers")
                print("Later you will also require to go into Tweaks -> Drivers and Install Drivers compatible with the Kernel and GPU")
                os.execute("sleep 7")
                return Arch_tweaks_kernelmanager()
        end
        if arch_tweaks_km_choice == 2 then
                os.execute("sudo pacman -S linux-lts linux-lts-headers")
                print("Later you will also require to go into Tweaks -> Drivers and Install Drivers compatible with the Kernel and GPU")
                os.execute("sleep 7")
                return Arch_tweaks_kernelmanager()
	end
	if arch_tweaks_km_choice == 3 then
		os.execute("sudo pacman -S linux-zen linux-zen-headers")
		print("Later you will also require to go into Tweaks -> Drivers and Install Drivers compatible with the Kernel and GPU")
		os.execute("sleep 7")
		return Arch_tweaks_kernelmanager()
        end
	if arch_tweaks_km_choice == 4 then
		os.execute("sudo pacman -S linux-hardened linux-hardened-headers")
		print("Later you will also require to go into Tweaks -> Drivers and Install Drivers compatible with the Kernel and GPU")
		os.execute("sleep 7")
		return Arch_tweaks_kernelmanager()
	end
	if arch_tweaks_km_choice == 0 then
		return Arch_tweaks()
	else
		print("Invalid choice! Please try again.")
		os.execute("sleep 2")
		return Arch_tweaks_kernelmanager()
	end
end

function Main()
        os.execute("clear")

        print([[                                                                                                                                                 
     OOOOOOOOO                        kkkkkkkk                                            
   OO:::::::::OO                      k::::::k                                            
 OO:::::::::::::OO                    k::::::k                                            
O:::::::OOO:::::::O                   k::::::k                                            
O::::::O   O::::::Orrrrr   rrrrrrrrr   k:::::k    kkkkkkkaaaaaaaaaaaaa  nnnn  nnnnnnnn    
O:::::O     O:::::Or::::rrr:::::::::r  k:::::k   k:::::k a::::::::::::a n:::nn::::::::nn  
O:::::O     O:::::Or:::::::::::::::::r k:::::k  k:::::k  aaaaaaaaa:::::an::::::::::::::nn 
O:::::O     O:::::Orr::::::rrrrr::::::rk:::::k k:::::k            a::::ann:::::::::::::::n
O:::::O     O:::::O r:::::r     r:::::rk::::::k:::::k      aaaaaaa:::::a  n:::::nnnn:::::n
O:::::O     O:::::O r:::::r     rrrrrrrk:::::::::::k     aa::::::::::::a  n::::n    n::::n
O:::::O     O:::::O r:::::r            k:::::::::::k    a::::aaaa::::::a  n::::n    n::::n
O::::::O   O::::::O r:::::r            k::::::k:::::k  a::::a    a:::::a  n::::n    n::::n
O:::::::OOO:::::::O r:::::r           k::::::k k:::::k a::::a    a:::::a  n::::n    n::::n
 OO:::::::::::::OO  r:::::r           k::::::k  k:::::ka:::::aaaa::::::a  n::::n    n::::n
   OO:::::::::OO    r:::::r           k::::::k   k:::::ka::::::::::aa:::a n::::n    n::::n
     OOOOOOOOO      rrrrrrr           kkkkkkkk    kkkkkkkaaaaaaaaaa  aaaa nnnnnn    nnnnnn                                                                                

Updating package list...
]])

        os.execute("sudo pacman -Syu")
        print("Packages Updated!")
        os.execute("sleep 2")
        Arch_category()
end

Main()
