function ODEsolver_QuadCopter

lambda= 1; 

t0= 0;
t1= 25;
initial_w= [0;0;0;0;0;0;lambda];

[time, sols] = ode45(@(t,w) diff_equ (t, w), ...
    [t0,t1], initial_w);

plot (time, sols(:,1));
hold on
plot (time, sols(:,2));
hold on 
plot (time,sols(:,3));
legend('x', 'y', 'z');

end jon

function dwdt = diff_equ (t, w)
x= w(1); y=w(2); z= w(3);
Vx= w(4); Vy=w(5); Vz= w(6); psi= w(7);

lambda= 1; 
theta= 0; phi= 0; tao= 1000; g= 9.8; m= 35;%grams
beta= 1.17*10^-5; %Newtons

dxdt= Vx;
dydt= Vy;
dzdt= Vz;
dvxdt= (sin(theta)*sin(psi)+cos(theta)*sin(phi)*cos(psi))*beta*tao/m;
dvydt= (cos(theta)*sin(phi)*sin(psi)-sin(theta)*cos(psi))*beta*tao/m;
dvzdt= (cos(theta)*cos(phi))*beta*tao/(m-g);
dpsidt= lambda;

dwdt= [dxdt; dydt; dzdt; dvxdt; dvydt; dvzdt; dpsidt];
end 

