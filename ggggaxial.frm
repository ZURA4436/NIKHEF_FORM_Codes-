#include color.h
AutoDeclare Index i,j,k;
CFunction acc;
Symbol x;
.global

* Define gamma indices and functions
s s,t,u,e;
i alpha,beta,gamma,delta,lambda,rho,alpha1,beta1,gamma1,delta1,lambda1,rho1;
ct t1,t2,t3,t4,t5,t6,t7;
ct d4,d41,dt,dt1,du,du1,ds,ds1;
i al,bt,al1,bt1;
v p1,p2,p3,p4;
v pt1,pt2,pt3,pt4,pt5,pt6;
v pu1,pu2,pu3,pu4,pu5,pu6;
v ps1,ps2,ps3,ps4,ps5,ps6;
v q1,q2,q3,q4,q5,q6;

* gamma_mu = g_(1,mu)
* gamma_5  = g5_(1,mu)
* Product of gamma matrices:
* gamma_mu * gamma_nu ... = g_(1,mu,nu,...)
* p1 slash = p1(mu) * g_(1,mu) = g_(1,p1)
.sort

l ans44 = (2/4)*(1/64)*t1*d4*d41;
l anstt = (2/4)*(1/64)*(1/t^2)*t1*dt*dt1;
l ans4t = (2/4)*(1/64)*(1/t)*t1*d41*dt;
l anst4 = (2/4)*(1/64)*(1/t)*t1*d4*dt1;
l ansuu = (2/4)*(1/64)*(1/u^2)*t1*du*du1;
l ans4u = (2/4)*(1/64)*(1/u)*t1*d41*du;
l ansu4 = (2/4)*(1/64)*(1/u)*t1*d4*du1;
l ansss = (2/4)*(1/64)*(1/s^2)*t1*ds*ds1;
l ans4s = (2/4)*(1/64)*(1/s)*t1*d41*ds;
l anss4 = (2/4)*(1/64)*(1/s)*t1*d4*ds1;

l ans = ans44 + anstt+ ans4t + anst4 + ansuu+ ans4u + ansu4 + ansss + ans4s + anss4;
.sort

*id s =(p1+p2)^2 = p1.p1 + p2.p2 + 2*p1.p2
*id t =(p1-p3)^2 = p1.p1 + p3.p3 - 2*p1.p3
*id u =(p1-p4)^2 = p1.p1 + p4.p4 - 2*p1.p4
*id q = (p1+p2); q.q = s;
*contract;

id t1 = ( -d_(alpha,alpha1) + (p1(alpha)*p2(alpha1) + p2(alpha)*p1(alpha1))/(s/2) )*( -d_(beta,beta1) )*( -d_(gamma,gamma1) + (p1(gamma)*p3(gamma1) + p3(gamma)*p1(gamma1))/(t/2) )*( -d_(delta,delta1) + (p1(delta)*p4(delta1) + p4(delta)*p1(delta1))/(u/2) );
id t2 = ( -d_(alpha,alpha1) + (p1(alpha)*p2(alpha1) + p2(alpha)*p1(alpha1))/(s/2) )*( -d_(beta,beta1) );
id t3 = ( -d_(alpha,alpha1) + (p1(alpha)*p2(alpha1) + p2(alpha)*p1(alpha1))/(s/2) )*( -d_(gamma,gamma1) + (p1(gamma)*p3(gamma1) + p3(gamma)*p1(gamma1))/(t/2) );
id t4 = ( -d_(alpha,alpha1) + (p1(alpha)*p2(alpha1) + p2(alpha)*p1(alpha1))/(s/2) )*( -d_(delta,delta1) + (p1(delta)*p4(delta1) + p4(delta)*p1(delta1))/(u/2) );
id t5 = ( -d_(beta,beta1) )*( -d_(gamma,gamma1) + (p1(gamma)*p3(gamma1) + p3(gamma)*p1(gamma1))/(t/2) );
id t6 = ( -d_(beta,beta1) )*( -d_(delta,delta1) + (p1(delta)*p4(delta1) + p4(delta)*p1(delta1))/(u/2) );
id t7 = ( -d_(gamma,gamma1) + (p1(gamma)*p3(gamma1) + p3(gamma)*p1(gamma1))/(t/2) )*( -d_(delta,delta1) + (p1(delta)*p4(delta1) + p4(delta)*p1(delta1))/(u/2) );
.sort

id d4 = f(i1,i2,j1)*f(i3,i4,j1)*(d_(alpha,gamma)*d_(beta,delta) - d_(alpha,delta)*d_(beta,gamma)) + f(i1,i3,j1)*f(i2,i4,j1)*(d_(alpha,beta)*d_(gamma,delta) - d_(alpha,delta)*d_(beta,gamma)) + f(i1,i4,j1)*f(i3,i2,j1)*(d_(alpha,gamma)*d_(beta,delta) - d_(alpha,beta)*d_(gamma,delta));
id d41 = f(i1,i2,j2)*f(i3,i4,j2)*(d_(alpha1,gamma1)*d_(beta1,delta1) - d_(alpha1,delta1)*d_(beta1,gamma1)) + f(i1,i3,j2)*f(i2,i4,j2)*(d_(alpha1,beta1)*d_(gamma1,delta1) - d_(alpha1,delta1)*d_(beta1,gamma1)) + f(i1,i4,j2)*f(i3,i2,j2)*(d_(alpha1,gamma1)*d_(beta1,delta1) - d_(alpha1,beta1)*d_(gamma1,delta1));
id dt = f(i2,i3,j1)*( d_(beta,gamma)*pt1(lambda) + d_(gamma,lambda)*pt2(beta) + d_(lambda,beta)*pt3(gamma) )*f(i1,j1,i4)*( d_(alpha,rho)*pt4(delta) + d_(rho,delta)*pt5(alpha) + d_(delta,alpha)*pt6(rho) )*( -d_(lambda,rho) + (p1(lambda)*q1(rho) + q1(lambda)*p1(rho))/(t/2));
id dt1 = f(i2,i3,j2)*( d_(beta1,gamma1)*pt1(lambda1) + d_(gamma1,lambda1)*pt2(beta1) + d_(lambda1,beta1)*pt3(gamma1) )*f(i1,j2,i4)*( d_(alpha1,rho1)*pt4(delta1) + d_(rho1,delta1)*pt5(alpha1) + d_(delta1,alpha1)*pt6(rho1) )*( -d_(lambda1,rho1) + (p1(lambda1)*q1(rho1) + q1(lambda1)*p1(rho1))/(t/2));
id du = f(i2,i4,j1)*( d_(beta,delta)*pu1(lambda) + d_(delta,lambda)*pu2(beta) + d_(lambda,beta)*pu3(delta) )*f(i1,j1,i3)*( d_(alpha,rho)*pu4(gamma) + d_(rho,gamma)*pu5(alpha) + d_(gamma,alpha)*pu6(rho) )*( -d_(lambda,rho) + (p1(lambda)*q2(rho) + q2(lambda)*p1(rho))/(u/2));
id du1 = f(i2,i4,j2)*( d_(beta1,delta1)*pu1(lambda1) + d_(delta1,lambda1)*pu2(beta1) + d_(lambda1,beta1)*pu3(delta1) )*f(i1,j2,i3)*( d_(alpha1,rho1)*pu4(gamma1) + d_(rho1,gamma1)*pu5(alpha1) + d_(gamma1,alpha1)*pu6(rho1) )*( -d_(lambda1,rho1) + (p1(lambda1)*q2(rho1) + q2(lambda1)*p1(rho1))/(u/2));
id ds = f(i2,j1,i1)*( d_(beta,lambda)*ps1(alpha) + d_(lambda,alpha)*ps2(beta) + d_(alpha,beta)*ps3(lambda) )*f(i4,j1,i3)*( d_(gamma,delta)*ps4(rho) + d_(delta,rho)*ps5(gamma) + d_(rho,gamma)*ps6(delta) )*( -d_(lambda,rho) + (p1(lambda)*q3(rho) + q3(lambda)*p1(rho))/(s/2));
id ds1 = f(i2,j2,i1)*( d_(beta1,lambda1)*ps1(alpha1) + d_(lambda1,alpha1)*ps2(beta1) + d_(alpha1,beta1)*ps3(lambda1) )*f(i4,j2,i3)*( d_(gamma1,delta1)*ps4(rho1) + d_(delta1,rho1)*ps5(gamma1) + d_(rho1,gamma1)*ps6(delta1) )*( -d_(lambda1,rho1) + (p1(lambda1)*q3(rho1) + q3(lambda1)*p1(rho1))/(s/2));



id pt1 = p1 + p3;
id pt2 = -p3 + q1;
id pt3 = -q1 - p1;
id pt4 = p2 - q4;
id pt5 = q4 + p4;
id pt6 = -p4 - p2;
.sort

id pu1 = p1 + p4;
id pu2 = -p4 + q2;
id pu3 = -q2 - p1;
id pu4 = p2 - q5;
id pu5 = q5 + p3;
id pu6 = -p3 - p2;
.sort

id ps1 = p1 + q3;
id ps2 = -q3 - p2;
id ps3 = p2 - p1;
id ps4 = -p3 + p4;
id ps5 = -p4 - q6;
id ps6 = q6 + p3;
.sort

id q1 = p1 - p3;
id q2 = p1 - p4;
id q3 = p1 + p2;
id q4 = p1 - p3;
id q5 = p1 - p4;
id q6 = p1 + p2;
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

#call color

id NA = 4;
id cA = 3;
.sort

print;
b e,t,s,u;
.end
