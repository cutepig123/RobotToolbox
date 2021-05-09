function y=Trans(dx,dy,dz)
%ƽ�Ʊ任
y=[eye(3) [dx;dy;dz];
    0 0 0 1
];