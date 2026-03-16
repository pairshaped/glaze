-module(app).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/app.gleam").
-export([page/0, middleware/2, handle_request/1, main/0]).

-file("src/app.gleam", 17).
-spec login_form() -> lustre@vdom@vnode:element(any()).
login_form() ->
    Submit_toast_js = glaze@basecoat@toast:serialize_dispatch(
        {config, info, <<"Have fun!"/utf8>>, <<""/utf8>>, none, none}
    ),
    glaze@basecoat@form:form(
        [lustre@attribute:id(<<"login-form"/utf8>>),
            lustre@attribute:class(<<"space-y-2"/utf8>>)],
        [glaze@basecoat@input:email(
                [lustre@attribute:placeholder(<<"Email"/utf8>>)]
            ),
            glaze@basecoat@input:password(
                [lustre@attribute:placeholder(<<"Password"/utf8>>)]
            ),
            glaze@basecoat@button:button(
                [lustre@attribute:type_(<<"submit"/utf8>>)],
                [lustre@element@html:text(<<"submit"/utf8>>)]
            ),
            lustre@element@html:script(
                [],
                <<<<"
      let form = document.querySelector('form#login-form');
      if (form !== null) {
         form.addEventListener('submit', (event) => {
           event.preventDefault();\n"/utf8,
                        Submit_toast_js/binary>>/binary,
                    "\n
         });
      }
    "/utf8>>
            )]
    ).

-file("src/app.gleam", 44).
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
                    lustre@element@html:script(
                        [lustre@attribute:src(
                                <<"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"/utf8>>
                            )],
                        <<""/utf8>>
                    ),
                    glaze@basecoat:register(<<"0.3.11"/utf8>>),
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
                                        [login_form()]
                                    ),
                                    glaze@basecoat@card:footer([], [])]
                            )]
                    ),
                    glaze@basecoat@toast:container([])]
            )]
    ).

-file("src/app.gleam", 99).
-spec middleware(
    gleam@http@request:request(wisp@internal:connection()),
    fun((gleam@http@request:request(wisp@internal:connection())) -> gleam@http@response:response(wisp:body()))
) -> gleam@http@response:response(wisp:body()).
middleware(Req, Handle_request) ->
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
                                fun(Req@3) -> Handle_request(Req@3) end
                            )
                        end
                    )
                end
            )
        end
    ).

-file("src/app.gleam", 77).
-spec handle_request(gleam@http@request:request(wisp@internal:connection())) -> gleam@http@response:response(wisp:body()).
handle_request(Req) ->
    middleware(Req, fun(_) -> _pipe = page(),
            _pipe@1 = lustre@element:to_document_string(_pipe),
            wisp:html_response(_pipe@1, 200) end).

-file("src/app.gleam", 85).
-spec main() -> nil.
main() ->
    wisp:configure_logger(),
    Secret_key_base = wisp:random_string(64),
    case begin
        _pipe = wisp@wisp_mist:handler(fun handle_request/1, Secret_key_base),
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
                        line => 90,
                        value => _assert_fail,
                        start => 2236,
                        'end' => 2366,
                        pattern_start => 2247,
                        pattern_end => 2252})
    end,
    gleam_erlang_ffi:sleep_forever().
