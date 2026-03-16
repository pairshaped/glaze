-module(glaze@basecoat@pagination).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/pagination.gleam").
-export([pagination/2, prev/1, next/1, page/3, ellipsis/1]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/pagination/>\n"
    "\n"
    " Pagination helpers for multi-page lists and tables.\n"
    "\n"
    " ## Recipe\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/pagination\n"
    " import lustre/attribute\n"
    "\n"
    " fn page_nav() {\n"
    "   pagination.pagination([], [\n"
    "     pagination.prev([attribute.href(\"?page=1\")]),\n"
    "     pagination.page(1, True, [attribute.href(\"?page=1\")]),\n"
    "     pagination.page(2, False, [attribute.href(\"?page=2\")]),\n"
    "     pagination.next([attribute.href(\"?page=2\")]),\n"
    "   ])\n"
    " }\n"
    " ```\n"
    "\n"
).

-file("src/glaze/basecoat/pagination.gleam", 27).
-spec pagination(
    list(lustre@vdom@vattr:attribute(SEA)),
    list(lustre@vdom@vnode:element(SEA))
) -> lustre@vdom@vnode:element(SEA).
pagination(Attrs, Children) ->
    lustre@element@html:nav(
        [lustre@attribute:role(<<"navigation"/utf8>>),
            lustre@attribute:aria_label(<<"pagination"/utf8>>),
            lustre@attribute:class(
                <<"mx-auto flex w-full justify-center"/utf8>>
            ) |
            Attrs],
        [lustre@element@html:ul(
                [lustre@attribute:class(
                        <<"flex flex-row items-center gap-1"/utf8>>
                    )],
                Children
            )]
    ).

-file("src/glaze/basecoat/pagination.gleam", 44).
-spec prev(list(lustre@vdom@vattr:attribute(SEG))) -> lustre@vdom@vnode:element(SEG).
prev(Attrs) ->
    lustre@element@html:li(
        [],
        [lustre@element@html:a(
                [lustre@attribute:class(<<"btn-ghost"/utf8>>) | Attrs],
                [lustre@element@html:text(<<" Previous"/utf8>>)]
            )]
    ).

-file("src/glaze/basecoat/pagination.gleam", 50).
-spec next(list(lustre@vdom@vattr:attribute(SEK))) -> lustre@vdom@vnode:element(SEK).
next(Attrs) ->
    lustre@element@html:li(
        [],
        [lustre@element@html:a(
                [lustre@attribute:class(<<"btn-ghost"/utf8>>) | Attrs],
                [lustre@element@html:text(<<"Next "/utf8>>)]
            )]
    ).

-file("src/glaze/basecoat/pagination.gleam", 56).
-spec page(integer(), boolean(), list(lustre@vdom@vattr:attribute(SEO))) -> lustre@vdom@vnode:element(SEO).
page(Page_num, Is_active, Attrs) ->
    Class = case Is_active of
        true ->
            <<"btn-icon-outline"/utf8>>;

        false ->
            <<"btn-icon-ghost"/utf8>>
    end,
    lustre@element@html:li(
        [],
        [lustre@element@html:a(
                [lustre@attribute:class(Class) | Attrs],
                [lustre@element@html:text(erlang:integer_to_binary(Page_num))]
            )]
    ).

-file("src/glaze/basecoat/pagination.gleam", 73).
-spec ellipsis(list(lustre@vdom@vattr:attribute(SES))) -> lustre@vdom@vnode:element(SES).
ellipsis(Attrs) ->
    lustre@element@html:li(
        [],
        [lustre@element@html:'div'(
                [lustre@attribute:class(
                        <<"size-9 flex items-center justify-center"/utf8>>
                    ) |
                    Attrs],
                [lustre@element@html:text(<<"..."/utf8>>)]
            )]
    ).
