% User dataset
user(admin, pass123).
user(ahmed, secret).

% Start with 3 attempts 
login :-
    attempt(3).

%  Base case: 0 attempts left
attempt(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

% If attempts > 0, read user/pass and verify
attempt(Tries) :-
    Tries > 0,
    write('Enter username: '), read(User),
    write('Enter password: '), read(Pass),
    verify(User, Pass, Tries).

% Credentials match -> Login Successful
verify(User, Pass, _) :-
    user(User, Pass),
    write('Login Successful'), nl.

%  Credentials do NOT match -> Print error and decrease Tries
verify(User, Pass, Tries) :-
    \+ user(User, Pass),
    write('Login Unsuccessful'), nl,
    NextTries is Tries - 1,
    attempt(NextTries).
