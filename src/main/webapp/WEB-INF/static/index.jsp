<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>WebSocket Chat Application</title>
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<noscript>
		<h2>Sorry! Your browser doesn't support Javascript</h2>
	</noscript>

	<div id="username-page" class="">
		<div class="username-page-container">
			<h4 class="title">${message}</h4>
			<form action="usernameForm" id="usernameForm" name="usernameForm">
				<div class="form-group">
					<input type="text" id="name" placeholder="Username"
						pattern=".{3,20}" required
						title="username should be minimum 3 and maximum 20"
						autocomplete="off" class="form-control" required=true autofocus />
					<input type="password" id="password" placeholder="Passcode"
						pattern=".{6,20}" required
						title="passcode should not exceed more than 20 or less than 6"
						autocomplete="off" class="form-control" required='true' />
				</div>
				<div class="form-group">
					<button type="submit" class="accent username-submit">Start
						Chatting</button>
				</div>
			</form>
		</div>
	</div>

	<div id="chat-page" class="hidden">
		<div class="chat-container">
			<div class="chat-header">
				<div
					style="display: block; color: white; text-align: center; position: absolute; top: 7px; left: 25px;">
					<!-- <form action="get"> -->
					<button onclick="contactList(event)" type="button"
						class="btn btn-default btn-md" style="color: #128ff2;">
						<span class="glyphicon glyphicon-list-alt"> </span> Contact List
					</button>
					<!-- </form> -->
				</div>

				<div style="text-align: center; font-size: 18px; color: #128ff2;">
					WebSocket Chat Box</div>
				<div
					style="display: block; color: white; text-align: center; position: absolute; top: 7px; right: 25px;">
					<button onClick="disconnect(event)" type="button"
						class="btn btn-default btn-md" style="color: #128ff2;">
						<span class=" glyphicon glyphicon-log-out"> </span> Exit
					</button>
				</div>
			</div>
			<div class="connecting">Connecting...</div>
			<ul id="messageArea">

			</ul>
			<form id="messageForm" name="messageForm" nameForm="messageForm"
				style="float: right;">
				<div class="form-group">
					<div class="input-group clearfix">
						<input type="text" id="message" placeholder="Type a message..."
							autocomplete="off" class="form-control-chat" />
						<button type="submit" class="primary">Send</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="user-contact-page" class="hidden">
		<div class="contact-container">
			<div class="chat-header">
				<div style="text-align: center; font-size: 18px; color: #128ff2;">
					Chat Contact list</div>
				<div
					style="display: block; color: white; text-align: center; position: absolute; top: 7px; right: 25px;">
					<button onClick="connect()" type="button"
						class="btn btn-default btn-md" style="color: #128ff2;">
						<span class=" glyphicon glyphicon-hand-left"> </span> Back
					</button>
				</div>
			</div>
			<div style="padding: 15px;">
				<!-- name="contactForm" nameForm="contactForm" -->
				<form id="contactForm" name="contactForm" nameForm="contactForm" modelAttribute="contactForm">
					<span class="fieldItem"> First name: </span> <input value="${contact.firstname}" class="txtBox"
						type="text" name="firstname"> <br> <span
						class="fieldItem"> Last name: </span> <input class="txtBox"
						type="text" name="lastname"> <br> <span
						class="fieldItem"> Email Id: </span><input class="txtBox"
						type="text" name="email" style="margin: 10px 35px;"> <br>
					<span class="fieldItem"> Phone No: </span><input class="txtBox"
						type="number" name="phone" style="margin: 10px 23px;"> <br>
					<input type="submit" value="Save" class="primary"
						style="margin-left: 400px; background: rgb(251, 207, 110); color: #fff;" />
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>