function D = dist(x,X)
    sq = (repmat(x, size(X,1), 1) - X).^2;
    D = sqrt(sq * ones(size(X,2),1));
end