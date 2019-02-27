%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Feb 2019 3:58 PM
%%%-------------------------------------------------------------------
-module(exceptions_errors).
-author("chellong").

%% API
-compile(export_all). %% replace with -export() later, for God's sake!
errors(F) ->
  try F() of
    _ -> ok
  catch
    error:Error -> {error, caught, Error}
  end.

exits(F) ->
  try F() of
    _ -> ok
  catch
    exit:Exit -> {exit, caught, Exit}
  end.
%%4> c(exceptions).
%%{ok,exceptions}
%%5> exceptions:errors(fun() -> erlang:error("Die!") end).
%%{error,caught,"Die!"}
%%6> exceptions:exits(fun() -> exit(goodbye) end).
%%{exit,caught,goodbye}

sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).

black_knight(Attack) when is_function(Attack, 0) ->
  try Attack() of
    _ -> "None shall pass."
  catch
    throw:slice -> "It is but a scratch.";
    error:cut_arm -> "I've had worse.";
    exit:cut_leg -> "Come on you pansy!";
    _:_ -> "Just a flesh wound."
  end.
talk() -> "blah blah".

%%7> c(exceptions).
%%{ok,exceptions}
%%8> exceptions:talk().
%%"blah blah"
%%9> exceptions:black_knight(fun exceptions:talk/0).
%%"None shall pass."
%%10> exceptions:black_knight(fun() -> exceptions:sword(1) end).
%%"It is but a scratch."
%%11> exceptions:black_knight(fun() -> exceptions:sword(2) end).
%%"I've had worse."
%%12> exceptions:black_knight(fun() -> exceptions:sword(3) end).
%%"Come on you pansy!"
%%13> exceptions:black_knight(fun() -> exceptions:sword(4) end).
%%"Just a flesh wound."
%%14> exceptions:black_knight(fun() -> exceptions:sword(5) end).
%%"Just a flesh wound."



whoa() ->
try
talk(),
_Knight = "None shall Pass!",
_Doubles = [N*2 || N <- lists:seq(1,100)],
throw(up),
_WillReturnThis = tequila
of
tequila -> "hey this worked!"
catch
Exception:Reason -> {caught, Exception, Reason}
end.


im_impressed() ->
  try
    talk(),
    _Knight = "None shall Pass!",
    _Doubles = [N*2 || N <- lists:seq(1,100)],
    throw(up),
    _WillReturnThis = tequila
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.

catcher(X,Y) ->
  case catch X/Y of
    {'EXIT', {badarith,_}} -> "uh oh";
    N -> N
  end.

one_or_two(1) -> return;
one_or_two(2) -> throw(return).