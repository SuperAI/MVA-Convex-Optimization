function grad = gradientf(t,v,p,A,b)
f1 = A*v-b;
f2 = -A*v-b;
grad = t*(v+p);
for i = 1:length(f1)
    grad = grad - transpose(A(i,:))/f1(i);
end
for i = 1:length(f2)
    grad = grad - transpose(-A(i,:))/f2(i);
end
    
