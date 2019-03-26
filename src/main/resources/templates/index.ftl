<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript" src="${request.contextPath}/static/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/ckfinder/ckfinder.js"></script>

</head>
<body>
<form>
    <!-- 一个textarea -->
    <textarea name="editor1" id="editor1" rows="10" cols="80">
                This is my textarea to be replaced with CKEditor.
            </textarea>
</form>
<script type="text/javascript">
    var editor = CKEDITOR.replace( 'editor1',
            {
                language: 'zh-cn',
                uiColor: '#c3c8d1',
                customConfig: '${request.contextPath}/static/ckeditor/config.js'



            }
    );
    /*CKFinder.setupCKEditor(editor,'${request.contextPath}/static/ckfinder/');*/
</script>
</body>
</html>