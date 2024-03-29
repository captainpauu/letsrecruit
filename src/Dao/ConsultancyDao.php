<?php


namespace App\Dao;


use PDO;

class ConsultancyDao extends BaseDao
{
    public function __construct(PDO $db)
    {
        parent::__construct($db);
    }

    public function getAllConsultancies()
    {
        $query = $this->db->query('SELECT * FROM consultancy WHERE is_deleted = 0');
        $result = $query->fetchAll();
        return $result;
    }

    public function getAllConsults()
    {
        $query = $this->db->query('SELECT * 
                                                FROM consults ct
                                                JOIN consultancy cy on ct.consultancy_id = cy.id 
                                                WHERE ct.is_deleted = 0');
        $result = $query->fetchAll();
        return $result;
    }
}