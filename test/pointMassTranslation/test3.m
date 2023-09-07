disp('Start')

% TIME SPAN
dt = 1e-2;
tSpan = 0:dt:80;

% PARAMETERS
latitude = 45; % North Pole
m = 50;
X0 = [0 0 0 0 0 400];

% VEHICLE
VEHICLE = vehicle(tSpan, dt, m, latitude, X0);

% SOLUTION
VEHICLE.simulate();

% PLOTTING
figure('Name', 'Cartesian Position', 'Position', [400 100 1200 400])

subplot(1,3,1)
plot(tSpan, VEHICLE.stateS(:,1))
title('X Position (East)')
subplot(1,3,2)
plot(tSpan, VEHICLE.stateS(:,2))
title('Y Position (North)')
subplot(1,3,3)
plot(tSpan, VEHICLE.stateS(:,3))
title('Z Position (Up)')


disp('Done')