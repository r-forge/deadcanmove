
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

<body>

<!-- R-Forge Logo -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="http://r-forge.r-project.org/"><img src="http://<?php echo $themeroot; ?>/imagesrf/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>


<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->

<?php if ($handle=fopen('http://'.$domain.'/export/projtitl.php?group_name='.$group_name,'r')){
$contents = '';
while (!feof($handle)) {
	$contents .= fread($handle, 8192);
}
fclose($handle);
echo $contents; } ?>

<!-- end of project description -->

<p>From a baseline data frame of dead individuals recorded daily at different road stretches, you can simulate varying sampling schemes (e.g. surveys every other day, every 5 days, once a month...), determine roadkill hotspots based on each sampling scheme, and compare hotspot patterns between sampling schemes and the baseline data.</p>

<h2> Install and load </h2>
<p> To install <i>DeadCanMove</i> directly from R-Forge, paste the following command in the R console when connected to the internet:</p>
<code>
install.packages("DeadCanMove", repos="http://R-Forge.R-project.org")<br />
</code>
<p> If this fails, you can download the <a href="http://r-forge.r-project.org/R/?group_id=1875">compressed source files</a> and then install the package from your disk  (something like "<i>Packages - Install packages from local zip files</i>", or "<i>Tools - Install packages - Install from: Package Archive File</i>", ... depending on your R interface).</p>

<p> Then, each time you start a new R session, use the following commands to load the package and maybe check out its help files:</p>

<code>
library(DeadCanMove)<br />
help("DeadCanMove")<br />
?hotspots.comparison<br />
</code>

<p> You can then run some of the examples provided at the bottom of the help files, to see how the fuctions can be used and what their outputs look like.</p>

<h2> References </h2>

<p><i> This package is a companion to the following article:</i></p>

<p> Santos S.M., Marques J.T., Louren&ccedil;o A., Medinas D., Barbosa A.M., Beja P., Mira A. (<i>under revision</i>) Dead can move? Effects of sampling frequency on the identification of roadkill hotspots.</p>


<p> The <strong>project summary page</strong> you can find <a href="http://<?php echo $domain; ?>/projects/<?php echo $group_name; ?>/"><strong>here</strong></a>. </p>

</body>
</html>
