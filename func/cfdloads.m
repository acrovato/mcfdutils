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

function [chords, cls, cms] = cfdloads(nfile, cps)
%% cfdloads
% Compute spanwise loads coefficient by integrating the pressure
% Adrien Crovato

% Loads
% TODO check the integration direction to avoid sign reversal
chords = zeros(nfile,1);
cls = zeros(nfile,1);
cms = zeros(nfile,1);
for j = 1:nfile
    % local chord
    chords(j) = max(cps{1,j}(:,1)) - min(cps{1,j}(:,1));
    % lift
    int = 0;
    for i = 1:size(cps{1,j},1)-1
        int = int + 0.5*(cps{1,j}(i+1,1)-cps{1,j}(i,1))/chords(j)*(cps{1,j}(i+1,end)+cps{1,j}(i,end));
    end
    cls(j,1) = -int;
    % moment
    int = 0;
    for i = 1:size(cps{1,j},1)-1
        cquart = min(cps{1,j}(:,1)) + 0.25*chords(j);
        dx = -(cps{1,j}(i+1,1) - cps{1,j}(i,1)) / chords(j);
        dy = -(cps{1,j}(i+1,2) - cps{1,j}(i,2)) / chords(j);
        int = int - 0.5*(cps{1,j}(i+1,end)*(cps{1,j}(i+1,1)-cquart) + cps{1,j}(i,end)*(cps{1,j}(i,1)-cquart)) * dx/chords(j) + 0.5*(cps{1,j}(i+1,end)*cps{1,j}(i+1,2) + cps{1,j}(i,end)*cps{1,j}(i,2)) * dy/chords(j);
    end
    cms(j,1) = int;
end

end