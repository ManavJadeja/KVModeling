function [T] = quatETC(q, qd, w, K)

qConj = [
    q(1);
    -q(2);
    -q(3);
    -q(4);
];

qErr = (pq(qd, qConj))';

T = -K(1)*qErr(2:4) -K(2)*w;

end