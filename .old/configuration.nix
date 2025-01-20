# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "1701d"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;

  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "alt-intl";
  };

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
   };

  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = false;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vini = {
    isNormalUser = true;
    description = "Vini";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    	neovim 
	uxplay
	patchance	
	ardour
	qjackctl
	discord
	carla
	hydrogen
	yoshimi
	guitarix
	#bitscope
	meterbridge
	timemachine
	audacious
	audacious-plugins
	sbclPackages.beast
	fluidsynth
	bristol
	#freebirth
	qsynth
	zynaddsubfx
	csound
	#swami
	sooperlooper
	#aconnectgui
	rosegarden
	seq24
	#jackbeat
	muse
	#tk707
	#shaketracker
	jack_rack
	#tapiir
	freqtweak
	jamin
	#creox
	#jackeq
	#terminatorx
	mixxx
	timidity
	#gtick
	puredata
	#fluid-soundfont-gm
	aeolus
	#blop
	caps
	cmt
	#fil-plugins
	#hexter
	ladspa-sdk
	#mcp-plugins
	#swh-plugins
	#vcf
	#dssi-example-plugins
	dssi
	#dssi-host-jack
	#fluidsynth-dssi
	#xynth-dssi
	#dssi-utils
	obs-studio

    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "vini";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #pipewire control
    #pipewire-pulse
    coppwr
    helvum
    qpwgraph
    myxer
    pavucontrol

    R
    rstudio
    zoom-us

    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    oh-my-zsh
    zsh-history-substring-search
    zsh-history
    gcc
    glib
    glibc
    glibmm
    pkg-config
    cargo
    rustc
    gnome.nautilus
    rustup
    gobject-introspection
    gio-sharp
    pango
    atkmm
    #eww
    #eww-wayland
    #hyper apps
    xdg-desktop-portal
    font-awesome
    wireplumber
    slurp
    libsForQt5.polkit-kde-agent
    waybar
    sway
    gtk3
    kitty
    wofi 
    dunst
    gtkmm3
    jsoncpp
    libsigcxx
    fmt
#wayland
#chrono-date
spdlog
#libgtk-3-dev #[gtk-layer-shell]
gobject-introspection # [gtk-layer-shell]
#libgirepository1.0-dev# [gtk-layer-shell]
#libpulse #[Pulseaudio module]
#libnl #[Network module]
#libappindicator-gtk3 #[Tray module]
#libdbusmenu-gtk3 #[Tray module]
#libmpdclient #[MPD module]
#libsndio #[sndio module]
#libevdev# [KeyboardState module]
#xkbregistry
upower #[UPower battery module]

  ];

  nix.settings.experimental-features=["nix-command" "flakes"];

  users.users.vini.shell=pkgs.zsh;
  programs.zsh = {
     enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
         enable = true;
         theme = "robbyrussell";
         plugins = [
           "git"
           "npm"
           "history"
           "node"
           "rust"
           "deno"
         ];
      };    
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
   programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
   };


   
}
