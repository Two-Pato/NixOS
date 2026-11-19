export NIX_CONFIG="experimental-features = nix-command flakes" <br>
cd ~/NixOS <br>
nix flake check <br>

Find the SSD and put its ID in the config  <br>
ls -l /dev/disk/by-id/ | grep -v -- '-part'  <br>
lsblk -d -o NAME,SIZE,MODEL,SERIAL  <br>

Partition, format and mount <br>
sudo nix run \ <br>
  'github:nix-community/disko/latest' -- \ <br>
  --mode destroy,format,mount \ <br>
  --yes-wipe-all-disks \ <br>
  --flake ~/NixOS#mihari <br>

findmnt -R /mnt <br>

Generate hardware configuration <br>
sudo nixos-generate-config \ <br>
  --root /mnt \ <br>
  --no-filesystems <br>

mkdir -p ~/NixOS/hosts/mihari <br>


sudo cp \ <br>
  /mnt/etc/nixos/hardware-configuration.nix \ <br>
  ~/NixOS/modules/settings/hardware/mihari-hardware.nix <br>


Create your password hash <br>
sudo mkdir -p /mnt/persistent/secrets  <br>
sudo chmod 700 /mnt/persistent/secrets  <br>

nix-shell -p mkpasswd \   <br>
  --run 'mkpasswd -m yescrypt' \  <br>
  | sudo tee /mnt/persistent/secrets/password  <br>
sudo chmod 600 /mnt/persistent/secrets/password  <br>

Put the flake where it will live <br>
sudo mkdir -p /mnt/persistent/home/laurent <br>
sudo cp -a ~/NixOS /mnt/persistent/home/laurent/NixOS <br>
sudo chown -R 1000:100 /mnt/persistent/home/laurent <br>


Install
sudo nixos-install --flake ~/NixOS#mihari --no-root-passwd

sudo cp /etc/nixos/hardware-configuration.nix NixOS/system/my-flake  <br>
sudo mv /etc/nixos /etc/nixos.bak  <br>
sudo ln -s ~/NixOS /etc/nixos  <br>
cd /etc/nixos  <br>
sudo nixos-rebuild switch --flake .#my-flake  <br>
