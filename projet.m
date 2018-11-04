## Copyright (C) 2018 ASUS-PC
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} projet (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ASUS-PC <ASUS-PC@GJXPC>
## Created: 2018-11-03

%%Contenu geometrique et module/phase

filePath = 'E:\TP_2\wikiArts\';        
fileDir  = dir([filePath '.']);
l=length(fileDir);
p = randperm(l);
fid=fopen('E:\TP_2\name_of_painter.txt','wt');
n=[];
for i=1:350
  name=fileDir(p(i)).name;
  fprintf(fid,'%s\n',name);
  n=[n;name];
end
fclose(fid)
imgPath = 'E:\TP_2\wikiArts\';
resultPath = 'E:\TP_2\result\';

for j=1:350
  tmpPath=[imgPath n(j,:)];
  tmpPath=[tmpPath,'\'];
  tmpPath(find(isspace(tmpPath))) = [];
  imgDir  = dir([tmpPath '*.*']);
  i=1;
  while (i<=length(imgDir))
  
      I1 = imread([tmpPath imgDir(i).name]);
      I1=im2double(I1);
      I2=imread([tmpPath imgDir(i+1).name]);
      I2=im2double(I2);
##      if isequal(size(I1),[224 224])
##        continue;
####      if i<length(imgDir)-1
####          i=i+1;     
####      else
####        break;
####      end
##      
##      elseif isequal(size(I2),[224 224])
####      if i<length(imgDir)-2
####          i=i+2;     
####      else
####        break;
####      end
##      continue;
##    else
      try
      F1=fft2(I1);
      m1=abs(F1);
      a1=angle(F1);
      F2=fft2(I2);
      m2=abs(F2);
      a2=angle(F2);
      [X1,Y1] = pol2cart(a2,m1);
      [X2,Y2] = pol2cart(a1,m2);
      J1=X1+Y1*i;
      J2=X2+Y2*i;
      J1=ifft2(J1);
      J2=ifft2(J2);
      rPath=[resultPath n(j,:)];
      rPath=[rPath,'\'];
      rPath(find(isspace(rPath))) = [];
      mkdir(rPath);
      imwrite(J1,[rPath,imgDir(i).name]);
      imwrite(J2,[rPath,imgDir(i+1).name]);
      if i<length(imgDir)-2
          i=i+2;     
      else
        break;
      end
    catch
      if i<length(imgDir)-1
          i=i+1; 
          continue;    
      else
        break;
      end
      
      end

##   end
 end
end  

##imgPath = 'E:\TP_2\';        
##imgDir  = dir([imgPath '*.jpg']);
##imgDir2  = dir([imgPath '*.bmp']);
##imgDir=[imgDir1 ;dir([imgPath '*.bmp'])];
##resultPath = 'E:\TP_2\result\';
##i=1;
##while (i<=length(imgDir))
##    I1 = imread([imgPath imgDir(i).name]);
##    I1=im2double(I1);
##    F1=fft2(I1);
##    m1=abs(F1);
##    a1=angle(F1);
##    I2=imread([imgPath imgDir(i+1).name]);
##    I2=im2double(I2);
##    F2=fft2(I2);
##    m2=abs(F2);
##    a2=angle(F2);
####    [X1,Y1] = pol2cart(a2,m1);
####    [X2,Y2] = pol2cart(a1,m2);
####    J1=X1+Y1*i;
####    J2=X2+Y2*i;
####    J1=ifft2(J1);
####    J2=ifft2(J2);
##    imwrite(I1,[resultPath,imgDir(i).name]);
##    imwrite(I2,[resultPath,imgDir(i+1).name]);
##    i=i+2;
##end
##
##
##imgPath = 'E:\TP_2\';        
##imgDir  = dir([imgPath '*.jpg']);
##imgDir2  = dir([imgPath '*.bmp']);
##imgDir=[imgDir1 ;dir([imgPath '*.bmp'])];
##resultPath = 'E:\TP_2\result\';
##i=1;
##while (i<=length(imgDir))
##    I1 = imread([imgPath imgDir(i).name]);
##    I1=im2double(I1);
##    F1=fft2(I1);
##    m1=abs(F1);
##    a1=angle(F1);
##    I2=imread([imgPath imgDir(i+1).name]);
##    I2=im2double(I2);
##    F2=fft2(I2);
##    m2=abs(F2);
##    a2=angle(F2);
####    [X1,Y1] = pol2cart(a2,m1);
####    [X2,Y2] = pol2cart(a1,m2);
####    J1=X1+Y1*i;
####    J2=X2+Y2*i;
####    J1=ifft2(J1);
####    J2=ifft2(J2);
##    imwrite(I1,[resultPath,imgDir(i).name]);
##    imwrite(I2,[resultPath,imgDir(i+1).name]);
##    i=i+2;
##end
##  
####for i = 1:length(imgDir)          
####    img = imread([imgPath imgDir(i).name]);
####    figure;
####    imshow(img);
####    i=i+1;
####end
##
##ext = {'*.jpeg','*.jpg','*.png','*.bmp'};  
##path = 'E:\TP_2\'; 
##images = [];  
##for i = 1:length(ext)  
##    images = [images ;dir([path ext{i}])];  
##end  
##  
##% images are returned with absolute path  
##for i = 1:length(images)  
##    images(i).name = [path images(i).name];  
##end  

