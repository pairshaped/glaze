//@ts-check

import { variant_to_string, placement_to_string } from "./toast.mjs";

/**
 * Displays a toast notification.
 *
 * This is a thin wrapper around the imported `ot.toast` function.
 * It normalizes the provided `variant` and `placement` values
 * using `variant_to_string` and `placement_to_string`.
 *
 * @param {string} title - The main heading text of the toast notification.
 * @param {string} description - Additional descriptive text shown below the title.
 * @param {import("../../../build/dev/javascript/glaze_oat/glaze/oat/toast.mjs").Options} options
 *
 * @returns {void}
 *
 * @example
 * toast("Success", "Your changes have been saved.", {
 *   variant: "success",
 *   placement: "top-right",
 *   duration_ms: 3000,
 * });
 */
export function toast(title, description, options) {
  let options_args = {
    variant: variant_to_string(options.variant),
    placement: placement_to_string(options.placement),
    duration: options.duration_ms,
  };
  ot.toast(title, description, options_args);
}
