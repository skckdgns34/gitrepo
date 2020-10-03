	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
	var birthJ = false;
	//var address = $('#mem_detailaddress');
	
$(function() {
		//var address = $('#mem_detailaddress');
		
		//아이디 중복확인
		$("#member_id").blur(function() {
			if($('#member_id').val()==''){ $('#id_check').text('아이디를 입력하세요.');
				$('#id_check').css('color', 'red');
			} else if(idJ.test($('#member_id').val())!=true){
				$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
				$('#id_check').css('color', 'red');
			} else if($('#member_id').val()!=''){
				
				var mem_id=$('#member_id').val();
				$.ajax({
					async : true,
					type : 'POST',
					data : member_id,
					url : 'idcheck.do',
					dateType: 'json',
					contentType: "application/json; charset=UTF-8",
					success : function(data) {
						
						if(data.cnt > 0){ $('#id_check').text('중복된 아이디 입니다.');
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						}else{ if(idJ.test(mem_id)){
							$('#id_check').text('사용가능한 아이디 입니다.');
							$('#id_check').css('color', 'blue');
							$("#usercheck").attr("disabled", false);
						} else if(mem_id==''){
							$('#id_check').text('아이디를 입력해주세요.');
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						} else{ $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
							}
						}
					}
				}); //ajax///
			}//else if 
		});//blur
				
		$('form').on('submit',function(){
			var inval_Arr = new Array(8).fill(false);
			if (idJ.test($('#member_id').val())) {
				inval_Arr[0] = true;
				} else {
					inval_Arr[0] = false; alert('아이디를 확인하세요.');
					return false;
				}
			// 비밀번호가 같은 경우 && 비밀번호 정규식
			if (($('#member_pw').val() == ($('#member_pw2').val()))
					&& pwJ.test($('#member_pw').val()))
			{ inval_Arr[1] = true;
			} else {
				inval_Arr[1] = false;
				alert('비밀번호를 확인하세요.');
				return false;
			}
			// 이름 정규식
			if (nameJ.test($('#nickname').val())) {
				inval_Arr[2] = true;
			} else {
					inval_Arr[2] = false; alert('이름을 확인하세요.');
					return false;
			}
			
			// 이메일 정규식
			if (mailJ.test($('#member_email').val())){
				console.log(phoneJ.test($('#member_email').val()));
				inval_Arr[4] = true;
			} else {
				inval_Arr[4] = false;
				alert('이메일을 확인하세요.');
				return false;
			}
			// 휴대폰번호 정규식
			if (phoneJ.test($('#member_tel').val())) {
				console.log(phoneJ.test($('#member_tel').val()));
				inval_Arr[5] = true;
			} else {
					inval_Arr[5] = false;
					alert('휴대폰 번호를 확인하세요.');
					return false;
			}
		});
		
		$('#member_id').blur(function() {
			if (idJ.test($('#member_id').val())) {
				console.log('true');
				$('#id_check').text('');
			} else {
				console.log('false');
				$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
				$('#id_check').css('color', 'red');
			}
		});
		
		$('#member_pw').blur(function() {
			if (pwJ.test($('#member_pw').val())) {
				console.log('true');
				$('#pw_check').text('');
			} else {
				console.log('false');
				$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
				$('#pw_check').css('color', 'red');
			}
		});
		
		//1~2 패스워드 일치 확인
		$('#member_pw2').blur(function() {
			if ($('#member_pw').val() != $(this).val()) {
				$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				$('#pw2_check').css('color', 'red');
			} else { $('#pw2_check').text('');
			}
		});
		//이름에 특수문자 들어가지 않도록 설정
		$("#nickname").blur(function() {
			if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#nickname_check").text('');
			} else {
					$('#nickname_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
					$('#nickname_check').css('color', 'red');
			}
		});
		
		$("#member_email").blur(function() {
			if (mailJ.test($(this).val())) {
				$("#email_check").text('');
			} else {
					$('#email_check').text('이메일 양식을 확인해주세요.');
					$('#email_check').css('color', 'red');
			}
		}); 
		
		// 휴대전화 
		$('#member_tel').blur(function(){
			if(phoneJ.test($(this).val())){
				console.log(nameJ.test($(this).val()));
				$("#pnum_check").text('');
			} else {
					$('#pnum_check').text('휴대폰번호를 확인해주세요 ');
					$('#pnum_check').css('color', 'red');
			}
		});
	});
	
