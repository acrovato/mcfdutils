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

function cfdtecslicer(fname, stats, ids)
%% cfdtecslicer
% Generate Tecplot macro to create slices along the wingspan
% Adrien Crovato (rewritten from TecSlice.py by Carlos Breviglieri)

% Fix paths
mkdir workspace
file = fullfile(pwd, 'workspace', [fname, '.mcr']);
folder = fullfile(pwd, 'workspace', fname);

% Header
fid = fopen(file,'w');
fprintf(fid,'#!MC 1410\n');
fprintf(fid,'# Created from TecSlice.m\n');
fprintf(fid,'# Tecplot version 2017R3\n\n');
fprintf(fid,'$!PlotType = Cartesian3D\n\n');

% Cutplanes
zone = 101; % id number of first (slice) zone
for i = 1:length(stats)
    fprintf(fid,'$!SliceAttributes 1  SliceSurface = YPlanes\n');
    fprintf(fid,'$!SliceAttributes 1  PrimaryPosition{Y = %f}\n',stats(i));
	fprintf(fid,'$!SliceAttributes 1  SliceSource = SurfaceZones\n');
	fprintf(fid,'$!ExtractSlices\n');
    fprintf(fid,'Group = 1\n');
	fprintf(fid,'ExtractMode = SingleZone\n');
	fprintf(fid,'$!WriteDataSet  \"%scutplane%i.dat\"\n',folder,i);
	fprintf(fid,'IncludeText = No\n');
	fprintf(fid,'IncludeGeom = No\n');
	fprintf(fid,'ZoneList =  [%i]\n',zone);
    fmt = ['VarPositionList =  [', repmat('%i, ', 1, numel(ids)-1), '%i]\n']; fprintf(fid, fmt, ids);
	fprintf(fid,'Binary = No\n');
	fprintf(fid,'UsePointFormat = Yes\n');
	fprintf(fid,'Precision = 9\n');
	fprintf(fid,'TecplotVersionToWrite = TecplotCurrent\n\n');
	zone = zone + 1;
end

% Close file
fclose(fid);
fprintf('Tecplot macro "%s" successfully generated!\n', file);
fprintf('Slices will be written under "%s".\n', folder);

end