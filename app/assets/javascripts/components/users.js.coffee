@Users = React.createClass
	getInitialState: ->
		users: @props.users
		current_user: @props.current_user
	getDefaultProps: ->
		users: []
	addUser: (user) ->
      users = @state.users.slice()
      users.push user
      @setState users: users
	render: ->
		React.DOM.div
			className: 'row'
			React.createElement InviteForm, handleNewUser: @addUser, { users: @props.users, current_user: @props.current_user }
			React.DOM.hr null
			React.DOM.h3 null, 'Users'
			React.DOM.div
				className: 'column'
				React.DOM.table
					className: 'table table-bordered'
					React.DOM.thead null,
						React.DOM.tr null,
							React.DOM.th null, 'Name'
							React.DOM.th null, 'Email'
							React.DOM.th null, 'User Type'
							React.DOM.th null, 'Actions'
					React.DOM.tbody null,
						for user in @state.users
							React.createElement User, key: user.id, user: user


						
