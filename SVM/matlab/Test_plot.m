x = 100 * rand(100, 1);
y = 2 * x + 1;

figure(1);
subplot(1, 2, 1);
plot(x, y);

subplot(1, 2, 2);
gscatter(x, y);

hold on;
axis equal;
hold off;