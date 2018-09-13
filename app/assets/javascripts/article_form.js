$(function() {
    
    
    
    Dropzone.autoDiscover = false;
    $('#my-dropzone').dropzone({
        maxFilesize: 200,// MB
        paramName: 'photo[image]',
        clickable: true,
        success: function(file, response) {
                // file.previewElementでpreview要素のhtmlにアクセス

                $(file.previewElement).addClass('dz-success');
                $(file.previewElement).find('.dz-remove').hide();
                $(file.previewElement).find('.dz-progress').hide();
                $(file.previewElement).find('.dz-filename').find('span').text(response.url);
                console.log(response.url);
                
            },
        
    });
})
