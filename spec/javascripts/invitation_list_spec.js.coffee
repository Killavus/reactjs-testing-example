{InvitationList, InvitedPerson} = Components

describe 'Invited Person', ->
  beforeEach ->
    @ReactTest = React.addons.TestUtils
    @person = { id: 1, name: 'Waldo' }
    @personComponent = @ReactTest.renderIntoDocument(InvitedPerson(person: @person))

    @rootElement = =>
      $(@personComponent.getDOMNode())

    @rootElementClasses = =>
      @rootElement().attr("class").split(' ')

    @personName = =>
      $(@personComponent.refs.name.getDOMNode())

    @notSureLink = =>
      $(@personComponent.refs.notSureLink.getDOMNode())

  it 'is list element by default', ->
    expect(@rootElement().is('li')).toBeTruthy()

  it 'has invited-person class in root', ->
    expect(@rootElementClasses()).toContain("invited-person")

  it 'displays person name', ->
    expect(@personName().text()).toEqual(@person.name)

  it 'has a link about being not sure, by default you are sure', ->
    expect(@personComponent.state.notSure).toBeFalsy()
    expect(@notSureLink().text()).toEqual(@personComponent.props.notSureMessage.false)

  it 'changes link message and root element class if you are unsure', (done) ->
    @ReactTest.Simulate.click(@notSureLink()[0])

    setTimeout =>
      expect(@personComponent.state.notSure).toBeTruthy()
      expect(@rootElementClasses()).toContain('not-sure')
      expect(@notSureLink().text()).toEqual(@personComponent.props.notSureMessage.true)
      done()

describe 'Invitation List', ->
  beforeEach ->
    @ReactTest = React.addons.TestUtils
    @people = [{ id: 1, name: 'Waldo' }, { id: 2, name: 'Hercules' }]

    @listComponent = @ReactTest.renderIntoDocument(InvitationList())

    @rootNode = =>
      $(@listComponent.getDOMNode())

    @peopleList = =>
      $(@listComponent.refs.list.getDOMNode())

    @personComponent = (person) =>
      @listComponent.refs["person_#{person.id}"]

  it 'is an unordered list of invited people', ->
    expect(@listComponent.refs.list).toBeDefined()
    expect(@peopleList().is('ul')).toBeTruthy()

  it 'can be populated with invited people via property', ->
    prepopulatedComponent = @ReactTest.renderIntoDocument(InvitationList(initiallyInvited: @people))
    expect(prepopulatedComponent.refs["person_#{@people[0].id}"]).toBeDefined()
    expect(prepopulatedComponent.refs["person_#{@people[1].id}"]).toBeDefined()

  it 'can be populated with invited people and they are displayed', (done) ->
    @listComponent.setState(invitedPeople: @people, =>
      expect(@personComponent(@people[0]).props.person).toEqual(@people[0])
      expect(@personComponent(@people[0]).state.notSure).toBeFalsy()
      expect(@ReactTest.isDescriptorOfType(@personComponent(@people[0])._descriptor, InvitedPerson)).toBeTruthy()

      expect(@personComponent(@people[1]).props.person).toEqual(@people[1])
      expect(@personComponent(@people[1]).state.notSure).toBeFalsy()
      expect(@ReactTest.isDescriptorOfType(@personComponent(@people[1])._descriptor, InvitedPerson)).toBeTruthy()

      done()
    )