function varargout = segment(varargin)
% SEGMENT MATLAB code for segment.fig
%      SEGMENT, by itself, creates a new SEGMENT or raises the existing
%      singleton*.
%
%      H = SEGMENT returns the handle to a new SEGMENT or the handle to
%      the existing singleton*.
%
%      SEGMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEGMENT.M with the given input arguments.
%
%      SEGMENT('Property','Value',...) creates a new SEGMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before segment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to segment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help segment

% Last Modified by GUIDE v2.5 11-Jan-2023 01:56:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @segment_OpeningFcn, ...
                   'gui_OutputFcn',  @segment_OutputFcn, ...
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


% --- Executes just before segment is made visible.
function segment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to segment (see VARARGIN)

% Choose default command line output for segment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes segment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = segment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.jif';'*.svg'});
img=imread(img);
axes(handles.axes1);
imshow(img);
setappdata(0,'img',img);







% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im=getappdata(0,'img');
edg=im;
edg=rgb2gray(edg);
edg=edge(edg,'Canny');
axes(handles.axes2);
imshow(edg);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im=getappdata(0,'img');
edg=im;
edg=rgb2gray(edg);
edg=edge(edg,'Sobel');
axes(handles.axes2);
imshow(edg);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im=getappdata(0,'img');
edg=im;
edg=rgb2gray(edg);
edg=edge(edg,'Prewitt');
axes(handles.axes2);
imshow(edg);


% --- Executes on selection change in NGfiltre.
function NGfiltre_Callback(hObject, eventdata, handles)
img=getappdata(0,'img');
edg=img;

if(get(handles.NGfiltre,'value')==1)
   edg=edge(edg,'canny');
end
if(get(handles.NGfiltre,'value')==2)
   edg=edge(edg,'prewitt');
end
if(get(handles.NGfiltre,'value')==3)
   edg=edge(edg,'sobel');
end
if(get(handles.NGfiltre,'value')==4)
   edg=edge(edg,'roberts');
end
if(get(handles.NGfiltre,'value')==5)
   edg=edge(edg,'log');
end

axes(handles.axes2);
imshow(edg);


% --- Executes during object creation, after setting all properties.
function NGfiltre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NGfiltre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RGBfiltre.
function RGBfiltre_Callback(hObject, eventdata, handles)
img=getappdata(0,'img');
edg=img;
edg=rgb2gray(edg);
if(get(handles.NGfiltre,'value')==1)
   edg=edge(edg,'canny');
end
if(get(handles.NGfiltre,'value')==2)
   edg=edge(edg,'prewitt');
end
if(get(handles.NGfiltre,'value')==3)
   edg=edge(edg,'sobel');
end
if(get(handles.NGfiltre,'value')==4)
   edg=edge(edg,'roberts');
end
if(get(handles.NGfiltre,'value')==5)
   edg=edge(edg,'log');
end

axes(handles.axes2);
imshow(edg);


% --- Executes during object creation, after setting all properties.
function RGBfiltre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RGBfiltre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in supp.
function supp_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
cla(handles.axes3,'reset');
cla(handles.axes4,'reset');







% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
im=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.jif';'*.svg'});
im=imread(im);
axes(handles.axes3);
imshow(im);
setappdata(0,'im',im);


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
A = getappdata(0,'im');
try
    B=rgb2gray(A);
catch
    B=A;
end
[m,n]=size(B);
for i=1:m
    for j=1:n
        if B(i,j) < 100;
           Seg(i,j)=0;
        else
            Seg(i,j)=255;
        end
    end
end 
axes(handles.axes4);
imshow(uint8(Seg));


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
A = getappdata(0,'im');
try
    B=rgb2gray(A);
catch
    B=A;
end
[m,n]=size(B);
for i=1:m
    for j=1:n
        if B(i,j) < 100;
           Seg2(i,j)=255;
        else if  B(i,j) > 150;
                Seg2(i,j)=0;
            else
                Seg2(i,j) = 100;
            end
             
        end
    end
end 
axes(handles.axes4);
imshow(uint8(Seg2));
