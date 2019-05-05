<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript" src="${request.contextPath}/static/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/ckfinder/ckfinder.js"></script>

</head>
<body>
<div style="width: 60%">
    <form>
    <!-- 一个textarea -->
        <textarea name="editor1" id="editor1" rows="20" cols="150">

            </textarea>
    </form>
</div>
<script>
    var editorConfig = {
        customConfig: ${request.contextPath}+'/static/ckeditor/config.js'
    };
    CKEDITOR.replace( 'editor1', editorConfig, {
        toolbarGroups: [
            { name: 'document',    groups: [ 'mode', 'document' ] },            // Displays document group with its two subgroups.
            { name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },           // Group's name will be used to create voice label.
            '/',                                                                // Line break - next group will be placed in new line.
            { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
            { name: 'links' }
        ]

        // NOTE: Remember to leave 'toolbar' property with the default value (null).
    });
</script>
</body>
</html>