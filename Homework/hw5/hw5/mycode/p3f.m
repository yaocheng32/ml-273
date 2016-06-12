[U,S,V] = svds(X0,50);
W = U*S;
inds = randperm(4916,2);
ks = [5 10 50];
for i=1:size(inds,2),
    ind = inds(i);
    for j=1:size(ks,2),
        k = ks(j);
        f = W(ind,1:k)*V(:,1:k)';
        figure;
        img = reshape(mu+f,[24 24]);
        imagesc(img); axis square; colormap gray;
    end
end

