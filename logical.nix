{
  network.description = "Personal webserver";

  webserver = 
  { pkgs, ... }:
  {
    imports = [ ./common.nix ];
    environment.systemPackages = with pkgs; [
        tmux weechat mosh
    ];
    networking.firewall.allowedUDPPortRanges = [ { from = 60000; to = 60010; } ];
  };
} 
