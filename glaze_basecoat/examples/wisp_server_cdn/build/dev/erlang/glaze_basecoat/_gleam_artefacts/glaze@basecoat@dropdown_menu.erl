-module(glaze@basecoat@dropdown_menu).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/dropdown_menu.gleam").
-export([dropdown/2, trigger/2, trigger_with_ids/5, content/2, content_with_ids/5, item/2, item_with_shortcut/3, checkbox_item/3, radio_item/3, group/2, separator/0, heading/3, disabled/0, min_width/1, side/1, align/1]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/dropdown-menu/>\n"
    "\n"
    " The [`dropdown`](#dropdown) helpers compose trigger and menu markup for\n"
    " small action lists and contextual menus.\n"
    "\n"
    " **Note**: This component requires JavaScript from Basecoat.\n"
    "\n"
    " ## Anatomy\n"
    "\n"
    " A dropdown usually has a trigger control and a content panel containing one\n"
    " or more `item` entries.\n"
    "\n"
    " ## Recipe\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/dropdown_menu\n"
    " import glaze/basecoat/button\n"
    " import lustre/element/html\n"
    "\n"
    " fn my_dropdown() {\n"
    "   dropdown_menu.dropdown(\"my-menu\", [\n"
    "     dropdown_menu.trigger([button.outline()], [html.text(\"Open\")]),\n"
    "     dropdown_menu.content([dropdown_menu.min_width(\"14rem\")], [\n"
    "       dropdown_menu.group(\"Options\", [\n"
    "         dropdown_menu.item([], [html.text(\"Profile\")]),\n"
    "         dropdown_menu.item([], [html.text(\"Settings\")]),\n"
    "       ]),\n"
    "       dropdown_menu.separator(),\n"
    "       dropdown_menu.item([dropdown_menu.disabled()], [html.text(\"Logout\")]),\n"
    "     ]),\n"
    "   ])\n"
    " }\n"
    " ```\n"
    "\n"
    " ## References\n"
    "\n"
    " - MDN ARIA `menu` role: <https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role>\n"
    " - MDN ARIA `menuitem` role: <https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role>\n"
    " - MDN Popover API: <https://developer.mozilla.org/en-US/docs/Web/API/Popover_API>\n"
).

-file("src/glaze/basecoat/dropdown_menu.gleam", 46).
-spec dropdown(binary(), list(lustre@vdom@vnode:element(RGU))) -> lustre@vdom@vnode:element(RGU).
dropdown(Id, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:class(<<"dropdown-menu"/utf8>>),
            lustre@attribute:id(Id)],
        Children
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 50).
-spec trigger(
    list(lustre@vdom@vattr:attribute(RGY)),
    list(lustre@vdom@vnode:element(RGY))
) -> lustre@vdom@vnode:element(RGY).
trigger(Attrs, Children) ->
    Trigger_id = <<"trigger"/utf8>>,
    Menu_id = <<"menu"/utf8>>,
    Popover_id = <<"popover"/utf8>>,
    lustre@element@html:button(
        [lustre@attribute:type_(<<"button"/utf8>>),
            lustre@attribute:id(Trigger_id),
            lustre@attribute:aria_haspopup(<<"menu"/utf8>>),
            lustre@attribute:aria_controls(Menu_id),
            lustre@attribute:aria_expanded(false),
            lustre@attribute:popovertarget(Popover_id) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 71).
-spec trigger_with_ids(
    binary(),
    binary(),
    binary(),
    list(lustre@vdom@vattr:attribute(RHE)),
    list(lustre@vdom@vnode:element(RHE))
) -> lustre@vdom@vnode:element(RHE).
trigger_with_ids(Trigger_id, Menu_id, Popover_id, Attrs, Children) ->
    lustre@element@html:button(
        [lustre@attribute:type_(<<"button"/utf8>>),
            lustre@attribute:id(Trigger_id),
            lustre@attribute:aria_haspopup(<<"menu"/utf8>>),
            lustre@attribute:aria_controls(Menu_id),
            lustre@attribute:aria_expanded(false),
            lustre@attribute:popovertarget(Popover_id) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 92).
-spec content(
    list(lustre@vdom@vattr:attribute(RHK)),
    list(lustre@vdom@vnode:element(RHK))
) -> lustre@vdom@vnode:element(RHK).
content(Attrs, Children) ->
    Popover_id = <<"popover"/utf8>>,
    Menu_id = <<"menu"/utf8>>,
    Trigger_id = <<"trigger"/utf8>>,
    lustre@element@html:'div'(
        [lustre@attribute:id(Popover_id),
            lustre@attribute:data(<<"popover"/utf8>>, <<""/utf8>>),
            lustre@attribute:aria_hidden(true) |
            Attrs],
        [lustre@element@html:'div'(
                [lustre@attribute:role(<<"menu"/utf8>>),
                    lustre@attribute:id(Menu_id),
                    lustre@attribute:aria_labelledby(Trigger_id)],
                Children
            )]
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 119).
-spec content_with_ids(
    binary(),
    binary(),
    binary(),
    list(lustre@vdom@vattr:attribute(RHQ)),
    list(lustre@vdom@vnode:element(RHQ))
) -> lustre@vdom@vnode:element(RHQ).
content_with_ids(Popover_id, Menu_id, Trigger_id, Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:id(Popover_id),
            lustre@attribute:data(<<"popover"/utf8>>, <<""/utf8>>),
            lustre@attribute:aria_hidden(true) |
            Attrs],
        [lustre@element@html:'div'(
                [lustre@attribute:role(<<"menu"/utf8>>),
                    lustre@attribute:id(Menu_id),
                    lustre@attribute:aria_labelledby(Trigger_id)],
                Children
            )]
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 146).
-spec item(
    list(lustre@vdom@vattr:attribute(RHW)),
    list(lustre@vdom@vnode:element(RHW))
) -> lustre@vdom@vnode:element(RHW).
item(Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:role(<<"menuitem"/utf8>>) | Attrs],
        Children
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 153).
-spec item_with_shortcut(
    binary(),
    list(lustre@vdom@vattr:attribute(RIC)),
    list(lustre@vdom@vnode:element(RIC))
) -> lustre@vdom@vnode:element(RIC).
item_with_shortcut(Shortcut, Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:role(<<"menuitem"/utf8>>) | Attrs],
        lists:append(
            Children,
            [lustre@element@html:span(
                    [lustre@attribute:class(
                            <<"text-muted-foreground ml-auto text-xs tracking-widest"/utf8>>
                        )],
                    [lustre@element@html:text(Shortcut)]
                )]
        )
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 173).
-spec checkbox_item(
    boolean(),
    list(lustre@vdom@vattr:attribute(RII)),
    list(lustre@vdom@vnode:element(RII))
) -> lustre@vdom@vnode:element(RII).
checkbox_item(Is_checked, Attrs, Children) ->
    Checked_str = case Is_checked of
        true ->
            <<"true"/utf8>>;

        false ->
            <<"false"/utf8>>
    end,
    lustre@element@html:'div'(
        [lustre@attribute:role(<<"menuitemcheckbox"/utf8>>),
            lustre@attribute:aria_checked(Checked_str) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 192).
-spec radio_item(
    boolean(),
    list(lustre@vdom@vattr:attribute(RIO)),
    list(lustre@vdom@vnode:element(RIO))
) -> lustre@vdom@vnode:element(RIO).
radio_item(Is_checked, Attrs, Children) ->
    Checked_str = case Is_checked of
        true ->
            <<"true"/utf8>>;

        false ->
            <<"false"/utf8>>
    end,
    lustre@element@html:'div'(
        [lustre@attribute:role(<<"menuitemradio"/utf8>>),
            lustre@attribute:aria_checked(Checked_str) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 212).
-spec group(binary(), list(lustre@vdom@vnode:element(RIU))) -> lustre@vdom@vnode:element(RIU).
group(Label, Items) ->
    Label_id = <<"group-"/utf8, Label/binary>>,
    lustre@element@html:'div'(
        [lustre@attribute:role(<<"group"/utf8>>),
            lustre@attribute:aria_labelledby(Label_id)],
        [lustre@element@html:'div'(
                [lustre@attribute:role(<<"heading"/utf8>>),
                    lustre@attribute:id(Label_id)],
                [lustre@element@html:text(Label)]
            ) |
            Items]
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 222).
-spec separator() -> lustre@vdom@vnode:element(any()).
separator() ->
    lustre@element@html:hr([lustre@attribute:role(<<"separator"/utf8>>)]).

-file("src/glaze/basecoat/dropdown_menu.gleam", 226).
-spec heading(
    binary(),
    list(lustre@vdom@vattr:attribute(RJA)),
    list(lustre@vdom@vnode:element(RJA))
) -> lustre@vdom@vnode:element(RJA).
heading(Id, Attrs, Children) ->
    lustre@element@html:'div'(
        [lustre@attribute:role(<<"heading"/utf8>>),
            lustre@attribute:id(Id) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/dropdown_menu.gleam", 234).
-spec disabled() -> lustre@vdom@vattr:attribute(any()).
disabled() ->
    lustre@attribute:aria_disabled(true).

-file("src/glaze/basecoat/dropdown_menu.gleam", 238).
-spec min_width(binary()) -> lustre@vdom@vattr:attribute(any()).
min_width(Width) ->
    lustre@attribute:style(<<"min-width"/utf8>>, Width).

-file("src/glaze/basecoat/dropdown_menu.gleam", 242).
-spec side(binary()) -> lustre@vdom@vattr:attribute(any()).
side(S) ->
    lustre@attribute:data(<<"side"/utf8>>, S).

-file("src/glaze/basecoat/dropdown_menu.gleam", 246).
-spec align(binary()) -> lustre@vdom@vattr:attribute(any()).
align(A) ->
    lustre@attribute:data(<<"align"/utf8>>, A).
