; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define public Dependency_NoExampleSetup
#include "CodeDependencies.iss"

#define MyAppName "WSA System Control"
#define MyAppVersion "1.0.9"
#define MyAppPublisher "infinitepower18"
#define MyAppURL "https://github.com/infinitepower18/WSA-SystemControl"
#define MyAppUpdateURL "https://github.com/infinitepower18/WSA-SystemControl/releases/latest"
#define MyAppExeName "WSA System Control.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{310072C2-B91C-48F3-A10D-A30977307235}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppUpdateURL}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=no
ChangesAssociations=no
DisableProgramGroupPage=yes
LicenseFile=C:\Users\Ahnaf\source\repos\WSA-SystemControl\LICENSE.txt
; Remove the following line to run in administrative install mode (install for all users.)
;PrivilegesRequired=lowest
;PrivilegesRequiredOverridesAllowed=dialog
OutputDir=C:\Users\Ahnaf\Desktop\Installer
OutputBaseFilename=WSASystemControl_{#MyAppVersion}_x64
SetupIconFile=C:\Users\Ahnaf\source\repos\WSA-SystemControl\WSA System Control\app.ico
UninstallDisplayIcon={app}\app.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
;MinVersion=10.0.19041
ArchitecturesAllowed=x64 arm64
ArchitecturesInstallIn64BitMode=x64 arm64
LanguageDetectionMethod=uilanguage
ShowLanguageDialog=no

[Code]
function InitializeSetup: Boolean;
begin
  Dependency_AddDotNet80Desktop;
  Result := True;
end;

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ja"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "zh"; MessagesFile: "compiler:Languages\Chinese.isl"
Name: "hu"; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: "ar"; MessagesFile: "compiler:Languages\Arabic.isl"

[CustomMessages]
en.runOnStartup=Run on startup
ja.runOnStartup=スタートアップとして実行
zh.runOnStartup=启动时运行
hu.runOnStartup=Futtatni indításkor
ar.runOnStartup=التشغيل مع بدء التشغيل

[Tasks]
Name: startup; Description: "Run WSA System Control on Windows login";

[Files]
Source: "C:\Program Files (x86)\Inno Setup 6\netcorecheck_x64.exe"; Flags: dontcopy noencryption
Source: "C:\Users\Ahnaf\source\repos\WSA-SystemControl\WSA System Control\bin\Release\net8.0-windows10.0.22000.0\publish\win-x64\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Ahnaf\source\repos\WSA-SystemControl\WSA System Control\bin\Release\net8.0-windows10.0.22000.0\publish\win-x64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commonstartup}\app"; Filename: "{app}\{#MyAppExeName}"; Tasks: startup

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
