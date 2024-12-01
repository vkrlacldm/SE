//	슬라이더 필터 동작
$(document).ready(function() {
	var $time_readonly = $("#amount");
	var $time_input = $("#filter-time");
	var $time_slider = $(".ui_slider");

	if ( $time_input.val() != "" ) {
		cooking_time = $time_input.val();
		
		if (cooking_time == "135") {
			$time_readonly.val(all_time != null ? all_time : "모든 시간");
		} else {
			$time_readonly.val(cooking_time + (to_min != null ? to_min : "분 이내"));
			$time_slider.slider("value", cooking_time);
		}

	} else {
		$time_slider.slider("value", 135);
		$time_readonly.val(all_time != null ? all_time : "모든 시간");
	}
}); 

$(".ui_slider").slider({
	range:"min",
	value:135,
	min:15,
	max:135,
	step:15,
	slide: function(event, ui) {
		var wording = "";

    	if (ui.value == 135) {
    		$("#filter-time").val("");
    		$("#amount").val(all_time != null ? all_time : "모든 시간");
    	} else {
    		$("#filter-time").val(ui.value);
    		$("#amount").val(ui.value + (to_min != null ? to_min : "분 이내"));
    	}
	},
	stop: function(event, ui) {
		toggleTimeTag($("#filter-time"));
		sendQuery();
	}
});

// 2차 카테고리 보임/숨김
$(".lst_check").on("click", ".arrow-toggle", function() {
	$parent = $(this).parent("label").parent("li");
	$children = $parent.find(".small_lst_check");

	if ( $(this).hasClass("show-children") ) {
		$children.removeClass("hide show").addClass("show");
	} else {
		$children.removeClass("hide show").addClass("hide");
	}

	$(this).toggleClass("show-children hide-children");
});

//	체크박스 동작
$(".lst_check").on("click", "input:checkbox", function() {
	var $self = $(this);
	var $li = $(this).parent("label").parent("li");

	// 버튼 타입에 따라 다르게 동작 (depth1 인가 2인가?)
	if ( $(this).hasClass("depth_one") ) {
		// depth_one 버튼일때
		$children = $li.find(".small_lst_check");

		if ( $li.hasClass("checked") ) {
			// 나 포함 차일드 모두 선택해제
			toggleInput($self, false);
			toggleTag($self, false);
			toggleCheckbox($self, false);

			$children.find("li").each(function() {
				$checkbox = $(this).find("input:checkbox");

				toggleInput($checkbox, false);
				toggleTag($checkbox, false);
				toggleCheckbox($checkbox, false);
			});
		} else {
			// 나 포함 차일드 모두 선택
			toggleInput($self, true);
			toggleTag($self, true);
			toggleCheckbox($self, true);

			$children.find("li").each(function() {
				$checkbox = $(this).find("input:checkbox");

				// 체크박스 이미지는 켜고, 태그와 체크박스는 끈다
				toggleInput($checkbox, true);
				toggleTag($checkbox, false);
				toggleCheckbox($checkbox, false);
			});

			$children.removeClass("show hide").addClass("show");
			$self.siblings(".arrow-toggle").removeClass("show-children hide-children").addClass("hide-children");
		}
	} else {
		// depth_two 버튼일때
		var isAllOn = true;
		$parent = $li.parent().parent();
		$parent_input = $parent.find("input.depth_one:checkbox");

		if ( $li.hasClass("checked") ) {
			// 나와 부모 모두 선택해제
			toggleInput($self, false);
			toggleTag($self, false);
			toggleCheckbox($self, false);

			toggleInput($parent_input, false);
			toggleTag($parent_input, false);
			toggleCheckbox($parent_input, false);

			$li.siblings("li").each(function(index) {
				$checkbox = $(this).find("input:checkbox");

				if ( $(this).hasClass("checked") ) {
					toggleTag($checkbox, true);
					toggleCheckbox ($checkbox, true);
				} else {
					toggleTag($checkbox, false);
					toggleCheckbox($checkbox, false);
				}
			});
		} else {
			// 나는 선택하고 부모는 모두 선택되어있을 경우만 선택
			toggleInput($self, true);
			toggleCheckbox($self, true);

			$li.siblings("li").each(function() {
				if ( !$(this).hasClass("checked") ) {
					isAllOn = false;
				}
			});

			// 다 선택되어 있으면 부모도 선택
			if (isAllOn) {
				toggleInput($parent_input, true);
				toggleTag($parent_input, true);
				toggleCheckbox($parent_input, true);

				$li.parent().find("li").each(function(index) {
					$checkbox = $(this).find("input:checkbox");

					toggleTag($checkbox, false);
					toggleCheckbox($checkbox, false);
				});
			} else {
				toggleInput($parent_input, false);
				toggleTag($parent_input, false);
				toggleCheckbox($parent_input, false);

				$li.parent().find("li").each(function(index) {
					$checkbox = $(this).find("input:checkbox");

					if ( $(this).hasClass("checked") ) {
						toggleTag($checkbox, true);
						toggleCheckbox($checkbox, true);
					} else {
						toggleTag($checkbox, false);
						toggleCheckbox($checkbox, false);
					}
				});
			}
		}
	}

	sendQuery();
});

// 결과박스 삭제시 동작
$("#cat-result").on("click", ".btn_cancel", function() {
	var $wrap = $(this).parent();

	if ($wrap.hasClass("time-cat")) {
		$("#filter-time").val("");
		$(".ui_slider").slider("value", 135);
		$("#amount").val(all_time != null ? all_time : "모든 시간" );
	} else if ($wrap.hasClass("diff-cat")) {
		$("#filter-diff").val("");
		$(".difficulty li").each(function() {
			$(this).find("a.option").removeClass("checked");
		});
	} else if ($wrap.hasClass("healthy-cat")) {
		$("#filter-healthy").val("");
		$(".healthy li").each(function() {
			$(this).find("a.option").removeClass("checked");
		});
	} else if ($wrap.hasClass("basefood-cat")) {
		foodId = $wrap.attr("basefood-id");
		$(".filter-basefood[value=" + foodId + "]").remove();
	} else if ($wrap.hasClass("keyword-cat")) {
		$("#filter-search").val("");
	} else {
		var id = $wrap.attr("cat-id");
		var level = $wrap.attr("cat-level");
		var $selectedInput = $(".finder").find("input:checkbox[value="+ id +"]");

		toggleInput($selectedInput, false);
		toggleCheckbox($selectedInput, false);

		if (level == "parent") {
			$selectedChildren = $selectedInput.parent().siblings(".small_lst_check");
			$selectedChildren.find("li").each(function() {
				$checkbox = $(this).find("input:checkbox");

				toggleInput($checkbox, false);
				toggleCheckbox($checkbox, false);
			});
		}
	}

	$wrap.remove();

	sendQuery();
});

$(".difficulty").on("click", ".option", function() {
	var $li = $(this).parent();
	var $input = $("#filter-diff");
	var value = $(this).attr("data-val");

	if ( $(this).hasClass("checked") ) {
		$(this).removeClass("checked");
		$input.val("");
	} else {
		$(this).addClass("checked");
		$li.siblings("li").each(function() {
			$(this).find("a.option").removeClass("checked");
		});
		$input.val(value);
	}

	toggleDifficultyTag($input);
	sendQuery();
});

$(".healthy").on("click", ".option", function() {
	var $li = $(this).parent();
	var $input = $("#filter-healthy");
	var value = $(this).attr("data-val");

	if ( $(this).hasClass("checked") ) {
		$(this).removeClass("checked");
		$input.val("");
	} else {
		$(this).addClass("checked");
		$li.siblings("li").each(function() {
			$(this).find("a.option").removeClass("checked");
		});
		$input.val(value);
	}

	toggleHealthyTag($input);
	sendQuery();
});

$(".sec_finder").on("change", ".sort-selector", function() {
	var option = $(this).val();

	$("#filter-sort").val(option);
	sendQuery();
});

// ajax 쿼리 날림용 함수
var gThreadKey = "";
var threadCount = 0;

function sendQuery() {
	var lThreadKey = "query" + threadCount; 
	var $frm = $(".result-filter");
	var variables = $(".result-filter").serialize();

	gThreadKey = lThreadKey;
	threadCount++;

	$(".loading_progress").show();
	$(".inner.result").hide();

	$.ajax({
		url: $frm.attr("action"),
		type: $frm.attr("method"),
		data: variables,
		success: function(data) {
			if (lThreadKey == gThreadKey) {
				$(".loading_progress").hide();
				$(".recipes").empty().append($(data).find(".inner.result"));
			}
		}
	});
}

// 체크박스 이미지 토글용 함수
function toggleInput($input, isTurnOn) {
	var $li = $input.parent("label").parent("li");

	if ( !isTurnOn ) {
		$li.removeClass("checked");
	} else {
		$li.addClass("checked");
	}
}

// 체크박스 input 토글용 함수
function toggleCheckbox($input, isTurnOn) {
	var $li = $input.parent("label").parent("li");

	if (!isTurnOn) {
		$input.prop("checked", false);
	} else {
		$input.prop("checked", true);
	}
}

// 카테고리 태그 결과 토글용 함수
function toggleTag($input, isTurnOn) {
	var isDuplicated = false;
	var level = $input.attr("cat-level");
	var name = $input.attr("cat-name");
	var id = $input.val();
	var subText = (level == "parent") ? " 전체" : "";

	$("#cat-result span").each(function() {
		if ( $(this).attr("cat-id") == id ) {
			isDuplicated = true;
		}
	});

	if ( !isTurnOn ) {
		$("#cat-result").find("span[cat-id=" + id + "]").remove();
	} else {
		if (!isDuplicated) {
			$("#cat-result").append($(
				'<span class="added-cat" cat-level="' + level + '" cat-id="' + id + '">' + name + subText +
				'<a href="javascript:;" class="btn_cancel">선택취소</a></span>'
			));
		}
	}
}

function toggleTimeTag($input) {
	var time = $input.val();
	var $cat = $(".time-cat");

	if ($cat.length != 0) {
		$cat.remove();
	}
	if (time != "") {
		$("#cat-result").append($(
			'<span class="time-cat">' + time + (to_min != null ? to_min : "분 이내") + '<a href="javascript:;" class="btn_cancel">선택취소</a></span>'
		));
	}
}

function toggleDifficultyTag($input) {
	var difficulty = $input.val();
	var wording = "";
	var $cat = $(".diff-cat");

	switch(difficulty) {
		case "하":
		wording = easy_food;
		break;
		case "중":
		wording = medium_food;
		break;
		case "상":
		wording = hard_food;
		break;
	}

	if ($cat.length != 0) {
		$cat.remove();
	}
	if (wording != "") {
		$("#cat-result").append($(
			'<span class="diff-cat">' + wording + '<a href="javascript:;" class="btn_cancel">선택취소</a></span>'
		));
	}
}

function toggleHealthyTag($input) {
	var healthy = $input.val();
	var $cat = $(".healthy-cat");

	if ($cat.length != 0) {
		$cat.remove();
	}
	if (healthy != "") {
		$("#cat-result").append($(
			'<span class="healthy-cat">' + healthy + '<a href="javascript:;" class="btn_cancel">선택취소</a></span>'
		));
	}
}
