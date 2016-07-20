@CurrentUser = React.createClass
	getInitialState: ->
		email: ''
		user_type: ''
		invited_by: ''
	adminForm: ->
		React.DOM.div
			className: 'row'
			React.DOM.h2 className: 'text-muted', @state.currentuser.user_type
			React.DOM.h3 className: 'text-primary', @state.currentuser.name
			React.DOM.h4 className: 'text-success', @state.currentuser.email
			React.DOM.form
				className: 'form-inline'
				onSubmit: @handleSubmit	
				React.DOM.div
					className: 'form-group'
					React.DOM.input
						type: 'text'
						className: 'form-control'
						placeholder: "Invitee's email"
						name: 'email'
						value: @state.email
						onChange: @handleChange
				React.DOM.div
					className: 'form-group'
					React.DOM.select null,
						React.DOM.option
							value: 'teamleader',
							'Teamleader'
						React.DOM.option
							value: 'teammate',
							'Teammate'

	render: ->
		if @state.currentuser.user_type == 'admin' 
			@adminForm()
			
