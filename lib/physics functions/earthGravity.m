function [Fg] = earthGravity(latitude, altitude, m)
%%% earthGravity
%
%       LATITUDE (deg)
%       FORCE GRAVITY
%           Fg = <0 0 Fgz>
%

% CONVERSIONS
phi = latitude*pi/180;
h = altitude;

% CONSTANTS
ge = 9.78032677;
gp = 9.83218494;
a = 6378137;
b = 6356752;
k = (b*gp - a*ge)/(a*ge);
e2 = (a^2 - b^2)/(a^2);

k1 = 3.15704e-7;
k2 = 2.10269e-9;
k3 = 7.37452e-14;

% SOMIGLIANA GRAVITY
g0 = ge*(1 + k*(sin(phi))^2)/sqrt(1 - e2*(sin(phi))^2);

% CASSINIS GRAVITY
Fg = [0 0 -1]*m*g0*(1 - (k1-k2*(sin(phi))^2)*h + k3*h^2);


end