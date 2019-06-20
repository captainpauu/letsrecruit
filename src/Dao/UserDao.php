<?php


namespace App\Dao;


class UserDao extends BaseDao
{
    /**
     * @param $username
     * @param $password
     * @return mixed
     */
    public function validateUser($username, $password)
    {
        $query = $this->db->prepare("SELECT * FROM users 
                                              WHERE user_name = :un AND password = :pwd");
        $query->execute(array(':un' => $username, ':pwd' => $password));
        $result = $query->fetch();
        return $result;
    }

    /**
     * @return array
     */
    public function getAllUsers() : array
    {
        $stmt = "SELECT 
                        u.id,
                        u.name,
                        u.email,
                        u.role,
                        t.tech_name
                     FROM users as u 
                     JOIN technology t on u.technology = t.id
                     WHERE is_deleted = 0";

        $query = $this->db->query($stmt);
        $result = $query->fetchAll();
        return $result;
    }

    /**
     * @param $data
     * @return bool
     */
    public function candidateShortlisting($data) : bool
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

    public function offerJob($id)
    {
        $query = $this->db->prepare("UPDATE candidates 
                                                SET job_offered = 1 
                                                WHERE id = :id");
        return $query->execute([':id' => $id]);
    }

    /**
     * @param $data
     * @return bool
     */
    public function insertUser($data) : bool
    {
        $stmt = "INSERT INTO users (
                   name, 
                   email, 
                   user_name, 
                   password, 
                   role, 
                   technology
                   ) values (
                             :name,
                             :email,
                             :userName,
                             :password,
                             :role,
                             :technology
                   )";

        $query = $this->db->prepare($stmt);
        $result = $query->execute([
            ':name' => $data['name'],
            ':email' => $data['email'],
            ':userName' => $data['userName'],
            ':password' => $data['password'],
            ':role' => $data['role'],
            ':technology' => $data['technology']
        ]);
        return $result;
    }

    /**
     * @param $email
     * @return mixed
     */
    public function isUserEmailExists($email)
    {
        $query = $this->db->prepare("SELECT * FROM users
                                              WHERE email = :em");
        $query->execute([':em' => $email]);
        return $query->fetch();
    }

    public function updateUser()
    {
        return '';
    }

    public function deleteUser($id)
    {
        $query = $this->db->prepare("UPDATE users 
                                                SET is_deleted = 1 
                                                WHERE id = :id");
        return $query->execute([':id' => $id]);
    }
}