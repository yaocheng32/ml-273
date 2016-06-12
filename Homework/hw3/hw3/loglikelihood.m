function ll = loglikelihood(X, y, wts, reg)
    n = size(X,1);
    s = sigmoid(X*wts');
    ll = 1/n * ( (-y)' * log(s+.00000001) - (1-y)' * log(1-s+.00000001) ) + reg * wts * wts';
end