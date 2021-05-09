%whether w=exp3(w^ sita)*w,where w is any scalar num.
syms w1 w2 w3 sita
w=[w1;w2;w3];
result=exp3_1(w,sita)*w-w;
res=simple(result);res