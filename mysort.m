function retlist = mysort(sortlist,indexlist)
%������sort P(i,:)=sort(P(i,:),Ma(i,:));
%   ����չΪ����ž���Ȼ��xx
L=length(sortlist);%sortlist�����indexlistһ����
indexmat=zeros(L,2);
retlist=zeros(1,L);
for i=1:L
    indexmat(i,1)=indexlist(i);
    indexmat(i,2)=i;
end
indexmat=sortrows(indexmat);
for i=1:L
    retlist(i)=sortlist(indexmat(i,2));
end
    %retlist=circshift(retlist,h,2); %�����Һ����һ�н���������λ
end

