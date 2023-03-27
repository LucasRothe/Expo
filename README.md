# Data Exporter 

**Version:** _3.1_ <br>
**Author/s:** _Lucas Rothe_<br>
**Licence:** [CC BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode)[^1] <br>

## Table of Contents
- [About](#about)
- [Requirements](#requirements)
- [Installation](#installation)
  - [MinGW Compiler](#mingw-compiler)
  - [Compiling Expo.f90](#compiling-expof90)
  - [Updating](#updating)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)


### :dart: About
    
The purpose of ***Data Exporter***/***Expo*** is to extract measurement data from predefined data sets in order to simplify the subsequent plotting in graphs. Additionally, there is the possibility to normalize the data.

### :warning: Requirements
- OS is _Windows_
- Downloaded the whole Expo repository
- Repository/Directory is saved on "Desktop"
- Have a fortran compiler installed
  - [MinGW](https://sourceforge.net/projects/mingw/) is recommended 

### :minidisc: Installation
 :bangbang: **Only for Windows OS** :bangbang:
 
 #### MinGW Compiler
1. a. Start mingw-get-setup<br>
  b. Push "Install"<br>
  c. Check box for "User Interface" if not checked<br>
  d. Push "Continue"<br>
  e. Push "Run Now"<br>
2. a. Click on "Basic Setup"<br>
  b. Check box for "mingw32-gcc-fortran-bin"<br>
  c. [TOPBAR] Go to "Installation" -> click on "Update Catalogue"<br>
  d. Close MinGW-Installer<br>
3. a. Use Windows Search (magnifying glass icon) and type:<br>
        :gb:: "System Environment Variables"<br>
        :de:: "Systemumgebungsvariablen"<br>
  b. Within the new window push:<br> 
        :gb:: "System Environment Variables"<br>
        :de:: "Systemumgebungsvariablen"<br>
  c. Within the new window double click on "Path"<br> 
  d. Double click on empty column and add "C:\MinGW\bin"<br>
  e. Leave all windwos with a push on "OK"<br>      

 #### Compiling Expo.f90
  1. Use Windows Search (magnifying glass icon) and type "cmd"<br>
      └-> OR: Hold button [Win]+[R] and in upcoming window type "cmd"<br>
  2. Navigate to Expo-Directory by typing "cd Desktop\Expo"<br>
      └-> If you have saved the repository at a other location, make sure to replace "Desktop\Expo" with your pathway. You can copy the pathway out of the headline of your file explorer.<br>
  3. Type "dir" and make sure that you see the file "Expo.f90"<br>
      └-> If not visible you are not in the correct directory!<br>
  4. When "Expo.f90" is visible, type "gfortran Expo.f90 -o Expo.exe"<br>
  5. Start Expo.exe by typing "./Expo.exe"<br>
      └-> Expo.exe can also be started by double click in your directory.<br>

 #### Updating
  1. Download the latest version from GitHub
  2. Copy the latest "Expo.f90"
  3. Go to your current Expo-Directory and replace "Expo.f90"
  4. Use Windows Search (magnifying glass icon) and type "cmd"
      └-> OR: Hold button [Win]+[R] and in upcoming window type "cmd"<br>
  5. Navigate to Expo-Directory by typing "cd Desktop\Expo"<br>
      └-> If you have saved the repository at a other location, make sure to replace "Desktop\Expo" with your pathway. You can copy the pathway out of the headline of your file explorer.<br>
  6. Type "dir" and make sure that you see the file "Expo.f90"<br>
      └-> If not visible you are not in the correct directory!<br>
  7. When "Expo.f90" is visible, type "gfortran Expo.f90 -o Expo.exe"<br>

### :notebook: Usage
    The data set must be stored in the "In" folder and must have the following file extensions in order to extract measurement data.
    File extension requirements:
     ├-> for GPC: .txt
     ├-> for Fluorescence: .sp
     └-> for UV/Vis: .dsp

    Navigation within the program is done by entering the numbers in square brackets.
    The main menu also shows which options are active.

    The extracted data set is then located in the folder of the respective measurement method.
    
    ┌-------------------< Workflow Chart >-------------------┐
    |                                                        |
    |   Input File (.txt/.dsp/.sp)                           |
    |   |                                                    |
    |   └->[IN] --> {Expo} --> Output file (.txt/.dat/.xls)  |
    |                          ├-> [GPC]                     |
    |                          ├-> [Fluoreszenz]             |
    |                          └-> [UV]                      |
    └--------------------------------------------------------┘

### :anger: Troubleshooting
  <details>
    <summary>I compiled Expo.f90 but the program does not run!</summary>
        Please restart your computer and try again. If this does not change anything, recompile Expo.f90.
  </details>

  <details>
    <summary>Expo does not read my input file!</summary>
        Make sure that your file fit the file extension requirements.
  </details>

  <details>
    <summary>While extracting my data the program crashed and was closed.</summary>
        Your data set probably contains a value which does not correspond to the read-in format.
        Often this value is slightly longer than the majority of the values. If it is possible, the
        format should be adjusted.
  </details>

### :basecampy: Maintainer/s
- Lucas Rothe (https://github.com/LucasRothe)

-----------------------
[^1]:***License changes are reserved to Lucas Rothe***