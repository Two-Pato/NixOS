# NixOS Configuration

## Installation

### 1. Check the flake

```bash
git clone https://github.com/Two-Pato/NixOS.git
cd ~/NixOS
```

<br>

### 2. Find your SSD (optional if already in config)

Find the SSD and put its ID in the config:<br>

```bash
ls -l /dev/disk/by-id/ | grep -v -- '-part'
lsblk -d -o NAME,SIZE,MODEL,SERIAL
```

<br>

### 3. Partition, format and mount

```bash
sudo nix --extra-experimental-features 'nix-command flakes' run \
  'github:nix-community/disko/latest' -- \
  --mode destroy,format,mount \
  --yes-wipe-all-disks \
  --flake ~/NixOS#my-flake
```

Verify that everything is mounted under `/mnt`:<br>

```bash
findmnt -R /mnt
```

<br>

### 4. Generate the hardware configuration (optional if already in config)

Filesystems are handled by disko, so they are skipped here:<br>

```bash
sudo nixos-generate-config \
  --root /mnt \
  --no-filesystems
```

<br>

### 5. Create your password hash

Create a locked-down secrets directory:<br>

```bash
sudo mkdir -p /mnt/persistent/secrets

```

```bash
sudo chmod 700 /mnt/persistent/secrets
```

Generate a yescrypt hash and store it:<br>

```bash
nix-shell -p mkpasswd \
  --run 'mkpasswd -m yescrypt' \
  | sudo tee /mnt/persistent/secrets/password
```

```bash
sudo chmod 600 /mnt/persistent/secrets/password
```

<br>

### 6. Put the flake where it will live

```bash
sudo mkdir -p /mnt/persistent/home/laurent
sudo cp -a ~/NixOS /mnt/persistent/home/laurent/NixOS
sudo chown -R 1000:100 /mnt/persistent/home/laurent
```

<br>

### 7. Install

```bash
sudo nixos-install --flake ~/NixOS#my-flake --no-root-passwd
```

Reboot into the new system when it finishes.<br>

<br>

## Updating the system

Apply changes from the flake directory:<br>

```bash
cd ~/NixOS
sudo nixos-rebuild switch --flake .#my-flake
```