Go to: https://mextner.com 🔗

![192C9918-7228-4FDD-89D6-B780BAAD696A](https://github.com/user-attachments/assets/6dc9bd38-c548-4981-89a6-c8282a3ef8eb)


## Private-topology check

CI runs `scripts/check-private-topology.sh` (plus gitleaks) on every pull request to keep private addresses, host names, MAC addresses and e-mails out of tracked files; use placeholders such as `<server-lan-ip>` or `<tailnet-host>` instead. To also catch your own machine names locally, list one regular expression per line in `~/.config/private-topology/denylist.txt` (never committed) and run the script before pushing.
