function retlist = antimysort(sortlist,indexlist)
%������antisort P(i,:)=sort(P(i,:),Ma(i,:));
%   ����չΪ����ž���Ȼ��xx
%ret shuold be 
L=length(sortlist);%sortlist�����indexlistһ����
indexmat=zeros(L,2);
retlist=zeros(1,L);
for i=1:L
    indexmat(i,1)=indexlist(i);
    indexmat(i,2)=i;
end
indexmat=sortrows(indexmat);
%sortlist=circshift(sortlist,-h,2);  %������λ
for i=1:L
    retlist(indexmat(i,2))=sortlist(i);
end
end

