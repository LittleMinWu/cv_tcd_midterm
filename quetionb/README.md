
# cv_tcd_midterm
I use google colab to train the model and get the output,and this is my bachlor's dissertation.the link is:https://drive.google.com/drive/folders/1O2wXVQwGTfKKvA1uHTWd_yD2fIZaW-gx?usp=sharing

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
