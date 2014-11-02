InvitationList = React.createClass
  displayName: 'Invitation List'

  getDefaultProps: ->
    initiallyInvited: []

  getInitialState: ->
    invitedPeople: @props.initiallyInvited

  invitationListContainer: (children) ->
    React.DOM.div
      className: 'invitation-list-container'
      children

  invitationList: (children) ->
    React.DOM.ul
      key: 'list'
      ref: 'list'
      className: 'invitation-list'
      children

  invitedPerson: (person) ->
    InvitedPerson
      key: @personUniqueIdentifier(person)
      ref: @personUniqueIdentifier(person)
      person: person

  render: ->
    @invitationListContainer(
      @invitationList [
        for person in @state.invitedPeople
          @invitedPerson(person)
      ]
    )

  personUniqueIdentifier: (person) ->
    ['person', person.id].join('_')

InvitedPerson = React.createClass
  displayName: 'Invited Person'

  getDefaultProps: ->
    notSureMessage:
      true: "Now I'm sure!"
      false: "I'm not sure about this person"

  getInitialState: ->
    notSure: false

  listElementClasses: ->
    # React.addons.classSet is neat addon to define HTML classes in React.
    # See more: http://facebook.github.io/react/docs/class-name-manipulation.html
    # Basically, keys are classes and value is whether class is included or not (boolean).
    classes = {}
    classes['invited-person'] = true
    classes['not-sure'] = @state.notSure

    React.addons.classSet(classes)

  listElement: (children) ->
    React.DOM.li
      className: @listElementClasses()
      children

  personName: ->
    React.DOM.p
      key: 'personName'
      ref: 'name'
      @props.person.name

  toggleConfidenceAboutPerson: ->
    @setState notSure: !@state.notSure

  notSureLink: ->
    React.DOM.p
      key: 'notSureLinkParagraph'
      React.DOM.a
        ref: 'notSureLink'
        href: '#'
        onClick: (ev) =>
          ev.preventDefault()
          @toggleConfidenceAboutPerson()
        @props.notSureMessage[@state.notSure]

  render: ->
    @listElement [
      @personName()
      @notSureLink()
    ]

Components.InvitationList = InvitationList
Components.InvitedPerson  = InvitedPerson