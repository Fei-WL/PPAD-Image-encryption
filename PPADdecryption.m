function P = PPADdecryption(C,initialkey,R)
%PPADdecryption �˴���ʾ�йش˺�����ժҪ

%Step1
useRoundkey=false;
initialkey=double(initialkey);
if(useRoundkey)
Roundkeyarray=roundkeygenerate(initialkey,R);
end
[r,c,se]=size(C);

%Step2 ����������ѡ��ֱ���ó�ʼ��Կ��������Կ
isjishu=mod(r*c,2);
X=getX(initialkey,r*c/2+isjishu);
Xarray=zeros(R,4,r*c/2+isjishu);
if(useRoundkey)
    %r=1��ʼ��Կ��ʹ��
    for rr=2:R+1
        X=getX(Roundkeyarray(rr,:),r*c/2+isjishu);
        %X=getX(reshape(Roundkeyarray(rr,:),length(Roundkeyarray(rr,:))),r*c);
        Xarray(rr-1,:,:)=X;
    end
end

Ma=reshape(floor(mod([X(1,1:r*c/2) X(2,1:r*c/2+isjishu)]*power(10,6),256)),[r,c]);
Mb=reshape(floor(mod([X(3,1:r*c/2) X(4,1:r*c/2+isjishu)]*power(10,6),256)),[r,c]);
%���ܵ���R��
P=double(C);%���ܹ����б�������˫������

for i=R:-1:1
    C=P;
    if useRoundkey
        
    X=reshape(Xarray(i,:,:),[sizeX,r*c/2+isjishu]);%����ֱ��ʹ��4��
Ma=reshape(floor(mod([X(1,1:r*c/2) X(2,1:r*c/2+isjishu)]*power(10,6),256)),[r,c]);
Mb=reshape(floor(mod([X(3,1:r*c/2) X(4,1:r*c/2+isjishu)]*power(10,6),256)),[r,c]);
    end
    P=antiAlgorithm(C,Ma,Mb);
%figure(3);
%imshow(C,[]);
end
P=uint8(P);
end


