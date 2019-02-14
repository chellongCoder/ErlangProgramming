%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Feb 2019 5:03 PM
%%%-------------------------------------------------------------------
-module(fifo).
-author("chellong").

%% API
-export([new/0, push/2, pop/1, empty/1]).
-spec new() -> {'fifo',[],[]}.
-spec push({'fifo',_,_},_) -> {'fifo',nonempty_maybe_improper_list(),_}.
-spec pop({'fifo',_,maybe_improper_list()}) -> {_,{'fifo',_,_}}.
-spec empty({'fifo',_,_}) -> bool().

%% implemented as two stacks; push on the first, pop on the second.
%% when the second is empty, reverse the first and make it the second.
new() -> {fifo, [], []}.

push({fifo, In, Out}, X) -> {fifo, [X|In], Out}.

pop({fifo, [], []}) -> erlang:error('empty fifo');
pop({fifo, In, []}) -> pop({fifo, [], lists:reverse(In)});
pop({fifo, In, [H|T]}) -> {H, {fifo, In, T}}.

empty({fifo, [], []}) -> true;
empty({fifo, _, _}) -> false.