load discrim;
figure;
gscatter(ratings(:,1), ratings(:,2), group, 'br', 'xo');
xlabel('climate');
ylabel('housing');