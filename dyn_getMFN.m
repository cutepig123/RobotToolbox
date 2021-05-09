function dyn_getMFN(screws,gst0s,sitas,Is)
%����M,F,N,�����ǽ����ǵ�ÿһ���ӡ����
%����ѧģ��Ϊ tao=M*Sitas''+C*Sitas'+N*Sitas
%���� C(i,j)=1/2 * Sum{F(i,j,k)*Sita(k)',for k=1 to n}
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
V=0;
for i=1:n
	J=Jacobi_b(screws,sitas,gst0s(1:4,4*i-3:4*i),i);
	M=M+transpose(J)*Is(1:6,6*i-5:6*i)*J;
	V=V+Is(1,6*i)*9.8*gst0s(1:3,4*i);
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

N=[];
for i=1:n
	N=[N diff(V,sitas(i))];
end
N=simple(N)