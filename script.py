# coding=utf-8
import requests
from bs4 import BeautifulSoup
import json
import urllib2
import os
import sys

reload(sys)
sys.setdefaultencoding('utf-8')
# we will save all the images in directory wikiArts
dirName='wikiArts'
if not os.path.exists(dirName):
	os.makedirs(dirName)

# for every artist, get the lien for his images
# in the database, there are 2978 artists, but due to the error of theri server, I can only get 2700 artists 
with open("final.html","r") as f : 
    content = f.read()
soup = BeautifulSoup(content,"lxml")
ul =  soup.find("ul", class_="wiki-artistgallery-container ng-isolate-scope")
href = []
for ele in ul.find_all("a") :   
    href.append(ele["href"])
href = href[::2]
# It should be 2700, because there aer 2700 artists
print (len(href))
# the name of all the artists
nom = []
i=0
for ele in href :   
    nom.append(ele.split('/')[-1])
    href[i] = href[i] + "/all-works/text-list"
    i+=1
# for every artist, make a directory
url_base = "https://www.wikiart.org"
for i in range(len(nom)) :
    name = nom[i]
    lien = href[i]
    if not os.path.exists(dirName+"/"+name):
        os.makedirs(dirName+"/"+name)
    directory = dirName+"/"+name
    # go to the page where has all the works of ith artist
    html=requests.get(lien)
    soup = BeautifulSoup(html.text,"lxml")
    ul =  soup.find("ul", class_="painting-list-text")
    # for every work of this artist, we save the lien of the work in href_images
    href_images = []
    for ele in ul.find_all("a") :   
        href_images.append(url_base+ele["href"])
    # for every work, we save it in the directory of this artist
    for ele in href_images[0:] : 
        html_image = requests.get(ele)
        soup = BeautifulSoup(html_image.text,"lxml")
        img =  soup.find("img", class_="ms-zoom-cursor")
        src = img["src"]
        filename = src.split('/')[-1]
        req = urllib2.Request(url = src)
        if not os.path.exists("./"+directory+"/"+filename):
            result = urllib2.urlopen(req).read()
            picf = open("./"+directory+"/"+filename,"wb")
            picf.write(urllib2.urlopen(req).read())
            picf.close()


