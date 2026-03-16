-module(glaze@basecoat@toast).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/toast.gleam").
-export([config_to_json/1, container/1, container_aligned/2, toast/2, success/0, info/0, warning/0, error/0, duration/1, title/2, description/2, content/2, footer/2, action_button/2, cancel_button/2, dispatch/1, serialize_dispatch/1]).
-export_type([alignment/0, action/0, cancel/0, category/0, config/0]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/toast/>\n"
    "\n"
    " Programmatic toast notifications.\n"
    "\n"
    " ## Anatomy\n"
    "\n"
    " - Render a container once with [`toaster`](#toaster)\n"
    " - Trigger notifications either by rendering [`toast`](#toast) markup, or by\n"
    "   calling [`show`](#show) to build a JavaScript snippet\n"
    "\n"
    " ## Recipes\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/toast\n"
    " import lustre/element/html\n"
    "\n"
    " fn success_toast_markup() {\n"
    "   toast.toast([toast.success()], [\n"
    "     toast.title([], [html.text(\"Success\")]),\n"
    "     toast.description([], [html.text(\"Your changes have been saved.\")]),\n"
    "   ])\n"
    " }\n"
    " ```\n"
    "\n"
    " ```gleam\n"
    " fn show_toast_script() {\n"
    "   toast.show(toast.Config(toast.Success, \"Success\", \"Saved!\", None, None))\n"
    " }\n"
    " ```\n"
    "\n"
    " ## References\n"
    "\n"
    " - MDN ARIA `status` role: <https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role>\n"
    " - MDN `CustomEvent`: <https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent>\n"
    "\n"
).

-type alignment() :: align_start | align_center | align_end.

-type action() :: {action, binary(), gleam@option:option(binary())}.

-type cancel() :: {cancel,
        gleam@option:option(binary()),
        gleam@option:option(binary())}.

-type category() :: success | info | warning | error.

-type config() :: {config,
        category(),
        binary(),
        binary(),
        gleam@option:option(action()),
        gleam@option:option(cancel())}.

-file("src/glaze/basecoat/toast.gleam", 51).
-spec alignment_to_string(alignment()) -> binary().
alignment_to_string(Align) ->
    case Align of
        align_start ->
            <<"start"/utf8>>;

        align_center ->
            <<"center"/utf8>>;

        align_end ->
            <<"end"/utf8>>
    end.

-file("src/glaze/basecoat/toast.gleam", 63).
-spec action_to_json(action()) -> gleam@json:json().
action_to_json(Action) ->
    {action, Label, Onclick} = Action,
    gleam@json:object(
        [{<<"label"/utf8>>, gleam@json:string(Label)},
            {<<"onclick"/utf8>>, case Onclick of
                    none ->
                        gleam@json:null();

                    {some, Value} ->
                        gleam@json:string(Value)
                end}]
    ).

-file("src/glaze/basecoat/toast.gleam", 78).
-spec cancel_to_json(cancel()) -> gleam@json:json().
cancel_to_json(Cancel) ->
    {cancel, Label, Onclick} = Cancel,
    gleam@json:object([{<<"label"/utf8>>, case Label of
                    none ->
                        gleam@json:null();

                    {some, Value} ->
                        gleam@json:string(Value)
                end}, {<<"onclick"/utf8>>, case Onclick of
                    none ->
                        gleam@json:null();

                    {some, Value@1} ->
                        gleam@json:string(Value@1)
                end}]).

-file("src/glaze/basecoat/toast.gleam", 99).
-spec category_to_json(category()) -> gleam@json:json().
category_to_json(Category) ->
    case Category of
        success ->
            gleam@json:string(<<"success"/utf8>>);

        info ->
            gleam@json:string(<<"info"/utf8>>);

        warning ->
            gleam@json:string(<<"warning"/utf8>>);

        error ->
            gleam@json:string(<<"error"/utf8>>)
    end.

-file("src/glaze/basecoat/toast.gleam", 118).
-spec config_to_json(config()) -> gleam@json:json().
config_to_json(Config) ->
    {config, Category, Title, Description, Action, Cancel} = Config,
    gleam@json:object(
        [{<<"category"/utf8>>, category_to_json(Category)},
            {<<"title"/utf8>>, gleam@json:string(Title)},
            {<<"description"/utf8>>, gleam@json:string(Description)},
            {<<"action"/utf8>>, case Action of
                    none ->
                        gleam@json:null();

                    {some, Value} ->
                        action_to_json(Value)
                end},
            {<<"cancel"/utf8>>, case Cancel of
                    none ->
                        gleam@json:null();

                    {some, Value@1} ->
                        cancel_to_json(Value@1)
                end}]
    ).

-file("src/glaze/basecoat/toast.gleam", 150).
?DOC(
    " Add the toaster container required for toast notifications.\n"
    "\n"
    " Place this at the end of your body element.\n"
    "\n"
    " ### Example\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/toast\n"
    "\n"
    " html.body([], [\n"
    "   // Your content...\n"
    "   toast.container(),\n"
    " ])\n"
    " ```\n"
).
-spec container(list(lustre@vdom@vattr:attribute(BXK))) -> lustre@vdom@vnode:element(BXK).
container(Attrs) ->
    lustre@element@html:'div'(
        [lustre@attribute:id(<<"toaster"/utf8>>),
            lustre@attribute:class(<<"toaster"/utf8>>) |
            Attrs],
        []
    ).

-file("src/glaze/basecoat/toast.gleam", 154).
-spec container_aligned(alignment(), list(lustre@vdom@vattr:attribute(BXO))) -> lustre@vdom@vnode:element(BXO).
container_aligned(Align, Attrs) ->
    lustre@element@html:'div'(
        [lustre@attribute:id(<<"toaster"/utf8>>),
            lustre@attribute:class(<<"toaster"/utf8>>),
            lustre@attribute:data(<<"align"/utf8>>, alignment_to_string(Align)) |
            Attrs],
        []
    ).

-file("src/glaze/basecoat/toast.gleam", 171).
?DOC(" An element to create a custom toast\n").
-spec toast(
    list(lustre@vdom@vattr:attribute(BXS)),
    list(lustre@vdom@vnode:element(BXS))
) -> lustre@vdom@vnode:element(BXS).
toast(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(<<"toast"/utf8>>),
            lustre@attribute:role(<<"status"/utf8>>),
            lustre@attribute:aria_atomic(true),
            lustre@attribute:aria_hidden(false) |
            Attrs],
        [lustre@element@html:'div'(
                [lustre@attribute:class(<<"toast-content"/utf8>>)],
                Children
            )]
    ).

-file("src/glaze/basecoat/toast.gleam", 189).
-spec success() -> lustre@vdom@vattr:attribute(any()).
success() ->
    lustre@attribute:data(<<"category"/utf8>>, <<"success"/utf8>>).

-file("src/glaze/basecoat/toast.gleam", 193).
-spec info() -> lustre@vdom@vattr:attribute(any()).
info() ->
    lustre@attribute:data(<<"category"/utf8>>, <<"info"/utf8>>).

-file("src/glaze/basecoat/toast.gleam", 197).
-spec warning() -> lustre@vdom@vattr:attribute(any()).
warning() ->
    lustre@attribute:data(<<"category"/utf8>>, <<"warning"/utf8>>).

-file("src/glaze/basecoat/toast.gleam", 201).
-spec error() -> lustre@vdom@vattr:attribute(any()).
error() ->
    lustre@attribute:data(<<"category"/utf8>>, <<"error"/utf8>>).

-file("src/glaze/basecoat/toast.gleam", 205).
-spec duration(integer()) -> lustre@vdom@vattr:attribute(any()).
duration(Ms) ->
    lustre@attribute:data(<<"duration"/utf8>>, erlang:integer_to_binary(Ms)).

-file("src/glaze/basecoat/toast.gleam", 209).
-spec title(
    list(lustre@vdom@vattr:attribute(BYI)),
    list(lustre@vdom@vnode:element(BYI))
) -> lustre@vdom@vnode:element(BYI).
title(Attrs, Children) ->
    lustre@element@html:h2(Attrs, Children).

-file("src/glaze/basecoat/toast.gleam", 216).
-spec description(
    list(lustre@vdom@vattr:attribute(BYO)),
    list(lustre@vdom@vnode:element(BYO))
) -> lustre@vdom@vnode:element(BYO).
description(Attrs, Children) ->
    lustre@element@html:p(Attrs, Children).

-file("src/glaze/basecoat/toast.gleam", 223).
-spec content(
    list(lustre@vdom@vattr:attribute(BYU)),
    list(lustre@vdom@vnode:element(BYU))
) -> lustre@vdom@vnode:element(BYU).
content(Attrs, Children) ->
    lustre@element@html:section(Attrs, Children).

-file("src/glaze/basecoat/toast.gleam", 230).
-spec footer(
    list(lustre@vdom@vattr:attribute(BZA)),
    list(lustre@vdom@vnode:element(BZA))
) -> lustre@vdom@vnode:element(BZA).
footer(Attrs, Children) ->
    lustre@element@html:footer(Attrs, Children).

-file("src/glaze/basecoat/toast.gleam", 237).
-spec action_button(binary(), list(lustre@vdom@vattr:attribute(BZG))) -> lustre@vdom@vnode:element(BZG).
action_button(Label, Attrs) ->
    lustre@element@html:button(
        [lustre@attribute:type_(<<"button"/utf8>>),
            lustre@attribute:class(<<"btn"/utf8>>),
            lustre@attribute:data(<<"toast-action"/utf8>>, <<""/utf8>>) |
            Attrs],
        [lustre@element@html:text(Label)]
    ).

-file("src/glaze/basecoat/toast.gleam", 249).
-spec cancel_button(binary(), list(lustre@vdom@vattr:attribute(BZK))) -> lustre@vdom@vnode:element(BZK).
cancel_button(Label, Attrs) ->
    lustre@element@html:button(
        [lustre@attribute:type_(<<"button"/utf8>>),
            lustre@attribute:class(<<"btn-outline"/utf8>>) |
            Attrs],
        [lustre@element@html:text(Label)]
    ).

-file("src/glaze/basecoat/toast.gleam", 259).
?DOC(" Trigger a toast notification.\n").
-spec dispatch(config()) -> nil.
dispatch(_) ->
    nil.

-file("src/glaze/basecoat/toast.gleam", 296).
?DOC(
    " This function produces a string that can be evaluated as javascript.\n"
    "\n"
    " ### Example\n"
    "\n"
    " ```gleam\n"
    " fn login_form() {\n"
    "   let submit_toast_js =\n"
    "     toast.serialize_dispatch(toast.Config(\n"
    "       category: toast.Info,\n"
    "       title: \"Have fun!\",\n"
    "       description: \"\",\n"
    "       action: None,\n"
    "       cancel: None,\n"
    "     ))\n"
    "\n"
    "   html.form([attribute.id(\"login-form\")], [\n"
    "     html.input([]),\n"
    "     html.input([]),\n"
    "\n"
    "     button.button([attribute.type_(\"submit\")], [html.text(\"submit\")]),\n"
    "\n"
    "     html.script([], \"\n"
    "       let form = document.querySelector('form#login-form');\n"
    "       if (form !== null) {\n"
    "          form.addEventListener('submit', (event) => {\n"
    "            event.preventDefault();\\n\" <> submit_toast_js <> \"\\n\n"
    "          });\n"
    "       }\n"
    "     \"),\n"
    "   ])\n"
    " }\n"
    " ```\n"
).
-spec serialize_dispatch(config()) -> binary().
serialize_dispatch(Config) ->
    Payload = begin
        _pipe = config_to_json(Config),
        gleam@json:to_string(_pipe)
    end,
    <<<<"document.dispatchEvent(new CustomEvent('basecoat:toast', { detail: { config: { ..."/utf8,
            Payload/binary>>/binary,
        " } } }));"/utf8>>.
