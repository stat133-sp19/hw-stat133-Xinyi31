Workout 1
================

``` r
# remove existing objects
rm(list = ls())
```

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

The introduction
================

This report would detailed analyze the points- situation for five players in Golden State Warriors: Stephen Curry, Klay Thompson, Kevin Durant, Graymond Green, and Andre Iguodala. The report tries to state the general rule of player’s behaviors. The data which is used in this report was collected on games of NBA 2016 season. This report would provide clear analysis process and explain how the data support the statement in this report.

``` r
shot_data <- read.csv("C:/Users/89893/Desktop/workout01/data/shots-data.csv", stringsAsFactors = FALSE,) 
```

Stephen Curry
=============

> Stephen Curry is an American professional basketball player for the Golden State Warriors of the National Basketball Association (NBA).A six-time NBA All-Star, he has been named the NBA Most Valuable Player (MVP) twice and won three NBA championships with the Warriors. Many players and analysts have called him the greatest shooter in NBA history.\[1\] He is credited with revolutionizing the game of basketball by inspiring teams to regularly employ the three-point shot as part of their winning strategy.

from Wikipedia

Stephen Curry is a PG basketball player. PG means **point guard**, whichi is the most speical position in a team. Point guards would could the whole spcae of the team and weven the space of the game. Points guards have to be able to totally understand the plan from the team coach and control the team based on the desigen plan. They have to make sure that right player would get the basketball at the right time.

``` r
# summary the data for Stephen Curry on 2016 season. 
classes = c('factor','character','integer','integer','integer','integer','character','character','character','integer','factor')
curry <- read.csv("C:/Users/89893/Desktop/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE,colClasses = classes) 
curry <- mutate(curry,name = rep("Stephen Curry",length(curry$team_name)))
curry <- curry %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'n','shot_no'))
curry <- curry %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'y','shot_yes'))
curry <- mutate(curry,minute = period *12 - minutes_remaining )
summary(curry)
```

    ##                  team_name     game_date             season    
    ##  Golden State Warriors:1250   Length:1250        Min.   :2016  
    ##                               Class :character   1st Qu.:2016  
    ##                               Mode  :character   Median :2016  
    ##                                                  Mean   :2016  
    ##                                                  3rd Qu.:2016  
    ##                                                  Max.   :2016  
    ##                                                                
    ##      period      minutes_remaining seconds_remaining shot_made_flag    
    ##  Min.   :1.000   Min.   : 0.000    Min.   : 0.00     Length:1250       
    ##  1st Qu.:1.000   1st Qu.: 1.000    1st Qu.:13.00     Class :character  
    ##  Median :2.000   Median : 4.000    Median :29.00     Mode  :character  
    ##  Mean   :2.305   Mean   : 4.221    Mean   :28.53                       
    ##  3rd Qu.:3.000   3rd Qu.: 7.000    3rd Qu.:44.00                       
    ##  Max.   :4.000   Max.   :11.000    Max.   :59.00                       
    ##                                                                        
    ##  action_type         shot_type         shot_distance  
    ##  Length:1250        Length:1250        Min.   : 0.00  
    ##  Class :character   Class :character   1st Qu.: 5.00  
    ##  Mode  :character   Mode  :character   Median :23.00  
    ##                                        Mean   :17.99  
    ##                                        3rd Qu.:26.00  
    ##                                        Max.   :71.00  
    ##                                                       
    ##                   opponent         x             y            
    ##  Los Angeles Clippers : 78   9      :  27   Length:1250       
    ##  Houston Rockets      : 75   0      :  26   Class :character  
    ##  Sacramento Kings     : 71   -1     :  21   Mode  :character  
    ##  Memphis Grizzlies    : 69   4      :  20                     
    ##  Oklahoma City Thunder: 69   -2     :  18                     
    ##  New Orleans Pelicans : 68   -7     :  18                     
    ##  (Other)              :820   (Other):1120                     
    ##      name               minute     
    ##  Length:1250        Min.   : 1.00  
    ##  Class :character   1st Qu.:10.25  
    ##  Mode  :character   Median :24.00  
    ##                     Mean   :23.44  
    ##                     3rd Qu.:34.00  
    ##                     Max.   :48.00  
    ## 

``` r
totalshotmade <- sum(curry$shot_made_flag == "shot_yes")/length(curry$name)
pt2shotmade <- sum(curry$shot_made_flag == "shot_yes"& curry$shot_type == "2PT Field Goal")/sum(curry$shot_type == "2PT Field Goal")
pt3shotmade <- sum(curry$shot_made_flag == "shot_yes"& curry$shot_type == "3PT Field Goal")/sum(curry$shot_type == "3PT Field Goal")
totalshotmade
```

    ## [1] 0.4672

``` r
pt2shotmade
```

    ## [1] 0.5399645

``` r
pt3shotmade
```

    ## [1] 0.4075691

From the summary of data for curry, The median for shot\_distance is 23, and the mean of the shot\_distance is 17.99. In addition, curry play in game about 23.44 mins in every game through the whole 2016 season on average. Totla shoot effective rate is 0.4672, the 2 point & 3 point eddecive rate are 0.5399645 and 0.4075691

Klay Thompson
=============

> **Klay Alexander Thompson** is an American professional basketball player for the Golden State Warriors of the National Basketball Association (NBA). He is credited as one of the greatest shooters in NBA history.\[2\]\[3\] He is a five-time NBA All-Star, a two-time All-NBA Third Team honoree, and a three-time NBA champion.

from Wikipedia
klay thompson is a SG basketball player. SG means **shooting guard**. The crucial task for a shooting guard basketball player is to get the points for the team, and find the opportunity to steal the basterball from the other team on defense. Shooting guard player always master plenty of methods to score and get the point for the team.

``` r
# get the summary from the data 
thompson <- read.csv("C:/Users/89893/Desktop/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE,colClasses = classes)
thompson <- thompson %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'n','shot_no'))
thompson <- thompson %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'y','shot_yes'))
thompson <- mutate(thompson,minute = period *12 - minutes_remaining)
summary(thompson)
```

    ##                  team_name     game_date             season    
    ##  Golden State Warriors:1220   Length:1220        Min.   :2016  
    ##                               Class :character   1st Qu.:2016  
    ##                               Mode  :character   Median :2016  
    ##                                                  Mean   :2016  
    ##                                                  3rd Qu.:2016  
    ##                                                  Max.   :2016  
    ##                                                                
    ##      period      minutes_remaining seconds_remaining shot_made_flag    
    ##  Min.   :1.000   Min.   : 0.000    Min.   : 0.00     Length:1220       
    ##  1st Qu.:1.000   1st Qu.: 4.000    1st Qu.:14.00     Class :character  
    ##  Median :2.000   Median : 7.000    Median :29.50     Mode  :character  
    ##  Mean   :2.369   Mean   : 6.511    Mean   :29.19                       
    ##  3rd Qu.:3.000   3rd Qu.: 9.000    3rd Qu.:44.00                       
    ##  Max.   :4.000   Max.   :11.000    Max.   :59.00                       
    ##                                                                        
    ##  action_type         shot_type         shot_distance  
    ##  Length:1220        Length:1220        Min.   : 0.00  
    ##  Class :character   Class :character   1st Qu.:12.00  
    ##  Mode  :character   Mode  :character   Median :20.00  
    ##                                        Mean   :17.16  
    ##                                        3rd Qu.:25.00  
    ##                                        Max.   :32.00  
    ##                                                       
    ##                    opponent         x             y            
    ##  Houston Rockets       : 74   0      :  26   Length:1220       
    ##  Sacramento Kings      : 74   9      :  22   Class :character  
    ##  Memphis Grizzlies     : 70   1      :  18   Mode  :character  
    ##  Portland Trail Blazers: 68   230    :  18                     
    ##  Minnesota Timberwolves: 62   12     :  17                     
    ##  Los Angeles Clippers  : 60   233    :  15                     
    ##  (Other)               :812   (Other):1104                     
    ##      minute     
    ##  Min.   : 1.00  
    ##  1st Qu.: 9.00  
    ##  Median :23.00  
    ##  Mean   :21.91  
    ##  3rd Qu.:32.00  
    ##  Max.   :48.00  
    ## 

``` r
totalshotmade <- sum(thompson$shot_made_flag == "shot_yes")/length(thompson$name)
pt2shotmade <- sum(thompson$shot_made_flag == "shot_yes"& thompson$shot_type == "2PT Field Goal")/sum(thompson$shot_type == "2PT Field Goal")
pt3shotmade <- sum(thompson$shot_made_flag == "shot_yes"& thompson$shot_type == "3PT Field Goal")/sum(thompson$shot_type == "3PT Field Goal")
totalshotmade
```

    ## [1] Inf

``` r
pt2shotmade
```

    ## [1] 0.5140625

``` r
pt3shotmade
```

    ## [1] 0.4241379

From the summary of data for Thompson, The median for shot\_distance is 20, and the mean of the shot\_distance is 21.91. In addition, thompson play in game about 21.91 mins in every game through the whole 2016 season on average. The 2 point & 3 point effective rate are 0.5140625 and 0.4241379

Kevin Durant
============

> Kevin Wayne Durant is an American professional basketball player for the Golden State Warriors of the National Basketball Association (NBA). He played one season of college basketball for the University of Texas, and was selected as the second overall pick by the Seattle SuperSonics in the 2007 NBA draft. He played nine seasons in Oklahoma City before signing with Golden State in 2016, winning back-to-back championships in 2017 and 2018.

from Wikipedia
Durant is a SF basketball player. SF means **small forward**. Small forward is a in-between position. Mostly, SF basketball player is shorter and quicker than PF and C but taller than guard position. SF basketball players also get the points for the team, and they also pass ball to organize the offensve routes.

``` r
durant <- read.csv("C:/Users/89893/Desktop/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE,colClasses = classes)
durant <- mutate(durant,name = rep("Kevin Durant",length(durant$team_name)))
durant <- durant %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'n','shot_no'))
durant <- durant %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'y','shot_yes'))
durant <- mutate(durant,minute = period *12 - minutes_remaining)
summary(durant)
```

    ##                  team_name    game_date             season    
    ##  Golden State Warriors:915   Length:915         Min.   :2016  
    ##                              Class :character   1st Qu.:2016  
    ##                              Mode  :character   Median :2016  
    ##                                                 Mean   :2016  
    ##                                                 3rd Qu.:2016  
    ##                                                 Max.   :2016  
    ##                                                               
    ##      period     minutes_remaining seconds_remaining shot_made_flag    
    ##  Min.   :1.00   Min.   : 0.000    Min.   : 0.00     Length:915        
    ##  1st Qu.:1.00   1st Qu.: 2.000    1st Qu.:13.00     Class :character  
    ##  Median :2.00   Median : 6.000    Median :27.00     Mode  :character  
    ##  Mean   :2.34   Mean   : 5.833    Mean   :28.02                       
    ##  3rd Qu.:3.00   3rd Qu.: 9.000    3rd Qu.:43.00                       
    ##  Max.   :4.00   Max.   :11.000    Max.   :59.00                       
    ##                                                                       
    ##  action_type         shot_type         shot_distance  
    ##  Length:915         Length:915         Min.   : 0.00  
    ##  Class :character   Class :character   1st Qu.: 2.00  
    ##  Mode  :character   Mode  :character   Median :14.00  
    ##                                        Mean   :13.12  
    ##                                        3rd Qu.:24.00  
    ##                                        Max.   :58.00  
    ##                                                       
    ##                    opponent         x            y            
    ##  Portland Trail Blazers: 70   0      :115   Length:915        
    ##  Los Angeles Clippers  : 61   9      : 22   Class :character  
    ##  Oklahoma City Thunder : 61   -1     : 19   Mode  :character  
    ##  New Orleans Pelicans  : 55   14     : 16                     
    ##  Denver Nuggets        : 51   6      : 15                     
    ##  Los Angeles Lakers    : 50   -9     : 14                     
    ##  (Other)               :567   (Other):714                     
    ##      name               minute     
    ##  Length:915         Min.   : 1.00  
    ##  Class :character   1st Qu.:11.00  
    ##  Mode  :character   Median :23.00  
    ##                     Mean   :22.25  
    ##                     3rd Qu.:32.00  
    ##                     Max.   :48.00  
    ## 

``` r
totalshotmade <- sum(durant$shot_made_flag == "shot_yes")/length(durant$name)
pt2shotmade <- sum(durant$shot_made_flag == "shot_yes"& durant$shot_type == "2PT Field Goal")/sum(durant$shot_type == "2PT Field Goal")
pt3shotmade <- sum(durant$shot_made_flag == "shot_yes"& durant$shot_type == "3PT Field Goal")/sum(durant$shot_type == "3PT Field Goal")
totalshotmade
```

    ## [1] 0.5409836

``` r
pt2shotmade
```

    ## [1] 0.6065319

``` r
pt3shotmade
```

    ## [1] 0.3860294

From the summary of data for durant, The median for shot\_distance is 14, and the mean of the shot\_distance is 13.12.Compared with two guard player, the avergae shot distance decrease significantly. In addition, durant play in game about 22.25 mins in every game through the whole 2016 season on average.The total shooting effective rate is 0.5409836. The 2 point & 3 point effecive rate are 0.6065319 and 0.3860294

Graymond Green
==============

> **Draymond Jamal Green Sr** is an American professional basketball player for the Golden State Warriors of the National Basketball Association (NBA). Green, who plays primarily at the power forward position, is a three-time NBA champion and a three-time NBA All-Star. In 2017, he won the NBA Defensive Player of the Year.

from Wikipedia
Green is a PF basketball player. PF means **power forward**. Power forward play an important role in defence, the PF players are always stronger and taller. The position for Pf players in a game is near the center of the court. They also help and get the points for the team.

``` r
green <- read.csv("C:/Users/89893/Desktop/workout01/data/draymond-green.csv", stringsAsFactors = FALSE,colClasses = classes)
green <- mutate(green,name = rep("Graymond Green",length(green$team_name)))
green <- green %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'n','shot_no'))
green <- green %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'y','shot_yes'))
green <- mutate(green,minute = period *12 - minutes_remaining)
summary(green)
```

    ##                  team_name    game_date             season    
    ##  Golden State Warriors:578   Length:578         Min.   :2016  
    ##                              Class :character   1st Qu.:2016  
    ##                              Mode  :character   Median :2016  
    ##                                                 Mean   :2016  
    ##                                                 3rd Qu.:2016  
    ##                                                 Max.   :2016  
    ##                                                               
    ##      period      minutes_remaining seconds_remaining shot_made_flag    
    ##  Min.   :1.000   Min.   : 0.000    Min.   : 0.00     Length:578        
    ##  1st Qu.:1.000   1st Qu.: 2.000    1st Qu.:15.25     Class :character  
    ##  Median :2.000   Median : 6.000    Median :31.00     Mode  :character  
    ##  Mean   :2.327   Mean   : 5.536    Mean   :29.59                       
    ##  3rd Qu.:3.000   3rd Qu.: 9.000    3rd Qu.:44.00                       
    ##  Max.   :4.000   Max.   :11.000    Max.   :59.00                       
    ##                                                                        
    ##  action_type         shot_type         shot_distance  
    ##  Length:578         Length:578         Min.   : 0.00  
    ##  Class :character   Class :character   1st Qu.: 1.00  
    ##  Mode  :character   Mode  :character   Median : 6.00  
    ##                                        Mean   :12.17  
    ##                                        3rd Qu.:25.00  
    ##                                        Max.   :55.00  
    ##                                                       
    ##                   opponent         x            y            
    ##  Houston Rockets      : 52   0      : 70   Length:578        
    ##  Sacramento Kings     : 42   1      : 20   Class :character  
    ##  New Orleans Pelicans : 29   9      : 15   Mode  :character  
    ##  Oklahoma City Thunder: 29   4      : 14                     
    ##  Dallas Mavericks     : 27   -1     : 12                     
    ##  Memphis Grizzlies    : 26   -4     : 12                     
    ##  (Other)              :373   (Other):435                     
    ##      name               minute     
    ##  Length:578         Min.   : 1.00  
    ##  Class :character   1st Qu.:10.00  
    ##  Mode  :character   Median :23.00  
    ##                     Mean   :22.39  
    ##                     3rd Qu.:33.00  
    ##                     Max.   :48.00  
    ## 

``` r
totalshotmade <- sum(green$shot_made_flag == "shot_yes")/length(green$name)
pt2shotmade <- sum(green$shot_made_flag == "shot_yes"& green$shot_type == "2PT Field Goal")/sum(green$shot_type == "2PT Field Goal")
pt3shotmade <- sum(green$shot_made_flag == "shot_yes"& green$shot_type == "3PT Field Goal")/sum(green$shot_type == "3PT Field Goal")
totalshotmade
```

    ## [1] 0.4238754

``` r
pt2shotmade
```

    ## [1] 0.4942197

``` r
pt3shotmade
```

    ## [1] 0.3189655

From the summary of data for green, The median for shot\_distance is 6, and the mean of the shot\_distance is 5.536.Compared with two guard player, the avergae shot distanc is very short. In addition, green plays in game about 22.39 mins in every game through the whole 2016 season on average.The total shooting effective rate is 0.4238754. The 2 point & 3 point effecive rate are 0.4942197 and 0.3189655. The shooting effective rate also decreases compared with the guard postion players and durant.

Andre Iguodala
==============

> **Andre Tyler Iguodala** is an American professional basketball player for the Golden State Warriors of the National Basketball Association (NBA). The swingman was an NBA All-Star in 2012 and has been named to the NBA All-Defensive Team twice. Iguodala won an NBA championship with the Warriors in 2015, when he was named the NBA Finals Most Valuable Player. Iguodala helped the Warriors win two more championships in 2017 and 2018.

from Wikipedia
Andre Iguodala is a SG/SF basketball player. As metioned before, he play the role of getting points for the team and pass the ball to complete the offensive route for the whole team.

``` r
iguodala <- read.csv("C:/Users/89893/Desktop/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE,colClasses = classes)
iguodala <- iguodala %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'n','shot_no'))
iguodala <- iguodala %>% mutate(shot_made_flag = replace(shot_made_flag, shot_made_flag == 'y','shot_yes'))
iguodala <- mutate(iguodala,minute = period *12 - minutes_remaining)
summary(iguodala)
```

    ##                  team_name    game_date             season    
    ##  Golden State Warriors:371   Length:371         Min.   :2016  
    ##                              Class :character   1st Qu.:2016  
    ##                              Mode  :character   Median :2016  
    ##                                                 Mean   :2016  
    ##                                                 3rd Qu.:2016  
    ##                                                 Max.   :2016  
    ##                                                               
    ##      period      minutes_remaining seconds_remaining shot_made_flag    
    ##  Min.   :1.000   Min.   : 0.000    Min.   : 0.00     Length:371        
    ##  1st Qu.:2.000   1st Qu.: 1.000    1st Qu.:10.00     Class :character  
    ##  Median :2.000   Median : 4.000    Median :27.00     Mode  :character  
    ##  Mean   :2.518   Mean   : 4.582    Mean   :26.75                       
    ##  3rd Qu.:4.000   3rd Qu.: 8.000    3rd Qu.:41.00                       
    ##  Max.   :4.000   Max.   :11.000    Max.   :59.00                       
    ##                                                                        
    ##  action_type         shot_type         shot_distance  
    ##  Length:371         Length:371         Min.   : 0.00  
    ##  Class :character   Class :character   1st Qu.: 1.00  
    ##  Mode  :character   Mode  :character   Median :18.00  
    ##                                        Mean   :13.69  
    ##                                        3rd Qu.:24.00  
    ##                                        Max.   :49.00  
    ##                                                       
    ##                    opponent         x            y            
    ##  Houston Rockets       : 30   0      : 74   Length:371        
    ##  Los Angeles Clippers  : 29   233    :  9   Class :character  
    ##  Portland Trail Blazers: 22   -227   :  6   Mode  :character  
    ##  Sacramento Kings      : 22   -233   :  6                     
    ##  Oklahoma City Thunder : 21   232    :  6                     
    ##  Memphis Grizzlies     : 18   9      :  6                     
    ##  (Other)               :229   (Other):264                     
    ##      minute     
    ##  Min.   : 4.00  
    ##  1st Qu.:14.00  
    ##  Median :24.00  
    ##  Mean   :25.63  
    ##  3rd Qu.:37.00  
    ##  Max.   :48.00  
    ## 

``` r
totalshotmade <- sum(iguodala$shot_made_flag == "shot_yes")/length(iguodala$name)
pt2shotmade <- sum(iguodala$shot_made_flag == "shot_yes"& iguodala$shot_type == "2PT Field Goal")/sum(iguodala$shot_type == "2PT Field Goal")
pt3shotmade <- sum(iguodala$shot_made_flag == "shot_yes"& iguodala$shot_type == "3PT Field Goal")/sum(iguodala$shot_type == "3PT Field Goal")
totalshotmade
```

    ## [1] Inf

``` r
pt2shotmade
```

    ## [1] 0.6380952

``` r
pt3shotmade
```

    ## [1] 0.3602484

From the summary of data for iguodala, The median for shot\_distance is 18, and the mean of the shot\_distance is 13.69. In addition, iguodala plays in game about 25.63 mins in every game through the whole 2016 season on average.The 2 point & 3 point effecive rate are 0.4942197 and 0.3189655.

Conclusion
==========

Based on the previous data analyze process, and the data for individual player. It is clear that player in different position will behave in different rules. All of the guard baskterball players are active in a the position which is far from the center of the court, so their average shot-distance will be longer. For Graymond Green whose position is PF, he will play the role of defence near the center of the court, so the shot distance of Graymond Green is decrease siginificantly on averge. Four of players play 22mins in every game in 2016 season on average, but iguodala may play more time in every game on avergae. Iguodala may play about 25 minutes in every game.
If we compare five players together and get the result of their shooting situation.

``` r
percentage <- arrange(
  summarise(
    group_by(shot_data, name),
    total = length(name),
    made = sum(shot_made_flag == "shot_yes"),
    percentage=sum(shot_made_flag == "shot_yes")/length(name)),
    desc(percentage)
    
)
percentage
```

    ## # A tibble: 5 x 4
    ##   name           total  made percentage
    ##   <chr>          <int> <int>      <dbl>
    ## 1 Kevin Durant     915   495      0.541
    ## 2 Andre Iguodala   371   192      0.518
    ## 3 Klay Thompson   1220   575      0.471
    ## 4 Stephen Curry   1250   584      0.467
    ## 5 Graymond Green   578   245      0.424

From the data table, Stephen Curry has the most opportunity to shot, and the number of the made shot is largest. However, Kevin Durant has the hightest shooting effective rate. Both of them are in a postition, whose main role is to get the points for the team. The data result also prove this idea.

``` r
pt2percentage <- arrange(
  summarise(
    group_by(shot_data, name),
    total = sum(shot_type == "2PT Field Goal"),
    made = sum(shot_made_flag == "shot_yes"& shot_type == "2PT Field Goal"),
    percentage=sum(shot_made_flag == "shot_yes"& shot_type == "2PT Field Goal")/sum(shot_type == "2PT Field Goal")),
    desc(percentage)
    
)
pt2percentage
```

    ## # A tibble: 5 x 4
    ##   name           total  made percentage
    ##   <chr>          <int> <int>      <dbl>
    ## 1 Andre Iguodala   210   134      0.638
    ## 2 Kevin Durant     643   390      0.607
    ## 3 Stephen Curry    563   304      0.540
    ## 4 Klay Thompson    640   329      0.514
    ## 5 Graymond Green   346   171      0.494

From the data, Addre iguodala may have the highest 2 points shooting effective rate, but the sample size of Addre iguodala is smaller than other player such as Kevin Durant orStephen Curry. Addre iguodala has less opportunities to shot 2 points shot, the total shot of 2 points is only 210, about 1/3 of Kevin Durant. Therefore, it may influence the accuracy of the effective rate. However, this may be also caused by the difference of position of different player.

``` r
pt3percentage <- arrange(
  summarise(
    group_by(shot_data, name),
    total = sum(shot_type == "3PT Field Goal"),
    made = sum(shot_made_flag == "shot_yes"& shot_type == "3PT Field Goal"),
    percentage=sum(shot_made_flag == "shot_yes"& shot_type == "3PT Field Goal")/sum(shot_type == "3PT Field Goal")),
    desc(percentage)
    
)

pt3percentage
```

    ## # A tibble: 5 x 4
    ##   name           total  made percentage
    ##   <chr>          <int> <int>      <dbl>
    ## 1 Klay Thompson    580   246      0.424
    ## 2 Stephen Curry    687   280      0.408
    ## 3 Kevin Durant     272   105      0.386
    ## 4 Andre Iguodala   161    58      0.360
    ## 5 Graymond Green   232    74      0.319

based on the 3 points shoot. Klay Thompson and Stephen Curry have a great grade on 3 points shot data. Stephen Curry gets most opportunity to shoot a 3 points shot. Also, the effective rate is pretty high. This fact from the data also support the difference of the postion. Both of Klay Thompson and Stephen Curry are played in guard postion, whose role is to get the points for the team.
