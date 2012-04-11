$ ->
    # create seated
    $('section').each(()->
    
        tsection = $(this)
        trow = tsection.data('row')
        tcol = tsection.data('col')
        tleft = tsection.data('left')
        ttop = tsection.data('top')
        theight = tsection.data('height')
        twidth = tsection.data('width')
        
        row = ""
        for i in [0...trow]
            row += "<tr>"
            row += "<td class='empty'>　　</td>" for j in [0...tcol]
            row += "</tr>"
    
        $("<table class='seated'>").css({
            left: tleft,
            top: ttop,
            height: theight,
            width: twidth
        }).append(row).appendTo(tsection);
    )
    
    # get button
    
    $('#standardPos').find('td')
        .hover ()-> 
                $(this).data('tmptext', $(this).text())
                $(this).text("I'm here")
            ,
            ()-> 
                $(this).text($(this).data('tmptext'))
                $(this).data('tmptext', '')
        .click ()->
            nickinput = $('input#nick')    
            if nickinput.val() is ""
                alert('input your nickname first, please.')
                nickinput.focus()
            else
                if (confirm('Are you sitting here?'))
                    $('.mine').removeClass('mine').addClass('empty').text('')
                    $(this).removeClass('empty').addClass('mine')
                        .text(nickinput.val())
                        .data('tmptext', nickinput.val())
                    # ajax checkin

    
#    btnHere = $('#invisible button')
#    $('#standardPos').find('td').hover(()->
#        btnHere.appendTo(this)
#    )
#    return