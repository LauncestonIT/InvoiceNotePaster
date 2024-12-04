[Setup]
AppName=Invoice Note Paster
AppVersion=3.0
AppPublisher=Launceston IT
DefaultDirName={commonpf64}\Invoice Note Paster
DefaultGroupName=Invoice Note Paster
PrivilegesRequired=admin
OutputDir=Output
OutputBaseFilename=InvoiceNotePasterInstaller
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64compatible
VersionInfoCompany=Launceston IT
VersionInfoProductName=Invoice Note Paster
VersionInfoVersion=3.0

[Files]
Source: "InvoiceNotePaster.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Invoice Note Paster"; Filename: "{app}\InvoiceNotePaster.exe"
Name: "{group}\Uninstall Invoice Note Paster"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Invoice Note Paster"; Filename: "{app}\InvoiceNotePaster.exe"; Tasks: desktopicon
Name: "{userstartup}\Invoice Note Paster"; Filename: "{app}\InvoiceNotePaster.exe"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop icon"; GroupDescription: "Additional icons:"; Flags: unchecked

[Registry]
; Add the program to run on startup for the current user
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; \
    ValueName: "InvoiceNotePaster"; ValueData: """{app}\InvoiceNotePaster.exe"""; Flags: uninsdeletevalue

[Run]
Filename: "{app}\InvoiceNotePaster.exe"; Description: "Launch Invoice Note Paster"; Flags: nowait postinstall skipifsilent
