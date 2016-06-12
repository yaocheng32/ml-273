for ind = 1:6,
    figure;
    alpha = 2*median(abs(W(:,ind)));
    img = reshape(mu+alpha*V(:,ind)',[24 24]);
    imagesc(img); axis square; colormap gray;
end
