% 3(f): For each pair of features (1,2), (1,3), and (1,4), plot a 
% scatterplot (?plot?) of the feature values, colored according to 
% their target value (class). (For example, plot all data points with 
% y = 0 as blue, y = 1 as green, etc.) You may find the commands ?find?
% and ?hold on? useful for this. Alternatively, the command ?scatter? 
% may be useful.
colors = ['b', 'r', 'g'];
for i = 2:4,
    for j = 0:2,
        target = X(find(iris(:,5) == j), :);
        scatter(target(:,1), target(:,i), 40, ...
            'MarkerFaceColor', colors(j+1), 'MarkerEdgeColor', 'k');
        hold on;
    end;
    xlabel('Feature 1', 'FontSize', 16);
    ylabel(sprintf('Feature %d', i), 'FontSize', 16);
    title(sprintf('Features 1 & %d', i), 'FontSize', 20);
    fname = sprintf('1%d.png', i);
    print(fname, '-dpng');
    close all;
end;