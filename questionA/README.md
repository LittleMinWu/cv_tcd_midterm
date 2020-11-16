
QA
3.Eigenvectors and eigenvalues are the linear algebra concepts that we need to compute from the covariance matrix in order to determine the principal components of the data.The total variance is the sum of variances of all individual principal components.The fraction of variance explained by a principal component is the ratio between the variance of that principal component and the total variance.For several principal components, add up their variances and divide by the total variance.As we can see from variance_explained plot, the value of cumulative_explained_variance is getting bigger as K is bigger , I think we should find a K which is small but the y axis value won't
add so much, with smooth and stably nearly 0 slope, in the cumulative_explained_variance.bng the best K is 150. We see that these 150 components account for just over 90% of the variance. That would lead us to believe that using these 150 components, we would recover most of the essential characteristics of the data. To make this more concrete, we can compare the input images with the images reconstructed from these 150 components:

The codes are as follows:

plt.plot(np.cumsum(pca.explained_variance_ratio_))
plt.xlabel('number of components')
plt.ylabel('cumulative explained variance');

4.As we can see from R10, it's very vague that I can't figure what is this, it doesn't extract any feature of the image,
and for R100, although it's a little blur, but I can tell this is a horse, and it keep the basic features of the image, 
and as we can see from the Rk_big_range.jpg, as K is getting bigger, the image becomes more and more clear, we can tell
definetely this is a zebra, the zebras are striped more clear also, the resolution of the image is higher and higher.
