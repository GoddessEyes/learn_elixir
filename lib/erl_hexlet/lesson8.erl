%%%-------------------------------------------------------------------
%%% @author goddesseyes
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Jun 2023 11:06 PM
%%%-------------------------------------------------------------------
-module(lesson8).
-author("goddesseyes").

%% API
-export([send_hello/0, receive_hello/0, test/0, test_messages/2, flush/0]).


%% spawn(Fun) -> pid()
%% spawn(Node, Fun) -> pid()
%% spawn(Module, Function, Args) -> pid()
%% spawn(Node, Module, Function, Args) -> pid()

%% G = fun(X) -> timer:sleep(10), io:format("~p~n", [X]) end.
%% [spawn(fun() -> G(X) end) || X <- lists:seq(1,10)].

send_hello() ->
  self() ! "hello again".


receive_hello() ->
  receive
    Msg -> io:format("got message:~p~n", [Msg])
  end.


test() ->
  test_messages("test1, ящик пустой", []),

  test_messages("test2, одно сообщение, матчится",
    [{msg, 1}]),

  test_messages("test3, одно сообщение, не матчится",
    [msg1]),

  test_messages("test4, 3 сообщения, все матчатся",
    [{msg, 1}, {msg, 2}, {msg, 3}]),

  test_messages("test5, 3 сообщения, все не матчатся",
    [msg1, msg2, msg3]),

  test_messages("test6, 4 сообщения, часть матчится, часть не матчится",
    [{msg, 1}, msg2, {msg, 3}, msg4]),

  test_messages("test7, 4 сообщения, часть матчится, часть не матчится",
    [msg1, {msg, 2}, msg3, {msg, 4}]),

  ok.

test_messages(TestName, Messages) ->
  io:format("~n### ~ts~ntest_messages: ~p~n", [TestName, Messages]),
  flush(),
  [self() ! Msg || Msg <- Messages],

  io:format("call receive~n"),
  Res = receive
          {msg, M} -> {msg, M}
        after 100 -> timeout
        end,
  io:format("after receive got: ~p~n", [Res]),
  [{messages, Left}] = process_info(self(), [messages]),
  io:format("left in mailbox: ~p~n", [Left]),
  ok.

flush() ->
  receive
    _ -> flush()
  after 100 -> ok
  end.
