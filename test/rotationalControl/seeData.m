%%% PLOTTING DATA

figure('Name', 'Quaternion Data', 'Position', [100 100 900 700]);
t = BLOCK.tSpan;

% QUATERNION 1
subplot(2,2,1)
plot(t, BLOCK.stateS(:,1))
title('q1')
hold on
plot(t, BLOCK.qd(:,1))
hold off

% QUATERNION 2
subplot(2,2,2)
plot(t, BLOCK.stateS(:,2))
title('q2')
hold on
plot(t, BLOCK.qd(:,2))
hold off

% QUATERNION 3
subplot(2,2,3)
plot(t, BLOCK.stateS(:,3))
title('q3')
hold on
plot(t, BLOCK.qd(:,3))
hold off

% QUATERNION 4
subplot(2,2,4)
plot(t, BLOCK.stateS(:,4))
title('q4')
hold on
plot(t, BLOCK.qd(:,4))
hold off
