function y=exp4_1(w,sita,v)
%w 31,sita 11,v 31,y 44
%[v ;w]*sita
if w'*w~=0
	omiga=v3tor3(w);
	R3=exp3_1(omiga,sita);
	w2=[w(1) w(2) w(3)];
	%p=(eye(3)-R3)*VectorProduct(w,v)+w*w'*v*sita;
	p=(eye(3)-R3)*VectorProduct(w,v)+w*w2*v*sita;
	y=[R3 p;0 0 0 1];
   % disp('1');
else
	y=[eye(3) v*sita;
	0 0 0 1];
    %disp('2');
end
