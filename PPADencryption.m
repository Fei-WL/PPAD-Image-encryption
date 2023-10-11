function C = PPADencryption(P,initialkey,R)
%PPADENCRYPTION �˴���ʾ�йش˺�����ժҪ
%Input: The plain image P with a size of r��cxse (where r and c represents the number of row and
%column of P respectively and se represents the num of color), a 240-bit secret key, the encryption rounds R given according to the
%required security.
%Output: Cipher image C.
%Step1
useRoundkey=false;
initialkey=double(initialkey);
if(useRoundkey)
Roundkeyarray=roundkeygenerate(initialkey,R);
end

[r,c,se]=size(P);
%Step2 ����������ѡ��ֱ���ó�ʼ��Կ��������Կ
isjishu=mod(r*c,2);
X=getX(initialkey,r*c/2+isjishu);
sizeX=size(X,1);
Xarray=zeros(R,sizeX,r*c/2+isjishu);
if(useRoundkey)
    %r=1��ʼ��Կ��ʹ��
    for rr=2:R+1        
X=getX(Roundkeyarray(rr,:),r*c/2+isjishu);
Xarray(rr-1,:,:)=X;
    end
end

Ma=reshape(floor(mod([X(1,1:r*c/2) X(2,1:r*c/2+isjishu)]*power(10,6),256)),[r,c]);
Mb=reshape(floor(mod([X(3,1:r*c/2) X(4,1:r*c/2+isjishu)]*power(10,6),256)),[r,c]);
%Va=floor(mod(X(3,1:r)*power(10,6),256));
%Vb=floor(mod(X(4,1:r)*power(10,6),256));
%Vc=floor(mod(X(3,(r*c-c+1):r*c)*power(10,6),256));
%Vd=floor(mod(X(4,(r*c-c+1):r*c)*power(10,6),256));

%���ܵ���R��
C=double(P);
for i=1:R
    P=C;
    if useRoundkey
    X=reshape(Xarray(i,:,:),[sizeX,r*c/2+isjishu]);%����ֱ��ʹ��4��
    Ma=reshape(floor(mod([X(1,1:r*c/2) X(2,1:r*c/2+isjishu)]*power(10,6),256)),[r,c]);
    Mb=reshape(floor(mod([X(3,1:r*c/2) X(4,1:r*c/2+isjishu)],256)),[r,c]);
    %Va=floor(mod(X(3,1:r)*power(10,6),256));
    %Vb=floor(mod(X(4,1:r)*power(10,6),256));
    %Vc=floor(mod(X(3,(r*c-c+1):r*c)*power(10,6),256));
    %Vd=floor(mod(X(4,(r*c-c+1):r*c)*power(10,6),256));
    end
    C=Algorithm(P,Ma,Mb);
%figure(3);
%imshow(C,[]);
end
C=uint8(C);
end


