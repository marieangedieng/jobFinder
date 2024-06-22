<?php

namespace App\Services;

use App\Commands\HireCandidateCommand;
use App\Models\Hired;
use App\Models\Job;
use App\Models\User;
use Illuminate\Support\Facades\Notification;
use App\Notifications\CandidateHired;

class HireCandidateHandler
{
    public function handle(HireCandidateCommand $command)
    {
        // Create the hired record
        Hired::create([
            'candidate_id' => $command->candidateId,
            'job_id' => $command->jobId,
        ]);

        // Send notification to the candidate
        $candidate = User::find($command->candidateId);
        $job = Job::find($command->jobId);

        Notification::send($candidate, new CandidateHired($job));
    }
}
