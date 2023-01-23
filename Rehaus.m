function varargout = Rehaus(varargin)
% REHAUS MATLAB code for Rehaus.fig
%      REHAUS, by itself, creates a new REHAUS or raises the existing
%      singleton*.
%
%      H = REHAUS returns the handle to a new REHAUS or the handle to
%      the existing singleton*.
%
%      REHAUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REHAUS.M with the given input arguments.
%
%      REHAUS('Property','Value',...) creates a new REHAUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rehaus_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rehaus_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rehaus

% Last Modified by GUIDE v2.5 06-Jan-2023 23:18:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rehaus_OpeningFcn, ...
                   'gui_OutputFcn',  @Rehaus_OutputFcn, ...
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


% --- Executes just before Rehaus is made visible.
function Rehaus_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rehaus (see VARARGIN)

% Choose default command line output for Rehaus
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Rehaus wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Rehaus_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ajouter.
function ajouter_Callback(hObject, eventdata, handles)
img=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.jif';'*.svg'});
img=imread(img);
axes(handles.axes1);
imshow(img);
setappdata(0,'img',img);


% --- Executes on button press in inversion.
function inversion_Callback(hObject, eventdata, handles)
img=getappdata(0,'img');
ID=255 - img;
axes(handles.axes3);
imshow(ID);
setappdata(0,'ID',ID);

% --- Executes on button press in hist_o.
function hist_o_Callback(hObject, eventdata, handles)
img=getappdata(0,'img');
i=img;
axes(handles.axes2);
imhist(i);

% --- Executes on button press in hist_i.
function hist_i_Callback(hObject, eventdata, handles)
img=getappdata(0,'ID');
i=img;
axes(handles.axes4);
imhist(i);


% --- Executes on button press in egaliser.
function egaliser_Callback(hObject, eventdata, handles)
img=getappdata(0,'img');
eg=histeq(img);
axes(handles.axes3);
imshow(eg);
setappdata(0,'eg',eg);


% --- Executes on button press in hist_eg.
function hist_eg_Callback(hObject, eventdata, handles)
im=getappdata(0,'eg');
axes(handles.axes4);
imhist(im);


% --- Executes on button press in adjust.
function adjust_Callback(hObject, eventdata, handles)
X=getappdata(0,'img');
ajust=imadjust(X,[.2 .3 0; .6 .7 1],[]);
axes(handles.axes3);
imshow(ajust);
setappdata(0,'ajust',ajust);


% --- Executes on button press in hist_adjust.
function hist_adjust_Callback(hObject, eventdata, handles)
ph=getappdata(0,'ajust');
axes(handles.axes4);
imhist(ph);


% --- Executes on button press in rehauss.
function rehauss_Callback(hObject, eventdata, handles)
Y=getappdata(0,'img');
F=fft2(Y);
Fsh= fftshift(F);
f=ifft2(Fsh);
f=uint8(f);    
axes(handles.axes3);
imshow(f);
setappdata(0,'f',f);

% --- Executes on button press in hist_fc.
function hist_fc_Callback(hObject, eventdata, handles)
p=getappdata(0,'f');
axes(handles.axes4);
imhist(uint8(p));


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
X=getappdata(0,'img');
ajustn=imadjust(X);
axes(handles.axes3);
imshow(ajustn);
setappdata(0,'ajustn',ajustn);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
photo=getappdata(0,'ajustn');
axes(handles.axes4);
imhist(photo);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
y=getappdata(0,'img');
clair = y*1.5;

axes(handles.axes3);
imshow(clair);
setappdata(0,'clair',clair);

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
histcl=getappdata(0,'clair');
axes(handles.axes4);
imhist(histcl);
