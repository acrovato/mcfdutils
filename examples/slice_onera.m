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

function slice_onera(fpath_)
%% onera M6 wing
% Create a Tecplot macro to generate slice along the span of the Onera M6
% Adrien Crovato

% Inputs
fname = 'slice_onera'; % macro .mcr file name (will be written under workspace/ dir) 
stats = [0.01, 0.24, 0.53, 0.78, 0.96, 1.08, 1.14, 1.18]; % y-coordinates of slices
ids = [1 2 3 21];% column ids of variables to extract

% Functions
cfdtecslicer(fname, stats, ids)

end