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

function cfdutils(fpath_)
%% cfdutils
% CFD post-processing utilities
% Adrien Crovato
%
% Usage: cfdutils(path/to/param_file)

% Clear
clearvars -except fpath_;
close all;
% Add to path
[fpath, fname, ~] = fileparts(fpath_);
addpath(fpath, 'func');
% Call user-defined function
feval(fname, fpath);
% Remove from path
rmpath(fpath, 'func');
end