<!DOCTYPE html>
<html>
<head>
	<title>Alert</title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script type="text/javascript">
swal({
  title: "Oops!!",
  text: "Invalid Username or Password",
  icon: "error",
  buttons: " OK "
}).then => ({
	window.href.location = "dashboard/dashboard.jsp"
});
	</script>

</body>
</html>