# Ansible LAMP Server Setup

Proyecto de automatización para la instalación y configuración de un **servidor LAMP (Linux, Apache, MariaDB, PHP)** utilizando **Ansible**. Este proyecto está orientado a demostrar buenas prácticas de automatización e Infrastructure as Code aplicadas a entornos Linux.

---

## 📌 Descripción

Está pensado como proyecto demostrativo para perfiles de **Linux System Administrator / DevOps**, eliminando configuraciones manuales y reduciendo errores humanos.

---

## 🧱 Arquitectura

* **Sistema Operativo:** Linux (Debian / Ubuntu)
* **Servidor Web:** Apache 2
* **Base de Datos:** MariaDB
* **Lenguaje:** PHP
* **Automatización:** Ansible

---

## ⚙️ Requisitos

* Ansible instalado en el nodo de control
* Acceso SSH al servidor destino
* Usuario con privilegios de `sudo`
* Sistema operativo Debian/Ubuntu en el host remoto

---

## 📂 Estructura del proyecto

```
Ansible/
├── lamp.yml
├── phpinfo.php
└── README.md
```

---

## ▶️ Uso

1. Clonar el repositorio:

```bash
git clone https://github.com/wezd1308/Ansible
cd Ansible
```

2. Editar el inventario o el playbook y ajustar la IP del servidor destino:

```yaml
hosts: 192.168.91.160
```

3. Ejecutar el playbook:

```bash
ansible-playbook lamp.yml --ask-become-pass 
```

---

## 📜 Playbook

El playbook realiza las siguientes tareas:

* Actualiza los repositorios del sistema
* Instala Apache
* Instala MariaDB
* Instala PHP y módulos requeridos
* Reinicia el servicio Apache
* Copia un archivo `phpinfo.php` al directorio web


## 🌐 Verificación

Una vez finalizada la ejecución, acceder desde un navegador a:

```
http://IP_DEL_SERVIDOR/phpinfo.php
```

Si la página muestra la información de PHP, la pila LAMP fue instalada correctamente.

---

---

## 👤 Autor

**Walter Zambrano**


---



