<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Profile Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body style="background-color: #e9ebee;">
<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else {
    	window.location='/';
    	
    	
      // The person is not logged into your app or we are unable to tell.
      
    }
  }
  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }
</script>


	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12&appId=166947310676837&autoLogAppEvents=1';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<form id ="redirectForm" method="POST" action="logout">
	</form>

		<nav class="navbar navbar-toggleable-md navbar navbar-dark bg-dark">
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>


	</button>
	<a class="navbar-brand" href="/">LetsTalkPhotos</a>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="/">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/VerifyProfile">Profile</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/Friends">Friends</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/getUsers">Get Users</a>
			</li>	
			
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Notifications </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<c:forEach items="${notificationPost}" var="notificationPost">

						<li><a href="viewSelectedPostfriend?postid=${notificationPost.key}">${notificationPost.value}
							has created a new post</a></li>
						


					</c:forEach>
					<c:forEach items="${postNotificationsComments}"
						var="postNotificationsComments">

						<a
							href="viewSelectedPostfriend?postid=${postNotificationsComments.key}">
							${postNotificationsComments.value}
							has commented on a post</a>
				

					</c:forEach>

					

				</div></li>

		</ul>
		<!-- <form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form> -->
	</div>
	 </nav>







<div style="margin-top:3%"></div>


	<div class="container">
	<div class="fb-login-button" data-max-rows="1" data-size="Medium" data-button-type="continue_with" data-show-faces="false" 
	data-auto-logout-link="true" 
              data-use-continue-as="false" onlogin="checkLoginState();" style="float:right;margin-right:2%;"></div>
              <div id="status"></div>
		<div class="row">
		<div class="bio col-3">
			<p class="font-weight-bold" style="margin-top: 5%; font-size: 20px;">${user.name}</p>
			<div id="image">
				<img src="${ImgSrc}" alt="Profile Page Image"
					style="border-radius: 50%; width: 200px">
			</div>
		</div>




<div class="col-md-6 ">
				<div>

		<!-- Get values from user profile table -->

		<div style="margin-left: 50%; margin-top: 5%;">
			<form method="post" action="/UpdateProfilePic"
				enctype="multipart/form-data">
				<div class="custom-file">
					<input type="file" name="file" id="inputGroupFile02"
						onchange="this.form.submit();"> <label
						class="custom-file-label" for="inputGroupFile02">Change
						Picture</label>
				</div>
				<br>
			</form>

			<form method="post" action="/UpdateProfileBio">
				<ul class="errorMessages"></ul>
				<label for="bio">About Me:</label> <br>
				<textarea id="textarea" name="bio" required readonly="readonly"><c:out
						value="${user.biography}"></c:out></textarea>
				<br /></br>

				<button class="btn btn-primary" type="submit" id="submitbio">Update</button>
			</form>
			<button class="btn btn-primary" id="editbio">Edit Bio</button>
		</div>
		<br> <br>
		</div>

		<div>
			<form action="/postPicture" method="post">
				<button class="btn btn-primary" type="submit">Create Post</button>

			</form>
			</div>
			<br> <br>
			<div class="container">
			<div class="row">
			
			<c:forEach items="${posts}" var="posts">
			<div class="bio col-8">
				<a href="viewSelectedPost?postid=${posts.id}"> <img
					id="${posts.id}" src="${posts.image}" alt="Profile Page Image" <%-- onclick="openPost(${posts.id})" --%>/>
				</a>



				<%-- <form action="/addComment" method="post">
					</br>
					
					<c:forEach items="${findcomments}" var="findcomments">

								<div>
							
								<c:if test="${findcomments.key==posts.id}">
									<c:forEach items="${findcomments.value}" var="comments">

										<p>${comments}</p>

									</c:forEach>
								</c:if>
							
						</div>

					</c:forEach> --%>
					<%-- <input type="text" name="comment"> </br> <input type="hidden"
						value="${posts.id}" name="postid"> </br>
					<button class="btn btn-primary" type="submit">Submit</button>
				</form> --%>
				<br>
				</div>
			</c:forEach>
	</div>

			<%-- <img src ="${PostImg}" alt="Profile Page Image"/> --%>
		</div>
		<div class="fb-comments" data-href="https://localhost:8080"
			data-numposts="0"></div>
	</div>
</div>


	<script>
		$(document).ready(function() {
			$('#editbio').click(function() {
				if ($('#textarea').prop('readonly')) {
					$('#textarea').removeAttr('readonly');
				} else {
					$('#textarea').attr('readonly', 'readonly')
				}
			});
		});
	</script>


	<script>
		$(document).ready(function() {

			$('#submitbio').hide(); //hide the submit button by default

			$('#editbio').click(function() {

				$('#submitbio').show(); //show the submit button after signing

			});
		});
	</script>

	<script>
		var createAllErrors = function() {
			var form = $(this), errorList = $("ul.errorMessages", form);

			var showAllErrorMessages = function() {
				errorList.empty();

				// Find all invalid fields within the form.
				var invalidFields = form.find(":invalid").each(
						function(index, node) {

							// Find the field's corresponding label
							var label = $("label[for=" + node.id + "] "),
							// Opera incorrectly does not fill the validationMessage property.
							message = node.validationMessage
									|| 'Invalid value.';

							errorList.show().append(
									"<li><span>" + label.html() + "</span> "
											+ message + "</li>");
						});
			};

			// Support Safari
			form.on("submit", function(event) {
				if (this.checkValidity && !this.checkValidity()) {
					$(this).find(":invalid").first().focus();
					event.preventDefault();
				}
			});

			$("input[type=submit], button:not([type=button])", form).on(
					"click", showAllErrorMessages);

			$("input", form)
					.on(
							"keypress",
							function(event) {
								var type = $(this).attr("type");
								if (/date|email|month|number|search|tel|text|time|url|week/
										.test(type)
										&& event.keyCode == 13) {
									showAllErrorMessages();
								}
							});
		};

		$("form").each(createAllErrors);
	</script>
</div>



</body>
</html>