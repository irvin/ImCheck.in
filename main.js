
jQuery(function($) {
  var hallName;
  hallName = $('body').data('hall');
  $('section').each(function() {
    var i, j, row, tCol, tHeight, tLeft, tRow, tSection, tTop, tWidth, tdHeight;
    tSection = $(this);
    tRow = tSection.data('row');
    tCol = tSection.data('col');
    tLeft = tSection.data('left');
    tTop = tSection.data('top');
    tHeight = tSection.data('height');
    tWidth = tSection.data('width');
    tdHeight = tHeight / tRow;
    row = "";
    for (i = 0; 0 <= tRow ? i < tRow : i > tRow; 0 <= tRow ? i++ : i--) {
      row += "<tr style='height:" + tdHeight + "px'>";
      for (j = 0; 0 <= tCol ? j < tCol : j > tCol; 0 <= tCol ? j++ : j--) {
        row += "<td class='empty'></td>";
      }
      row += "</tr>";
    }
    return $("<table class='seated'>").css({
      left: tLeft + 'px',
      top: tTop + 'px',
      height: tHeight + 'px',
      width: tWidth + 'px'
    }).append(row).appendTo(tSection);
  });
  $('#standardPos').find('td').hover(function() {
    $(this).data('tmptext', $(this).text());
    return $(this).text("I'm here");
  }, function() {
    $(this).text($(this).data('tmptext'));
    return $(this).data('tmptext', '');
  }).click(function() {
    var nickinput;
    nickinput = $('input#nick');
    if (nickinput.val() === "") {
      alert('Please tell me your nickname');
      return nickinput.focus();
    } else {
      if (confirm('Are you sit here?')) {
        $('#standardPos .mine').removeClass('mine').addClass('empty').text('');
        return $(this).removeClass('empty').addClass('mine').text(nickinput.val()).data('tmptext', nickinput.val());
      }
    }
  });
  return $('button#checkOut').text(hallName).hover(function() {
    return $(this).text('Checkout & Switch');
  }, function() {
    return $(this).text(hallName);
  }).click(function() {
    return $('#standardPos .mine').removeClass('mine').addClass('empty').text('');
  });
});
