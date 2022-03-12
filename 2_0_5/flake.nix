{
  description = ''tnim is a Nim REPL - an interactive sandbox for testing Nim code'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-tnim-2_0_5.flake = false;
  inputs.src-tnim-2_0_5.owner = "jlp765";
  inputs.src-tnim-2_0_5.ref   = "refs/tags/2.0.5";
  inputs.src-tnim-2_0_5.repo  = "tnim";
  inputs.src-tnim-2_0_5.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-tnim-2_0_5"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-tnim-2_0_5";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}