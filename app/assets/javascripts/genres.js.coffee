jQuery ->
  $('#artist_genre_tokens').tokenInput '/genres.json'
    theme: 'facebook'
    prePopulate: $('#artist_genre_tokens').data('load')