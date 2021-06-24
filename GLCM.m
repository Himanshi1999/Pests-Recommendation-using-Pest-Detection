%% 
clc; 
clear;
%l=input('Enter No. of Dominant Eigen Values to keep:    ');
string = ["ZC", "TU", "TP", "SL", "SE", "MP", "HA", "BA"];
%string = ["ZC", "TU",  "SL", "SE", "MP", "HA"];
for j = 1:length(string)
    
    myFolder = append('C:\Users\Himanshi\Desktop\Pests Detection\CropsWithPests\', string(j));
    if ~isfolder(myFolder)
      errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
      uiwait(warndlg(errorMessage));
    return;
    end
    filePattern = fullfile(myFolder, '*.jpg');
    jpegFiles = dir(filePattern);
    n = length(jpegFiles);
    M=72;N=72; %Required Image Dimensions
    features =zeros(n,5);%Matrix assignment for features
    for count=1:n 
        %if count<168
            %filename=sprintf("jpegFiles (%d).JPG",count);
            baseFileName = jpegFiles(count).name;
            fullFileName = fullfile(myFolder, baseFileName);
            I=imread(fullFileName);%Reading image
            I=rgb2gray(I);
            %I=histeq(I);
            I=imresize(I,[M,N]);
            
            %[imgray,T] = histeq(imgray);
            %Detect entire cell
            %[~,threshold]  = edge(I,'sobel');
            %fudgefactor = 0.5;
            %bws = edge(I, 'sobel', threshold * fudgefactor);

            %results.bws = bws;

            %Dilate the image

            %se90 = strel('line',3,30);
            %se0 = strel('line',3,0);

            %bwsdil = imdilate(bws,[se90 se0]);
            %results.bwsdil = bwsdil;

            %fill interior gaps
            %bwdfill = imfill(bwsdil,'holes');
            %results.bwdfill = bwdfill;

            %mask=bwdfill;

            %textureBottom = I;
            %textureBottom(~mask) = 0;
            %z=textureBottom;
            
            %entropy1=entropy(z);

            
            glcm=graycomatrix(I);%Creating Gray correlation matrix
            stats=graycoprops(glcm,'Contrast Correlation Energy Homogeneity');
            contrast=stats.Contrast;
            correlation=stats.Correlation;
            energy=stats.Energy;
            homogeneity=stats.Homogeneity;
            features(count,:)=[contrast,correlation,energy,homogeneity,j];
        %end
        
    end
    
    s = sprintf('MyFile_GLCM_%s.csv', string(j));
    writematrix(features, s);
end

msgbox('Done','Done');