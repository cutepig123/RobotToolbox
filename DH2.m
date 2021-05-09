function y=DH2(sita,d,a,alpha)
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
% y=[            cos(sita),           -sin(sita),                    0,                    a;
%  cos(alpha)*sin(sita), cos(alpha)*cos(sita),          -sin(alpha),        -sin(alpha)*d;
%  sin(alpha)*sin(sita), sin(alpha)*cos(sita),           cos(alpha),         cos(alpha)*d;
%                     0,                    0,                    0,                    1];
y=[            cs,           -ss,                    0,                    a;
 ca*ss, ca*cs,          -sa,        -sa*d;
 sa*ss, sa*cs,           ca,         ca*d;
                    0,                    0,                    0,                    1];
; 