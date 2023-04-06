@extends('backend.admin.master')
@section('css')
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/vendors.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/tables/datatable/responsive.bootstrap4.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css') }}">
    <!-- END: Vendor CSS-->
@endsection
@section('content')
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-12 mb-2 mt-1">
                <div class="breadcrumbs-top">
                    <h5 class="content-header-title float-left pr-1 mb-0">Product</h5>
                    <div class="breadcrumb-wrapper d-none d-sm-block">
                        <ol class="breadcrumb p-0 mb-0 pl-1">
                            <li class="breadcrumb-item"><a href="/"><i class="bx bx-home-alt"></i></a>
                            </li>
                            <li class="breadcrumb-item active">Product List
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-body">
            <!-- users list start -->
            <section class="users-list-wrapper">
                <div class="col-md-1  my-3 d-flex align-items-center">
                    <a href="{{ route('admin.product.create') }}" class="btn btn-outline-primary" ><span ><i class='bx bxs-file-plus'></i></span></a>
                </div>
                <div class="users-list-table">
                    <div class="card">
                        <div class="card-body">
                            <!-- datatable start -->
                            <div class="table-responsive">
                                <table class="table zero-configuration">
                                    <thead>
                                        <tr>
                                            <th>*</th>
                                            <th>name</th>
                                            <th>Product Image</th>
                                            <th>category</th>
                                            <th>tag</th>
                                            <th>Weight</th>
                                            <th>Price Per Item</th>
                                            <th>Item Type</th>
                                            <th>Status</th>
                                            <th>Created At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     @foreach ($list as $item)
                                         <tr>
                                            <td>{{$loop->iteration}}</td>
                                            <td>{{$item->name}}</td>
                                            <td style="display: grid;">
                                                
                                                
                                                <div style="position: relative;">
                                                               
                                                    
                                                {{-- <a href="{{ route('image.delete',['proimage'=>$image->id]) }}"><i class="fa fa-times" aria-hidden="true" style=" position: absolute; left: 41px; "></i></a> --}}
        
                                                    <img src="{{ asset($item->image ? $item->image->path : 'frontend/images/no-item.png') }}" width="50px" height="40px"  alt="">
                                                </div>
                                             
                                                
                                            </td>
                                            <td>{{$item->getcategory ? $item->getcategory->name : '' }}</td>
                                            <td>{{$item->gettag ? $item->gettag->name : '' }}</td>
                                            <td>{{$item->weight }}</td>
                                            <td>{{$item ? $item->price_per_item : '-' }}</td>
                                            <td>{{$item->items_status }}</td>
                                            <td>@if ($item->status == "In Stock")
                                                <span class="badge badge-success">In Stock</span>
                                                
                                            @elseif($item->status == "Out Of Stock")
                                            <span class="badge badge-danger">Out Of Stock</span>
                                            
                                            @endif
                                                </td>
                                            <td>{{$item->created_at}}</td>
                                            <td>
                                                <a href="{{ route('admin.product.edit', ['product'=>$item->id]) }}" ><i
                                                class="bx bx-edit-alt"></i></a>
                                                <a href="{{ route('admin.product.destroy', ['product'=>$item->id]) }}"  onclick="return confirm('Are You Sure To Delete This  ?')"><i
                                                class="bx bx-trash-alt"></i></a>
                                            </td>
                                         </tr>
                                     @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <!-- datatable ends -->
                        </div>
                    </div>
                </div>
            </section>
            <!-- users list ends -->

        </div>
    </div>
</div>
@endsection
@section('js')
    <!-- BEGIN: Page Vendor JS-->
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/pdfmake.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/vfs_fonts.js') }}"></script>
<script src="{{ asset('app-assets/js/scripts/datatables/datatable.js') }}"></script>
@endsection
