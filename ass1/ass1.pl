%Student: YAOYE LU
%ID: z5188093
%Assignment1 of COMP9331

%q1: return the sum of squres of even number in the list, if no any, return 0.
sumsq_even([],0).
sumsq_even([Head|Tail], Sum):-
    sumsq_even(Tail,SumOfTail),
    0 is Head mod 2,
    Sum is Head*Head + SumOfTail.
sumsq_even([Head|Tail], Sum):-
    sumsq_even(Tail,SumOfTail),
    1 is Head mod 2,
    Sum is SumOfTail.

%q2: 
%return true if Person1 is a father of Person2.
isfather(Person1,Person2):-
    male(Person1),
    parent(Person1,Person2).

%return the first male ancestor of a Person
maleancestor(A,B):-
    isfather(A,B).
maleancestor(Ancestor, Person):-
    isfather(Temp, Person),
    maleancestor(Ancestor,Temp).

%return ture if two people have the same family name which is promised by that they have the same male ancestor.
same_name(Person1,Person2):-
    maleancestor(Ancestor1,Person1),
    maleancestor(Ancestor2,Person2),
    Ancestor1 = Ancestor2.
same_name(Person1,Person2):-
    maleancestor(Ancestor1,Person1),
    Ancestor1 = Person2.
same_name(Person1,Person2):-
    maleancestor(Ancestor2,Person2),
    Ancestor2 = Person1.


%q3:
%return new list by recursively adding each item one by one and its sqrt as a pair
sqrt_list([],[]).
sqrt_list([Head|Tail],[[Head,S]|ResultofTail]):-
    S is sqrt(Head),
    sqrt_list(Tail,ResultofTail).

%q4:
%recursively pick up the continous positive integers until encounter a negative integer.
positive([],[],[]).
positive([Head | Tail], [], [Head | Tail]):-
   Head < 0.
positive([Head | Tail], [Head | L], Rest):-
   Head >= 0,
   positive(Tail, L, Rest).

%recursively pick up the continous negative integers until encounter a positive integer.
negative([],[],[]).
negative([Head | Tail], [], [Head | Tail]) :- 
   Head >= 0.
negative([Head | Tail], [Head | L], Rest) :-
   Head < 0,
   negative(Tail, L, Rest).

%divide a list into different parts of sublists.
sign_runs([],[]).
sign_runs([Head | Tail], [FirstPart, SecondPart | EndPart]):-
   positive([Head | Tail], FirstPart, Last),
   negative(Last, SecondPart, Last1),
   sign_runs(Last1, EndPart).

%q5:
%return true if Value1 is no less than Value.
compare(empty, _ ).
compare(tree(_,Value1,_),Value):-
    Value1 >= Value.
%returns true if Tree satisfies the heap property, and false otherwise.
is_heap(empty).
is_heap(tree(Left,Value,Right)):-
    compare(Left,Value),
    compare(Right,Value),
    is_heap(Left),
    is_heap(Right).
