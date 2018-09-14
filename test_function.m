%% Setup the worksheet
 
im = iread('work_sheet_prac.jpg');
im = imresize(im,0.5);
imRed = im(:,:,1);
imGreen = im(:,:,2);
imBlue = im(:,:,3);

imRedNormal = double(imRed)/255;
imGreenNormal = double(imGreen)/255;
imBlueNormal = double(imBlue)/255;

imR = imRedNormal.^2.5;
imG = imGreenNormal.^2.5;
imB = imBlueNormal.^2.5;

imr = imR./(imR+imG+imB);
img = imG./(imR+imG+imB);
imb = imB./(imR+imG+imB);

imbThings = imb > 0.5;
imrThings = imr > 0.5;
imgThings = img > 0.5;

bblue = iblobs(imbThings,'area',[45,200000],'boundary','touch',0);
bred = iblobs (imrThings,'area',[200,200000],'boundary','touch',0);
bgreen = iblobs (imgThings, 'area',[200,200000],'boundary','touch',0);

%% Setup the testsheet 
im_test = iread('harry_test_4.jpg');
im_test = imresize(im_test,0.5);
imRed_test = im_test(:,:,1);
imGreen_test = im_test(:,:,2);
imBlue_test = im_test(:,:,3);

imRedNormal_test = double(imRed_test)/255;
imGreenNormal_test = double(imGreen_test)/255;
imBlueNormal_test = double(imBlue_test)/255;

imR_test = imRedNormal_test.^2.5;
imG_test = imGreenNormal_test.^2.5;
imB_test = imBlueNormal_test.^2.5;

imr_test = imR_test./(imR_test+imG_test+imB_test);
img_test = imG_test./(imR_test+imG_test+imB_test);
imb_test = imB_test./(imR_test+imG_test+imB_test);

imbThings_test = imb_test > 0.5;
imrThings_test = imr_test > 0.5;
imgThings_test = img_test > 0.5;

bred_test = iblobs (imrThings_test,'area',[200,300000],'boundary','touch',0);
bgreen_test = iblobs (imgThings_test, 'area',[200,300000],'boundary','touch',0);

test = imrThings_test + imgThings_test;
blob_test = iblobs (test, 'area',[800,300000],'boundary','touch',0);
object_max = max(blob_test.area);
index = find(blob_test.area==object_max);
if (blob_test(index).circularity > 0.9)
    s = 2 * sqrt(object_max/pi);
elseif (blob_test(index).circularity > 0.7)
    s = sqrt(object_max);
else
    s = sqrt(object_max * 4 / sqrt(3));
end 

%% Determine the color, shape and size in the test sheet
three_shape_test = imrThings_test + imgThings_test;
track_appear = [];
if(length(bred_test) >= 1)
    for i = 1:length(bred_test)
        if bred_test(i).circularity > 0.95
            red_circle = (s/2)^2*pi;
            if red_circle/bred_test(i).area < 1.5 
                track_appear = [track_appear,21];
                fprintf('Red Large Circle\n');
            else
                track_appear = [track_appear,20];
                fprintf('Red Small Circle\n');
            end 
        elseif bred_test(i).circularity > 0.7
            red_square = s^2;
            if red_square/bred_test(i).area < 2 
                track_appear = [track_appear,11];
                fprintf('Red Large Square\n');
            else 
                track_appear = [track_appear,10];
                fprintf('Red Small Square\n');
            end 
        elseif bred_test(i).circularity > 0.40
            red_triangle = s^2 * sqrt(3) / 4;
            if red_triangle/bred_test(i).area < 1.5 
                track_appear = [track_appear,1];
                fprintf('Red Large Triangle\n');
            else 
                track_appear = [track_appear,0];
                fprintf('Red Small Triangle\n');
            end
        else 
            track_appear = [track_appear,];
            fprintf('');
        end 
    end
else
    fprintf('');
end 


if(length(bgreen_test) >= 1)
    for i = 1:length(bgreen_test)
        if bgreen_test(i).circularity > 0.95
            green_circle = (s/2)^2*pi;
            if green_circle/bgreen_test(i).area < 1.5  
                track_appear = [track_appear, 51];
                fprintf('Green Large Circle\n');
            else 
                track_appear = [track_appear, 50];
                fprintf('Green Small Circle\n');
            end 
        elseif bgreen_test(i).circularity > 0.7
            green_square = s^2;
            if green_square/bgreen_test(i).area < 2 
                track_appear = [track_appear, 41];
                fprintf('Green Large Square\n');
            else 
                track_appear = [track_appear, 40];
                fprintf('Green Small Square\n');
            end 
        elseif bgreen_test(i).circularity > 0.40
            green_triangle = s^2 * sqrt(3) / 4;
            if green_triangle/bgreen_test(i).area < 1.5 
                track_appear = [track_appear, 31];
                fprintf('Green Large Triangle\n');
            else 
                track_appear = [track_appear, 30];
                fprintf('Green Small Triangle\n');
            end 
        else 
            fprintf('');
        end 
    end 
else 
    fprintf('');
end 

pause();

%% Task 2: Segment the 9 blue circles with centroid and bounding box laid on
figure
imshow(imbThings)
for i=1:length(bblue)
 bblue(i).plot_box('g');
 bblue(i).plot('r*');
end

pause();



%% Task 3: Display the binary image. Mark the centroid in all shapes, bounding box on all triangles, different 
%% colored bounding box with green shapes
figure
im_non_blue = imrThings + imgThings;
b = iblobs(im_non_blue,'area', [4000,100000], 'touch', 0, 'boundary');
imshow(im_non_blue)
for i=1:length(b)
    b(i).plot('r*');
    if b(i).circularity < pi/4
        b(i).plot_box('b');
    end
end

labels = ['g','r','c','m','w','y'];
for a=1:length(bgreen)
    bgreen(a).plot_box(labels(a));
end 

pause(5);

%% Task 4: Display the binary image with only the test sheet in the worksheet 
[L_red,nb_red] = ilabel(imrThings);
arr_red = [];
 for i = 1:nb_red
     x_red = (L_red==i);
     if sum(sum(x_red)) > 1000 && sum(sum(x_red)) < 50000
         arr_red = [arr_red,i]; 
     end 
 end

[L_green,nb_green] = ilabel(imgThings);
arr_green  = [];
for i = 1:nb_green
     x_green = (L_green==i);
     if sum(sum(x_green)) > 1000 && sum(sum(x_green)) < 50000
         arr_green = [arr_green,i]; 
     end 
end
 
 
object_1 = track_appear(1);
object_2 = track_appear(2);
object_3 = track_appear(3);
dim = size(im);
image_segmentation = zeros(dim(1),dim(2));
red_label = [21,10,0,20,1,11];
green_label = [40,50,41,31,30,51];
for i = 1:length(red_label)
    if(object_1==red_label(i))
        image_segmentation = image_segmentation| L_red==arr_red(i);
    end 
    if(object_2==red_label(i))
        image_segmentation = image_segmentation | L_red==arr_red(i);
    end 
    if(object_3==red_label(i))
        image_segmentation = image_segmentation | L_red==arr_red(i);
    end 
    
end 

for i = 1:length(green_label)
    if(object_1==green_label(i))
        image_segmentation = image_segmentation | L_green==arr_green(i);
    end 
    if(object_2==green_label(i))
        image_segmentation = image_segmentation | L_green==arr_green(i);
    end 
    if(object_3==green_label(i))
        image_segmentation = image_segmentation | L_green==arr_green(i);
    end 
    
end

figure
imshow(image_segmentation);
image_blobs = iblobs(image_segmentation,'area', [10,300000], 'touch', 0, 'boundary');

for i = 1:length(image_blobs)
    image_blobs(i).plot('r*');
    image_blobs(i).plot_box('b');
end

pause();

%% %% putting the blue blobs in order

for i = 1:9
   blue_uc(i) = bblue(i).uc; %make an array of the uc coords of the blue blobs
end

blue_uc_ascending = sort(blue_uc); %sort them in ascending order

left_blue_blobs = blue_uc_ascending(1:3); %the three lowest values are leftmost
middle_blue_blobs = blue_uc_ascending(4:6);% next three are middle blobs
right_blue_blobs = blue_uc_ascending(7:9); %last three are rightmost blobs


for i = 1:3
   for j = 1:9
       if left_blue_blobs(1,i) == bblue(j).uc %if the uc coords match
           left_blue_blobs(2,i) = bblue(j).vc; %add the corresponding uv coord underneath
       end
   end
end

for i = 1:3
   for j = 1:9
       if middle_blue_blobs(1,i) == bblue(j).uc %if the uc coords match
           middle_blue_blobs(2,i) = bblue(j).vc; %add the corresponding uv coord underneath
       end
   end
end

for i = 1:3
   for j = 1:9
       if right_blue_blobs(1,i) == bblue(j).uc %if the uc coords match
           right_blue_blobs(2,i) = bblue(j).vc; %add the corresponding uv coord underneath
       end
   end
end

[temp, order] = sort(left_blue_blobs(2,:));
ordered_left = left_blue_blobs(:,order);

[temp, order] = sort(middle_blue_blobs(2,:));
ordered_middle = middle_blue_blobs(:,order);

[temp, order] = sort(right_blue_blobs(2,:));
ordered_right = right_blue_blobs(:,order);

total_blobs = [ordered_left ordered_middle ordered_right];

blobs2 = total_blobs';


%% Task 5: Compute the homography
Q = [20 20; 200 20; 380 20; 20 200; 200 200; 380 200; 200 380; 20 380; 380 380];
Q_1 = [380  380 ; 200 380; 20 380; 380 200; 200 200; 20 200; 200 20; 20 20 ;380 20];
Q_b = [20 380; 20 200; 20 20; 200 380; 200 200; 200 20; 380 380; 380 200; 380 20];
Q_2 =[380 20; 200 20; 20 20; 380 200; 200 200; 20 200; 380 380; 380 200; 380 20];

for i=1:length(blobs2)
   Pb(1,i) = blobs2(i,1);
   Pb(2,i) = blobs2(i,2);
end
 
H = homography(Pb, Q_b');

for a = 1:length(image_blobs)
    p = [image_blobs(a).uc image_blobs(a).vc];
    q = homtrans(H,p');
    if image_blobs(a).circularity > 0.9 
        fprintf('The circle shape in order %d is at %dmm %dmm\n', a, q(1),q(2));
    elseif image_blobs(a).circularity > 0.7 
        fprintf('The square shape in order %d is at %dmm %dmm\n', a, q(1),q(2));
    else 
        fprintf('The triangle shape in order %d is at %dmm %dmm\n', a, q(1),q(2));
    end 
end