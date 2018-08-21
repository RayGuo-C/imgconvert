
for i = 1:15
    a=strcat('F:\Experiment\ext_data\ext_data_1\L\t_',num2str(i),'.tif');
    I=imread(a);
    imwrite(I,['F:\Experiment\ext_data\ext_data_1\L\tinserttext_',num2str(i),'.bmp']);
end
