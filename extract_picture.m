
for i = 501:638
        j=989 + i;
        a=strcat('F:\',num2str(j),'.bmp');
    I{i}=imread(a);
    imwrite(I{i},['F:\',num2str(i),'.bmp']);
end
