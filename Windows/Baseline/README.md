🧪 Home Lab – Automatización de Windows Server con Ansible y Chocolatey
📌 Descripción

Este proyecto forma parte de un Home Lab diseñado para practicar y demostrar la automatización de servidores Windows Server utilizando Ansible y Chocolatey como gestor de paquetes.
El laboratorio simula un entorno real de infraestructura IT, donde un Ansible Controller (Linux) administra servidores Windows mediante WinRM, permitiendo instalar aplicaciones de forma automática, repetible y estandarizada.

🎯 Objetivos del proyecto
- Automatizar la instalación de software en Windows Server
- Integrar Ansible con entornos Windows mediante WinRM
- Utilizar Chocolatey para la gestión de paquetes
- Documentar un laboratorio funcional con fines educativos y profesionales


🏗️ Arquitectura del laboratorio

[ Ansible Controller (Linux) ]
            |
            |  WinRM (5985 / NTLM)
            v
[ Windows Server ]

⚙️ Requisitos
Ansible Controller
- Linux (Debian / Ubuntu)
- Ansible instalado
Servidores Windows
- Windows Server
- PowerShell habilitado
- WinRM configurado
- Acceso administrativo


🔧 Preparación del servidor Windows
Antes de ejecutar el playbook, es necesario preparar el servidor Windows.
1️⃣ Configurar política de ejecució

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force

2️⃣ Configurar WinRM
winrm quickconfig
winrm set winrm/config/service/auth '@{Basic="true"}'

📁 Inventario de Ansible
Ejemplo utilizado en el laboratorio:
[servidores_windows]
192.168.91.146
192.168.91.147
192.168.91.152

[servidores_windows:vars]
ansible_user=Administrator
ansible_password=********
ansible_port=5985
ansible_winrm_transport=ntlm
ansible_connection=winrm
ansible_winrm_scheme=http
ansible_winrm_server_cert_validation=ignore



📜 Playbook – Instalación de aplicaciones con Chocolatey
El playbook realiza las siguientes tareas:
- Instalación de Chocolatey
- Verificación de Chocolatey
- Instalación automática de aplicaciones

📦 Software instalado
- Sysinternals
- 7-Zip
- Notepad++
- Postman
- TreeSize
- WinSCP
- PowerShell 7
- SQL Server Management Studio

▶️ Ejecución del playbook
Ejecutar contra todos los servidores
ansible-playbook -i inventory instalar_choco.yml


Ejecutar contra un único servidor
ansible-playbook -i inventory instalar_choco.yml --limit 192.168.91.147


Validar conectividad
ansible servidores_windows -i inventory -m win_ping



✅ Resultado esperado
- Chocolatey instalado correctamente
- Aplicaciones desplegadas automáticamente
- Proceso repetible y escalable

🧠 Buenas prácticas
- Uso de módulos nativos de Ansible (win_chocolatey)
- Inventario segmentado por grupos
- Ejecución controlada por host
- Automatización idempotente

🚀 Próximos pasos
- Separar tareas en roles
- Uso de variables y vault
- Soporte para múltiples entornos

✍️ Autor
Walter Zambrano
Administrador de Sistemas / Infraestructura IT



