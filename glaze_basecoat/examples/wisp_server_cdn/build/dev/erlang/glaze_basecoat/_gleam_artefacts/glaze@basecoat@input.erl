-module(glaze@basecoat@input).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/input.gleam").
-export([input/1, email/1, password/1, number/1, search/1, url/1, date/1, time/1, invalid/0, disabled/0, placeholder/1, value/1, name/1, id/1]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/input/>\n"
    "\n"
    " Input helpers for common text-like controls.\n"
    "\n"
    " These helpers style native `<input>` elements and provide small attribute\n"
    " helpers for common patterns.\n"
    "\n"
    " ## Anatomy\n"
    "\n"
    " Choose an input constructor (`input`, `email`, `password`, ...) and pass\n"
    " native attributes from `lustre/attribute` plus any helpers in this module.\n"
    "\n"
    " ## Recipe\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/input\n"
    " import lustre/attribute\n"
    "\n"
    " fn email_field() {\n"
    "   input.input([\n"
    "     attribute.id(\"email\"),\n"
    "     attribute.type_(\"email\"),\n"
    "     attribute.placeholder(\"Email\"),\n"
    "   ])\n"
    " }\n"
    " ```\n"
    "\n"
    " ## References\n"
    "\n"
    " - MDN `aria-invalid`: <https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid>\n"
).

-file("src/glaze/basecoat/input.gleam", 36).
-spec input(list(lustre@vdom@vattr:attribute(RUJ))) -> lustre@vdom@vnode:element(RUJ).
input(Attrs) ->
    lustre@element@html:input(
        [lustre@attribute:class(<<"input"/utf8>>),
            lustre@attribute:type_(<<"text"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/input.gleam", 40).
-spec email(list(lustre@vdom@vattr:attribute(RUN))) -> lustre@vdom@vnode:element(RUN).
email(Attrs) ->
    lustre@element@html:input(
        [lustre@attribute:class(<<"input"/utf8>>),
            lustre@attribute:type_(<<"email"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/input.gleam", 44).
-spec password(list(lustre@vdom@vattr:attribute(RUR))) -> lustre@vdom@vnode:element(RUR).
password(Attrs) ->
    lustre@element@html:input(
        [lustre@attribute:class(<<"input"/utf8>>),
            lustre@attribute:type_(<<"password"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/input.gleam", 48).
-spec number(list(lustre@vdom@vattr:attribute(RUV))) -> lustre@vdom@vnode:element(RUV).
number(Attrs) ->
    lustre@element@html:input(
        [lustre@attribute:class(<<"input"/utf8>>),
            lustre@attribute:type_(<<"number"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/input.gleam", 52).
-spec search(list(lustre@vdom@vattr:attribute(RUZ))) -> lustre@vdom@vnode:element(RUZ).
search(Attrs) ->
    lustre@element@html:input(
        [lustre@attribute:class(<<"input"/utf8>>),
            lustre@attribute:type_(<<"search"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/input.gleam", 56).
-spec url(list(lustre@vdom@vattr:attribute(RVD))) -> lustre@vdom@vnode:element(RVD).
url(Attrs) ->
    lustre@element@html:input(
        [lustre@attribute:class(<<"input"/utf8>>),
            lustre@attribute:type_(<<"url"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/input.gleam", 60).
-spec date(list(lustre@vdom@vattr:attribute(RVH))) -> lustre@vdom@vnode:element(RVH).
date(Attrs) ->
    lustre@element@html:input(
        [lustre@attribute:class(<<"input"/utf8>>),
            lustre@attribute:type_(<<"date"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/input.gleam", 64).
-spec time(list(lustre@vdom@vattr:attribute(RVL))) -> lustre@vdom@vnode:element(RVL).
time(Attrs) ->
    lustre@element@html:input(
        [lustre@attribute:class(<<"input"/utf8>>),
            lustre@attribute:type_(<<"time"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/input.gleam", 68).
-spec invalid() -> lustre@vdom@vattr:attribute(any()).
invalid() ->
    lustre@attribute:aria_invalid(<<"true"/utf8>>).

-file("src/glaze/basecoat/input.gleam", 72).
-spec disabled() -> lustre@vdom@vattr:attribute(any()).
disabled() ->
    lustre@attribute:disabled(true).

-file("src/glaze/basecoat/input.gleam", 76).
-spec placeholder(binary()) -> lustre@vdom@vattr:attribute(any()).
placeholder(Text) ->
    lustre@attribute:placeholder(Text).

-file("src/glaze/basecoat/input.gleam", 80).
-spec value(binary()) -> lustre@vdom@vattr:attribute(any()).
value(Text) ->
    lustre@attribute:value(Text).

-file("src/glaze/basecoat/input.gleam", 84).
-spec name(binary()) -> lustre@vdom@vattr:attribute(any()).
name(N) ->
    lustre@attribute:name(N).

-file("src/glaze/basecoat/input.gleam", 88).
-spec id(binary()) -> lustre@vdom@vattr:attribute(any()).
id(Id) ->
    lustre@attribute:id(Id).
