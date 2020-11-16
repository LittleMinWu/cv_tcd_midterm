
close all
clear all
clc
%// Read in image - make sure we cast to double
img1 = imread('zebra.jpg');
img2 = rgb2gray(img1)
B = double(img2);
%// Calculate covariance matrix
sigma = cov(B);

%// Find eigenvalues and eigenvectors of the covariance matrix
[A,D] = eig(sigma);
vals = diag(D);

%// Sort their eigenvalues
[~,ind] = sort(abs(vals), 'descend');

%// Rearrange eigenvectors
Asort = A(:,ind);

%// Find mean subtracted data
Bm = bsxfun(@minus, B, mean(B,1));

%// Reproject data onto principal components
Bproject = Bm*Asort;

%%%%%%%// Begin reconstruction logic
figure;
counter = 1;

for k = [1 2 3 4 5 6 7 8 9 10]
    %// Extract out highest k eigenvectors
    Aq = Asort(:,1:k);

    %// Project back onto original domain
    out = bsxfun(@plus, Bproject(:,1:k)*Aq.', mean(B, 1));

    %// Place projection onto right slot and show the image
    subplot(3, 4, counter);
    counter = counter + 1;
    imshow(out,[]);
    title(['k = ' num2str(k)]);
end