<?php


namespace App\Dao;


class TechnologyDao extends BaseDao
{
    /**
     * @return mixed
     */
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

    public function insertTechnology($data)
    {
        $query = $this->db->prepare('INSERT INTO technology(tech_name) values(:techName)');
        $result = $query->execute([':techName' => $data['newTech']]);
        return $result;
    }
}