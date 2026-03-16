import * as $attribute from "../../lustre/lustre/attribute.mjs";
import { attribute } from "../../lustre/lustre/attribute.mjs";
import * as $element from "../../lustre/lustre/element.mjs";
import * as $html from "../../lustre/lustre/element/html.mjs";
import * as $theme from "../glaze/basecoat/theme.mjs";
import { toList } from "../gleam.mjs";

/**
 * The latest supported version of Basecoat that is verified to work
 * and all components have been mapped for.
 *
 * All releases are available here: https://github.com/hunvreus/basecoat/releases
 */
export const version = "0.3.11";

/**
 * <style> element that imports the Basecoat JavaScript from a CDN.
 *
 * This includes the JavaScript for all components.
 *
 * ### Example
 *
 * ```gleam
 * import glaze/basecoat
 *
 * html.head([], [
 *   // Your Tailwind CSS import...
 *   basecoat.cdn_script(basecoat.version),
 * ])
 * ```
 */
export function cdn_script(v) {
  return $html.script(
    toList([
      attribute("defer", "defer"),
      $attribute.src(
        ("https://cdn.jsdelivr.net/npm/basecoat-css@" + v) + "/dist/js/all.min.js",
      ),
    ]),
    "",
  );
}

/**
 * <style> tag that loads the Basecoat CSS from a CDN.
 *
 * ### Example
 *
 * ```gleam
 * import glaze/basecoat
 *
 * html.head([], [
 *   basecoat.cdn_stylesheet(basecoat.version),
 * ])
 * ```
 */
export function cdn_stylesheet(v) {
  return $element.fragment(
    toList([
      $html.link(
        toList([
          $attribute.rel("stylesheet"),
          $attribute.href(
            ("https://cdn.jsdelivr.net/npm/basecoat-css@" + v) + "/dist/basecoat.cdn.min.css",
          ),
        ]),
      ),
      $theme.tailwind_bridge_style_tag(),
    ]),
  );
}

/**
 * Register Basecoat UI CSS and JavaScript from a CDN.
 *
 * This includes the styles and logic for all components.
 *
 * ### Example
 *
 * ```gleam
 * import glaze/basecoat
 *
 * html.head([], [
 *   basecoat.register(basecoat.version),
 * ])
 * ```
 */
export function register(v) {
  return $element.fragment(toList([cdn_stylesheet(v), cdn_script(v)]));
}
