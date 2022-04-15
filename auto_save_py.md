---
layout: page
title: Python
---

# [auto_save()](https://github.com/tulimid1/savingfigures/blob/main/savingfigures/savingfigures.py)
---

Save figures systematically to keep clean organization. See [Using_SaveFiles.ipynb](https://github.com/tulimid1/savingfigures/blob/main/Using_SaveFiles.ipynb) for a notebook with examples. 

## Syntax
---

[auto_save(fig_obj, fig_name)](#a)

[auto_save(fig_obj, fig_name, Name=Value)](#b)

## Description
---
### A
auto_save([fig_obj](#fig_obj), [fig_name](#fig_name)) saves the figure object as `fig_name` in a folder labeled with the current date. [example](#basic-save)

### B
auto_save([fig_obj](#fig_obj), [fig_name](#fig_name), [Name=Value](#name-value-arguments)) saves figure in a folder with additional options specified by one or more name-value pair arguments. For example, you can save to supplemental folder inside the current folder or not close the figure after it's saved. [example](#save-to-supplemental)

## Examples 
---
### Basic save
Import libraries 

    import numpy as np 
    import matplotlib.pyplot as plt
    import savingfigures as sf 
    
Create figure
    
    # create some figure 
    x = np.linspace(0, 2*np.pi, 100)

    fig1 = plt.figure()
    plt.plot(x, np.sin(x), lw=3)
    plt.show()

![FIG1](/assets/testFig1py.png)

Save figure 

    sf.auto_save(fig1, 'testFig1') # normal folder 

### Save to supplemental
Save figure to supplemental folder inside of current date's folder.

Import libraries 

    import numpy as np 
    import matplotlib.pyplot as plt
    import savingfigures as sf 
    
Create figure
    
    # create some figure 
    x = np.linspace(0, 2*np.pi, 100)

    fig2 = plt.figure()
    plt.plot(x, np.cos(x), lw=3)
    plt.show()

Save figure 

    auto_save(fig2, 'testFig2', custom_folder='supplemental', folder_level=2) # put in supplemental folder  

### Don't close after saving 
Don't close the figure object after it is saved.

Import libraries 

    import numpy as np 
    import matplotlib.pyplot as plt
    
Create figure
    
    # create some figure 
    x = np.linspace(0, 2*np.pi, 100)

    fig1 = plt.figure()
    plt.plot(x, np.sin(x), lw=3)
    plt.show()

Save figure 

    auto_save(fig1, 'testfig1', close_after=False)

## Input Arguments
---
### ```fig_obj```
Figure object to be saved. 

Object of figure to be saved via auto_save() function. Preferably matplotlib.pyplot.figure(). 

    fig = matplotlib.pyplot.figure()

Data Types: (figure object)

### ```fig_name```
Name of file figure should be named. 

File name for figure. Extension will default as .png. 

Data Types: (str)

### Name-Value Arguments

Specified optional pairs of ```Name=Value``` arguments. ```Name``` is the is the argument name and ```Value``` is the corresponding value. You can specify several name and value pair arguments in any order as ```Name1=Value1,...,NameN=ValueN```. 

**Example**: ```close_after=True, custom_folder='supplemental', folder_level=2``` specifies function to save the figure in a subfolder called supplemental and to close the figure after it is saved. 

### ```close_after```
Close figure after saved. (default=True)

Whether or not to close figure after it has been saved in appropriate location. 

Data Types: (boolean)

### `extension`
Extension for figure file (default='.png').

The file extension for the figure being saved. 

Data Types: (str)

### `custom_folder`
Name of custom folder to save figure in (default='')

Folder name that will store the figure that is being saved. 

Data Types: (char)

### `folder_level`
Directory level to create the custom folder (default=3)

The level on directory to save the custom folder with saved figure inside. 

The levels are as follows:
    1 = working directory
    2 = working directory > figures folder
    3 = working directory > figures folder > date folder

Data Types: (int, x >=1 & x <=3)

## More About 
---

When the function is called for the first time in a new directory, it will create a **figures** folder (code_folder/figures).  When the function is called for the first time in a day in a directory where it has already been called previously, it will create a folder labeled with the current date below the **figures** folder (code_folder/figures/MM_DD_YYY). 

To fully understand how the `custom_folder` and `folder_level` arguments work, it's best to run the example notebook on your device and look at the directory aftermath. It is helpful to change the names to see where figures end up. One can also see this on the [repo](https://github.com/tulimid1/savingfigures) that hosts this function.

## Tips 
---

If you get an error or pause execution while this function is working, you will need to reset your directory. IF you do not, the next time it runs successfully, your figures will be saved in a place you are not expecting. 

## See also
---

[writeGif()](https://github.com/tulimid1/savingfigures/blob/main/savingfigures/savingfigures.py)

## Issues and Discussion 
---

[Issues](https://github.com/tulimid1/savingfigures/issues) and [Discussion](https://github.com/tulimid1/savingfigures/discussions).

If you don't know how to use github (or don't want to), just send me an [email](mailto:tulimid@udel.edu). 
