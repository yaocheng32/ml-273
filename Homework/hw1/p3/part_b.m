% 3(b): For each feature, plot a histogram (?hist?) of the data values
for i=1:size(X,2)
    figure(i);
    hist(X(:,i));
    title(sprintf('Feature %d', i), 'FontSize', 16);
    fname = sprintf('f%d.png', i);
    print(fname, '-dpng');
    close all;
end;