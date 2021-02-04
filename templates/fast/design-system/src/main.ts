import { BasicDesignSystemProvider } from "./design-system-provider/BasicDesignSystemProvider";
import { BasicButton } from "./components/basic-button";

/*
 * Import and declare any component you want to use in index.html.
 * This ensures that tree-shaking doesn't remove these components from the bundle.
 * There are multiple ways to prevent tree shaking, of which this is one.
 */
BasicDesignSystemProvider;
BasicButton;
