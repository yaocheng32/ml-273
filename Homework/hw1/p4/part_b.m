plot(X(:,1), X(:,3), 'o');
hold on;
ax = axis();
xv = ax(1):.01:ax(2);
yv = 1.5 * (xv - 3);
plot(xv, yv, 'LineWidth', 3, 'Color', 'r');
fname = 'plot.png';
print(fname, '-dpng');
close all;