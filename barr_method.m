function vseq = barr_method(Q,p,A,b,v0,eps,mu)
m = length(b(:,1));
t = 1;
vseq = [v0];
while m/t > eps 
    res = centering_step(Q,p,A,b,t,v0,eps);
    x = res(:,length(res(1,:)));
    vseq = [vseq, x];
    t = mu*t;
end








