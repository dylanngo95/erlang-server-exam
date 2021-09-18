%%%-------------------------------------------------------------------
%% @doc server_exam top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(server_exam_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
init([]) ->
    RestartStrategy = {one_for_one, 0, 1},
    Server = {tr_server,
        {tr_server, start_link, []},
        permanent,
        2000,
        worker,
        [tr_server]
    },
    Children = [Server],
    {ok, {RestartStrategy, Children}}.

%% internal functions
