function [crossProduct] = cartesianCrossProduct(c1, c2)
%%% crossProduct

crossProduct = [
    c1(2)*c2(3) - c2(2)*c1(3),...
    c1(3)*c2(1) - c2(3)*c1(1),...
    c1(1)*c2(2) - c2(1)*c1(2),...
];

end