
<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<?php

$domain=ereg_replace('[^\.]*\.(.*)$','\1',$_SERVER['HTTP_HOST']);
$group_name=ereg_replace('([^\.]*)\..*$','\1',$_SERVER['HTTP_HOST']);
$themeroot='r-forge.r-project.org/themes/rforge/';

echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en   ">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><?php echo $group_name; ?></title>
	<link href="http://<?php echo $themeroot; ?>styles/estilo1.css" rel="stylesheet" type="text/css" />
  </head>

<body bgcolor=CCCCFF>

<!-- R-Forge Logo -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="http://r-forge.r-project.org/"><img src="http://<?php echo $themeroot; ?>/imagesrf/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>


<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->

<font face="helvetica, verdana, arial"> 

<?php if ($handle=fopen('http://'.$domain.'/export/projtitl.php?group_name='.$group_name,'r')){
$contents = '';
while (!feof($handle)) {
	$contents .= fread($handle, 8192);
}
fclose($handle);
echo $contents; } ?>

<!-- end of project description -->

<p>From a baseline data frame of dead individuals recorded daily at different road stretches (like the <i>roadkills</i> sample dataset provided with the package), you can simulate varying sampling schemes (i.e. surveys at increasing intervals), determine roadkill hotspots based on each sampling scheme, and compare hotspot patterns between sampling schemes and the baseline data.</p>

<h2> Install and load </h2>
<p> To install <i>DeadCanMove</i> directly from R-Forge, paste the following command in the R console when connected to the internet:</p>
<code>
install.packages("DeadCanMove", repos="http://R-Forge.R-project.org")<br />
</code>
<p> This normally requires the latest R version. Otherwise, you can download the <a href="http://r-forge.r-project.org/R/?group_id=1875">compressed source files</a> (either <i>.tar.gz</i> or <i>.zip</i>) and then install the package from your disk (something like "<i>Packages - Install packages from local zip files</i>", or "<i>Tools - Install packages - Install from: Package Archive File</i>", or "<i>Packages & Data - Package installer, Packages repository - Local binary package</i>", ... depending on your R menu interface).</p>

<p> Then, each time you start a new R session, use the following commands to load the package and maybe check out its help files:</p>

<code>
library(DeadCanMove)<br />
help("DeadCanMove")<br />
?hotspots.comparison<br />
</code><br />

<h2> Usage example </h2>
<p> The following commands will load the package and the <i>roadkills</i> sample dataset, get a look at a part of these data, and see how roadkill patterns obtained from increasingly sparse sampling relate to those obtained from the whole (baseline) data, as is done in Santos et al. (submitted):</p>
<code>
library(DeadCanMove)<br>
data(roadkills)<br><br>
roadkills[780:790, 1:10]<br><br>
hotspots.comparison(dataset = roadkills, sampl.columns = 4:ncol(roadkills), sampl.intervals = 1:30, region.column = "segment", group.column = "taxon", include.all.together = TRUE, confidence = 0.95, min.total.events = 80, min.hotspot.threshold = 2, comp.method = "Phi", plot = TRUE, sep.plots = FALSE, omit.baseline.interval = TRUE, pch = 20, ylim = c(0, 1))<br>
</code><br />

<h2> References </h2>
<p>This package is a companion to the following article, which should be cited if you use it:</p>
<p><i> Santos S.M., Marques J.T., Louren&ccedil;o A., Medinas D., Barbosa A.M., Beja P., Mira A. (submitted) Dead can move? Sampling effects on the identification of roadkill hotspots and implications for survey design and mitigation.</i></p>
<p>To see how to cite the package itself, load it in R and type <code>citation(package="DeadCanMove")</code></p>

<p> The R-Forge project summary page is found <a href="http://<?php echo $domain; ?>/projects/<?php echo $group_name; ?>/">here</a>. </p>

</font> 
</body>
</html>
