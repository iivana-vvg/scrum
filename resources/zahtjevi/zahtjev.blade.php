@extends('layouts.app')

@section('content')
    <h1>Posts</h1>
    @if(count($zahtjevi) > 0)
        @foreach($zahtjevi as $zahtjev)
            <div class="well">
                <div class="row">
                    <div class="col-md-4 col-sm-4">
                        <img style="width:100%" src="/storage/cover_images/{{$zahtjev->cover_image}}">
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <h3><a href="zahtjevi/{{$zahtjev->id}}">{{$zahtjev->title}}</a></h3>
                        <small>Written on {{$zahtjev->created_at}} by {{$zahtjev->user->name}}</small>
                    </div>
                </div>
            </div>
        @endforeach
        {{$zahtjevi->links()}}
    @else
        <p>No posts found</p>
    @endif
@endsection
