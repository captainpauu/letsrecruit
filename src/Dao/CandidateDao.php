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
                        c.job_offered,
                        j.name AS job_profile
                  FROM candidates AS c
                  JOIN jobs j ON c.job_profile_id = j.id
                  WHERE c.is_deleted = 0";

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
             ':currentCtc' => (float)$data['currentCtc'],
             ':expectedCtc' => (float)$data['expectedCtc'],
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
                                                      j.name as job_profile,
                                                      c2.name AS consult_name
                                                    FROM candidates AS c 
                                                    LEFT JOIN shortlisting s ON c.id = s.candidate_id
                                                    LEFT JOIN users u ON s.user_id = u.id
                                                    LEFT JOIN jobs j ON c.job_profile_id = j.id
                                                    LEFT JOIN consultancy c2 on c.consult_id = c2.id
                                                    WHERE c.id = :id");
        $query->execute([':id' => $id]);
        return $query->fetch();
    }

    public function updateCandidate($id, $data)
    {
        $stmt = "UPDATE candidates
                    SET fname = :fname, 
                        lname = :lname, 
                        email = :email, 
                        mobile = :mobile, 
                        birth_date = :birthDate, 
                        gender = :gender, 
                        marital_status = :maritalStatus, 
                        current_city = :currentCity, 
                        permanent_city = :permanentCity, 
                        state = :state, 
                        zip_code = :zipCode, 
                        experience = :experience,
                        current_company = :currentCompany,
                        current_ctc = :currentCtc,
                        expected_ctc = :expectedCtc,
                        skills = :skills, 
                        linkedin = :linkedIn, 
                        notice_period = :noticePeriod,
                        offer_in_hand = :offerInHand,
                        change_reason = :changeReason,
                        consult_id = :consultId,
                        referred_by = :referredBy,
                        reference = :reference,
                        job_profile_id = :jobProfileId
                    WHERE id = :id";
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
            ':currentCtc' => (float)$data['currentCtc'],
            ':expectedCtc' => (float)$data['expectedCtc'],
            ':skills' => $data['skills'],
            ':linkedIn' => $data['linkedIn'],
            ':noticePeriod' => $data['noticePeriod'],
            ':offerInHand' => (int)$data['offerInHand'],
            ':changeReason' => $data['changeReason'],
            ':consultId' => $data['consultancyId'] ? (int)$data['consultancyId'] : 0,
            ':referredBy' => $data['referredBy'],
            ':reference' => (int)$data['reference'],
            ':jobProfileId' => (int)$data['jobProfileId'],
            ':id' => $id
        ]);
        return $result;
    }

    public function deleteCandidate($id)
    {
        $query = $this->db->prepare("UPDATE candidates 
                                                SET is_deleted = 1 
                                                WHERE id = :id");
        return $query->execute([':id' => $id]);
    }
}