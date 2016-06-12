colors = ['b', 'r', 'g']; % blue: class 0, red: class 1, green: class 2
hold on;
for i=0:2,
    scatter(Xtr(find(Ytr==i),1), Xtr(find(Ytr==i),2), 300, colors(i+1), '.');
end;