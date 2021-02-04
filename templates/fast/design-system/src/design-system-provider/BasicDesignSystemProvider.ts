/**
 * This is the file where our custom design system provider (BasicDesignSystemProvider)
 * is implemented.
 *
 * ---- Import Base Class & Utilities ----
 * We import the DesignSystemProvider base class from FAST Foundations along with
 * some utility functions. We also import some utility functions from FAST Element
 * to help with implementation details.
 *
 * ---- Import Design System Interface & Defaults ----
 * Finally (and importantly) we import the BasicDesignSystem interface and default
 * values that we created in the basic-design-system.ts file.
 *
 * With all of this we can construct an implementation of our provider class below.
 *
 * ---- Reference Examples ----
 * FASTDesignSystemProvider implementation:
 * https://github.com/microsoft/fast/blob/master/packages/web-components/fast-components/src/design-system-provider/index.ts
 *
 * FluentDesignSystemProvider implementation:
 * https://github.com/microsoft/fluentui/blob/master/packages/web-components/src/design-system-provider/index.ts
 *
 * ---- ❗️ Important Note ❗️ ----
 * It's also crucially important to note that the CSS of the <foundation-button> element
 * has been updated to use these design tokens/properties. Using these properties in new
 * components will also be necessary.
 */

import {
  DesignSystemProvider,
  defineDesignSystemProvider,
  DesignSystemProviderTemplate as template,
  designSystemProperty,
} from "@microsoft/fast-foundation";
import { css, nullableNumberConverter } from "@microsoft/fast-element";
import {
  BasicDesignSystem,
  basicDesignSystemDefaults,
} from "../basic-design-system";

@defineDesignSystemProvider({
  name: "basic-design-system-provider",
  template,
  styles: css`
    :host {
      display: block;
    }
  `,
})
export class BasicDesignSystemProvider extends DesignSystemProvider
  implements BasicDesignSystem {
  // Implementation of the corner-radius property
  @designSystemProperty({
    attribute: "corner-radius",
    converter: nullableNumberConverter,
    default: basicDesignSystemDefaults.cornerRadius,
  })
  public cornerRadius: number;

  // Implementation of the accent-base-color property
  @designSystemProperty({
    attribute: "accent-base-color",
    cssCustomProperty: "accent-base-color",
    default: basicDesignSystemDefaults.accentBaseColor,
  })
  public accentBaseColor: string;
}
