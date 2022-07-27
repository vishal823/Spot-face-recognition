clear;
tic;
A = imread('E:\photo.jpeg');
B = imread('E:\WhatsApp Image 2022-05-02 at 10.06.25 PM.jpeg');
X = rgb2gray(B);
H = rgb2gray(A);



[M,N] = size(X);
m = 1:M;
n = 1:N;

[P,Q] = size(H);
p = 1:P;
q = 1:Q;

Xt = zeros([M+2*(P-1) N+2*(Q-1)]);
Xt(m+P-1,n+Q-1) = X;

help = sum(dot(double(H),double(H)));

for k = 1:M+P-1
    for l = 1:N+Q-1
     
        hm = Xt(k:k+P-1, l:l+Q-1);
        divider = sqrt(sum(dot(hm,hm))*help);
        C(k:k,l:l) = sum(sum(hm.*conj(double(H))))/divider;
    end
end
[ypeak, xpeak] = find(C==max(C(:)));
yoffSet = gather(ypeak-size(H,1));
xoffSet = gather(xpeak-size(H,2));
figure
imshow(X);
imrect(gca, [xoffSet+1, yoffSet+1, size(H,2), size(H,1)]);
%C = normxcorr2(B,A);
toc;