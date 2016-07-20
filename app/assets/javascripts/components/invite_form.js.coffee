@InviteForm = React.createClass
	getInitialState: ->
		current_user: @props.children.current_user
		users: @props.children.users
		email: ''
		user_type: ''
		invited_by: ''
	handleSubmit: (e) ->
		e.preventDefault()
		$.post '/users/invitation', { email: $('#email').val(), user_type: $('#user_type').val(), invited_by: $('#invited_by').val() }, (data) =>
			@props.handleNewUser data
			@setState @getInitialState()
			'JSON'
		,
	render: ->
		React.DOM.form
			className: 'form-inline'
			onSubmit: @handleSubmit
			React.DOM.div
				className: 'row'
				React.DOM.div
					className: 'form-group form-element-spacing'
					React.DOM.input
						type: 'text'
						className: 'form-control'
						placeholder: "Invitee's email"
						name: 'email'
						id: 'email'
						value: @state.email
						onChange: @handleChange
				React.DOM.div
					className: 'form-group form-element-spacing'
					React.DOM.select
						className: 'form-control'
						name: 'user_type'
						id: 'user_type'
						if @state.current_user.user_type == 'admin'
							React.DOM.option
								value: 'teamleader',
								'Teamleader'
						React.DOM.option
							value: 'teammate',
							'Teammate'
				if @state.users.length > 0
					React.DOM.div
						className: 'form-group form-element-spacing'
						React.DOM.select
							className: 'form-control'
							name: 'invited_by'
							id: 'invited_by'
							for user in @state.users
								if user.user_type == 'teamleader'
									React.DOM.option
										value: user.id
										user.email
				else
					React.DOM.div
						className: 'form-group form-element-spacing'
						React.DOM.input
							type: 'text'
							className: 'form-control'
							name: 'invited_by'
							id: 'invited_by'
							value: @state.current_user.email
							readOnly: true	
				React.DOM.button
					type: 'submit'
					className: 'btn btn-primary'
					disabled: !@valid()
					'Invite a new member'
	handleChange: (e) ->
		name = e.target.name
		@setState "#{ name }": e.target.value
	valid: ->
		@state.email