
# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.313.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.313.0/actions-runner-linux-x64-2.313.0.tar.gz
# Optional: Validate the hash
echo "56910d6628b41f99d9a1c5fe9df54981ad5d8c9e42fc14899dcc177e222e71c4  actions-runner-linux-x64-2.313.0.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.313.0.tar.gz
Configure
# Create the runner and start the configuration experience
./config.sh --url https://github.com/deviceTRUST/hetzner-lab --token AD6OYKVUG3PUNE3OKDFKV23F4XGR2
# Last step, run it!
./run.sh
Using your self-hosted runner
# Use this YAML in your workflow file for each job
runs-on: self-hosted