    function varargout = Restaure(varargin)
% RESTAURE MATLAB code for Restaure.fig
%      RESTAURE, by itself, creates a new RESTAURE or raises the existing
%      singleton*.
%
%      H = RESTAURE returns the handle to a new RESTAURE or the handle to
%      the existing singleton*.
%
%      RESTAURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESTAURE.M with the given input arguments.
%
%      RESTAURE('Property','Value',...) creates a new RESTAURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Restaure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Restaure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Restaure

% Last Modified by GUIDE v2.5 30-Dec-2022 23:36:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Restaure_OpeningFcn, ...
                   'gui_OutputFcn',  @Restaure_OutputFcn, ...
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


% --- Executes just before Restaure is made visible.
function Restaure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Restaure (see VARARGIN)

% Choose default command line output for Restaure
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Restaure wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Restaure_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.jif';'*.svg'});
img=imread(img);
axes(handles.axes1);
imshow(img);
setappdata(0,'img',img);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bruit.
function bruit_Callback(hObject, eventdata, handles)

img=getappdata(0,'img');
i=img;


if(get(handles.popupmenu1,'value')==1)
    n=imnoise(i,'gaussian',0,0.01);
end
if(get(handles.popupmenu1,'value')==2)
    n=imnoise(i,'salt & pepper',0.05);
end
if(get(handles.popupmenu1,'value')==3)
    n=imnoise(i,'speckle',0.04); 
end
if(get(handles.popupmenu1,'value')==4)
  n=imnoise(i,'poisson');
end
   
axes(handles.axes2);
imshow(n);
setappdata(0,'n',n);

 
    

    



% --- Executes on button press in filtre.
function filtre_Callback(hObject, eventdata, handles)

img=getappdata(0,'img');   
f=getappdata(0,'n');
   if(get(handles.popupmenu2,'value')==1)
       res=wiener2(f,[5 5]);
   end
   if(get(handles.popupmenu2,'value')==2)
       res=imfilter(f,fspecial('average',[7 7]));
   end
   if(get(handles.popupmenu2,'value')==3)
       res=ordfilt2(f,1,ones(3,3));
    end
    if(get(handles.popupmenu2,'value')==4)
       res=ordfilt2(f,5,ones(3,3));
    end
     if(get(handles.popupmenu2,'value')==5)
       res=ordfilt2(f,9,ones(3,3));
    end
       
 axes(handles.axes3);
 imshow(res);  
psnr1=psnr(img,res);
set(handles.edit1,'String',psnr1);


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)

cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');



function edit1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in upload2.
function upload2_Callback(hObject, eventdata, handles)
im=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.jif';'*.svg'});
im=imread(im);
axes(handles.axes1);
imshow(im);
setappdata(0,'im',im);


% --- Executes on selection change in rgbnoise.
function rgbnoise_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function rgbnoise_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in rgbfilter.
function rgbfilter_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function rgbfilter_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rgbn.
function rgbn_Callback(hObject, eventdata, handles)
type=get(handles.popupmenu1,'value');
im=getappdata(0,'im');
i=im;


if(get(handles.rgbnoise,'value')==1)
    noise=imnoise(i,'gaussian',0,0.01);
end
if(get(handles.rgbnoise,'value')==2)
    noise=imnoise(i,'salt & pepper',0.05);
end
if(get(handles.rgbnoise,'value')==3)
    noise=imnoise(i,'speckle',0.04); 
end
if(get(handles.rgbnoise,'value')==4)
  noise=imnoise(i,'poisson');
end
   
axes(handles.axes2);
imshow(noise);
setappdata(0,'noise',noise);


% --- Executes on button press in rgbf.
function rgbf_Callback(hObject, eventdata, handles)
im=getappdata(0,'im');   
f=getappdata(0,'noise');
   if(get(handles.rgbfilter,'value')==1)
       R=f(:,:,1);
       V=f(:,:,2);
       B=f(:,:,3);

       R1=wiener2(R,[5 5]);
       V1=wiener2(V,[5 5]);
       B1=wiener2(B,[5 5]);
       If(:,:,1)=R1;
       If(:,:,2)=V1;
       If(:,:,3)=B1;
   end
   if(get(handles.rgbfilter,'value')==2)
       R=f(:,:,1);
       V=f(:,:,2);
       B=f(:,:,3);

       R1=imfilter(R,fspecial('average',[5 5]));
       V1=imfilter(V,fspecial('average',[5 5]));
       B1=imfilter(B,fspecial('average',[5 5]));
       If(:,:,1)=R1;
       If(:,:,2)=V1;
       If(:,:,3)=B1;
   end
   if(get(handles.rgbfilter,'value')==3)
       R=f(:,:,1);
       V=f(:,:,2);
       B=f(:,:,3);
       
       R1=ordfilt2(R,1,ones(3,3));
       V1=ordfilt2(V,1,ones(3,3));
       B1=ordfilt2(B,1,ones(3,3));
       If(:,:,1)=R1;
       If(:,:,2)=V1;
       If(:,:,3)=B1;
    end
    if(get(handles.rgbfilter,'value')==4)
       R=f(:,:,1);
       V=f(:,:,2);
       B=f(:,:,3);
       
       R1=ordfilt2(R,5,ones(3,3));
       V1=ordfilt2(V,5,ones(3,3));
       B1=ordfilt2(B,5,ones(3,3));
       If(:,:,1)=R1;
       If(:,:,2)=V1;
       If(:,:,3)=B1;
    end
     if(get(handles.rgbfilter,'value')==5)
       R=f(:,:,1);
       V=f(:,:,2);
       B=f(:,:,3);
       
       R1=ordfilt2(R,9,ones(3,3));
       V1=ordfilt2(V,9,ones(3,3));
       B1=ordfilt2(B,9,ones(3,3));
       If(:,:,1)=R1;
       If(:,:,2)=V1;
       If(:,:,3)=B1;
    end
       
 axes(handles.axes3);
 imshow(If);  
psnr2=psnr(im,If);
set(handles.psnr2,'String',psnr2);


% --- Executes on button press in supp.
function supp_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');



function psnr2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function psnr2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
