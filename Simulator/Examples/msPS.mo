within Simulator.Examples;

model msPS
  //we have to first instance components to give to material stream model.
  import data = Simulator.Files.ChemsepDatabase;
  //instantiation of chemsep database
  parameter data.Methanol meth;
  //instantiation of methanol
  parameter data.Ethanol eth;
  //instantiation of ethanol
  parameter data.Water wat;
  //instantiation of water
  extends Streams.MaterialStream(Nc = 3, C = {meth, eth, wat}, F_p(each start = 100), x_pc(each start = 0.33), T(start = sum(C.Tb) / Nc));
  //material stream model is extended and values of parameters NOC and comp are given. These parameters are declred in Material stream model. We are only giving them values here.
  //we need to give proper initialization values for converging, Initialization values are provided for totMolFlo, compMolFrac and T while extending.
  //NOC - number of components, comp -  component array.
  extends Simulator.Files.ThermodynamicPackages.RaoultsLaw;
  //Thermodynamic package is extended. We can use other thermodynamics also(not yet added) after little modification and inclusion of residual properties equations.
equation
//These are the values to be specified by user. In this P, mixture molar enthalpy, mixture mole fraction and mixture molar flow is specified. These variables are declared in Material stream model, only values are given here.
  P = 101325;
  S_p[1] = -84.39;
  x_pc[1, :] = {0.33, 0.33, 0.34};
//1 stands for mixture
  F_p[1] = 31.346262;
//1 stands for mixture
end msPS;