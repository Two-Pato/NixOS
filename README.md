sudo cp /etc/nixos/hardware-configuration.nix NixOS/system/my-flake  <br> 
sudo mv /etc/nixos /etc/nixos.bak  <br> 
sudo ln -s ~/NixOS /etc/nixos  <br> 
cd /etc/nixos  <br> 
sudo nixos-rebuild switch --flake .#my-flake  <br> 
