

% Train the SVM Classifier
c1 = fitcsvm(data3, theclass, 'KernelFunction', 'rbf', ...
    'BoxConstraint', Inf, 'ClassNames', [-1,1]);

% Predict scores over the grid
d = 0.02;
[x1Grid, x2Grid] = meshgrid(min(data3(:,1)):d:max(data3(:,1)),...
    min(data3(:,2)):d:max(data3(:,2)));
xGrid = [x1Grid(:), x2Grid(:)];
[~,scores] = predict(c1, xGrid);

% Plot the data and the decision boundary
figure;
% h(1:2) = gscatter(data3(:,1), data3(:,2), theclass, 'rb', '.');
gscatter(data3(:,1), data3(:,2), theclass, 'rb', '.');
hold on
ezpolar(@(x)1);
% h(3) = plot(data3(c1.IsSupportVector,1), data3(c1.IsSupportVector,2),'ko');
plot(data3(c1.IsSupportVector,1), data3(c1.IsSupportVector,2),'ko');
contour(x1Grid, x2Grid, reshape(scores(:,2), size(x1Grid)), [0 0], 'k');
% legend(h, {'-1', '+1', 'Support Vectors'});
axis equal
hold off

