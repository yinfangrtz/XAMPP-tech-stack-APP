<?php

// Connect to the database
$connection = mysqli_connect("localhost","informatics","is41090","project");

// Check for errors
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

// Build the SQL query
$teamname = $_POST['searchteam'];

$query = "SELECT * FROM `team`
          WHERE teamName='$teamname'";

// Execute the query

$result = mysqli_query($connection,$query);

// Check for errors
if (!$result) {
    printf("Error: %s\n", mysqli_error($connection));
    exit();
}

// Check if there are any results
if ($result->num_rows > 0) {
    // Iterate over the results
    $allContent = "";
    while ($row = mysqli_fetch_array($result)) {
        $rowContent1 = "Your beloved ".$row['teamName']." national football team is still in the round of 16.<br>";
        $rowContent2 = "The team is from the group".$row["group"].".<br>";
        $rowContent3 = "This team's group placement is ".$row["ranking"].".<br>";
        $allContent=$allContent.$rowContent1.$rowContent2.$rowContent3;
    }
} else {
    // No results were found
    $allContent= "No results found for '$teamname'. This team has been eliminated. <br> You can try 'England', 'Netherlands' or 'Portugal'.";
  }
        
        $output = <<<EOD

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>search</title>
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

<div class="heading" style="background:url(images/header-bg-1.png) no-repeat">
    <h1>search now</h1>
</div>

<section class="home">
    <div class="heading-title">
    $allContent
    </div>

    <div class="centercontent">
        <a href="search.html" class="btn">Back</a>
    </div>
</section>

<section class="footer">

    <div class="box-container">

    <div class="box">
        <h3>quick links</h3>
        <a href="home.html"> <i class="fas fa-angle-right"></i> home</a>
        <a href="search.html"> <i class="fas fa-angle-right"></i> search</a>
        <a href="team.html"> <i class="fas fa-angle-right"></i> team</a>
        <a href="book.html"> <i class="fas fa-angle-right"></i> book</a>
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
</body>
</html>
EOD;

        print($output);

?>


