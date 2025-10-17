# ⚙️ Load Balancer Configuration with Vagrant and Ansible

This project automatically sets up a **🔁 round-robin load balancer** using **HAProxy** and two **NGINX** servers on three **Ubuntu** virtual machines (VMs).
The VMs are provisioned using **Vagrant** and configured using **Ansible** 🧩.

---

## 📁 Project Structure

* 🧱 **`Vagrantfile`** – Defines and configures the three VMs created with Vagrant.
* ⚙️ **`playbooks/config.yml`** – Contains base VM configuration (memory, CPU, IPs, node details).
* 🧮 **`playbooks/haproxy.yaml`** – Configures the HAProxy node:

  * Updates the system 🧩
  * Installs HAProxy 🏗️
  * Adds user and SSH setup 🔑
  * Applies HAProxy configuration 🧠
  * Restarts HAProxy ♻️
* 🌐 **`playbooks/nginx1.yaml`** & **`playbooks/nginx2.yaml`** – Configure the two NGINX nodes:

  * Update system 🔧
  * Install NGINX 🚀
  * Add user and SSH setup 🔐
  * Create `index.html` showing hostname and IP 💡
* 📝 **`playbooks/files/scripts/make_html.sh`** – Script that generates the HTML page for NGINX servers, confirming that load balancing works.
* 📊 **`playbooks/vars.yaml`** – Stores all playbook variables for consistency.
* 🗂️ **`inventory`** – Lists node IP addresses for Ansible.

---

## 🧰 Setup Instructions

1. 📦 Install [**Vagrant**](https://www.vagrantup.com/downloads) and [**VirtualBox**](https://www.virtualbox.org/wiki/Downloads).
2. 💻 Enable **Windows Subsystem for Linux (WSL)**.
3. 🐍 Install [**Python**](https://www.python.org/downloads/) and [**Ansible**](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) in WSL.
4. 📂 Clone this repository and navigate to the project directory in your WSL terminal.
5. 🔐 Generate both **Private** and **Public SSH keys** (e.g., `C:\Users\<yourusername>\.ssh\yourkey.ssh`).
6. 🧾 Update the **nginx1**, **nginx2**, and **haproxy** configs with your SSH key details.
7. ▶️ Run **`vagrant up`** to start and provision the VMs automatically.
8. 🧑‍💻 For troubleshooting or manual configuration, connect via SSH using your private key:

   ```bash
   ssh -i alex_key aleksandre@192.168.100.21
   ```

   *(Example: 192.168.100.21 = HAProxy Node Base IP)*

---

## 🧪 Testing the Setup

You can test your load balancer by visiting the **HAProxy node’s IP** in your browser:

```bash
192.168.100.21
```

🌍 Refresh the page several times — you’ll notice that the **IP and hostname** in the response change each time.
This confirms that the **Round-Robin Load Balancer** is working perfectly 🔄.

---

## 🏁 Conclusion

This project demonstrates how **Vagrant** and **Ansible** can automate the setup of a **Load Balancer** and **Web Servers**.
It serves as an excellent foundation for:

* 🧱 Expanding to more servers
* 🔄 Integrating different balancing methods
* 🧩 Experimenting with automation workflows

💡 **Extend and scale it** to fit larger or more complex infrastructure scenarios.
