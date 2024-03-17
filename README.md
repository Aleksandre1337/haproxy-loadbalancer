# Load Balancer Configuration with Vagrant and Ansible

This project automatically sets up a round-robin load balancer using HAProxy and two NGINX servers on three Ubuntu virtual machines (VMs). The VMs are provisioned using Vagrant and configured using Ansible.

## Project Structure

- `Vagrantfile`: This file contains the configuration details for the creation of the three VMs using Vagrant.

- `playbooks/config.yml`: This playbook contains the base configuration details for the VMs, such as memory, CPU, base IP, and nodes.

- `playbooks/haproxy.yaml`: This playbook is used to configure the HAProxy node. It updates the system, installs HAProxy, adds a user, sets up SSH, adds the HAProxy configuration, and restarts HAProxy.

- `playbooks/nginx1.yaml` and `playbooks/nginx2.yaml`: These playbooks are used to configure the two NGINX nodes. They update the system, install NGINX, add a user, set up SSH, and create a basic `index.html` file that displays the server IP and hostname.

- `playbooks/files/scripts/make_html.sh`: This script generates the `index.html` file for the NGINX servers. The file contains the hostname and IP address of the server, demonstrating that the round-robin load balancing is working.

- `playbooks/vars.yaml`: This file contains the variables used by the playbooks.

- `inventory`: This file contains the IP addresses of the nodes.

## Setup
1. Install [Vagrant](https://www.vagrantup.com/downloads) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) on your Windows machine.

2. Enable the Windows Subsystem for Linux (WSL) on your Windows machine.

3. Install [Python](https://www.python.org/downloads/) and [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) on your WSL environment. Note that Python is required for Ansible to work.

4. Clone this repository and navigate to the project directory in the WSL environment.

5. Generate both Private and Public SSH keys (Usually generated at - C:\Users\yourusername\.ssh\yourkey.ssh)

6. Update the nginx1, nginx2 and haproxy configuration files according to your newly generated SSH keys

7. Run `vagrant up` to start the VMs and wait for their provisioning.

8. For Troubleshooting or further configuration, connect to the nodes with your locally generated private SSH Key (Public Keys will be present on all three nodes)

`Example: ssh -i alex_key aleksandre@192.168.100.21 (Base IP - HAProxy Node)`

## Testing

You can test the load balancer by sending a request to the HAProxy node's IP address. The request should be forwarded to one of the NGINX servers, and the response should contain the IP and hostname of the server that handled the request.

`Example: Enter 192.168.100.21 into your browser and reload the page several times`

You will notice that the hostnames and the IP addresses change after each reaload. This means that the `Round-Robin (Load Balancer)` is working as intended.

## Conclusion

This project demonstrates the use of Vagrant and Ansible for automating the setup and configuration of a load balancer and servers. It can be a good starting point for more complex configurations and can be easily extended to support more servers or different types of servers.
