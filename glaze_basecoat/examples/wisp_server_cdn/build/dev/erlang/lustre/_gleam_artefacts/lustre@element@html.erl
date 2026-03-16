-module(lustre@element@html).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/lustre/element/html.gleam").
-export([html/2, text/1, base/1, head/2, link/1, meta/1, style/2, title/2, body/2, address/2, article/2, aside/2, footer/2, header/2, h1/2, h2/2, h3/2, h4/2, h5/2, h6/2, hgroup/2, main/2, nav/2, section/2, search/2, blockquote/2, dd/2, 'div'/2, dl/2, dt/2, figcaption/2, figure/2, hr/1, li/2, menu/2, ol/2, p/2, pre/2, ul/2, a/2, abbr/2, b/2, bdi/2, bdo/2, br/1, cite/2, code/2, data/2, dfn/2, em/2, i/2, kbd/2, mark/2, q/2, rp/2, rt/2, ruby/2, s/2, samp/2, small/2, span/2, strong/2, sub/2, sup/2, time/2, u/2, var/2, wbr/1, area/1, audio/2, img/1, map/2, track/1, video/2, embed/1, iframe/1, object/1, picture/2, portal/1, source/1, math/2, svg/2, canvas/1, noscript/2, script/2, del/2, ins/2, caption/2, col/1, colgroup/2, table/2, tbody/2, td/2, tfoot/2, th/2, thead/2, tr/2, button/2, datalist/2, fieldset/2, form/2, input/1, label/2, legend/2, meter/2, optgroup/2, option/2, output/2, progress/2, select/2, textarea/2, details/2, dialog/2, summary/2, slot/2, template/2]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

-file("src/lustre/element/html.gleam", 11).
?DOC("\n").
-spec html(
    list(lustre@vdom@vattr:attribute(HYZ)),
    list(lustre@vdom@vnode:element(HYZ))
) -> lustre@vdom@vnode:element(HYZ).
html(Attrs, Children) ->
    lustre@element:element(<<"html"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 18).
-spec text(binary()) -> lustre@vdom@vnode:element(any()).
text(Content) ->
    lustre@element:text(Content).

-file("src/lustre/element/html.gleam", 25).
?DOC("\n").
-spec base(list(lustre@vdom@vattr:attribute(HZH))) -> lustre@vdom@vnode:element(HZH).
base(Attrs) ->
    lustre@element:element(<<"base"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 30).
?DOC("\n").
-spec head(
    list(lustre@vdom@vattr:attribute(HZL)),
    list(lustre@vdom@vnode:element(HZL))
) -> lustre@vdom@vnode:element(HZL).
head(Attrs, Children) ->
    lustre@element:element(<<"head"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 38).
?DOC("\n").
-spec link(list(lustre@vdom@vattr:attribute(HZR))) -> lustre@vdom@vnode:element(HZR).
link(Attrs) ->
    lustre@element:element(<<"link"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 43).
?DOC("\n").
-spec meta(list(lustre@vdom@vattr:attribute(HZV))) -> lustre@vdom@vnode:element(HZV).
meta(Attrs) ->
    lustre@element:element(<<"meta"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 48).
?DOC("\n").
-spec style(list(lustre@vdom@vattr:attribute(HZZ)), binary()) -> lustre@vdom@vnode:element(HZZ).
style(Attrs, Css) ->
    lustre@element:unsafe_raw_html(<<""/utf8>>, <<"style"/utf8>>, Attrs, Css).

-file("src/lustre/element/html.gleam", 53).
?DOC("\n").
-spec title(list(lustre@vdom@vattr:attribute(IAD)), binary()) -> lustre@vdom@vnode:element(IAD).
title(Attrs, Content) ->
    lustre@element:element(<<"title"/utf8>>, Attrs, [text(Content)]).

-file("src/lustre/element/html.gleam", 60).
?DOC("\n").
-spec body(
    list(lustre@vdom@vattr:attribute(IAH)),
    list(lustre@vdom@vnode:element(IAH))
) -> lustre@vdom@vnode:element(IAH).
body(Attrs, Children) ->
    lustre@element:element(<<"body"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 70).
?DOC("\n").
-spec address(
    list(lustre@vdom@vattr:attribute(IAN)),
    list(lustre@vdom@vnode:element(IAN))
) -> lustre@vdom@vnode:element(IAN).
address(Attrs, Children) ->
    lustre@element:element(<<"address"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 78).
?DOC("\n").
-spec article(
    list(lustre@vdom@vattr:attribute(IAT)),
    list(lustre@vdom@vnode:element(IAT))
) -> lustre@vdom@vnode:element(IAT).
article(Attrs, Children) ->
    lustre@element:element(<<"article"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 86).
?DOC("\n").
-spec aside(
    list(lustre@vdom@vattr:attribute(IAZ)),
    list(lustre@vdom@vnode:element(IAZ))
) -> lustre@vdom@vnode:element(IAZ).
aside(Attrs, Children) ->
    lustre@element:element(<<"aside"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 94).
?DOC("\n").
-spec footer(
    list(lustre@vdom@vattr:attribute(IBF)),
    list(lustre@vdom@vnode:element(IBF))
) -> lustre@vdom@vnode:element(IBF).
footer(Attrs, Children) ->
    lustre@element:element(<<"footer"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 102).
?DOC("\n").
-spec header(
    list(lustre@vdom@vattr:attribute(IBL)),
    list(lustre@vdom@vnode:element(IBL))
) -> lustre@vdom@vnode:element(IBL).
header(Attrs, Children) ->
    lustre@element:element(<<"header"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 110).
?DOC("\n").
-spec h1(
    list(lustre@vdom@vattr:attribute(IBR)),
    list(lustre@vdom@vnode:element(IBR))
) -> lustre@vdom@vnode:element(IBR).
h1(Attrs, Children) ->
    lustre@element:element(<<"h1"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 118).
?DOC("\n").
-spec h2(
    list(lustre@vdom@vattr:attribute(IBX)),
    list(lustre@vdom@vnode:element(IBX))
) -> lustre@vdom@vnode:element(IBX).
h2(Attrs, Children) ->
    lustre@element:element(<<"h2"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 126).
?DOC("\n").
-spec h3(
    list(lustre@vdom@vattr:attribute(ICD)),
    list(lustre@vdom@vnode:element(ICD))
) -> lustre@vdom@vnode:element(ICD).
h3(Attrs, Children) ->
    lustre@element:element(<<"h3"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 134).
?DOC("\n").
-spec h4(
    list(lustre@vdom@vattr:attribute(ICJ)),
    list(lustre@vdom@vnode:element(ICJ))
) -> lustre@vdom@vnode:element(ICJ).
h4(Attrs, Children) ->
    lustre@element:element(<<"h4"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 142).
?DOC("\n").
-spec h5(
    list(lustre@vdom@vattr:attribute(ICP)),
    list(lustre@vdom@vnode:element(ICP))
) -> lustre@vdom@vnode:element(ICP).
h5(Attrs, Children) ->
    lustre@element:element(<<"h5"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 150).
?DOC("\n").
-spec h6(
    list(lustre@vdom@vattr:attribute(ICV)),
    list(lustre@vdom@vnode:element(ICV))
) -> lustre@vdom@vnode:element(ICV).
h6(Attrs, Children) ->
    lustre@element:element(<<"h6"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 158).
?DOC("\n").
-spec hgroup(
    list(lustre@vdom@vattr:attribute(IDB)),
    list(lustre@vdom@vnode:element(IDB))
) -> lustre@vdom@vnode:element(IDB).
hgroup(Attrs, Children) ->
    lustre@element:element(<<"hgroup"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 166).
?DOC("\n").
-spec main(
    list(lustre@vdom@vattr:attribute(IDH)),
    list(lustre@vdom@vnode:element(IDH))
) -> lustre@vdom@vnode:element(IDH).
main(Attrs, Children) ->
    lustre@element:element(<<"main"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 174).
?DOC("\n").
-spec nav(
    list(lustre@vdom@vattr:attribute(IDN)),
    list(lustre@vdom@vnode:element(IDN))
) -> lustre@vdom@vnode:element(IDN).
nav(Attrs, Children) ->
    lustre@element:element(<<"nav"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 182).
?DOC("\n").
-spec section(
    list(lustre@vdom@vattr:attribute(IDT)),
    list(lustre@vdom@vnode:element(IDT))
) -> lustre@vdom@vnode:element(IDT).
section(Attrs, Children) ->
    lustre@element:element(<<"section"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 190).
?DOC("\n").
-spec search(
    list(lustre@vdom@vattr:attribute(IDZ)),
    list(lustre@vdom@vnode:element(IDZ))
) -> lustre@vdom@vnode:element(IDZ).
search(Attrs, Children) ->
    lustre@element:element(<<"search"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 200).
?DOC("\n").
-spec blockquote(
    list(lustre@vdom@vattr:attribute(IEF)),
    list(lustre@vdom@vnode:element(IEF))
) -> lustre@vdom@vnode:element(IEF).
blockquote(Attrs, Children) ->
    lustre@element:element(<<"blockquote"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 208).
?DOC("\n").
-spec dd(
    list(lustre@vdom@vattr:attribute(IEL)),
    list(lustre@vdom@vnode:element(IEL))
) -> lustre@vdom@vnode:element(IEL).
dd(Attrs, Children) ->
    lustre@element:element(<<"dd"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 216).
?DOC("\n").
-spec 'div'(
    list(lustre@vdom@vattr:attribute(IER)),
    list(lustre@vdom@vnode:element(IER))
) -> lustre@vdom@vnode:element(IER).
'div'(Attrs, Children) ->
    lustre@element:element(<<"div"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 224).
?DOC("\n").
-spec dl(
    list(lustre@vdom@vattr:attribute(IEX)),
    list(lustre@vdom@vnode:element(IEX))
) -> lustre@vdom@vnode:element(IEX).
dl(Attrs, Children) ->
    lustre@element:element(<<"dl"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 232).
?DOC("\n").
-spec dt(
    list(lustre@vdom@vattr:attribute(IFD)),
    list(lustre@vdom@vnode:element(IFD))
) -> lustre@vdom@vnode:element(IFD).
dt(Attrs, Children) ->
    lustre@element:element(<<"dt"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 240).
?DOC("\n").
-spec figcaption(
    list(lustre@vdom@vattr:attribute(IFJ)),
    list(lustre@vdom@vnode:element(IFJ))
) -> lustre@vdom@vnode:element(IFJ).
figcaption(Attrs, Children) ->
    lustre@element:element(<<"figcaption"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 248).
?DOC("\n").
-spec figure(
    list(lustre@vdom@vattr:attribute(IFP)),
    list(lustre@vdom@vnode:element(IFP))
) -> lustre@vdom@vnode:element(IFP).
figure(Attrs, Children) ->
    lustre@element:element(<<"figure"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 256).
?DOC("\n").
-spec hr(list(lustre@vdom@vattr:attribute(IFV))) -> lustre@vdom@vnode:element(IFV).
hr(Attrs) ->
    lustre@element:element(<<"hr"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 261).
?DOC("\n").
-spec li(
    list(lustre@vdom@vattr:attribute(IFZ)),
    list(lustre@vdom@vnode:element(IFZ))
) -> lustre@vdom@vnode:element(IFZ).
li(Attrs, Children) ->
    lustre@element:element(<<"li"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 269).
?DOC("\n").
-spec menu(
    list(lustre@vdom@vattr:attribute(IGF)),
    list(lustre@vdom@vnode:element(IGF))
) -> lustre@vdom@vnode:element(IGF).
menu(Attrs, Children) ->
    lustre@element:element(<<"menu"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 277).
?DOC("\n").
-spec ol(
    list(lustre@vdom@vattr:attribute(IGL)),
    list(lustre@vdom@vnode:element(IGL))
) -> lustre@vdom@vnode:element(IGL).
ol(Attrs, Children) ->
    lustre@element:element(<<"ol"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 285).
?DOC("\n").
-spec p(
    list(lustre@vdom@vattr:attribute(IGR)),
    list(lustre@vdom@vnode:element(IGR))
) -> lustre@vdom@vnode:element(IGR).
p(Attrs, Children) ->
    lustre@element:element(<<"p"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 293).
?DOC("\n").
-spec pre(
    list(lustre@vdom@vattr:attribute(IGX)),
    list(lustre@vdom@vnode:element(IGX))
) -> lustre@vdom@vnode:element(IGX).
pre(Attrs, Children) ->
    lustre@element:element(<<"pre"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 301).
?DOC("\n").
-spec ul(
    list(lustre@vdom@vattr:attribute(IHD)),
    list(lustre@vdom@vnode:element(IHD))
) -> lustre@vdom@vnode:element(IHD).
ul(Attrs, Children) ->
    lustre@element:element(<<"ul"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 311).
?DOC("\n").
-spec a(
    list(lustre@vdom@vattr:attribute(IHJ)),
    list(lustre@vdom@vnode:element(IHJ))
) -> lustre@vdom@vnode:element(IHJ).
a(Attrs, Children) ->
    lustre@element:element(<<"a"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 319).
?DOC("\n").
-spec abbr(
    list(lustre@vdom@vattr:attribute(IHP)),
    list(lustre@vdom@vnode:element(IHP))
) -> lustre@vdom@vnode:element(IHP).
abbr(Attrs, Children) ->
    lustre@element:element(<<"abbr"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 327).
?DOC("\n").
-spec b(
    list(lustre@vdom@vattr:attribute(IHV)),
    list(lustre@vdom@vnode:element(IHV))
) -> lustre@vdom@vnode:element(IHV).
b(Attrs, Children) ->
    lustre@element:element(<<"b"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 335).
?DOC("\n").
-spec bdi(
    list(lustre@vdom@vattr:attribute(IIB)),
    list(lustre@vdom@vnode:element(IIB))
) -> lustre@vdom@vnode:element(IIB).
bdi(Attrs, Children) ->
    lustre@element:element(<<"bdi"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 343).
?DOC("\n").
-spec bdo(
    list(lustre@vdom@vattr:attribute(IIH)),
    list(lustre@vdom@vnode:element(IIH))
) -> lustre@vdom@vnode:element(IIH).
bdo(Attrs, Children) ->
    lustre@element:element(<<"bdo"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 351).
?DOC("\n").
-spec br(list(lustre@vdom@vattr:attribute(IIN))) -> lustre@vdom@vnode:element(IIN).
br(Attrs) ->
    lustre@element:element(<<"br"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 356).
?DOC("\n").
-spec cite(
    list(lustre@vdom@vattr:attribute(IIR)),
    list(lustre@vdom@vnode:element(IIR))
) -> lustre@vdom@vnode:element(IIR).
cite(Attrs, Children) ->
    lustre@element:element(<<"cite"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 364).
?DOC("\n").
-spec code(
    list(lustre@vdom@vattr:attribute(IIX)),
    list(lustre@vdom@vnode:element(IIX))
) -> lustre@vdom@vnode:element(IIX).
code(Attrs, Children) ->
    lustre@element:element(<<"code"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 372).
?DOC("\n").
-spec data(
    list(lustre@vdom@vattr:attribute(IJD)),
    list(lustre@vdom@vnode:element(IJD))
) -> lustre@vdom@vnode:element(IJD).
data(Attrs, Children) ->
    lustre@element:element(<<"data"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 380).
?DOC("\n").
-spec dfn(
    list(lustre@vdom@vattr:attribute(IJJ)),
    list(lustre@vdom@vnode:element(IJJ))
) -> lustre@vdom@vnode:element(IJJ).
dfn(Attrs, Children) ->
    lustre@element:element(<<"dfn"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 388).
?DOC("\n").
-spec em(
    list(lustre@vdom@vattr:attribute(IJP)),
    list(lustre@vdom@vnode:element(IJP))
) -> lustre@vdom@vnode:element(IJP).
em(Attrs, Children) ->
    lustre@element:element(<<"em"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 396).
?DOC("\n").
-spec i(
    list(lustre@vdom@vattr:attribute(IJV)),
    list(lustre@vdom@vnode:element(IJV))
) -> lustre@vdom@vnode:element(IJV).
i(Attrs, Children) ->
    lustre@element:element(<<"i"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 404).
?DOC("\n").
-spec kbd(
    list(lustre@vdom@vattr:attribute(IKB)),
    list(lustre@vdom@vnode:element(IKB))
) -> lustre@vdom@vnode:element(IKB).
kbd(Attrs, Children) ->
    lustre@element:element(<<"kbd"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 412).
?DOC("\n").
-spec mark(
    list(lustre@vdom@vattr:attribute(IKH)),
    list(lustre@vdom@vnode:element(IKH))
) -> lustre@vdom@vnode:element(IKH).
mark(Attrs, Children) ->
    lustre@element:element(<<"mark"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 420).
?DOC("\n").
-spec q(
    list(lustre@vdom@vattr:attribute(IKN)),
    list(lustre@vdom@vnode:element(IKN))
) -> lustre@vdom@vnode:element(IKN).
q(Attrs, Children) ->
    lustre@element:element(<<"q"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 428).
?DOC("\n").
-spec rp(
    list(lustre@vdom@vattr:attribute(IKT)),
    list(lustre@vdom@vnode:element(IKT))
) -> lustre@vdom@vnode:element(IKT).
rp(Attrs, Children) ->
    lustre@element:element(<<"rp"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 436).
?DOC("\n").
-spec rt(
    list(lustre@vdom@vattr:attribute(IKZ)),
    list(lustre@vdom@vnode:element(IKZ))
) -> lustre@vdom@vnode:element(IKZ).
rt(Attrs, Children) ->
    lustre@element:element(<<"rt"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 444).
?DOC("\n").
-spec ruby(
    list(lustre@vdom@vattr:attribute(ILF)),
    list(lustre@vdom@vnode:element(ILF))
) -> lustre@vdom@vnode:element(ILF).
ruby(Attrs, Children) ->
    lustre@element:element(<<"ruby"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 452).
?DOC("\n").
-spec s(
    list(lustre@vdom@vattr:attribute(ILL)),
    list(lustre@vdom@vnode:element(ILL))
) -> lustre@vdom@vnode:element(ILL).
s(Attrs, Children) ->
    lustre@element:element(<<"s"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 460).
?DOC("\n").
-spec samp(
    list(lustre@vdom@vattr:attribute(ILR)),
    list(lustre@vdom@vnode:element(ILR))
) -> lustre@vdom@vnode:element(ILR).
samp(Attrs, Children) ->
    lustre@element:element(<<"samp"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 468).
?DOC("\n").
-spec small(
    list(lustre@vdom@vattr:attribute(ILX)),
    list(lustre@vdom@vnode:element(ILX))
) -> lustre@vdom@vnode:element(ILX).
small(Attrs, Children) ->
    lustre@element:element(<<"small"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 476).
?DOC("\n").
-spec span(
    list(lustre@vdom@vattr:attribute(IMD)),
    list(lustre@vdom@vnode:element(IMD))
) -> lustre@vdom@vnode:element(IMD).
span(Attrs, Children) ->
    lustre@element:element(<<"span"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 484).
?DOC("\n").
-spec strong(
    list(lustre@vdom@vattr:attribute(IMJ)),
    list(lustre@vdom@vnode:element(IMJ))
) -> lustre@vdom@vnode:element(IMJ).
strong(Attrs, Children) ->
    lustre@element:element(<<"strong"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 492).
?DOC("\n").
-spec sub(
    list(lustre@vdom@vattr:attribute(IMP)),
    list(lustre@vdom@vnode:element(IMP))
) -> lustre@vdom@vnode:element(IMP).
sub(Attrs, Children) ->
    lustre@element:element(<<"sub"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 500).
?DOC("\n").
-spec sup(
    list(lustre@vdom@vattr:attribute(IMV)),
    list(lustre@vdom@vnode:element(IMV))
) -> lustre@vdom@vnode:element(IMV).
sup(Attrs, Children) ->
    lustre@element:element(<<"sup"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 508).
?DOC("\n").
-spec time(
    list(lustre@vdom@vattr:attribute(INB)),
    list(lustre@vdom@vnode:element(INB))
) -> lustre@vdom@vnode:element(INB).
time(Attrs, Children) ->
    lustre@element:element(<<"time"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 516).
?DOC("\n").
-spec u(
    list(lustre@vdom@vattr:attribute(INH)),
    list(lustre@vdom@vnode:element(INH))
) -> lustre@vdom@vnode:element(INH).
u(Attrs, Children) ->
    lustre@element:element(<<"u"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 524).
?DOC("\n").
-spec var(
    list(lustre@vdom@vattr:attribute(INN)),
    list(lustre@vdom@vnode:element(INN))
) -> lustre@vdom@vnode:element(INN).
var(Attrs, Children) ->
    lustre@element:element(<<"var"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 532).
?DOC("\n").
-spec wbr(list(lustre@vdom@vattr:attribute(INT))) -> lustre@vdom@vnode:element(INT).
wbr(Attrs) ->
    lustre@element:element(<<"wbr"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 539).
?DOC("\n").
-spec area(list(lustre@vdom@vattr:attribute(INX))) -> lustre@vdom@vnode:element(INX).
area(Attrs) ->
    lustre@element:element(<<"area"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 544).
?DOC("\n").
-spec audio(
    list(lustre@vdom@vattr:attribute(IOB)),
    list(lustre@vdom@vnode:element(IOB))
) -> lustre@vdom@vnode:element(IOB).
audio(Attrs, Children) ->
    lustre@element:element(<<"audio"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 552).
?DOC("\n").
-spec img(list(lustre@vdom@vattr:attribute(IOH))) -> lustre@vdom@vnode:element(IOH).
img(Attrs) ->
    lustre@element:element(<<"img"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 558).
?DOC(" Used with <area> elements to define an image map (a clickable link area).\n").
-spec map(
    list(lustre@vdom@vattr:attribute(IOL)),
    list(lustre@vdom@vnode:element(IOL))
) -> lustre@vdom@vnode:element(IOL).
map(Attrs, Children) ->
    lustre@element:element(<<"map"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 566).
?DOC("\n").
-spec track(list(lustre@vdom@vattr:attribute(IOR))) -> lustre@vdom@vnode:element(IOR).
track(Attrs) ->
    lustre@element:element(<<"track"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 571).
?DOC("\n").
-spec video(
    list(lustre@vdom@vattr:attribute(IOV)),
    list(lustre@vdom@vnode:element(IOV))
) -> lustre@vdom@vnode:element(IOV).
video(Attrs, Children) ->
    lustre@element:element(<<"video"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 581).
?DOC("\n").
-spec embed(list(lustre@vdom@vattr:attribute(IPB))) -> lustre@vdom@vnode:element(IPB).
embed(Attrs) ->
    lustre@element:element(<<"embed"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 586).
?DOC("\n").
-spec iframe(list(lustre@vdom@vattr:attribute(IPF))) -> lustre@vdom@vnode:element(IPF).
iframe(Attrs) ->
    lustre@element:element(<<"iframe"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 591).
?DOC("\n").
-spec object(list(lustre@vdom@vattr:attribute(IPJ))) -> lustre@vdom@vnode:element(IPJ).
object(Attrs) ->
    lustre@element:element(<<"object"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 596).
?DOC("\n").
-spec picture(
    list(lustre@vdom@vattr:attribute(IPN)),
    list(lustre@vdom@vnode:element(IPN))
) -> lustre@vdom@vnode:element(IPN).
picture(Attrs, Children) ->
    lustre@element:element(<<"picture"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 604).
?DOC("\n").
-spec portal(list(lustre@vdom@vattr:attribute(IPT))) -> lustre@vdom@vnode:element(IPT).
portal(Attrs) ->
    lustre@element:element(<<"portal"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 609).
?DOC("\n").
-spec source(list(lustre@vdom@vattr:attribute(IPX))) -> lustre@vdom@vnode:element(IPX).
source(Attrs) ->
    lustre@element:element(<<"source"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 616).
?DOC("\n").
-spec math(
    list(lustre@vdom@vattr:attribute(IQB)),
    list(lustre@vdom@vnode:element(IQB))
) -> lustre@vdom@vnode:element(IQB).
math(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/1998/Math/MathML"/utf8>>,
        <<"math"/utf8>>,
        Attrs,
        Children
    ).

-file("src/lustre/element/html.gleam", 624).
?DOC("\n").
-spec svg(
    list(lustre@vdom@vattr:attribute(IQH)),
    list(lustre@vdom@vnode:element(IQH))
) -> lustre@vdom@vnode:element(IQH).
svg(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"svg"/utf8>>,
        Attrs,
        Children
    ).

-file("src/lustre/element/html.gleam", 634).
?DOC("\n").
-spec canvas(list(lustre@vdom@vattr:attribute(IQN))) -> lustre@vdom@vnode:element(IQN).
canvas(Attrs) ->
    lustre@element:element(<<"canvas"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 639).
?DOC("\n").
-spec noscript(
    list(lustre@vdom@vattr:attribute(IQR)),
    list(lustre@vdom@vnode:element(IQR))
) -> lustre@vdom@vnode:element(IQR).
noscript(Attrs, Children) ->
    lustre@element:element(<<"noscript"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 647).
?DOC("\n").
-spec script(list(lustre@vdom@vattr:attribute(IQX)), binary()) -> lustre@vdom@vnode:element(IQX).
script(Attrs, Js) ->
    lustre@element:unsafe_raw_html(<<""/utf8>>, <<"script"/utf8>>, Attrs, Js).

-file("src/lustre/element/html.gleam", 654).
?DOC("\n").
-spec del(
    list(lustre@vdom@vattr:attribute(IRB)),
    list(lustre@vdom@vnode:element(IRB))
) -> lustre@vdom@vnode:element(IRB).
del(Attrs, Children) ->
    lustre@element:element(<<"del"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 662).
?DOC("\n").
-spec ins(
    list(lustre@vdom@vattr:attribute(IRH)),
    list(lustre@vdom@vnode:element(IRH))
) -> lustre@vdom@vnode:element(IRH).
ins(Attrs, Children) ->
    lustre@element:element(<<"ins"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 672).
?DOC("\n").
-spec caption(
    list(lustre@vdom@vattr:attribute(IRN)),
    list(lustre@vdom@vnode:element(IRN))
) -> lustre@vdom@vnode:element(IRN).
caption(Attrs, Children) ->
    lustre@element:element(<<"caption"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 680).
?DOC("\n").
-spec col(list(lustre@vdom@vattr:attribute(IRT))) -> lustre@vdom@vnode:element(IRT).
col(Attrs) ->
    lustre@element:element(<<"col"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 685).
?DOC("\n").
-spec colgroup(
    list(lustre@vdom@vattr:attribute(IRX)),
    list(lustre@vdom@vnode:element(IRX))
) -> lustre@vdom@vnode:element(IRX).
colgroup(Attrs, Children) ->
    lustre@element:element(<<"colgroup"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 693).
?DOC("\n").
-spec table(
    list(lustre@vdom@vattr:attribute(ISD)),
    list(lustre@vdom@vnode:element(ISD))
) -> lustre@vdom@vnode:element(ISD).
table(Attrs, Children) ->
    lustre@element:element(<<"table"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 701).
?DOC("\n").
-spec tbody(
    list(lustre@vdom@vattr:attribute(ISJ)),
    list(lustre@vdom@vnode:element(ISJ))
) -> lustre@vdom@vnode:element(ISJ).
tbody(Attrs, Children) ->
    lustre@element:element(<<"tbody"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 709).
?DOC("\n").
-spec td(
    list(lustre@vdom@vattr:attribute(ISP)),
    list(lustre@vdom@vnode:element(ISP))
) -> lustre@vdom@vnode:element(ISP).
td(Attrs, Children) ->
    lustre@element:element(<<"td"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 717).
?DOC("\n").
-spec tfoot(
    list(lustre@vdom@vattr:attribute(ISV)),
    list(lustre@vdom@vnode:element(ISV))
) -> lustre@vdom@vnode:element(ISV).
tfoot(Attrs, Children) ->
    lustre@element:element(<<"tfoot"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 725).
?DOC("\n").
-spec th(
    list(lustre@vdom@vattr:attribute(ITB)),
    list(lustre@vdom@vnode:element(ITB))
) -> lustre@vdom@vnode:element(ITB).
th(Attrs, Children) ->
    lustre@element:element(<<"th"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 733).
?DOC("\n").
-spec thead(
    list(lustre@vdom@vattr:attribute(ITH)),
    list(lustre@vdom@vnode:element(ITH))
) -> lustre@vdom@vnode:element(ITH).
thead(Attrs, Children) ->
    lustre@element:element(<<"thead"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 741).
?DOC("\n").
-spec tr(
    list(lustre@vdom@vattr:attribute(ITN)),
    list(lustre@vdom@vnode:element(ITN))
) -> lustre@vdom@vnode:element(ITN).
tr(Attrs, Children) ->
    lustre@element:element(<<"tr"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 751).
?DOC("\n").
-spec button(
    list(lustre@vdom@vattr:attribute(ITT)),
    list(lustre@vdom@vnode:element(ITT))
) -> lustre@vdom@vnode:element(ITT).
button(Attrs, Children) ->
    lustre@element:element(<<"button"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 759).
?DOC("\n").
-spec datalist(
    list(lustre@vdom@vattr:attribute(ITZ)),
    list(lustre@vdom@vnode:element(ITZ))
) -> lustre@vdom@vnode:element(ITZ).
datalist(Attrs, Children) ->
    lustre@element:element(<<"datalist"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 767).
?DOC("\n").
-spec fieldset(
    list(lustre@vdom@vattr:attribute(IUF)),
    list(lustre@vdom@vnode:element(IUF))
) -> lustre@vdom@vnode:element(IUF).
fieldset(Attrs, Children) ->
    lustre@element:element(<<"fieldset"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 775).
?DOC("\n").
-spec form(
    list(lustre@vdom@vattr:attribute(IUL)),
    list(lustre@vdom@vnode:element(IUL))
) -> lustre@vdom@vnode:element(IUL).
form(Attrs, Children) ->
    lustre@element:element(<<"form"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 783).
?DOC("\n").
-spec input(list(lustre@vdom@vattr:attribute(IUR))) -> lustre@vdom@vnode:element(IUR).
input(Attrs) ->
    lustre@element:element(<<"input"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 788).
?DOC("\n").
-spec label(
    list(lustre@vdom@vattr:attribute(IUV)),
    list(lustre@vdom@vnode:element(IUV))
) -> lustre@vdom@vnode:element(IUV).
label(Attrs, Children) ->
    lustre@element:element(<<"label"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 796).
?DOC("\n").
-spec legend(
    list(lustre@vdom@vattr:attribute(IVB)),
    list(lustre@vdom@vnode:element(IVB))
) -> lustre@vdom@vnode:element(IVB).
legend(Attrs, Children) ->
    lustre@element:element(<<"legend"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 804).
?DOC("\n").
-spec meter(
    list(lustre@vdom@vattr:attribute(IVH)),
    list(lustre@vdom@vnode:element(IVH))
) -> lustre@vdom@vnode:element(IVH).
meter(Attrs, Children) ->
    lustre@element:element(<<"meter"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 812).
?DOC("\n").
-spec optgroup(
    list(lustre@vdom@vattr:attribute(IVN)),
    list(lustre@vdom@vnode:element(IVN))
) -> lustre@vdom@vnode:element(IVN).
optgroup(Attrs, Children) ->
    lustre@element:element(<<"optgroup"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 820).
?DOC("\n").
-spec option(list(lustre@vdom@vattr:attribute(IVT)), binary()) -> lustre@vdom@vnode:element(IVT).
option(Attrs, Label) ->
    lustre@element:element(
        <<"option"/utf8>>,
        Attrs,
        [lustre@element:text(Label)]
    ).

-file("src/lustre/element/html.gleam", 825).
?DOC("\n").
-spec output(
    list(lustre@vdom@vattr:attribute(IVX)),
    list(lustre@vdom@vnode:element(IVX))
) -> lustre@vdom@vnode:element(IVX).
output(Attrs, Children) ->
    lustre@element:element(<<"output"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 833).
?DOC("\n").
-spec progress(
    list(lustre@vdom@vattr:attribute(IWD)),
    list(lustre@vdom@vnode:element(IWD))
) -> lustre@vdom@vnode:element(IWD).
progress(Attrs, Children) ->
    lustre@element:element(<<"progress"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 841).
?DOC("\n").
-spec select(
    list(lustre@vdom@vattr:attribute(IWJ)),
    list(lustre@vdom@vnode:element(IWJ))
) -> lustre@vdom@vnode:element(IWJ).
select(Attrs, Children) ->
    lustre@element:element(<<"select"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 849).
?DOC("\n").
-spec textarea(list(lustre@vdom@vattr:attribute(IWP)), binary()) -> lustre@vdom@vnode:element(IWP).
textarea(Attrs, Content) ->
    lustre@element:element(
        <<"textarea"/utf8>>,
        [lustre@attribute:property(<<"value"/utf8>>, gleam@json:string(Content)) |
            Attrs],
        [lustre@element:text(Content)]
    ).

-file("src/lustre/element/html.gleam", 860).
?DOC("\n").
-spec details(
    list(lustre@vdom@vattr:attribute(IWT)),
    list(lustre@vdom@vnode:element(IWT))
) -> lustre@vdom@vnode:element(IWT).
details(Attrs, Children) ->
    lustre@element:element(<<"details"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 868).
?DOC("\n").
-spec dialog(
    list(lustre@vdom@vattr:attribute(IWZ)),
    list(lustre@vdom@vnode:element(IWZ))
) -> lustre@vdom@vnode:element(IWZ).
dialog(Attrs, Children) ->
    lustre@element:element(<<"dialog"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 876).
?DOC("\n").
-spec summary(
    list(lustre@vdom@vattr:attribute(IXF)),
    list(lustre@vdom@vnode:element(IXF))
) -> lustre@vdom@vnode:element(IXF).
summary(Attrs, Children) ->
    lustre@element:element(<<"summary"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 886).
?DOC("\n").
-spec slot(
    list(lustre@vdom@vattr:attribute(IXL)),
    list(lustre@vdom@vnode:element(IXL))
) -> lustre@vdom@vnode:element(IXL).
slot(Attrs, Fallback) ->
    lustre@element:element(<<"slot"/utf8>>, Attrs, Fallback).

-file("src/lustre/element/html.gleam", 894).
?DOC("\n").
-spec template(
    list(lustre@vdom@vattr:attribute(IXR)),
    list(lustre@vdom@vnode:element(IXR))
) -> lustre@vdom@vnode:element(IXR).
template(Attrs, Children) ->
    lustre@element:element(<<"template"/utf8>>, Attrs, Children).
