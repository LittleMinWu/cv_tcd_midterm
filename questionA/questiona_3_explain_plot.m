close all
clear all
clc
array_x=[]
array_y=[];
for i=1:200
    y = cumulative_proportion_var(i);%funtion to get the cumulative proportion of eigenvalue variance
    array_x(i+1)=i
    array_y(i+1)=y;
end

plot(array_x,array_y);
title('how to select a better value for k ');
xlabel('number of components');
ylabel('cumulative explained variance');
