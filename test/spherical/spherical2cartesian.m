function [c] = spherical2cartesian(s)

r = s(1);
phi = s(2);
theta = s(3);

x = r*cos(phi)*sin(theta);
y = r*sin(phi)*sin(theta);
z = r*cos(theta);

c = [x,y,z];

end