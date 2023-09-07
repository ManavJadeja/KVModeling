function [Xn1] = RK4(dynamics, t, dt, Xn0, varargin)
%{
disp('DYNAMICS')
disp(dynamics)
disp('TIME')
disp(t)
disp('DT')
disp(dt)
disp('STATE')
disp(Xn0)
disp('ARG IN')
disp(varargin{:})
%}
k1 = dynamics(t,        Xn0,          varargin{:});
k2 = dynamics(t+dt/2,   Xn0+dt*k1/2,  varargin{:});
k3 = dynamics(t+dt/2,   Xn0+dt*k2/2,  varargin{:});
k4 = dynamics(t+dt,     Xn0+dt*k3,    varargin{:});

Xn1 = Xn0 + dt*(k1 + 2*k2 + 2*k3 + k4)/6;

end