function varargout = imgconvert(varargin)
% IMGCONVERT MATLAB code for imgconvert.fig
%      IMGCONVERT, by itself, creates a new IMGCONVERT or raises the existing
%      singleton*.
%
%      H = IMGCONVERT returns the handle to a new IMGCONVERT or the handle to
%      the existing singleton*.
%
%      IMGCONVERT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMGCONVERT.M with the given input arguments.
%
%      IMGCONVERT('Property','Value',...) creates a new IMGCONVERT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imgconvert_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imgconvert_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imgconvert

% Last Modified by GUIDE v2.5 08-Sep-2018 15:00:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imgconvert_OpeningFcn, ...
                   'gui_OutputFcn',  @imgconvert_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before imgconvert is made visible.
function imgconvert_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imgconvert (see VARARGIN)

% Choose default command line output for imgconvert
handles.output = hObject;
% add data
handles.file_path =  'F:\Experiment\ext_data\ext_data_1\L_text\'; % image folder path
handles.img_path_list = dir(strcat(handles.file_path,'*.bmp')); % capture all of the bmp format image in the specified folder
handles.max_num = length(handles.img_path_list); % get the total number of images
handles.min_num = 1;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imgconvert wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imgconvert_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in image_pushbutton.
function image_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to image_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
I=cell(1,handles.max_num);
axes(handles.axes1);
for i = 1:handles.max_num
    a=strcat(handles.file_path,'l_',num2str(i),'.bmp');
    I{i} = imread(a);
    imshow(I{i});
end
 

% --- Executes on slider movement.
function img_num_slider1_Callback(hObject, eventdata, handles)
% hObject    handle to img_num_slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global I
fs = get(handles.img_num_slider1,'Value');
handles.num = handles.min_num + fs * (handles.max_num-handles.min_num);
axes = handles.axes1;
imshow(I{fix(handles.num)});
% Update handles structure
guidata(hObject, handles);
 

% --- Executes during object creation, after setting all properties.
function img_num_slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to img_num_slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in label_pushbutton2.
function label_pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to label_pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
global RGB
RGB = cell(1,handles.max_num);
for i = 1:handles.max_num
    k = i; % specified position
    text_str = [num2str(k)]; % the content you want to write 
    position = [380 300]; %  letter or other text
    box_color = {'black'}; % specified color of background
    RGB{i} = insertText(I{i},position,text_str,'FontSize',100,'BoxColor',...
    box_color,'BoxOpacity',0.5,'TextColor','white');
    imwrite(RGB{i},['F:\Experiment\examle\',num2str(i),'.bmp']);
end
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in Mgif_pushbutton3.
function Mgif_pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to Mgif_pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% put the image transformed into animated gif
global RGB
nFrames=handles.max_num;
% Create file name.
% FileName = 'tk_1.gif';
axes(handles.axes1);
for i = 1:nFrames 
    a=strcat('F:\Experiment\examle\',num2str(i),'.bmp');
     RGB{i}=imread(a);
    imshow( RGB{i},[]), axis equal, axis tight; 
    frame=getframe( );  
    im=frame2im(frame);% it's necessary to change into index image, if make gif animated image 
    [RGB{i},map]=rgb2ind(im,256); 
    if i == 1 
        imwrite(RGB{i},map,'F:\Experiment\examle\1.gif','gif','LoopCount',Inf,'DelayTime',1.5);
    else 
        imwrite(RGB{i},map,'F:\Experiment\examle\1.gif','gif','WriteMode','append','DelayTime',1.5); 
    end 
end
