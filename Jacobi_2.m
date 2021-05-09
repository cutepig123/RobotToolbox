%%%%%%%%%%%Àý3.8 SCARA»úÆ÷ÈËµÄjacobi page116     page154
% clc
% clear
% syms l0 l1 l2 s1 s2 s3 s4 s5 s6
% screw1=screw([ 0 ;0; 1],[0 ;0;0])
% screw2=screw([ 0 ;0 ;1],[0;l1;0])
% screw3=screw([ 0 ;0; 1],[0;l1+l2;0])
% screw4=[0 ;0; 1;0;0;0 ]
% twist=[screw1 screw2 screw3 screw4], sita=[s1 s2 s3 s4]
% Jmatrix=Jacobi(twist,sita)
%

function Jmatrix=Jacobi(twist,sita)
Jmatrix=[];

[row,colum]=size(twist);
newtwist=twist(1:row,1);
oldtwist=twist(1:row,1);
tempmat=eye(4);
for i=1:colum-1
    
    Jmatrix=[Jmatrix newtwist];
    oldtwist=twist(1:row,i);
    fprintf('g=exp(Twist1Sita1)*...*exp(Twist%dSita%d)',i);
    tempmat=tempmat*exp4_2(oldtwist,sita(i))
%%%%%%%%%  or 
%      v=oldtwist(1:3);
%      w=oldtwist(4:6);
%      tempmat=tempmat*v_w_to_expmap4(v,w,sita(i));

    
    twist_temp=twist(1:row,i+1);
    fprintf('Adg');
    adjoint=Ad(tempmat)
    fprintf('Adg*twist%d',i+1);
    newtwist=adjoint*twist_temp
end
     Jmatrix=[Jmatrix newtwist]
%     Jmatrix=simple(Jmatrix)

    


