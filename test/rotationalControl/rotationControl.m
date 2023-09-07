disp('Start')

% TIME SPAN
dt = 1e-2;
tSpan = 0:dt:30;

% PARAMETERS
e0 = [0,0,0];
q0 = e2q(e0);
w0 = [0,0,0];
state0 = [q0,w0];

ed = [
    (pi/2).*(tSpan > 5);
    (pi/2).*(tSpan > 10);
    (pi/2).*(tSpan > 15);
]';
qd = e2q(ed);
K = [20,4];

% CLASS
%{
vertices = [
    -1 -1  -1;
    -1  1 -1;
    1   1  -1;
    1  -1  -1;
    -1 -1  1;
    -1  1 1;
    1   1  1;
    1  -1  1
];
faces = [
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    4 1 5 8;
    1 2 3 4;
    5 6 7 8
];
%}
vertices = [
    0 0 4;
    1 1 -4;
    1 -1 -4;
    -1 1 -4;
    -1 -1 -4;
    0 0 -4;
];
faces = [
    1 2 3;
    1 2 4;
    1 3 5;
    1 4 5;
    2 3 6;
    3 5 6;
    2 4 6;
    4 5 6;
];
color = [0 0.5 0];
inertia = diag([1 1 1]);
BLOCK = block(state0, dt, tSpan, inertia, qd, K, vertices, faces, color);

% SOLUTION + ANIMATION + VISUALIZATION
BLOCK.simulate()
BLOCK.animate()
seeData

disp('Done')