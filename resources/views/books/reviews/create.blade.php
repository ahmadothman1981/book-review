@extends('layouts.app')



@section('content')
    <h1 class="mb-10 text-2xl">Add Review</h1>
    <form method="post" action="{{route('books.reviews.store', $book)}}" class="flex flex-col space-y-4">
    @csrf
    <label for="review">Review</label>
    <textarea name="review" id="review" required class="input mb-4"></textarea>
    <label for="rating">Rating</label>
    <select name="rating" id="rating" required class="input mb-4">
        <option value="">Select Rating</option>
        @for($i = 1; $i <= 5; $i++)
            <option value="{{ $i }}">{{ $i }}</option>
        @endfor
    </select>

    <button type="submit" class="btn">Add Review</button>
    </form>

@endsection