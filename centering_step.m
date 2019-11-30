function v_seq = centering_step(Q,p,A,b,t,v0,eps)
itmax = 1000; %on définit une itération maximale pour éviter une boucle infinie
it = 0;
alpha = 0.1;
beta = 0.7;
lambda_sq = inf;
v = v0;
v_seq = [v0];
fonc = @(v) fonctionf(t,Q,p,v,A,b); %fonction f de notre problème duale
grad = @(v) gradientf(t,v,p,A,b); %gradient de f 
while it<=itmax && lambda_sq >2*eps %méthode de Newton
    gradfv = gradientf(t,v,p,A,b);
    hessfv = hessienf(t,v,A,b);
    delta = hessfv\-gradfv;
    lambda_sq = transpose(gradfv)*-delta;
    mu = line_search(fonc, v, delta , grad, alpha , beta); %line_search utilise le backtracking
    v = v + mu*delta; %mise à jour
    v_seq = [v_seq, v];
    it = it + 1;
end

