
%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Jan 2019 5:23 PM
%%%-------------------------------------------------------------------
-module(hello).
-author("chellong").

-include_lib("eunit/include/eunit.hrl").
-export([hello_world/1]).
-export([double/1]).
-export([start/0]).


hello_world(Name) -> io:fwrite("hello, ~s\n", [Name]).

double(X) ->
  2 * X.


start() ->
  io:fwrite("~w\n",[1+1]),
  io:fwrite("~w\n",[2+1]),
  Bin1 = <<10,20>>,
  X = binary_to_list(Bin1),
  io:fwrite("~w\n",[X]),
  P = {john,24,{june,25}},
  io:fwrite("~w\n",[tuple_size(P)]),
  M1 = #{name=>john,age=>25},
  io:fwrite("~w\n",[map_size(M1)]),
  io:fwrite("~w\n",[M1]),
  L = [10,20,30] ,
  io:fwrite("~w\n",[L]),
  Y = 40,
  Z = 50,
  Result = Y + Z,
  io:fwrite("~w\n",[Result]),
  F = 30.00,
  io:fwrite("~e",[F]),
  ok.



simple_test() ->
  ?assert(true).
