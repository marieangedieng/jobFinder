<?php

namespace Database\Seeders;

use App\Models\JobCategory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class JobCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $top_job_categories = array(
            "Accounting/Finance",
            "Administration",
            "Advertising",
            "Agriculture",
            "Arts/Entertainment",
            "Banking",
            "Construction",
            "Customer Service",
            "Education/Training",
            "Engineering",
            "Government/Military",
            "Healthcare",
            "Human Resources",
            "Information Technology",
            "Legal",
            "Management",
            "Manufacturing",
            "Communications",
            "Nonprofit",
            "Real Estate",
            "Restaurant/Food Service",
            "Retail",
            "Sales",
            "Science/Biotech",
            "Telecommunications",
            "Transportation",
            "Travel/Hospitality",
            "Warehousing",
            "Writing/Editing",
            "Other"
        );

        foreach ($top_job_categories as $item) {
            $category = JobCategoryFactory::create($item);
            $category->save();
        }
    }
}
