{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pv";
  home.homeDirectory = "/home/pv";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the "hello" command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello
    pkgs.eza
    pkgs.zoxide
    pkgs.fzf
    pkgs.git
    pkgs.openssh
    pkgs.zip
    # pkgs.nodejs_22
    pkgs.ripgrep
    pkgs.awscli2
    pkgs.erdtree
    pkgs.nodejs_22
    pkgs.nodePackages.vscode-langservers-extracted
    pkgs.nodePackages.typescript-language-server
    pkgs.pywal
    pkgs.nixfmt-rfc-style

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pv/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "helix";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
      };
      editor.soft-wrap.enable = true;
      editor.bufferline = "multiple";
      keys.normal = {
        space.c = ":buffer-close";
        space.C = ":buffer-close!";
        space.l = ":toggle soft-wrap.enable";
        space.f = "file_picker_in_current_directory";
        space.F = "file_picker";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      }
      {
        name = "html";
        auto-format = true;
      }
    ];
  };
}
