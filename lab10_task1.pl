% Square: Area = Side^2, Perimeter = 4 * Side
square(Side, Area, Perimeter) :-
    Area is Side * Side,
    Perimeter is 4 * Side.

% Rectangle: Area = Width * Height, Perimeter = 2 * (Width + Height)
rectangle(Width, Height, Area, Perimeter) :-
    Area is Width * Height,
    Perimeter is 2 * (Width + Height).

% Triangle: Area = 0.5 * Base * Height, Perimeter = A + B + C
triangle(Base, Height, A, B, C, Area, Perimeter) :-
    Area is 0.5 * Base * Height,
    Perimeter is A + B + C.