classdef block < handle
    %BLOCK Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        state0
        stateS
        inertia
        qd
        K
        dt
        tSpan
        
        vertices
        faces
        color
        
        h
    end
    
    methods
        function obj = block(state0, dt, tSpan, inertia, qd, K, vertices, faces, color)
            %BLOCK Construct an instance of this class
            %   Detailed explanation goes here
            obj.state0 = state0;
            obj.dt = dt;
            obj.tSpan = tSpan;
            obj.inertia = inertia;
            obj.qd = qd;
            obj.K = K;
            
            obj.vertices = vertices;
            obj.faces = faces;
            obj.color = color;
            
            obj.draw();
        end
        
        function [dX] = dynamics(obj, t, X, I, qd, K)
            
            q = X(1:4);
            w = X(5:7);
            
            T = quatETC(q, qd, w, K);
            
            dq = -pq([0,w], q)/2;
            dw = I\(-1*cartesianCrossProduct(w', I*w') + T)';
            
            dX = [dq', dw'];
        end
        
        function [] = simulate(obj)
            obj.stateS = zeros(length(obj.tSpan), length(obj.state0));
            obj.stateS(1,:) = obj.state0;
            for a = 1:length(obj.tSpan)-1
                obj.stateS(a+1,:) = RK4(@obj.dynamics, obj.tSpan(a), obj.dt, obj.stateS(a,:), obj.inertia, obj.qd(a,:), obj.K);
            end
        end
        
        function [] = animate(obj)
            xlim([-8 8])
            ylim([-8 8])
            zlim([-8 8])
            
            for i = 1:length(obj.tSpan)
                rotmat = q2a(obj.stateS(i, 1:4));
                obj.updateAttitude(rotmat)
                title(num2str(obj.tSpan(i), '%.2f'))
                drawnow;
            end
        end
        
        function [] = updateAttitude(obj, rotmat)
            vNew = (rotmat*obj.vertices')';
            set(obj.h, 'Vertices', vNew);
        end
        
        function [] = draw(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.h = patch('Faces', obj.faces, 'Vertices', obj.vertices,...
                'FaceColor', obj.color);
            view(45,20)
            
            axis equal
            grid on
            rotate3d on
        end
    end
end

