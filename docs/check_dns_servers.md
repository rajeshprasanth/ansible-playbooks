# Ping Remote DNS Servers Playbook

## Purpose

This playbook pings a list of popular DNS servers from the control node or managed hosts to check network connectivity and latency.

## Usage

Run the playbook specifying your inventory:

```bash
ansible-playbook check_dns_servers.yml -i inventories/inventory.ini
```

## Variables

* `dns_servers` (default list):
  A list of IP addresses for DNS servers to ping. Default values are:

  * `8.8.8.8` (Google DNS)
  * `1.1.1.1` (Cloudflare DNS)
  * `9.9.9.9` (Quad9 DNS)

You can override this variable at runtime if needed.

## What it does

1. Pings each DNS server 3 times (`ping -c 3`).
2. Fails the play if any ping command returns a non-zero exit code.
3. Displays the detailed output of each ping command.

## Requirements

* Target hosts must have the `ping` command available.
* No privilege escalation is required (runs without `become`).

## Notes

* Gather facts is disabled for speed.
* The playbook loops over multiple DNS IPs and reports results separately.
* Useful for quick network connectivity and latency diagnostics.
