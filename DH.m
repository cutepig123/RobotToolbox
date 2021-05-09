function y=DH(sita,d,a,alpha)
%D-H方法建立模型y 44,others 11
cs=cos(sita);ss=sin(sita);
ca=cos(alpha);sa=sin(alpha);
if abs(ca-0)<.01 ,
    ca=0;
elseif abs(ca-1)<.01 ,
    ca=1;
elseif abs(ca+1)<.01 ,
    ca=-1
end
if abs(sa-0)<.01 ,
    sa=0;
elseif abs(sa-1)<.01 ,
    sa=1;
elseif abs(sa+1)<.01 ,
    sa=-1;
end
y=[cs   -ss*ca  ss*sa   a*cs;
    ss  cs*ca   -cs*sa  a*ss;
    0   sa      ca      d;
    0   0       0       1
];