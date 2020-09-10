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

function cfdplot(nfile, stats, chords, cps, cls, cms)
%% cfdplot
% Plot chordwise pressure and spanwise load distributions
% Adrien Crovato
 
% Display
disp(['y/b = ', num2str(stats)]);
disp(['Cl = ', num2str(cls')]);
disp(['Cm = ', num2str(cms')]);

% Chordwise pressure distributions
figure
hold on
set(gca, 'YDir', 'reverse', 'Fontsize', 20, 'Fontname', 'Times', 'LineWidth', 0.5)
for j = 1:nfile
    plot((cps{1,j}(:,1) - min(cps{1,j}(:,1))) / chords(j), cps{1,j}(:,4), 'Linewidth', 2)
end
Legend = cell(nfile, 1);
 for j = 1:nfile
   Legend{j} = strcat(['y/b = ', num2str(stats(j))]);
 end
legend(Legend); legend BOXOFF;
xlabel('$x/c$', 'Interpreter', 'Latex');
ylabel('$C_p$','Interpreter', 'Latex');
title('Pressure distribution along chord');

% Spanwise loads
figure
hold on
set(gca, 'Fontsize', 20, 'Fontname', 'Times', 'LineWidth', 0.5)
yyaxis left
plot(stats, cls, 'Linewidth', 2, 'Marker','o')
yyaxis right
plot(stats, cms, 'Linewidth', 2, 'Marker','o')
yyaxis left
title('Loads distribution along span')
xlabel('$y/b$', 'Interpreter', 'Latex')
ylabel('$C_l$','Interpreter', 'Latex')
yyaxis right
ylabel('$C_m$','Interpreter', 'Latex')

end