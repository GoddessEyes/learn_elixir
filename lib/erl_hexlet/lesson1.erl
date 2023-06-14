%%%-------------------------------------------------------------------
%%% @author goddesseyes
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Jun 2023 4:13 PM
%%%-------------------------------------------------------------------
-module(lesson1).
-author("goddesseyes").

%% API
-export([]).

-record(user, {id :: integer(), name :: string(), age :: integer(), country :: string(), city :: string()}).
%% User = #user{id=1,name="test",age=12,country="ru",city="spb"}
%% User = User2 = User#user{age=13}.


