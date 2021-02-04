/**
 * This is the file where all the BasicDesignSystem properties are defined.
 * This is also the file where all the default values for those properties are defined.
 *
 * This follows the methodology used by the FAST Design System and Fluent UI Design System.
 *
 * https://github.com/microsoft/fast/blob/master/packages/web-components/fast-components/src/fast-design-system.ts
 * https://github.com/microsoft/fluentui/blob/master/packages/web-components/src/fluent-design-system.ts
 */

export interface BasicDesignSystem {
  cornerRadius: number;
  accentBaseColor: string;
}

/**
 * The default values for BasicDesignSystem
 */
export const basicDesignSystemDefaults: BasicDesignSystem = {
  cornerRadius: 0,
  accentBaseColor: "#0e639c",
};
