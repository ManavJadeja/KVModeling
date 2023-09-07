disp('Start')

% TIME SPAN
dt = 1e-3;
tSpan = 0:dt:10;

% VARIABLE
X0 = [1,0];
xSpan = zeros(length(tSpan), length(X0));
xSpan(1,:) = X0;

% CONSTANTS
k = 2;
m = 1;

for a = 1:length(tSpan)-1
    xSpan(a+1,:) = RK4(@eom, tSpan(a), dt, xSpan(a,:), k, m);
end

figure(1)
plot(tSpan, xSpan(:,1))

figure(2)
plot(tSpan, xSpan(:,1) - (cos(tSpan.*sqrt(k/m)))')

disp('Done')