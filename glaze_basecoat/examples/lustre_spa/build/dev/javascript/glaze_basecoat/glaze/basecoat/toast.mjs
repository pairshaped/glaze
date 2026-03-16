import * as $json from "../../../gleam_json/gleam/json.mjs";
import * as $int from "../../../gleam_stdlib/gleam/int.mjs";
import * as $option from "../../../gleam_stdlib/gleam/option.mjs";
import { None, Some } from "../../../gleam_stdlib/gleam/option.mjs";
import * as $string from "../../../gleam_stdlib/gleam/string.mjs";
import * as $attribute from "../../../lustre/lustre/attribute.mjs";
import * as $element from "../../../lustre/lustre/element.mjs";
import * as $html from "../../../lustre/lustre/element/html.mjs";
import { toList, prepend as listPrepend, CustomType as $CustomType } from "../../gleam.mjs";
import { dispatch } from "./toast_ffi.mjs";

export { dispatch };

export class AlignStart extends $CustomType {}
export const Alignment$AlignStart = () => new AlignStart();
export const Alignment$isAlignStart = (value) => value instanceof AlignStart;

export class AlignCenter extends $CustomType {}
export const Alignment$AlignCenter = () => new AlignCenter();
export const Alignment$isAlignCenter = (value) => value instanceof AlignCenter;

export class AlignEnd extends $CustomType {}
export const Alignment$AlignEnd = () => new AlignEnd();
export const Alignment$isAlignEnd = (value) => value instanceof AlignEnd;

export class Action extends $CustomType {
  constructor(label, onclick) {
    super();
    this.label = label;
    this.onclick = onclick;
  }
}
export const Action$Action = (label, onclick) => new Action(label, onclick);
export const Action$isAction = (value) => value instanceof Action;
export const Action$Action$label = (value) => value.label;
export const Action$Action$0 = (value) => value.label;
export const Action$Action$onclick = (value) => value.onclick;
export const Action$Action$1 = (value) => value.onclick;

export class Cancel extends $CustomType {
  constructor(label, onclick) {
    super();
    this.label = label;
    this.onclick = onclick;
  }
}
export const Cancel$Cancel = (label, onclick) => new Cancel(label, onclick);
export const Cancel$isCancel = (value) => value instanceof Cancel;
export const Cancel$Cancel$label = (value) => value.label;
export const Cancel$Cancel$0 = (value) => value.label;
export const Cancel$Cancel$onclick = (value) => value.onclick;
export const Cancel$Cancel$1 = (value) => value.onclick;

export class Success extends $CustomType {}
export const Category$Success = () => new Success();
export const Category$isSuccess = (value) => value instanceof Success;

export class Info extends $CustomType {}
export const Category$Info = () => new Info();
export const Category$isInfo = (value) => value instanceof Info;

export class Warning extends $CustomType {}
export const Category$Warning = () => new Warning();
export const Category$isWarning = (value) => value instanceof Warning;

export class Error extends $CustomType {}
export const Category$Error = () => new Error();
export const Category$isError = (value) => value instanceof Error;

export class Config extends $CustomType {
  constructor(category, title, description, action, cancel) {
    super();
    this.category = category;
    this.title = title;
    this.description = description;
    this.action = action;
    this.cancel = cancel;
  }
}
export const Config$Config = (category, title, description, action, cancel) =>
  new Config(category, title, description, action, cancel);
export const Config$isConfig = (value) => value instanceof Config;
export const Config$Config$category = (value) => value.category;
export const Config$Config$0 = (value) => value.category;
export const Config$Config$title = (value) => value.title;
export const Config$Config$1 = (value) => value.title;
export const Config$Config$description = (value) => value.description;
export const Config$Config$2 = (value) => value.description;
export const Config$Config$action = (value) => value.action;
export const Config$Config$3 = (value) => value.action;
export const Config$Config$cancel = (value) => value.cancel;
export const Config$Config$4 = (value) => value.cancel;

function alignment_to_string(align) {
  if (align instanceof AlignStart) {
    return "start";
  } else if (align instanceof AlignCenter) {
    return "center";
  } else {
    return "end";
  }
}

function action_to_json(action) {
  let label;
  let onclick;
  label = action.label;
  onclick = action.onclick;
  return $json.object(
    toList([
      ["label", $json.string(label)],
      [
        "onclick",
        (() => {
          if (onclick instanceof Some) {
            let value = onclick[0];
            return $json.string(value);
          } else {
            return $json.null$();
          }
        })(),
      ],
    ]),
  );
}

function cancel_to_json(cancel) {
  let label;
  let onclick;
  label = cancel.label;
  onclick = cancel.onclick;
  return $json.object(
    toList([
      [
        "label",
        (() => {
          if (label instanceof Some) {
            let value = label[0];
            return $json.string(value);
          } else {
            return $json.null$();
          }
        })(),
      ],
      [
        "onclick",
        (() => {
          if (onclick instanceof Some) {
            let value = onclick[0];
            return $json.string(value);
          } else {
            return $json.null$();
          }
        })(),
      ],
    ]),
  );
}

function category_to_json(category) {
  if (category instanceof Success) {
    return $json.string("success");
  } else if (category instanceof Info) {
    return $json.string("info");
  } else if (category instanceof Warning) {
    return $json.string("warning");
  } else {
    return $json.string("error");
  }
}

export function config_to_json(config) {
  let category;
  let title$1;
  let description$1;
  let action;
  let cancel;
  category = config.category;
  title$1 = config.title;
  description$1 = config.description;
  action = config.action;
  cancel = config.cancel;
  return $json.object(
    toList([
      ["category", category_to_json(category)],
      ["title", $json.string(title$1)],
      ["description", $json.string(description$1)],
      [
        "action",
        (() => {
          if (action instanceof Some) {
            let value = action[0];
            return action_to_json(value);
          } else {
            return $json.null$();
          }
        })(),
      ],
      [
        "cancel",
        (() => {
          if (cancel instanceof Some) {
            let value = cancel[0];
            return cancel_to_json(value);
          } else {
            return $json.null$();
          }
        })(),
      ],
    ]),
  );
}

/**
 * Add the toaster container required for toast notifications.
 *
 * Place this at the end of your body element.
 *
 * ### Example
 *
 * ```gleam
 * import glaze/basecoat/toast
 *
 * html.body([], [
 *   // Your content...
 *   toast.container(),
 * ])
 * ```
 */
export function container(attrs) {
  return $html.div(
    listPrepend(
      $attribute.id("toaster"),
      listPrepend($attribute.class$("toaster"), attrs),
    ),
    toList([]),
  );
}

export function container_aligned(align, attrs) {
  return $html.div(
    listPrepend(
      $attribute.id("toaster"),
      listPrepend(
        $attribute.class$("toaster"),
        listPrepend($attribute.data("align", alignment_to_string(align)), attrs),
      ),
    ),
    toList([]),
  );
}

/**
 * An element to create a custom toast
 */
export function toast(attrs, children) {
  return $html.div(
    listPrepend(
      $attribute.class$("toast"),
      listPrepend(
        $attribute.role("status"),
        listPrepend(
          $attribute.aria_atomic(true),
          listPrepend($attribute.aria_hidden(false), attrs),
        ),
      ),
    ),
    toList([$html.div(toList([$attribute.class$("toast-content")]), children)]),
  );
}

export function success() {
  return $attribute.data("category", "success");
}

export function info() {
  return $attribute.data("category", "info");
}

export function warning() {
  return $attribute.data("category", "warning");
}

export function error() {
  return $attribute.data("category", "error");
}

export function duration(ms) {
  return $attribute.data("duration", $int.to_string(ms));
}

export function title(attrs, children) {
  return $html.h2(attrs, children);
}

export function description(attrs, children) {
  return $html.p(attrs, children);
}

export function content(attrs, children) {
  return $html.section(attrs, children);
}

export function footer(attrs, children) {
  return $html.footer(attrs, children);
}

export function action_button(label, attrs) {
  return $html.button(
    listPrepend(
      $attribute.type_("button"),
      listPrepend(
        $attribute.class$("btn"),
        listPrepend($attribute.data("toast-action", ""), attrs),
      ),
    ),
    toList([$html.text(label)]),
  );
}

export function cancel_button(label, attrs) {
  return $html.button(
    listPrepend(
      $attribute.type_("button"),
      listPrepend($attribute.class$("btn-outline"), attrs),
    ),
    toList([$html.text(label)]),
  );
}

export function serialize_dispatch(config) {
  let _block;
  let _pipe = config_to_json(config);
  _block = $json.to_string(_pipe);
  let payload = _block;
  return ("document.dispatchEvent(new CustomEvent('basecoat:toast', { detail: { config: { ..." + payload) + " } } }));";
}
