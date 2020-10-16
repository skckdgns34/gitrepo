<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/popup.css">

		<script src="js/libs/jquery.min.js"></script>

        <script src="js/libs/zip.min.js"></script>

        <script>
            "use strict";
            var page = "${pageContext.request.contextPath}";
			var member_no = "${member_no}";
			var book_no = "${book_no}";
			var last_index = "${last_index}";
			
			var i = 0;
			var list = ${list};
			var listBook = [];
			var listMarkName = [];
			for(var i=0; i<list.length; i++){
				listBook.push(list[i].bookmark_index);
				listMarkName.push(list[i].bookmark_contents);
			}
			console.dir(listBook);
			
            document.onreadystatechange = function () {
              if (document.readyState == "complete") {
                window.reader = ePubReader("test4.epub", { //url 경로
                   //restore: true,
                   bookmarks : listBook
                 });
                if(last_index){
                	reader.rendition.display("${last_index}");
                }
              }
            };

        </script>

        <!-- File Storage -->
        <!-- <script src="js/libs/localforage.min.js"></script> -->

        <!-- Full Screen -->
        <script src="js/libs/screenfull.min.js"></script>

        <!-- Render -->
        <script src="js/epub.js"></script>

        <!-- Reader -->
        <script src="js/reader.js"></script>

        <!-- Plugins -->
        <!-- <script src="js/plugins/search.js"></script> -->

        <!-- Highlights -->
        <!-- <script src="js/libs/jquery.highlight.js"></script> -->
        <!-- <script src="js/hooks/extensions/highlight.js"></script> -->

    </head>
    <body>
      <div id="sidebar">
        <div id="panels">
          <!-- <input id="searchBox" placeholder="search" type="search"> -->

          <!-- <a id="show-Search" class="show_view icon-search" data-view="Search">Search</a> -->
          <a id="show-Toc" class="show_view icon-list-1 active" data-view="Toc">TOC</a>
          
          <a id="show-Bookmarks" class="show_view icon-bookmark" data-view="Bookmarks">Bookmarks</a>
          <!-- <a id="show-Notes" class="show_view icon-edit" data-view="Notes">Notes</a> -->

        </div>
        <div id="tocView" class="view">
        </div>
        <div id="searchView" class="view">
          <ul id="searchResults"></ul>
        </div>
        <div id="bookmarksView" class="view">
          <ul id="bookmarks"></ul>
        </div>
        <div id="notesView" class="view">
          <div id="new-note">
            <textarea id="note-text"></textarea>
            <button id="note-anchor">Anchor</button>
          </div>
          <ol id="notes"></ol>
        </div>
      </div>
      <div id="main">

        <div id="titlebar">
          <div id="opener">
            <a id="slider" class="icon-menu">Menu</a>
          </div>
          <div id="metainfo">
            <span id="book-title"></span>
            <span id="title-seperator">&nbsp;&nbsp;–&nbsp;&nbsp;</span>
            <span id="chapter-title"></span>
          </div>
          <div id="title-controls">
          	<input type="text" id="bookmark_text" placeholder="북마크 제목 입력"/>
            <a id="bookmark" class="icon-bookmark-empty">Bookmark</a>
            <a id="setting" class="icon-cog">Settings</a>
            <a id="fullscreen" class="icon-resize-full">Fullscreen</a>
          	<a href="${pageContext.request.contextPath}/main.do">Home</a>
          </div>
        </div>

        <div id="divider"></div>
        <div id="prev" class="arrow">‹</div>
        <div id="viewer"></div>
        <div id="next" class="arrow">›</div>

        <div id="loader"><img src="img/loader.gif"></div>
      </div>
      <div class="modal md-effect-1" id="settings-modal">
          <div class="md-content">
              <h3>Settings</h3>
              <div>
                  <p>
                    <input type="checkbox" id="sidebarReflow" name="sidebarReflow">북마크 리스트가 열려있을때도 북마크&페이지넘기기 기능 사용가능
                  </p>
              </div>
              <div class="closer icon-cancel-circled"></div>
          </div>
      </div>
      <div class="overlay"></div>
    </body>
</html>
