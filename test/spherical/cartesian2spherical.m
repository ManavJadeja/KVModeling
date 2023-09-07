function [s] = cartesian2spherical(c)

x = c(1);
y = c(2);
z = c(3);

r = sqrt(x^2 + y^2 + z^2);
theta = atan2(sqrt(x^2 + y^2), z);
phi = atan2(y, x);

s = [r, phi, theta];

end