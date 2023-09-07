disp('Start')

% 2 VECTORS IN CARTESIAN COORDINATES
c1 = [0 1 0];
c2 = [0 0 1];

s1 = cartesian2spherical(c1);
s2 = cartesian2spherical(c2);

% DOT PRODUCTS
cartesianDotProduct(c1, c2);
sphericalDotProduct(s1, s2);

% CROSS PRODUCTS
ccp = cartesianCrossProduct(c1, c2);
ccp2 = cartesian2spherical(ccp);
scp = sphericalCrossProduct(s1, s2);
scp2 = spherical2cartesian(scp);

disp('Cart CP')
disp(ccp)
disp('Cart CP to Sphe')
disp(ccp2)
disp('Sphe CP')
disp(scp)
disp('Sphe CP to Cart')
disp(scp2)




disp('Done')