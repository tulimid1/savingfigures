---
layout: page
title: MATLAB
---

# [writeGif](https://github.com/tulimid1/savingfigures/blob/main/writeGif.m)
---

Create a .gif file animation. See [Using_SaveFiles.mlx](https://github.com/tulimid1/savingfigures/blob/main/Using_SaveFiles.mlx) for a notebook of examples. 

## Syntax
---

[writeGif(filename, iter)](#a)

[writeGif(filename, iter, Name=Value)](#b)

## Description
---
### A
writeGif([filename](#filename), [iter](#iter)) saves a .gif file labeled [filename](#filename). [example](#simple-example)

### B 
writeGif([filename](#filename), [iter](#iter), [Name=Value](#name-value-arguments)) saves a .gif file with additional options specified by one or more name-value pair arguments. For example, you can save to a different folder. [example](#save-to-different-location)

## Examples 
---
### Simple example
Sine wave gif. 

    x = linspace(0, 2*pi, 100); % to evaluate

    x_end = linspace(2*pi, 4*pi, 100); % make look bigger 

    % sin 
    % initialize
    figure()
    plot(x, sin(x), 'linewidth', 2);
    ax = gca(); 

    for i = 1:length(x_end)
        set(ax.Children(1), 'xdata', linspace(0, x_end(i)));
        set(ax.Children(1), 'ydata', sin(linspace(0, x_end(i))));
        writeGif('testGif1.gif', i)
    end

![FIG1](/assets/testGif1_m.gif)

### Save to different location
Cosine wave gif

    x = linspace(0, 2*pi, 100); % to evaluate

    x_end = linspace(2*pi, 4*pi, 100); % make look bigger 

    % cos
    % initialize
    figure()
    plot(x, sin(x), 'linewidth', 2);
    ax = gca(); 

    for i = 1:length(x_end)
        set(ax.Children(1), 'xdata', linspace(0, x_end(i)));
        set(ax.Children(1), 'ydata', sin(linspace(0, x_end(i))));
        writeGif('testGif2.gif', i, 'delayTime',0.5, 'custom_folder', 'level1', 'folder_level', 1)
    end

## Input Arguments
---
### ```filename```
Filename for .gif file.

Desired name of gif file. Final gif file = `filename + .gif`

Data Types: (char)

### ```iter```
Current iteration for gif

The iteration the loop is currently on. 

Data Types: (double, scalar)

### Name-Value Arguments

Specified optional pairs of ```Name=Value``` arguments. ```Name``` is the is the argument name and ```Value``` is the corresponding value. You can specify several name and value pair arguments in any order as ```Name1=Value1,...,NameN=ValueN```. 

**Example**: ```delayTime=0.5``` specifies the creation of a gif file that run 0.5 frames per second. 

### ```delayTime```
Time between frames for .gif file (default=0.1)

How long to delay between frames. 

Data Types: (boolean)

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

This function uses methodology from [auto_save](https://github.com/tulimid1/savingfigures/blob/main/auto_save.mm). 

## Tips 
---

I would suggest adding both `writeGif.m` and `functionSignatures.json` to a folder that is in your MATLAB path. The `writeGif.m` contains the function and the `functionSignatures.json` will you give custom suggestions and code completion for when you call `writeGif` in a script or notebook. 

If you already have a `functionSignatures.json` file in your folder, just add the pertinent code to the original `functionSignatures.json`. 

## See also 
---
[auto_save](https://github.com/tulimid1/savingfigures/blob/main/auto_save.m)

## Issues and Discussion 
---

[Issues](https://github.com/tulimid1/savingfigures/issues) and [Discussion](https://github.com/tulimid1/savingfigures/discussions).

If you don't know how to use github (or don't want to), just send me an [email](mailto:tulimid@udel.edu). 
