function [dX] = eom(t, X, k, m)

dX(1) = X(2);
dX(2) = -(k/m)*X(1);

end