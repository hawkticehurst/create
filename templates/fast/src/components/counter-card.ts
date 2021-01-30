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

@customElement({ name: "counter-card", template, styles })
export class CounterCard extends FASTElement {
  @observable count: number = 0;

  incrementCount() {
    this.count += 1;
  }

  decrementCount() {
    this.count -= 1;
  }
}
