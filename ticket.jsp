<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*,com.train.DBConnection" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>RailGo - Your Ticket</title>

    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<header>

    <div class="logo">
        🚆 RailGo
    </div>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="index.jsp#tickets">My Tickets</a>
    </nav>

</header>


<div class="page">

<%
String pnrText = request.getParameter("pnr");

if (pnrText != null) {

    long pnr = Long.parseLong(pnrText.trim());

    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "SELECT b.*, t.train_name, t.source, t.destination, " +
        "t.departure, t.arrival " +
        "FROM bookings b JOIN trains t " +
        "ON b.train_no=t.train_no " +
        "WHERE b.pnr=? " +
        "ORDER BY b.passenger_no"
    );

    ps.setLong(1, pnr);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
%>

<div class="ticket">

    <!-- HEADER -->

    <div style="display:flex;justify-content:space-between;align-items:center;">

        <div>
            <div class="tag">E-TICKET</div>

            <h1 style="font-size:32px;margin:8px 0;">
                Your journey is confirmed
            </h1>
        </div>

        <div class="status">
            CONFIRMED
        </div>

    </div>


    <!-- PNR -->

    <div style="
        background:#f5f8ff;
        padding:18px;
        border-radius:12px;
        margin:25px 0;
    ">

        <small style="color:#667085;">
            PNR NUMBER
        </small>

        <h2 style="margin:5px 0;color:#155eef;">
            <%=rs.getLong("pnr")%>
        </h2>

    </div>


    <!-- TRAIN -->

    <h2>
        🚆 <%=rs.getString("train_name")%>
    </h2>

    <p style="color:#667085;">
        Train No. <b><%=rs.getInt("train_no")%></b>
    </p>


    <!-- ROUTE -->

    <div class="route">

        <div>

            <small>FROM</small>

            <b>
                <%=rs.getString("source")%>
            </b>

            <small style="margin-top:8px;">
                Departure
            </small>

            <b style="font-size:20px;">
                <%=rs.getString("departure")%>
            </b>

        </div>


        <div>

            <span style="font-size:30px;">
                → 
            </span>

        </div>


        <div>

            <small>TO</small>

            <b>
                <%=rs.getString("destination")%>
            </b>

            <small style="margin-top:8px;">
                Arrival
            </small>

            <b style="font-size:20px;">
                <%=rs.getString("arrival")%>
            </b>

        </div>

    </div>


    <!-- JOURNEY INFO -->

    <div class="info">

        <div>

            <small>JOURNEY DATE</small>

            <b>
                <%=rs.getDate("journey_date")%>
            </b>

        </div>


        <div>

            <small>CLASS</small>

            <b>
                <%=rs.getString("train_class")%>
            </b>

        </div>


        <div>

            <small>PASSENGERS</small>

            <b id="passengerCount">
                1
            </b>

        </div>


        <div>

            <small>STATUS</small>

            <span class="status">
                <%=rs.getString("status")%>
            </span>

        </div>

    </div>


    <!-- PASSENGERS -->

    <h2>
        Passenger Details
    </h2>

    <div class="tablewrap">

        <table>

            <tr>

                <th>No.</th>
                <th>Passenger</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Seat</th>
                <th>Fare</th>
                <th>Status</th>

            </tr>


<%
int passengerCount = 0;

do {

    passengerCount++;
%>

            <tr>

                <td>
                    <%=rs.getInt("passenger_no")%>
                </td>

                <td>
                    <b>
                        <%=rs.getString("passenger_name")%>
                    </b>
                </td>

                <td>
                    <%=rs.getInt("age")%>
                </td>

                <td>
                    <%=rs.getString("gender")%>
                </td>

                <td>
                    <b>
                        <%=rs.getInt("seat_no")%>
                    </b>
                </td>

                <td>
                    ₹<%=rs.getInt("fare")%>
                </td>

                <td>
                    <span class="status">
                        <%=rs.getString("status")%>
                    </span>
                </td>

            </tr>

<%
} while (rs.next());

con.close();
%>

        </table>

    </div>


    <script>

        document.getElementById("passengerCount").innerHTML =
            "<%=passengerCount%>";

    </script>


    <!-- ACTIONS -->

    <div style="
        display:flex;
        gap:12px;
        margin-top:30px;
    ">

        <button onclick="window.print()">
            🖨 Print Ticket
        </button>

        <a href="index.jsp"
           style="
           padding:14px 22px;
           border-radius:10px;
           background:#eef4ff;
           color:#155eef;
           text-decoration:none;
           font-weight:bold;
           ">
            ← Back to Home
        </a>

    </div>

</div>


<%
    } else {
%>

<div class="panel">

    <h2>❌ PNR Not Found</h2>

    <p>
        No booking was found for PNR
        <b><%=pnr%></b>.
    </p>

    <a href="index.jsp">
        ← Back to Home
    </a>

</div>

<%
    }

} else {
%>

<div class="panel">

    <h2>Enter a PNR</h2>

    <p>
        Please return to the home page and enter your PNR.
    </p>

    <a href="index.jsp">
        ← Back to Home
    </a>

</div>

<%
}
%>

</div>


<footer>
    © 2026 RailGo • Train Ticket Reservation System
</footer>

</body>

</html>