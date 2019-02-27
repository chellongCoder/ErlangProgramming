%%%-------------------------------------------------------------------
%%% @author chellong
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Feb 2019 11:14 AM
%%%-------------------------------------------------------------------
-module(records).
-author("chellong").
-include("records.hrl").

%% API
-compile(export_all).

-record(robot, {name,
  type=industrial,
  hobbies,
  details=[]}).

first_robot() ->
  #robot{name="Mechatron",
    type=handmade,
    details=["Moved by a small man inside"]}.

%%Writing records alone won't do much. We need a way to extract values from them. There are basically two ways to do this. The first one is with a special 'dot syntax'. Assuming you have the record definition for robots loaded:
%%5> Crusher = #robot{name="Crusher", hobbies=["Crushing people","petting cats"]}.
%%#robot{name = "Crusher",type = industrial,
%%hobbies = ["Crushing people","petting cats"],
%%details = []}
%%6> Crusher#robot.hobbies.
%%["Crushing people","petting cats"]

%%7> NestedBot = #robot{details=#robot{name="erNest"}}.
%%#robot{name = undefined,type = industrial,
%%hobbies = undefined,
%%details = #robot{name = "erNest",type = industrial,
%%hobbies = undefined,details = []}}
%%8> (NestedBot#robot.details)#robot.name.
%%"erNest"

-record(user, {id, name, group, age}).

%% use pattern matching to filter
admin_panel(#user{name=Name, group=admin}) ->
  Name ++ " is allowed!";
admin_panel(#user{name=Name}) ->
  Name ++ " is not allowed".

%% can extend user without problem
adult_section(U = #user{}) when U#user.age >= 18 ->
%% Show stuff that can't be written in such a text
  allowed;
adult_section(_) ->
%% redirect to sesame street site
  forbidden.

%%10> c(records).
%%{ok,records}
%%11> rr(records).
%%[robot,user]
%%12> records:admin_panel(#user{id=1, name="ferd", group=admin, age=96}).
%%"ferd is allowed!"
%%13> records:admin_panel(#user{id=2, name="you", group=users, age=66}).
%%"you is not allowed"
%%14> records:adult_section(#user{id=21, name="Bill", group=users, age=72}).
%%allowed
%%15> records:adult_section(#user{id=22, name="Noah", group=users, age=13}).
%%forbidden


included() -> #included{some_field="Some value"}.

