-module(glaze@basecoat@alert_dialog).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/glaze/basecoat/alert_dialog.gleam").
-export([title/2, description/2, header/2, alert_dialog/3, alert_dialog_with_text/5, content/2, footer/2, action/2, cancel/2, destructive/2, open_script/1, close_script/1, trigger_button/3]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

?MODULEDOC(
    " Basecoat documentation: <https://basecoatui.com/components/alert-dialog/>\n"
    "\n"
    " A modal dialog that interrupts the user with important content and expects\n"
    " a response.\n"
    "\n"
    " ## Recipe\n"
    "\n"
    " ```gleam\n"
    " import glaze/basecoat/alert_dialog\n"
    " import glaze/basecoat/button\n"
    " import lustre/element/html\n"
    "\n"
    " fn delete_confirm_dialog() {\n"
    "   alert_dialog.alert_dialog(\"delete-confirm\", [\n"
    "     alert_dialog.title([], [html.text(\"Are you sure?\")]),\n"
    "     alert_dialog.description([], [html.text(\"This action cannot be undone.\")]),\n"
    "     alert_dialog.content([], [\n"
    "       alert_dialog.footer([], [\n"
    "         button.button([button.outline()], [html.text(\"Cancel\")]),\n"
    "         button.button([button.destructive()], [html.text(\"Delete\")]),\n"
    "       ]),\n"
    "     ]),\n"
    "   ])\n"
    " }\n"
    " ```\n"
    "\n"
    " ## References\n"
    "\n"
    " - MDN `<dialog>`: <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog>\n"
    " - MDN `HTMLDialogElement`: <https://developer.mozilla.org/en-US/docs/Web/API/HTMLDialogElement>\n"
).

-file("src/glaze/basecoat/alert_dialog.gleam", 94).
-spec title(
    list(lustre@vdom@vattr:attribute(PUQ)),
    list(lustre@vdom@vnode:element(PUQ))
) -> lustre@vdom@vnode:element(PUQ).
title(Attrs, Children) ->
    lustre@element@html:h2(Attrs, Children).

-file("src/glaze/basecoat/alert_dialog.gleam", 101).
-spec description(
    list(lustre@vdom@vattr:attribute(PUW)),
    list(lustre@vdom@vnode:element(PUW))
) -> lustre@vdom@vnode:element(PUW).
description(Attrs, Children) ->
    lustre@element@html:p(Attrs, Children).

-file("src/glaze/basecoat/alert_dialog.gleam", 108).
-spec header(
    list(lustre@vdom@vattr:attribute(PVC)),
    list(lustre@vdom@vnode:element(PVC))
) -> lustre@vdom@vnode:element(PVC).
header(Attrs, Children) ->
    lustre@element@html:header(Attrs, Children).

-file("src/glaze/basecoat/alert_dialog.gleam", 36).
-spec alert_dialog(
    binary(),
    list(lustre@vdom@vattr:attribute(PUE)),
    list(lustre@vdom@vnode:element(PUE))
) -> lustre@vdom@vnode:element(PUE).
alert_dialog(Id, Attrs, Children) ->
    Title_id = <<Id/binary, "-title"/utf8>>,
    Desc_id = <<Id/binary, "-description"/utf8>>,
    lustre@element@html:dialog(
        [lustre@attribute:class(<<"alert-dialog"/utf8>>),
            lustre@attribute:id(Id),
            lustre@attribute:aria_labelledby(Title_id),
            lustre@attribute:aria_describedby(Desc_id),
            lustre@attribute:attribute(
                <<"onclick"/utf8>>,
                <<"if (event.target === this) this.close()"/utf8>>
            ) |
            Attrs],
        [lustre@element@html:'div'(
                [],
                [header(
                        [],
                        [lustre@element@html:h2(
                                [lustre@attribute:id(Title_id)],
                                []
                            )]
                    ),
                    lustre@element@html:p(
                        [lustre@attribute:id(Desc_id),
                            lustre@attribute:class(<<"sr-only"/utf8>>)],
                        []
                    ) |
                    Children]
            )]
    ).

-file("src/glaze/basecoat/alert_dialog.gleam", 64).
-spec alert_dialog_with_text(
    binary(),
    binary(),
    binary(),
    list(lustre@vdom@vattr:attribute(PUK)),
    list(lustre@vdom@vnode:element(PUK))
) -> lustre@vdom@vnode:element(PUK).
alert_dialog_with_text(Id, Title, Description, Attrs, Children) ->
    Title_id = <<Id/binary, "-title"/utf8>>,
    Desc_id = <<Id/binary, "-description"/utf8>>,
    lustre@element@html:dialog(
        [lustre@attribute:class(<<"alert-dialog"/utf8>>),
            lustre@attribute:id(Id),
            lustre@attribute:aria_labelledby(Title_id),
            lustre@attribute:aria_describedby(Desc_id),
            lustre@attribute:attribute(
                <<"onclick"/utf8>>,
                <<"if (event.target === this) this.close()"/utf8>>
            ) |
            Attrs],
        [lustre@element@html:'div'(
                [],
                [header(
                        [],
                        [lustre@element@html:h2(
                                [lustre@attribute:id(Title_id)],
                                [lustre@element@html:text(Title)]
                            )]
                    ),
                    lustre@element@html:p(
                        [lustre@attribute:id(Desc_id)],
                        [lustre@element@html:text(Description)]
                    ) |
                    Children]
            )]
    ).

-file("src/glaze/basecoat/alert_dialog.gleam", 115).
-spec content(
    list(lustre@vdom@vattr:attribute(PVI)),
    list(lustre@vdom@vnode:element(PVI))
) -> lustre@vdom@vnode:element(PVI).
content(Attrs, Children) ->
    lustre@element@html:section(Attrs, Children).

-file("src/glaze/basecoat/alert_dialog.gleam", 122).
-spec footer(
    list(lustre@vdom@vattr:attribute(PVO)),
    list(lustre@vdom@vnode:element(PVO))
) -> lustre@vdom@vnode:element(PVO).
footer(Attrs, Children) ->
    lustre@element@html:footer(Attrs, Children).

-file("src/glaze/basecoat/alert_dialog.gleam", 129).
-spec action(
    list(lustre@vdom@vattr:attribute(PVU)),
    list(lustre@vdom@vnode:element(PVU))
) -> lustre@vdom@vnode:element(PVU).
action(Attrs, Children) ->
    lustre@element@html:button(
        [lustre@attribute:type_(<<"button"/utf8>>),
            lustre@attribute:class(<<"btn"/utf8>>) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/alert_dialog.gleam", 139).
-spec cancel(
    list(lustre@vdom@vattr:attribute(PWA)),
    list(lustre@vdom@vnode:element(PWA))
) -> lustre@vdom@vnode:element(PWA).
cancel(Attrs, Children) ->
    lustre@element@html:button(
        [lustre@attribute:type_(<<"button"/utf8>>),
            lustre@attribute:class(<<"btn-outline"/utf8>>),
            lustre@attribute:attribute(
                <<"onclick"/utf8>>,
                <<"this.closest('dialog').close()"/utf8>>
            ) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/alert_dialog.gleam", 154).
-spec destructive(
    list(lustre@vdom@vattr:attribute(PWG)),
    list(lustre@vdom@vnode:element(PWG))
) -> lustre@vdom@vnode:element(PWG).
destructive(Attrs, Children) ->
    lustre@element@html:button(
        [lustre@attribute:type_(<<"button"/utf8>>),
            lustre@attribute:class(<<"btn-destructive"/utf8>>),
            lustre@attribute:attribute(
                <<"onclick"/utf8>>,
                <<"this.closest('dialog').close()"/utf8>>
            ) |
            Attrs],
        Children
    ).

-file("src/glaze/basecoat/alert_dialog.gleam", 169).
-spec open_script(binary()) -> binary().
open_script(Dialog_id) ->
    <<<<"document.getElementById('"/utf8, Dialog_id/binary>>/binary,
        "').showModal()"/utf8>>.

-file("src/glaze/basecoat/alert_dialog.gleam", 173).
-spec close_script(binary()) -> binary().
close_script(Dialog_id) ->
    <<<<"document.getElementById('"/utf8, Dialog_id/binary>>/binary,
        "').close()"/utf8>>.

-file("src/glaze/basecoat/alert_dialog.gleam", 177).
-spec trigger_button(
    binary(),
    list(lustre@vdom@vattr:attribute(PWM)),
    list(lustre@vdom@vnode:element(PWM))
) -> lustre@vdom@vnode:element(PWM).
trigger_button(Dialog_id, Attrs, Children) ->
    lustre@element@html:button(
        [lustre@attribute:type_(<<"button"/utf8>>),
            lustre@attribute:attribute(
                <<"onclick"/utf8>>,
                open_script(Dialog_id)
            ) |
            Attrs],
        Children
    ).
