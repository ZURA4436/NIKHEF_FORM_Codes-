s s,t,u,e;
i mu,nu,rho,sigma,mu1,nu1,rho1,sigma1;
i al,bt,al1,bt1;
v p1,p2,p3,p4,p5,p6;

* gamma_mu = g_(1,mu)
* gamma_5  = g5_(1,mu)
* Product of gamma matrices:
* gamma_mu * gamma_nu ... = g_(1,mu,nu,...)
* p1 slash = p1(mu) * g_(1,mu) = g_(1,p1)

l tr1 = g_(1,p1,nu,p5,mu,p2,mu,p5,nu);
l tr2 = g_(1,p1,nu,p6,mu,p2,mu,p6,nu);
l tr3 = g_(3,p1,nu,p5,mu,p2,mu,p6,nu);
l tr4 = g_(1,p1,nu,p6,mu,p2,mu,p5,nu);

l ans = 1/4*e^4*(1/u^2*tr1 + 1/t^2*tr2 + 1/(t*u)*(tr3 + tr4));
.sort
trace4,1;
trace4,2;
trace4,3;
trace4,4;

.sort
*id s =(p1+p2)^2 = p1.p1 + p2.p2 + 2*p1.p2
*id t =(p1-p3)^2 = p1.p1 + p3.p3 - 2*p1.p3
*id u =(p1-p4)^2 = p1.p1 + p4.p4 - 2*p1.p4
*id q = (p1+p2); q.q = s;
*contract;

id p5 = p1 - p3;
id p6 = p2 - p3;
.sort
id p1.p1 = 0;
id p2.p2 = 0;
id p3.p3 = 0;
id p4.p4 = 0;
.sort
id p1.p2 = s/2;
id p3.p4 = s/2;
id p1.p3 = -t/2;
id p2.p4 = -t/2;
id p1.p4 = -u/2;
id p2.p3 = -u/2;
.sort
print;
b e,s,t,u;
.end
