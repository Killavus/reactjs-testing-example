{SpecialityOfTheHouseSelect} = Components

describe 'Speciality of the House Select', ->
  beforeEach ->
    @ReactTest = React.addons.TestUtils
    @specialitySelect = @ReactTest.renderIntoDocument(SpecialityOfTheHouseSelect())

    @specialitySelectElement = =>
      $(@specialitySelect.getDOMNode())

    @specialityDishes = =>
      @specialitySelectElement().find('option')

    @specialityDishValues = =>
      dishes = @specialityDishes().map (_, element) =>
        value: element.value
        name: $(element).text()

      # We want to have an Array here, not jQuery array-like object.
      Array().slice.call(dishes)

  it "has best dish selected by default and highlighted", ->
    expect(@specialitySelectElement().val()).toEqual("fried-bacon")
    expect(@specialityDishes().eq(0).attr("value")).toEqual("fried-bacon")
    expect(@specialityDishes().eq(0).css("color")).toEqual("red")

  it "has all restaurant's best dishes", ->
    dishes = @specialityDishValues()

    expect(dishes).toContain(name: 'Fish & Chips', value: 'fish-and-chips')
    expect(dishes).toContain(name: 'Fried Bacon', value: 'fried-bacon')
    expect(dishes).toContain(name: 'Potato Salad', value: 'potato-salad')

  it 'allows user to select from list of dishes', ->
    @ReactTest.Simulate.change(@specialitySelectElement()[0], target: @specialityDishes()[1])
    expect(@specialitySelectElement().val()).toEqual(@specialityDishes()[1].value)