<?php


namespace App\Dao;


class CandidateDao extends BaseDao
{
    /**
     * @return array
     */
    public function getAllCandidates() : array
    {
        $stmt = "SELECT 
                        c.id,
                        c.fname,
                        c.lname,
                        c.experience,
                        c.current_ctc,
                        c.expected_ctc,
                        c.notice_period,
                        c.offer_in_hand,
                        j.name as job_profile
                  FROM candidates AS c
                  JOIN jobs j on c.job_profile_id = j.id";

        $query = $this->db->query($stmt);
        $result = $query->fetchAll();
        return $result;
    }

    /**
     * @param $email
     * @return mixed
     */
    public function isCandidateEmailExists($email)
    {
        $query = $this->db->prepare("SELECT * FROM candidates
                                              WHERE email = :em");
        $query->execute([':em' => $email]);
        return $query->fetch();
    }

    /**
     * @param $data
     * @return bool
     */
    public function insertCandidate($data) : bool
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
                       reference,
                       job_profile_id
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
                                 :reference,
                                 :jobProfileId
                       )";

        $query = $this->db->prepare($stmt);
        $result = $query->execute([
             ':fname' => $data['fname'],
             ':lname' => $data['lname'],
             ':email' => $data['email'],
             ':mobile' => $data['mobile'],
             ':birthDate' => $data['birthDate'],
             ':gender' => (int)$data['gender'],
             ':maritalStatus' => (int)$data['maritalStatus'],
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
             ':offerInHand' => (int)$data['offerInHand'],
             ':changeReason' => $data['changeReason'],
             ':consultId' => (int)$data['consultancyId'],
             ':referredBy' => $data['referredBy'],
             ':reference' => (int)$data['reference'],
             ':jobProfileId' => (int)$data['jobProfileId']
        ]);
        return $result;
    }

    /**
     * @param $email
     * @param $fileName
     * @return bool
     */
    public function insertResumeName($email, $fileName) : bool
    {
        $query = $this->db->prepare("UPDATE candidates 
                                                SET resume = :fileName 
                                                WHERE email = :email");
        return $query->execute([':fileName' => $fileName, ':email' => $email]);
    }

    /**
     * @param $id
     * @return mixed
     */
    public function getCandidateById($id)
    {
        $query = $this->db->prepare("SELECT c.*,
                                                      s.is_shortlisted,
                                                      s.shortlist_date,
                                                      u.name,
                                                      j.name as job_profile
                                                    FROM candidates as c 
                                                    LEFT JOIN shortlisting s on c.id = s.candidate_id
                                                    LEFT JOIN users u on s.user_id = u.id
                                                    LEFT JOIN jobs j on c.job_profile_id = j.id
                                                    WHERE c.id = :id");
        $query->execute([':id' => $id]);
        return $query->fetch();
    }

    public function deleteCandidate()
    {
        return '';
    }
}