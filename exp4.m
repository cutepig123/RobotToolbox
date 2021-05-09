function y=exp4(w,sita,v)
if nargin==2
	y=exp4_2(w,sita);
elseif nargin==3
	 y=exp4(w,sita,v);
else
	error('Input Error.');
end