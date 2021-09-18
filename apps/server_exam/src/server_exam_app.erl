%%%-------------------------------------------------------------------
%% @doc server_exam public API
%% @end
%%%-------------------------------------------------------------------

-module(server_exam_app).

-behaviour(application).

-export([start/2, stop/1]).

%% Callbacks function
start(_StartType, _StartArgs) ->
    case server_exam_sup:start_link() of
        {ok, Pid} ->
            {ok, Pid};
        Other ->
            {error, Other}
    end.

stop(_State) ->
    ok.

%% internal functions
