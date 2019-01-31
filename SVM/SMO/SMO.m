function [alpha, b, TS] = SMO(X, Y, eps, tol, type, ul, Pdata, sigma)
%%adjusting the size of the traning data according to the Pdata value
% X -- 1-d the number of samples
%      2-d the dimension of the sample
Sdata = int32(Pdata/100*size(X,1));
TS = Sdata;
alpha = zeros(1, Sdata);
b = 0;
Error = zeros(1, Sdata);
Xback = X;
Yback = Y;
X = X(1:Sdata, :);
Y = Y(1:Sdata);

% pre-kernel evaluation
K = zeros(size(X, 1));
for i = 1:Sdata
    for j = 1:Sdata
        K(i,j) = Kernel(X(i,:), X(j,:), type, sigma);
    end
end

numChanged = 0;
examineAll = 1;

while( numChanged > 0 || examineAll )
    numChanged = 0;
    if(examineAll)
        for i2 = 1:length(alpha)
            [out, alpha, b, Error] = examineExample(i2, Y, alpha, tol, ul, Error, eps, K, b);
            numChanged = numChanged + out;
        end
    else
        tmp = find( Error > tol & Error < ul(2)-tol );
        for j = tmp
            [out, alpha, b, Error] = examineExample(j, Y, alpha, tol, ul, Error, eps, K, b);
            numChanged = numChanged + out;
        end
    end
    
    if (examineAll == 1)
        examineAll = 0;
    elseif (numChanged == 0)
        examineAll = 1;
    end
end

TE = traningError(alpha, Y, b, K);
C = confidence(Xback, Yback, alpha, b, type, Sdata) / double(size(Xback,1) - Sdata + 1) * 100;
fprintf(sprintf('Confidence and traning error are %d and %d, respectively\n',100-C ,TE));



