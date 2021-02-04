/**
 * In this file we are importing the FAST Foundation Button class and Button template
 * which provides the unstyled behavior and structure of a generic button.
 * A list of all the most current FAST Foundation components can be found here:
 *
 * https://github.com/microsoft/fast/tree/master/packages/web-components/fast-foundation/src
 *
 * We also import the customElement and css utility functions from FAST Element so that we
 * can add custom styles to the Button and then combine all the pieces (i.e. Button class,
 * Button template, and custom styles) to create a new Button element with our styles.
 */

import { customElement, css } from "@microsoft/fast-element";
import { Button, ButtonTemplate as template } from "@microsoft/fast-foundation";

/**
 * Below are some custom styles that roughly follow the design of a VS Code Primary Button.
 *
 * Note:
 * The .control CSS class is defined on the imported Button element and can be used to style the button itself.
 * There is also a .content class that can be used to style any content put inside the button.
 *
 * These classes (and other attributes) are defined on the button.template.ts file of the FAST Foundation button.
 * https://github.com/microsoft/fast/blob/master/packages/web-components/fast-foundation/src/button/button.template.ts
 *
 * For any other FAST Foundation element go find it's associated {componentName}.template.ts file to discover what
 * classes and attributes have been defined and can be used for styling purposes.
 *
 * Finally, for more information on how to style FAST components reference the following documentation:
 * https://www.fast.design/docs/fast-element/leveraging-css
 */

/**
 * ---- ❗️ Important Note ❗️ ----
 * This <foundation-button> element is the exact same as the one generated using the --fast-fo flag,
 * except in this case we are now using CSS variables defined by the Design System Provider for 
 * border-radius and background-color.
 */

const styles = css`
  .control {
    border-radius: calc(var(--corner-radius) * 1px);
    color: white;
    background-color: var(--accent-base-color);
    border: none;
    padding: 10px 10px;
    box-sizing: border-box;
    display: flex;
    text-align: center;
    justify-content: center;
    align-items: center;
    cursor: pointer;
  }

  .control:hover {
    background-color: #007acc;
  }
`;

@customElement({
  name: "foundation-button",
  template,
  styles,
  shadowOptions: {
    delegatesFocus: true,
  },
})
export class FoundationButton extends Button {
  /**
   * As it stands this Button will render with the custom styles defined above and include the default
   * behavior defined in the import Button class.
   *
   * An implementation/reference to this default behavior can be found here:
   * https://github.com/microsoft/fast/blob/master/packages/web-components/fast-foundation/src/button/button.ts
   *
   * However, extra styles and behavior can be defined on this new custom Button.
   * Examples of this can be found here:
   *
   * FAST Foundation Button Implementation
   * https://github.com/microsoft/fast/blob/master/packages/web-components/fast-components/src/button/index.ts
   *
   * Fluent UI Button Implementation
   * https://github.com/microsoft/fluentui/blob/master/packages/web-components/src/button/index.ts
   */
}
