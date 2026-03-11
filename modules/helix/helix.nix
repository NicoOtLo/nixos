{ config, pkgs, lib, ... }:

{
  programs.helix = {

    enable = true;

    settings = {

      theme = "autumn_night-transparent";

      editor = {

        line-number = "relative";
        cursorline = true;
        auto-pairs = true;

      };

    };

    languages = {

      language = [

        {
          name = "nix";
          auto-format = true;
          formatter.command = "nixpkgs-fmt";
        }

        {
          name = "ocaml";
          auto-format = true;
        }

        {
          name = "c";
          auto-format = true;
        }

      ];
    };
  };

  xdg.configFile."helix/themes".source = ./themes;
}
