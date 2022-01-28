<?php
  
  $dbUser = 'misc01';
  $dbPass = '!howTO001';
  $dbHost = 'thingiverse';
  
  $GLOBALS['tiv']['pdo'] = '';
  
  	$options = [
	    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
	    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	    PDO::ATTR_EMULATE_PREPARES   => false,
//			    PDO::ATTR_PERSISTENT				 => true,
	];
	try {
		$GLOBALS['tiv']['pdo'] = new PDO(
	  	$dsn = 'mysql:host=localhost;dbname='.$dbHost.';charset=utf8', 
	    $dbUser,
	    $dbPass,
	    $options);
	} catch (\PDOException $e) {
	  	sysLogWrite(' Database connection failed: ' . $e->getMessage());
			echo('System Error');
	   die();
	}