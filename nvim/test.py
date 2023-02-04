import math
from typing import Optional


# Try a very long comment that drags on forever because you maybe added an URL or something like that idk
class MyClass:
    def __init__(self, value: int, name: Optional[str] = None) -> None:
        self.value = value
        self.name = name


c = MyClass(value="bal")


def get_square_root(x: int) -> float:
    if x < 0:
        raise ValueError(f"Input must be a natural number, {x} given")
    return math.sqrt(x)


if __name__ == "__main__":
    print(get_square_root(16))
    print(get_square_root(15))
    get_square_root("")
