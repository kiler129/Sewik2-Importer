<?php
/*
 * @author Grzegorz Zdanowski <grzegorz129@gmail.com>
 *
 * @project SewikImporter
 * @package 
 */

class XmlParser {
    private $xmlFile;
    private $xml = '';
    private $charset = 'ISO-8859-2';

    public function __construct($file)
    {

        if(!in_array('convert.iconv.*', stream_get_filters())) {
            throw new RuntimeException("Iconv is not installed but required by ".__CLASS__);
        }

        if(!is_readable($file)) {
            throw new InvalidArgumentException("Given XML file $file is unradable");
        }

        $this->xmlFile = $file;
    }

    public function setFileCharset($charset)
    {
        $this->charset = $charset;
    }

    private function loadFile($file)
    {
        $charset = urlencode('convert.iconv.'.$this->charset.'/UTF-8');
        $uri = "php://filter/read=$charset/resource=$file";
        $this->xml = file_get_contents($uri);

        return ($this->xml !== false);
    }

    private function parseXml() {
        if(empty($this->xml)) {
            throw new LogicException("There's nothing to parse (empty XML)");
        }

        $this->xml = simplexml_load_string($this->xml); //Reuse memory
        gc_collect_cycles(); //Ensure GC to run now (it can slow down importing significantly)

        return is_object($this->xml);
    }

    public function load()
    {
        if(!$this->loadFile($this->xmlFile)) {
            throw new RuntimeException("Failed to load file into memory");
        }

        if(!$this->parseXml()) {
            throw new RuntimeException("Failed to parse XML into object");
        }
    }

    public function getData() {
        return $this->xml;
    }
}
