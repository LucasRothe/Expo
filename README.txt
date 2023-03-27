---> Data Exporter <---

- Version: v3.1
- Author/s:
    + Lucas Rothe
- Licence: CC BY-NC-SA (https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode)
    < ! > License changes are reserved to Lucas Rothe < ! >

# toc
 ├-> About
 ├-> Requirements
 ├-> Installation
 |   ├--MinGW Compiler
 |   ├--Compiling Expo.f90
 |   └--Updating
 ├-> Usage
 └-> Troubleshooting/FAQ

## About
    The purpose of *Data Exporter*/*Expo* is to extract measurement data from 
    predefined data sets in order to simplify the subsequent plotting in graphs. 
    Additionally, there is the possibility to normalize the data.

## Requirements
 ○ OS is Windows 10
 ○ Downloaded the whole EXPO repository
 ○ Repository/Directory is saved on "Desktop"
 ○ Have a fortran compiler installed
    └-> MinGW is recommended (https://sourceforge.net/projects/mingw/)

## Installation
 < ! > Only for Windows OS < ! >
 
 ### MinGW Compiler
    1.a. Start mingw-get-setup
      b. Push "Install"
      c. Check box for "User Interface" if not checked
      d. Push "Continue"
      e. Push "Run Now"
    2.a. Click on "Basic Setup"
      b. Check box for "mingw32-gcc-fortran-bin"
      c. [TOPBAR] Go to "Installation" -> click on "Update Catalogue"
      d. Close MinGW-Installer
    3.a. Use Windows Search (magnifying glass icon) and type:
            [EN]: "System Environment Variables"
            [DE]: "Systemumgebungsvariablen"  
      b. Within the new window push: 
            [EN]: "System Environment Variables"
            [DE]: "Systemumgebungsvariablen"
      c. Within the new window double click on "Path" 
      d. Double click on empty column and add "C:\MinGW\bin"
      e. Leave all windwos with a push on "OK"      

 ### Compiling Expo.f90
    1. Use Windows Search (magnifying glass icon) and type "cmd"
        └-> OR: Hold button [Win]+[R] and in upcoming window type "cmd"
    2. Navigate to Expo-Directory by typing "cd Desktop\Expo"
        └-> If you have saved the repository at a other location, make sure to replace "Desktop\Expo" with your pathway.
            You can copy the pathway out of the headline of your file explorer.
    3. Type "dir" and make sure that you see the file "Expo.f90"
        └-> If not visible you are not in the correct directory!
    4. When "Expo.f90" is visible, type "gfortran Expo.f90 -o Expo.exe"
    5. Start Expo.exe by typing "./Expo.exe"
        └-> Expo.exe can also be started by double click in your directory.

 ### Updating
    1. Download the latest version from GitHub
    2. Copy the latest "Expo.f90"
    3. Go to your current Expo-Directory and replace "Expo.f90"
    4. Use Windows Search (magnifying glass icon) and type "cmd"
        └-> OR: Hold button [Win]+[R] and in upcoming window type "cmd"
    5. Navigate to Expo-Directory by typing "cd Desktop\Expo"
        └-> If you have saved the repository at a other location, make sure to replace "Desktop\Expo" with your pathway.
            You can copy the pathway out of the headline of your file explorer.
    6. Type "dir" and make sure that you see the file "Expo.f90"
        └-> If not visible you are not in the correct directory!
    7. When "Expo.f90" is visible, type "gfortran Expo.f90 -o Expo.exe"

## Usage
    Only special datasets can be processed by the **Data Exporter** and must fit certain file extensions and structures.

    ┌-------------------------------------------------------┐
    |  Mesurement  | File Extension |       Structure       |
    ├--------------+----------------+-----------------------|
    |     GPC      |      .txt      | PSS WinGPC^R UniCHrom |
    |    UV/Vis    |      .dsp      |          N/A          |
    | Fluorescence |      .sp       |          N/A          | 
    └-------------------------------------------------------┘
  
    Assuming your data sets meets the requirements, it must be placed in the "In" folder. In addition, the file name can not contain any blanks. 
    After starting the program you will end up in the main menu, which shows the active options. Navigation within the program window is done by entering the numbers in square brackets. 
    The extracted data sets are then located in the folder of the respective measurement method (see workflow chart).
   
    ┌-------------------< Workflow Chart >-------------------┐
    |                                                        |
    |   Input File (.txt/.dsp/.sp)                           |
    |   |                                                    |
    |   └->[IN] --> {Expo} --> Output file (.txt/.dat/.xls)  |
    |                          ├-> [GPC]                     |
    |                          ├-> [Fluoreszenz]             |
    |                          └-> [UV]                      |
    └--------------------------------------------------------┘

## Troubleshooting
 + Q: I compiled Expo.f90 but the program does not run!
   A: Please restart your computer and try again. If this does not change anything, recompile Expo.f90.

 + Q: Expo does not read my input file!
   A: Make sure that your file fit the file extension requirements.

 + Q: While extracting my data the program crashed and was closed.
   A: Your data set probably contains a value which does not correspond to the read-in format.
      Often this value is slightly longer than the majority of the values. If it is possible, the
      format should be adjusted.

 >> Do you have a problem which is not mentioned above, please contact Maintainer/s. Your request will be answered as fast as possible.
    Please keep in mind that this project is done within the authors'/maintainers' spare time.

## Maintainer/s
- Lucas Rothe (https://github.com/LucasRothe)

-----------------------