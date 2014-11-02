SpecialityOfTheHouseSelect = React.createClass
  displayName: 'Speciality of the House Select'

  getInitialState: ->
    selectedSpeciality: 'fried-bacon'

  changeSelectedSpeciality: (speciality) ->
    @setState selectedSpeciality: speciality

  specialitySelect: (props, children...) ->
    React.DOM.select(props, children)

  speciality: (name, value, style = {}) ->
    React.DOM.option
      key: value
      value: value
      style: style
      name

  render: ->
    @specialitySelect
      value: @state.selectedSpeciality
      onChange: (ev) =>
        @changeSelectedSpeciality(ev.target.value)
      @speciality('Fried Bacon',  'fried-bacon', color: 'red')
      @speciality('Fish & Chips', 'fish-and-chips')
      @speciality('Potato Salad', 'potato-salad')

Components.SpecialityOfTheHouseSelect = SpecialityOfTheHouseSelect