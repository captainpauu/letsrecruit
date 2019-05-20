<?php


namespace App\Dao;


class CandidateDao
{
    protected $db;

    public function __construct(\PDO $db)
    {
        $this->db = $db;
    }

    public function getAllCandidates()
    {
        $query = $this->db->query('select * from candidates');
        $result = $query->fetchAll();
        return $result;
    }

    public function getCandidateById()
    {
        return '';
    }

    public function addCandidate()
    {
        return '';
    }

    public function updateCandidate()
    {
        return '';
    }

    public function deleteCandidate()
    {
        return '';
    }
}