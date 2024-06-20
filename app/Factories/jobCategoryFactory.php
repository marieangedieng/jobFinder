<?php

namespace App\Factories;

use App\Models\JobCategory;
class jobCategoryFactory
{
    public static function create($name, $icon = 'fas fa-dot-circle') {
        $category = new JobCategory();
        $category->name = $name;
        $category->icon = $icon;
        return $category;
    }
}
