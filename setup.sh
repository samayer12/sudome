# Generate config line to execute virtualenv from Pycharm.
echo "Generate configuration line:"
echo "$(whoami) $(hostname) = (root) NOPASSWD: $(which python)" | sudo EDITOR='tee -a' visudo -f /etc/sudoers.d/python

# Confirm changes to file.
echo "INFO - File contents: /etc/sudoers.d/python"
sudo cat /etc/sudoers.d/python

echo -e "\nNext, add \`python-sudo.sh\` as an existing-environment interpreter in PyCharm."