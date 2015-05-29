
{
  webserver =
  { config, pkgs, lib, ... }:
  {
    deployment.targetEnv = "none";
    deployment.targetHost = "45.33.1.65";

    # From <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    lib.hardware.enableAllFirmware = true;

    #Based on number of cores
    nix.maxJobs = 1;

    boot.initrd.availableKernelModules = [ "xen_blkfront" ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
    { device = "/dev/mapper/vg-root";
        fsType = "ext4";
    };

    fileSystems."/boot" =
    { device = "/dev/xvda";
        fsType = "ext4";
    };

    swapDevices = [ { device = "/dev/dm-1"; } ];

    boot.loader.grub = {
      enable = true;
      version = 1;
      extraPerEntryConfig = "root (hd0)";
      device = "nodev";
    };

    boot.initrd.luks.devices = [
      { name = "root"; device = "/dev/xvdb"; preLVM = true; }
    ];
  };
}

