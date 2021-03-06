<?php

namespace DoctrineProxies\__CG__\Mparaiso\Shortener\Entity;

/**
 * THIS CLASS WAS GENERATED BY THE DOCTRINE ORM. DO NOT EDIT THIS FILE.
 */
class Link extends \Mparaiso\Shortener\Entity\Link implements \Doctrine\ORM\Proxy\Proxy
{
    private $_entityPersister;
    private $_identifier;
    public $__isInitialized__ = false;
    public function __construct($entityPersister, $identifier)
    {
        $this->_entityPersister = $entityPersister;
        $this->_identifier = $identifier;
    }
    /** @private */
    public function __load()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;

            if (method_exists($this, "__wakeup")) {
                // call this after __isInitialized__to avoid infinite recursion
                // but before loading to emulate what ClassMetadata::newInstance()
                // provides.
                $this->__wakeup();
            }

            if ($this->_entityPersister->load($this->_identifier, $this) === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            unset($this->_entityPersister, $this->_identifier);
        }
    }

    /** @private */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    
    public function getId()
    {
        if ($this->__isInitialized__ === false) {
            return (int) $this->_identifier["id"];
        }
        $this->__load();
        return parent::getId();
    }

    public function setIsCustom($isCustom)
    {
        $this->__load();
        return parent::setIsCustom($isCustom);
    }

    public function getIsCustom()
    {
        $this->__load();
        return parent::getIsCustom();
    }

    public function setIdentifier($identifier)
    {
        $this->__load();
        return parent::setIdentifier($identifier);
    }

    public function getIdentifier()
    {
        $this->__load();
        return parent::getIdentifier();
    }

    public function setCreatedAt($createdAt)
    {
        $this->__load();
        return parent::setCreatedAt($createdAt);
    }

    public function getCreatedAt()
    {
        $this->__load();
        return parent::getCreatedAt();
    }

    public function addVisit(\Mparaiso\Shortener\Entity\Visit $visits)
    {
        $this->__load();
        return parent::addVisit($visits);
    }

    public function removeVisit(\Mparaiso\Shortener\Entity\Visit $visits)
    {
        $this->__load();
        return parent::removeVisit($visits);
    }

    public function getVisits()
    {
        $this->__load();
        return parent::getVisits();
    }

    public function setUrl(\Mparaiso\Shortener\Entity\Url $url = NULL)
    {
        $this->__load();
        return parent::setUrl($url);
    }

    public function getUrl()
    {
        $this->__load();
        return parent::getUrl();
    }


    public function __sleep()
    {
        return array('__isInitialized__', 'id', 'is_custom', 'identifier', 'created_at', 'visits', 'url');
    }

    public function __clone()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;
            $class = $this->_entityPersister->getClassMetadata();
            $original = $this->_entityPersister->load($this->_identifier);
            if ($original === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            foreach ($class->reflFields as $field => $reflProperty) {
                $reflProperty->setValue($this, $reflProperty->getValue($original));
            }
            unset($this->_entityPersister, $this->_identifier);
        }
        
    }
}