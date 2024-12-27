
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
        <meta charset="UTF-8">
        <link rel="icon" href="images/sricine.ico" type="image/icon type">
        <title>SignUp/Login</title>
	<link rel="stylesheet" type="text/css" href="slide navbar style.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
<style>
	body{
		margin: 0;
		padding: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		min-height: 100vh;
		font-family: 'Jost', sans-serif;
		background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
		background-image: url('bg.jpg');
	}
	.main{
		width: 350px;
		height: 500px;
		background: red;
		overflow: hidden;
		background: url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38") no-repeat center/ cover;
		border-radius: 10px;
		box-shadow: 5px 20px 50px #000;
	}
	#chk{
		display: none;
	}
	.signup{
		position: relative;
		width:100%;
		height: 100%;
	}
	label{
		color: #fff;
		font-size: 2.3em;
		justify-content: center;
		display: flex;
		margin: 60px;
		font-weight: bold;
		cursor: pointer;
		transition: .5s ease-in-out;
	}
	input{
		width: 60%;
		height: 20px;
		background: #e0dede;
		justify-content: center;
		display: flex;
		margin: 20px auto;
		padding: 10px;
		border: none;
		outline: none;
		border-radius: 5px;
	}
	button{
		width: 60%;
		height: 40px;
		margin: 10px auto;
		justify-content: center;
		display: block;
		color: #fff;
		background: #573b8a;
		font-size: 1em;
		font-weight: bold;
		margin-top: 20px;
		outline: none;
		border: none;
		border-radius: 5px;
		transition: .2s ease-in;
		cursor: pointer;
	}
	button:hover{
		background: #6d44b8;
	}
	.login{
		height: 460px;
		background: #eee;
		border-radius: 60% / 10%;
		transform: translateY(-180px);
		transition: .8s ease-in-out;
	}
	.login label{
		color: #573b8a;
		transform: scale(.6);
	}
	
	#chk:checked ~ .login{
		transform: translateY(-500px);
	}
	#chk:checked ~ .login label{
		transform: scale(1);	
	}
	#chk:checked ~ .signup label{
		transform: scale(.6);
	}
</style>
</head>
<body>
     <input type="hidden" id="status" value="<%= request.getAttribute("status") != null ? request.getAttribute("status") : "" %>">

   
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form method="post" action="Register" class="signupform">
					<label for="chk" aria-hidden="true">Sign up</label>
					<input type="text" name="uname" placeholder="User Name" required="">
					<input type="email" name="email" placeholder="Email" required="">
					<input type="password" name="pswd" placeholder="Password" required="">
					<button>Sign up</button>
				</form>
			</div> 

			<div class="login">
				<form method="post" action="Login" class="loginform">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="email" name="email" placeholder="Email" required="">
					<input type="password" name="pswd" placeholder="Password" required="">
					<button>Login</button>
                                        <div style="display: flex; justify-content: center; align-items: center; height: 100px;">
                                        <a href="forgotPassword.jsp" name="forgotpswd" style="color: blue; text-decoration: underline; transition: 0.3s;"
                                        accesskey=""onmouseover="this.style.backgroundColor='yellow'" 
                                        onmouseout="this.style.backgroundColor=''">Forgot Password?</a>
                                        </div>
                                </form>
                            
			</div>
	</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">



<script type="text/javascript">
    var status = "<%= request.getAttribute("status") != null ? request.getAttribute("status") : "" %>";
    
    if (status === "loginSuccess") {
        swal("Welcome", "You have logged in successfully!", "success");
    } else if (status === "loginFailed") {
        swal("Error", "Invalid credentials. Please try again.", "error");
    } else if (status === "signupSuccess") {
        swal("Congrats", "Account Created Successfully", "success");
    } else if (status === "signupFailed") {
        swal("Error", "Signup failed. Please try again.", "error");
    } else if (status === "emailExists") {
        swal("Error", "Email already exists. Please try with a different one.", "error");
    }
    else if (status === "resetSuccess") {
        swal("Congrats", "Password Reset Successfull.", "success");
    }
    else if (status === "resetFailed") {
        swal("Error", "Password Reset Failed.", "error");
    }
</script>

</body>
</html>
