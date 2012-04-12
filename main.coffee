jQuery ($) ->
    # create seated
    hallName = $('body').data('hall')
    
    $('section').each ()->
        tSection = $(this)
        tRow = tSection.data('row')
        tCol = tSection.data('col')
        tLeft = tSection.data('left')
        tTop = tSection.data('top')
        tHeight = tSection.data('height')
        tWidth = tSection.data('width')
        tdHeight = tHeight / tRow
        
        row = ""
        for i in [0...tRow]
            row += "<tr style='height:" + tdHeight + "px'>"
            row += "<td class='empty'></td>" for j in [0...tCol]
            row += "</tr>"
    
        $("<table class='seated'>")
            .css({
                left: tLeft + 'px',
                top: tTop + 'px',
                height: tHeight + 'px',
                width: tWidth + 'px'
            })
            .append(row).appendTo(tSection);
    
    
    # checkin button
    $('#standardPos').find('td')
        .hover(
            ()->
                $(this).data('tmptext', $(this).text())
                $(this).text("I'm here")
            ()-> 
                $(this).text($(this).data('tmptext'))
                $(this).data('tmptext', '')
        ) 
        .click ()->
            nickinput = $('input#nick')    
            if nickinput.val() is ""
                alert('Please tell me your nickname')
                nickinput.focus()
            else
                if (confirm('Are you sit here?'))
                    $('#standardPos .mine').removeClass('mine').addClass('empty').text('')
                    $(this).removeClass('empty').addClass('mine')
                        .text(nickinput.val())
                        .data('tmptext', nickinput.val())
                    # ajax checkin

    # checkout buttin
    $('button#checkOut').text(hallName)
        .hover(
            ()->
                $(this).text('Checkout & Switch')
            () ->
                $(this).text(hallName)
        )
        .click ()->
            $('#standardPos .mine').removeClass('mine').addClass('empty').text('')
            # show switcher