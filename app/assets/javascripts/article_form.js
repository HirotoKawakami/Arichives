$(function() {
    
    
    
    Dropzone.autoDiscover = false;
    $('#my-dropzone').dropzone({
        maxFilesize: 200,// MB
        paramName: 'photo[image]',
        clickable: true,
        success: function(file, response) {
            console.log(file);
                // file.previewElementでpreview要素のhtmlにアクセス
                new ClipboardJS('.btn');
                var html = `<div class="btn" data-clipboard-text=${response.url}>Copy</div>`;

                $(file.previewElement).addClass('dz-success');
                $(file.previewElement).find('.dz-remove').hide();
                $(file.previewElement).find('.dz-progress').hide();
                $(file.previewElement).find('.dz-filename').find('span').html(html);
                
            },
        
    });
})
