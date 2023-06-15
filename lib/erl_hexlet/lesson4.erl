%%%-------------------------------------------------------------------
%%% @author goddesseyes
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Jun 2023 11:07 PM
%%%-------------------------------------------------------------------
-module(lesson4).
-author("goddesseyes").

%% API
-export([area/1, check_user/1, check_user_2/1]).

area({rect, Width, Height}) -> Width * Height;
area({square, Size}) -> Size * Size;
area({circle, Radius}) -> math:pi() * Radius * Radius.

check_user({user, _, Gender, Age}) when Gender =:= female, Age < 14 -> girl;
check_user({user, _, Gender, Age}) when Gender =:= female, Age >= 14, Age < 21 -> teenage_girl;
check_user({user, _, Gender, Age}) when Gender =:= female, Age >= 21 -> woman;
check_user({user, _, Gender, Age}) when Gender =:= male, Age < 14 -> boy;
check_user({user, _, Gender, Age}) when Gender =:= male, Age >= 14, Age < 21 -> teenage_boy;
check_user({user, _, Gender, Age}) when Gender =:= male, Age >= 21 -> man.

check_user_2({user, _, Gender, Age})
  when Gender =:= female, Age < 14;
  Gender =:= male, Age < 14
  -> child;
check_user_2({user, _, Gender, Age})
  when Gender =:= female, Age >= 21;
  Gender =:= male, Age >= 21
  -> adult.
