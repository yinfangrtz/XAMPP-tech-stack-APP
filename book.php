<?php

// Connect to the database
$connection = mysqli_connect("localhost","informatics","is41090","project");

// Check for errors
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

$queryTeams = "SELECT * FROM `team`";
$queryPlayer = "SELECT * FROM `player`";

$resultTeams = mysqli_query($connection, $queryTeams);
$teamOptions = "";
while ($row = mysqli_fetch_array($resultTeams)) {
    $teamOptions = $teamOptions.'<option value="'.$row['teamID'].'">'.$row['teamName'].'</option>';
}

$resultPlayer = mysqli_query($connection, $queryPlayer);
$playerOptions = "";
while ($row = mysqli_fetch_array($resultPlayer)) {
    $playerOptions = $playerOptions.'<option value="'.$row['playerID'].'">'.$row['playerName'].'</option>';
}

$flashMessage = "";
if($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    $arrivals = $_POST['arrivals'];
    $leaving = $_POST['leaving'];
    $teamID = $_POST['team'];
    $playerID = $_POST['player'];

    $request = "insert into client(name, email, phone, address, arrivals, leaving, teamID, playerID) values('$name','$email','$phone','$address','$arrivals','$leaving','$teamID','$playerID') ";
    mysqli_query($connection, $request);

    $flashMessage = "<p>You successfully booked!</p>";
}

$output = <<<EOD

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>book</title>
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
   
<!-- header section starts  -->

<section class="header">

   <a href="home.html" class="logo">world cup trip.</a>

   <nav class="navbar">
      <a href="home.html">home</a>
      <a href="search.html">search</a>
      <a href="team.html">team</a>
      <a href="book.php">book</a>
   </nav>

</section>

<!-- header section ends -->

<div class="heading" style="background:url(images/header-bg-3.png) no-repeat">
   <h1>book now</h1>
</div>

<!-- booking section starts  -->

<section class="booking">

    
   <h1 class="heading-title">book your trip to qatar!</h1>
   <h1 class="heading-title">$flashMessage</h1>

   <form action="book.php" method="post" class="book-form">

      <div class="flex">
         <div class="inputBox">
            <span>name :</span>
            <input type="text" placeholder="enter your name" name="name">
         </div>
         <div class="inputBox">
            <span>email :</span>
            <input type="email" placeholder="enter your email" name="email">
         </div>
         <div class="inputBox">
            <span>phone :</span>
            <input type="number" placeholder="enter your number" name="phone">
         </div>
         <div class="inputBox">
            <span>address :</span>
            <input type="text" placeholder="enter your address" name="address">
         </div>
         <div class="inputBox">
            <span>arrivals :</span>
            <input type="date" name="arrivals">
         </div>
         <div class="inputBox">
            <span>leaving :</span>
            <input type="date" name="leaving">
         </div>
         <div class="inputBox">
            <span>favourite team :</span>
            <select name="team">
            $teamOptions
            </select>
         </div>
         <div class="inputBox">
            <span>favourite player :</span>
            <select name="player">
            $playerOptions
            </select>
         </div>       
      </div>

      <input type="submit" value="submit" class="btn" name="send">

   </form>

</section>

<!-- booking section ends -->

<!-- footer section starts  -->

<section class="footer">

   <div class="box-container">

      <div class="box">
         <h3>quick links</h3>
         <a href="home.html"> <i class="fas fa-angle-right"></i> home</a>
         <a href="search.html"> <i class="fas fa-angle-right"></i> search</a>
         <a href="team.html"> <i class="fas fa-angle-right"></i> team</a>
         <a href="book.php"> <i class="fas fa-angle-right"></i> book</a>
      </div>

      <div class="box">
         <h3>extra links</h3>
         <a href="https://www.fifa.com/fifaplus/en/tournaments/mens/worldcup/qatar2022"> <i class="fas fa-angle-right"></i> FIFA World Cup Qatar 2022™</a>
         <a href="https://en.wikipedia.org/wiki/2022_FIFA_World_Cup"> <i class="fas fa-angle-right"></i> 2022 FIFA World Cup - Wikipedia</a>
         <a href="https://www.aljazeera.com/qatar-world-cup-2022/"> <i class="fas fa-angle-right"></i> Qatar World Cup 2022 - Al Jazeera</a>
         <a href="https://www.qatar2022.qa"> <i class="fas fa-angle-right"></i> World Cup Qatar 2022</a>
      </div>

      <div class="box">
         <h3>contact info</h3>
         <a href="#"> <i class="fas fa-phone"></i> +111-111-1111 </a>
         <a href="#"> <i class="fas fa-phone"></i> +111-111-1111 </a>
         <a href="#"> <i class="fas fa-envelope"></i> CristianoRonaldo@gmail.com </a>
         <a href="#"> <i class="fas fa-map"></i> UCD Dublin Ireland </a>
      </div>

      <div class="box">
         <h3>follow us</h3>
         <a href="#"> <i class="fab fa-facebook-f"></i> facebook </a>
         <a href="#"> <i class="fab fa-twitter"></i> twitter </a>
         <a href="#"> <i class="fab fa-instagram"></i> instagram </a>
         <a href="#"> <i class="fab fa-linkedin"></i> linkedin </a>
      </div>

   </div>

   <div class="credit"> created by <span>Yang Yinfang</span> | IS41090-Informatics-2022/23 Autumn </div>

</section>

<!-- footer section ends -->

</body>
</html>
EOD;

print($output);

?>