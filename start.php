<?php
require_once('vendor/autoload.php');

use Sewik2\Importer\XmlParser;

$loader = new XmlParser('test.xml');
$loader->load();

echo "Has next?\n";
var_dump($loader->hasNext());
echo "GET ACC\n";
$loader->getAccident();

echo "\nHas next?\n";
var_dump($loader->hasNext());
echo "GET ACC\n";
$loader->getAccident();

echo "\nHas next?\n";
var_dump($loader->hasNext());
echo "GET ACC\n";
$loader->getAccident();

echo "\nHas next?\n";
var_dump($loader->hasNext());
echo "GET ACC\n";
$loader->getAccident();
