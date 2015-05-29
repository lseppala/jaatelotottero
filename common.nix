{ config, pkgs, ... }:


let
  lanePub = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDU+pFUR36s0W3kiTbCIh25bAgsIM4zBxTY3H1Rxo9T5xZ7MkfErlSjiDnsqdqff5dYEjVtj6/Lifprx8I3sZwkB7Hcrw1DrkhNZ/8c5aH5Ng4iK1+p83JxGKSquh+n2wsPyW418BFe4gmqBLk1Eg2c5g5gcyhgsbsxW+dlCsxfWWcGbGh5Xh4SLe+vy0kVlGkhyWS9vUcL5diuXjod2A2NknfnlO51hHYba3rOJm/JLUcLwREfFmQhReaU9SIglJ5cBUCxMzhUmNOvbN01Otd1Gg448bUkbh5xFaCGEsH29iqF+8zPHd1YS4KvwxZ3oI/Ui482djoso0oLgDzbzQ5Z lsep@hopea";
in {

  services.openssh.enable = true;
  networking.firewall.allowPing = true;

  security.sudo.wheelNeedsPassword = false;

  i18n = {
     defaultLocale = "en_US.UTF-8";
  };

  users.extraUsers.root.openssh.authorizedKeys.keys = [ lanePub ];
  users.extraUsers.lsep = {
    createHome      = true;
    home            = "/home/lsep";
    description     = "Lane Seppala";
    extraGroups     = [ "wheel" ];
    useDefaultShell = true;
    openssh.authorizedKeys.keys = [ lanePub ];
  };
}
