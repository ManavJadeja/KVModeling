function [dX] = EOM(t, X, m, latitude)
%%% EOM
%       X (STATE VECTOR)
%           X(1:3) = <x y z>
%           X(4:6) = <x' y' z'>
%       LATITUDE (deg)
%           defines orgin
%

Fg = earthGravity(latitude, X(3), m);
Fcor = earthCoriolis(X(4:6), latitude, m);
Fcen = earthCentrifugal(X(1:3), latitude, m);

F = Fg + Fcor + Fcen;

dX(1:3) = X(4:6);
dX(4:6) = F/m;

end