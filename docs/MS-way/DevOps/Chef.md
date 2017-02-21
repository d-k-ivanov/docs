### Chef environment by Steven Murawski
```powershell
# First (from PowerShell), some basic ExecutionPolicy configuration. Then install the latest ChefDK and Chocolatey. After that, apply a basic Chef recipe to install Git, ConEmu, Visual Studio Code, 7Zip, WinMerge, and Vagrant.

# Setup my execution policy for both the 64 bit and 32 bit shells
set-executionpolicy remotesigned
start-job -runas32 {set-executionpolicy remotesigned} | receive-job -wait

# Install the latest stable ChefDK
invoke-restmethod 'https://omnitruck.chef.io/install.ps1' | iex
install-project chefdk -verbose

# Install Chocolatey
invoke-expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

# Get a basic setup recipe
invoke-restmethod 'https://gist.githubusercontent.com/smurawski/da67107b5efd00876af7bb0c8cfe8453/raw' | out-file -encoding ascii -filepath c:/basic.rb

# Use Chef Apply to setup 
chef-apply c:/basic.rb

# After Visual Studio Code is installed, you'll want to install a couple of handy extensions:
#    Chef - https://marketplace.visualstudio.com/items?itemName=Pendrica.Chef
#    PowerShell - https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell
```

### Chef environment by Karsten Müller
*  basic.rb 
```ruby
chocolatey_package 'git' do
  package_name 'git'
  options '-params /GitAndUnixToolsOnPath'
end

packages =  %w[conemu visualstudiocode 7zip winmerge vagrant autohotkey]
packages.each do |pkg|
  chocolatey_package pkg
end

gems = %w[kitchen-pester kitchen-hyperv kitchen-dsc kitchen-azurerm azure-credentials pry pry-byebug pry-stack_explorer appbundle-updater]
gems.each do |gem|
  chef_gem gem do
    compile_time false if respond_to?(:compile_time)
  end
end

extensions = %w[ ms-vscode.PowerShell msazurermtools.azurerm-vscode-tools Pendrica.Chef ]
extensions.each do |ext|
  execute "install vscode extension #{ext}" do
    command "code --install-extension #{ext}"
  end
end

powershell_script 'Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force' do
end

modules = %w[ PSReadline ]
modules.each do |mod|
  powershell_script "Install-Module #{mod} -Force" do
  end
end

directory 'C:\Work\Chef' do
  recursive true
  action :create
end

execute 'chef generate repo example_repo -p' do
  cwd 'C:\Work\Chef'
end
```
* bootstrap.ps1
```powershell
# Setup my execution policy for both the 64 bit and 32 bit shells
set-executionpolicy remotesigned
start-job -runas32 {set-executionpolicy remotesigned} | receive-job -wait
# Install fixed version of ChefDK 
invoke-restmethod 'https://omnitruck.chef.io/install.ps1' | iex
install-project chefdk -verbose -version 1.1.16
# Install Chocolatey
invoke-expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
# Get a basic setup recipe
Invoke-RestMethod -UseBasicParsing 'https://gist.githubusercontent.com/karstenmueller/0c2257684b8e6a44bac9526c52074e18/raw/a150048b7ffbfe202f90fdce446b8095b3e7858c/basic.rb' | out-file -encoding ascii -filepath c:/basic.rb
# We dont need any Windows 10 Apps
Get-AppxPackage | Remove-AppxPackage 2>&1>$null
# Use Chef Apply to setup 
chef-apply c:/basic.rb
write-host "executed chef recipe c:/basic.rb"
```