# Bamboo

## Fix PowerShell Task on Windows Agent

Error:

```txt
com.atlassian.utils.process.ProcessNotStartedException: powershell could not be started
    at com.atlassian.utils.process.ExternalProcessImpl.start(ExternalProcessImpl.java:342)
    at com.atlassian.bamboo.process.ProcessServiceImpl.executeExternalProcess(ProcessServiceImpl.java:204)
    at com.atlassian.bamboo.process.ProcessServiceImpl.executeExternalProcess(ProcessServiceImpl.java:218)
    at com.atlassian.bamboo.plugins.shell.task.AbstractShellBuildTask.execute(AbstractShellBuildTask.java:48)
    at com.atlassian.bamboo.plugins.script.task.ScriptBuildTask.execute(ScriptBuildTask.java:68)
    at com.atlassian.bamboo.task.TaskExecutorImpl.lambda$executeTasks$3(TaskExecutorImpl.java:323)
    at com.atlassian.bamboo.task.TaskExecutorImpl.executeTaskWithPrePostActions(TaskExecutorImpl.java:258)
    at com.atlassian.bamboo.task.TaskExecutorImpl.executeTasks(TaskExecutorImpl.java:323)
    at com.atlassian.bamboo.task.TaskExecutorImpl.execute(TaskExecutorImpl.java:118)
    at com.atlassian.bamboo.build.pipeline.tasks.ExecuteBuildTask.call(ExecuteBuildTask.java:73)
    at com.atlassian.bamboo.v2.build.agent.DefaultBuildAgent.executeBuildPhase(DefaultBuildAgent.java:190)
    at com.atlassian.bamboo.v2.build.agent.DefaultBuildAgent.build(DefaultBuildAgent.java:162)
    at com.atlassian.bamboo.v2.build.agent.BuildAgentControllerImpl.lambda$waitAndPerformBuild$0(BuildAgentControllerImpl.java:131)
    at com.atlassian.bamboo.variable.CustomVariableContextImpl.withVariableSubstitutor(CustomVariableContextImpl.java:118)
    at com.atlassian.bamboo.v2.build.agent.BuildAgentControllerImpl.waitAndPerformBuild(BuildAgentControllerImpl.java:125)
    at com.atlassian.bamboo.v2.build.agent.DefaultBuildAgent.lambda$start$0(DefaultBuildAgent.java:110)
    at com.atlassian.bamboo.utils.BambooRunnables$1.run(BambooRunnables.java:48)
    at com.atlassian.bamboo.security.ImpersonationHelper.runWith(ImpersonationHelper.java:26)
    at com.atlassian.bamboo.security.ImpersonationHelper.runWithSystemAuthority(ImpersonationHelper.java:17)
    at com.atlassian.bamboo.security.ImpersonationHelper$1.run(ImpersonationHelper.java:41)
    at java.lang.Thread.run(Unknown Source)
Caused by: java.io.IOException: Cannot run program "powershell" (in directory "C:\build\DEV-CPPDEPEND-ANALYZE"): CreateProcess error=2, The system cannot find the file specified
    at java.lang.ProcessBuilder.start(Unknown Source)
    at com.atlassian.utils.process.ExternalProcessImpl.createDefaultProcess(ExternalProcessImpl.java:377)
    at com.atlassian.utils.process.ExternalProcessImpl.createProcess(ExternalProcessImpl.java:385)
    at com.atlassian.utils.process.ExternalProcessImpl.start(ExternalProcessImpl.java:339)
    ... 20 more
Caused by: java.io.IOException: CreateProcess error=2, The system cannot find the file specified
    at java.lang.ProcessImpl.create(Native Method)
    at java.lang.ProcessImpl.<init>(Unknown Source)
    at java.lang.ProcessI
```

Resolution:

```ps1
Remove-ItemProperty -Path 'Registry::HKEY_USERS\.DEFAULT\Environment\' -Name PATH
[Environment]::SetEnvironmentVariable("PATH", $null, "User")
```
