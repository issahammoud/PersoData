# PersoData

This project is created by M2 students as part of their AIC master at Université Paris-Sud. The aim of this project is to create an "adversarial" challenge (called "Persodata") whose goal for the participants (L2 students) is to determine if a sample comes from real or artificial data.

It uses paintings from WikiArt (the Visual Art Encyclopedia). The data here was preprocessed : the images were resized to a fixed resolution of (224,244,3) and then feature extraction was conducted using MobileNets transforming each image into a vector of size 1024 containing the essential information of the image.
Half of the images in this data set are fake paintings which were generated through neural style transfer (10 000) and Generative Adversarial Network (15 000). 

The whole data set thus contains about 50 000 images.
The task for this challenge is a binary classification whose goal is to detect the fake paintings.

References and credits: 
https://www.wikiart.org/

The competition protocol was designed by Isabelle Guyon.

