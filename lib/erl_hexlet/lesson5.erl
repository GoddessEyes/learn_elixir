%%%-------------------------------------------------------------------
%%% @author goddesseyes
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Jun 2023 12:23 PM
%%%-------------------------------------------------------------------
-module(lesson5).
-author("goddesseyes").

%% API
-export([proplist_api/0, dict_api/0, gb_tree_api/0]).


proplist_api() ->
  PropList1 = [{key1, "Val1"}, {key2, 2}, key3],
  PropList2 = [{key4, "Hello"} | PropList1],
  PropList3 = [{key1, "New val"} | PropList2],
  proplists:get_value(key1, PropList3),
  proplists:get_all_values(key1, PropList3),
  proplists:lookup(key1, PropList3),
  proplists:lookup_all(key777, PropList3),
  proplists:delete(key1, PropList3).


dict_api() ->
  Dict = dict:new(),
  Dict2 = dict:store(key1, "val 1", Dict),
  Dict3 = dict:store(key2, "val 2", Dict2),
  dict:to_list(Dict2),
  dict:from_list([{key1, "val 1"}, {key2, "val 2"}]),
  Dict4 = dict:store(key1, "new val", Dict3),
  dict:fetch(key1, Dict4),
  dict:find(key1, Dict4).


%% ordict

gb_tree_api() ->
  T = gb_trees:empty(),
  T2 = gb_trees:insert(key1, "value 1", T),
  T3 = gb_trees:insert(key2, "value 2", T2),
  T4 = gb_trees:update(key1, "new value", T3),
  T5 = gb_trees:enter(key777, "new value", T4),
  T6 = gb_trees:enter(key2, "new value", T5),
  gb_trees:get(key1, T6),
  gb_trees:lookup(key1, T6),
  gb_trees:delete(key1, T6).
