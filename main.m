clc
clear
close all
%% reading video file
videoObj = VideoReader('Video.mp4');

% start video from this time
%videoObj.CurrentTime = 0.5 %(seconds);
videoInfo = mmfileinfo('Video.mp4');
videoLength = videoInfo.Duration;
%first frame of video as base frame
firstframe = readFrame(videoObj);

% boundary detection for sibel
target_image = preprocess(firstframe);
[center, radius] = DetectCircle(target_image);

%% test data whether sibel detection is correct or not
%{
imshow(target_image)

for i = 1:12
    center_vetor(i,1) = center(1);
    center_vetor(i,2) = center(2);
end
viscircles(center_vetor, radius)
%}
%% Automatic point number calculation using video
clc
close all
disp('start')
baseframe = firstframe;
counter = 1;
score_of_hit = 0 ;
while hasFrame(videoObj)
    %reading video frame by frame
    videoFrame = readFrame(videoObj);
    % if statement for reading one frame in one second
    if mod(counter,10) == 1
        %score calculation 
        score_of_hit = score(rgb2gray(videoFrame),rgb2gray(baseframe), center, radius);
        % score visuliztion per second
        %disp(score_of_hit)
    end
    imshow(imresize(videoFrame,0.1))
    if (sum(score_of_hit)) == 0
        num_of_hits = [0 0] ;
    else
        num_of_hits = size(score_of_hit);
    end
    title(strcat('Number of shots :', num2str(num_of_hits(2))))
    xlabel( strcat("Total score: ",num2str(sum(score_of_hit))))
    ylabel(strcat('Time:',num2str(counter/10),'S'),'Rotation',0)
    drawnow;
    counter = counter+1;

end

disp('finished')
disp('earned points from shooting to the sibel')
disp(sum(score_of_hit))



