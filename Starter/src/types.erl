%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Feb 2019 6:09 PM
%%%-------------------------------------------------------------------
-module(types).
-author("chellong").
%%atom_to_binary/2, atom_to_list/1, binary_to_atom/2, binary_to_existing_atom/2, binary_to_list/1,
%%bitstring_to_list/1, binary_to_term/1, float_to_list/1, fun_to_list/1, integer_to_list/1, integer_to_list/2,
%%iolist_to_binary/1, iolist_to_atom/1, list_to_atom/1, list_to_binary/1, list_to_bitstring/1, list_to_existing_atom/1,
%%list_to_float/1, list_to_integer/2, list_to_pid/1, list_to_tuple/1, pid_to_list/1, port_to_list/1, ref_to_list/1,
%%term_to_binary/1, term_to_binary/2 and tuple_to_list/1.
%% convert between types erlang

%% API
-export([start/0]).

start() ->
  num = erlang:list_to_integer("23"),
  io:format("~w",num),
  erlang:list_to_integer("54"),
  erlang:integer_to_list(54)
  .
