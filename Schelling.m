function varargout = Schelling(varargin)
% SCHELLING MATLAB code for Schelling.fig
%      SCHELLING, by itself, creates a new SCHELLING or raises the existing
%      singleton*.
%
%      H = SCHELLING returns the handle to a new SCHELLING or the handle to
%      the existing singleton*.
%
%      SCHELLING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCHELLING.M with the given input arguments.
%
%      SCHELLING('Property','Value',...) creates a new SCHELLING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Schelling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Schelling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Schelling

% Last Modified by GUIDE v2.5 05-Oct-2016 22:28:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Schelling_OpeningFcn, ...
    'gui_OutputFcn',  @Schelling_OutputFcn, ...
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
end

% --- Executes just before Schelling is made visible.
function Schelling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Schelling (see VARARGIN)

% Choose default command line output for Schelling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Schelling wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = Schelling_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on slider movement.
function sim_slider_Callback(hObject, eventdata, handles)
% hObject    handle to sim_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global sim;
sim = get(hObject,'Value');
set(handles.sim_percent,'String',[num2str(sim),'%']);
end


% --- Executes during object creation, after setting all properties.
function sim_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sim_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
global sim;
sim = 30;
set(hObject,'Value',30);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes on slider movement.
function empty_slider_Callback(hObject, eventdata, handles)
% hObject    handle to empty_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global empty;
empty = get(hObject,'Value');
set(handles.empty_percent,'String',[num2str(empty),'%']);
end


% --- Executes during object creation, after setting all properties.
function empty_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to empty_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
global empty;
empty = 10;
set(hObject,'Value',10);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes on slider movement.
function ratio_slider_Callback(hObject, eventdata, handles)
% hObject    handle to ratio_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global ratio;
ratio = get(hObject,'Value');
set(handles.ratio_percent,'String',[num2str(ratio),'%/',num2str(100-ratio),'%']);
end


% --- Executes during object creation, after setting all properties.
function ratio_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ratio_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
global ratio;
ratio = 50;
set(hObject,'Value',50);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
orig1=ones(1,90);
orig2=2*ones(1,405);
orig3=3*ones(1,405);
orig =[orig1 orig2 orig3] ; % 数据源
index = randperm(900); % 将 1-m 的顺序打乱
global R;
global map;
R = orig(index); % 按打乱的索引将源数据转入 R
R = reshape(R,30,30); % 分成 n 组，每行为一组
axes(hObject);
map=[1 1 1; 1 0 0; 0 0 1];
image(R);
colormap(map);
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over empty_slider.
function empty_slider_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to empty_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on slider movement.
function size_slider_Callback(hObject, eventdata, handles)
% hObject    handle to size_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global size;
size = get(hObject,'Value');
set(handles.size_percent,'String',[num2str(size),'*',num2str(size)]);
end


% --- Executes during object creation, after setting all properties.
function size_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
global size;
size = 30;
set(hObject,'Value',30);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes during object creation, after setting all properties.
function empty_percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to empty_percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'String','10%');
end


% --- Executes during object creation, after setting all properties.
function ratio_percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ratio_percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'String','50%/50%');
end


% --- Executes during object creation, after setting all properties.
function size_percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size_percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'String','30*30');
end


% --- Executes during object creation, after setting all properties.
function sim_percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sim_percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'String','30%');
end


% --- Executes on button press in step_btn.
function step_btn_Callback(hObject, eventdata, handles)
% hObject    handle to step_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global size;
global empty;
global ratio;
global sim;
global R;
global count;
global map;
m = size * size; % 数据总数
empty_tmp = round(m * empty / 100);
ratio_tmp = round((m - empty_tmp) * ratio / 100);
sim_tmp = sim / 100;
str_tmp = get(handles.round_text,'String');
not_satis_red=[];
not_satis_blue=[];
empty_now=[];
for i=1:size
    for j=1:size
        switch R(i,j)
            case 1
                empty_now = [empty_now (j-1)*size+i];
            case 2
                satis_tmp = 0;
                amount_tmp = 0;
                if i ~= 1 && R(i-1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= 1 && R(i,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= size && R(i,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && R(i+1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && R(i-1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= 1 && R(i,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= size && R(i,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && R(i+1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if satis_tmp<round(sim_tmp*amount_tmp)
                    not_satis_red =[not_satis_red (j-1)*size+i];
                end
            case 3
                satis_tmp = 0;
                amount_tmp = 0;
                if i ~= 1 && R(i-1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= 1 && R(i,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= size && R(i,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && R(i+1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && R(i-1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= 1 && R(i,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= size && R(i,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && R(i+1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if satis_tmp<round(sim_tmp*amount_tmp)
                    not_satis_blue =[not_satis_blue (j-1)*size+i];
                end
        end
    end
end
pool = [not_satis_red not_satis_blue empty_now];
index = randperm(length(pool)); % 将 1-m 的顺序打乱
pool = pool(index);
R=reshape(R,1,m);
for i=1:length(not_satis_red)
    R(1,pool(1,i)) = 2;
end
for i=1:length(not_satis_blue)
    R(1,pool(1,i+length(not_satis_red))) = 3;
end
for i=1:length(empty_now)
    R(1,pool(1,i+length(not_satis_red)+length(not_satis_blue))) = 1;
end
R = reshape(R,size,size); % 分成 n 组，每行为一组
axes(findobj('Tag','axes1'));
image(R);
colormap(map);
count = count + 1;
set(handles.round_text,'String', ['ROUND ' int2str(count)]);
satisfied = m - empty_tmp;
for i=1:size
    for j=1:size
        switch R(i,j)
            case 2
                satis_tmp = 0;
                amount_tmp = 0;
                if i ~= 1 && R(i-1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= 1 && R(i,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= size && R(i,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && R(i+1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && R(i-1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= 1 && R(i,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= size && R(i,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && R(i+1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if satis_tmp<round(sim_tmp*amount_tmp)
                    satisfied = satisfied - 1;
                end
            case 3
                satis_tmp = 0;
                amount_tmp = 0;
                if i ~= 1 && R(i-1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= 1 && R(i,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= size && R(i,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && R(i+1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && R(i-1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= 1 && R(i,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= size && R(i,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && R(i+1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if satis_tmp<round(sim_tmp*amount_tmp)
                   satisfied = satisfied - 1;
                end
        end
    end
end
set(handles.sat_text,'String',['SATISFIED ' num2str(satisfied/(m-empty_tmp)*100,'%.2f') '%']);

global datas;
datas = [datas satisfied/(m-empty_tmp)*100];
axes(findobj('Tag','axes2'));
plot(datas);

global record;
record(end,5) = satisfied/(m-empty_tmp)*100;
if satisfied/(m-empty_tmp) == 1
    record(end,6) = count;
    set(handles.step_btn,'Enable','off');
end
set(findobj('Tag','record1'),'Data',record);
end


% --- Executes during object creation, after setting all properties.
function step_btn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


% --- Executes on button press in start_btn.
function start_btn_Callback(hObject, eventdata, handles)
% hObject    handle to start_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global size;
global empty;
global ratio;
global R;
global sim;
global count;
global map;
m = size * size; % 数据总数
empty_tmp = round(m * empty / 100);
ratio_tmp = round((m - empty_tmp) * ratio / 100);
sim_tmp = sim / 100;
orig1=ones(1,empty_tmp);
orig2=2*ones(1,ratio_tmp);
orig3=3*ones(1,m-empty_tmp-ratio_tmp);
orig = [orig1 orig2 orig3];
id = randperm(m); % 将 1-m 的顺序打乱
R = orig(id); % 按打乱的索引将源数据转入 R 搜索
R = reshape(R,size,size);
axes(findobj('Tag','axes1'));
image(R);
colormap(map);
count = 0;
set(handles.round_text,'String','ROUND 0');
set(handles.step_btn,'Enable','on');
set(handles.clr_btn,'Enable','on');
set(hObject,'String','RESTART');
satisfied = m - empty_tmp;
for i=1:size
    for j=1:size
        switch R(i,j)
            case 2
                satis_tmp = 0;
                amount_tmp = 0;
                if i ~= 1 && R(i-1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= 1 && R(i,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= size && R(i,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && R(i+1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && R(i-1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= 1 && R(i,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= size && R(i,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && R(i+1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if satis_tmp<round(sim_tmp*amount_tmp)
                    satisfied = satisfied - 1;
                end
            case 3
                satis_tmp = 0;
                amount_tmp = 0;
                if i ~= 1 && R(i-1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= 1 && R(i,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if j ~= size && R(i,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && R(i+1,j) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) == R(i,j) satis_tmp = satis_tmp + 1; end
                if i ~= 1 && j ~= 1 && R(i-1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && R(i-1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= 1 && j ~= size && R(i-1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= 1 && R(i,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if j ~= size && R(i,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= 1 && R(i+1,j-1) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && R(i+1,j) ~= 1 amount_tmp = amount_tmp + 1; end
                if i ~= size && j ~= size && R(i+1,j+1) ~= 1 amount_tmp = amount_tmp + 1; end
                if satis_tmp<round(sim_tmp*amount_tmp)
                   satisfied = satisfied - 1;
                end
        end
    end
end
set(handles.sat_text,'String',['SATISFIED ' num2str(satisfied/(m-empty_tmp)*100,'%.2f') '%']);

global datas;
datas = [satisfied/(m-empty_tmp)*100];
axes(findobj('Tag','axes2'));
plot(datas);

global record;
B_tmp = [size empty sim ratio satisfied/(m-empty_tmp)*100 0];
record = [record; B_tmp];
set(findobj('Tag','record1'),'Data',record);
end


% --- Executes on button press in clr_btn.
function clr_btn_Callback(hObject, eventdata, handles)
% hObject    handle to clr_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global record;
record = [];
set(findobj('Tag','record1'),'Data',record);
set(handles.clr_btn,'Enable','off');
set(handles.step_btn,'Enable','off');
end
