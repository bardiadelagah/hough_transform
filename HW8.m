clc; clear all; close all;


img = imread('2.png');

I = img;
if (length(size(I))==3)
    I = rgb2gray(I);
end
e = edge(I,'canny');
figure(1),imshow(e)
radii = 15:1:45;
h = circle_hough(e, radii, 'same', 'normalise');
peaks = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 15, 'npeaks', 2);
figure(2),imshow(I);
hold on;
for peak = peaks
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end
hold off