function [X] = RK4(dynamics, t, dt, X, varargin)

%%% RK4
%       Generic 4th Order Runge-Kutta Numerical Integrator
%
%   INPUTS:
%       dynamics            Handle for System Dynamics
%       dt                  Time Step
%       X                   State Vector (step n)
%       varargin            Other Input Arguments
%
%   OUTPUTS:
%       X                   State Vector (step n+1)
%
%   Created by Manav Jadeja on 20220102
%   Heavily based on Chris Gnam

% COEFFICIENTS
k1 = dynamics(t,      X,           varargin{:});
k2 = dynamics(t+dt/2, X + dt*k1/2, varargin{:});
k3 = dynamics(t+dt/2, X + dt*k2/2, varargin{:});
k4 = dynamics(t+dt,   X + dt*k3,   varargin{:});

X = X + dt*(k1 + 2*k2 + 2*k3 + k4)/6;

end