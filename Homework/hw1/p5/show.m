hist(dist(X(1,:), X), 20);
fname = sprintf('plot.png');
print(fname, '-dpng');
close all;