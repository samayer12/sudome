## sudome
A proof-of-concept for PyCharm projects that must run with elevated permissions on Linux.
`python-sudo.sh` sources the virtual environment and then executes the project with elevated permissions.
`setup.sh` places the appropriate entry in `/etc/sudoers.d/python`.
The user must enter their `sudo` credentials during `setup.sh`.

## Usage

1. Ensure `setup.sh` is executable (`ls -l setup.sh`).
    ```bash
    -rwxr--r-- 1 user user   535 Mmm DD HH:MM python-sudo.sh
    ```

1. Run `./setup.sh` from project root. Example output:

    ```bash
    [user@host sudome]$ /bin/bash /home/user/PycharmProjects/sudome/setup.sh
    Configuration Line:
    [sudo] password for user: 
    user host = (root) NOPASSWD: /usr/bin/python
    File contents: /etc/sudoers.d/python
    user host = (root) NOPASSWD: /usr/bin/python
```

1. Add `python` as a venv project interpreter in PyCharm.

1. Add `python-sudo.sh` as a project interpreter in PyCharm.
   This will time out or throw an error, but it will be okay.

1. Observe the available run configs from `.idea/runConfigurations/`.

1. Choose any config through PyCharm and run it (`Shift + F10`).

## Required Project Structure
```
ProjectRoot/
  |-.idea/
  |  \- runConfigurations/
  |     \- [XML files]
  |- src/
  |- test/
  |- python-sudo.sh
  |- requirements.txt
  \- setup.sh
```

Inspired by [Eric Smith](https://esmithy.net/2015/05/05/rundebug-as-root-in-pycharm/#:~:text=Click%20the%20gear%20icon%20by,code%20will%20run%20as%20root).
