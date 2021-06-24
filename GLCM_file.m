clc;
clear;
csv1 = csvread('MyFile_GLCM_ZC.csv');
csv2 = csvread('MyFile_GLCM_TU.csv');
csv3 = csvread('MyFile_GLCM_TP.csv');
csv4 = csvread('MyFile_GLCM_SL.csv');
csv5 = csvread('MyFile_GLCM_SE.csv');
csv6 = csvread('MyFile_GLCM_MP.csv');
csv7 = csvread('MyFile_GLCM_HA.csv');
csv8 = csvread('MyFile_GLCM_BA.csv');
allCsv = [csv1;csv2;csv3;csv4;csv5;csv6;csv7;csv8]; % Concatenate vertically
%allCsv = [csv1;csv2;csv4;csv5;csv6;csv7];
csvwrite("MyFile_without_segmentation_GLCM.csv", allCsv);

msgbox('Done','Done');