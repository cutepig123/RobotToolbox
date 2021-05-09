function dyn_getF(screws,gst0s,sitas,Is)
%计算F,仅仅是将它的每一项打印出来
%screws 6*n,gst0s 4*4n,sitas 1*n,Is 6*6n
[h,w]=size(screws);
if h~=6,error('size screws error.');end
[h,w2]=size(gst0s);
if h~=4 | w2~=w*4,error('size gst0s error');end
[h,w3]=size(sitas);
if h~=1 | w3~=w,error('size sitas error');end
[h,w4]=size(Is);
if h~=6 | w4~=w*6,error('size Is error');end

M=0;
n=w;
for i=1:n
	J=Jacobi_b(screws,sitas,gst0s(1:4,4*i-3:4*i),i);
	M=M+transpose(J)*Is(1:6,6*i-5:6*i)*J;
end
M=simple(M)

for i=1:n
	for j=1:n
		for k=1:n
			fprintf('F%d%d%d:\n',i,j,k);
			F=diff(M(i,j),sitas(k))+diff(M(i,k),sitas(j))-diff(M(k,j),sitas(i));
			F=simple(F)/2
		end
	end
end