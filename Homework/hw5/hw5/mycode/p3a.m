X = load('data/faces.txt');
%img = reshape(X(2,:),[24 24]);
%imagesc(img); axis square; colormap gray;
mu = mean(X);
X0 = X - repmat(mu, size(X,1), 1);

errors = [];
for k=1:10,
    [U,S,V] = svds(X0,k);
    W = U*S;
    Xs = W*V';
    errors = [errors mean(mean((X0-Xs).^2))];
end

plot(1:10, errors, '-o');