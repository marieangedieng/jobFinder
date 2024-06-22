<?php

namespace App\Commands;

class HireCandidateCommand
{
    public $candidateId;
    public $jobId;

    public function __construct($candidateId, $jobId)
    {
        $this->candidateId = $candidateId;
        $this->jobId = $jobId;
    }
}
