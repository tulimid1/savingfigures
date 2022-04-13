function writeGif(filename, iter, varargin)
%{
writeGif - Write gif in an organized manner
- Adapted from writeGif 

INPUTS:
filename: filename for gif file 
iter: iteration, first call must be 1 
varargin
    delayTime: delay time for gif 
    custom_folder: custom folder name to save in, default='' (class:string)
    folder_level: leve for custom folder, default=3
        level 1: pwd
        level 2: figures folder 
        level 3: current date folder
%}

% parse inputs 
p = inputParser();
addRequired(p, 'filename', @mustBeText);
addRequired(p, 'iter', @(x) x > 0 && isreal(x) && isnumeric(x));
addParameter(p, 'delayTime', 0.1, @mustBeNumeric);
addParameter(p, 'custom_folder', '', @mustBeText);
addParameter(p, 'folder_level', 3, @(x) isscalar(x) & x>=1 & x<=3 & rem(x,1)==0); 
parse(p, filename, iter, varargin{:}); 

%% Set up 
current_dir = pwd; 
date_dir = sprintf('%s', date); 

%% Go to specific locaiton 

if isempty(p.Results.custom_folder)
    find_create_enter_folder('figures');
    find_create_enter_folder(date_dir);
else 
    if p.Results.folder_level >= 2 % figures folder 
        find_create_enter_folder('figures');
    end
    if p.Results.folder_level == 3 % date folder 
        find_create_enter_folder(date_dir); 
    end
    find_create_enter_folder(p.Results.custom_folder);
end

%% Save to folder 
saveGif(iter, filename, p.Results.delayTime); 
cd(current_dir)
end

function saveGif(iter, filename, delayTime)
frame = getframe(gcf); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256); 
if iter == 1
    imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'delaytime', delayTime);
else
    imwrite(imind,cm,filename,'gif','WriteMode','append', 'delaytime', delayTime); 
end
end

function find_create_enter_folder(folder_name)
%{
find_create_enter_folder - find or create and enter a folder 

INPUTS:
folder_name: folder name to search/create and enter 
%}
if isfolder(folder_name)
    cd(folder_name)
else
    mkdir(folder_name)
    cd(folder_name)
end
end