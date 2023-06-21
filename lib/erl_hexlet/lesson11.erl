%%%-------------------------------------------------------------------
%%% @author goddesseyes
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Jun 2023 8:33 PM
%%%-------------------------------------------------------------------
-module(lesson11).
-author("goddesseyes").

%% API
-export([run/0, system_process/0, worker/0, run_and_crash/0, work_and_crash_one/1]).

run() ->
  spawn(fun system_process/0),
  ok.


system_process() ->
  io:format("~p system process started~n", [self()]),
  process_flag(trap_exit, true),
  spawn_link(fun worker/0),
  receive
    Msg -> io:format("~p system process got message ~p~n", [self(), Msg])
  after 2000 -> ok
  end,
  ok.


worker() ->
  io:format("~p worker started~n", [self()]),
  timer:sleep(500),
  exit(some_reason),
  ok.

run_and_crash() ->
  [spawn_link(?MODULE, work_and_crash_one, [Id]) || Id <- lists:seq(0, 5)],
  ok.

work_and_crash_one(Id) ->
  io:format("~p ~p started~n", [Id, self()]),
  if
    Id == 3 ->
      io:format("~p ~p exiting~n", [Id, self()]),
      exit(for_some_reason);
    true -> ok
  end,
  timer:sleep(1000),
  io:format("~p ~p stopped~n", [Id, self()]),
  ok.