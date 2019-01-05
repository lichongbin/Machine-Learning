addpath('../../datasets/');

[X, y] = LoadIris();

sepal_length = X(1:100, 1);
sepal_width = X(1:100, 2);

X = [sepal_length, sepal_width];
y = y(1:100);


y(1:50) = 1;
y(51:100) = -1;

[alpha, b, TS] = SMO(X, y, 0.001, 0.001, 'L', [0, 1], 100, 0);

d = 0.02;
% [x1Grid, x2Grid]= meshgrid(min(sepal_length):d:max(sepal_length), ...
%                            min(sepal_width):d:max(sepal_width));

figure;
hold on;
title('Iris Dataset');
xlabel('sepal length');
ylabel('sepal width');
plot(sepal_length(1:50), sepal_width(1:50), 'r.', 'MarkerSize', 10);
plot(sepal_length(50:100), sepal_width(50:100), 'b.', 'MarkerSize', 10);
axis equal;

x1 = min(sepal_length):d:max(sepal_length);
x2 = min(sepal_width):d:max(sepal_width);

for i1 = x1
    for i2 = x2
        v = predict(X, y, alpha, b, [i1; i2]);
        if v > -0.01 && v < 0.01
            plot(i1, i2, 'g.', 'MarkerSize', 10);
        end
    end
end

hold off;
