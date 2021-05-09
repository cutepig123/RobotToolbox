function y=Rot(type,sita)
%旋转变换 type=1 2 3 代表x y z
y=[];
switch type
    case 1,
        y=[1 0 0 0;
            0 cos(sita) -sin(sita) 0;
            0 sin(sita) cos(sita) 0;
            0 0 0 1;            
        ];
        %break;
    case 2,
       y=[cos(sita) 0 sin(sita) 0;
            0 1 0  0;
            -sin(sita) 0 cos(sita) 0;
            0 0 0 1;            
        ];
        %break;
   case 3,
        y=[cos(sita) -sin(sita) 0 0;
            sin(sita) cos(sita) 0  0;
            0  0 1 0;
            0 0 0 1;            
        ];
        %break;
end
        