%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Feb 2019 3:11 PM
%%%-------------------------------------------------------------------
-module(higher_order_fun).
-author("chellong").

%% API
-compile(export_all).

one() -> 1.
two() -> 2.

add(X,Y) -> X() + Y().
%%1> c(hhfuns).
%%{ok, hhfuns}
%%2> hhfuns:add(one,two).
%%** exception error: bad function one
%%in function  hhfuns:add/2
%%3> hhfuns:add(1,2).
%%** exception error: bad function 1
%%in function  hhfuns:add/2
%%4> hhfuns:add(fun hhfuns:one/0, fun hhfuns:two/0).

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

%%1> c(hhfuns).
%%{ok, hhfuns}
%%2> L = [1,2,3,4,5].
%%[1,2,3,4,5]
%%3> hhfuns:increment(L).
%%[2,3,4,5,6]
%%4> hhfuns:decrement(L).
%%[0,1,2,3,4]
%%5> hhfuns:map(fun hhfuns:incr/1, L).
%%[2,3,4,5,6]
%%6> hhfuns:map(fun hhfuns:decr/1, L).
%%[0,1,2,3,4]

base(A) ->
  B = A + 1,
  F = fun() -> A * B end,
  F().

a() ->
  Secret = "pony",
  fun() -> Secret end.

b(F) ->
  "a/0's password is "++F().
%%14> c(hhfuns).
%%{ok, hhfuns}
%%15> hhfuns:b(hhfuns:a()).
%%"a/0's password is pony"

%%16> math:pow(5,2).
%%25.0
%%17> Base = 2.
%%2
%%18> PowerOfTwo = fun(X) -> math:pow(Base,X) end.
%%#Fun<erl_eval.6.13229925>
%%17> hhfuns:map(PowerOfTwo, [1,2,3,4]).
%%[2.0,4.0,8.0,16.0]

base() ->
  A = 1,
  (fun() -> A = 2 end)().

%%18> f(PrepareAlarm), f(AlarmReady).
%%ok
%%19> PrepareAlarm = fun(Room) ->
%%19>    io:format("Alarm set in ~s.~n",[Room]),
%%19>     fun Loop() ->
%%19>        io:format("Alarm tripped in ~s! Call Batman!~n",[Room]),
%%19>        timer:sleep(500),
%%19>         Loop()
%%19>     end
%%19> end.
%%#Fun<erl_eval.6.71889879>
%%20> AlarmReady = PrepareAlarm("bathroom").
%%Alarm set in bathroom.
%%#Fun<erl_eval.44.71889879>
%%21> AlarmReady().
%%Alarm tripped in bathroom! Call Batman!
%%Alarm tripped in bathroom! Call Batman!
%%Alarm tripped in bathroom! Call Batman!

%% only keep even numbers
even(L) -> lists:reverse(even(L,[])).

even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 ->
  even(T, [H|Acc]);
even([_|T], Acc) ->
  even(T, Acc).

%% only keep men older than 60
old_men(L) -> lists:reverse(old_men(L,[])).

old_men([], Acc) -> Acc;
old_men([Person = {male, Age}|People], Acc) when Age > 60 ->
  old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
  old_men(People, Acc).

filter(Pred, L) -> lists:reverse(filter(Pred, L,[])).
filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true  -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.

%%1> c(hhfuns).
%%{ok, hhfuns}
%%2> Numbers = lists:seq(1,10).
%%[1,2,3,4,5,6,7,8,9,10]
%%3> hhfuns:filter(fun(X) -> X rem 2 == 0 end, Numbers).
%%[2,4,6,8,10]
%%4> People = [{male,45},{female,67},{male,66},{female,12},{unknown,174},{male,74}].
%%[{male,45},{female,67},{male,66},{female,12},{unknown,174},{male,74}]
%%5> hhfuns:filter(fun({Gender,Age}) -> Gender == male andalso Age > 60 end, People).
%%[{male,66},{male,74}]

%% find the maximum of a list
max([H|T]) -> max2(T, H).

max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).

%% find the minimum of a list
min([H|T]) -> min2(T,H).

min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> min2(T,H);
min2([_|T], Min) -> min2(T, Min).

%% sum of all the elements of a list
sum(L) -> sum(L,0).

sum([], Sum) -> Sum;
sum([H|T], Sum) -> sum(T, H+Sum).

fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H,Start), T).
%%6> c(hhfuns).
%%{ok, hhfuns}
%%7> [H|T] = [1,7,3,5,9,0,2,3].
%%[1,7,3,5,9,0,2,3]
%%8> hhfuns:fold(fun(A,B) when A > B -> A; (_,B) -> B end, H, T).
%%9
%%9> hhfuns:fold(fun(A,B) when A < B -> A; (_,B) -> B end, H, T).
%%0
%%10> hhfuns:fold(fun(A,B) -> A + B end, 0, lists:seq(1,6)).
%%21


