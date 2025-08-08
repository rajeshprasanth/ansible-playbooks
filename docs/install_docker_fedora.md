# Install Docker on Fedora Playbook

## Purpose

This playbook installs Docker Engine and related components on Fedora hosts, sets up the official Docker repository, imports Docker’s GPG key, and ensures the Docker service is running and enabled.

## Usage

Run the playbook with:

```bash
ansible-playbook install_docker_fedora.yml -i inventory.ini -e "target=your_target_group"
```

## Variables

| Variable          | Description                        | Default Value                                             |
| ----------------- | ---------------------------------- | --------------------------------------------------------- |
| `docker_repo_url` | URL for the Docker repository file | `https://download.docker.com/linux/fedora/docker-ce.repo` |
| `docker_gpg_key`  | URL to Docker’s GPG key            | `https://download.docker.com/linux/fedora/gpg`            |

## What it does

1. Installs `dnf-plugins-core` required to manage repositories.
2. Adds the official Docker repository if not already present.
3. Imports Docker’s GPG key for package verification.
4. Installs Docker Engine and related packages (`docker-ce`, `docker-ce-cli`, `containerd.io`, `docker-buildx-plugin`, `docker-compose-plugin`).
5. Ensures the Docker service is started and enabled on boot.
6. Validates the installation by checking Docker version and running `docker ps`.

## Requirements

* Fedora-based hosts with `dnf` package manager.
* Sudo or root privileges.
* Internet access to download packages and keys.

## Notes

* The playbook uses idempotent checks to avoid re-adding repositories.
* Handlers are defined to restart Docker service when needed (not currently triggered).
* Modify variables if you want to use a different Docker repository or version.
* Tags (`install`, `repo`, `service`, `validate`) allow running specific parts of the playbook selectively.

---

Let me know if you want the README tailored for any specific use case or extra detail!
