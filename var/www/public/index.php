<html>
<head>
	<title>Hello world!</title>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
	<style>
	body {
		background-color: white;
		text-align: center;
		padding: 50px;
		font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
	}

	#logo {
		margin-bottom: 40px;
	}
	</style>
</head>
<body>
	<h1><?php echo "Hello ".(isset($_ENV["NAME"])?$_ENV["NAME"]:"world")."!"; ?></h1>
  <h3>Hostname: <?php echo gethostname(); ?></h3>
	<?php
	$links = [];
	foreach($_ENV as $key => $value) {
		if(preg_match("/^(.*)_PORT_([0-9]*)_(TCP|UDP)$/", $key, $matches)) {
			$links[] = [
				"name" => $matches[1],
				"port" => $matches[2],
				"proto" => $matches[3],
				"value" => $value
			];
		}
	}
	if($links) {
	?>
		<h3>Links found</h3>
		<?php
		foreach($links as $link) {
			?>
			<b><?php echo $link["name"]; ?></b> listening in <?php echo $link["port"]+"/"+$link["proto"]; ?> available at <?php echo $link["value"]; ?><br />
			<?php
		}
		?>
	<?php
	}
  ?>

  <?php if (ini_get('newrelic.enabled')): ?>
		<h3>I report to NewRelic!</h3>
    Lizense: <b><?= substr(ini_get('newrelic.license'), 0, 6); ?>...</b><br/>
    App name: <b><?= ini_get('newrelic.appname'); ?></b><br/>
  <?php endif; ?>

  <?php if(isset($_ENV["TUTUM_AUTH"])): ?>
		<h3>I have Tutum API powers!</h3>
  <?php endif; ?>
</body>
</html>