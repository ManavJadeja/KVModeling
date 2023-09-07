function [Fcor] = earthCoriolis(v, latitude, m)
%%% earthCoriolis
%
%       VELOCITY VECTOR
%           v = <vx vy vz>
%       CORIOLIS FORCE
%           Fcor = <Fcorx Fcory Fcorz>
%

% CONVERSIONS
phi = (latitude + 90)*pi/180;

% CONSTANTS
omega = (2*pi)/(24*3600)*[0 sin(phi) cos(phi)];

% CORIOLIS FORCE
Fcor = 2*m*cartesianCrossProduct(v, omega);

end