-module(glaze@basecoat@table).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/table.gleam").
-export([table/2, scrollable/2, caption/2, thead/2, tbody/2, tfoot/2, tr/2, th/2, td/2, align_right/0, font_medium/0]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/table/>\n"
    "\n"
    " Table helpers for data grids and record lists.\n"
    "\n"
    " ## Recipe\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/table\n"
    " import lustre/element/html\n"
    "\n"
    " fn invoices_table() {\n"
    "   table.scrollable([], [\n"
    "     table.table([], [\n"
    "       table.thead([], [\n"
    "         table.tr([], [\n"
    "           table.th([], [html.text(\"Invoice\")]),\n"
    "           table.th([], [html.text(\"Status\")]),\n"
    "           table.th([table.align_right()], [html.text(\"Amount\")]),\n"
    "         ]),\n"
    "       ]),\n"
    "       table.tbody([], [\n"
    "         table.tr([], [\n"
    "           table.td([], [html.text(\"INV001\")]),\n"
    "           table.td([], [html.text(\"Paid\")]),\n"
    "           table.td([table.align_right(), table.font_medium()], [html.text(\"$250.00\")]),\n"
    "         ]),\n"
    "       ]),\n"
    "     ])\n"
    "   ])\n"
    " }\n"
    " ```\n"
    "\n"
).

-file("src/glaze/basecoat/table.gleam", 38).
-spec table(
    list(lustre@vdom@vattr:attribute(TDB)),
    list(lustre@vdom@vnode:element(TDB))
) -> lustre@vdom@vnode:element(TDB).
table(Attrs, Children) ->
    lustre@element@html:table(
        [lustre@attribute:class(<<"table"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/table.gleam", 45).
-spec scrollable(
    list(lustre@vdom@vattr:attribute(TDH)),
    list(lustre@vdom@vnode:element(TDH))
) -> lustre@vdom@vnode:element(TDH).
scrollable(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(<<"overflow-x-auto"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/table.gleam", 52).
-spec caption(
    list(lustre@vdom@vattr:attribute(TDN)),
    list(lustre@vdom@vnode:element(TDN))
) -> lustre@vdom@vnode:element(TDN).
caption(Attrs, Children) ->
    lustre@element@html:caption(Attrs, Children).

-file("src/glaze/basecoat/table.gleam", 59).
-spec thead(
    list(lustre@vdom@vattr:attribute(TDT)),
    list(lustre@vdom@vnode:element(TDT))
) -> lustre@vdom@vnode:element(TDT).
thead(Attrs, Children) ->
    lustre@element@html:thead(Attrs, Children).

-file("src/glaze/basecoat/table.gleam", 66).
-spec tbody(
    list(lustre@vdom@vattr:attribute(TDZ)),
    list(lustre@vdom@vnode:element(TDZ))
) -> lustre@vdom@vnode:element(TDZ).
tbody(Attrs, Children) ->
    lustre@element@html:tbody(Attrs, Children).

-file("src/glaze/basecoat/table.gleam", 73).
-spec tfoot(
    list(lustre@vdom@vattr:attribute(TEF)),
    list(lustre@vdom@vnode:element(TEF))
) -> lustre@vdom@vnode:element(TEF).
tfoot(Attrs, Children) ->
    lustre@element@html:tfoot(Attrs, Children).

-file("src/glaze/basecoat/table.gleam", 80).
-spec tr(
    list(lustre@vdom@vattr:attribute(TEL)),
    list(lustre@vdom@vnode:element(TEL))
) -> lustre@vdom@vnode:element(TEL).
tr(Attrs, Children) ->
    lustre@element@html:tr(Attrs, Children).

-file("src/glaze/basecoat/table.gleam", 87).
-spec th(
    list(lustre@vdom@vattr:attribute(TER)),
    list(lustre@vdom@vnode:element(TER))
) -> lustre@vdom@vnode:element(TER).
th(Attrs, Children) ->
    lustre@element@html:th(Attrs, Children).

-file("src/glaze/basecoat/table.gleam", 94).
-spec td(
    list(lustre@vdom@vattr:attribute(TEX)),
    list(lustre@vdom@vnode:element(TEX))
) -> lustre@vdom@vnode:element(TEX).
td(Attrs, Children) ->
    lustre@element@html:td(Attrs, Children).

-file("src/glaze/basecoat/table.gleam", 101).
-spec align_right() -> lustre@vdom@vattr:attribute(any()).
align_right() ->
    lustre@attribute:class(<<"text-right"/utf8>>).

-file("src/glaze/basecoat/table.gleam", 105).
-spec font_medium() -> lustre@vdom@vattr:attribute(any()).
font_medium() ->
    lustre@attribute:class(<<"font-medium"/utf8>>).
