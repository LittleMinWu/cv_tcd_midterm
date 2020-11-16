close all
clear all
clc
img1 = imread('zebra.jpg');
In = rgb2gray(img1);
%% input principal components and size_block*size_block patches
num_val = 100;            
size_block = 16;                                 
%split the original image into n*n patches->rol_matrix->final matrix reln
%% 将原图像矩阵分割成n*n的块，再转化为列矩阵，构成最终矩阵reIn
In = im2double(In);
[row rol] = size(In);
m = 0;
Data = zeros(size_block*size_block,(row/size_block)*(rol/size_block)); % data matrix
for i = 1:size_block:row
    for j = 1:size_block:rol
        m = m+1;
        block = In(i:i+size_block-1,j:j+size_block-1);
        Data(:,m) = block(:);
    end
end

%PCA process
Data1 = Data - ones(size(Data,1),1)*mean(Data);  % normalization标准化处理
c = cov(Data1');                        % coviarance求矩阵协方差矩阵
[vec,val] = eig(c);             %  eigenvalues and eigenvector求特征值和特征向量
% 按特征值降序排列
val = diag(val);  %returns a square diagonal matrix with the elements of vector val on the main diagonal 从对角线拿出特征值
[val t] = sort(val,'descend');   %sort eigenvalues in descending sequence 特征值降序排列
vec = vec(:,t);                    % so does the eigenvector特征向量也对应改变顺序

%reconstrction
vec_new = vec(:,1:num_val);      %for the first num_val eigenvector取前k个特征向量
    %compute the rate of contributions of the eigenvalues 
% 计算所取特征值贡献率
    rata = val./sum(val);
    rata_sum = sum(rata(1:num_val));
    fprintf('choose %g eigenvalues and the contribution rate is：%g',num_val,rata_sum);
    
y = vec_new'* Data;                   %project : y=w'*x
Data2 = vec_new * y;                  % reconstruction
Data2 = Data2 + ones(size(vec_new, 1), 1) * mean(Data);  % add the mean of Data
m = 0;
for i = 1:size_block:row
    for j = 1:size_block:rol
        m = m + 1;
        block1 = reshape(Data2(:, m), size_block, size_block); %rol_vector->block列向量块转化为方块
        Out(i:i+size_block-1, j:j+size_block-1) = block1; 
    end
end

imshow(In),title('the original image')
figure,imshow(Out),title('reconstruction')
imwrite(Out,'R100.jpg')