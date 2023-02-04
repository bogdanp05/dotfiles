import math
from typing import Optional

from pydantic import BaseModel

# Try a very long comment that drags on forever because you maybe added an URL or something like that idk


class MyClass(BaseModel):
    value: int
    name: Optional[str]


c = MyClass()

c.name = "aefdef"


def get_square_root(x: int) -> float:
    if x < 0:
        raise ValueError(f"Input must be a natural number, {x} given")
    return math.sqrt(x)


if __name__ == "__main__":
    print(get_square_root(16))
    print(get_square_root(15))
