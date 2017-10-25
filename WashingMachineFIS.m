clc

% Read in the data for the FIS
filename = ('C:\Users\jerzy\Downloads\IntelligentEnvironment.xls');
filename = ('WashingMachineFIS.xls');
testData = xlsread(filename)

% Declare a new FIS
a = newfis('Assignement 1 - Washing machine FIS');

% Input variable: Weight (Kgs)
a = addvar(a, 'input', 'Weight (Kgs)', [0 12]);
a = addmf(a, 'input', 1, 'Very light', 'trapmf', [0 0 1 2]);
a = addmf(a, 'input', 1, 'Light', 'trimf', [1.5 3.5 5]);
a = addmf(a, 'input', 1, 'Medium', 'trimf', [4.5 6 7]);
a = addmf(a, 'input', 1, 'Heavy', 'trimf', [6.5 8 9]);
a = addmf(a, 'input', 1, 'Very Heavy', 'trapmf', [8.5 10.5 12 12]);

% Input variable: Thickness (%)
a = addvar(a, 'input', 'Thickness (%)', [0 100]);
a = addmf(a, 'input', 2, 'Thin', 'trapmf', [0 0 20 40]); 
a = addmf(a, 'input', 2, 'Medium', 'trimf', [35 50 65]);  
a = addmf(a, 'input', 2, 'Thick', 'trapmf', [60 80 100 100]);

% Input variable: Dirt (%)
a = addvar(a, 'input', 'Dirt (%)', [0 100]);
a = addmf(a, 'input', 3, 'Light', 'trapmf', [0 0 10 20]);
a = addmf(a, 'input', 3, 'Medium', 'trimf', [15 35 50]);
a = addmf(a, 'input', 3, 'Heavy', 'trimf',  [45 65 80]);
a = addmf(a, 'input', 3, 'Covered', 'trapmf',  [75 90 100 100]);

% Output variable: Washing time (%)
a=addvar(a,'output','Washing time (Min)',[15 240]); 

a = addmf(a, 'output', 1, 'Very Short', 'gaussmf', [15 15]);
a = addmf(a,'output',1,'Short','gaussmf',[15 30]); 
a = addmf(a,'output',1,'Medium','gaussmf',[15 60]); 
a = addmf(a,'output',1,'Long','gaussmf',[15 120]);
a = addmf(a,'output',1,'Very long','gaussmf',[15 240]);

%If Weight/If Thickness/If Dirt/Then Washing time
%Thin
 thin1 = [1 1 1 1 1 1];
 thin2 = [2 1 1 1 1 1];
 thin3 = [3 1 1 2 1 1];
 thin4 = [4 1 1 2 1 1];
 thin5 = [5 1 1 3 1 1];
 thin6 = [1 1 2 1 1 1];
 thin7 = [2 1 2 2 1 1];
 thin8 = [3 1 2 2 1 1];
 thin9 = [4 1 2 3 1 1];
thin10 = [5 1 2 3 1 1];
thin11 = [1 1 3 2 1 1];
thin12 = [2 1 3 3 1 1];
thin13 = [3 1 3 3 1 1];
thin14 = [4 1 3 3 1 1];
thin15 = [5 1 3 4 1 1];
thin16 = [1 1 4 3 1 1];
thin17 = [2 1 4 3 1 1];
thin18 = [3 1 4 4 1 1];
thin19 = [4 1 4 4 1 1];
thin20 = [5 1 4 5 1 1];

%Medium
 medium1 = [1 2 1 2 1 1];
 medium2 = [2 2 1 2 1 1];
 medium3 = [3 2 1 3 1 1];
 medium4 = [4 2 1 3 1 1];
 medium5 = [5 2 1 3 1 1];
 medium6 = [1 2 2 2 1 1];
 medium7 = [2 2 2 3 1 1];
 medium8 = [3 2 2 3 1 1];
 medium9 = [4 2 2 3 1 1];
medium10 = [5 2 2 4 1 1];
medium11 = [1 2 3 3 1 1];
medium12 = [2 2 3 3 1 1];
medium13 = [3 2 3 4 1 1];
medium14 = [4 2 3 4 1 1];
medium15 = [5 2 3 5 1 1];
medium16 = [1 2 4 4 1 1];
medium17 = [2 2 4 4 1 1];
medium18 = [3 2 4 5 1 1];
medium19 = [4 2 4 5 1 1];
medium20 = [5 2 4 5 1 1];

%Thick
 Thick1 = [1 3 1 3 1 1];
 Thick2 = [2 3 1 3 1 1];
 Thick3 = [3 3 1 4 1 1];
 Thick4 = [4 3 1 4 1 1];
 Thick5 = [5 3 1 4 1 1];
 Thick6 = [1 3 2 3 1 1];
 Thick7 = [2 3 2 4 1 1];
 Thick8 = [3 3 2 4 1 1];
 Thick9 = [4 3 2 4 1 1];
Thick10 = [5 3 2 4 1 1];
Thick11 = [1 3 3 4 1 1];
Thick12 = [2 3 3 4 1 1];
Thick13 = [3 3 3 4 1 1];
Thick14 = [4 3 3 5 1 1];
Thick15 = [5 3 3 5 1 1];
Thick16 = [1 3 4 4 1 1];
Thick17 = [2 3 4 5 1 1];
Thick18 = [3 3 4 5 1 1];
Thick19 = [4 3 4 5 1 1];
Thick20 = [5 3 4 5 1 1];


ruleList = [thin1; thin2; thin3; thin4; thin5;...
            thin6; thin7; thin8; thin9; thin10;...
            thin11; thin12; thin13; thin14; thin15;...
            thin16; thin17; thin18; thin19; thin20;...
            medium1; medium2; medium3; medium4; medium5;...
            medium6; medium7; medium8; medium9; medium10;...
            medium11; medium12; medium13; medium14; medium15;...
            medium16; medium17; medium18; medium19; medium20;...
            Thick1; Thick2; Thick3; Thick4; Thick5;...
            Thick6; Thick7; Thick8; Thick9; Thick10;...
            Thick11; Thick12; Thick13; Thick14; Thick15;...
            Thick16; Thick17; Thick18; Thick19; Thick20;];
            
%Easy to read rules = 
% -------- Weight ----------------
% Very light = 1
% Light = 2
% Medium = 3
% Heavy = 4
% Very Heavy = 5

% -------- Thickness ----------------
% Thin = 1
% Medium = 2
% Thick = 3

% -------- Dirt ----------------
% Light = 1
% Medium = 2
% Heavy = 3
% Covered = 4

% -------- Washing time ----------------
% Very short = 1
% Short = 2
% Medium = 3
% Long = 4
% Very Long = 5


% Add the rules to the FIS
a = addrule(a,ruleList);

% Print the rules to the workspace
rules = showrule(a)

% Set the defuzzification method
%a.defuzzMethod = 'centroid';
%a.defuzzMethod = 'bisector';
%a.defuzzMethod = 'mom';
%a.defuzzMethod = 'som';
a.defuzzMethod = 'lom';

for i=1:size(testData,1)
        eval = evalfis([testData(i, 1), testData(i, 2), testData(i, 3) ], a);
        fprintf('%d) In(1): %.2f, In(2) %.2f, In(3) %.2f => Out: %.2f \n\n',i,testData(i, 1),testData(i, 2),testData(i, 3), eval);  
end

figure(1)
subplot(4,1,1), plotmf(a, 'input', 1)
subplot(4,1,2), plotmf(a, 'input', 2)
subplot(4,1,3), plotmf(a, 'input', 3)
subplot(4,1,4), plotmf(a, 'output', 1)