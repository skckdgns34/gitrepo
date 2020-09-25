<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/22.0.0/classic/ckeditor.js"></script>
</head>
<body>
	 <h1>Classic editor</h1>
    <textarea id="editor" rows="8" cols="70">
        This is some sample content.
    </textarea>
    <h1>하하하하하하하ㅏㅎ하ㅏ</h1>
    <button>등록</button>
    <script>
        ClassicEditor.create( document.querySelector( '#editor' ) ).catch( error => {
                console.error( error );
            } );
    </script>
</body>
</html>