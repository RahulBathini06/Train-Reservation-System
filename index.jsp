<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>RailGo - Train Reservation</title>

    <link rel="stylesheet" href="css/style.css">

    <script src="js/app.js"></script>

</head>

<body>

<header>

    <div class="logo">
    RailGo
</div>

    <nav>
        <a href="#search">Search</a>
        <a href="#routes">Popular Routes</a>
        <a href="#tickets">My Tickets</a>
    </nav>

</header>


<!-- HERO -->

<section class="hero" id="search">

    <div>

        <div class="tag">
            SMART TRAIN RESERVATION
        </div>

        <h1>
            Your journey.
            <br>
            <span>Your way.</span>
        </h1>

        <p class="sub">
            Search trains, choose your class, reserve seats
            and manage your journey with RailGo.
        </p>

        <div class="hero-buttons">

            <a href="#searchBox" class="hero-btn">
                Book a Ticket
            </a>

            <a href="#tickets" class="hero-btn secondary">
                My Ticket
            </a>

        </div>


        <div class="stats">

            <div>
                <strong>1-6</strong>
                <small>Passengers</small>
            </div>

            <div>
                <strong>4</strong>
                <small>Travel Classes</small>
            </div>

            <div>
                <strong>24x7</strong>
                <small>Booking Access</small>
            </div>

        </div>

    </div>


    <!-- SEARCH CARD -->

    <div class="card search-card" id="searchBox">

        <div class="search-heading">

            <div>

                <small>
                    PLAN YOUR JOURNEY
                </small>

                <h2>
                    Find a Train
                </h2>

            </div>

            <div class="search-icon">
                SEARCH
            </div>

        </div>


        <form action="TrainServlet"
              method="post"
              onsubmit="return validateSearch()">

            <div class="location-box">

                <div class="field">

                    <label>FROM</label>

                    <input
                        type="text"
                        id="source"
                        name="source"
                        placeholder="Mumbai"
                        required>

                </div>


              <button
    type="button"
    class="swap-btn"
    onclick="swapStations()">
    
    SWAP

</button>


                <div class="field">

                    <label>TO</label>

                    <input
                        type="text"
                        id="destination"
                        name="destination"
                        placeholder="Hyderabad"
                        required>

                </div>

            </div>


            <button
                type="submit"
                class="search-button">

                Search Available Trains
                <span>?</span>

            </button>

        </form>


        <p class="search-note">

            Secure reservation ? Instant PNR ? Easy cancellation

        </p>

    </div>

</section>


<!-- FEATURES -->

<section class="features">

    <div class="feature-card">

        <div class="feature-icon">
            01
        </div>

        <div>

            <h3>
                Group Booking
            </h3>

            <p>
                Book up to 6 passengers
                under one PNR.
            </p>

        </div>

    </div>


    <div class="feature-card">

        <div class="feature-icon">
            02
        </div>

        <div>

            <h3>
                Smart Seats
            </h3>

            <p>
                Seats are automatically
                assigned during booking.
            </p>

        </div>

    </div>


    <div class="feature-card">

        <div class="feature-icon">
            03
        </div>

        <div>

            <h3>
                Class Based Fare
            </h3>

            <p>
                Sleeper, 3AC, 2AC and
                1AC fares are calculated.
            </p>

        </div>

    </div>


    <div class="feature-card">

        <div class="feature-icon">
            04
        </div>

        <div>

            <h3>
                Digital Ticket
            </h3>

            <p>
                View your complete ticket
                using your PNR.
            </p>

        </div>

    </div>

</section>



<!-- MANAGE TICKET -->

<section class="manage" id="tickets">

    <div class="section-title">

        <div>

            <small>
                MANAGE YOUR JOURNEY
            </small>

            <h2>
                Your Ticket, Your Control
            </h2>

        </div>

    </div>


    <div class="manage-grid">


        <!-- VIEW -->

        <div class="manage-card">

            <div class="manage-top">

                <div class="manage-icon">
                    VIEW
                </div>

                <span>
                    TICKET
                </span>

            </div>


            <h3>
                View Your Ticket
            </h3>

            <p>
                Enter your PNR to see train,
                passenger, seat, fare and status details.
            </p>


            <form action="BookingServlet"
                  method="post">

                <input
                    type="hidden"
                    name="action"
                    value="view">

                <input
                    type="text"
                    name="pnr"
                    placeholder="Enter PNR number"
                    required>

                <button type="submit">
                    View Ticket ?
                </button>

            </form>

        </div>



        <!-- CANCEL -->

        <div class="manage-card cancel-card">

            <div class="manage-top">

                <div class="manage-icon">
                    X
                </div>

                <span>
                    CANCEL
                </span>

            </div>


            <h3>
                Cancel Your Ticket
            </h3>

            <p>
                Enter your PNR to cancel
                the complete booking.
            </p>


            <form action="BookingServlet"
                  method="post">

                <input
                    type="hidden"
                    name="action"
                    value="cancel">

                <input
                    type="text"
                    name="pnr"
                    placeholder="Enter PNR number"
                    required>

                <button
                    type="submit"
                    class="cancel-button">

                    Cancel Ticket

                </button>

            </form>

        </div>

    </div>

</section>



<!-- ABOUT -->

<section class="about">

    <div>

        <small>
            ABOUT RAILGO
        </small>

        <h2>
            Everything you need
            for your train journey.
        </h2>

    </div>


    <p>

        RailGo is a Train Ticket Reservation System
        developed using JSP, Servlets, JDBC and
        Apache Derby. It provides train search,
        passenger booking, class-based fare
        calculation, automatic seat allocation,
        PNR generation, ticket viewing and
        cancellation.

    </p>

</section>



<!-- FOOTER -->

<footer>

    <div class="footer-logo">
        RailGo
    </div>

    <p>
        Train Ticket Reservation System
    </p>

    <span>
        Copyright 2026 RailGo
    </span>

</footer>


</body>

</html>