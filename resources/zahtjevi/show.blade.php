@extends('layouts.app')

@section('content')
    <a href="zahtjevi" class="btn btn-default">Go Back</a>
    <h1>{{$zahtjev->title}}</h1>
    <img style="width:100%" src="/storage/cover_images/{{$zahtjev->cover_image}}">
    <br><br>
    <div>
        {!!$zahtjev->body!!}
    </div>
    <hr>
    <small>Written on {{$zahtjev->created_at}} by {{$zahtjev->user->name}}</small>
    <hr>
    @if(!Auth::guest())
        @if(Auth::user()->id == $zahtjev->user_id)
            <a href="zahtjevi/{{$zahtjev->id}}/edit" class="btn btn-default">Edit</a>

            {!!Form::open(['action' => ['ZahtjeviController@destroy', $zahtjev->id], 'method' => 'POST', 'class' => 'pull-right'])!!}
                {{Form::hidden('_method', 'DELETE')}}
                {{Form::submit('Delete', ['class' => 'btn btn-danger'])}}
            {!!Form::close()!!}
        @endif
    @endif
@endsection
