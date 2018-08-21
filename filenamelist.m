% input numerious name of file
clear;
cd('F:\Experiment\ext_data\ext_data_1\L\');
for i = 1;15
    filename=strcat('t_',num2str(i),'.tif');
    file_name_list(i,:)=filename;
end
save('F:\Experiment\ext_data\ext_data_1\L\filenamelist.mat','file_name_list');