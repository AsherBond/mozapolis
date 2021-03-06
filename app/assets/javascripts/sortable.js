
  $(function() {
    $( "#sortable" ).sortable({
      helper: function(e, tr)
      {
        var $originals = tr.children();
        var $helper = tr.clone();
        $helper.children().each(function(index)
        {
          // Set helper cell sizes to match the original sizes
          $(this).width($originals.eq(index).width())
        });
        return $helper;
      },
      update: function() {
        $.post($(this).data('update-url'), $(this).sortable('serialize'));
      }
    }).disableSelection();
  });
