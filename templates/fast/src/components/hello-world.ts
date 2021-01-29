import { FASTElement, customElement, attr } from "@microsoft/fast-element";

@customElement("hello-world")
export class HelloWorld extends FASTElement {
  @attr greeting: string = "World";

  greetingChanged() {
    this.shadowRoot!.innerHTML = `Hello, ${this.greeting}!`;
  }
}
