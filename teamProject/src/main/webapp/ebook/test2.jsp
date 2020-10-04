<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet">
<style>
/* Font Family
================================================== */

@import url('https://fonts.googleapis.com/css?family=Oxygen:300,400,700');


/* Global Styles
================================================== */

html,body {
-webkit-font-smoothing:antialiased;
-webkit-text-size-adjust:100%;
background-color:#0665a2;
color:#fff;
font-size:1rem;
font-family:"Oxygen", HelveticaNeue, "Helvetica Neue", Helvetica, Arial, sans-serif;
font-weight:400;
letter-spacing:.025rem;
line-height:1.618;
padding:1rem 0;
}

*,::before,::after {
box-sizing:border-box;
}

* {
-webkit-tap-highlight-color:rgba(0,0,0,0);
-webkit-tap-highlight-color:transparent;
}


/* Setup
================================================== */

.container { position:relative; margin:0 auto; max-width:800px; width:100%; }
.column { width:inherit; }


/* Typography / Links
================================================== */

p { color:#fff; display:block; font-size:.9rem; font-weight:400; margin:0 0 2px; }

a,a:visited { color:#8cc3e6; outline:0; text-decoration:underline; }
a:hover,a:focus { color:#bbdef5; }
p a,p a:visited { line-height:inherit; }


/* Misc.
================================================== */

.add-bottom { margin-bottom:2rem !important; }
.left { float:left; }
.right { float:right; }
.center { text-align:center; }
.hidden { display:none; }

.no-support {
margin:2rem auto;
text-align:center;
width:90%;
}


/* Audio Player Styles
================================================== */

audio {
display:none;
}

#audiowrap,
#plwrap {
margin:0 auto;
}

#tracks {
font-size:0;
position:relative;
text-align:center;
}

#nowPlay {
display:block;
font-size:0;
}

#nowPlay span {
display:inline-block;
font-size:1.05rem;
vertical-align:top;
}

#nowPlay span#npAction {
padding:21px;
width:30%;
}

#nowPlay span#npTitle {
padding:21px;
text-align:right;
width:70%;
}

#plList li {
cursor:pointer;
display:block;
margin:0;
padding:21px 0;
}

#plList li:hover {
background-color:rgba(0,0,0,.1);
}

.plItem {
position:relative;
}

.plTitle {
left:50px;
overflow:hidden;
position:absolute;
right:65px;
text-overflow:ellipsis;
top:0;
white-space:nowrap;
}

.plNum {
padding-left:21px;
width:25px;
}

.plLength {
padding-left:21px;
position:absolute;
right:21px;
top:0;
}

.plSel,
.plSel:hover {
background-color:rgba(0,0,0,.1);
color:#fff;
cursor:default !important;
}

#tracks a {
border-radius:3px;
color:#fff;
cursor:pointer;
display:inline-block;
font-size:2.3rem;
height:35px;
line-height:.175;
margin:0 5px 30px;
padding:10px 15px;
text-decoration:none;
transition:background .3s ease;
}

#tracks a:last-child {
margin-left:0;
}

#tracks a:hover,
#tracks a:active {
background-color:rgba(0,0,0,.1);
color:#fff;
}

#tracks a::-moz-focus-inner {
border:0;
padding:0;
}


/* Plyr Overrides
================================================== */

.plyr--audio .plyr__controls {
background-color:transparent;
border:none;
color:#fff;
padding:20px 20px 20px 13px;
width:100%;
}

a.plyr__controls__item.plyr__control:hover,
.plyr--audio .plyr__controls button:hover,
.plyr--audio .plyr__controls button.tab-focus:focus,
.plyr__play-large {
background-color:rgba(0,0,0,.1);
}

.plyr__progress--played,
.plyr__volume--display {
color:rgba(0,0,0,.1);
}

.plyr--audio .plyr__progress--buffer,
.plyr--audio .plyr__volume--display {
background:rgba(0,0,0,.1);
}

.plyr--audio .plyr__progress--buffer {
color:rgba(0,0,0,.1);
}


/* Media Queries
================================================== */

@media only screen and (max-width:600px) {
    #nowPlay span#npAction { display:none; }
    #nowPlay span#npTitle { display:block; text-align:center; width:100%; }
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/plyr/3.5.3/plyr.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/plyr/3.5.3/plyr.polyfilled.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <div class="column add-bottom">
        <div id="mainwrap">
            <div id="nowPlay">
                <span id="npAction">Paused...</span><span id="npTitle"></span>
            </div>
            <div id="audiowrap">
                <div id="audio0">
                    <audio id="audio1" preload controls>Your browser does not support HTML5 Audio! 😢</audio>
                </div>
                <div id="tracks">
                    <a id="btnPrev">&vltri;</a><a id="btnNext">&vrtri;</a>
                </div>
            </div>
            <div id="plwrap">
                <ul id="plList"></ul>
            </div>
        </div>
    </div>
    <div class="column add-bottom center">
        <p>Music by <a href="http://www.mythium.net/">Mythium</a></p>
        <p>Download: <a href="https://archive.org/download/mythium/mythium_vbr_mp3.zip">zip</a> / <a href="https://archive.org/download/mythium/mythium_archive.torrent">torrent</a></p>
    </div>
</div>
<script>
//Mythium Archive: https://archive.org/details/mythium/


$(function ($) {
    'use strict'
    var supportsAudio = !!document.createElement('audio').canPlayType;
    if (supportsAudio) {
        // initialize plyr
        var player = new Plyr('#audio1', {
            controls: [
                'restart',
                'play',
                'progress',
                'current-time',
                'duration',
                'mute',
                'volume',
                'download'
            ]
        });
        // initialize playlist and controls
        var index = 0,
            playing = false,
            mediaPath = 'https://archive.org/download/mythium/',
            extension = '',
            tracks = [{
                "track": 1,
                "name": "All This Is - Joe L.'s Studio",
                "duration": "2:46",
                "file": "JLS_ATI"
            }, {
                "track": 2,
                "name": "The Forsaken - Broadwing Studio (Final Mix)",
                "duration": "8:30",
                "file": "BS_TF"
            }, {
                "track": 3,
                "name": "All The King's Men - Broadwing Studio (Final Mix)",
                "duration": "5:01",
                "file": "BS_ATKM"
            }, {
                "track": 4,
                "name": "The Forsaken - Broadwing Studio (First Mix)",
                "duration": "8:31",
                "file": "BSFM_TF"
            }, {
                "track": 5,
                "name": "All The King's Men - Broadwing Studio (First Mix)",
                "duration": "5:05",
                "file": "BSFM_ATKM"
            }, {
                "track": 6,
                "name": "All This Is - Alternate Cuts",
                "duration": "2:48",
                "file": "AC_ATI"
            }, {
                "track": 7,
                "name": "All The King's Men (Take 1) - Alternate Cuts",
                "duration": "5:44",
                "file": "AC_ATKMTake_1"
            }, {
                "track": 8,
                "name": "All The King's Men (Take 2) - Alternate Cuts",
                "duration": "5:26",
                "file": "AC_ATKMTake_2"
            }, {
                "track": 9,
                "name": "Magus - Alternate Cuts",
                "duration": "5:46",
                "file": "AC_M"
            }, {
                "track": 10,
                "name": "The State Of Wearing Address (fucked up) - Alternate Cuts",
                "duration": "5:25",
                "file": "AC_TSOWAfucked_up"
            }],
            buildPlaylist = $.each(tracks, function(key, value) {
                var trackNumber = value.track,
                    trackName = value.name,
                    trackDuration = value.duration;
                if (trackNumber.toString().length === 1) {
                    trackNumber = '0' + trackNumber;
                }
                $('#plList').append('<li> \
                    <div class="plItem"> \
                        <span class="plNum">' + trackNumber + '.</span> \
                        <span class="plTitle">' + trackName + '</span> \
                        <span class="plLength">' + trackDuration + '</span> \
                    </div> \
                </li>');
            }),
            trackCount = tracks.length,
            npAction = $('#npAction'),
            npTitle = $('#npTitle'),
            audio = $('#audio1').on('play', function () {
                playing = true;
                npAction.text('Now Playing...');
            }).on('pause', function () {
                playing = false;
                npAction.text('Paused...');
            }).on('ended', function () {
                npAction.text('Paused...');
                if ((index + 1) < trackCount) {
                    index++;
                    loadTrack(index);
                    audio.play();
                } else {
                    audio.pause();
                    index = 0;
                    loadTrack(index);
                }
            }).get(0),
            btnPrev = $('#btnPrev').on('click', function () {
                if ((index - 1) > -1) {
                    index--;
                    loadTrack(index);
                    if (playing) {
                        audio.play();
                    }
                } else {
                    audio.pause();
                    index = 0;
                    loadTrack(index);
                }
            }),
            btnNext = $('#btnNext').on('click', function () {
                if ((index + 1) < trackCount) {
                    index++;
                    loadTrack(index);
                    if (playing) {
                        audio.play();
                    }
                } else {
                    audio.pause();
                    index = 0;
                    loadTrack(index);
                }
            }),
            li = $('#plList li').on('click', function () {
                var id = parseInt($(this).index());
                if (id !== index) {
                    playTrack(id);
                }
            }),
            loadTrack = function (id) {
                $('.plSel').removeClass('plSel');
                $('#plList li:eq(' + id + ')').addClass('plSel');
                npTitle.text(tracks[id].name);
                index = id;
                audio.src = mediaPath + tracks[id].file + extension;
                updateDownload(id, audio.src);
            },
            updateDownload = function (id, source) {
                player.on('loadedmetadata', function () {
                    $('a[data-plyr="download"]').attr('href', source);
                });
            },
            playTrack = function (id) {
                loadTrack(id);
                audio.play();
            };
        extension = audio.canPlayType('audio/mpeg') ? '.mp3' : audio.canPlayType('audio/ogg') ? '.ogg' : '';
        loadTrack(index);
    } else {
        // no audio support
        $('.column').addClass('hidden');
        var noSupport = $('#audio1').text();
        $('.container').append('<p class="no-support">' + noSupport + '</p>');
    }
});
</script>
</body>
</html>