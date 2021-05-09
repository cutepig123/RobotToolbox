function y=Ad(g)
%calc adjoint
% y 66,g 44
%Adg=[R p^R;
%      0 R]
R=g(1:3,1:3);
p=g(1:3,4);
%v3tor3(p)
y=[R v3tor3(p)*R;
    zeros(3) R];