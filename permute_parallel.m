function  f_circ  = permute_parallel( f,p1,p2 )  %fΪͼ����� r*c p1 rx1 p2 cx1

[f,~]=sortrows([p2 f'],1);  %����sortrows�󣬵�һ��P1�Ѿ���������ˣ���ԭ��P1�Ѿ���������
f(:,1)=[];
f=f';

[f,~]=sortrows([p1 f],1);
f(:,1)=[];      
f_circ=f;
end
