@extends('frontend.layouts.master')

@section('contents')
    <section class="section-box mt-150">
        <p style="font-size: 50px; font-weight: bold; text-align: center; color: black">Success!</p>
        <p style="text-align: center; color: black; margin-top: 20px">Your plan was upgraded!</p>
    </section>

  <section class="section-box mt-90">
    <div class="container">
        <div style="text-align: center;
        margin-bottom: 90px;">
            <i class="fas fa-check-circle" style="font-size: 100px; color: green;"></i>
            <h2>Payment Successful.</h2>
            <a class="btn btn-default btn-shadow hover-up mt-4" href="{{ route('company.dashboard') }}">Go to dashboard</a>
        </div>
    </div>
  </section>
@endsection
