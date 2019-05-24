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
        return '';
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