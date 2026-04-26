# For Laptops running Windows 11 Home.
# Latest Version: 2026/04/22
# Created by Jake Carter @ https://github.com/JakeCarterDPM/WindowsSetup

# Title
Clear-Host
Write-Host ""
Write-Host "-----------------------------------------------------------------"
Write-Host "--------------- Jake Carter's Windows Script Kit ----------------"
Write-Host "--------------------- Setup: Win11HomeLaptop --------------------"
Write-Host "-----------------------------------------------------------------"
Write-Host ""

# Currently got to add the following.
# Accessibility > Contrast Themes | Keyboard shortcut for contrast themes = Off
# Accessibility > Keyboard | Filter keys = Off
# Accessibility > Keyboard | Sticky keys = Off
# Accessibility > Mouse pointer and touch | Enable mouse pointer shadow = On
# Accessibility > Narrator | Keyboard shortcut for Narrator = Off
# Accessibility > Visual effects | Always show scrollbars = On
# Accessibility > Visual effects | Animation effects = Off
# Accessibility > Visual effects | Transparency effects = Off
# Apps > Advanced app settings | Share across devices = Off
# Apps > Apps for websites | outlook.cloud.microsoft = Off
# Apps > Apps for websites | outlook.office.com = Off
# Apps > Apps for websites | outlook.office365.com = Off
# Apps > Apps for websites | teams.cloud.microsoft = Off
# Apps > Apps for websites | teams.microsoft.com = Off
# Apps > Resume | Resume = Off
# Bluetooth & Devices > Keyboard | Copilot Key on Keyboard = None Selected
# Bluetooth & Devices > Mouse | Enhance pointer precision = Off
# Bluetooth & Devices > Printers & Scanners | Download drivers and device software over metered connections = On
# Bluetooth & devices > Autoplay | Memory Card = Open folder to view files (File Explorer)
# Bluetooth & devices > Autoplay | Removable Driver = Open folder to view files (File Explorer)
# Gaming > Captures | Capture mouse cursor when recording a game = Off
# Gaming > Captures | Max recording length = 30 minutes
# Gaming > Captures | Record what happened = Off
# Gaming > Captures | Video frame rate = 30 FPS
# Gaming > Captures | Video quality = Standard
# Gaming > Captures | capture audio when recording a game = Off
# Gaming > Game Bar | Allow your controller to open Game Bar = Off
# Gaming > Game Bar |use combo buttons as Guide button in apps = Off
# Gaming > Game Mode | Game Mode = On
# Network & Internet > Proxy | Automatically detect settings = Off
# Personalization > Colors | Accent Color = Automatic
# Personalization > Colors | Choose your mode = Dark
# Personalization > Colors | Show accent color on Start and taskbar = On
# Personalization > Colors | Show accent color on title bars and window borders = On
# Personalization > Colors | Transparency effects = Off
# Personalization > Device Usage | Business = Off 
# Personalization > Device Usage | Creativity = Off 
# Personalization > Device Usage | Development = Off 
# Personalization > Device Usage | Entertainment = Off 
# Personalization > Device Usage | Family = Off 
# Personalization > Device Usage | Gaming = Off 
# Personalization > Device Usage | School = Off 
# Personalization > Dynamic Lighting | Compatible apps in the foreground always control lighting = Off
# Personalization > Dynamic Lighting | Use Dynamic Lighting on my devices = Off
# Personalization > Lock screen | Get fun facts, tips, tricks and more on your lock screen = Off
# Personalization > Lock screen | Personalize your lock screen = Picture
# Personalization > Lock screen | Show the lock screen background picture on the sign-in screen = On
# Personalization > Lock screen | Lock Screen Status = None
# Personalization > Start > Folders | Settings = On
# Personalization > Start | Show account-related notifications = Off
# Personalization > Start | Show most used apps = Off
# Personalization > Start | Show recently added apps = Off
# Personalization > Start | Show recommendations for tips, shortcuts, new apps, and more = Off
# Personalization > Start | Show recommended files in Start, recent files in File Explorer, and items in Jump Lists = Off
# Personalization > Taskbar | Automatically hide the taskbar = On
# Personalization > Taskbar | Search = Hide
# Personalization > Taskbar | Task view = Off
# Personalization > Taskbar | Taskbar Alignment = Left
# Personalization > Taskbar | Widgets = Off
# Personalization > Themes | Desktop Icon Settings = Computer & Recycle Bin
# Privacy & Security > Diagnostics & Feedback | Feedback frequency = Never
# Privacy & Security > Diagnostics & Feedback | Improve inking and typing = Off
# Privacy & Security > Diagnostics & Feedback | Send optional diagnostic data = Off
# Privacy & Security > Diagnostics & Feedback | View diagnostic data = Off
# Privacy & Security > Inking & typing personalisation | customised inking and typing dictionary = Off
# Privacy & Security > Recommendations & offers | Advertising ID = Off
# Privacy & Security > Recommendations & offers | Allow websites to access my language list = Off
# Privacy & Security > Recommendations & offers | Personalised offers = Off
# Privacy & Security > Recommendations & offers | Recommendations and offers in settings = Off
# Privacy & Security > Recommendations & offers | Show notifications in Settings = Off
# Privacy & Security > Search | Search History = Off
# Privacy & Security > Search | Search My accounts (Microsoft account) = Off
# Privacy & Security > Search | Search My accounts (work or school account) = Off
# Privacy & Security > Search | Show search highlights = Off
# System > Advanced > File Explorer | Show file extensions = On
# System > Advanced > File Explorer | Show hidden and system files = On
# System > Advanced | Enable long PATHs
# System > Advanced | End Task = On
# System > Clipboard | Clipboard History = On
# System > Display > Advanced Display | Dynamic Refresh Rate = On
# System > Display > Advanced Display | Refresh Rate = 144Hz (MAX)
# System > Display > Graphics | Hardware-accelerated GPU Scheduling = On
# System > Display > Graphics | Variable Refresh Rate = On
# System > Display | Scale = 100%
# System > Power & Battery | Battery percentage = On
# System > Power & Battery | Closing the lid will make my PC (On Battery) = Sleep
# System > Power & Battery | Closing the lid will make my PC (Plugged in) = Sleep
# System > Power & Battery | Energy Saver = Turns on at 40%
# System > Power & Battery | Make my device sleep after (On Battery) = 3 minutes
# System > Power & Battery | Make my device sleep after (Plugged in) = 5 minutes
# System > Power & Battery | On Battery = Best Power Efficiency
# System > Power & Battery | Plugged in = Balanced
# System > Power & Battery | Pressing the power button will make my PC (On Battery) = Sleep
# System > Power & Battery | Pressing the power button will make my PC (Plugged in) = Sleep
# System > Power & Battery | Pressing the sleep button will make my PC (On Battery) = Sleep
# System > Power & Battery | Pressing the sleep button will make my PC (Plugged in) = Sleep
# System > Power & Battery | Turn my screen off after (On Battery) = 3 minutes
# System > Power & Battery | Turn my screen off after (Plugged in) = 5 minutes
# System > Storage | Storage Sense = On
# System > Troubleshoot | Recommended troubleshooter prefences = Don't run any

#----------------------------------------------------------------------------------------------------
# Time & Language

# Time & Language > Language & region | Display language = English (Australia)
$LangList = New-WinUserLanguageList -Language "en-AU"
Set-WinUserLanguageList $LangList -Force

# Time & Language > Language & region | Language for non-Unicode programmes = English (Australia)
Set-WinSystemLocale -SystemLocale "en-AU"

# Time & Language > Language & region | Preferred languages = English (Australia)
$LangList = New-WinUserLanguageList -Language "en-AU"
Set-WinUserLanguageList $LangList -Force

# Time & Language > Speech | Speech language = English (Australia)
$SpeechPath = "HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\SpeechRecognizer"
New-Item -Path $SpeechPath -Force | Out-Null
Set-ItemProperty -Path $SpeechPath -Name "Language" -Value "en-AU"

#----------------------------------------------------------------------------------------------------
# Windows Updates
$WUPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$AUPath = "$WUPath\AU"
$DOPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"

New-Item -Path $WUPath -Force | Out-Null
New-Item -Path $AUPath -Force | Out-Null
New-Item -Path $DOPath -Force | Out-Null

# Windows Updates > Advanced options > Delivery Optimisation = Off
Set-ItemProperty -Path $DOPath -Name "DODownloadMode" -Value 0 -Type DWord

# Windows Updates > Advanced options | Get me up to date = Off
Set-ItemProperty -Path $WUPath -Name "AllowTemporaryEnterpriseFeatureControl" -Value 0 -Type DWord

# Windows Updates > Advanced options | Notify me when a restart is required to finish updating = Off
Set-ItemProperty -Path $AUPath -Name "AlwaysAutoRebootAtScheduledTime" -Value 0 -Type DWord

# Windows Updates > Advanced options | Receive updates for other Microsoft products = Off
$UXSettings = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"
New-Item -Path $UXSettings -Force | Out-Null
Set-ItemProperty -Path $UXSettings -Name "AllowMUUpdateService" -Value 0 -Type DWord

# Windows Updates | Get the latest updates as soon as they're available = Off
Set-ItemProperty -Path $WUPath -Name "EnableFeaturedSoftware" -Value 0 -Type DWord

#----------------------------------------------------------------------------------------------------
# Disable Web Search In Start.
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Type DWord -Value 1

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