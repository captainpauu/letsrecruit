<?php


namespace App\Dao;


class UserDao
{
    protected $db;

    public function __construct(\PDO $db)
    {
        $this->db = $db;
    }

    public function validateUser($username, $password)
    {
        $query = $this->db->prepare("SELECT * FROM users 
                                              WHERE user_name = :un AND password = :pwd");
        $query->execute(array(':un' => $username, ':pwd' => $password));
        $result = $query->fetch();
        return $result;
    }

    public function getAllUsers()
    {
        $stmt = "SELECT 
                        u.id,
                        u.name,
                        u.email,
                        u.role,
                        t.tech_name
                     FROM users as u 
                     JOIN technology t on u.technology = t.id";

        $query = $this->db->query($stmt);
        $result = $query->fetchAll();
        return $result;
    }

    public function candidateShortlisting($data)
    {
        $stmt = "INSERT INTO shortlisting(
                         candidate_id,
                         user_id, 
                         is_shortlisted, 
                         shortlist_date
                         ) values (
                                  :candidateId,
                                  :userId,
                                  :isShortlisted,
                                  :shortlistDate
                         )";

        $query = $this->db->prepare($stmt);
        $result = $query->execute([
            ':candidateId' => (int)$data['candidateId'],
            ':userId' => (int)$data['userId'],
            ':isShortlisted' => (int)$data['status'],
            ':shortlistDate' => date("Y/m/d")
        ]);
        return $result;
    }

    public function getUserById()
    {
        return '';
    }

    public function addUser()
    {
        return '';
    }

    public function updateUser()
    {
        return '';
    }

    public function deleteUser()
    {
        return '';
    }
}