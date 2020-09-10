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

function cps = cfdread(nfile, fpath, format, ids)
%% cfdread
% Read chordwise pressure from slices
% Adrien Crovato

% File path
fname = cell(1,nfile);
for i = 1:nfile
    fname{1,i}(1,:) = [fpath, 'cp', num2str(i-1), '.', format];
end

% Read and store
cps = cell(1,nfile);
if strcmp(format, 'csv')
    delim = ',';
elseif strcmp(format, 'dat')
    delim = ' ';
end
for j = 1:nfile
    dataTpm = dlmread(fname{1,j}(1,:), delim, 1, 0);
    cps{1,j} = dataTpm(:,ids);
    clear dataTpm;
end

end