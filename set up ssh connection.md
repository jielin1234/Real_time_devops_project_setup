Method 1: using ssh-copy-id
1. `ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@172.31.35.220`
Method 2: Manual Copying via Existing Access
1. Log in to the target server
2. Manually copy the public key
		mkdir -p ~/.ssh
		echo "your-public-key-content" >> ~/.ssh/authorized_keys
		chmod 700 ~/.ssh
		chmod 600 ~/.ssh/authorized_keys

Verify:
After copying the public key, try to SSH into the target server again from your Jenkins server.



