classdef vehicle < handle
    %%% VEHICLE
    
    properties
        tSpan           % TIME SPANE
        dt              % TIME STEP
        
        mass            % MASS
        latitude        % LATITUDE (deg)
        
        stateI          % INITIAL STATE VECTOR
        stateS          % SIMULATED STATE VECTOR
        
        h
    end
    
    methods
        function obj = vehicle(tSpan, dt, mass, latitude, stateI)
            %%% VEHICLE
            %       Create a vehicle
            
            obj.tSpan = tSpan;
            obj.dt = dt;
            
            obj.mass = mass;
            obj.latitude = latitude;
            
            obj.stateI = stateI;
            obj.stateS = zeros(length(tSpan), length(stateI));
            
        end
        
        function [dState] = vehicleDynamics(obj, t, state, a)
            %%% vehicleDynamics
            %       Vehicle system dynamics
            
            disp('OBJ')
            disp(obj)
            disp('TIME')
            disp(t)
            disp('STATE')
            disp(state)
            disp('INDEX')
            disp(a)
            
            dState = zeros(1, length(obj.stateI));
            dState(1:6) = gravityEOM(t, state, obj.mass, obj.latitude);
            %             gravityEOM(t, X, m, latitude)
        end
        
        function [] = simulate(obj)
            %%% simulate
            %       Simulate system dynamics
        
            obj.stateS(1,:) = obj.stateI;
        
            for a = 1:length(obj.tSpan)-1
                obj.stateS(a+1,:) = RK4(@obj.vehicleDynamics, obj.tSpan(a), obj.dt, obj.stateS(a,:), a);
                %                   RK4(dynamics,                 t,        dt,         Xn0,         varargin)
            end
        
        
        
        
        end
        
        
        
        
        
    end
end

