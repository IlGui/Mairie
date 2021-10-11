<?php

namespace App\Providers;

use App\Http\Repositories\IActeNaissanceRepository;
use App\Http\Repositories\ActeNaissanceRepository;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //IOC
        $this->app->bind(IActeNaissanceRepository::class, ActeNaissanceRepository::class);
    }
}
