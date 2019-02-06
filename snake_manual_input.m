% Team 10: Allison Goins and Jesus Rodriguez%

function [x, y] = snake_manual_input(img, ptCount, lnStyle)
%   img is a string that contains the name of an image that will have
%       a snake interpolated
%   ptCount is the number of points that will be used to build the snake
%       by evenly spacing the points
%   lnStyle is a character string made from one element from any or
%   all the following 3 columns:
%
%            b     blue          .     point           -     solid
%            g     green         o     circle          :     dotted
%            r     red           x     x-mark          -.    dashdot 
%            c     cyan          +     plus            --    dashed   
%            m     magenta       *     star          (none)  no line
%            y     yellow        s     square
%            k     black         d     diamond
%            w     white         v     triangle (down)
%                                ^     triangle (up)
%                                <     triangle (left)
%                                >     triangle (right)
%                                p     pentagram
%                                h     hexagram
%                           
%
%   Thus, a symbol from the first column gives the color, the second
%   is the symbol used in the plot, and the third specifies the type
%   of line used to join the points in the plot. For example, to
%   plot red circles joined by straight lines we specify the string
%   'ro-'. To plot just red circles without any connecting lines we
%   specify the string 'ro'. The default MATLAB plot is black points
%   joined by black solid lines. The default for the present
%   function is black dots with no lines.

% check the number of arguments and, if no style was chosen, set the
% style to a solid black line
if nargin ~= 3
    lnStyle = 'k.-';
end    

% ask the user to input the points around the image
disp('When the image is shown on the screen, use the mouse to select')
disp(' the points that will form the snake.')
disp('Press any key to continue and display the image.')
pause;
figure, imshow(img)

% attain the coordinates of the points and save them to vectors x and y
[y,x] = myginput;

% add one more point to the vector that is the same as the first point
% selected
xTemp = numel(x) + 1;
yTemp = numel(y) + 1;

x(xTemp) = x(1);
y(yTemp) = y(1);

% interpolate with the number of points chosen over the image
pts = interparc(ptCount, y, x, 'linear');

% close the image now that the user is done with input
close gcf

% show the image again
figure, imshow(img)
hold on

% show the interpolated snake
snake_display(pts(:,2), pts(:,1), lnStyle)
hold off