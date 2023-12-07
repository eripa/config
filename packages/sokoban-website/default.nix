{ lib, runCommandNoCC, inputs, ... }:

let
  inherit (lib.horizon) override-meta;

  new-meta = with lib; {
    description = "The website for [sokoban.app](https://sokoban.app).";
    homepage = "https://sokoban.app";
    license = licenses.asl20;
    maintainers = with maintainers; [ jakehamilton ];
  };
  package = runCommandNoCC "sokoban-website"
    { src = inputs.sokoban-app-website.outPath; }
    ''
      ln -s $src $out 
    '';
in
override-meta new-meta package
