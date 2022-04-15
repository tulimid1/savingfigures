---
layout: page
title: Python
---

# [writeGif()](https://github.com/tulimid1/savingfigures/blob/main/savingfigures/savingfigures.py)
---

Create a .gif file animation. See [Using_SaveFiles.ipynb](https://github.com/tulimid1/savingfigures/blob/main/Using_SaveFiles.ipynb) for a notebook of examples. 

## Syntax
---

[writeGif(filenameG, filenames)](#a)

[writeGif(filenameG, filenames, Name=Value)](#b)

## Description
---
### A
writeGif([filenameG](#filenameg), [filenames](#filenames)) saves a .gif file labeled [filenameG](#filenameg) that animates files in [filenames](#filenames). [example](#simple-example)

### B 
writeGif([filenameG](#filenameg), [filenames](#filenames), [Name=Value](#name-value-arguments)) saves a .gif file with additional options specified by one or more name-value pair arguments. For example, you can save to a supplemental folder. [example](#save-to-supplemental)

## Examples 
---
### Simple example
Sine wave gif. 

    # import libraries
    import numpy as np 
    import matplotlib.pyplot as plt
    
    x_end = np.linspace(2*np.pi, 4*np.pi, 100) # make look bigger 
    fnamesSIN = [] # storing file names for gif

    for xE in x_end:
        x = np.linspace(0, xE, 100)

        # make a figure (sine)
        fig1 = plt.figure()
        plt.plot(x, np.sin(x), lw=3)

        # iteratively define filename 
        filename1 = f'{xE}SIN.png'
        fnamesSIN.append(filename1) # store file names 
        auto_save(fig1, filename1) # save 

    # write figure files to a gif
    writeGif('testGif1', fnamesSIN)

![FIG1](/assets/testGif1py.gif)

### Save to supplemental
Cosine wave gif

    # import libraries
    import numpy as np 
    import matplotlib.pyplot as plt
    
    x_end = np.linspace(2*np.pi, 4*np.pi, 100) # make look bigger 
    fnamesCOS = [] # storing file names for gif

    for xE in x_end:
        x = np.linspace(0, xE, 100)

        # make a figure (cosine)
        fig2 = plt.figure()
        plt.plot(x, np.cos(x), lw=3)

        # iteratively define filename 
        filename2 = f'{xE}COS.png'
        fnamesCOS.append(filename2) # store file names 
        auto_save(fig2, filename2, custom_folder='level2', folder_level=2) # save 

    # write figure files to a gif
    writeGif('testGif2', fnamesCOS, custom_folder='level2', folder_level=2) # figures folder level 

## Input Arguments
---
### ```filenameG```
Filename for .gif file.

Desired name of gif file. Final gif file = `filenameG + .gif`

Data Types: (str)

### ```filenames```
List of filenames to be written as a gif

Names of files that will be appended together to create animation. 

Data Types: (list, vector)

### Name-Value Arguments

Specified optional pairs of ```Name=Value``` arguments. ```Name``` is the is the argument name and ```Value``` is the corresponding value. You can specify several name and value pair arguments in any order as ```Name1=Value1,...,NameN=ValueN```. 

**Example**: ```fps=5``` specifies a gif file that runs at 5 frames per second. 

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

This function uses methodology [auto_save()](https://github.com/tulimid1/savingfigures/blob/main/savingfigures/savingfigures.py). 

## Tips 
---

## See also 
---
[auto_save()](https://github.com/tulimid1/savingfigures/blob/main/savingfigures/savingfigures.py)

## Issues and Discussion 
---

[Issues](https://github.com/tulimid1/savingfigures/issues) and [Discussion](https://github.com/tulimid1/savingfigures/discussions).

If you don't know how to use github (or don't want to), just send me an [email](mailto:tulimid@udel.edu). 
