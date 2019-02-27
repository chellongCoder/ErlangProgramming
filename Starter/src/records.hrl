%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Feb 2019 11:33 AM
%%%-------------------------------------------------------------------
-author("chellong").
%% this is a .hrl (header) file.
-record(included, {some_field,
  some_default = "yeah!",
  unimaginative_name}).