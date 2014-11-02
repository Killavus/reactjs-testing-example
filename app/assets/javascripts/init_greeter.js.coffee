$ ->
  {Greeter} = Components

  $("[data-app=greeterApp]").each ->
    window.GreeterApp = React.renderComponent(Greeter(initialName: 'my first test'), @)