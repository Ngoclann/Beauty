
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Item"%>
<%@page import="entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Discovery</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/discovery-style.css">
        <%@include file="part/icon.html" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <link
            href="https://fonts.googleapis.com/css?family=Alegreya+SC|Amatic+SC|Bahianita|Bubblegum+Sans|Fredericka+the+Great|Handlee|Love+Ya+Like+A+Sister|Luckiest+Guy|Nothing+You+Could+Do|Open+Sans+Condensed:300|Permanent+Marker|Shadows+Into+Light|Zilla+Slab&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dosis&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->

        <script
            src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
        crossorigin="anonymous"></script>
        <script>
            $(function () {
                $(".toggle").on("click", function () {
                    if ($(".item").hasClass("active")) {
                        $(".item").removeClass("active");
                    } else {
                        $(".item").addClass("active");
                    }
                });
            });
        </script>
    </head>
    <body>
        <nav>
            <ul class="menu">
                <li class="logo"><a href="index.jsp"><img src="img/logo.png" alt=""></a></li>
                <li class="item"><a href="index.jsp">Home</a></li>
                <li class="item"><a href="discovery.jsp">Discovery</a></li>
                <li class="item"><a href="findus.jsp">Find us</a></li>
                <li class="item"><a href="getMerch">Shop</a></li>
                    <%
                        if (session.getAttribute("visitor") == null) {
                    %>
                <li class="item button"><a href="login.jsp">Log In</a></li>
                <li class="item button secondary"><a href="signup.jsp">Sign Up</a></li>
                <li class="item cart"><a href="" onclick="noticeLogin()"><i class="fas fa-shopping-cart"></i></a></li>
                        <% } else {
                            Object obj = session.getAttribute("cart");
                            int noOfItems = 0;
                            if (obj != null) {
                                Cart cart = (Cart) obj;
                                ArrayList<Item> list = (ArrayList<Item>) cart.getItems();
                                noOfItems = list.size();
                            }
                        %>
                <li class="item" id="user"><a href=""><i class="fas fa-user"></i>${sessionScope.visitor.username}</a></li>
                <li class="item button secondary"><a href="logout">Log Out</a></li>
                <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(<%=noOfItems%>)</a></li>
                    <% }%>
                <li class="toggle"><span class="bars"></span></li>
            </ul>
        </nav>
        <!-- HEADER -->
        <div class="container" id="container">
            <div id="myCarousel" class="carousel slide" data-ride="carousel" >
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">

                    <div class="item active">
                        <a target="_blank" href="https://www.youtube.com/watch?v=-BjZmE2gtdo">
                            <img src="img/slide01.jpg" alt="Lover" style="width: 100%; height: auto"></a>
                        <div class="carousel-caption">
                            <h3>TAYLOR SWIFT - LOVER</h3>
                        </div>
                    </div>

                    <div class="item">
                        <a target="_blank" href="https://youtu.be/oG6S_8DHloo">
                            <img src="img/slide02.jpg" alt="PONY Syndrome" style="width: 100%; height: auto"></a>
                        <div class="carousel-caption">
                            <h3>🍍Day Getaway! + GRWM💦<br>
                                <em>Short vacation + yellow orange makeup!</em></h3>
                        </div>
                    </div>

                    <div class="item">
                        <a target="_blank" href="https://youtu.be/0SD9lm5NQxM">
                            <img src="img/slide03.jpg" alt="Elle Fitness" style="width: 100%; height: auto"></a>
                        <div class="carousel-caption">
                            <h3>[3 Perfect B's] 10 Minutes Dance Cardio Begins A New Day</h3>
                        </div>
                    </div>

                    <div class="item">
                        <a target="_blank" href="https://youtu.be/ja2QkvtlOLI">
                            <img src="img/slide04.jpg" alt="Green Smoothie" style="width: 100%; height: auto"></a>
                        <div class="carousel-caption">
                            <h3>Green Smoothie Recipes by Chau Bui</h3>
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <aside>
            <div class="discovery-menu" id="menu">
                <div id="menu-content">
                    <a href="#taylor">Taylor Swift</a>
                    <a href="#pony">Pony Syndrome</a>
                    <a href="#elle">ELLE</a>
                </div>
            </div>
            <div class="container event">

                <div class="row event-list">
                    <div class="col-lg-4 col-sm-4 event-name" id="taylor">
                        Taylor Swift
                    </div>
                    <div class="col-lg-8 col-sm-8 event-content">
                        <div class="image">
                            <img src="img/taylor.jpg" alt="Taylor Swift">
                        </div>
                        <p>
                            Taylor Swift's seventh studio album Lover is not only the top-selling album of 2019;
                            it is the highest selling album since reputation was released back in 2017 and broke
                            the record for most simultaneous entries by a female artist in Billboard's Hot 100 
                            history with all 18 tracks from Lover charting! This is a testament not only to her 
                            devoted fans but also to her songwriting prowess. As USA Today said, "Critics are 
                            falling in love with Taylor Swift's latest album Lover." Rolling Stone hailed, "Lover
                            is a career-topping masterpiece" and "the superstar's writing is better than it's ever
                            been" while A.V. Club called Lover, "one of her strongest, most relatable albums to 
                            date" and Vulture said, "The old Taylor is back on Lover and the best she's been in years."
                            <br><br>
                            Swift recently released the title track, "Lover," with critics raving, "Both aching and
                            achingly pretty, "Lover" effectively transmits its romantic signals by putting the 
                            songwriting of Swift -- a masterful writer who gets the solo credit here -- front and 
                            center" (Billboard Magazine) while People Magazine said "Lover" "Might be her most 
                            romantic song yet." Taylor's socially conscious 2nd single, "You Need To Calm Down," 
                            follows the debut single "ME!," which broke multiple records to date. With 65.2 million
                            views in 24 hours, Swift now holds YouTube's most viewed video by any female and solo 
                            artist. "ME!" is also the fastest music video to reach 100M views on Vevo (in only 79 
                            hours) and broke the record for the most views in a single day by any artist. In addition
                            to "ME!" and "You Need To Calm Down,"
                            <br><br>
                            Swift is a ten-time Grammy winner, a singer, songwriter, musician and producer. She is 
                            the youngest person in history to win the music industry's highest honor, the Grammy Award
                            for Album of the Year, and is the first female solo artist to win this prestigious award 
                            twice. Rolling Stone listed Swift as one of the 100 Greatest Songwriters of All Time. Time
                            magazine featured her on their prestigious 2017 Person of the Year cover, has named her 
                            one of the 100 Most Influential People in the world and included her three times at TIME 
                            100. A Brit and Emmy award winner, Swift is Billboard's youngest-ever Woman of the Year 
                            and the only artist to have been awarded this honor twice. She is the only artist in history
                            to have four consecutive albums sell over one million copies in their week of release 
                            (Speak Now, RED, 1989 and reputation) and the only female artist to have six albums each sell
                            at least 500,000 copies in a single week (Fearless, Speak Now, RED, 1989, reputation and 
                            Lover). For more information on Taylor Swift and her new album Lover visit
                            <a href="https://www.taylorswift.com/">TaylorSwift.com</a>.
                        </p>
                    </div>
                </div>
                <div class="row event-list">
                    <div class="col-lg-4 col-sm-4 event-name" id="pony">
                        Pony Syndrome
                    </div>
                    <div class="col-lg-8 col-sm-8 event-content">
                        <div class="image">
                            <img src="img/pony.jpg" alt="Park Hye-min">
                        </div>
                        <p>
                            Park Hye-min (born 1990), known professionally as Pony or Pony Park, is a South Korean 
                            make-up artist, blogger, and Beauty YouTuber. Pony is credited with popularizing Korean
                            beauty trends worldwide. She was listed in Forbes 30 Under 30 Asia in 2017 for her 
                            make-up career.
                            <br><br>
                            Throughout her career, Pony has authored several how-to books on applying make-up and 
                            collaborated with multiple make-up brands. In addition, she is the founder of her own 
                            make-up brand, Pony Effect.
                            <br><br>
                            The name "Pony" came from her nickname at school, which she has used as her online name
                            since. Having enjoyed drawing since childhood, Pony kept a blog on Cyworld and also 
                            began practicing make-up looks while she was a third-year high school student. She began
                            posting video tutorials at the request of other users, which were positively received. 
                            Pony went to university to become a graphic designer and later worked at an office. 
                            In 2010, she was approached by a publisher to write a series of books on make-up tips, 
                            which were later released in 2011, 2012, and 2014 in Taiwan, Thailand, Indonesia, China, 
                            and Japan. She eventually quit her job to pursue make-up full-time. For a while, she also
                            worked as make-up artist for singer CL.
                            <br><br>
                            After launching her YouTube channel, <a href="https://www.youtube.com/c/PONYMakeup">Pony
                                Syndrome</a>, in 2015, Pony gained over 4,400,000 subscribers in 2018. This has been 
                            helped by her providing English subtitles to her videos and focusing on a diverse 
                            range of make-up looks for a global audience. In addition to posting make-up looks, Pony
                            also created tutorials for celebrity transformations.
                            <br><br>
                            In 2015, Pony launched her make-up brand, Pony Effect, through the Korean beauty retailer
                            Memebox.
                        </p>
                    </div>
                </div>
                <div class="row event-list">
                    <div class="col-lg-4 col-sm-4 event-name" id="elle">
                        ELLE
                    </div>
                    <div class="col-lg-8 col-sm-8 event-content">
                        <div class="image">
                            <img src="img/elle.jpg" alt="Demi Lovato on the cover of Elle Canada">
                        </div>
                        <p>
                            <a href="https://www.elle.com/">Elle</a> (stylized ELLE) is a worldwide lifestyle magazine
                            of French origin that focuses on fashion, beauty, health and entertainment. It was 
                            founded in 1945 by Hélène Gordon-Lazareff and her husband, the writer Pierre Lazareff. 
                            The title means "she" or "her" in French.
                            <br><br>
                            Elle was founded in Paris as an immediate aftermath of World War II and first sold as a 
                            supplement to France-Soir, edited at the time by Pierre Lazareff. Hélène Gordon-Lazareff, 
                            Elle's pioneering founder, returned to Paris from New York City to create a unique publication
                            that grappled with the many forces shaping the lives of women in France in 1945. Women won 
                            the right to vote in 1944, and Elle dived immediately into long-form "newspaper-like" features
                            on women's role in national politics and the growing feminist movement.
                            <br><br>
                            Its 100th issue, published on 14 October 1947, featured the work of Christian Dior just eight
                            months after his debut show. Likewise, Brigitte Bardot graced her first Elle cover at age 17,
                            on 7 January 1952, months before her screen debut in Manina, the Girl in the Bikini. By the 
                            1960s, Elle had a readership of 800,000 across France and was said to "not so much reflect 
                            fashion as decree it." This dominance was reflected in the famous slogan: "Si elle lit, elle
                            lit Elle (If she reads, she reads Elle)".
                            <br><br>
                            Lagardère Group subsidiary Hachette Filipacchi Médias began pushing Elle outside of Europe 
                            in 1969, launching its Japanese publication. In 1985, Elle launched in Britain and the United 
                            States. The Chinese version of the magazine was first published in 1988. It was the first 
                            four-color fashion magazine offered in China. The magazine was used as an informational and 
                            educational tool for opening of the Chinese textile market. By 1991, the magazine's sales 
                            were in decline in the U.S.
                            <br><br>
                            In 1989, Hachette Filipacchi Media U.S. launched the title Elle Decor, focusing on home decor.
                            Elle.com was launched in 2007.
                            <br><br>
                            In 2011, The Hearst Corporation reached a €651M deal with Lagardére to purchase the rights to
                            publish Elle Magazine in fifteen countries including the United Kingdom, Italy, Spain, Russia
                            and Ukraine. Lagardére, which struggled in the international market in the 2000s, retained
                            the rights to the French edition and would collect royalties from the international editions.
                            <br><br>
                            Elle Brazil was the first commercial magazine in the world to have a transgender model on its 
                            cover, with Lea T. in December, 2011. The Brazilian edition had also discovered transgender 
                            model Valentina Sampaio and had put her on the cover before French Vogue. Elle printed special 
                            collectors’ covers for their September 2016 issue, and one of them featured Hari Nef, which was
                            the first time an openly transgender woman had been on the cover of a major commercial British magazine.
                            <br><br>
                            In 2019, Lagardère sold Elle France to Czech Media Invest, parent of Czech News Center. Lagardère 
                            continues to own the Elle brand.
                        </p>
                    </div>
                </div>
            </div>
        </aside>
        <%@include file="part/footer.html" %>
        <script>
            function noticeLogin() {
                alert("You need to login first!");
            }
        </script>
    </body>
</html>
