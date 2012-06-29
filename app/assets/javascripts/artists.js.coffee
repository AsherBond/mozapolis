jQuery ->
  $('#artist_genre_tokens').tokenInput '/artists.json'
    theme: 'facebook'
    prePopulate: $('#artist_genre_tokens').data('load')