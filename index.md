---
title       : MD Home Price Pitch Deck 
subtitle    : Course Project Developing Data Products
author      : Asfa L.
date        : 05/20/15
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [interactive]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## MD Home Prices App - Why?

When people are looking to buy or sell a home they may be interested in comparing the current price to historical prices to see how the value has appreciated. Furthermore, they may want to see what the home may cost in a year.

--- .class #id 

## MD Home Prices App - What?

The app takes the price of a home as an input and upon pressing "Submit" it calculates the price of the  home in 1990, 2005, 2010, 2014 and 2016.  The 2016 price is based on a forecast by Zillow. The scond tab in the app uses GoogleVis to create an intereactive plot of the home prices calculated in the first tab.

The historical prices were calculated based on data from he following websites:

http://www.neighborhoodscout.com/md/rates/

The Zillow forecast data can be found at:

http://www.zillow.com/md/home-values/


--- .class #id 

## MD Home Prices App - How? (Prices)

The app takes the price input by the user and divides it by the appreciation rate for that year to obtain the price of the home that year. For the forecast it multiplies the price input by 1 plus the rate of appreciation. Below is an example with the input price of $200,000


```r
homePrice<- 200000
costninety <-  homePrice / 2.1325
costofive <- homePrice / 1.057
costten <-homePrice / 1.0031
costfourteen <-  homePrice /  1.0376
costsixteen <- homePrice * 1.026
```



--- &interactive

## MD Home Prices App - How? (Interactive Plot)

The plot then takes all the outputs and puts them in a data frame along with the corresponding years to create an interactive plot showing visually the increase in price since 1990.


```r
require(googleVis)

  y<- c(costninety, costofive, costten, costfourteen, costsixteen)
  x<- c("1990", "2005", "2010", "2014", "2016")
      df=data.frame(x,y)
      names(df)<-c("Year", "Price")
 Line<-gvisLineChart(df, yvar ="Price", options = list(title="Your MD Home Price Plot"))
 print(Line, tag= 'chart')
```

<!-- LineChart generated in R 3.2.0 by googleVis 0.5.8 package -->
<!-- Fri May 22 10:51:11 2015 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataLineChartIDc2834053a17 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "1990",
93786.6354 
],
[
 "2005",
189214.7588 
],
[
 "2010",
199381.9161 
],
[
 "2014",
192752.5058 
],
[
 "2016",
205200 
] 
];
data.addColumn('string','Year');
data.addColumn('number','Price');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartLineChartIDc2834053a17() {
var data = gvisDataLineChartIDc2834053a17();
var options = {};
options["allowHtml"] = true;
options["title"] = "Your MD Home Price Plot";

    var chart = new google.visualization.LineChart(
    document.getElementById('LineChartIDc2834053a17')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartLineChartIDc2834053a17);
})();
function displayChartLineChartIDc2834053a17() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartLineChartIDc2834053a17"></script>
 
<!-- divChart -->
  
<div id="LineChartIDc2834053a17" 
  style="width: 500; height: automatic;">
</div>

