%% This script is used to generate the dataset

% Polynomials
A = [1, -1.5, 0.7];
B = [0, 0, 0, 0.5, 0.3];

% Time delay
t = 1;

% Polynomial model
M = idpoly(A, B, [], [], [], 0.001, t);

% Input
U = idinput(1000,'rgs',[0 1]);

% Output
[Y, YSD] = sim(M, U, 'noise');

% Adding a trend to emphatize the role of detrend
Y = Y + 5;

% Creating the dataset
dati = iddata(Y, U, 1);

% Saving the dataset
save data1 U Y t
