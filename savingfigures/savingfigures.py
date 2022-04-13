# saving figures and gifs

from datetime import date


def auto_save(fig_obj, fig_name, close_after=True, extension='.png', custom_folder='', folder_level=3):
    '''
    Automatically save figures in an organized manner

    INPUTS:
    fig_obj: figure object, object 
    fig_name: figure name, string 
    close_after: close figure after saving, boolean 
    extension: extension for figure file, default='.png (not friendly with other formats)
    custom_folder: custom folder name to save in, default='', string
    folder_level: level for custom folder, default=3
        level 1: current folder 
        level 2: figures folder 
        level 3: date folder 
    '''

    # import needed library 
    import os 
    import datetime
    import matplotlib

    ## Set up 
    cwd = os.getcwd()
    today = datetime.datetime.now()
    date_dir = today.strftime("%m_%d_%Y")

    ## Go to specific location 
    if custom_folder=='':
        find_create_enter_folder(cwd+'/figures')
        find_create_enter_folder(cwd+'/figures/'+date_dir)
    else : 
        if folder_level == 1: # working directory 
            os.chdir(cwd)
        elif folder_level == 2: # figures folder 
            find_create_enter_folder(cwd+'/figures')
        elif folder_level == 3: # current date folder 
            find_create_enter_folder(cwd+'/figures')
            find_create_enter_folder(cwd+'/figures/'+date_dir)
        find_create_enter_folder(cwd+'/figures/'+custom_folder)

    # save 
    saveFigure(fig_obj=fig_obj, fig_name=fig_name)

    ## Close and return to working directory 
    if close_after: # close 
        matplotlib.pyplot.close(fig_obj)
    os.chdir(cwd)

    # local functions 
    def find_create_enter_folder(path):
        if not os.path.exist(path):
            os.mkdir(path)
        os.chdir(path)
    def saveFigure(fig_obj, fig_name):
        if '.png' in fig_name:
            fig_obj.savefig(fig_name, bbox_inches='tight')
        else:
            fig_obj.savefig(fig_name+'.png', bbox_inches='tight')


def writeGif(filenameG, filenames, supplemental=False, fps=25):
    '''
    Save figure files as gif file and delete figures used to create gif 

    INPUTS:
    filenameG: filename for .gif file 
    filenames: filenames of individual figures to be saved together as gif
    supplemental: put in supplemental or not, boolean

    OUTPUTS:
    .gif file of files in filenmae 
    '''
    import imageio 
    import os 
    import datetime
    import matplotlib

    # current working directory 
    cwd = os.getcwd(); 

    # Does figures folder exist? 
    if os.path.exists(cwd+'/figures') == False: 
        # it doesn't exist
        # create a new figures folder 
        os.mkdir(cwd+'/figures')

    # Make figures folder the current working directory 
    os.chdir(cwd+'/figures')

    # Does current date sub folder exist 
    today = datetime.datetime.now()
    cur_day = today.strftime("%m_%d_%Y")

    # Does current date folder exist? 
    if os.path.exists(cwd+'/figures'+'/'+cur_day) == False:
        # it doesn't exist 
        # create a new date folder 
        os.mkdir(cwd+'/figures'+'/'+cur_day)

    # Make date subfolder the current working directory 
    os.chdir(cwd+'/figures'+'/'+cur_day)

    # Save in supplemental folder ?
    if supplemental:
        if os.path.exists(cwd+'/figures'+'/'+cur_day+'/'+'Supplemental') == False:
            os.mkdir(cwd+'/figures'+'/'+cur_day+'/'+'Supplemental')
        os.chdir(cwd+'/figures'+'/'+cur_day+'/'+'Supplemental')

    with imageio.get_writer(filenameG+'.gif', mode='I', fps=fps) as writer:
        for filename in filenames:
            image = imageio.imread(filename)
            writer.append_data(image) # add to gif 
            os.remove(filename) # delete individual 
    
    # Get back to original folder 
    os.chdir(cwd)