function res = fonctionf(t,Q,p,v,A,b)
f1 = A*v-b;
f2 = -A*v-b;
res = t*(transpose(v)*Q*v + transpose(p)*v);
for i = 1:length(f1)
    if -f1(i) > 0
        res = res - log(-f1(i));
    else
        res = res + inf;
    end
end
for i = 1:length(f2)
    if -f2(i) > 0
       res = res - log(-f2(i));
    else
       res = res + inf;
    end
end