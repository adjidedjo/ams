import NestedForm from 'stimulus-rails-nested-form'

export default class extends NestedForm {
  static targets = ["add_item", "template_answer"]
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }

  add_association(event) {
    event.preventDefault()
    var content = this.template_answerTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime())
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content)
  }

  // remove_association(event) {
  //   event.preventDefault()
  //   let item = event.target.closest(".nested-fields")
  //   item.querySelector("input[name*='_destroy']").value = 1
  //   item.style.display = 'none'
  // }
}