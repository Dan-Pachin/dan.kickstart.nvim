def hello_world():
    """A simple test function."""
    name = "Neovim"
    print(f"Hello, {name}!")
    return name

if __name__ == "__main__":
    result = hello_world()
    print(f"Function returned: {result}")
