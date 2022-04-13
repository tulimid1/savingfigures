function auto_save(fig_name, varargin)
%{
auto_save - Automatically save figures in an organized manner 
- Adapted from best_save and created on April 11, 2022

INPUTS:
fig_name: figure name (class: string)

varargin: (use name-value pairs) 
    close_after: close figure after saved, default=true (class: boolean)
    fig_handle: figure handle
    extension: extension to save file, default='.png' (class: string) 
    bg_color: background color, default='current'
    custom_folder: custom folder name to save in, default='' (class: string)
    folder_level: level for custom folder, default=3
        level 1: pwd 
        level 2: figures folder 
        level 3: current date folder 
%}

% sup: save in supplemental folder
% paper: save in paper sub folder, 
% 

%% Parse inputs 
p = inputParser;
addRequired(p, 'fig_name', @mustBeText);             
addParameter(p, 'close_after', true, @islogical);             
addParameter(p, 'fig_handle', gcf, @(x) strcmpi(class(x), 'matlab.ui.Figure'));                           
addParameter(p, 'extension', '.png', @mustBeText);    
addParameter(p, 'bg_color', 'current', @mustBeText);  
addParameter(p, 'custom_folder', '', @mustBeText);
addParameter(p, 'folder_level', 3, @(x) isscalar(x) & x>=1 & x<=3 & rem(x,1)==0); 
parse(p, fig_name, varargin{:}); % parse 

%% Set up 
current_dir = pwd;
date_dir = sprintf('%s', date); 
full_fig_name = append(fig_name, p.Results.extension); 

%% Go to specific location 

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

% Save to folder (exportgraphics saves subplots better) 
saveFigure(p.Results.fig_handle, full_fig_name, p.Results.bg_color); 

%% Close and return to working directory 
if p.Results.close_after
    close(p.Results.fig_handle)
end
cd(current_dir)

end

function saveFigure(figure_handle, figure_name, bg_color)
if ~contains(figure_name, '.fig')
    exportgraphics(figure_handle, figure_name, 'backgroundcolor', bg_color);
else
    savefig(figure_handle, figure_name);
end
end

function find_create_enter_folder(folder_name)
%{
find_create_enter_folder - find or create and enter a folder 

INPUTS:
folder_name: folder name to search/create and enter 
%}
if ~isfolder(folder_name)
    mkdir(folder_name)
end
cd(folder_name)
end