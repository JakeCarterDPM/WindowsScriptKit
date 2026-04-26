# For Desktops running Windows 10 Pro 22H2.
# Latest Version: 2026/04/25
# Created by Jake Carter @ https://github.com/JakeCarterDPM/WindowsSetup

# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "--------------------- Setup: Win10ProDesktop --------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

#----------------------------------------------------------------------------------------------------
# System > Display
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Display. . . "

# Change the size of text, apps, and other items = 100%
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "LogPixels" -Type DWord -Value 96
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Win8DpiScaling" -Type DWord -Value 0
Write-Host " - Change the size of text, apps, and other items = 100%"
# Might work. May need a restart to apply updates to registry.


#----------------------------------------------------------------------------------------------------
# System > Notifcations & Actions
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Notifications & Actions. . . "

# Get notifications from apps and other senders = Off
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0
Write-Host " - Get notifications from apps and other senders = Off"
# Working as of Windows 10 Pro 22H2 | 2026/04/25.


# Show windows welcome experience after updates = Off
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-310093Enabled" -Type DWord -Value 0
Write-Host " - Show windows welcome experience after updates = Off"
# Working as of Windows 10 Pro 22H2 | 2026/04/25.


# Get Tips, tricks, and suggestions as you use windows = Off
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
Write-Host " - Get Tips, tricks, and suggestions as you use windows = Off"
# Working as of Windows 10 Pro 22H2 | 2026/04/25.



#----------------------------------------------------------------------------------------------------
# System > Focus Assist
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Focus & Assist. . . "

# Type = Off
# Supposedly, these ones should be the off for type? (Options are Off, Priority only, and Alarms only.)
# Values do not update when changed in settings. May need restart to check?
# Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name "NOC_GLOBAL_SETTING_TOASTS_ENABLED" -Type DWord -Value 1
# Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\QuietHours" -Name "QuietHoursActive" -Type DWord -Value 0
# IN PROGRESS. 

# Automatic rules - During these times = Off
# reg value.
# UNTESTED. 

# Automatic rules - When duplicating display = Off
# reg value.
# UNTESTED. 

# Automatic rules - When Gaming = Off
# reg value.
# UNTESTED. 

# Automatic rules - When in fullscreen = Off
# reg value.
# UNTESTED. 

# Show a summary of what i missed while focus assist was on = Off
# reg value.
# UNTESTED. 

#Possible commands
# Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\QuietHours" -Name "QuietHoursState" -Type DWord -Value 0
# Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\QuietHours" -Name "QuietHoursActiveRules" -Type DWord -Value 0
# Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\QuietHours" -Name "ScheduledQuietHoursActive" -Type DWord -Value 0
# Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\QuietHours" -Name "GameQuietHoursActive" -Type DWord -Value 0
# Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\QuietHours" -Name "AppQuietHoursActive" -Type DWord -Value 0



#----------------------------------------------------------------------------------------------------
# System > Power & Sleep
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Power & Sleep. . . "

# > Control Panel > Power Options | Power Plan = "High Performance"
$HighPerfGUID = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
$plans = powercfg /list
if ($plans -match $HighPerfGUID) {
}
else {
    powercfg -duplicatescheme $HighPerfGUID | Out-Null
}
powercfg /setactive $HighPerfGUID
Write-Host " - > Control Panel > Power Options | Power Plan = High Performance"
# Working as of Windows 10 Pro 22H2 | 2026/04/25.

# When plugged in, turn off after = 1 hour.
powercfg /change monitor-timeout-ac 60
Write-Host " - When plugged in, turn off after = 1 hour"
# Working as of Windows 10 Pro 22H2 | 2026/04/25.

# When plugged in, PC goes to sleep after = Never
powercfg /change standby-timeout-ac 0
Write-Host " - When plugged in, PC goes to sleep after = Never"
# Working as of Windows 10 Pro 22H2 | 2026/04/25.



#----------------------------------------------------------------------------------------------------
# System > Storage
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Storage. . . "

# Storage Sense = Off
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Name "01" -Type DWord -Value 0
Write-Host " - Storage Sense = Off"
# Working as of Windows 10 Pro 22H2 | 2026/04/25.



#----------------------------------------------------------------------------------------------------
# System > Tablet
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Tablet. . . "

# When I sign in = Never use tablet mode
#command
Write-Host " - When I sign in = Never use tablet mode"
# UNTESTED. 

# When I use this device as a tablet = Don't switch to tablet mode
#command
Write-Host " - When I use this device as a tablet = Don't switch to tablet mode"
# UNTESTED. 



#----------------------------------------------------------------------------------------------------
# System > Multitasking
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Multitasking. . . "

# Show suggestions in your timeline = Off
#command
Write-Host " - Show suggestions in your timeline = Off"
# UNTESTED. 

# Pressing Alt + Tab shows = Open windows only
#command
Write-Host " - Pressing Alt + Tab shows = Open windows only"
# UNTESTED. 


#Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
#Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
#Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "MultiTaskingAltTabFilter" -Type DWord -Value 3



#----------------------------------------------------------------------------------------------------
# System > Projecting to this PC
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Projecting to this PC. . . "

# Some devices can project to this PC when you say it's OK = Always Off
#command
Write-Host " - Some devices can project to this PC when you say it's OK = Always Off"
# UNTESTED. 

# Ask to project to this PC = Every time a connection is requested
#command
Write-Host " - Ask to project to this PC = Every time"
# UNTESTED. 

# Require PIN for pairing = True
#command
Write-Host " - Require PIN for pairing = True"
# UNTESTED. 



#----------------------------------------------------------------------------------------------------
# System > Shared Experiences
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Shared Experiences. . . "

# Share content with a nearby device with Bluetooth and Wi-Fi = Off
#command
Write-Host " - Share content with a nearby device with Bluetooth and Wi-Fi = Off"
# UNTESTED. 

# Let apps on other devices open and message apps on this to and from this device = Off
#command
Write-Host " - Let apps on other devices open and message apps on this to and from this device = Off"
# UNTESTED. 

#possible keys
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP" -Name "CdpSessionUserAuthzPolicy" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP" -Name "NearShareChannelUserAuthzPolicy" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP" -Name "RomeSdkChannelUserAuthzPolicy" -Type DWord -Value 0



#----------------------------------------------------------------------------------------------------
# System > Clipboard
Write-Host "-------------------------------------------------"
Write-Host "Starting: System > Clipboard. . . "

# Clipboard history = On
#command is possibly...
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Clipboard" -Name "EnableClipboardHistory" -Type DWord -Value 
Write-Host " - Clipboard history = On"
# UNTESTED. 

# Sync across devices = Off
#command
Write-Host " - Sync across devices = Off"
# UNTESTED. 



#----------------------------------------------------------------------------------------------------
# Devices > Typing
Write-Host "-------------------------------------------------"
Write-Host "Starting: Devices > Typing. . . "

# > Typing insights > Typing insights = Off
#command
Write-Host " - Typing insights > Typing insights = Off"
# UNTESTED. 



#----------------------------------------------------------------------------------------------------
# Devices > AutoPlay
Write-Host "-------------------------------------------------"
Write-Host "Starting: Devices > AutoPlay. . . "

# Use AutoPlay for all media and devices = On
#command
Write-Host " - Use AutoPlay for all media and devices = On"
# UNTESTED. 

# Removable drive = Take no action
#command
Write-Host " - Removable drive = Take no action"
# UNTESTED. 

# Memory Card = Take no action
#command
Write-Host " - Memory Card = Take no action"
# UNTESTED. 

#Possible Keys
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "UserChosenExecuteHandlersOnDriveArrival" -Value "OpenFolder"
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "UserChosenExecuteHandlersOnCardArrival" -Value "OpenFolder"


#----------------------------------------------------------------------------------------------------
# Mobile Devices
Write-Host "-------------------------------------------------"
Write-Host "Starting: Mobile Devices. . . "

# Allow this PC to access your mobile devices = Off
#command
Write-Host " - Allow this PC to access your mobile devices = Off"
# CAN'T TEST, SETTINGS ARE HIDDEN.

# Turn on Phone Link = Off
#command
Write-Host " - Turn on Phone Link = Off"
# CAN'T TEST, SETTINGS ARE HIDDEN.

# Show me suggestions for using my movile device with Windows = Off
#command
Write-Host " - Show me suggestions for using my movile device with Windows = Off"
# CAN'T TEST, SETTINGS ARE HIDDEN.



#----------------------------------------------------------------------------------------------------
# Personalization > Colors
Write-Host "-------------------------------------------------"
Write-Host "Starting: Personalization > Colors. . . "

# Transparency effects = Off
#command is possibly
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Type DWord -Value 0
Write-Host " - Choose your color = Dark"
# UNTESTED

# Choose your color = Dark
#command is possibly
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Type DWord -Value 0
Write-Host " - Choose your color = Dark"
# UNTESTED

# Accent color = 0x00484A4C
#command is possibly
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "AccentColor" -Type DWord -Value 0x00484A4C
Write-Host " - Accent color = 0x00484A4C"
# UNTESTED

# Show accent color on the following surfaces: Start, Taskbar, and action center = On
#command
Write-Host " - Show accent color on the following surfaces: Start, Taskbar, and action center = On"
# UNTESTED

# Show accent color on the following surfaces: Title bars and window borders = Off
#command
Write-Host " - Show accent color on the following surfaces: Title bars and window borders = Off"
# UNTESTED



#----------------------------------------------------------------------------------------------------
# Personalization > Lock screen
Write-Host "-------------------------------------------------"
Write-Host "Starting: Personalization > Lock screen. . . "

# Get fun facts, tips, tricks and more on your lock screen = Off
#command
Write-Host " - Get fun facts, tips, tricks and more on your lock screen = Off"
# UNTESTED

# Choose one app to show detailed status on the lock screen = None
#command
Write-Host " - Choose one app to show detailed status on the lock screen = None"
# UNTESTED

# Choose which apps show quick status on the lock screen = None
#command
Write-Host " - Choose which apps show quick status on the lock screen = None"
# UNTESTED

# Show lock screen background picture on the sign-in screen = On
#command
Write-Host " - Show lock screen background picture on the sign-in screen = On"
# UNTESTED


#----------------------------------------------------------------------------------------------------
# Personalization > Themes
Write-Host "-------------------------------------------------"
Write-Host "Starting: Personalization > Themes. . . "

# > Desktop icon settings > Desktop icons = Computer and recycle bin enabled
#command
Write-Host " - > Desktop icon settings > Desktop icons = Computer and Recycle Bin"
# UNTESTED


#----------------------------------------------------------------------------------------------------
# Personalization > Start
Write-Host "-------------------------------------------------"
Write-Host "Starting: Personalization > Start. . . "

# Show more tiles on Start = Off
#command
Write-Host " - Show more tiles on Start = Off"
# UNTESTED

# Show app list in Start menu = On
#command
Write-Host " - Show app list in Start menu = On"
# UNTESTED

# Show recently added apps = Off
#command
Write-Host " - Show recently added apps = Off"
# UNTESTED

# Show most used apps = Off
#command
Write-Host " - Show most used apps = Off"
# UNTESTED

# Show suggestions occasionally in Start = Off
#command
Write-Host " - Show suggestions occasionally in Start = Off"
# UNTESTED

# Use Start full screen = Off
#command
Write-Host " - Use Start full screen = Off"
# UNTESTED

# Show recently opened items in Jump Lists on Start or the taskbar in Quick Access = Off
#command
Write-Host " - Show recently opened items in Jump Lists on Start or the taskbar in Quick Access = Off"
# UNTESTED

# Show account-related notifications = Off
#command
Write-Host " - Show account-related notifications = Off"
# UNTESTED

# > Choose which folders appear on Start > File Explorer = Off
#command
Write-Host " - Choose which folders appear on Start > File Explorer = Off"
# UNTESTED

# > Choose which folders appear on Start > Settings = Off
#command
Write-Host " - Choose which folders appear on Start > Settings = Off"
# UNTESTED

# > Choose which folders appear on Start > Documents = Off
#command
Write-Host " - Choose which folders appear on Start > Documents = Off"
# UNTESTED

# > Choose which folders appear on Start > Downloads = Off
#command
Write-Host " - Choose which folders appear on Start > Downloads = Off"
# UNTESTED

# > Choose which folders appear on Start > Music = Off
#command
Write-Host " - Choose which folders appear on Start > Music = Off"
# UNTESTED

# > Choose which folders appear on Start > Pictures = Off
#command
Write-Host " - Choose which folders appear on Start > Pictures = Off"
# UNTESTED

# > Choose which folders appear on Start > Videos = Off
#command
Write-Host " - Choose which folders appear on Start > Videos = Off"
# UNTESTED

# > Choose which folders appear on Start > Network = Off
#command
Write-Host " - Choose which folders appear on Start > Network = Off"
# UNTESTED

# > Choose which folders appear on Start > Personal folder = Off
#command
Write-Host " - Choose which folders appear on Start > Personal folder = Off"
# UNTESTED


#Possible Keys
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowDocuments" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowDownloads" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowMusic" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowPictures" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowVideos" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowNetwork" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowUser" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowThisPC" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowSettings" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowFullscreen" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_Layout" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_ShowAppList" -Type DWord -Value 1


#----------------------------------------------------------------------------------------------------
# Personalization > Taskbar
Write-Host "-------------------------------------------------"
Write-Host "Starting: Personalization > Taskbar. . . "

# Lock the taskbar = On
#command
Write-Host " - Lock the taskbar = On"
# UNTESTED

# Automatically hide the taskbar in desktop mode = Off
#command
Write-Host " - Lock the taskbar = Off"
# UNTESTED

# Use small taskbar buttons = On
#command
Write-Host " - Use small taskbar buttons = On"
# UNTESTED

# Replace CMD with Powershell in menu when right-clicking start button = On
#command
Write-Host " - Replace CMD with Powershell in menu when right-clicking start button = On"
# UNTESTED

# Combine taskbar buttons = Always, hide labels
#command
Write-Host " - Combine taskbar buttons = Always, hide labels"
# UNTESTED

# > Turn system icons on or off > Clock = On
#command
Write-Host " - > Turn system icons on or off > Clock = On"
# UNTESTED

# > Turn system icons on or off > Volume = On
#command
Write-Host " - > Turn system icons on or off > Volume = On"
# UNTESTED

# > Turn system icons on or off > Network = On
#command
Write-Host " - > Turn system icons on or off > Network = On"
# UNTESTED

# > Turn system icons on or off > Input Indicator = Off
#command
Write-Host " - > Turn system icons on or off > Input Indicator = Off"
# UNTESTED

# > Turn system icons on or off > Location = Off
#command
Write-Host " - > Turn system icons on or off > Location = Off"
# UNTESTED

# > Turn system icons on or off > Action Center = Off
#command
Write-Host " - > Turn system icons on or off > Action Center = Off"
# UNTESTED

# > Turn system icons on or off > Touch keyboard = Off
#command
Write-Host " - > Turn system icons on or off > Touch keyboard = Off"
# UNTESTED

# > Turn system icons on or off > Windows Ink Workspace = Off
#command
Write-Host " - > Turn system icons on or off > Windows Ink Workspace = Off"
# UNTESTED

# > Turn system icons on or off > Touchpad = Off
#command
Write-Host " - > Turn system icons on or off > Touchpad = Off"
# UNTESTED

# > Turn system icons on or off > Microphone = Off
#command
Write-Host " - > Turn system icons on or off > Microphone = Off"
# UNTESTED

# > Turn system icons on or off > Meet Now = Off
#command
Write-Host " - > Turn system icons on or off > Meet Now = Off"
# UNTESTED

# Show taskbar on all displays = On
#command
Write-Host " - Show taskbar on all displays = On"
# UNTESTED

# Show news and interests on the taskbar = Off
#command
Write-Host " - Show news and interests on the taskbar = Off"
# UNTESTED




# Possible keys
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Type DWord -Value 2
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" -Name "PenWorkspaceButtonDesiredVisibility" -Type DWord -Value 0

#New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | Out-Null
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCInputIndicator" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCLocation" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCActionCenter" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCTouchKeyboardButton" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCWindowsInkWorkspace" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCTouchpad" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCMicrophone" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCMeetNow" -Type DWord -Value 1







#----------------------------------------------------------------------------------------------------
# Accounts > Windows backup
Write-Host "-------------------------------------------------"
Write-Host "Starting: Accounts > Windows backup. . . "

# Get quick access to apps on Windows device = Off
#command
Write-Host " - Get quick access to apps on Windows device = Off"
# UNTESTED

# Quickly access your preferences across Microsoft experiences = Off
#command
Write-Host " - Quickly access your preferences across Microsoft experiences = Off"
# UNTESTED

# Sync Accessibility = Off
#command
Write-Host " - Sync Accessibility = Off"
# UNTESTED

# Accounts, WiFi networks and passwords = Off
#command
Write-Host " - Accounts, WiFi networks and passwords = Off"
# UNTESTED

# Personalization = Off
#command
Write-Host " - Personalization = Off"
# UNTESTED

# Language preferences and dictionary = Off
#command
Write-Host " - Language preferences and dictionary = Off"
# UNTESTED

# Other Windows Settings = Off
#command
Write-Host " - Other Windows Settings = Off"
# UNTESTED



#----------------------------------------------------------------------------------------------------
# Time & Language > Region
Write-Host "-------------------------------------------------"
Write-Host "Starting: Time & Language > Region. . . "

# Country or Region = Australia
#command
Write-Host " - Country or Region = Australia"
# UNTESTED

# Regional format = English (Australia)
#command
Write-Host " - Regional format = English (Australia)"
# UNTESTED



#----------------------------------------------------------------------------------------------------
# Time & Language > Language
Write-Host "-------------------------------------------------"
Write-Host "Starting: Time & Language > Language. . . "

# Windows display language = English (Australia)
#command
Write-Host " - Windows display language = English (Australia)"
# UNTESTED

# Preferred languages = English (Australia)
#command
Write-Host " - Preferred languages = English (Australia)"
# UNTESTED



#----------------------------------------------------------------------------------------------------
# Gaming > Game Bar
Write-Host "-------------------------------------------------"
Write-Host "Starting: Gaming > Game Bar. . . "

# Enable Game Bar = Off
#command
Write-Host " - Enable Game Bar = Off"
# UNTESTED

# Allow your controller to open Game Bar = Off
#command
Write-Host " - Allow your controller to open Game Bar = Off"
# UNTESTED

#Possible keys
#Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_ControllerHotKeyEnabled" -Type DWord -Value 0



#----------------------------------------------------------------------------------------------------
# Ease of Access > Display 
Write-Host "-------------------------------------------------"
Write-Host "Starting: Ease of Access > Display. . . "

# Show animations in Windows = Off
#command
Write-Host " - Show animations in Windows = Off"
# UNTESTED

# Automatically hide scroll bars in Windows = Off
#command
Write-Host " - Automatically hide scroll bars in Windows = Off"
# UNTESTED

#Possible keys
#Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility" -Name "DynamicScrollbars" -Type DWord -Value 0



#----------------------------------------------------------------------------------------------------
# Ease of Access > Keyboard 
Write-Host "-------------------------------------------------"
Write-Host "Starting: Ease of Access > Keyboard. . . "

# Allow the shortcut key to start Sticky Keys = Off
#command
Write-Host " - Allow the shortcut key to start Sticky Keys = Off"
# UNTESTED

# Allow the shortcut key to start Toggle Keys = Off
#command
Write-Host " - Allow the shortcut key to start Toggle Keys = Off"
# UNTESTED

# Allow the shortcut key to start Filter Keys = Off
#command
Write-Host " - Allow the shortcut key to start Filter Keys = Off"
# UNTESTED



#----------------------------------------------------------------------------------------------------
# Search > Permissions & History
Write-Host "-------------------------------------------------"
Write-Host "Starting: Search > Permissions & History. . . "

# SafeSearch = Off
#command
Write-Host " - SafeSearch = Off"
# UNTESTED

# Microsoft account = Off
#command
Write-Host " - Microsoft account = Off"
# UNTESTED

# Let Windows Search store your search history locally on this device = Off
#command
Write-Host " - Let Windows Search store your search history locally on this device = Off"
# UNTESTED

#Possible Keys
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "SafeSearchMode" -Type DWord -Value 2
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsMSACloudSearchEnabled" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsAADCloudSearchEnabled" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "DeviceHistoryEnabled" -Type DWord -Value 1



#----------------------------------------------------------------------------------------------------
# Privacy > General
Write-Host "-------------------------------------------------"
Write-Host "Starting: Privacy > General. . . "

# Let apps use advertising ID to make ads better = Off
#command
Write-Host " - Let apps use advertising ID to make ads better = Off"
# UNTESTED

# Allow websites to provide locally relevant content by accessing my language list = Off
#command
Write-Host " - Allow websites to provide locally relevant content by accessing my language list = Off"
# UNTESTED

# Allow Windows to track app launches to improve Start and Search results = Off
#command
Write-Host " - Allow Windows to track app launches to improve Start and Search results = Off"
# UNTESTED

# Show me suggested content in the Settings app = Off
#command
Write-Host " - Show me suggested content in the Settings app = Off"
# UNTESTED

# Show me notifications in the Settings app = Off
#command
Write-Host " - Show me notifications in the Settings app = Off"
# UNTESTED

#Possible keys
#Set-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut" -Type DWord -Value 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Type DWord -Value 0


#----------------------------------------------------------------------------------------------------
# Privacy > Inking & typing personalisation
Write-Host "-------------------------------------------------"
Write-Host "Starting: Privacy > Inking & typing personalisation. . . "

# Use typing history and handwriting patterns to create a personal dictionary for you = Off
#command
Write-Host " - Use typing history and handwriting patterns to create a personal dictionary for you = Off"
# UNTESTED



#----------------------------------------------------------------------------------------------------
# Privacy > Diagnostics & feedback
Write-Host "-------------------------------------------------"
Write-Host "Starting: Privacy > Diagnostics & feedback. . . "

# Diagnostic data = Required diagnostic data only
#command
Write-Host " - Diagnostic data = Required diagnostic data only"
# UNTESTED

# Send optional inking and typing to Microsoft to improve language recognition and suggestion capabilities = Off
#command
Write-Host " - Send optional inking and typing to Microsoft to improve language recognition and suggestion capabilities = Off"
# UNTESTED

# Let Microsoft use your diagnostic data to offer personalised tips to enhance Microsoft experiences = Off
#command
Write-Host " - Let Microsoft use your diagnostic data to offer personalised tips to enhance Microsoft experiences = Off"
# UNTESTED

# View diagnostic data = Off
#command
Write-Host " - View diagnostic data = Off"
# UNTESTED


# Feedback frequency = Never
#command
Write-Host " - Feedback frequency = Never"
# UNTESTED




#----------------------------------------------------------------------------------------------------
# Privacy > Location
Write-Host "-------------------------------------------------"
Write-Host "Starting: Privacy > Location. . . "

# Location for this device is = Off
#command
Write-Host " - Location for this device is = Off"
# UNTESTED

# Allow apps to access your location = Off
#command
Write-Host " - Allow apps to access your location = Off"
# UNTESTED



#----------------------------------------------------------------------------------------------------
# Updates & Security > Delivery Optimisation
Write-Host "-------------------------------------------------"
Write-Host "Starting: Updates & Security > Delivery Optimisation. . . "

# Allow downloads from other PCs = Off
#command
Write-Host " - Allow downloads from other PCs = Off"
# UNTESTED

#Possible Keys
#Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 0



#----------------------------------------------------------------------------------------------------
# Updates & Security > Troubleshoot
Write-Host "-------------------------------------------------"
Write-Host "Starting: Updates & Security > Troubleshoot. . . "

# Run recommended troubleshooters = Don't run any troubleshooters
#command
Write-Host " - Run recommended troubleshooters = Don't run any troubleshooters"
# UNTESTED



#----------------------------------------------------------------------------------------------------
# Updates & Security > Find my device
Write-Host "-------------------------------------------------"
Write-Host "Starting: Updates & Security > Find my device. . . "

# Find my device = Off
#command
Write-Host " - Find my device = Off"
# UNTESTED









#----------------------------------------------------------------------------------------------------
# Bonus Hidden Goodies

# Web Search in Start Menu = Off
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Type DWord -Value 1
# Working as of Windows 10 Pro 22H2 | 2026/04/25.

#Windows Explorer Folder Options > General > Open File Explorer to = This PC
#Windows Explorer Folder Options > General > Show recently used files in Quick Access = Off
#Windows Explorer Folder Options > General > Show frequently used files in Quick Access = Off
#Windows Explorer Folder Options > View > Show hidden files, folders and drives = On
#Windows Explorer Folder Options > View > Hide extensions for known file types = Off



#----------------------------------------------------------------------------------------------------
# Restart Explorer to apply changes
Write-Host "Restarting File Explorer. . ."
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "----------------------- Script completed! -----------------------"
Write-Host "-----------------------------------------------------------------"
Read-Host "Press 'Enter' to exit"

#----------------------------------------------------------------------------------------------------




#----------------------------------------------------------------------------------------------------
# Older / Unknown untested registry keys. 

# Network & Internet / Proxy
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "AutoDetect" -Type DWord -Value 0

#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0