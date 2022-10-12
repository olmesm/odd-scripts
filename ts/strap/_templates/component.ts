import { LitElement, css, html } from 'lit'
import { customElement, property } from 'lit/decorators.js'

const scopedStyle = css`
  :host {}
`

@customElement('$$FILE_NAME_SNAKE')
export class $$FILE_NAME_PASCAL extends LitElement {
  static styles = scopedStyle

  @property({ type: String })
    name?: string = '$$FILE_NAME_PASCAL'

  render () {
    return html`<p><b>${this.name}</b> $$TYPE</p>`
  }
}
