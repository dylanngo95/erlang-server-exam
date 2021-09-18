%%%-------------------------------------------------------------------
%% @doc server_exam public API
%% @end
%%%-------------------------------------------------------------------

-module(server_exam_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    server_exam_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
