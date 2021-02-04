/**
 * In this file we are importing the FAST Element utility functions which can be used to create
 * a custom web component from scratch. Think of FAST Element as being in the same category as
 * a UI framekwork/librarie like Vue or React.
 *
 * Below we are importing FASTElement which is a minimal base class for FAST Elements that
 * also provides static helpers for working with FAST Elements.
 *
 * We also import the customElement, html, css, and observable utility functions. With these
 * we can define a template for the component (read: the HTML structure of our component), the
 * custom styles that should be applied to the component, and define any state that should be
 * observed within our component.
 *
 * With all above pieces we can create a class definition that extends FASTElement and defines
 * any custom behavior or life cycle methods that the component should have. From there we use the
 * customElement function to combine all the pieces (HTML template, styles, and class behavior)
 * to create a new custom element. 🎊
 *
 * All in all these pieces are used below to create a simple Counter component that can increment
 * and decrement a stateful count.
 *
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
