% 3(e): ?Normalize? the data by subtracting the mean value from each feature, 
% and dividing by its standard deviation. (This will make the data zero-mean 
% and unit variance.) Show your code. Note: you can do this with a for-loop 
% (easy, but slow in Matlab), or in a ?vectorized? form using repmat or 
% bsxfun (faster, but harder to read).

m = mean(X,1);
s = std(X,1);
nor = bsxfun(@rdivide, X - repmat(m, size(X,1), 1), repmat(s, size(X,1), 1));