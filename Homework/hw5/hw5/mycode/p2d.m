targets = [1,15,30];
for i=1:size(targets,2),
    fprintf('Doc %d: (cluster %d)\\\\\n', targets(i), z(targets(i)));
    cl = z(targets(i));
    articles = find(z==cl);
    for j=1:min(10, size(articles,1)),
        fname = sprintf('data/text/example1/20000101.%04d.txt',articles(j));
        txt = textread(fname,'%s',10,'whitespace','\r\n'); fprintf('%d.%s\\\\\n',j, txt{1});
    end
    fprintf('\n-----------------------------------------------------------\\\\\n');
end