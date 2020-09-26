# Generate config line to execute virtualenv from Pycharm.
echo "INFO  - Generate configuration line:"
# echo "$(whoami) $(hostname) = (root) NOPASSWD: $(which python)" | sudo EDITOR='tee -a' visudo -f /etc/sudoers.d/python

echo "INFO  - File contents: /etc/sudoers.d/python"
sudo cat /etc/sudoers.d/python

if ! command -v virtualenv &>/dev/null; then
  echo "ERROR - Missing virtualenv binary. Run: pip install virtualenv"
  exit 1
fi

# Create and enter venv
virtualenv venv
source venv/bin/activate
# Update pip and gather requirements
python -m pip install -U pip
pip install -r requirements.txt

echo -e "\nNext, add \`python-sudo.sh\` as an existing-environment interpreter in PyCharm."