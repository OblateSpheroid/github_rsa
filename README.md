# Ad-hoc Method
Replace `github_rsa.pub` with your public key. Replace `github_rsa.cpt` with your 
**ccrypt** encrypted private key.

Run `source script.sh` (requires **ccrypt** to be installed)

Enter password to decrypt private key and load into ssh-agent. This will stay 
active for the rest of your termal session.

# Permanent Method

### Step 1: Generate key pair (if needed)
`ssh-keygen -t rsa -b 4096 -C "<github email>"`

Name new key `$HOME/.ssh/github_rsa`

### Step 2: Put public key on GitHub
Go to GitHub **Settings** > **SSH and GPG keys** > **New SSH key**

Give the key a name, then copy and paste contents of `github_rsa.pub` into **Key** box.

### Step 3: Add private key to agent
Add lines to `$HOME/.bashrc`:
```
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/github_rsa 
```
to load this key when you start a terminal

### Step 4: Testing SSH connection
Restart terminal. Run:

`ssh -T git@github.com`

### Step 5: Clone remote repos using SSH keys
From repo's main page click **Clone or download** and *Use SSH*. Copy SSH link to use in `git clone`, as in:

`git clone <SSH link>`

Or set already existing repo's remote address as, in:

`git remote set-url origin <SSH link>`
