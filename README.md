# mcfdutils
MATLAB CFD post-processing utilities  
Adrien Crovato, 2020

Python utilities available [here](https://github.com/acrovato/pycfdutils).

## Features
mcfdutils can be used to:
- generate a Tecplot macro that creates slices along the span of a given wing
- read sectional pressure data from ASCII (space or comma separated values) files
- compute the sectional aerodynamic loads
- plot the data and the loads

## Usage
Create a MATLAB function calling the different utilities that you need in your working directory. Examples are given under the directory [examples](examples/). Run the computation by calling `cfdutils('path/to/your_function')`.  Note that `cfdutils.m` must be in your MATLAB path. Possible output files will be saved in your current working directory under a `workspace` directory.

**Known bugs**  
- The sign of the aerodynamic loads can be inverted depending on the points ordering

**Slices creation**  
The slices can be created using Tecplot or Paraview. The slices extraction in Tecplot can be automated through a macro that can be generated using `cfdtecslicer.m` (see [this example](examples/slice_onera.m)). The extraction using Paraview has not been automated in MATLAB, but python utilities can be found [here](https://github.com/acrovato/pycfdutils). Alternatively, the slices can extracted by hand using the following procedure:
1) Load the file containing the flow solution on wing surface in Paraview
2) Create a slice
3) Apply consecutively the filters `TriangleStrips`, `CleanToGrid`, `ExtractSurface` and `PlotData`
4) Open the spreadsheet used to plot the data (e.g. by splitting the view then clicking `SpreadSheetView`)
5) Select the variables you want to extract using the `Column visibility` button, and save them using the `Export spreadsheet` button
