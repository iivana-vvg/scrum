@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">ZAHTJEVI</div>

                <div class="panel-body">
                    <a href="zahtjevi/create" class="btn btn-primary">Kreiraj novi zahtjev</a>
                    <h3>Vaši zahtjevi</h3>
                    @if(count($zahtjevi) > 0)
                        <table class="table table-striped">
                            <tr>
                             
                                <th>Naziv zahtjeva</th>
                                <th></th>
                                <th></th>
                            </tr>
                            @foreach($zahtjevi as $zahtjev)
                                <tr>
                                    <td>{{$zahtjev->title}}</td>
                                    <td><a href="zahtjevi/{{$zahtjev->id}}/edit" class="btn btn-default">Uredi</a></td>
                                    <td>
                                        {!!Form::open(['url' => ['ZahtjeviController@destroy', $zahtjev->id], 'method' => 'POST', 'class' => 'pull-right'])!!}
                                            {{Form::hidden('_method', 'DELETE')}}
                                            {{Form::submit('Obriši', ['class' => 'btn btn-danger'])}}
                                        {!!Form::close()!!}
                                    </td>
                                </tr>
                            @endforeach
                        </table>
                    @else
                        <p>You have no posts</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
