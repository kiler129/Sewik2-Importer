<?php
namespace Sewik2\Importer;


use RuntimeException;
use UnderflowException;

class XmlParser {
    const XML_CHUNK = 8192;

    /** @var string Path to currently processed XML file */
    private $xmlFilePath;
    /** @var resource File handler (returned by fopen()) */
    private $xmlFileHandler;
    /** @var object Instance of xml_parser */
    private $saxParser;

    /** @var string Original file charset */
    private $charset = 'ISO-8859-2';

    /** @var array Currently processed accident, not yet completed */
    private $incompleteAccident = [];
    /** @var array Completed accidents */
    private $accidentsStack = [];

    public function __construct($file)
    {
        if(!in_array('convert.iconv.*', stream_get_filters())) {
            throw new RuntimeException("Iconv is not installed but required by ".__CLASS__);
        }



        if(!is_readable($file)) {
            throw new InvalidArgumentException("Given XML file $file is unreadable");
        }

        $this->xmlFilePath = $file;
        $this->bootstrapParser();
    }

    /**
     * Initialize XML SAX parser.
     */
    private function bootstrapParser()
    {
        $this->saxParser = xml_parser_create("UTF-8");
        if(!xml_set_object($this->saxParser, $this)) {
            throw new RuntimeException("xml_set_object() failed");
        }

        xml_set_element_handler($this->saxParser, [$this, '_xmlElementStart'], [$this, '_xmlElementEnd']);
    }

    /**
     * Specifies original file charset.
     *
     * @param $charset string Any valid charset.
     */
    public function setFileCharset($charset)
    {
        $this->charset = $charset;
    }

    /**
     * Loads file into file handler with proper encoding.
     *
     * @param $file string Path to XML file.
     *
     * @return bool
     */
    private function loadFile($file)
    {
        $charset = urlencode('convert.iconv.' . $this->charset . '/UTF-8');
        $file = "php://filter/read=$charset/resource=$file";

        $this->xmlFileHandler = fopen($file, 'r');

        return (bool)$this->xmlFileHandler;
    }

    private function _xmlElementStart($parser, $name, $attrs)
    {
        //echo "S->$name\n";
    }

    private function _xmlElementEnd($parser, $name)
    {
        //echo "E<-$name\n\n";

        if($name === "ZDARZENIE") {
            echo "END OF zdarzenie\n";
            $this->accidentsStack[] = 'abc';
        }
    }

    /**
     *
     */
    private function parseChunk()
    {
        while(!feof($this->xmlFileHandler) && empty($this->accidentsStack)) {
            $data = fread($this->xmlFileHandler, self::XML_CHUNK);
            xml_parse($this->saxParser, $data, feof($this->xmlFileHandler));
        }
    }

    public function hasNext()
    {
        if(!empty($this->accidentsStack)) {
            return true;
        }

        $this->parseChunk();
        return !empty($this->accidentsStack);
    }

    /**
     * Return one accident.
     * Due to performance reasons it's always last parsed elements. Since one pass can return more than single accident
     * this method DO NOT guarantee returned elements order will be the same as in XML file.
     *
     * @return mixed
     */
    public function getAccident()
    {
        $accident = array_pop($this->accidentsStack);

        if($accident === null) {
            throw new UnderflowException("Accidents stack is empty - cannot get one!");
        }

        return $accident;
    }

    public function load()
    {
        $this->gotAccident = false;
        $this->accidentsStack = [];

        if(!$this->loadFile($this->xmlFilePath)) {
            throw new RuntimeException("Failed to open file");
        }
    }

}
