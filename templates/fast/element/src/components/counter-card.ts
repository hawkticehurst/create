/**
 * In this file, we create a simple <counter-card> component that can increment and decrement 
 * a stateful count.
 * 
 * To do this we are importing the FAST Element utility functions which can be used to create a 
 * custom web component from scratch. Think of FAST Element as being in the same category as
 * a UI framework/library like Vue or React.
 *
 * --- FASTElement Import ----
 * Below we import FASTElement which is a minimal base class for FAST Elements that also 
 * provides static helpers for working with FAST Elements.
 *
 * ---- Utility Function Imports ----
 * We also import the html and css utility functions. With these we can define a template for 
 * the component (read: the HTML structure of our component) and the custom styles that should 
 * be applied to the component.
 *
 * ---- Class Definition & State ----
 * Additionally, a class definition that extends FASTElement is created. This defines any state 
 * that should be observed (reference the imported observable utility function), any life cycle 
 * methods, or any other custom behavior that the component should have. 
 * 
 * ---- Putting It All Together ----
 * With all the above pieces, we use the imported customElement utility function to combine/associate 
 * all the pieces (i.e. HTML template, styles, and class behavior) to create a new custom element. 🎊
 *
 * ---- More Resources ----
 * For more information about what was discussed here and information on other utilities that FAST 
 * Element defines check the documentation here:
 * 
 * https://www.fast.design/docs/fast-element/getting-started
 */

import {
  FASTElement,
  customElement,
  html,
  css,
  observable,
} from "@microsoft/fast-element";

const template = html<CounterCard>`
  <div class="container">
    <h1>The count is: <span>${(x) => x.count}</span></h1>
    <button @click=${(x) => x.decrementCount()}>–</button>
    <button @click=${(x) => x.incrementCount()}>+</button>
  </div>
`;

const styles = css`
  .container {
    background-color: white;
    box-shadow: 0 6px 12px rgb(0, 0, 0, 0.3);
    border-radius: 7px;
    padding: 3rem;
    margin: 1rem 0;
    width: 30vw;
    text-align: center;
  }

  h1 {
    margin: 0 0 1rem;
    font-size: 50px;
  }

  span {
    color: hsl(205, 98%, 47%);
  }

  button {
    color: white;
    font-weight: bold;
    font-size: 20px;
    margin: 1rem 0;
    border-radius: 5px;
    border: none;
    padding: 0.75rem 2rem;
    background-color: hsl(205, 98%, 47%);
    box-shadow: 0 6px 12px hsla(205, 98%, 37%, 0.45);
  }

  button:hover {
    cursor: pointer;
    background-color: hsl(200, 98%, 47%);
  }
`;

@customElement({
  name: "counter-card",
  template,
  styles,
})
export class CounterCard extends FASTElement {
  @observable count: number = 0;

  incrementCount() {
    this.count += 1;
  }

  decrementCount() {
    this.count -= 1;
  }
}
