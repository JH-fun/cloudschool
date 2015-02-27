//所有api封装成service
//var base_url = 'http://localhost:8080/cloudschool';
var base_url = 'http://111.161.76.27:8080/cloudschool';

//当前用户信息
var url_statistics = base_url + '/goManager.action';

//用户登录
var url_login = base_url + '/manage/system/goLogin.action';
var url_logout = base_url + '/manage/system/goLogout.action';
var url_user_list = base_url + '/manage/system/getuserlistbycurrentuser.action';


//学校相关
var url_school_list = base_url+'/manage/system/getAllSchool.action';
var url_school_pojo = base_url+'/manage/system/getInfoSchool.action';
var url_school_detail = base_url+'/getschoolbycurrentuser.action';


//班级相关
var url_banji_list = base_url + '/manage/system/getAllBanJi.action';
var url_banji_apply = base_url + '/insertBanJiApply.action';
var url_banji_news = base_url + '/listBanJiNews.action';
var url_banji_users = base_url + '/listBanJiUsers.action';
var url_banji_homework = base_url + '/listHomeWorkToday.action';
var url_banji_detail = base_url + '/getbanjibycurrentuser.action';


//年级组相关
var url_gradegroup_list = base_url + '/manage/system/getAllGradeGroup.action';
var url_gradegroup_detail = base_url+'/getgradegroupbycurrentuser.action';


//消息相关
var url_news_list = base_url + '/getUserNewstupian.action';
var url_news_insert = base_url + '/insertNews.action';
var url_news_read = base_url + '/unreadNews.action';
var url_news_pojo = base_url+'/manage/system/getInfoNews.action';


//课余活动相关
var url_extracurricularactivities_list = base_url + '/manage/system/getAllExtracurricularActivities.action';

//作业相关
var url_zuoye_list = base_url + '/manage/system/listuserHomeworkBanJi.action';
var url_zuoye_tixing = base_url + '/tixingHomework.action';
var url_zuoye_pojo = base_url+'/manage/system/getInfoHomework.action';


//审核相关
var url_toexaminemember_list = base_url + '/manage/system/getAllToExamineMember.action';

//科目相关
var url_subject_list = base_url + '/manage/system/getAllSubject.action';

//习题相关
var url_exercises_list = base_url + '/manage/system/getAllExercises.action';

//成员相关
var url_member_list = base_url + '/manage/system/getAllMember.action';
var url_member_insert=base_url + '/insertMember.action';

//相册相关
var url_album_list = base_url + '/getalbumbyusertupian.action';
var url_album_pojo = base_url+'/manage/system/getInfoAlbum.action';


//申请相关
var url_applymember_list = base_url + '/manage/system/getAllApplyMember.action';

//分类管理相关
var url_articlecategory_list = base_url + '/cms/article/listArticleCategory.action';

//专题管理相关
var url_articletitle_list = base_url + '/cms/article/listArticleTitle.action';

//文章管理相关
var url_article_list = base_url + '/getAllArticle.action?MyUrl=xiaoyuanxiaoxitupianjiequ';
var url_wenzhang_pojo = base_url+'/manage/system/getInfoArticle.action';

//用户相关
var url_user_insert = base_url + '/MobileUserRegister.action';
var url_user_login = base_url + '/goLogin.action';
var url_user_login_checkname = base_url + '/userNameRepetition.action';
var url_user_setInfomation = base_url + '/setPersonalInformation.action';
//var url_user_setInfomation = base_url + '/getUserMotif';

//论坛相关
var url_motif_list = base_url + '/getAllMotif.action';
var url_motif_pojo = base_url + '/getIdMotif.action';
var url_replay_inster=base_url +'/insertReply.action';

//云校通使用的数据服务
app.service('onodeService', function($http){

	//所有学校的列表
	this.schoolList = function(data){
		return $http({
				method:'GET',
					url:url_school_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_school_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有班级的列表
	this.banjiList = function(data){
		return $http({
				method:'GET',
					url:url_banji_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_banji_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有年级组的列表
	this.gradegroupList = function(data){
		return $http({
				method:'GET',
					url:url_gradegroup_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_gradegroup_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有消息的列表
	this.newsList = function(data){
		return $http({
				method:'GET',
					url:url_news_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_news_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有课余活动的列表
	this.extracurricularactivitiesList = function(data){
		return $http({
				method:'GET',
					url:url_extracurricularactivities_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_extracurricularactivities_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有作业的列表
	this.zuoyeList = function(data){
		return $http({
				method:'GET',
					url:url_zuoye_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_zuoye_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有审核的列表
	this.toexaminememberList = function(data){
		return $http({
				method:'GET',
					url:url_toexaminemember_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_toexaminemember_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有科目的列表
	this.subjectList = function(data){
		return $http({
				method:'GET',
					url:url_subject_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_subject_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有习题的列表
	this.exercisesList = function(data){
		return $http({
				method:'GET',
					url:url_exercises_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_exercises_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有成员的列表
	this.memberList = function(data){
		return $http({
				method:'GET',
					url:url_member_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_member_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有相册的列表
	this.albumList = function(data){
		return $http({
				method:'GET',
					url:url_album_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_album_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有申请的列表
	this.applymemberList = function(data){
		return $http({
				method:'GET',
					url:url_applymember_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_applymember_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有分类管理的列表
	this.articlecategoryList = function(data){
		return $http({
				method:'GET',
					url:url_articlecategory_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_articlecategory_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有专题管理的列表
	this.articletitleList = function(data){
		return $http({
				method:'GET',
					url:url_articletitle_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_articletitle_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有文章管理的列表
	this.articleList = function(data){
		return $http({
				method:'GET',
					url:url_article_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_article_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	//end factory
	
	//通过当前登录用户拿到用户列表
	this.userList = function(data){
		return $http({
				method:'GET',
					url:url_user_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.list = function(data){
		return $http({
				method:'GET',
					url:url_user_list,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//注册验证用户名是否重复
	this.checkusernamepojo = function(data){
		return $http({
				method:'GET',
					url:url_user_login_checkname,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.pojo = function(data){
		return $http({
				method:'GET',
					url:url_user_login_checkname,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
		

		};
	//学校detail页面，通过当前登录用户拿到的班级pojo
	this.schoolpojobyuser = function(data){
		return $http({
				method:'GET',
					url:url_school_detail,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.pojo = function(data){
		return $http({
				method:'GET',
					url:url_school_detail,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
		

		};
		
		
		
		//年级组detail页面，通过当前登录用户拿到的班级pojo
		this.gradegrouppojobyuser = function(data){
			return $http({
					method:'GET',
						url:url_gradegroup_detail,
						params:data,
						headers: {'Content-Type': 'application/x-www-form-urlencoded'}
						});//end of http
		};
			this.pojo = function(data){
			return $http({
					method:'GET',
						url:url_gradegroup_detail,
						data:data,
						}).success(function(data) {
						if (data.head.status == 'success') {
							return data.body;
						}
					});//end of http
			

			};

			
		//班级detail页面，通过当前登录用户拿到的班级pojo
		this.banjipojobyuser = function(data){
			return $http({
					method:'GET',
						url:url_banji_detail,
						params:data,
						headers: {'Content-Type': 'application/x-www-form-urlencoded'}
						});//end of http
		};
			this.pojo = function(data){
			return $http({
					method:'GET',
						url:url_banji_detail,
						data:data,
						}).success(function(data) {
						if (data.head.status == 'success') {
							return data.body;
						}
					});//end of http
			

			};
		
	
		//消息detail页面
		this.newspojodetail = function(data){
			return $http({
					method:'GET',
						url:url_news_pojo,
						params:data,
						headers: {'Content-Type': 'application/x-www-form-urlencoded'}
						});//end of http
		};
			this.pojodetail = function(data){
			return $http({
					method:'GET',
						url:url_news_pojo,
						data:data,
						}).success(function(data) {
						if (data.head.status == 'success') {
							return data.body;
						}
					});//end of http
			

			};
			
			
			//文章detail页面
			this.wenzhangpojodetail = function(data){
				return $http({
						method:'GET',
							url:url_wenzhang_pojo,
							params:data,
							headers: {'Content-Type': 'application/x-www-form-urlencoded'}
							});//end of http
			};
				this.pojodetail = function(data){
				return $http({
						method:'GET',
							url:url_wenzhang_pojo,
							data:data,
							}).success(function(data) {
							if (data.head.status == 'success') {
								return data.body;
							}
						});//end of http
				

				};
			
			
			
			//相册detail页面
			this.xiangcepojodetail = function(data){
				return $http({
						method:'GET',
							url:url_album_pojo,
							params:data,
							headers: {'Content-Type': 'application/x-www-form-urlencoded'}
							});//end of http
			};
				this.pojodetail = function(data){
				return $http({
						method:'GET',
							url:url_album_pojo,
							data:data,
							}).success(function(data) {
							if (data.head.status == 'success') {
								return data.body;
							}
						});//end of http
				

				};
			
			
			//作业detail页面
			this.zuoyepojodetail = function(data){
				return $http({
						method:'GET',
							url:url_zuoye_pojo,
							params:data,
							headers: {'Content-Type': 'application/x-www-form-urlencoded'}
							});//end of http
			};
				this.pojodetail = function(data){
				return $http({
						method:'GET',
							url:url_zuoye_pojo,
							data:data,
							}).success(function(data) {
							if (data.head.status == 'success') {
								return data.body;
							}
						});//end of http
				

				};
	
	//消息添加
	this.newspojo = function(data){
		return $http({
				method:'GET',
					url:url_news_insert,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.pojo = function(data){
		return $http({
				method:'GET',
					url:url_news_insert,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//注册用户
	this.userpojozhuce = function(data){
		return $http({
				method:'GET',
					url:url_user_insert,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.pojo = function(data){
		return $http({
				method:'GET',
					url:url_user_insert,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	

	
	//用户登录
	this.userpojologin = function(data){
		return $http({
				method:'GET',
					url:url_user_login,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.pojologin = function(data){
		return $http({
				method:'GET',
					url:url_user_login,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//用户退出
	this.userpojologout= function(){
		return $http({
				method:'GET',
					url:url_user_logout,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.pojologout = function(data){
		return $http({
				method:'GET',
					url:url_user_logout,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};

	this.memberpojo = function(data){
		return $http({
				method:'GET',
					url:url_member_insert,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.pojo = function(data){
		return $http({
				method:'GET',
					url:url_member_insert,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//消息是否阅读
	this.newsJson = function(data){
		return $http({
				method:'GET',
					url:url_news_read,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.json = function(data){
		return $http({
				method:'GET',
					url:url_news_read,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'you') {
						return data.body;
					}
					if (data.head.status == 'wu') {
						return data.body;
					}
				});//end of http
	};
	
	//作业提醒
	this.zuoyeJson = function(data){
		return $http({
				method:'GET',
					url:url_zuoye_tixing,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
		this.zuoyejson = function(data){
		return $http({
				method:'GET',
					url:url_zuoye_tixing,
					data:data,
					}).success(function(data) {
					if (data.head.status == 'success') {
						return data.body;
					}
				});//end of http
	};
	
	//所有论坛主题的列表
	this.motifList = function(data){
		return $http({
				method:'GET',
					url:url_motif_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
	//根据ID获取pojojson
	this.motifIdPojo = function(data){
		return $http({
				method:'GET',
					url:url_motif_pojo,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};
	//
	this.replayInster= function(data){
		//return $http.post(url_replay_inster,data);
		return $http({
				url:url_replay_inster,
				data:data
				});//end of http
		
	};
	//修改用户信息
	this.setUserInfo = function(data){
		return $http({
				method:'GET',
					url:url_user_setInfomation,
//					url:url_motif_list,
					params:data,
					headers: {'Content-Type': 'application/x-www-form-urlencoded'}
					});//end of http
	};

	
	});

