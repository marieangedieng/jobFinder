<?php
namespace App\Observers;

use App\Models\Job;
use Illuminate\Support\Facades\Auth;

class JobObserver
{
    public function created(Job $job)
    {
        $company = $job->company;

        if ($company->userPlan) {
            $company->userPlan->decrement('job_limit');

            if ($job->featured) {
                $company->userPlan->decrement('featured_job_limit');
            }

            if ($job->highlight) {
                $company->userPlan->decrement('highlight_job_limit');
            }
        }
    }
}
