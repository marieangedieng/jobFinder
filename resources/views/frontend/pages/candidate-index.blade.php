@extends('frontend.layouts.master')

@section('contents')
    <section class="section-box mt-120">
        <p style="font-size: 50px; font-weight: bold; text-align: center; color: black">Our Candidates</p>
        <p style="text-align: center; color: black; margin-top: 20px">La creme de la creme!</p>
    </section>

    <section class="section-box mt-80">
        <div class="container">
            <div class="content-page">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="sidebar-shadow none-shadow mb-30">
                                <form action="{{ route('candidates.index') }}" method="GET">
                                    <div class="filter-block mb-30">
                                                <div class="filter-block head-border mb-30">
                                                    <h5>Filter <a class="link-reset" href="#">Reset</a></h5>
                                                </div>

                                                <div class="filter-block mb-30" >
                                                    <div class="form-group select-style" >
                                                        <label for="">Skills</label>

                                                        <select name="skills[]" multiple class="form-control form-icons select-active" style="border-color: black">
                                                            <option value="">All</option>
                                                            @foreach ($skills as $skill)
                                                            <option @selected(request()->has('skills') ? in_array($skill->slug, request()->skills) : false) value="{{ $skill->slug }}">{{ $skill->name }}</option>
                                                            @endforeach

                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                    <div class="filter-block mb-20 ">
                                        <h5 class="medium-heading mb-15">Experiences</h5>
                                        <div class="form-group">
                                          <ul class="list-checkbox">
                                            <li class="active">
                                                <label class="d-flex">
                                                  <input type="radio" name="experience" class="x-radio" value=""><span class="text-small">All</span>
                                                </label>
                                            </li>
                                            @foreach ($experiences as $experience)
                                            <li class="active">
                                              <label class="d-flex">
                                                <input type="radio" @checked($experience->id == request()->experience) name="experience" class="x-radio" value="{{ $experience->id }}"><span class="text-small">{{ $experience->name }}</span>
                                              </label>
                                            </li>
                                            @endforeach

                                          </ul>
                                        </div>
                                      </div>
                                    <button class="submit btn btn-default mt-10 rounded-1 w-100" type="submit">Search</button>
                                </form>

                        </div>
                    </div>
                    <div class="col-xl-9">

                        <div class="row">
                            @forelse ($candidates as $candidate)
                                <div class="col-lg-4 col-md-6">
                                    <div class="card-grid-2 hover-up">
                                        <div class="card-grid-2-image-left d-flex">
                                            <div class="card-grid-2-image-rd online"><a href="{{ route('candidates.show', $candidate->slug) }}">
                                                    <figure><img alt=JobFinder src="{{ asset($candidate->image) }}">
                                                    </figure>
                                                </a></div>
                                            <div class="card-profile pt-10">
                                                <a href="{{ route('candidates.show', $candidate->slug) }}">
                                                    <h5>{{ $candidate->full_name }}</h5>
                                                </a>
                                                <span class="font-xs color-text-mutted">{{ $candidate->title }}</span>
                                                <div class="rate-reviews-small pt-5">
                                                    @if ($candidate->status === 'available')
                                                        <p class="font-sm color-text-paragraph-2"><b>I am avaiable</b></p>
                                                    @endif

                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-block-info">
                                            <div class="card-2-bottom card-2-bottom-candidate mt-30">
                                                <div class="text-start">

                                                    @foreach ($candidate->skills as $candidateSkill)
                                                        @if ($loop->index <= 5)
                                                            <a class="btn btn-tags-sm mb-10 mr-5" href="">{{ $candidateSkill->skill->name }}</a>
                                                        @endif
                                                    @endforeach
                                                </div>
                                            </div>
                                            <div class="employers-info align-items-center justify-content-center mt-15">
                                                <div class="row">
                                                    <div class="col-6"><span class="d-flex align-items-center"><i
                                                                class="fi-rr-marker mr-5 ml-0"></i><span
                                                                class="font-sm color-text-mutted">{{ $candidate->candidateCountry->name }}</span></span></div>
                                                    <div class="col-6"><span
                                                            class="d-flex justify-content-end align-items-center"><span
                                                                class="font-sm"><a href="{{ route('candidates.show', $candidate->slug) }}" class="text-primary d-flex align-items-center">Resume <i style="margin-bottom: -4px;" class="fi fi-rr-arrow-right"></i></a></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @empty
                                <h4 class="text-center">No Data Found!</h4>
                            @endforelse

                            <div class="col-12">

                                <div class="paginations">
                                    <ul class="pager">
                                        @if ($candidates->hasPages())
                                            {{ $candidates->withQueryString()->links() }}
                                        @endif
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
