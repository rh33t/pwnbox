Minimal Kali with i3 and only the tools I use.

> [!WARNING]
> Fresh minimal Kali only (untick everything at software selection). Snapshot first.

```bash
sudo apt update && sudo apt install -y ansible git make
git clone https://github.com/rh33t/pwnbox.git && cd pwnbox
make setup && sudo reboot
```

Optional: `./scripts/install-recon.sh` for Go recon tools.

QEMU host: `gsettings set org.virt-manager.virt-manager.console resize-guest 1`

Based on [IppSec's parrot-build](https://github.com/IppSec/parrot-build) and
[Arszilla's i3-dotfiles](https://gitlab.com/arszilla/i3-dotfiles) (MIT).
