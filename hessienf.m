function hess = hessienf(t,v,A,b)
f1 = A*v-b;
f2 = transpose(-transpose(A))*v-b;
hess = t*eye(length(v));
for i = 1:length(f1)
    hess = hess +(1/(f1(i)^2))*transpose(A(i,:))*A(i,:);
end
for i = 1:length(f2)
    hess = hess +(1/(f2(i)^2))*transpose(A(i,:))*A(i,:);
end