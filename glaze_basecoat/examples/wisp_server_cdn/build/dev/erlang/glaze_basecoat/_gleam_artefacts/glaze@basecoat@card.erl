-module(glaze@basecoat@card).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/card.gleam").
-export([card/2, header/2, title/2, description/2, content/2, footer/2, no_padding/0]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/card/>\n"
    "\n"
    " The [`card`](#card) helpers compose grouped content blocks such as summaries,\n"
    " settings sections, and dashboard tiles.\n"
    "\n"
    " ## Anatomy\n"
    "\n"
    " A card typically includes a header (with title and description), content section,\n"
    " and optional footer for actions.\n"
    "\n"
    " ## Recipes\n"
    "\n"
    " ### Simple card\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/card\n"
    " import lustre/element/html\n"
    "\n"
    " fn simple_card() {\n"
    "   card.card([], [\n"
    "     card.header([], [\n"
    "       card.title([], [html.text(\"Card Title\")]),\n"
    "       card.description([], [html.text(\"Card description\")]),\n"
    "     ]),\n"
    "     card.content([], [html.text(\"Content goes here\")]),\n"
    "     card.footer([], [html.text(\"Footer\")]),\n"
    "   ])\n"
    " }\n"
    " ```\n"
    "\n"
).

-file("src/glaze/basecoat/card.gleam", 36).
-spec card(
    list(lustre@vdom@vattr:attribute(QOQ)),
    list(lustre@vdom@vnode:element(QOQ))
) -> lustre@vdom@vnode:element(QOQ).
card(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(<<"card"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/card.gleam", 43).
-spec header(
    list(lustre@vdom@vattr:attribute(QOW)),
    list(lustre@vdom@vnode:element(QOW))
) -> lustre@vdom@vnode:element(QOW).
header(Attrs, Children) ->
    lustre@element@html:header(Attrs, Children).

-file("src/glaze/basecoat/card.gleam", 50).
-spec title(
    list(lustre@vdom@vattr:attribute(QPC)),
    list(lustre@vdom@vnode:element(QPC))
) -> lustre@vdom@vnode:element(QPC).
title(Attrs, Children) ->
    lustre@element@html:h2(
        [lustre@attribute:class(<<"text-lg font-semibold"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/card.gleam", 57).
-spec description(
    list(lustre@vdom@vattr:attribute(QPI)),
    list(lustre@vdom@vnode:element(QPI))
) -> lustre@vdom@vnode:element(QPI).
description(Attrs, Children) ->
    lustre@element@html:p(
        [lustre@attribute:class(<<"text-sm text-muted-foreground"/utf8>>) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/card.gleam", 64).
-spec content(
    list(lustre@vdom@vattr:attribute(QPO)),
    list(lustre@vdom@vnode:element(QPO))
) -> lustre@vdom@vnode:element(QPO).
content(Attrs, Children) ->
    lustre@element@html:section(Attrs, Children).

-file("src/glaze/basecoat/card.gleam", 71).
-spec footer(
    list(lustre@vdom@vattr:attribute(QPU)),
    list(lustre@vdom@vnode:element(QPU))
) -> lustre@vdom@vnode:element(QPU).
footer(Attrs, Children) ->
    lustre@element@html:footer(Attrs, Children).

-file("src/glaze/basecoat/card.gleam", 78).
-spec no_padding() -> lustre@vdom@vattr:attribute(any()).
no_padding() ->
    lustre@attribute:class(<<"p-0"/utf8>>).
