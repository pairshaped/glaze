import * as $button from "../glaze_basecoat/glaze/basecoat/button.mjs";
import * as $card from "../glaze_basecoat/glaze/basecoat/card.mjs";
import * as $toast from "../glaze_basecoat/glaze/basecoat/toast.mjs";
import * as $int from "../gleam_stdlib/gleam/int.mjs";
import * as $option from "../gleam_stdlib/gleam/option.mjs";
import { None } from "../gleam_stdlib/gleam/option.mjs";
import * as $lustre from "../lustre/lustre.mjs";
import * as $attribute from "../lustre/lustre/attribute.mjs";
import * as $effect from "../lustre/lustre/effect.mjs";
import * as $element from "../lustre/lustre/element.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import * as $event from "../lustre/lustre/event.mjs";
import { Ok, toList, CustomType as $CustomType, makeError } from "./gleam.mjs";

const FILEPATH = "src/app.gleam";

export class Model extends $CustomType {
  constructor(counter) {
    super();
    this.counter = counter;
  }
}
export const Model$Model = (counter) => new Model(counter);
export const Model$isModel = (value) => value instanceof Model;
export const Model$Model$counter = (value) => value.counter;
export const Model$Model$0 = (value) => value.counter;

export class Increment extends $CustomType {}
export const Msg$Increment = () => new Increment();
export const Msg$isIncrement = (value) => value instanceof Increment;

export class Decrement extends $CustomType {}
export const Msg$Decrement = () => new Decrement();
export const Msg$isDecrement = (value) => value instanceof Decrement;

export class Alert extends $CustomType {
  constructor(message) {
    super();
    this.message = message;
  }
}
export const Msg$Alert = (message) => new Alert(message);
export const Msg$isAlert = (value) => value instanceof Alert;
export const Msg$Alert$message = (value) => value.message;
export const Msg$Alert$0 = (value) => value.message;

function init(_) {
  return [new Model(0), $effect.none()];
}

function alert(message) {
  return $effect.from(
    (_) => {
      return $toast.dispatch(
        new $toast.Config(
          new $toast.Info(),
          message,
          "",
          new None(),
          new None(),
        ),
      );
    },
  );
}

function update(model, msg) {
  let counter;
  counter = model.counter;
  let _block;
  if (msg instanceof Increment) {
    _block = new Model(counter + 1);
  } else if (msg instanceof Decrement) {
    _block = new Model(counter - 1);
  } else {
    _block = model;
  }
  let model$1 = _block;
  let _block$1;
  if (msg instanceof Alert) {
    let message = msg.message;
    _block$1 = alert(message);
  } else {
    _block$1 = $effect.none();
  }
  let effect = _block$1;
  return [model$1, effect];
}

export function view(model) {
  return $element.fragment(
    toList([
      $html.div(
        toList([$attribute.class$("p-10")]),
        toList([
          $card.card(
            toList([]),
            toList([
              $card.header(
                toList([]),
                toList([
                  $card.title(toList([]), toList([$html.text("Welcome")])),
                  $card.description(
                    toList([]),
                    toList([
                      $html.text("Counter: " + $int.to_string(model.counter)),
                    ]),
                  ),
                ]),
              ),
              $card.content(
                toList([$attribute.class$("space-x-2")]),
                toList([
                  $button.outline(
                    toList([$event.on_click(new Decrement())]),
                    toList([$html.text("Decrement")]),
                  ),
                  $button.outline(
                    toList([$event.on_click(new Increment())]),
                    toList([$html.text("Increment")]),
                  ),
                ]),
              ),
              $card.footer(
                toList([]),
                toList([
                  $button.button(
                    toList([$event.on_click(new Alert("Hi Haighley!"))]),
                    toList([$html.text("Cheers!")]),
                  ),
                ]),
              ),
            ]),
          ),
        ]),
      ),
      $toast.container_aligned(new $toast.AlignEnd(), toList([])),
    ]),
  );
}

export function main() {
  let app = $lustre.application(init, update, view);
  let $ = $lustre.start(app, "#app", undefined);
  if (!($ instanceof Ok)) {
    throw makeError(
      "let_assert",
      FILEPATH,
      "app",
      15,
      "main",
      "Pattern match failed, no pattern matched the value.",
      { value: $, start: 355, end: 404, pattern_start: 366, pattern_end: 371 }
    )
  }
  return undefined;
}
