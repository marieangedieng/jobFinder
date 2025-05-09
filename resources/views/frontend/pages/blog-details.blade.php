@extends('frontend.layouts.master')
@section('contents')
    <section class="section-box mt-150">
        <p style="font-size: 50px; font-weight: bold; text-align: center; color: black">Blog!</p>
        <p style="text-align: center; color: black; margin-top: 20px">A selection of our favorite articles !</p>
    </section>

    <section class="section-box">
        <div class="archive-header pt-40">
            <div class="container">
                <div class="box-white">
                    <!-- <div class="max-width-single"><a class="btn btn-tag" href="#">Job Tips</a> -->
                    <h2 class="mb-30 mt-20">{{ $blog->title }}</h2>
                    <div class="post-meta text-muted d-flex mx-auto">
                        <div class="author d-flex mr-30"><span>{{ $blog->author->name }}</span></div>
                        <div class="date"><span class="font-xs color-text-paragraph-2 mr-20 d-inline-block">
                                {{ formatDate($blog->created_at) }}</span></div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>

    <div class="post-loop-grid">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 mx-auto">
                    <div class="single-body">

                        <figure><img style="height: 500px; width:100%; object-fit:cover" src="{{ asset($blog->image) }}">
                        </figure>
                        <div class="">
                            <div class="content-single">
                                {!! $blog->description !!}
                            </div>
                            <div class="single-apply-jobs mt-20 " >
                                <div class="row">
                                    <div class="col-md-5 text-lg-end social-share" style="text-align: left !important">
                                        <h6 class="color-text-paragraph-2 d-inline-block d-baseline mr-20 mt-10">Share</h6>
                                        <a data-social="facebook" class="mr-5 d-inline-block d-middle" href="#"><img
                                                alt=JobFinder
                                                src="{{ asset('frontend/assets/imgs/template/icons/share-fb.svg') }}"></a>
                                        <a data-social="twitter" class="mr-5 d-inline-block d-middle" href="#"><img
                                                alt=JobFinder
                                                src="{{ asset('frontend/assets/imgs/template/icons/share-tw.svg') }}"></a>
                                        <a data-social="reddit" class="mr-5 d-inline-block d-middle" href="#"><img
                                                alt=JobFinder
                                                src="{{ asset('frontend/assets/imgs/template/icons/share-red.svg') }}"></a>
                                        <a data-social="linkedin" class="d-inline-block d-middle" href="#"><img
                                                alt=JobFinder
                                                src="{{ asset('frontend/assets/imgs/template/icons/share-in.svg') }}"></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
