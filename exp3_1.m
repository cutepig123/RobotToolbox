function y=exp3_1(omiga,sita)
%omiga 33,sita 33 y 33
if length(omiga)~=3, error('size of omiga error');end

%normalize omiga
%sita=sita*norm(omiga);
%omiga=omiga/norm(omiga);

%calulate exp(w^sita)
r3=v3tor3(omiga);
y=eye(3)+r3*sin(sita)+r3*r3*(1-cos(sita));

%check ,but error,why??
%y2=eye(3)*cos(sita)+omiga*omiga.'*(1-cos(sita))+r3*sin(sita);
%simple(y-y2)
%%end fcn