member1(X,[X|T]).
member1(X,[H|T]) :- member1(X,T).

%% rewrite version:
%% This version is exactly the same, both declaratively and procedurally. 
%% But it’s just that little bit clearer: when you read it, you are forced 
%%  to concentrate on what is essential.
member2(X,[X|_]).
member2(X,[_|T]) :- member2(X,T).

% tests:
%  member2(1, [1,2,3]).
%  member2(b, [a,b]).
%  member2(X, [a,b,c]).
