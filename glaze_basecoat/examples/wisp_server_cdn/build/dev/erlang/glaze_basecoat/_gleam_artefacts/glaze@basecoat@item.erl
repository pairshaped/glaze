-module(glaze@basecoat@item).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/item.gleam").
-export([item/2, item_link/3, content/2, title/2, description/2, icon/2, avatar/3, image/3, actions/2, separator/0, group/2, muted/0, outline/0, default/0]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/item/>\n"
    "\n"
    " Item helpers for list rows and compact content blocks.\n"
    "\n"
    " Use items for settings rows, search results, command-style lists, or any\n"
    " repeated row content.\n"
    "\n"
    " ## Anatomy\n"
    "\n"
    " - [`item`](#item) / [`item_link`](#item_link): the row container\n"
    " - [`icon`](#icon), [`avatar`](#avatar), [`image`](#image): leading visuals\n"
    " - [`content`](#content): title/description stack\n"
    " - [`actions`](#actions): trailing controls\n"
    "\n"
    " ## Recipe\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/item\n"
    " import lustre/element/html\n"
    "\n"
    " fn my_item() {\n"
    "   item.item([], [\n"
    "     item.title([], [html.text(\"My Item\")]),\n"
    "     item.description([], [html.text(\"Item description here.\")]),\n"
    "   ])\n"
    " }\n"
    " ```\n"
).

-file("src/glaze/basecoat/item.gleam", 33).
-spec item(
    list(lustre@vdom@vattr:attribute(RXW)),
    list(lustre@vdom@vnode:element(RXW))
) -> lustre@vdom@vnode:element(RXW).
item(Attrs, Children) ->
    lustre@element@html:article(
        [lustre@attribute:class(
                <<"group/item flex items-center border text-sm rounded-md transition-colors [a]:hover:bg-accent/50 [a]:transition-colors duration-100 flex-wrap outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] border-border p-4 gap-4"/utf8>>
            ) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/item.gleam", 48).
-spec item_link(
    binary(),
    list(lustre@vdom@vattr:attribute(RYC)),
    list(lustre@vdom@vnode:element(RYC))
) -> lustre@vdom@vnode:element(RYC).
item_link(Href, Attrs, Children) ->
    lustre@element@html:a(
        [lustre@attribute:href(Href),
            lustre@attribute:class(
                <<"group/item flex items-center border text-sm rounded-md transition-colors [a]:hover:bg-accent/50 [a]:transition-colors duration-100 flex-wrap outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] border-border p-4 gap-4"/utf8>>
            ) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/item.gleam", 65).
-spec content(
    list(lustre@vdom@vattr:attribute(RYI)),
    list(lustre@vdom@vnode:element(RYI))
) -> lustre@vdom@vnode:element(RYI).
content(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(<<"flex flex-1 flex-col gap-1"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/item.gleam", 72).
-spec title(
    list(lustre@vdom@vattr:attribute(RYO)),
    list(lustre@vdom@vnode:element(RYO))
) -> lustre@vdom@vnode:element(RYO).
title(Attrs, Children) ->
    lustre@element@html:h3(
        [lustre@attribute:class(
                <<"flex w-fit items-center gap-2 text-sm leading-snug font-medium"/utf8>>
            ) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/item.gleam", 87).
-spec description(
    list(lustre@vdom@vattr:attribute(RYU)),
    list(lustre@vdom@vnode:element(RYU))
) -> lustre@vdom@vnode:element(RYU).
description(Attrs, Children) ->
    lustre@element@html:p(
        [lustre@attribute:class(
                <<"text-muted-foreground line-clamp-2 text-sm leading-normal font-normal text-balance"/utf8>>
            ) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/item.gleam", 102).
-spec icon(
    list(lustre@vdom@vattr:attribute(RZA)),
    list(lustre@vdom@vnode:element(RZA))
) -> lustre@vdom@vnode:element(RZA).
icon(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(
                <<"flex shrink-0 items-center justify-center gap-2 self-start [&_svg]:pointer-events-none size-8 border rounded-sm bg-muted [&_svg:not([class*='size-'])]:size-4"/utf8>>
            ) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/item.gleam", 117).
-spec avatar(binary(), binary(), list(lustre@vdom@vattr:attribute(RZG))) -> lustre@vdom@vnode:element(RZG).
avatar(Src, Alt, Attrs) ->
    lustre@element@html:img(
        [lustre@attribute:src(Src),
            lustre@attribute:alt(Alt),
            lustre@attribute:class(<<"size-10 rounded-full object-cover"/utf8>>) |
            Attrs]
    ).

-file("src/glaze/basecoat/item.gleam", 130).
-spec image(binary(), binary(), list(lustre@vdom@vattr:attribute(RZK))) -> lustre@vdom@vnode:element(RZK).
image(Src, Alt, Attrs) ->
    lustre@element@html:img(
        [lustre@attribute:src(Src),
            lustre@attribute:alt(Alt),
            lustre@attribute:class(
                <<"grayscale size-10 rounded-sm object-cover"/utf8>>
            ) |
            Attrs]
    ).

-file("src/glaze/basecoat/item.gleam", 143).
-spec actions(
    list(lustre@vdom@vattr:attribute(RZO)),
    list(lustre@vdom@vnode:element(RZO))
) -> lustre@vdom@vnode:element(RZO).
actions(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(
                <<"flex items-center gap-2 [&_svg]:size-4"/utf8>>
            ) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/item.gleam", 153).
-spec separator() -> lustre@vdom@vnode:element(any()).
separator() ->
    lustre@element@html:hr(
        [lustre@attribute:role(<<"separator"/utf8>>),
            lustre@attribute:class(<<"border-border"/utf8>>)]
    ).

-file("src/glaze/basecoat/item.gleam", 157).
-spec group(
    list(lustre@vdom@vattr:attribute(RZW)),
    list(lustre@vdom@vnode:element(RZW))
) -> lustre@vdom@vnode:element(RZW).
group(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(<<"flex flex-col"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/item.gleam", 164).
-spec muted() -> lustre@vdom@vattr:attribute(any()).
muted() ->
    lustre@attribute:class(<<"border-transparent bg-muted/50"/utf8>>).

-file("src/glaze/basecoat/item.gleam", 168).
-spec outline() -> lustre@vdom@vattr:attribute(any()).
outline() ->
    lustre@attribute:class(<<"border-border"/utf8>>).

-file("src/glaze/basecoat/item.gleam", 172).
-spec default() -> lustre@vdom@vattr:attribute(any()).
default() ->
    lustre@attribute:class(<<"border-transparent"/utf8>>).
