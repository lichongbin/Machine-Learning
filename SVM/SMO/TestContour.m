x = linspace(-2*pi,2*pi);
y = linspace(0,4*pi);
[X,Y] = meshgrid(x,y);
Z = sin(X)+cos(Y);
% Z = X^2 + Y^2;

figure
axis equal
contour(X,Y,Z)