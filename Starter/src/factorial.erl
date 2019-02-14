%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Feb 2019 5:31 PM
%%%-------------------------------------------------------------------
-module(factorial).
-author("chellong").

%% API
-export([fac/1]).

fac(N) when N == 0 -> 1;
fac(N) when N > 0  -> N*fac(N-1).

%%OR
%%fac(0) -> 1;
%%fac(N) when N > 0 -> N*fac(N-1).