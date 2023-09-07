%%% PLOTTING DATA

% Quaternion Data
figure('Name', 'Quaternion Data', 'Position', [100 100 900 700]);
t = BLOCK.tSpan;

% Quaternion 1 (desired and actual)
subplot(2,2,1)
plot(t, BLOCK.stateS(:,1))
title('q1')
hold on
plot(t, BLOCK.qd(:,1))
hold off

% Quaternion 2 (desired and actual)
subplot(2,2,2)
plot(t, BLOCK.stateS(:,2))
title('q2')
hold on
plot(t, BLOCK.qd(:,2))
hold off

% Quaternion 3 (desired and actual)
subplot(2,2,3)
plot(t, BLOCK.stateS(:,3))
title('q3')
hold on
plot(t, BLOCK.qd(:,3))
hold off

% Quaternion 4 (desired and actual)
subplot(2,2,4)
plot(t, BLOCK.stateS(:,4))
title('q4')
hold on
plot(t, BLOCK.qd(:,4))
hold off