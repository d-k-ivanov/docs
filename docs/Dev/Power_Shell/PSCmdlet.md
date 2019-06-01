## PSCmdlet example 

```ps1
ls -la | grep Xresources
```

### PSCmdlet

```ps1
ParameterSetName     : __AllParameterSets
MyInvocation         : System.Management.Automation.InvocationInfo
PagingParameters     :
InvokeCommand        : System.Management.Automation.CommandInvocationIntrinsics
Host                 : System.Management.Automation.Internal.Host.InternalHost
SessionState         : System.Management.Automation.SessionState
Events               : System.Management.Automation.PSLocalEventManager
JobRepository        : System.Management.Automation.JobRepository
JobManager           : System.Management.Automation.JobManager
InvokeProvider       : System.Management.Automation.ProviderIntrinsics
Stopping             : False
CommandRuntime       : grep
CurrentPSTransaction :
CommandOrigin        : Runspace
```

### PSCmdlet.MyInvocation

```ps1
MyCommand             : grep
BoundParameters       : {[Pattern, Xresources], [Data, total 152]}
UnboundArguments      : {}
ScriptLineNumber      : 1
OffsetInLine          : 10
HistoryId             : 2
ScriptName            :
Line                  : ls -la | grep Xresources
PositionMessage       : At line:1 char:10
                        + ls -la | grep Xresources
                        +          ~~~~~~~~~~~~~~~
PSScriptRoot          :
PSCommandPath         :
InvocationName        : grep
PipelineLength        : 2
PipelinePosition      : 2
ExpectingInput        : True
CommandOrigin         : Runspace
DisplayScriptPosition :
```

### PSCmdlet.InvokeCommand

```ps1
HasErrors               : False
CommandNotFoundAction   :
PreCommandLookupAction  :
PostCommandLookupAction :
```

### PSCmdlet.Host

```ps1
Name             : ConsoleHost
Version          : 5.1.17763.503
InstanceId       : 80310f17-3d63-43e3-babd-2638782cd714
UI               : System.Management.Automation.Internal.Host.InternalHostUserInterface
CurrentCulture   : ru-RU
CurrentUICulture : en-US
PrivateData      : Microsoft.PowerShell.ConsoleHost+ConsoleColorProxy
DebuggerEnabled  : True
IsRunspacePushed : False
Runspace         : System.Management.Automation.Runspaces.LocalRunspace
```

### PSCmdlet.SessionState

```ps1
Drive                         : System.Management.Automation.DriveManagementIntrinsics
Provider                      : System.Management.Automation.CmdletProviderManagementIntrinsics
Path                          : System.Management.Automation.PathIntrinsics
PSVariable                    : System.Management.Automation.PSVariableIntrinsics
LanguageMode                  : FullLanguage
UseFullLanguageModeInDebugger : False
Scripts                       : {*}
Applications                  : {*}
Module                        :
InvokeProvider                : System.Management.Automation.ProviderIntrinsics
InvokeCommand                 : System.Management.Automation.CommandInvocationIntrinsics
```

### PSCmdlet.Events

```ps1
Subscribers    : {}
ReceivedEvents : {}
```

### PSCmdlet.JobRepository

```ps1
Jobs : {}
```

### PSCmdlet.JobManager

```ps1
System.Management.Automation.JobManager
```

### PSCmdlet.InvokeProvider

```ps1
Item               : System.Management.Automation.ItemCmdletProviderIntrinsics
ChildItem          : System.Management.Automation.ChildItemCmdletProviderIntrinsics
Content            : System.Management.Automation.ContentCmdletProviderIntrinsics
Property           : System.Management.Automation.PropertyCmdletProviderIntrinsics
SecurityDescriptor : System.Management.Automation.SecurityDescriptorCmdletProviderIntrinsics
```
