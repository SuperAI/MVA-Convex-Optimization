function bool = satisfyInEqConstraint(v,A,b) %%fonction permettant de tester si les solutions sont réalisables
res = A*v-b;
compt = 0;
for i = 1:length(res)
    if res(i) > 0
        compt = compt + 1;
    end
end
if compt > 0
    bool = false;
else
    bool = true;
end
