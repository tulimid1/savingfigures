---
layout: page
title: MATLAB
---

# [auto_save](https://github.com/tulimid1/savingfigures/blob/main/auto_save.m)
---

Save figures systematically to keep clean organization. See [Using_SaveFiles.mlx](https://github.com/tulimid1/savingfigures/blob/main/Using_SaveFiles.mlx) for a notebook with examples. 

## Syntax
---

[auto_save(fig_name)](#a)

[auto_save(fig_name, Name=Value)](#b)

## Description
---
### A
auto_save([fig_name](#fig_name)) saves the current figure as `fig_name` in a folder labeled with the current date and closes the figure. [example](#basic-save)

### B 
auto_save([fig_name](#fig_name), [Name=Value](#name-value-arguments)) saves current figure in folder of current date with additional options specified by one or more name-value pair arguments. For example, you can opt to not close the figure. [example](#do-not-close-after-saving)

## Examples 
---
### Basic save
Create figure
    
    x = linspace(0, 2*pi, 100); % to evaluate

    % visualize
    figure()
    plot(x, sin(x), 'linewidth', 2);

![FIG1](/assets/testFig1_m.png)

Save figure 

    auto_save('testFig1') % normal folder 

### Do not close after saving
Save figure and don't close it. 

Create figure
    
    x = linspace(0, 2*pi, 100); % to evaluate
    
    figure()
    plot(x, cos(x), 'linewidth', 2);

Save figure 

    best_save('testFig2', 'close_after', false)

## Input Arguments
---
### ```fig_name```
Name of file figure should be saved as. 

File name for figure. Extension will default as .png. 

Data Types: (str)

### Name-Value Arguments

Specified optional pairs of ```Name=Value``` arguments. ```Name``` is the is the argument name and ```Value``` is the corresponding value. You can specify several name and value pair arguments in any order as ```Name1=Value1,...,NameN=ValueN```. 

**Example**: ```'close_after', true, 'bg_color', 'w''``` specifies the function to save the figure with a white background and close the figure after it has been saved. 

### ```close_after```
Close figure after saved. (default=true)

Whether or not to close figure after it has been saved in appropriate location. 

Data Types: (boolean)

### `fig_handle`
Figure handle to be saved. (default=gcf())

Which figure handle to save. Useful if multiple figures are being created in odd orders. 

### `extension`
File extension (defualt='.png')

What extension to give figure file. 

Data Types: (char)

### `bg_color`
Background color for figure (default='current')

The background color for the saved figure. 

Data Types: (char)

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

When the function is called for the first time in a new directory, it will create a **figures** folder (code_folder/figures). When the function is called for the first time in a day in a directory where it has already been called previously, it will create a folder labeled with the current date below the **figures** folder (code_folder/figures/DD_MMM_YYYY). 

To fully understand how the `custom_folder` and `folder_level` arguments work, it's best to run the example notebook on your device and look at the directory aftermath. It is helpful to change the names to see where figures end up. One can also see this on the [repo](https://github.com/tulimid1/savingfigures) that hosts this function.

## Tips 
---

If you get an error or pause execution while this function is working, you will need to reset your directory. If you do not, it will look like it is not working, but most likely it is working, it's just saving your figures in a place you do not realize. 

I would suggest adding both `auto_save.m` and `functionSignatures.json` to a folder that is in your MATLAB path. The `auto_save.m` contains the function and the `functionSignatures.json` will give custom suggestions and code completion for when you call `auto_save` in a script or notebook. 

If you already have a `functionSignatures.json` file in your folder, just add the pertinent code to your `functionSignatures.json`. 

## See also
---

[writeGif](https://github.com/tulimid1/savingfigures/blob/main/writeGif.m)

## Issues and Discussion 
---

[Issues](https://github.com/tulimid1/savingfigures/issues) and [Discussion](https://github.com/tulimid1/savingfigures/discussions).

If you don't know how to use github (or don't want to), just send me an [email](mailto:tulimid@udel.edu). 
