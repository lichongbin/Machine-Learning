function [X, y] = LoadIris()
% LOADIRIS Load Iris data set into the memory.
% Iris data set can be download here:
% http://archive.ics.uci.edu/ml/datasets.html
%
FID = fopen('iris.data');
m = textscan(FID, '%f %f %f %f %s', 'Delimiter',',');
fclose(FID);

% the data type in column 1 to 4 is numeric
X = cell2mat(m(1:4));
categories = unique(m{5});
y = zeros(size(X, 1), 1);
for i=1:size(categories)
    y( ( strcmp(m{5}, categories{i}) ) == 1 ) = i;
end