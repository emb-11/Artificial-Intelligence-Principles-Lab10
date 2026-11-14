% User dataset
user(admin, pass123).
user(ahmed, secret).

% Start with 3 attempts (1 initial + 2 retries)
login :-
    attempt(3).

% 1. Base case: 0 attempts left
attempt(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

% 2. If attempts > 0, read user/pass and verify
attempt(Tries) :-
    Tries > 0,
    write('Enter username: '), read(User),
    write('Enter password: '), read(Pass),
    verify(User, Pass, Tries).

% 3. Credentials match -> Login Successful
verify(User, Pass, _) :-
    user(User, Pass),
    write('Login Successful'), nl.

% 4. Credentials do NOT match -> Print error and decrease Tries
verify(User, Pass, Tries) :-
    \+ user(User, Pass),
    write('Login Unsuccessful'), nl,
    NextTries is Tries - 1,
    attempt(NextTries).