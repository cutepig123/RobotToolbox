function J=Jacobi_b(twist,sita,gsti0,pos)
%J 6l,twist 6l ,sita 1l,gsti0 4*4,i 1*1
%工具坐标系的Jacobi
%
% syms l0 l1 l2 l3 s1 s2 s3 s4 r1 r2 r3 r4 r0
% j1=[0 0 0 0 0 1]';
% j2=[0 ;-l0;0;-1;0;0 ];
% j3=[0;-l0;l1;-1;0;0];
% gst10=[eye(3) [0;0;r0];
%     0 0 0 1];
% gst20=[eye(3) [0;r1;l0];
%     0 0 0 1];
% gst30=[eye(3) [0;l1+r2;l0];
%     0 0 0 1];
% J1=Jacobi_b([j1 j2 j3],[s1 s2 s3],gst30,3)
% J2=simple(J1);
% J2
% 
% J2 =
%  
% [ -cos(s2)*l1-cos(s3+s2)*r2,                         0,                         0]
% [                         0,                sin(s3)*l1,                         0]
% [                         0,            -l1*cos(s3)-r2,                       -r2]
% [                         0,                        -1,                        -1]
% [               -sin(s3+s2),                         0,                         0]
% [                cos(s3+s2),                         0,                         0]
% 

[h,l]=size(twist);
if h~=6,error('输入错误');end
if length(sita)~=l ,error('sita 错误');end

g=inv(gsti0);
J=[];
for i=pos+1:l
    J=[J [0 0 0 0 0 0]'];
end
for i=pos:-1:1
    adg=Ad(g);
    adx=adg*twist(1:6,i);
    J=[adx J];
%    J(:,i)=adx;
    g=g*inv(exp4_2(twist(1:6,i),sita(i)));
end
