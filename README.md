# Using Docker Container To Run GUI App With X11 From Ubuntu

## For testing

Once you are in the Docker container, try `xeyes`, `xclock`.

## Fix "Can't open display" on Ubuntu 22.04

When you see the following error:

```text
Error: Can't open display: :1
```

The solution only works on Ubuntu

### Step 1: Check `sshd` config

Edit `sudo vim /etc/ssh/sshd_config`:

```text
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes
```

Restart `sshd`

```bash
sudo systemctl restart sshd
```

### Step 2: Add xauth permission

```bash
# Generate a cookie for the display
xauth generate $DISPLAY . trusted

# Check cookies
xauth list

# (Optional) Find where the authfile is:
# It returns "Using authority file /run/user/1000/gdm/Xauthority" in Ubuntu 22.04
xauth

```

```bash
# Add localuser
xhost +SI:localuser:root

# Check
xhost
```
