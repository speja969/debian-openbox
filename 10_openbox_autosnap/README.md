# Autosnap Windows for Openbox
Script for **autosnap windows** (half-maximice) in Openbox WM.  
The script snap the active windows an choose automatically the corner to snap according the mouse position: if the mouse is in the zone of corner left snap to this quadrant, if is in the center left snap to half left screen, if is in the center maximize the windows, etc.  A shortcut to script or mouse binding, for example with middle mouse click in titlebar, can call the script in GUI mode.
Works in **1 or 2 monitors** (in horizontal).

![peek-12-10-2017-20-43](https://user-images.githubusercontent.com/32820131/40352231-9d64c1fa-5dae-11e8-8137-890cadf2c293.gif)

&nbsp; 
## Install
Use `install.sh` script. The script will be installed and Openbox config file autoconfigured for call the script when middle click in titlebar is pressed.

&nbsp; 
### Manual install
  * Download `autosnap` and copy the script to accessible PATH directory and make it executable.
  ```bash
  cp autosnap /usr/bin/
  chmod +x /usr/bin/autosnap
  ```
  * Edit Openbox config file `rc.xml` and config mouse center click (or what you want) to exec  command command `autosnap`:
```xml
    <context name="Titlebar">
    ...
      <mousebind button="Middle" action="Click">
        <action name="Execute">
          <command>autosnap</command>
        </action>        
      </mousebind>
    ...
    </context>
```
  * In Openbox config file `rc.xml` must be configured the key combinatios for each snap type, and the script will auto press this combinatios according the mouse position. I use `CTRL+Keypad numbers`:
  ```xml
 <keyboard>
    ...  
    <keybind key="C-KP_Home">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="C-KP_Up">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>0</y>
        <width>100%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="C-KP_Prior">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>        
    <keybind key="C-A-Left">
      <action name="GoToDesktop">
        <to>left</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="C-KP_Begin">
      <action name="ToggleMaximize"/>
    </keybind>
    <keybind key="C-KP_Left">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>0</y>
        <width>50%</width>
        <height>100%</height>
      </action>
    </keybind>
    <keybind key="C-KP_Right">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>0</y>
        <width>50%</width>
        <height>100%</height>
      </action>
    </keybind>
    <keybind key="C-KP_End">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>-0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="C-KP_Down">
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>-0</y>
        <width>100%</width>
        <height>50%</height>
      </action>
    </keybind>    
    <keybind key="C-KP_Next">7
      <action name="UnmaximizeFull"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>-0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    ...
</keyboard>
```
