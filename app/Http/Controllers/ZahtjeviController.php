<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use App\Zahtjev;
use DB;

class ZahtjeviController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['index', 'show']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$posts = Post::all();
        //return Post::where('title', 'Post Two')->get();
        //$posts = DB::select('SELECT * FROM posts');
        //$posts = Post::orderBy('title','desc')->take(1)->get();
        //$posts = Post::orderBy('title','desc')->get();

        $zahtjev = Zahtjev::orderBy('created_at','desc')->paginate(10);
        return view('zahtjevi.zahtjev')->with('zahtjev', $zahtjev);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('zahtjevi.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
            'body' => 'required',
            'cover_image' => 'image|nullable|max:1999'
        ]);

        // Handle File Upload
        if($request->hasFile('cover_image')){
            // Get filename with the extension
            $filenameWithExt = $request->file('cover_image')->getClientOriginalName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('cover_image')->getClientOriginalExtension();
            // Filename to store
            $fileNameToStore= $filename.'_'.time().'.'.$extension;
            // Upload Image
            $path = $request->file('cover_image')->storeAs('public/cover_images', $fileNameToStore);
		
	    // make thumbnails
	    $thumbStore = 'thumb.'.$filename.'_'.time().'.'.$extension;
            $thumb = Image::make($request->file('cover_image')->getRealPath());
            $thumb->resize(80, 80);
            $thumb->save('storage/cover_images/'.$thumbStore);
		
        } else {
            $fileNameToStore = 'noimage.jpg';
        }

        // Create Post
        $zahtjev = new Zahtjev;
        $zahtjev->title = $request->input('title');
        $zahtjev->body = $request->input('body');
        $zahtjev->user_id = auth()->user()->id;
        $zahtjev->cover_image = $fileNameToStore;
        $zahtjev->save();

        return redirect('/zahtjevi')->with('success', 'Post Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $zahtjev = Zahtjev::find($id);
        return view('zahtjevi.show')->with('zahtjev', $zahtjev);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $zahtjev = Zahtjev::find($id);
        
        //Check if post exists before deleting
        if (!isset($zahtjev)){
            return redirect('/zahtjevi')->with('error', 'No Post Found');
        }

        // Check for correct user
        if(auth()->user()->id !==$zahtjev->user_id){
            return redirect('/zahtjevi')->with('error', 'Unauthorized Page');
        }

        return view('zahtjevi.edit')->with('zahtjev', $zahtjev);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required',
            'body' => 'required'
        ]);
		$zahtjev = Zahtjev::find($id);
         // Handle File Upload
        if($request->hasFile('cover_image')){
            // Get filename with the extension
            $filenameWithExt = $request->file('cover_image')->getClientOriginalName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('cover_image')->getClientOriginalExtension();
            // Filename to store
            $fileNameToStore= $filename.'_'.time().'.'.$extension;
            // Upload Image
            $path = $request->file('cover_image')->storeAs('public/cover_images', $fileNameToStore);
            // Delete file if exists
            Storage::delete('public/cover_images/'.$zahtjev->cover_image);
		
	   //Make thumbnails
	    $thumbStore = 'thumb.'.$filename.'_'.time().'.'.$extension;
            $thumb = Image::make($request->file('cover_image')->getRealPath());
            $thumb->resize(80, 80);
            $thumb->save('storage/cover_images/'.$thumbStore);
		
        }

        // Update Post
        $zahtjev->title = $request->input('title');
        $zahtjev->body = $request->input('body');
        if($request->hasFile('cover_image')){
            $zahtjev->cover_image = $fileNameToStore;
        }
        $zahtjev->save();

        return redirect('/zahtjevi')->with('success', 'Post Updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $zahtjev = Zahtjev::find($id);
        
        //Check if post exists before deleting
        if (!isset($zahtjev)){
            return redirect('/zahtjevi')->with('error', 'No Post Found');
        }

        // Check for correct user
        if(auth()->user()->id !==$zahtjev->user_id){
            return redirect('/zahtjevi')->with('error', 'Unauthorized Page');
        }

        if($zahtjev->cover_image != 'noimage.jpg'){
            // Delete Image
            Storage::delete('public/cover_images/'.$zahtjev->cover_image);
        }
        
        $zahtjev->delete();
        return redirect('/zahtjevi')->with('success', 'Post Removed');
    }
}
