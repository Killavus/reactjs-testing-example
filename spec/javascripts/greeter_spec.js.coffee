{Greeter} = Components

describe 'Greeter component', ->
  greeterParagraph: ->
    paragraph = @greeterContainer.find('p')
    throw "There should be exactly one paragraph in Greeter" if paragraph.length != 1
    paragraph

  beforeEach ->
    ReactTest = React.addons.TestUtils
    @greeter = ReactTest.renderIntoDocument(Greeter(initialName: 'my first test'))

    @greeterContainer = ->
      $(@greeter.getDOMNode())

    @greeterParagraph = ->
      paragraph = @greeterContainer().find('p')
      throw "There should be exactly one paragraph in Greeter" if paragraph.length != 1
      paragraph

  it 'has paragraph which greets someone', ->
    expect(@greeterParagraph().text()).toEqual("Hello, my first test!")

  it 'is rendered in a proper container', ->
    expect(@greeterContainer().attr("class")).toEqual('greeter')
    expect(@greeterContainer().is('div')).toBeTruthy()

  it 'can be updated by setting another name in state', (done) ->
    @greeter.setState(name: 'passing test', =>
      expect(@greeterParagraph().text()).toEqual("Hello, passing test!")
      done()
    )


