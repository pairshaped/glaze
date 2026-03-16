-module(lustre@runtime@app).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/lustre/runtime/app.gleam").
-export([configure_server_component/1, configure/1]).
-export_type([app/3, config/1, option/1]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(false).

-type app(MAW, MAX, MAY) :: {app,
        gleam@option:option(gleam@erlang@process:name(lustre@runtime@server@runtime:message(MAY))),
        fun((MAW) -> {MAX, lustre@effect:effect(MAY)}),
        fun((MAX, MAY) -> {MAX, lustre@effect:effect(MAY)}),
        fun((MAX) -> lustre@vdom@vnode:element(MAY)),
        config(MAY)}.

-type config(MAZ) :: {config,
        boolean(),
        boolean(),
        boolean(),
        list({binary(), fun((binary()) -> {ok, MAZ} | {error, nil})}),
        list({binary(), gleam@dynamic@decode:decoder(MAZ)}),
        list({binary(), gleam@dynamic@decode:decoder(MAZ)}),
        boolean(),
        gleam@option:option(fun((binary()) -> MAZ)),
        gleam@option:option(MAZ),
        gleam@option:option(fun((binary()) -> MAZ)),
        gleam@option:option(MAZ),
        gleam@option:option(MAZ),
        gleam@option:option(MAZ)}.

-type option(MBA) :: {option, fun((config(MBA)) -> config(MBA))}.

-file("src/lustre/runtime/app.gleam", 75).
?DOC(false).
-spec configure_server_component(config(MBF)) -> lustre@runtime@server@runtime:config(MBF).
configure_server_component(Config) ->
    {config,
        erlang:element(2, Config),
        erlang:element(3, Config),
        maps:from_list(lists:reverse(erlang:element(5, Config))),
        maps:from_list(lists:reverse(erlang:element(6, Config))),
        maps:from_list(lists:reverse(erlang:element(7, Config))),
        erlang:element(12, Config),
        erlang:element(14, Config)}.

-file("src/lustre/runtime/app.gleam", 71).
?DOC(false).
-spec configure(list(option(MBB))) -> config(MBB).
configure(Options) ->
    gleam@list:fold(
        Options,
        {config,
            true,
            true,
            false,
            [],
            [],
            [],
            false,
            none,
            none,
            none,
            none,
            none,
            none},
        fun(Config, Option) -> (erlang:element(2, Option))(Config) end
    ).
