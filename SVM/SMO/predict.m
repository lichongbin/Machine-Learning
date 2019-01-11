function y = predict(X, Y, alpha, b, x)
K = zeros(1, size(X, 1));
for i = 1:size(X, 1)
    K(i) = Kernel(X(i, :)', x, 'L', 0);
end
y = sum(Y' .* alpha .* K) + b;
