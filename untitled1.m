
function varargout = untitled1(varargin)
% UNTITLED1 MATLAB code for untitled1.fig
%      UNTITLED1, by itself, creates a new UNTITLED1 or raises the existing
%      singleton*.
%
%      H = UNTITLED1 returns the handle to a new UNTITLED1 or the handle to
%      the existing singleton*.
%
%      UNTITLED1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED1.M with the given input arguments.
%
%      UNTITLED1('Property','Value',...) creates a new UNTITLED1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 21-Nov-2020 12:03:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
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


% --- Executes just before untitled1 is made visible.
function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)

% Choose default command line output for untitled1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SFD.
function SFD_Callback(hObject, eventdata, handles)
% hObject    handle to SFD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SFD


% --- Executes on button press in FSD.
function FSD_Callback(hObject, eventdata, handles)
% hObject    handle to FSD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FSD


% --- Executes on button press in TST.
function TST_Callback(hObject, eventdata, handles)
% hObject    handle to TST (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TST


% --- Executes on button press in btn.
function btn_Callback(hObject, eventdata, handles)
% hObject    handle to btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ik=[118.21 155.77 191.77 225.86 257.7 286.94];
Vk=[2933.6 3190.17 3414.94 3605.64 3760.4 3877.65];
Vlength=length(Vk);
Ilength=length(Ik);
Irms=400;
Vrms=4000;
Irms_max=1.2*Irms;
W=2*pi*50;
h=1/3144.654088;
Vm_SFD(1)=0;
Vm_SFD_rms(1)=0;
Im_SFD(1)=0;
Im_SFD_rms(1)=0;
ThetaV_SFD(1)=0;
ThetaI_SFD(1)=0;
Theta_SFD(1)=0;
Z_mag_SFD(1)=0;
Error_SFD(1)=0;
Vm_FSD(Vlength)=0;
Vm_FSD_rms(Vlength)=0;
Im_FSD(Vlength)=0;
Im_FSD_rms(Vlength)=0;
ThetaV_FSD(Vlength)=0;
ThetaI_FSD(Vlength)=0;
Theta_FSD(Vlength)=0;
Z_mag_FSD(Vlength)=0;
Error_FSD(Vlength)=0;
Vm_TST(Vlength)=0;
Vm_TST_rms(Vlength)=0;
Im_TST(Vlength)=0;
Im_TST_rms(Vlength)=0;
Theta_TST(Vlength)=0;
Z_mag_TST(Vlength)=0;
Error_TST(Vlength)=0;
flag=0;
for k=2:Vlength
    Vm_SFD(k)=sqrt(((Vk(k)).^2)+(((1/(h.^2))*((Vk(k)-Vk(k-1)).^2))/(W.^2)));
    Vm_SFD_rms(k)=Vm_SFD(k)/sqrt(2);
    ThetaV_SFD(k)=atan((W*Vk(k))/((1/h)*(Vk(k)-Vk(k-1))))*(180/pi);
end
for k=2:length(Ik)
    Im_SFD(k)=sqrt(((Ik(k)).^2)+(((1/(h.^2))*((Ik(k)-Ik(k-1)).^2))/(W.^2)));
    Im_SFD_rms(k)=Im_SFD(k)/sqrt(2);
    ThetaI_SFD(k)=atan((W*Ik(k))/((1/h)*(Ik(k)-Ik(k-1))))*(180/pi);
    Theta_SFD(k)=ThetaV_SFD(k)-ThetaI_SFD(k);
    Z_mag_SFD(k)=Vm_SFD_rms(k)/Im_SFD_rms(k);
    Error_SFD(k)=abs(Irms-Im_SFD(k));
end

for j=1:Vlength
    count(j)=j;
end


for k=2:Vlength-1
    Vm_FSD_Dash(k)=(1/(2*h))*(Vk(k+1)-Vk(k-1));
    Vm_FSD_DDash(k)=(1/(h.^2))*(Vk(k+1)-(2*Vk(k))+Vk(k-1));
    Vm_FSD(k)=sqrt((1/(W.^2))*((Vm_FSD_Dash(k).^2)+((Vm_FSD_DDash(k).^2)/(W.^2))));
    Vm_FSD_rms(k)=Vm_FSD(k)/sqrt(2);
    ThetaV_FSD(k)=atan(Vm_FSD_DDash(k)/(W*Vm_FSD_Dash(k)))*(-180/pi);
end
for k=2:length(Ik)-1
    Im_FSD_Dash(k)=(1/(2*h))*(Ik(k+1)-Ik(k-1));
    Im_FSD_DDash(k)=(1/(h.^2))*(Ik(k+1)-(2*Ik(k))+Ik(k-1));
    Im_FSD(k)=sqrt((1/(W.^2))*((Im_FSD_Dash(k).^2)+((Im_FSD_DDash(k).^2)/(W.^2))));
    Im_FSD_rms(k)=Im_FSD(k)/sqrt(2);
    ThetaI_FSD(k)=atan(Im_FSD_DDash(k)/(W*Im_FSD_Dash(k)))*(-180/pi);
    Theta_FSD(k)=ThetaV_FSD(k)-ThetaI_FSD(k);
    Z_mag_FSD(k)=Vm_FSD_rms(k)/Im_FSD_rms(k);
    Error_FSD(k)=abs(Irms-Im_FSD(k));
end

for k=1:Vlength-1
    Vm_TST(k)=sqrt((Vk(k).^2)+(Vk(k+1).^2)-(2*Vk(k)*Vk(k+1)*(cos(W*h))))/(sin(W*h));
    Vm_TST_rms(k)=Vm_TST(k)/sqrt(2);
end
for k=1:Vlength-1
    Im_TST(k)=sqrt((Ik(k).^2)+(Ik(k+1).^2)-(2*Ik(k)*Ik(k+1)*(cos(W*h))))/(sin(W*h));
    Im_TST_rms(k)=Im_TST(k)/sqrt(2);
    Theta_TST(k)=acos(((Vk(k)*Ik(k))+(Vk(k+1)*Ik(k+1))-((Vk(k)*Ik(k+1)+Vk(k+1)*Ik(k))*cos(W*h)))/(Vrms*Irms*(sin(W*h).^2)))*(180/pi);
    Z_mag_TST(k)=Vm_TST_rms(k)/Im_TST_rms(k);
    Error_TST(k)=abs(Irms-Im_TST(k));
end
flag=0;
for i=1:Vlength
    if Im_SFD_rms(i)>Irms_max
        flag=flag+1;
        OVCM(i)=1;
        if flag==2
            FVar=i;
        end
        if flag>2
            flag=2;
        end
    else
        OVCM(i)=0;
    end
end

grapbtngroup=get(handles.btngroup,'SelectedObject');
%modeSelection=get(grapbtngroup,'String');
modeSelection=get(eventdata,'String');
%26.0416259765625
if get(handles.SFD,'value')==1
    data_SFD=[Vm_SFD;Im_SFD;ThetaV_SFD;ThetaI_SFD;Theta_SFD;Z_mag_SFD;Error_SFD;OVCM];
    data_SFD_T=data_SFD';
    set(handles.table,'data',data_SFD_T);
    if flag~=2
        set(handles.edit,'string','there is no overcurrent');
    else
        set(handles.edit,'string','there is an overcurrent');
    end
    axes(handles.axes1);
    scatter(count,Vm_SFD_rms,'y');
    legend('Vm-rms');
    axes(handles.axes2);
    scatter(count,Im_SFD_rms,'m');
    legend('Im-rms');
    axes(handles.axes3);
    scatter(count,Z_mag_SFD,'c');
    legend('Z');
    axes(handles.axes4);
    scatter(count,ThetaV_SFD,'k');
    legend('ThetaV');
    axes(handles.axes5);
    scatter(count,ThetaI_SFD,'g');
    legend('ThetaI');
    axes(handles.axes7);
    scatter(count,Theta_SFD,'y');
    legend('Theta');
    axes(handles.axes8);
    scatter(count,Error_SFD,'b');
    legend('Error');
    
end
if get(handles.FSD,'value')==1
    data_FSD=[Vm_FSD;Im_FSD;ThetaV_FSD;ThetaI_FSD;Theta_FSD;Z_mag_FSD;Error_FSD;OVCM];
    data_FSD_T=data_FSD';
    set(handles.table,'data',data_FSD_T);
    if flag~=2
        set(handles.edit,'string','there is no overcurrent');
    else
        set(handles.edit,'string','there is an overcurrent');
    end
    axes(handles.axes1);
    scatter(count,Vm_FSD_rms,'y');
    legend('Vm-rms');
    axes(handles.axes2);
    scatter(count,Im_FSD_rms,'m');
    legend('Im-rms');
    axes(handles.axes3);
    scatter(count,Z_mag_FSD,'c');
    legend('Z');
    axes(handles.axes4);
    scatter(count,ThetaV_FSD,'k');
    legend('ThetaV');
    axes(handles.axes5);
    scatter(count,ThetaI_FSD,'g');
    legend('ThetaI');
    axes(handles.axes7);
    scatter(count,Theta_FSD,'y');
    legend('Theta');
    axes(handles.axes8);
    scatter(count,Error_FSD,'b');
    legend('Error');
end
if get(handles.TST,'value')==1
    ThetaI_TST=[0 0 0 0 0 0];
    ThetaV_TST=[0 0 0 0 0 0];
    data_TST=[Vm_TST;Im_TST;ThetaV_FSD;ThetaI_FSD;Theta_TST;Z_mag_TST;Error_TST;OVCM];
    data_TST_T=data_TST';
    set(handles.table,'data',data_TST_T);
    if flag~=2
        set(handles.edit,'string','there is no overcurrent');
    else
        set(handles.edit,'string','there is an overcurrent');
    end
    axes(handles.axes1);
    scatter(count,Vm_TST_rms,'y');
    legend('Vm-rms');
    axes(handles.axes2);
    scatter(count,Im_TST_rms,'m');
    legend('Im-rms');
    axes(handles.axes3);
    scatter(count,Z_mag_TST,'c');
    legend('Z');
    axes(handles.axes4);
    scatter(count,ThetaV_FSD,'k');
    legend('ThetaV');
    axes(handles.axes5);
    scatter(count,ThetaI_FSD,'g');
    legend('ThetaI');
    axes(handles.axes7);
    scatter(count,Theta_TST,'y');
    legend('Theta');
    axes(handles.axes8);
    scatter(count,Error_TST,'b');
    legend('Error');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit as text
%        str2double(get(hObject,'String')) returns contents of edit as a double


% --- Executes during object creation, after setting all properties.
function edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
