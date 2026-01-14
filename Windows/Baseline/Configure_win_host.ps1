# Modificar política de ejecución de script
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force

# Remover auto logon
$reg_winlogon_path = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty -Path $reg_winlogon_path -Name AutoAdminLogon -Value 0
Remove-ItemProperty -Path $reg_winlogon_path -Name DefaultUserName -ErrorAction SilentlyContinue
Remove-ItemProperty -Path $reg_winlogon_path -Name DefaultPassword -ErrorAction SilentlyContinue

#Configurar winrm
winrm set winrm/config/service/auth '@{Basic="true"}'

#winrm enumerate winrm/config/Listener

#Sino esta cofigurado, configura el servicio de winrm
winrm quickconfig