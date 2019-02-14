%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Jan 2019 6:04 PM
%%%-------------------------------------------------------------------
-module(message).
-author("chellong").

-compile(export_all).
-include_lib("eunit/include/eunit.hrl").

%% Only this function is exported
format_temps([])->                        % No output for an empty list
  ok;

format_temps([City | Rest]) ->
  print_temp(convert_to_celsius(City)),
  format_temps(Rest).

convert_to_celsius({Name, {c, Temp}}) ->  % No conversion needed
  {Name, {c, Temp}};
convert_to_celsius({Name, {f, Temp}}) ->  % Do the conversion
  {Name, {c, (Temp - 32) * 5 / 9}}.

print_temp({Name, {c, Temp}}) ->
  io:format("~-15w ~w c~n", [Name, Temp]).

simple_test() ->
  ?assert(true).