function [dotProduct] = sphericalDotProduct(p1, p2)

r1 = p1(1);
phi1 = p1(2);
theta1 = p1(3);

r2 = p2(1);
phi2 = p2(2);
theta2 = p2(3);

dotProduct = r1*r2*(cos(theta1)*cos(theta2) + cos(phi1-phi2)*sin(theta1)*sin(theta2));

end