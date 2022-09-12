# Resonances_SCI_1d

This package computes the scattering resonances of a 1d Schrödinger operator given its (compactly supported) potential as an input. The code is based on a method developed in https://ems.press/journals/jems/articles/7274199.

The method uses an analytic continuation of the resolvent  operator based on the 1d fundamental solution for the Laplacian. The input parameters are the domain `ab` and number of discretization points `N` for the potential, and a cutoff threshold `thr` for the resolvent norm that defines the approximate resonance locations. Moreover, a finite lattice `L` in the complex plane has to be specified as a search region.

Any comments or queries are welcome at https://frank-roesler.github.io/contact/
