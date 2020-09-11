import os


def sudome():
    print("hit")
    return os.getuid()


if __name__ == '__main__':
    print(sudome())
