<?php


namespace App\Dao;


class TechnologyDao
{
    protected $db;

    public function __construct(\PDO $db)
    {
        $this->db = $db;
    }

    public function getAllTechnologies()
    {
        $stmt = "SELECT 
                        t.id,
                        t.tech_name
                     FROM technology as t";

        $query = $this->db->query($stmt);
        $result = $query->fetchAll();
        return $result;
    }
}