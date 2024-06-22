@extends('frontend.layouts.master')

@section('contents')
    <section class="section-box mt-150">
        <p style="font-size: 50px; font-weight: bold; text-align: center; color: black">Error!</p>
        <p style="text-align: center; color: black; margin-top: 20px">Please retry !</p>
    </section>

  <section class="section-box mt-90">
    <div class="container">
        <div style="text-align: center;
        margin-bottom: 90px;">
            <i class="fas fa-times-circle" style="font-size: 100px; color: red;"></i>
            <h2>Payment Canceled.</h2>
            @if (session('errors'))

            <p class="alert alert-danger mt-4" style="width: 400px; margin:auto">{{ session('errors')->first('error') }}</p>
            @endif

            <a class="btn btn-default btn-shadow hover-up mt-4" href="{{ route('company.dashboard') }}">Go to dashboard</a>
        </div>
    </div>
  </section>
@endsection
