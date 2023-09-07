disp('Start')

% TIME SPAN
dt = 1e-2;
tSpan = 0:dt:30;

% INITIAL CONDITION
e0 = [0,0,0];
q0 = e2q(e0);
w0 = [0,0,0];
state0 = [q0,w0];
ed = [
    (pi/2).*(tSpan > 5); % zeros(1, length(tSpan)); %
    (pi/2).*(tSpan > 10);
    (pi/2).*(tSpan > 15);
]';
qd = e2q(ed);
K = [20,4];

% SHAPE
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
color = [0 0.5 0];
inertia = diag([1 1 1]);

BLOCK = block(state0, inertia, qd, K, tSpan, dt, vertices, faces, color);
BLOCK.simulate();
BLOCK.animate();

disp('Done')