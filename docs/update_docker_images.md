# Pull Docker Images Playbook

## Purpose

This playbook pulls Docker images on the target hosts. It can either:

* Pull all Docker images currently used by running or stopped containers, or
* Pull a specific Docker image provided as a variable.

## Usage

To pull all images used by existing containers:

```bash
ansible-playbook pull_docker_images.yml -i inventories/inventory.ini -e "target=your_target_group"
```

To pull a specific Docker image:

```bash
ansible-playbook pull_docker_images.yml -i inventories/inventory.ini -e "target=your_target_group target_image=nginx:latest"
```

## Variables

* `target_image` (default: `""`):

  * If empty or undefined, the playbook pulls all Docker images used by containers on the host.
  * If set, only the specified image is pulled.

## What it does

1. If `target_image` is empty:

   * Retrieves the list of Docker images used by all containers on the host.
   * Deduplicates the image list.

2. If `target_image` is set:

   * Uses the provided image name as the sole target.

3. Displays the list of Docker images that will be pulled.

4. Pulls the determined Docker images from their registries.

## Requirements

* Docker must be installed and running on the target hosts.
* The `community.docker` collection installed on the control node (`ansible-galaxy collection install community.docker`).
* Sudo/root privileges for Docker commands.

## Notes

* The playbook uses a shell command with `pipefail` to safely gather images used by containers.
* If no containers exist and no `target_image` is specified, no images will be pulled.
* This playbook only pulls images; it does not manage container lifecycle.

---

Let me know if you want README for any other playbook!
