function [rata_sum] = cumulative_proportion_var(num_val)
%input num_val:number of components
%to get the cumulatiive proportion of variance of eigenvalues 
%total variance=sum(eigenvalues)%propertions.append(eigenvalue[i]/totaovariance)
img1 = imread('zebra.jpg');
In = rgb2gray(img1);
size_block=16;
In = im2double(In);
[row, rol] = size(In);
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
[val, t] = sort(val,'descend');   %sort eigenvalues in descending sequence 特征值降序排列
vec = vec(:,t);                    % so does the eigenvector特征向量也对应改变顺序
    %to get the cumulatiive proportion of variance of eigenvalues 
% 计算所取特征值贡献率
    rata = val./sum(val);
    rata_sum = sum(rata(1:num_val));
end

