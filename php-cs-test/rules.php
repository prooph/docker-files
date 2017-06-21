<?php

require '/composer/vendor/autoload.php';

$config = new Prooph\CS\Config\Prooph();
$config->getFinder()->in('/app');
$config->setCacheFile('/tmp/.php_cs.cache');

return $config;
