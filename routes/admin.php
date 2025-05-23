<?php

use App\Http\Controllers\Admin\AboutController;
use App\Http\Controllers\Admin\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Admin\Auth\ConfirmablePasswordController;
use App\Http\Controllers\Admin\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Admin\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Admin\Auth\NewPasswordController;
use App\Http\Controllers\Admin\Auth\PasswordController;
use App\Http\Controllers\Admin\Auth\PasswordResetLinkController;
use App\Http\Controllers\Admin\Auth\RegisteredUserController;
use App\Http\Controllers\Admin\Auth\VerifyEmailController;
use App\Http\Controllers\Admin\BlogController;
use App\Http\Controllers\Admin\CountryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\IndustryTypeController;
use App\Http\Controllers\Admin\OrganizationTypeController;
use App\Http\Controllers\Admin\StateContriller;
use App\Http\Controllers\Admin\StateController;
use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\ClearDatabaseController;
use App\Http\Controllers\Admin\CounterController;
use App\Http\Controllers\Admin\CustomPageBuilderController;
use App\Http\Controllers\Admin\EducationController;
use App\Http\Controllers\Admin\FooterController;
use App\Http\Controllers\Admin\HeroController;
use App\Http\Controllers\Admin\JobCategoryController;
use App\Http\Controllers\Admin\JobController;
use App\Http\Controllers\Admin\JobExperienceController;
use App\Http\Controllers\Admin\JobLocationController;
use App\Http\Controllers\Admin\JobRoleController;
use App\Http\Controllers\Admin\JobTypeController;
use App\Http\Controllers\Admin\LanguageController;
use App\Http\Controllers\Admin\LearnMoreController;
use App\Http\Controllers\Admin\LocationController;
use App\Http\Controllers\Admin\MenuBuilderController;
use App\Http\Controllers\Admin\NewsletterController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\PaymentSettingController;
use App\Http\Controllers\Admin\PlanController;
use App\Http\Controllers\Admin\ProfessionController;
use App\Http\Controllers\Admin\ProfileUpdateController;
use App\Http\Controllers\Admin\ReviewController;
use App\Http\Controllers\Admin\RolePermissionController;
use App\Http\Controllers\Admin\RoleUserController;
use App\Http\Controllers\Admin\SalaryTypeController;
use App\Http\Controllers\Admin\SiteSettingController;
use App\Http\Controllers\Admin\SkillController;
use App\Http\Controllers\Admin\SocialIconController;
use App\Http\Controllers\Admin\TagController;
use App\Http\Controllers\Admin\WhyChooseUsController;
use App\Models\JobExperience;
use App\Models\SiteSetting;
use App\Models\SocialIcon;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['guest:admin'], 'prefix' => 'admin', 'as' => 'admin.'], function () {

    Route::get('login', [AuthenticatedSessionController::class, 'create'])
                ->name('login');

    Route::post('login', [AuthenticatedSessionController::class, 'store']);

    Route::get('forgot-password', [PasswordResetLinkController::class, 'create'])
                ->name('password.request');

    Route::post('forgot-password', [PasswordResetLinkController::class, 'store'])
                ->name('password.email');

    Route::get('reset-password/{token}', [NewPasswordController::class, 'create'])
                ->name('password.reset');

    Route::post('reset-password', [NewPasswordController::class, 'store'])
                ->name('password.store');
});

Route::group(['middleware' => ['auth:admin'], 'prefix' => 'admin', 'as' => 'admin.'], function () {
    Route::post('logout', [AuthenticatedSessionController::class, 'destroy'])
    ->name('logout');

    /** Profile update routes */
    Route::get('profile', [ProfileUpdateController::class, 'index'])->name('profile.index');
    Route::post('profile', [ProfileUpdateController::class, 'update'])->name('profile.update');
    Route::post('profile-password', [ProfileUpdateController::class, 'passwordUpdate'])->name('profile-password.update');



    /** Dashboard Route */
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');

    /** Industry Type Route */
    Route::resource('industry-types', IndustryTypeController::class);
    /** Organization Type Route */
    Route::resource('organization-types', OrganizationTypeController::class);

    /** Countries Route */
    Route::resource('countries', CountryController::class);

    /** State Route */
    Route::resource('states', StateController::class);

    /** City Route */
    Route::resource('cities', CityController::class);
    Route::get('get-states/{country_id}', [LocationController::class, 'getStatesOfCountry'])->name('get-states');

    /** Language Route */
    Route::resource('languages', LanguageController::class);

    /** Profession Route */
    Route::resource('professions', ProfessionController::class);

    /** Skills Route */
    Route::resource('skills', SkillController::class);

    /** Plan Route */
    Route::resource('plans', PlanController::class);

    /** Order routes */
    Route::get('orders', [OrderController::class, 'index'])->name('orders.index');
    Route::get('orders/{id}', [OrderController::class, 'show'])->name('orders.show');
    Route::get('orders/invoice/{id}', [OrderController::class, 'invoice'])->name('orders.invoice');

    /** Job Category Routes */
    Route::resource('job-categories', JobCategoryController::class);
    /** Job Eduction Routes */
    Route::resource('educations', EducationController::class);
    /** Job Type Routes */
    Route::resource('job-types', JobTypeController::class);
    /** Job salary type Routes */
    Route::resource('salary-types', SalaryTypeController::class);
    /** Job tag Routes */
    Route::resource('tags', TagController::class);
    /** Job type */
    Route::resource('job-roles', JobRoleController::class);
    /** Job type */
    Route::resource('job-experiences', JobExperienceController::class);
    /** Jobs  */
    Route::post('job-status/{id}', [JobController::class, 'changeStatus'])->name('job-status.update');
    Route::resource('jobs', JobController::class);
    /** Blogs */
    Route::resource('blogs', BlogController::class);

    /** Hero Section */
    Route::resource('hero', HeroController::class);

    /** Why Choose Us Section */
    Route::resource('why-choose-us', WhyChooseUsController::class);
    /** learn more Section */
    Route::resource('learn-more', LearnMoreController::class);
    /** Counter Section */
    Route::resource('counter', CounterController::class);
    /** Job Location Section */
    Route::resource('job-location', JobLocationController::class);
    /** review Section */
    Route::resource('reviews', ReviewController::class);

    /** About us page route */
    Route::resource('about-us', AboutController::class);

    /** Custom Page Builder route */
    Route::resource('page-builder', CustomPageBuilderController::class);

    /** Newsletter route */
    Route::get('newsletter', [NewsletterController::class, 'index'])->name('newsletter.index');
    Route::delete('newsletter/{id}', [NewsletterController::class, 'destroy'])->name('newsletter.destroy');
    Route::post('newsletter', [NewsletterController::class, 'sendMail'])->name('newsletter-send-mail');

    /** Menu Builder route */
    Route::resource('menu-builder', MenuBuilderController::class);
    /** Footer route */
    Route::resource('footer', FooterController::class);
    /** Social Icon route */
    Route::resource('social-icon', SocialIconController::class);

    Route::get('clear-database', [ClearDatabaseController::class, 'index'])->name('clear-database.index');
    Route::post('clear-database', [ClearDatabaseController::class, 'clearDatabase'])->name('clear-database');

    /** role permission route */
    Route::resource('role', RolePermissionController::class);
    /** role user route */
    Route::resource('role-user', RoleUserController::class);

    /** Payment Settings Routes */
    Route::get('payment-settings', [PaymentSettingController::class, 'index'])->name('payment-settings.index');
    Route::post('paypal-settings', [PaymentSettingController::class, 'updatePaypalSetting'])->name('paypal-settings.update');
    Route::post('stripe-settings', [PaymentSettingController::class, 'updateStripeSetting'])->name('stripe-settings.update');
    Route::post('razorpay-settings', [PaymentSettingController::class, 'updateRazorpaySetting'])->name('razorpay-settings.update');


    /** Site Settings Routes */
    Route::get('site-settings', [SiteSettingController::class, 'index'])->name('site-settings.index');
    Route::post('general-settings', [SiteSettingController::class, 'updateGeneralSetting'])->name('general-settings.update');
    Route::post('logo-settings', [SiteSettingController::class, 'updateLogoSetting'])->name('logo-settings.update');


});
