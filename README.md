#question A


3.
Eigenvectors and eigenvalues are the linear algebra concepts that we need to compute from the covariance matrix in order to determine the principal components of the data.The total variance is the sum of variances of all individual principal components.The fraction of variance explained by a principal component is the ratio between the variance of that principal component and the total variance.For several principal components, add up their variances and divide by the total variance.
As we can see from how_to_select_good_value.png, K=54 components account for just over 90% of the variance. That would lead us to believe that using these 54 components, we would recover most of the essential characteristics of the data.
Above all, choose K=54 is good value. And more than 54 as K getting bigger the cumulative_proportion_var is bigger and thus value better too.

For codes:
first I define a function cumulative_proportion_var(num_val) where input num_value is the number of components and the output is the cumulatiive proportion of variance of eigenvalues .
In the questiona_3_explain_plot.m I use a loop to get the proportion of each K , and plot the cumulative_explained_variance.png.

4.
As we can see from R10, the cumulatiive proportion of variance of 10 is 0.6896, it's very vague that I can't figure what is this, it doesn't extract any feature of the image, and for R100, the cumulative proportopn is 0.9490 I can tell this is a zebra, and it keeps the basic features of the image, and as we can see from the Rk_big_range.jpg, as K is getting bigger, the image becomes more and more clear, the zebras are striped more clear also, the resolution of the image is higher and higher,  the cumulative proportion of eigenvalue variance is higher and nearly to 1.


#question B


I use google colab to train the model and get the output,and this is my bachlor's dissertation.
the link is:https://drive.google.com/drive/folders/1O2wXVQwGTfKKvA1uHTWd_yD2fIZaW-gx?usp=sharing

The steps is as follows.
1.get access to google colab
from google.colab import drive
drive.mount('/content/drive')


2.train the image style mode
python train_network.py --style <stylepath> --train-path <trained_network_path> --save-path <save_style_trained_path>
  
  
3.use the pretrained style network to transform our input images.
python stylize_image.py --content <content_path> --network-path <save_style_trained_path> --output-path <results_path>


In github I only trained f.jpg which is the image of my undergraduate university, and transformed it into 3 kinds
of styles of famous artists. First train feedforward transformation networks for image transformation tasks using
perceptual loss functions that depend on high-level features from a pretrained loss network. During training, 
perceptual losses measure image similarities more robustly than per-pixel losses, and at test-time the transformation
networks run in real-time.For transform network, use a feed-forward convolutional network trained with perpixel 
regression or classification losses to extract features and use generative adversarial network to upsampling to 
get the output images, which is refered in the computer vision class.
