-module(app).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/app.gleam").
-export([page/0, static_directory/0, middleware/3, handle_request/2, main/0]).
-export_type([context/0]).

-type context() :: {context, binary()}.

-file("src/app.gleam", 17).
-spec page() -> lustre@vdom@vnode:element(any()).
page() ->
    lustre@element@html:html(
        [lustre@attribute:attribute(<<"lang"/utf8>>, <<"en"/utf8>>)],
        [lustre@element@html:head(
                [],
                [lustre@element@html:title([], <<"Basecoat x Gleam"/utf8>>),
                    lustre@element@html:meta(
                        [lustre@attribute:name(<<"viewport"/utf8>>),
                            lustre@attribute:content(
                                <<"width=device-width, initial-scale=1"/utf8>>
                            )]
                    ),
                    lustre@element@html:link(
                        [lustre@attribute:rel(<<"stylesheet"/utf8>>),
                            lustre@attribute:href(<<"/static/app.css"/utf8>>)]
                    ),
                    glaze@basecoat:cdn_script(<<"0.3.11"/utf8>>),
                    glaze@basecoat@theme:style_tag(
                        glaze@basecoat@theme:default_theme()
                    )]
            ),
            lustre@element@html:body(
                [],
                [lustre@element@html:'div'(
                        [lustre@attribute:class(<<"p-10"/utf8>>)],
                        [glaze@basecoat@card:card(
                                [],
                                [glaze@basecoat@card:header(
                                        [],
                                        [glaze@basecoat@card:title(
                                                [],
                                                [lustre@element@html:text(
                                                        <<"Welcome"/utf8>>
                                                    )]
                                            ),
                                            glaze@basecoat@card:description(
                                                [],
                                                [lustre@element@html:text(
                                                        <<"Hello!"/utf8>>
                                                    )]
                                            )]
                                    ),
                                    glaze@basecoat@card:content(
                                        [],
                                        [glaze@basecoat@button:button(
                                                [],
                                                [lustre@element@html:text(
                                                        <<"Get Started"/utf8>>
                                                    )]
                                            )]
                                    )]
                            )]
                    )]
            )]
    ).

-file("src/app.gleam", 71).
-spec static_directory() -> binary().
static_directory() ->
    Priv_directory@1 = case fun gleam_erlang_ffi:priv_directory/1(
        <<"app"/utf8>>
    ) of
        {ok, Priv_directory} -> Priv_directory;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        file => <<?FILEPATH/utf8>>,
                        module => <<"app"/utf8>>,
                        function => <<"static_directory"/utf8>>,
                        line => 72,
                        value => _assert_fail,
                        start => 1707,
                        'end' => 1765,
                        pattern_start => 1718,
                        pattern_end => 1736})
    end,
    <<Priv_directory@1/binary, "/static"/utf8>>.

-file("src/app.gleam", 76).
-spec middleware(
    gleam@http@request:request(wisp@internal:connection()),
    context(),
    fun((gleam@http@request:request(wisp@internal:connection())) -> gleam@http@response:response(wisp:body()))
) -> gleam@http@response:response(wisp:body()).
middleware(Req, Ctx, Handle_request) ->
    Req@1 = wisp:method_override(Req),
    wisp:log_request(
        Req@1,
        fun() ->
            wisp:rescue_crashes(
                fun() ->
                    wisp:handle_head(
                        Req@1,
                        fun(Req@2) ->
                            wisp:csrf_known_header_protection(
                                Req@2,
                                fun(Req@3) ->
                                    wisp:serve_static(
                                        Req@3,
                                        <<"/static"/utf8>>,
                                        erlang:element(2, Ctx),
                                        fun() -> Handle_request(Req@3) end
                                    )
                                end
                            )
                        end
                    )
                end
            )
        end
    ).

-file("src/app.gleam", 47).
-spec handle_request(
    gleam@http@request:request(wisp@internal:connection()),
    context()
) -> gleam@http@response:response(wisp:body()).
handle_request(Req, Ctx) ->
    middleware(Req, Ctx, fun(_) -> _pipe = page(),
            _pipe@1 = lustre@element:to_document_string(_pipe),
            wisp:html_response(_pipe@1, 200) end).

-file("src/app.gleam", 55).
-spec main() -> nil.
main() ->
    wisp:configure_logger(),
    Secret_key_base = wisp:random_string(64),
    Ctx = {context, static_directory()},
    case begin
        _pipe = wisp@wisp_mist:handler(
            fun(_capture) -> handle_request(_capture, Ctx) end,
            Secret_key_base
        ),
        _pipe@1 = mist:new(_pipe),
        _pipe@2 = mist:port(_pipe@1, 8000),
        mist:start(_pipe@2)
    end of
        {ok, _} -> nil;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        file => <<?FILEPATH/utf8>>,
                        module => <<"app"/utf8>>,
                        function => <<"main"/utf8>>,
                        line => 62,
                        value => _assert_fail,
                        start => 1498,
                        'end' => 1636,
                        pattern_start => 1509,
                        pattern_end => 1514})
    end,
    gleam_erlang_ffi:sleep_forever().
