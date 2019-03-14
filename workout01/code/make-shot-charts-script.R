----
title:  make-shot-charts-script 
description: shot charts about players in Golden State Warriors
input(s): "nba-court.jpg" 
output(s): "klay-thompson-shot-chart.pdf","andre-iguodala-shot-chart.pdf, "draymond-green-shot-chart.pdf","kevin-durant-shot-chart.pdf","stephen-curry-shot-chart.pdf","gsw-shot-charts.pdf"   
----
```{r}
court_file <- "C:/Users/89893/Desktop/workout01/images/nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
klay_shot_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
pdf(file="klay-thompson-shot-chart.pdf", width = 6.5,height=5)
dev.off()
```

```{r}
court_file <- "C:/Users/89893/Desktop/workout01/images/nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
andre_iguodala_shot_chart <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: andreiguodala (2016 season)') + theme_minimal()
pdf(file="andre-iguodala-shot-chart.pdf", width = 6.5,height=5)
dev.off()
```
```{r}
court_file <- "C:/Users/89893/Desktop/workout01/images/nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
draymond_green_shot_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: green (2016 season)') + theme_minimal()
pdf(file="draymond-green-shot-chart.pdf", width = 6.5,height=5)
dev.off()
```

```{r}
court_file <- "C:/Users/89893/Desktop/workout01/images/nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
kevin_durant_shot_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: durant (2016 season)') + theme_minimal()
pdf(file="kevin-durant-shot-chart.pdf", width = 6.5,height=5)
dev.off()
```

```{r}
court_file <- "C:/Users/89893/Desktop/workout01/images/nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
stephen_curry_shot_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: curry (2016 season)') + theme_minimal()
pdf(file="stephen-curry-shot-chart.pdf", width = 6.5,height=5)
dev.off()
```
```{r}
court_file <- "C:/Users/89893/Desktop/workout01/images/nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
gsw_shot_charts <- ggplot(data = rbind(curry,durant,green,iguodala,thompson,deparse.level = 1)) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: gsw (2016 season)') + theme_minimal()
pdf(file="gsw-shot-charts.pdf", width = 8,height=7)
dev.off()
```
