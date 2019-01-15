PROJECT = emqx_connect_server
PROJECT_DESCRIPTION = EMQ X Plugin To Connect With Nodejs Server
PROJECT_VERSION = 3.0

BUILD_DEPS = emqx cuttlefish
dep_emqx = git-emqx https://github.com/emqx/emqx master
dep_cuttlefish = git-emqx https://github.com/emqx/cuttlefish v2.2.0

ERLC_OPTS += +debug_info

NO_AUTOPATCH = cuttlefish

COVER = true

$(shell [ -f erlang.mk ] || curl -s -o erlang.mk https://raw.githubusercontent.com/emqx/erlmk/master/erlang.mk)

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_connect_server.conf -i priv/emqx_connect_server.schema -d data
