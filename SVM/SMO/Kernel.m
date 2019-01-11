function x = Kernel(X1, X2, type, sigma)
% KERNEL evaluates the kernel between X1 and X2.
% type: 'G' - Gaussian Kernel
%       'L' - Linear Kernel
% sigma: Standard derivation of Gaussian
%
switch (type)
    case 'G'
        x = exp(-norm(X1-X2).^2/(2*sigma.^2));
    case 'L'
        x = sum(X1.*X2);
end