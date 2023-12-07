{ options, config, lib, ... }:

with lib;
with lib.horizon;
let cfg = config.horizon.system.xkb;
in
{
  options.horizon.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver = {
      layout = "us";
      xkbOptions = "caps:escape";
    };
  };
}
