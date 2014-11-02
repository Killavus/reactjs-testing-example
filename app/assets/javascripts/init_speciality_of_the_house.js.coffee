$ ->
  {SpecialityOfTheHouseSelect} = Components

  $("[data-app=specialityOfTheHouseApp]").each ->
    window.SpecialityOfTheHouseApp = React.renderComponent(SpecialityOfTheHouseSelect(), @)