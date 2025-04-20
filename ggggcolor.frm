#include color.h
AutoDeclare Index i,j,k;
CFunction acc;
Symbol x;
.global

* Define gamma indices and functions
s s,t,u,e;
i alpha,beta,gamma,delta,lambda,rho,alpha1,beta1,gamma1,delta1,lambda1,rho1;
*Define differnet tensors
ct t1,t2,t3,t4,t5,t6,t7;
ct d4,d41,dt,dt1,du,du1,ds,ds1;
ct gt1,gt2,gt3,gt32,gt4,gt5,gt6,gt7;
ct gt11,gt21,gt31,gt321,gt41,gt51,gt61,gt71;
ct gu1,gu2,gu3,gu32,gu4,gu5,gu6,gu7;
ct gu11,gu21,gu31,gu321,gu41,gu51,gu61,gu71;
ct gs1,gs2,gs3,gs32,gs4,gs5,gs6,gs7;
ct gs11,gs21,gs31,gs321,gs41,gs51,gs61,gs71;
*Define differnet momenta
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

*4 point interaction and iterferance terms
l ansm44 = (2/4)*(1/64)*t1*d4*d41;
l ansm4t = (2/4)*(1/64)*(1/t)*t1*d41*dt;
l ansmt4 = (2/4)*(1/64)*(1/t)*t1*d4*dt1;
l ansm4u = (2/4)*(1/64)*(1/u)*t1*d41*du;
l ansmu4 = (2/4)*(1/64)*(1/u)*t1*d4*du1;
l ansm4s = (2/4)*(1/64)*(1/s)*t1*d41*ds;
l ansms4 = (2/4)*(1/64)*(1/s)*t1*d4*ds1;
.sort

*t^2 amplitude
l anstt = (2/4)*(1/64)*(1/t^2)*t1*dt*dt1;
l ansgt1gt11 = 2*(2/4)*(1/64)*(1/t^2)*gt1*gt11*t4;
l ansgt2gt21 = 2*(2/4)*(1/64)*(1/t^2)*gt2*gt21*t5;
l ansgt3gt31 = 2*(2/4)*(1/64)*(1/t^2)*gt3*gt31;
l ansgt32gt321 = 2*(2/4)*(1/64)*(1/t^2)*gt32*gt321;
l ansgt4gt41 = 2*(2/4)*(1/64)*(1/t^2)*gt4*gt41*t7;
l ansgt5gt51 = 2*(2/4)*(1/64)*(1/t^2)*gt5*gt51*t2;
l ansgt6gt61 = 2*(2/4)*(1/64)*(1/t^2)*gt6*gt61*t3;
l ansgt7gt71 = 2*(2/4)*(1/64)*(1/t^2)*gt7*gt71*t6;

l ansmtt = (anstt - ansgt1gt11 - ansgt2gt21 + ansgt3gt31 + ansgt32gt321 - ansgt4gt41 - ansgt5gt51 - ansgt6gt61 - ansgt7gt71);
.sort

*u^2 amplitude
l ansuu = (2/4)*(1/64)*(1/u^2)*t1*du*du1;
l ansgu1gu11 = 2*(2/4)*(1/64)*(1/u^2)*gu1*gu11*t3;
l ansgu2gu21 = 2*(2/4)*(1/64)*(1/u^2)*gu2*gu21*t6;
l ansgu3gu31 = 2*(2/4)*(1/64)*(1/u^2)*gu3*gu31;
l ansgu32gu321 = 2*(2/4)*(1/64)*(1/u^2)*gu32*gu321;
l ansgu4gu41 = 2*(2/4)*(1/64)*(1/u^2)*gu4*gu41*t7;
l ansgu5gu51 = 2*(2/4)*(1/64)*(1/u^2)*gu5*gu51*t2;
l ansgu6gu61 = 2*(2/4)*(1/64)*(1/u^2)*gu6*gu61*t4;
l ansgu7gu71 = 2*(2/4)*(1/64)*(1/u^2)*gu7*gu71*t5;

l ansmuu = (ansuu - ansgu1gu11 - ansgu2gu21 + ansgu3gu31 + ansgu32gu321 - ansgu4gu41 - ansgu5gu51 - ansgu6gu61 - ansgu7gu71);
.sort

*s^2 amplitude 
l ansss = (2/4)*(1/64)*(1/s^2)*t1*ds*ds1;
l ansgs1gs11 = 2*(2/4)*(1/64)*(1/s^2)*gs1*gs11*t7;
l ansgs2gs21 = 2*(2/4)*(1/64)*(1/s^2)*gs2*gs21*t2;
l ansgs3gs31 = 2*(2/4)*(1/64)*(1/s^2)*gs3*gs31;
l ansgs32gs321 = 2*(2/4)*(1/64)*(1/s^2)*gs32*gs321;
l ansgs4gs41 = 2*(2/4)*(1/64)*(1/s^2)*gs4*gs41*t5;
l ansgs5gs51 = 2*(2/4)*(1/64)*(1/s^2)*gs5*gs51*t4;
l ansgs6gs61 = 2*(2/4)*(1/64)*(1/s^2)*gs6*gs61*t3;
l ansgs7gs71 = 2*(2/4)*(1/64)*(1/s^2)*gs7*gs71*t6;

l ansmss = (ansss - ansgs1gs11 - ansgs2gs21 + ansgs3gs31 + ansgs32gs321 - ansgs4gs41 - ansgs5gs51 - ansgs6gs61 - ansgs7gs71);
.sort

*ut amplitude
l anstu = (2/4)*(1/64)*(1/(t*u))*t1*dt1*du;
l ansut = (2/4)*(1/64)*(1/(t*u))*t1*dt*du1;
l ansgt1gu6 = 2*(2/4)*(1/64)*(1/(t*u))*t4*gt11*gu6;
l ansgu6gt1 = 2*(2/4)*(1/64)*(1/(t*u))*t4*gt1*gu61;
l ansgt2gu7 = 2*(2/4)*(1/64)*(1/(t*u))*t5*gt21*gu7;
l ansgu7gt2 = 2*(2/4)*(1/64)*(1/(t*u))*t5*gt2*gu71;
l ansgt3gu3 = 2*(2/4)*(1/64)*(1/(t*u))*gt31*gu3;
l ansgu3gt3 = 2*(2/4)*(1/64)*(1/(t*u))*gt3*gu31;
l ansgt4gu4 = 2*(2/4)*(1/64)*(1/(t*u))*t7*gt41*gu4;
l ansgu4gt4 = 2*(2/4)*(1/64)*(1/(t*u))*t7*gt4*gu41;
l ansgt5gu5 = 2*(2/4)*(1/64)*(1/(t*u))*t2*gt51*gu5;
l ansgu5gt5 = 2*(2/4)*(1/64)*(1/(t*u))*t2*gt5*gu51;
l ansgt6gu1 = 2*(2/4)*(1/64)*(1/(t*u))*t3*gt61*gu1;
l ansgu1gt6 = 2*(2/4)*(1/64)*(1/(t*u))*t3*gt6*gu11;
l ansgt7gu2 = 2*(2/4)*(1/64)*(1/(t*u))*t6*gt71*gu2;
l ansgu2gt7 = 2*(2/4)*(1/64)*(1/(t*u))*t6*gt7*gu21;

l ansmtu = anstu + ansut - ansgt1gu6 - ansgu6gt1 - ansgt2gu7 - ansgu7gt2 - ansgt3gu3 - ansgu3gt3 - ansgt4gu4 - ansgu4gt4 - ansgt5gu5 - ansgu5gt5 - ansgt6gu1 - ansgu1gt6 - ansgt7gu2 - ansgu2gt7;

*st amplitude
l ansst = (2/4)*(1/64)*(1/(t*s))*t1*ds1*dt;
l ansts = (2/4)*(1/64)*(1/(t*s))*t1*ds*dt1;
l ansgs1gt6 = 2*(2/4)*(1/64)*(1/(t*s))*t7*gs11*gt4;
l ansgt6gs1 = 2*(2/4)*(1/64)*(1/(t*s))*t7*gs1*gt41;
l ansgs2gt7 = 2*(2/4)*(1/64)*(1/(t*s))*t2*gs21*gt5;
l ansgt7gs2 = 2*(2/4)*(1/64)*(1/(t*s))*t2*gs2*gt51;
l ansgs3gt3 = 2*(2/4)*(1/64)*(1/(t*s))*gs31*gu3;
l ansgt3gs3 = 2*(2/4)*(1/64)*(1/(t*s))*gs3*gu31;
l ansgs4gt4 = 2*(2/4)*(1/64)*(1/(t*s))*t5*gs41*gt2;
l ansgt4gs4 = 2*(2/4)*(1/64)*(1/(t*s))*t5*gs4*gt21;
l ansgs5gt5 = 2*(2/4)*(1/64)*(1/(t*s))*t4*gs51*gt1;
l ansgt5gs5 = 2*(2/4)*(1/64)*(1/(t*s))*t4*gs5*gt11;
l ansgs6gt1 = 2*(2/4)*(1/64)*(1/(t*s))*t3*gs61*gt6;
l ansgt1gs6 = 2*(2/4)*(1/64)*(1/(t*s))*t3*gs6*gt61;
l ansgs7gt2 = 2*(2/4)*(1/64)*(1/(t*s))*t6*gs71*gt7;
l ansgt2gs7 = 2*(2/4)*(1/64)*(1/(t*s))*t6*gs7*gt71;

l ansmst = ansst + ansts - ansgs1gt6 - ansgt6gs1 - ansgs2gt7 - ansgt7gs2 - ansgs3gt3 - ansgt3gs3 - ansgs4gt4 - ansgt4gs4 - ansgs5gt5 - ansgt5gs5 - ansgs6gt1 - ansgt1gs6 - ansgs7gt2 - ansgt2gs7;

*su amplitude
l anssu = (2/4)*(1/64)*(1/(s*u))*t1*ds1*du;
l ansus = (2/4)*(1/64)*(1/(s*u))*t1*ds*du1;
l ansgs1gu6 = 2*(2/4)*(1/64)*(1/(s*u))*t7*gs11*gu4;
l ansgu6gs1 = 2*(2/4)*(1/64)*(1/(s*u))*t7*gs1*gu41;
l ansgs2gu7 = 2*(2/4)*(1/64)*(1/(s*u))*t2*gs21*gu5;
l ansgu7gs2 = 2*(2/4)*(1/64)*(1/(s*u))*t2*gs2*gu51;
l ansgs3gu3 = 2*(2/4)*(1/64)*(1/(s*u))*gs31*gu3;
l ansgu3gs3 = 2*(2/4)*(1/64)*(1/(s*u))*gs3*gu31;
l ansgs4gu4 = 2*(2/4)*(1/64)*(1/(s*u))*t5*gs41*gu7;
l ansgu4gs4 = 2*(2/4)*(1/64)*(1/(s*u))*t5*gs4*gu71;
l ansgs5gu5 = 2*(2/4)*(1/64)*(1/(s*u))*t4*gs51*gu6;
l ansgu5gs5 = 2*(2/4)*(1/64)*(1/(s*u))*t4*gs5*gu61;
l ansgs6gu1 = 2*(2/4)*(1/64)*(1/(s*u))*t3*gs61*gu1;
l ansgu1gs6 = 2*(2/4)*(1/64)*(1/(s*u))*t3*gs6*gu11;
l ansgs7gu2 = 2*(2/4)*(1/64)*(1/(s*u))*t6*gs71*gu2;
l ansgu2gs7 = 2*(2/4)*(1/64)*(1/(s*u))*t6*gs7*gu21;

l ansmsu = anssu + ansus - ansgs1gu6 - ansgu6gs1 - ansgs2gu7 - ansgu7gs2 - ansgs3gu3 - ansgu3gs3 - ansgs4gu4 - ansgu4gs4 - ansgs5gu5 - ansgu5gs5 - ansgs6gu1 - ansgu1gs6 - ansgs7gu2 - ansgu2gs7;

*final answer
l ans = ansm44 + ansmtt+ ansm4t + ansmt4 + ansmuu+ ansm4u + ansmu4 + ansmss + ansm4s + ansms4 + ansmtu + ansmst + ansmsu;
.sort

*id s =(p1+p2)^2 = p1.p1 + p2.p2 + 2*p1.p2
*id t =(p1-p3)^2 = p1.p1 + p3.p3 - 2*p1.p3
*id u =(p1-p4)^2 = p1.p1 + p4.p4 - 2*p1.p4
*id q = (p1+p2); q.q = s;
*contract;

*Define differnet polarization sums
id t1 = ( -d_(alpha,alpha1) )*( -d_(beta,beta1) )*( -d_(gamma,gamma1) )*( -d_(delta,delta1) );
id t2 = d_(alpha,alpha1)*d_(beta,beta1);
id t3 = d_(alpha,alpha1)*d_(gamma,gamma1);
id t4 = d_(alpha,alpha1)*d_(delta,delta1);
id t5 = d_(beta,beta1)*d_(gamma,gamma1);
id t6 = d_(beta,beta1)*d_(delta,delta1);
id t7 = d_(gamma,gamma1)*d_(delta,delta1);
.sort

*Define differnet diagrams
id d4 = f(i1,i2,j1)*f(i3,i4,j1)*(d_(alpha,gamma)*d_(beta,delta) - d_(alpha,delta)*d_(beta,gamma)) + f(i1,i3,j1)*f(i2,i4,j1)*(d_(alpha,beta)*d_(gamma,delta) - d_(alpha,delta)*d_(beta,gamma)) + f(i1,i4,j1)*f(i3,i2,j1)*(d_(alpha,gamma)*d_(beta,delta) - d_(alpha,beta)*d_(gamma,delta));
id d41 = f(i1,i2,j2)*f(i3,i4,j2)*(d_(alpha1,gamma1)*d_(beta1,delta1) - d_(alpha1,delta1)*d_(beta1,gamma1)) + f(i1,i3,j2)*f(i2,i4,j2)*(d_(alpha1,beta1)*d_(gamma1,delta1) - d_(alpha1,delta1)*d_(beta1,gamma1)) + f(i1,i4,j2)*f(i3,i2,j2)*(d_(alpha1,gamma1)*d_(beta1,delta1) - d_(alpha1,beta1)*d_(gamma1,delta1));
id dt = f(i2,i3,j1)*( d_(beta,gamma)*pt1(lambda) + d_(gamma,lambda)*pt2(beta) + d_(lambda,beta)*pt3(gamma) )*f(i1,j1,i4)*( d_(alpha,rho)*pt4(delta) + d_(rho,delta)*pt5(alpha) + d_(delta,alpha)*pt6(rho) )*d_(lambda,rho);
id dt1 = f(i2,i3,j2)*( d_(beta1,gamma1)*pt1(lambda1) + d_(gamma1,lambda1)*pt2(beta1) + d_(lambda1,beta1)*pt3(gamma1) )*f(i1,j2,i4)*( d_(alpha1,rho1)*pt4(delta1) + d_(rho1,delta1)*pt5(alpha1) + d_(delta1,alpha1)*pt6(rho1) )*d_(lambda1,rho1);
id du = f(i2,i4,j1)*( d_(beta,delta)*pu1(lambda) + d_(delta,lambda)*pu2(beta) + d_(lambda,beta)*pu3(delta) )*f(i1,j1,i3)*( d_(alpha,rho)*pu4(gamma) + d_(rho,gamma)*pu5(alpha) + d_(gamma,alpha)*pu6(rho) )*d_(lambda,rho);
id du1 = f(i2,i4,j2)*( d_(beta1,delta1)*pu1(lambda1) + d_(delta1,lambda1)*pu2(beta1) + d_(lambda1,beta1)*pu3(delta1) )*f(i1,j2,i3)*( d_(alpha1,rho1)*pu4(gamma1) + d_(rho1,gamma1)*pu5(alpha1) + d_(gamma1,alpha1)*pu6(rho1) )*d_(lambda1,rho1);
id ds = f(i2,j1,i1)*( d_(beta,lambda)*ps1(alpha) + d_(lambda,alpha)*ps2(beta) + d_(alpha,beta)*ps3(lambda) )*f(i4,j1,i3)*( d_(gamma,delta)*ps4(rho) + d_(delta,rho)*ps5(gamma) + d_(rho,gamma)*ps6(delta) )*d_(lambda,rho);
id ds1 = f(i2,j2,i1)*( d_(beta1,lambda1)*ps1(alpha1) + d_(lambda1,alpha1)*ps2(beta1) + d_(alpha1,beta1)*ps3(lambda1) )*f(i4,j2,i3)*( d_(gamma1,delta1)*ps4(rho1) + d_(delta1,rho1)*ps5(gamma1) + d_(rho1,gamma1)*ps6(delta1) )*d_(lambda1,rho1);
.sort

*Define t channel ghost contribution
id gt1 = f(i3,j1,i2)*p3(lambda)*d_(lambda,rho)*f(i1,j1,i4)*( d_(alpha,rho)*pt4(delta) + d_(rho,delta)*pt5(alpha) + d_(delta,alpha)*pt6(rho) );
id gt11 = f(i3,j2,i2)*p1(lambda1)*d_(lambda1,rho1)*f(i1,j2,i4)*( d_(alpha1,rho1)*pt4(delta1) + d_(rho1,delta1)*pt5(alpha1) + d_(delta1,alpha1)*pt6(rho1) );
id gt2 = f(i2,i3,j1)*( d_(beta,gamma)*pt1(lambda) + d_(gamma,lambda)*pt2(beta) + d_(lambda,beta)*pt3(gamma) )*d_(lambda,rho)*f(i1,j1,i4)*p4(rho);
id gt21 = f(i2,i3,j2)*( d_(beta1,gamma1)*pt1(lambda1) + d_(gamma1,lambda1)*pt2(beta1) + d_(lambda1,beta1)*pt3(gamma1) )*d_(lambda1,rho1)*f(i1,j2,i4)*p2(rho1);
id gt3 = f(i3,j1,i2)*p3(lambda)*d_(lambda,rho)*f(i1,j1,i4)*p4(rho);
id gt32 = f(i3,j1,i2)*p1(lambda)*d_(lambda,rho)*f(i1,j1,i4)*p4(rho);
id gt31 = f(i3,j2,i2)*p1(lambda1)*d_(lambda1,rho1)*f(i1,j2,i4)*p2(rho1);
id gt321 = f(i3,j2,i2)*p3(lambda1)*d_(lambda1,rho1)*f(i1,j2,i4)*p2(rho1);
id gt4 = f(i2,i3,j1)*q1(gamma)*f(j1,i4,i1)*p2(delta);
id gt41 = f(i2,i3,j2)*p1(gamma1)*f(j2,i4,i1)*q1(delta1);
id gt5  = f(j1,i2,i3)*p3(beta)*f(i4,i1,j1)*q1(alpha);
id gt51  = f(j2,i2,i3)*q1(beta1)*f(i4,i1,j2)*p4(alpha1);
id gt6 = f(i2,i3,j1)*q1(gamma)*f(i4,i1,j1)*p4(alpha);
id gt61 = f(i2,i3,j2)*p1(gamma1)*f(i4,i1,j2)*q1(alpha1);
id gt7 = f(j1,i2,i3)*p3(beta)*f(j1,i4,i1)*q1(delta);
id gt71 = f(j2,i2,i3)*q1(beta1)*f(j2,i4,i1)*p2(delta1);
.sort

*Define u channel ghost contribution
id gu1 = f(i4,j1,i2)*p4(lambda)*d_(lambda,rho)*f(i1,j1,i3)*( d_(alpha,rho)*pu4(gamma) + d_(rho,gamma)*pu5(alpha) + d_(gamma,alpha)*pu6(rho) );
id gu11 = f(i4,j2,i2)*p1(lambda1)*d_(lambda1,rho1)*f(i1,j2,i3)*( d_(alpha1,rho1)*pu4(gamma1) + d_(rho1,gamma1)*pu5(alpha1) + d_(gamma1,alpha1)*pu6(rho1) );
id gu2 = f(i2,i4,j1)*( d_(beta,delta)*pu1(lambda) + d_(delta,lambda)*pu2(beta) + d_(lambda,beta)*pu3(delta) )*d_(lambda,rho)*f(i1,j1,i3)*p3(rho);
id gu21 = f(i2,i4,j2)*( d_(beta1,delta1)*pu1(lambda1) + d_(delta1,lambda1)*pu2(beta1) + d_(lambda1,beta1)*pu3(delta1) )*d_(lambda1,rho1)*f(i1,j2,i3)*p2(rho1);
id gu3 = f(i4,j1,i2)*p4(lambda)*d_(lambda,rho)*f(i1,j1,i3)*p3(rho);
id gu32 = f(i4,j1,i2)*p1(lambda)*d_(lambda,rho)*f(i1,j1,i3)*p3(rho);
id gu31 = f(i4,j2,i2)*p1(lambda1)*d_(lambda1,rho1)*f(i1,j2,i3)*p2(rho1);
id gu321 = f(i4,j2,i2)*p4(lambda1)*d_(lambda1,rho1)*f(i1,j2,i3)*p2(rho1);
id gu4 = f(i2,i4,j1)*q2(delta)*f(j1,i3,i1)*p2(gamma);
id gu41 = f(i2,i4,j2)*p1(delta1)*f(j2,i3,i1)*q2(gamma1);
id gu5  = f(j1,i2,i4)*q2(beta)*f(i3,i1,j1)*p3(alpha);
id gu51  = f(j2,i2,i4)*p4(beta1)*f(i3,i1,j2)*q2(alpha1);
id gu6 = f(i2,i4,j1)*q2(delta)*f(i3,i1,j1)*p3(alpha);
id gu61 = f(i2,i4,j2)*p1(delta1)*f(i3,i1,j2)*q2(alpha1);
id gu7 = f(j1,i2,i4)*p4(beta)*f(j1,i3,i1)*q2(gamma);
id gu71 = f(j2,i2,i4)*q2(beta1)*f(j2,i3,i1)*p2(gamma1);
.sort

*Define s channel ghost contribution
id gs1 = f(i2,j1,i1)*p2(lambda)*d_(lambda,rho)*f(i4,j1,i3)*( d_(gamma,delta)*ps4(rho) + d_(delta,rho)*ps5(gamma) + d_(rho,gamma)*ps6(delta) );
id gs11 = f(i2,j2,i1)*p1(lambda1)*d_(lambda1,rho1)*f(i4,j2,i3)*( d_(gamma1,delta1)*ps4(rho1) + d_(delta1,rho1)*ps5(gamma1) + d_(rho1,gamma1)*ps6(delta1) );
id gs2 = f(i2,j1,i1)*( d_(beta,lambda)*ps1(alpha) + d_(lambda,alpha)*ps2(beta) + d_(alpha,beta)*ps3(lambda) )*d_(lambda,rho)*f(i4,j1,i3)*p3(rho);
id gs21 = f(i2,j2,i1)*( d_(beta1,lambda1)*ps1(alpha1) + d_(lambda1,alpha1)*ps2(beta1) + d_(alpha1,beta1)*ps3(lambda1) )*d_(lambda1,rho1)*f(i4,j2,i3)*p4(rho1);
id gs3 = f(i2,j1,i1)*p2(lambda)*d_(lambda,rho)*f(i4,j1,i3)*p3(rho);
id gs32 = f(i2,j1,i1)*p1(lambda)*d_(lambda,rho)*f(i4,j1,i3)*p3(rho);
id gs31 = f(i2,j2,i1)*p1(lambda1)*d_(lambda1,rho1)*f(i4,j2,i3)*p4(rho1);
id gs321 = f(i2,j2,i1)*p2(lambda1)*d_(lambda1,rho1)*f(i4,j2,i3)*p4(rho1);
id gs4 = f(i1,i2,j1)*q3(beta)*f(j1,i3,i4)*p4(gamma);
id gs41 = f(i1,i2,j2)*p2(beta1)*f(j2,i3,i4)*q3(gamma1);
id gs5  = f(j1,i1,i2)*q3(alpha)*f(i3,i4,j1)*p3(delta);
id gs51  = f(j2,i1,i2)*p1(alpha1)*f(i3,i4,j2)*q3(delta1);
id gs6 = f(j1,i1,i2)*q3(alpha)*f(j1,i3,i4)*p4(gamma);
id gs61 = f(j2,i1,i2)*p1(alpha1)*f(j2,i3,i4)*q3(gamma1);
id gs7 = f(i1,i2,j1)*q3(beta)*f(i3,i4,j1)*p3(delta);
id gs71 = f(i1,i2,j2)*p2(beta1)*f(i3,i4,j2)*q3(delta1);
.sort

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

id q1 = p4 - p2;
id q2 = p3 - p2;
id q3 = p3 + p4;
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
