% Copyright 2020 Adrien Crovato
% 
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%     http://www.apache.org/licenses/LICENSE-2.0
% 
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

function plot_onera(fpath_)
%% onera M6 wing
% Read pressure data generated from Paraview, compute the loads and display
% results
% Adrien Crovato

% Inputs
fpath = 'onera/'; % path to data files (relative to this directory)
format = 'csv'; % format of file containing data
ids = [1 2 3 4]; % column ids of the x, y and z coordinates, and of the Cp
stats = [0 0.20 0.44 0.65 0.80 0.90 0.95 0.99]; % y coordinate of the slices (as percentage of semi-span)
nfile = length(stats);

% Functions
cps = cfdread(nfile, fullfile(fpath_, fpath), format, ids);
[chords, cls, cms] = cfdloads(nfile, cps);
cfdplot(nfile, stats, chords, cps, cls, cms);

end