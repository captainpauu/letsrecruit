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

    public function isCandidateEmailExists($email)
    {
        $query = $this->db->prepare("SELECT * FROM candidates
                                              WHERE email = :em");
        $query->execute(array(':em' => $email));
        return $query->fetch();
    }

    public function insertCandidate($data)
    {
        $stmt = "INSERT INTO candidates(
                       fname, 
                       lname, 
                       email, 
                       mobile, 
                       birth_date, 
                       gender, 
                       marital_status, 
                       current_city, 
                       permanent_city, 
                       state, 
                       zip_code, 
                       experience,
                       current_company,
                       current_ctc,
                       expected_ctc,
                       skills, 
                       linkedin, 
                       notice_period,
                       offer_in_hand,
                       change_reason,
                       consult_id,
                       referred_by,
                       reference
                       ) values (
                                 :fname,
                                 :lname,
                                 :email, 
                                 :mobile, 
                                 :birthDate, 
                                 :gender, 
                                 :maritalStatus, 
                                 :currentCity, 
                                 :permanentCity, 
                                 :state, 
                                 :zipCode,
                                 :experience,
                                 :currentCompany, 
                                 :currentCtc,
                                 :expectedCtc,
                                 :skills, 
                                 :linkedIn, 
                                 :noticePeriod,
                                 :offerInHand,
                                 :changeReason, 
                                 :consultId,
                                 :referredBy,
                                 :reference
                       )
                ";
        $query = $this->db->prepare($stmt);
        $result = $query->execute([
             ':fname' => $data['fname'],
             ':lname' => $data['lname'],
             ':email' => $data['email'],
             ':mobile' => $data['mobile'],
             ':birthDate' => $data['birthDate'],
             ':gender' => $data['gender'],
             ':maritalStatus' => $data['maritalStatus'],
             ':currentCity' => $data['currentCity'],
             ':permanentCity' => $data['permanentCity'],
             ':state' => $data['state'],
             ':zipCode' => $data['zipCode'],
             ':experience' => $data['experience'],
             ':currentCompany' => $data['currentCompany'],
             ':currentCtc' => $data['currentCtc'],
             ':expectedCtc' => $data['expectedCtc'],
             ':skills' => $data['skills'],
             ':linkedIn' => $data['linkedIn'],
             ':noticePeriod' => $data['noticePeriod'],
             ':offerInHand' => $data['offerInHand'],
             ':changeReason' => $data['changeReason'],
             ':consultId' => $data['consultId'],
             ':referredBy' => $data['referredBy'],
             ':reference' => $data['reference']
        ]);
        return $result;
    }

    public function insertResumeName($email, $fileName)
    {
        $query = $this->db->prepare("UPDATE candidates 
                                                SET resume = :fileName 
                                                WHERE email = :email");
        return $query->execute([$fileName, $email]);
    }

    public function deleteCandidate()
    {
        return '';
    }
}