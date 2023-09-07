function [Fcen] = earthCentrifugal(r, latitude, m)
%%% earthCentrifugal
%
%       POSITION VECTOR
%           r = <x y z>
%       CENTRIFUGAL FORCE
%           Fcen = <0 Fceny Fcenz>
%

% CONVERSIONS
phi = latitude*pi/180;
theta = phi + pi/2;

% CONSTANTS
omega = (2*pi)/(24*3600);
a = 6378137;
b = 6356752;
rEarth = [0 a*cos(phi) b*sin(phi)];
rho = (r + rEarth)*sin(theta);

% CENTRIFUGAL FORCE
Fcen = m*omega^2*rho;

end