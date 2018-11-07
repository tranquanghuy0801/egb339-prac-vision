im = iread('needles_practice.png','double','grey');
[centers,radii] = imfindcircles(im,[15 50]);
viscircles(centers,radii,'EdgeColor','b');
length(radii);
im = im > 0.64;
imshow(im);
blob = iblobs (im ,'area',[400,300000],'class',0,'boundary','touch',0);
 for i=1:length(blob)
     blob(i).plot('r*');
 end
length(blob)