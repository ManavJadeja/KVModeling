function [crossProduct] = sphericalCrossProduct(s1, s2)

r1 = s1(1);
phi1 = s1(2);
theta1 = s1(3);

r2 = s2(1);
phi2 = s2(2);
theta2 = s2(3);

r1*r2*(sin(theta1)*sin(theta2)*sin(phi2-phi1))
r1*r2*(cos(phi1)*cos(phi2)*(sin(theta2) - sin(theta1)))

crossProduct = [
    r1*r2*(sin(theta1)*sin(phi1)*cos(phi2) - cos(phi1)*sin(phi2)*sin(theta2)),...
    r1*r2*(sin(theta1)*sin(theta2)*sin(phi2-phi1)),...
    r1*r2*(cos(phi1)*cos(phi2)*(sin(theta2) - sin(theta1))),...
];

end