function J=Jacobi(twist,sita)
%J 6l,twist 6l ,sita 1l
[h,l]=size(twist);
if h~=6,error('ÊäÈë´íÎó');end
if length(sita)~=l ,error('sita ´íÎó');end

g=eye(4);
J=[];
for i=1:l
    adg=Ad(g);
    %adg,t=twist(1:6,i),
    adx=adg*twist(1:6,i);
    %fprintf('J%d=',i),adx;
    J=[J adx];
    g=g*exp4_2(twist(1:6,i),sita(i));
end
