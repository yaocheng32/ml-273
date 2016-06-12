colors = ['b', 'r', 'g']; % blue: class 0, red: class 1, green: class 2
hold on;
plotGauss2D(mean0, cov0, colors(1));
plotGauss2D(mean1, cov1, colors(2));
plotGauss2D(mean2, cov2, colors(3));