<?php


namespace App\Dao;


class JobsDao
{
    protected $db;

    public function __construct(\PDO $db)
    {
        $this->db = $db;
    }

    public function getAllJobs()
    {
        $query = $this->db->query('select j.*, t.tech_name from jobs j JOIN technology t on j.job_technology = t.id');
        $result = $query->fetchAll();
        return $result;
    }

    public function insertJob($data)
    {
        $stmt = "INSERT INTO jobs (
                  name, 
                  req_experience, 
                  location, 
                  salary, 
                  description,
                  job_technology
                  ) values(
                           :name,
                           :reqExp,
                           :location,
                           :salary,
                           :description,
                           :tech
                  )";

        $query = $this->db->prepare($stmt);
        $result = $query->execute([
            ':name' => $data['name'],
            ':reqExp' => $data['experience'],
            ':location' => $data['location'],
            ':salary' => $data['salary'],
            ':description' => $data['description'],
            ':tech' => (int)$data['technology']
        ]);
        return $result;
    }

}