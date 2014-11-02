$ ->
  {InvitationList} = Components

  $("[data-app=invitationListApp]").each ->
    window.invitationListApp = React.renderComponent(InvitationList(), @)
    window.invitationListApp.setState invitedPeople: [{ id: 1, name: 'Waldo' }, { id: 2, name: 'Hercules' }]