function [crossProduct] = cartesianCrossProduct(c1, c2)

x1 = c1(1);
y1 = c1(2);
z1 = c1(3);

x2 = c2(1);
y2 = c2(2);
z2 = c2(3);

crossProduct = [
    y1*z2 - y2*z1,...
    z1*x2 - z2*x1,...
    x1*y2 - x2*y1,...
];

end