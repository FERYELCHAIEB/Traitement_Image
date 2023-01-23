
function varargout = Transform(varargin)
% TRANSFORM MATLAB code for Transform.fig
%      TRANSFORM, by itself, creates a new TRANSFORM or raises the existing
%      singleton*.
%
%      H = TRANSFORM returns the handle to a new TRANSFORM or the handle to
%      the existing singleton*.
%
%      TRANSFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSFORM.M with the given input arguments.
%
%      TRANSFORM('Property','Value',...) creates a new TRANSFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Transform_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Transform_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Transform

% Last Modified by GUIDE v2.5 11-Jan-2023 00:53:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Transform_OpeningFcn, ...
                   'gui_OutputFcn',  @Transform_OutputFcn, ...
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


% --- Executes just before Transform is made visible.
function Transform_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Transform (see VARARGIN)

% Choose default command line output for Transform
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Transform wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Transform_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upload_image.
function upload_image_Callback(hObject, eventdata, handles)

img=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.jif';'*.svg'});
img=imread(img);
axes(handles.axes1);
imshow(img);
setappdata(0,'img',img);


% --- Executes on button press in gris_scale.
function gris_scale_Callback(hObject, eventdata, handles)

img=getappdata(0,'img');
gray=rgb2gray(img);
axes(handles.axes2);
imshow(gray);


% --- Executes on button press in binary_scale.
function binary_scale_Callback(hObject, eventdata, handles)

img=getappdata(0,'img');
BW=im2bw(img);
axes(handles.axes2);
imshow(BW);


% --- Executes on button press in complement.
function complement_Callback(hObject, eventdata, handles)

img=getappdata(0,'img');
comp=img;
comp=imcomplement(comp);
axes(handles.axes2);
imshow(comp);


% --- Executes on button press in symetrie_horizental.
function symetrie_horizental_Callback(hObject, eventdata, handles)

img=getappdata(0,'img');

% [n,m] = size(img);
%   for i= 1:n;
%       for j = 1:m;
%         H(i,j)=  img(n-i+1,j);
%           
%       end
%   end

H=flip(img,1);
axes(handles.axes2);
imshow(H);

% --- Executes on button press in symetrie_verticale.
function symetrie_verticale_Callback(hObject, eventdata, handles)
% hObject    handle to symetrie_verticale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getappdata(0,'img');

% i=1;
% [r c z]=size(img);
% for j = c:-1:1;
%     V(:,i,:)=img(:,j,:);
%     i=i+1;
% end
 V=flip(img,2);
axes(handles.axes2);
imshow(V);

% --- Executes on button press in symetrie_centre.
function symetrie_centre_Callback(hObject, eventdata, handles)
% hObject    handle to symetrie_centre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getappdata(0,'img');

C=flip(img,1);
C=flip(C,2);
%C=img;
% C=imrotate(C,180);
 axes(handles.axes2);
imshow(C);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.jif';'*.svg'});
img1=imread(img1);
axes(handles.axes3);
imshow(img1);
setappdata(0,'img1',img1);

% --- Executes on button press in upload_deux.
function upload_deux_Callback(hObject, eventdata, handles)
% hObject    handle to upload_deux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img2=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.jif';'*.svg'});
img2=imread(img2);
axes(handles.axes4);
imshow(img2);
setappdata(0,'img2',img2);


% --- Executes on button press in somme.
function somme_Callback(hObject, eventdata, handles)
% hObject    handle to somme (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img1=getappdata(0,'img1');
img2=getappdata(0,'img2');


try
    ng1=rgb2gray(img1);
catch
    ng1=img1;
end
try
    ng2=rgb2gray(img2);
catch
    ng2=img2;
end
try
    ng2=imresize(ng2, size(ng1));
catch 
    ng1=imresize(ng1, size(ng2));
end
Somme = ng1 + ng2;
axes(handles.axes5);
imshow(Somme);
% --- Executes on button press in sous_u.
function sous_u_Callback(hObject, eventdata, handles)
% hObject    handle to sous_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=getappdata(0,'img1');
img2=getappdata(0,'img2');


try
    ng1=rgb2gray(img1);
catch
    ng1=img1;
end
try
    ng2=rgb2gray(img2);
catch
    ng2=img2;
end
try
    ng2=imresize(ng2, size(ng1));
catch 
    ng1=imresize(ng1, size(ng2));
end
Soust1 = ng1 - ng2;
axes(handles.axes5);
imshow(Soust1);
% --- Executes on button press in soustraire.
function soustraire_Callback(hObject, eventdata, handles)
% hObject    handle to soustraire (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=getappdata(0,'img1');
img2=getappdata(0,'img2');

try
    ng1=rgb2gray(img1);
catch
    ng1=img1;
end
try
    ng2=rgb2gray(img2);
catch
    ng2=img2;
end
try
    ng2=imresize(ng2, size(ng1));
catch 
    ng1=imresize(ng1, size(ng2));
end

Soust2 = ng2 - ng1;
axes(handles.axes5);
imshow(Soust2);


% --- Executes on button press in ou.
function ou_Callback(hObject, eventdata, handles)
% hObject    handle to ou (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=getappdata(0,'img1');
img2=getappdata(0,'img2');
try
    img2=imresize(img2, size(img1));
catch 
    img1=imresize(img1, size(img2));
end
img1=im2bw(img1);
img2=im2bw(img2);
or = img1 | img2;
axes(handles.axes5);
imshow(or);

% --- Executes on button press in et.
function et_Callback(hObject, eventdata, handles)
% hObject    handle to et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=getappdata(0,'img1');
img2=getappdata(0,'img2');
try
    img2=imresize(img2, size(img1));
catch 
    img1=imresize(img1, size(img2));
end
img1=im2bw(img1);
img2=im2bw(img2);
and = img1 & img2;
axes(handles.axes5);
imshow(and);


% --- Executes on selection change in noo.
function noo_Callback(hObject, eventdata, handles)
img1=getappdata(0,'img1');
img2=getappdata(0,'img2');
img1=im2bw(img1);
img2=im2bw(img2);
if(get(handles.noo,'value')==1)
   nimg=~img1;
end
if(get(handles.noo,'value')==2)
   nimg=~img2;
end

axes(handles.axes5);
imshow(nimg);


% --- Executes during object creation, after setting all properties.
function noo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
