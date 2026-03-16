-module(glaze@basecoat@form).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/form.gleam").
-export([form/2, vertical/2, group/2, action/1, method/1, post/0, get/0, name/1, fieldset/2, legend/2]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/form/>\n"
    "\n"
    " The [`form`](#form) helpers provide a compact set of primitives for building\n"
    " accessible form layouts with native HTML elements.\n"
    "\n"
    " ## Recipe\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/form\n"
    " import glaze/basecoat/input\n"
    " import glaze/basecoat/button\n"
    " import lustre/attribute\n"
    " import lustre/element/html\n"
    "\n"
    " fn login_form() {\n"
    "   form.form([], [\n"
    "     input.email([attribute.placeholder(\"Email\")]),\n"
    "     input.password([attribute.placeholder(\"Password\")]),\n"
    "     button.button([], [html.text(\"Login\")]),\n"
    "   ])\n"
    " }\n"
    " ```\n"
    "\n"
).

-file("src/glaze/basecoat/form.gleam", 29).
-spec form(
    list(lustre@vdom@vattr:attribute(RSC)),
    list(lustre@vdom@vnode:element(RSC))
) -> lustre@vdom@vnode:element(RSC).
form(Attrs, Children) ->
    lustre@element@html:form(
        [lustre@attribute:class(<<"form"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/form.gleam", 36).
-spec vertical(
    list(lustre@vdom@vattr:attribute(RSI)),
    list(lustre@vdom@vnode:element(RSI))
) -> lustre@vdom@vnode:element(RSI).
vertical(Attrs, Children) ->
    lustre@element@html:form(
        [lustre@attribute:class(<<"form space-y-6"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/form.gleam", 43).
-spec group(
    list(lustre@vdom@vattr:attribute(RSO)),
    list(lustre@vdom@vnode:element(RSO))
) -> lustre@vdom@vnode:element(RSO).
group(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(<<"grid gap-3"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/form.gleam", 50).
-spec action(binary()) -> lustre@vdom@vattr:attribute(any()).
action(Url) ->
    lustre@attribute:action(Url).

-file("src/glaze/basecoat/form.gleam", 54).
-spec method(binary()) -> lustre@vdom@vattr:attribute(any()).
method(M) ->
    lustre@attribute:method(M).

-file("src/glaze/basecoat/form.gleam", 58).
-spec post() -> lustre@vdom@vattr:attribute(any()).
post() ->
    lustre@attribute:method(<<"post"/utf8>>).

-file("src/glaze/basecoat/form.gleam", 62).
-spec get() -> lustre@vdom@vattr:attribute(any()).
get() ->
    lustre@attribute:method(<<"get"/utf8>>).

-file("src/glaze/basecoat/form.gleam", 66).
-spec name(binary()) -> lustre@vdom@vattr:attribute(any()).
name(N) ->
    lustre@attribute:name(N).

-file("src/glaze/basecoat/form.gleam", 70).
-spec fieldset(
    list(lustre@vdom@vattr:attribute(RTE)),
    list(lustre@vdom@vnode:element(RTE))
) -> lustre@vdom@vnode:element(RTE).
fieldset(Attrs, Children) ->
    lustre@element@html:fieldset(
        [lustre@attribute:class(<<"grid gap-3"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/form.gleam", 77).
-spec legend(
    list(lustre@vdom@vattr:attribute(RTK)),
    list(lustre@vdom@vnode:element(RTK))
) -> lustre@vdom@vnode:element(RTK).
legend(Attrs, Children) ->
    lustre@element@html:legend(Attrs, Children).
