@extends('frontend.layouts.master')

@section('contents')
<section class="section-box mt-150">
    <p style="font-size: 50px; font-weight: bold; text-align: center; color: black">Your orders!</p>
</section>

<section class="section-box mt-120">
    <div class="container">
        <div class="row">
            @include('frontend.company-dashboard.sidebar')
            <div class="col-lg-9 col-md-8 col-sm-12 col-12 mb-50">
                <div class="card">
                    <div class="card-header">
                        <h4>All Orders</h4>

                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tr>
                                    <th>Order No</th>

                                    <th>Plan</th>
                                    <th>Paid Amount</th>

                                    <th>Payment Method</th>
                                    <th>Payment Status</th>
                                    <th style="width: 10%">Action</th>
                                </tr>
                                <tbody>
                                @if($orders->isEmpty())
                                    <p>No order</p>
                                @else

                                    @foreach ($orders as $order)

                                        <tr>
                                            <td>
                                                #{{ $order->order_id }}
                                            </td>

                                            <td>
                                                {{ $order->package_name }}
                                            </td>

                                            <td>
                                                {{ $order->amount }} {{ $order->paid_in_currency }}
                                            </td>

                                            <td>
                                                {{ $order->payment_provider }}
                                            </td>
                                            <td>
                                                <p class="badge bg-primary text-light">{{ $order->payment_status }}</p>
                                            </td>

                                            <td>
                                                <a href="{{ route('company.orders.show', $order->id) }}"
                                                   class="btn-sm btn btn-primary"><i class="fas fa-eye"></i></a>

                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                                </tbody>

                            </table>
                        </div>
                    </div>

                    <div class="paginations">
                        <ul class="pager">
                            @if ($orders->hasPages())
                                {{ $orders->withQueryString()->links() }}
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
