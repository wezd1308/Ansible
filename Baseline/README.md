# 🐧 Preparación de Servidor Linux Debian con Ansible

Este repositorio contiene un **playbook de Ansible** diseñado para estandarizar la preparación inicial de servidores **Linux Debian** de forma automática, repetible y segura.

El objetivo es dejar el servidor listo para su uso productivo aplicando una configuración base (*baseline*).

---

## 📌 Funcionalidades del Playbook

El playbook realiza las siguientes tareas en el servidor remoto:

* ✅ Cambia el **nombre del servidor (hostname)**
* ✅ Configura una **dirección IP estática**
* ✅ Ajusta la **zona horaria**
* ✅ Crea un **usuario local de aplicación**
* ✅ Instala herramientas básicas:

  * `htop`
  * `fail2ban`
  * `net-tools`
  * `unzip`
  * `rsync`

---

## 🧱 Requisitos

### En el servidor controlador de Ansible

* Ansible instalado
* Acceso SSH a los servidores destino
* Clave SSH configurada

### En los servidores Debian gestionados

* Debian 12 / Debian 13
* Acceso SSH habilitado
* Usuario con privilegios sudo

---

## 🚀 Preparación previa del servidor Debian

### 🔹 Paso 1: Crear usuario de administración

Se debe crear un usuario en el servidor Debian con el **mismo nombre que el usuario utilizado en el servidor controlador de Ansible**.

En este caso:

* Usuario: `srvcansi`
* El usuario es miembro de un grupo de Active Directory con privilegios de **root (sudo)**

Esto permite que Ansible se conecte sin conflictos de permisos.

---

### 🔹 Paso 2: Configurar acceso SSH por clave

Desde el servidor controlador de Ansible, generar la clave SSH (si no existe):

```bash
ssh-keygen
```

Copiar la clave pública al servidor Debian:

```bash
ssh-copy-id srvcansi@IP_DEL_SERVIDOR
```

Verificar acceso sin contraseña:

```bash
ssh srvcansi@IP_DEL_SERVIDOR
```

---

### 🔹 Paso 3: Configurar el inventario de Ansible

Agregar el servidor al archivo de inventario:

```ini
[debian_servers]
192.168.91.164
```

Opcionalmente, se pueden definir variables por host:

```ini
192.168.91.164 hostname=srv-app01 iface=ens33 ip_address=192.168.91.200
```

---

### 🔹 Paso 4: Copiar el playbook al servidor controlador

Clonar o copiar los archivos YAML del repositorio al servidor controlador de Ansible.

Ejemplo:

```bash
git clone https://github.com/tu_usuario/tu_repositorio.git
cd tu_repositorio
```

El playbook principal es:

```
Baseline_LNX_debian_v2.yml
```

---

### 🔹 Paso 5: Ejecutar el playbook

Ejecutar el playbook con privilegios sudo:

```bash
ansible-playbook Baseline_LNX_debian_v2.yml --ask-become-pass
```

Si todo está correctamente configurado, el servidor quedará preparado automáticamente.

---

## 📂 Estructura recomendada del repositorio

```
.
├── Baseline_LNX_debian_v2.yml
├── inventory
├── README.md
└── files/
```

---

## ⚠️ Consideraciones importantes

* Cambiar la IP del servidor puede **interrumpir la sesión SSH**.
 * Se recomienda ejecutar el playbook desde consola (VM, iLO, DRAC).
* Probar siempre en entornos de laboratorio antes de producción.


---

## 🧠 Beneficios

* ✔ Automatización completa
* ✔ Configuración consistente
* ✔ Reducción de errores manuales
* ✔ Reutilizable y escalable

---

## ✍️ Autor

**Walter Zambrano**
Administrador de Sistemas / Infraestructura IT

---

## 📄 Licencia

Este proyecto se distribuye bajo la licencia MIT. Puedes modificarlo y adaptarlo según tus necesidades.

