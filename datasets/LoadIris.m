function [X, y] = LoadIris()

FID = fopen('iris.data');
m = textscan(FID, '%f %f %f %f %s', 'Delimiter',',');
X = cell2mat(m(1:4));
categories = unique(m{5});
for i=1:size(categories)
    y((strcmp(m{5}, categories{i})) == 1) = i;
end
y = y';