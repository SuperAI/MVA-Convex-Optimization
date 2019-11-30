%%Main permettant de tester les algorithmes

clear all;

n = 5;
d = 10*n;
m1 = 0;
sigma1 = 10;
%y = m1 + sigma1.*randn(n , 1);
rng(1) 
y = round(rand(n,1)*10);
m2 = 5;
sigma2 = 2;
%X = m2 + sigma2.*randn(n , d);
rng(1)
X = round(rand(n,d)*10);

lambda = 10;
Q = 0.5*eye(n);
p = y;
A = transpose(X);
b = lambda.*ones(d,1);
eps = 10^-8;
t = 10^3;

Anew = [transpose(X);-transpose(X)];
bnew = [b;b];

fonc = @(v) fonctionf(t,Q,p,v,Anew,bnew);
grad = @(v) gradientf(t,v,p,Anew,bnew);
hess = @(v) hessienf(t,v,Anew,bnew);

%%Centering step test
ftest = zeros(n,1);
v0 = linprog(ftest,Anew,bnew);
res = centering_step(Q,p,Anew,bnew,t,v0,eps);
tab = [];
for i =1:length(res)
    tab = [tab, fonc(res(:,i))];
end
plot(tab)

%%Barrier method
clear tab2;
clear tab3;
v0new = zeros(length(A(1,:)),1);
res2 = barr_method(Q,p,A,b,v0new,eps,100);
tab2 = [];
for i =1:length(res2)
    tab2 = [tab2, fonc(res2(:,i))];
end
tab3 = tab2-min(tab2)+0.0001;
semilogy(tab3);

%Solution du problème primale
w = X\(y-res2(:,5));
