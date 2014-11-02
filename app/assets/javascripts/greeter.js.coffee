Greeter = React.createClass
  displayName: 'Greeter'

  getInitialState: ->
    name: @props.initialName

  getDefaultProps: ->
    initialName: 'World'

  render: ->
    @greeterContainer(
      @greeterText()
    )

  greeterContainer: (children...) ->
    React.DOM.div
      className: 'greeter'
      children

  greeterText: ->
    React.DOM.p
      key: 'text'
      "Hello, #{@state.name}!"

Components.Greeter = Greeter