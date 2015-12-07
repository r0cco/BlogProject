﻿$.validator.setDefaults({
    ignore: '',
    highlight: function (element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    unhighlight: function (element) {
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
    },
    errorElement: 'span',
    errorClass: 'help-block',
    errorPlacement: function (error, element) {
        if (element.parent('.input-group').length) {
            error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
    }
});

$(document).ready(function () {
    $('#addBlogPostForm').validate({
        rules: {
            PostTitle: {
                required: true,
                maxlength: 100
            },
            PostContent: {
                required: true
            }
        }
    });
});

$('#submitbutton').click(function() {
    tinyMCE.triggerSave();
});


