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
1. a. Start **mingw-get-setup**<br>
  b. Push _Install_<br>
  c. Check box for _User Interface_ if not checked<br>
  d. Push _Continue_<br>
  e. Push _Run Now_<br>
2. a. Click on _Basic Setup_<br>
  b. Check box for _mingw32-gcc-fortran-bin_<br>
  c. `TOPBAR` Go to _Installation_ -> click on _Update Catalogue_<br>
  d. Close MinGW-Installer<br>
3. a. Use Windows Search (:mag_right:-icon) and type:<br>
        └>:gb:/[EN]: _System Environment Variables_<br>
        └>:de:/[DE]: _Systemumgebungsvariablen_<br>
  b. Within the new window push:<br> 
        └>:gb:/[EN]: _System Environment Variables_<br>
        └>:de:/[DE]: _Systemumgebungsvariablen_<br>
  c. Within the new window double click on _Path_<br> 
  d. Double click on empty column and add _C:\MinGW\bin_<br>
  e. Leave all windwos with a push on _OK_<br>      

 #### Compiling Expo.f90
  1. Use Windows Search (:mag_right:-icon) and type _cmd_<br>
      └> OR: Hold button [Win]+[R] and in upcoming window type _cmd_<br>
  2. Navigate to Expo-Directory by typing _cd Desktop\Expo_<br>
      └> If you have saved the repository at a other location, make sure to replace _Desktop\Expo_ with your pathway. You can copy the pathway out of the headline of your file explorer.<br>
  3. Type _dir_ and make sure that you see the file _Expo.f90_<br>
      └> If not visible you are not in the correct directory!<br>
  4. When _Expo.f90_ is visible, type ***gfortran Expo.f90 -o Expo.ex***e<br>
  5. Start Expo.exe by typing _./Expo.exe_<br>
      └> _Expo.exe_ can also be started by double click in your directory.<br>

 #### Updating
  1. Download the **latest** version from GitHub
  2. Copy the ***latest Expo.f90***
  3. Go to your current Expo-Directory and replace _Expo.f90_
  4. Use Windows Search (magnifying glass icon) and type _cmd_<br>
      └> OR: Hold button [Win]+[R] and in upcoming window type _cmd_<br>
  5. Navigate to Expo-Directory by typing ***cd Desktop\Expo***<br>
      └> If you have saved the repository at a other location, make sure to replace _Desktop\Expo_ with your pathway. You can copy the pathway out of the headline of your file explorer.<br>
  6. Type _dir_ and make sure that you see the file _Expo.f90_<br>
      └> If not visible you are not in the correct directory!<br>
  7. When _Expo.f90_ is visible, type ***gfortran Expo.f90 -o Expo.exe***<br>

### :compass: Usage
  Only special datasets can be processed by the **Data Exporter** and must fit certain file extensions and structures.

  |Mesurement|File Extension|Structure|
  |----|----|----|
  |GPC|.txt|PSS WinGPC UniCHrom|
  |UV/Vis|.dsp|:building_construction:|
  |Fluorescence|.sp|:building_construction:| 
  
  Assuming your data sets meets the requirements, it must be placed in the **In**-:file_folder:. In addition, the ***file name*** can ***not contain any blanks***. 
  After starting the program you will end up in the main menu, which shows the active options. Navigation within the program window is done by entering the numbers in square brackets. 

  The extracted data sets are then located in the folder of the respective measurement method (see workflow chart).
    
```mermaid
graph LR;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

    ┌-------------------< Workflow Chart >-------------------┐
    |                                                        |
    |   Input File (.txt/.dsp/.sp)                           |
    |   |                                                    |
    |   └->[IN] --> {Expo} --> Output file (.txt/.dat/.xls)  |
    |                          ├-> [GPC]                     |
    |                          ├-> [Fluoreszenz]             |
    |                          └-> [UV]                      |
    └--------------------------------------------------------┘

### :anger: Troubleshooting/FAQ
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

>:speech_balloon: ***Do you have a problem which is not mentioned above, please contact [Maintainer/s](#basecampy-maintainers). Your request will be answered as fast as possible. Please keep in mind that this project is done within the authors'/maintainers' spare time.***

### :basecampy: Maintainer/s
- Lucas Rothe (https://github.com/LucasRothe)

-----------------------
[^1]:***License changes are reserved to Lucas Rothe***