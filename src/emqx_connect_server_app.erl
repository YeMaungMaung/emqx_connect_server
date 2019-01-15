-module(emqx_connect_server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
  {ok, Sup} = emqx_connect_server_sup:start_link(),
  emqx_connect_server:load(application:get_all_env()),
  {ok, Sup}.

stop(_State) ->
  emqx_connect_server:unload().
