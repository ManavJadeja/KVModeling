classdef vehicle < handle
    %VEHICLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        time
        dt
        
        mass
        latitude
        
        stateI
        stateS
        
        h
    end
    
    methods
        function obj = vehicle(time, dt, mass, latitude, stateI)
            %%% VEHICLE
            %   	Create a vehicle
            obj.time = time;
            obj.dt = dt;
            
            obj.mass = mass;
            obj.latitude = latitude;
            
            obj.stateI = stateI;
            obj.stateS = zeros(length(time), length(stateI));
        end
        
        function [dState] = vehicleDynamics(obj, t, state, a)
            %%% vehicleDynamics
            %       Function with vehicle system dynamics

            dState = zeros(1, length(obj.stateI));
            dState(1:6) = EOM(t, state, obj.mass, obj.latitude);
        end
            
        function [] = simulate(obj)
            %%% simulate
            %   	Simulate system dynamics
            
            obj.stateS(1,:) = obj.stateI;
            
            for a = 1:length(obj.time)-1
                obj.stateS(a+1,:) = RK4(@obj.vehicleDynamics, obj.time(a), obj.dt, obj.stateS(a,:), a);
            end
            
        end
    end
end

