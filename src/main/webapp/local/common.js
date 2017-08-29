;(function() {
	
	/**
	 * 通用对象
	 */
	$k = {
		page: {},
		proto: {},
		util: {},
		user: {}
	}
	
	/**
	 * bootstrap table中的数据获取id
	 */
	$k.util.getIds = function(arr) {
		var ids = new Array();
		$.each(arr, function(k, v) {
			ids.push(v.id);
		});
		return ids.join(',');
	}
	
	$k.util.getIdList = function(arr) {
		var ids = new Array();
		$.each(arr, function(k, v) {
			ids.push(v.id);
		});
		return ids;
	}
	
	/**
	 * 初始化bootstrap table
	 */
	$k.util.bsTable = function($table, param) {
		var defaultParam = $.extend(jQuery.fn.bootstrapTable.defaults, {
			cache: false,					// 是否禁用ajax数据缓存, 默认为true
			//height: 500,					// 定义表格的高度
			//undefinedText: '-',			// 当数据为 undefined 时显示的字符, 默认为 '-'
			striped: false,					// 设置为 true 会有隔行变色效果, 默认为false
			
			// 分页设置
			pagination: true,				// 是否显示分页条, 默认为false
			//pageNumber: 1, 				// 初始化加载第一页， 默认为1
			pageSize: 25, 					// 每页的记录行数, 默认为10
			//pageList: [10, 25, 50, 100], 	// 可供选择的每页的行数, 默认为[10, 25, 50, 100, All]
			paginationPreText: '上一页',	
			paginationNextText: '下一页',
			paginationFirstText: '首页',
			paginationLastText: '尾页',
			
			// 搜索设置
			search: true, 					// 是否显示表格搜索, 默认为false
			searchOnEnterKey: true,			// 设置为 true时，按回车触发搜索方法，否则自动触发搜索方法, 默认为false
			//strictSearch: true,			// 设置为 true启用 全匹配搜索，否则为模糊搜索, 默认为false
			//searchText: '',				// 初始化搜索文字, 默认为''
			
			// 显示设置
			iconSize: 'outline',			// btn样式
			showColumns: true,				// 是否显示 内容列下拉框, 默认为false
			showRefresh: true,				// 是否显示 刷新按钮, 默认为false
			showToggle: false,				// 是否显示 切换试图（table/card）按钮, 默认为false
			
			// 点击
			clickToSelect: true,			// 设置true 将在点击行时，自动选择rediobox 和 checkbox, 默认为false
			//singleSelect: true			// 设置True 将禁止多选, 默认为false
			
		}, param); 
		
		var ret = $table.bootstrapTable(defaultParam);
		return ret;
	}
	
	/**
	 * 验证器
	 */
	$k.util.bsValidator = function($form, param) {
		var defaultParam = $.extend({
			message: 'This value is not valid',
/*            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },*/
            excluded: [':disabled']
		}, param);
		
		$form.bootstrapValidator(defaultParam);
	}
	
	/**
	 * 图片选择器
	 */
	$k.util.fileinput = function($input, param) {
		var defaultParam = $.extend({
			language: 'zh', 
            showUpload: false, 
            showRemove: false,
            allowedFileExtensions: [ 'jpg', 'png', 'gif' ],
            browseClass: "btn btn-primary",
            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i>"
		}, param);
		
		$input.fileinput(defaultParam);
	}
	
	/**
	 * 文本编辑器
	 */
	$k.util.summernote = function($obj, param) {
		var defaultParam = $.extend({
			minHeight: 360,
			lang: 'zh-CN',
			focus: true,
			dialogsFade: true,
			placeholder: '正文内容',
			callbacks: {
				onImageUpload: function(files) {
					data = new FormData();
					data.append('imageFile', files[0]);
					
					$.ajax({
						url: param.ctx + '/api/uploadImage',
						type: 'post',
						data: data,
						cache: false,
						contentType: false,  
				        processData: false, 
				        success: function(ret) {
				        	$obj.summernote('insertImage', param.ctx + ret.data, 'image');
				        }
					});
				}
			}
		}, param);
		
		$obj.summernote(defaultParam);
	}
	
	/**
	 * 评价星级
	 */
	$k.util.raty = function($obj, star, param) {
		var defaultParam = $.extend({
			score	: 	star,
			path	: 	'plugins/raty/images/'
		}, param);
		$obj.raty(defaultParam);
	}
	
	/**
	 * 月份选择器
	 */
	$k.util.initDatePicker = function($obj) {
		$obj.datepicker({
			format: 'yyyy-mm',
			minViewMode: 1,
			keyboardNavigation: !1,
			forceParse: !1,
			autoclose: !0,
			todayHighlight: !0
		});
		var now = new Date();
		var month = now.getMonth();
		$obj.parent().find("input").val(now.getFullYear() + "-" + (month < 10 ? "0" + month : month));
	}
	
	/**
	 * 下拉选框插件
	 */
	$k.util.chosen = function($obj) {
		$obj.chosen({
			no_results_text: '无搜索结果',
			disable_search_threshold: 10,
			search_contains: true
		});
	}
	
	/**
	 * 懒加载图片
	 */
	$k.util.lazyLoadImg = function($el) {
		var lazyloadImg = new LazyloadImg({
            el: $el, //匹配元素
            top: 50, //元素在顶部伸出长度触发加载机制
            right: 50, //元素在右边伸出长度触发加载机制
            bottom: 50, //元素在底部伸出长度触发加载机制
            left: 50, //元素在左边伸出长度触发加载机制
            qriginal: true, // true，自动将图片剪切成默认图片的宽高；false显示图片真实宽高
            load: function(el) {
                el.style.cssText += '-webkit-animation: fadeIn 01s ease 0.2s 1 both;animation: fadeIn 1s ease 0.2s 1 both;';
            },
            error: function(el) {}
        });
	}
	
	/**
	 * 截取字符串
	 */
	$k.util.subText = function($paragraph, maxParagraphLength) {
		var paragraphText = $paragraph.text();
		if (paragraphText == null) {
			return;
		}
		
		var paragraphLength = paragraphText.length;
		if (paragraphLength > maxParagraphLength) {
			$paragraph.html(paragraphText.substring(0, maxParagraphLength) + '...');
		}
	}
	
	/**
	 * 从url中获取avatar
	 */
	$k.util.getAvatar = function($obj) {
		var url = $obj.attr('src');
		var avatar = url.substring(url.lastIndexOf('/') + 1);
		return avatar;
	}
	
	/**
	 * toast
	 */
	$k.util.toast = function(param) {
		toastr.options = $.extend(toastr.options, param);
		if (!param.type) {
			param.type = 'success';
		}
		toastr[param.type](param.msg);
	}
	
	/**
	 * 其他方法
	 */
	Date.prototype.Format = function (fmt) { 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	$k.util.getAppealStatus = function (status) {
		switch(status)
		{
			case 0:
				return "待发送";
				break;
			case 1:
				return "待派发";
				break;
			case 2:
				return "待受理";
				break;
			case 3:
				return "处理中";
				break;
			case 4:
				return "待确认";
				break;
			case 5:
				return "已确认";
				break;
			case 6:
				return "驳回";
				break;
			default:
				return "";
		}
	}
	
})();

function formatDate(val) {
	if (val) {
		return new Date(val).Format("yyyy-MM-dd");
	}
	return undefined;
}

function formatDate2(val) {
	if (val) {
		return new Date(val).Format("yyyy-MM-dd hh:mm");
	}
	return undefined;
}

function formatDate3(val) {
	if (val) {
		return new Date(val).Format("yyyy年MM月dd日  hh:mm");
	}
	return undefined;
}

function formatDate4(val) {
	if (val) {
		return new Date(val).Format("yyyy/MM/dd hh:mm");
	}
	return undefined;
}
