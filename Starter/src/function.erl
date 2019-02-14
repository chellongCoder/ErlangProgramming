%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Feb 2019 5:38 PM
%%%-------------------------------------------------------------------
-module(function).
-author("chellong").
-compile(export_all). %% replace with -export() later, for God's sake!
head([H|_]) -> H.
second([_,X|_]) -> X.
same(X,X) ->
  true;


valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
  io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n",[Date,Y,M,D]),
  io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);



%% API
%%-export([]).
