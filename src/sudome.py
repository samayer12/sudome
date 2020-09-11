import os


def sudome():
    return os.getuid()


if __name__ == '__main__':
    print(sudome())
