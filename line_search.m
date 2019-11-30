function res = line_search(f, x, delta , gradientf , alpha , beta)
t = 1;
while f(x+t*delta) >= f(x) + alpha*t*transpose(gradientf(x))*delta 
        t = beta*t;
end
res = t;
