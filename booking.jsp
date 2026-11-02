<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<link rel="stylesheet" href="css/style.css">
<script src="js/app.js"></script>
<title>Book Ticket</title>

<script>
function passengers() {
    var n = document.getElementById("count").value;

    for (var i = 1; i <= 6; i++)
        document.getElementById("p" + i).style.display =
            i <= n ? "block" : "none";
}
</script>

</head>

<body>

<h1>Book Train Ticket</h1>

<form action="BookingServlet" method="post">

<input type="hidden" name="action" value="book">

Train No:
<input type="text" name="trainNo"
value="<%=request.getParameter("trainNo")%>" readonly>

<br><br>

Passengers:
<select id="count" name="count" onchange="passengers()">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
</select>

<br><br>

<%
for(int i=1;i<=6;i++) {
%>

<div id="p<%=i%>" style="<%=i==1 ? "" : "display:none"%>">

<h3>Passenger <%=i%></h3>

Name:
<input type="text" name="name<%=i%>">

Age:
<input type="number" name="age<%=i%>">

Gender:
<select name="gender<%=i%>">
<option>Male</option>
<option>Female</option>
<option>Other</option>
</select>

<br><br>
</div>

<%
}
%>

Journey Date:
<input type="date" name="date" required>

<br><br>

Class:
<select name="trainClass">
    <option value="Sleeper">Sleeper</option>
    <option value="3AC">3AC</option>
    <option value="2AC">2AC</option>
    <option value="1AC">1AC</option>
</select>

<br><br>

<input type="submit" value="Book Ticket">

</form>

<br>
<a href="index.jsp">Back to Home</a>

</body>
</html>