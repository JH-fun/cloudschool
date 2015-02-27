// 
// Here is how to define your module 
// has dependent on mobile-angular-ui
// 
var app = angular.module('MobileAngularUiExamples', [
  'ngRoute',
  'mobile-angular-ui',
  
  // touch/drag feature: this is from 'mobile-angular-ui.gestures.js'
  // it is at a very beginning stage, so please be careful if you like to use
  // in production. This is intended to provide a flexible, integrated and and 
  // easy to use alternative to other 3rd party libs like hammer.js, with the
  // final pourpose to integrate gestures into default ui interactions like 
  // opening sidebars, turning switches on/off ..
  'mobile-angular-ui.gestures'
]);

// 
// You can configure ngRoute as always, but to take advantage of SharedState location
// feature (i.e. close sidebar on backbutton) you should setup 'reloadOnSearch: false' 
// in order to avoid unwanted routing.
// 
app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/',              {templateUrl: 'module/personal/home.html', reloadOnSearch: false});
  $routeProvider.when('/login',         {templateUrl: 'login.html', reloadOnSearch: false});
  $routeProvider.when('/classmate',         {templateUrl: 'classmate.html', reloadOnSearch: false});
  //各个列表
  $routeProvider.when('/school',         {templateUrl: 'school.html', reloadOnSearch: false});
  $routeProvider.when('/banji',         {templateUrl: 'banji.html', reloadOnSearch: false});
  $routeProvider.when('/gradegroup',         {templateUrl: 'gradegroup.html', reloadOnSearch: false});
  $routeProvider.when('/url_news_list',         {templateUrl: 'news.html', reloadOnSearch: false});
  $routeProvider.when('/url_album_list',         {templateUrl: 'xiangce.html', reloadOnSearch: false});
  $routeProvider.when('/url_article_list',         {templateUrl: 'wenzhang.html', reloadOnSearch: false});

  $routeProvider.when('/extracurricularactivities',         {templateUrl: 'extracurricularactivities.html', reloadOnSearch: false});
  $routeProvider.when('/url_zuoye_list',         {templateUrl: 'zuoye.html', reloadOnSearch: false});
  $routeProvider.when('/toexaminemember',         {templateUrl: 'toexaminemember.html', reloadOnSearch: false});
  $routeProvider.when('/subject',         {templateUrl: 'subject.html', reloadOnSearch: false});
  $routeProvider.when('/exercises',         {templateUrl: 'exercises.html', reloadOnSearch: false});
  $routeProvider.when('/member',         {templateUrl: 'member.html', reloadOnSearch: false});
  $routeProvider.when('/album',         {templateUrl: 'album.html', reloadOnSearch: false});
  $routeProvider.when('/applymember',         {templateUrl: 'applymember.html', reloadOnSearch: false});
  $routeProvider.when('/articlecategory',         {templateUrl: 'articlecategory.html', reloadOnSearch: false});
  $routeProvider.when('/articletitle',         {templateUrl: 'articletitle.html', reloadOnSearch: false});
  $routeProvider.when('/article',         {templateUrl: 'article.html', reloadOnSearch: false});
  $routeProvider.when('/url_user_list',         {templateUrl: 'sidebarRight.html', reloadOnSearch: false});
  
  //添加
  $routeProvider.when('/insertnews',         {templateUrl: 'insertnews.html', reloadOnSearch: false});
  $routeProvider.when('/insertnews1',         {templateUrl: 'insertnews1.html', reloadOnSearch: false});

  //详细页面
//  $routeProvider.when('/banjidetails',         {templateUrl: 'banjidetails.html', reloadOnSearch: false});
  $routeProvider.when('/url_news_pojo',         {templateUrl: 'newsdetails.html', reloadOnSearch: false});
  $routeProvider.when('/url_wenzhang_pojo',         {templateUrl: 'wenzhangdetails.html', reloadOnSearch: false});
  
  $routeProvider.when('/url_album_pojo',         {templateUrl: 'albumdetails.html', reloadOnSearch: false});
  $routeProvider.when('/memberdetails',   {templateUrl: 'memberdetails.html', reloadOnSearch: false});
  $routeProvider.when('/url_gradegroup_detail',         {templateUrl: 'gradegroupdetails.html', reloadOnSearch: false});
  $routeProvider.when('/url_zuoye_pojo',         {templateUrl: 'zuoyedetails.html', reloadOnSearch: false});
  $routeProvider.when('/url_school_detail',         {templateUrl: 'schooldetail.html', reloadOnSearch: false});
  $routeProvider.when('/individualCenter',         {templateUrl: 'individualCenter.html', reloadOnSearch: false});
  $routeProvider.when('/url_banji_detail',         {templateUrl: 'banjidetails.html', reloadOnSearch: false});

  //提醒
  $routeProvider.when('/url_news_read',         {templateUrl: 'home.html', reloadOnSearch: false});
  $routeProvider.when('/url_zuoye_tixing',         {templateUrl: 'home.html', reloadOnSearch: false});
  
  //注册
  $routeProvider.when('/url_user_insert',         {templateUrl: 'login.html', reloadOnSearch: false});
  //跳转到登录页面
  $routeProvider.when('/login',         {templateUrl: 'login.html', reloadOnSearch: false});
  $routeProvider.when('/url_user_login_checkname',         {templateUrl: 'login.html', reloadOnSearch: false});
  

  //跳转到注册页面
  $routeProvider.when('/register',         {templateUrl: 'register.html', reloadOnSearch: false});

  //班级
  $routeProvider.when('/banjixiaoxi',         {templateUrl: 'module/classnews/banjixiaoxi.html', reloadOnSearch: false});
  //学校
  $routeProvider.when('/xuexiaoshequ',         {templateUrl: 'module/school/xuexiaoshequ.html', reloadOnSearch: false});
  $routeProvider.when('/xiaoyuanjianjie',         {templateUrl: 'module/school/xiaoyuanjianjie.html', reloadOnSearch: false});
  $routeProvider.when('/xiaoyuanxiaoxi',         {templateUrl: 'module/school/xiaoyuanxiaoxi.html', reloadOnSearch: false});
  $routeProvider.when('/schooldistribut',      {templateUrl: 'module/school/schooldistribut.html', reloadOnSearch: false});
  $routeProvider.when('/luntandetails',      {templateUrl: 'module/school/luntandetails.html', reloadOnSearch: false});
  $routeProvider.when('/luntan',      {templateUrl: 'module/school/luntan.html', reloadOnSearch: false});
  
  $routeProvider.when('/shenghuozhinan',         {templateUrl: 'module/living/shenghuozhinan.html', reloadOnSearch: false});
  $routeProvider.when('/me',         {templateUrl: 'module/me/me.html', reloadOnSearch: false});

  
  //主页及子页
  $routeProvider.when('/url_user_login',         {templateUrl: 'module/personal/home.html', reloadOnSearch: false});
  $routeProvider.when('/commonnews',      {templateUrl: 'module/personal/commonnews.html', reloadOnSearch: false});
  
  //页面连接跳转
  $routeProvider.when('/wodezhanghao',         {templateUrl: 'wodezhanghao.html', reloadOnSearch: false});


  $routeProvider.when('/xiaoyuanxiaoxidetail',         {templateUrl: 'xiaoyuanxiaoxidetail.html', reloadOnSearch: false});
  $routeProvider.when('/zhaopianfenxiang',         {templateUrl: 'zhaopianfenxiang.html', reloadOnSearch: false});
  $routeProvider.when('/mujuan',         {templateUrl: 'mujuan.html', reloadOnSearch: false});
  $routeProvider.when('/zuqiu',         {templateUrl: 'zuqiu.html', reloadOnSearch: false});
  $routeProvider.when('/logo',         {templateUrl: 'logo.html', reloadOnSearch: false});
  $routeProvider.when('/copyofnews',         {templateUrl: 'copyofnews.html', reloadOnSearch: false});
  $routeProvider.when('/copyofnewsdetails',         {templateUrl: 'copyofnewsdetails.html', reloadOnSearch: false});
  $routeProvider.when('/copyofzuoye',         {templateUrl: 'copyofzuoye.html', reloadOnSearch: false});
  $routeProvider.when('/copyofzuoyedetails',         {templateUrl: 'copyofzuoyedetails.html', reloadOnSearch: false});


  $routeProvider.when('/message',         {templateUrl: 'message.html', reloadOnSearch: false});
  
  
  $routeProvider.when('/scroll',        {templateUrl: 'scroll.html', reloadOnSearch: false}); 
  $routeProvider.when('/toggle',        {templateUrl: 'toggle.html', reloadOnSearch: false}); 
  $routeProvider.when('/tabs',          {templateUrl: 'tabs.html', reloadOnSearch: false}); 
  $routeProvider.when('/accordion',     {templateUrl: 'accordion.html', reloadOnSearch: false}); 
  $routeProvider.when('/overlay',       {templateUrl: 'overlay.html', reloadOnSearch: false}); 
  $routeProvider.when('/forms',         {templateUrl: 'forms.html', reloadOnSearch: false});
  $routeProvider.when('/dropdown',      {templateUrl: 'dropdown.html', reloadOnSearch: false});
  $routeProvider.when('/drag',          {templateUrl: 'drag.html', reloadOnSearch: false});
  $routeProvider.when('/carousel',      {templateUrl: 'carousel.html', reloadOnSearch: false});



  
  
}]);


app.config(['$httpProvider', function($httpProvider) {
	  $httpProvider.defaults.withCredentials = true;
	  //使用CORS
	  $httpProvider.defaults.useXDomain=true;
	  delete $httpProvider.defaults.headers.common['X-Requested-With'];
	}]);
//
// `$drag` example: drag to dismiss
//
app.directive('dragToDismiss', function($drag, $parse, $timeout){
  return {
    restrict: 'A',
    compile: function(elem, attrs) {
      var dismissFn = $parse(attrs.dragToDismiss);
      return function(scope, elem, attrs){
        var dismiss = false;

        $drag.bind(elem, {
          constraint: {
            minX: 0, 
            minY: 0, 
            maxY: 0 
          },
          move: function(c) {ol
            if( c.left >= c.width / 4) {
              dismiss = true;
              elem.addClass('dismiss');
            } else {
              dismiss = false;
              elem.removeClass('dismiss');
            }
          },
          cancel: function(){
            elem.removeClass('dismiss');
          },
          end: function(c, undo, reset) {
            if (dismiss) {
              elem.addClass('dismitted');
              $timeout(function() { 
                scope.$apply(function() {
                  dismissFn(scope);  
                });
              }, 400);
            } else {
              reset();
            }
          }
        });
      };
    }
  };
});

//
// Another `$drag` usage example: this is how you could create 
// a touch enabled "deck of cards" carousel. See `carousel.html` for markup.
//
app.directive('carousel', function(){
  return {
    restrict: 'C',
    scope: {},
    controller: function($scope) {
      this.itemCount = 0;
      this.activeItem = null;

      this.addItem = function(){
        var newId = this.itemCount++;
        this.activeItem = this.itemCount == 1 ? newId : this.activeItem;
        return newId;
      };

      this.next = function(){
        this.activeItem = this.activeItem || 0;
        this.activeItem = this.activeItem == this.itemCount - 1 ? 0 : this.activeItem + 1;
      };

      this.prev = function(){
        this.activeItem = this.activeItem || 0;
        this.activeItem = this.activeItem === 0 ? this.itemCount - 1 : this.activeItem - 1;
      };
    }
  };
});

app.directive('carouselItem', function($drag) {
  return {
    restrict: 'C',
    require: '^carousel',
    scope: {},
    transclude: true,
    template: '<div class="item"><div ng-transclude></div></div>',
    link: function(scope, elem, attrs, carousel) {
      scope.carousel = carousel;
      var id = carousel.addItem();
      
      var zIndex = function(){
        var res = 0;
        if (id == carousel.activeItem){
          res = 2000;
        } else if (carousel.activeItem < id) {
          res = 2000 - (id - carousel.activeItem);
        } else {
          res = 2000 - (carousel.itemCount - 1 - carousel.activeItem + id);
        }
        return res;
      };
      scope.$watch(function(){
        return carousel.activeItem;
      }, function(n, o){
        elem[0].style['z-index']=zIndex();
      });
      

      $drag.bind(elem, {
        constraint: { minY: 0, maxY: 0 },
        adaptTransform: function(t, dx, dy, x, y, x0, y0) {
          var maxAngle = 15;
          var velocity = 0.02;
          var r = t.getRotation();
          var newRot = r + Math.round(dx * velocity);
          newRot = Math.min(newRot, maxAngle);
          newRot = Math.max(newRot, -maxAngle);
          t.rotate(-r);
          t.rotate(newRot);
        },
        move: function(c){
          if(c.left >= c.width / 4 || c.left <= -(c.width / 4)) {
            elem.addClass('dismiss');  
          } else {
            elem.removeClass('dismiss');  
          }          
        },
        cancel: function(){
          elem.removeClass('dismiss');
        },
        end: function(c, undo, reset) {
          elem.removeClass('dismiss');
          if(c.left >= c.width / 4) {
            scope.$apply(function() {
              carousel.next();
            });
          } else if (c.left <= -(c.width / 4)) {
            scope.$apply(function() {
              carousel.next();
            });
          }
          reset();
        }
      });
    }
  };
});


//
// For this trivial demo we have just a unique MainController 
// for everything
//

app.controller('MainController', ['$rootScope', '$scope', '$http','onodeService','$location','$interval','$window',
function($rootScope, $scope, $http, onodeService, $location, $interval,$window){
	
	$rootScope.scrollableshow=false;
	var tempsession=$window.sessionStorage["userInfo"];
	
	console.log("session"+typeof (tempsession));
	if (tempsession == "null" || typeof (tempsession)=="undefined" ){
		$rootScope.scrollableshow=false;
	}else{
		console.log("有SESSION");
		$rootScope.scrollableshow=true;
	}
		
	
	
	//退出
	$scope.logout = function() {

//		  onodeService.userpojologout().success(function(data,status,headers,config){
//								$location.path('/url_user_login');
			//清空session
								$rootScope.rightShow=false;
							   
							    $window.sessionStorage["login"] = "logout";
							    console.log("userInfo:"+typeof($window.sessionStorage["login"]));
							    $location.path('/');
	//});
	}
	
	//定时刷新

	var promise = $interval(function(){
//		   $location.path('/url_news_read');
//		   $location.path('/url_zuoye_tixing');
		$location.url();
		},3000);

  // User agent displayed in home page
  $scope.userAgent = navigator.userAgent;
  
  // Needed for the loading screen
  $rootScope.$on('$routeChangeStart', function(){
    $rootScope.loading = true;
  });

  $rootScope.$on('$routeChangeSuccess', function(){
    $rootScope.loading = false;
  });

  // Fake text i used here and there.
  $scope.lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel explicabo, aliquid eaque soluta nihil eligendi adipisci error, illum corrupti nam fuga omnis quod quaerat mollitia expedita impedit dolores ipsam. Obcaecati.';

  // 
  // 'Scroll' screen
  // 
  var scrollItems = [];

  for (var i=1; i<=100; i++) {
    scrollItems.push('Item ' + i);
  }

  $scope.scrollItems = scrollItems;

  $scope.bottomReached = function() {
    alert('恭喜你滚动到列表的末尾！');
  };

  // 
  // Right Sidebar
  // 
  $scope.chatUsers = onodeService.list();

  //
  // 'Forms' screen
  //  
  $scope.rememberMe = true;
  $scope.email = 'cxh@canetwork.cn';
  
  $scope.login = function() {
    alert('You submitted the login form');
  };
  
  
  
		//班级detail通过当前登录用户取到的	  
		  $scope.gradegroupdetailbyuser = function() {
			   $location.path('/url_gradegroup_detail');
			   onodeService.gradegrouppojobyuser({'noneid':12,'myUrl':'SchoolJson'}).success(function(data,status,headers,config){
					 console.log("gradegrouppojobyuser pojo:"+data);
					$scope.gradegroupPojobyuser = data;
				});
			  };
		//班级detail通过当前登录用户取到的
		  $scope.banjidetailbyuser = function() {
			   $location.path('/url_banji_detail');
			   onodeService.banjipojobyuser({'noneid':12,'myUrl':'SchoolJson'}).success(function(data,status,headers,config){
					 console.log("banjipojobyuser pojo:"+data);
					$scope.banjiPojobyuser = data;
				});
			  };
	   //学校detail通过当前登录用户取到的	  
	   $scope.schooldetailbyuser = function() {
		   $location.path('/url_school_detail');
		   onodeService.schoolpojobyuser({'noneid':12,'myUrl':'SchoolJson'}).success(function(data,status,headers,config){
				 console.log("schoolpojobyuser pojo:"+data);
				$scope.schoolPojobyuser = data;
			});
		  };
		  
		  //消息tetail
		   $scope.newsdetail = function(id) {
			   $location.path('/url_news_pojo');
			   onodeService.newspojodetail({'noneid':12,'myUrl':'NewsJson','pojo.id':id}).success(function(data,status,headers,config){
					 console.log("news pojo:"+data);
					$scope.newsPojodetail = data;
					$rootScope.fasongrenid = data.fasongrenid;
					
				});
			  };
			//文章tetail
			   $scope.wenzhangdetail = function(id) {
				   $location.path('/url_wenzhang_pojo');
				   onodeService.wenzhangpojodetail({'noneid':12,'myUrl':'Articlejson','pojo.id':id}).success(function(data,status,headers,config){
						 console.log("wenzhang pojo:"+data);
						$scope.wenzhangPojodetail = data;
						
					});
				  };
			  
			//相册tetail
			   $scope.xiangcedetail = function(id) {
				   $location.path('/url_album_pojo');
				   onodeService.xiangcepojodetail({'noneid':12,'myUrl':'AlbumJson','pojo.id':id}).success(function(data,status,headers,config){
						 console.log("album pojo:"+data);
						$scope.xiangcePojodetail = data;
						
					});
				  };
			  
			//作业tetail
			   $scope.zuoyedetail = function(id) {
				   $location.path('/url_zuoye_pojo');
				   onodeService.zuoyepojodetail({'noneid':12,'myUrl':'NewsJson','pojo.id':id}).success(function(data,status,headers,config){
						 console.log("zuoye pojo:"+data);
						$scope.zuoyePojodetail = data;
						
					});
				  };
			  

  // 
  // 'Drag' screen
  // 
  $scope.notices = [];
  
  for (var j = 0; j < 10; j++) {
    $scope.notices.push({icon: 'envelope', message: 'Notice ' + (j + 1) });
  }

  $scope.deleteNotice = function(notice) {
    var index = $scope.notices.indexOf(notice);
    if (index > -1) {
      $scope.notices.splice(index, 1);
    }
  };
  	 //列表
	 onodeService.schoolList({'noneid':1,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("school list:"+data);
		$scope.schoolList = data;
		
	});
	 onodeService.banjiList({'noneid':11,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("banji list:"+data);
		$scope.banjiList = data;
		$scope.banji = $scope.banjiList[0].id;
		
	});
//	 onodeService.gradegroupList({'noneid':5,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("gradegroup list:"+data);
//		$scope.gradegroupList = data;
//		
//	});
	 onodeService.newsList({'noneid':6,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("news list:"+data);
		$scope.newsList = data;
		
	});
//	 onodeService.extracurricularactivitiesList({'noneid':7,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("extracurricularactivities list:"+data);
//		$scope.extracurricularactivitiesList = data;
//		
//	});
	 onodeService.zuoyeList({'noneid':8,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("zuoye list:"+data);
		$scope.zuoyeList = data;
		
	});
//	 onodeService.toexaminememberList({'noneid':9,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("toexaminemember list:"+data);
//		$scope.toexaminememberList = data;
//		
//	});
//	 onodeService.subjectList({'noneid':10,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("subject list:"+data);
//		$scope.subjectList = data;
//		
//	});
//	 onodeService.exercisesList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("exercises list:"+data);
//		$scope.exercisesList = data;
//		
//	});
//	 onodeService.memberList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("member list:"+data);
//		$scope.memberList = data;
//		$scope.newsto = $scope.memberList[0].id;
//	});
	 onodeService.albumList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("album list:"+data);
		$scope.albumList = data;
		
	});
//	 onodeService.applymemberList({'noneid':3,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("applymember list:"+data);
//		$scope.applymemberList = data;
//		
//	});
//	 onodeService.articlecategoryList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("articlecategory list:"+data);
//		$scope.articlecategoryList = data;
//		
//	});
//	 onodeService.articletitleList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("articletitle list:"+data);
//		$scope.articletitleList = data;
//		
//	});
//	 onodeService.userList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
//		 console.log("user list:"+data);
//		$scope.userList = data;
//		
//	});
	 onodeService.articleList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("article list:"+data);
		$scope.articleList = data;
		//取session


	});
//
//	 
//	 
//	 //消息是否阅读
//	 onodeService.newsJson({'noneid':12}).success(function(data,status,headers,config){
//			$scope.newsJson = data;
//			console.log("newsJson:"+$scope.newsJson);
//		});
//	//作业提醒
//	 onodeService.zuoyeJson({'noneid':12}).success(function(data,status,headers,config){
//			$scope.zuoyeJson = data;
//			console.log("zuoyeJson:"+$scope.zuoyeJson);
//		});
  
//验证用户是否已经登陆
  $rootScope.loginVerify=function(){
		if (!($window.sessionStorage["login"])||$window.sessionStorage["login"] =="logout") {
			$location.path('/login');


	      }
		else{
			var userInfo = JSON.parse($window.sessionStorage["userInfo"]);
//			$rootScope.userpojologin = userInfo.username;
//		 	$rootScope.userpojologinemail = userInfo.email;
//			$rootScope.userpojologinmemberId = userInfo.memberId;
		console.log("userInfo:"+$window.sessionStorage["login"]);
		console.log("userInfo:"+$window.sessionStorage["userInfo"]);
		}
  };
  //记录用户当前选中的行
  $rootScope.saveSelectIndex=function(index){
	  $rootScope.selectIndex=index;
  };
		if ($window.sessionStorage["userInfo"]) {
			
			var userInfo = JSON.parse($window.sessionStorage["userInfo"]);
			console.log("pojojson:"+$window.sessionStorage["userInfo"]);
//				$rootScope.userpojologin = userInfo.username;
//			 	$rootScope.userpojologinemail = userInfo.email;
//				$rootScope.userpojologinmemberId = userInfo.memberId;

				console.log("$rootScope.userpojologin:"+$rootScope.userpojologin);
				console.log("$rootScope.userpojologinemail:"+$rootScope.userpojologinemail);
				console.log("$rootScope.userpojologinmemberId:"+$rootScope.userpojologinmemberId);

	      }
}
//end of function


]);


app.controller('showDetailsController',['$rootScope','$scope',
function($rootScope,$scope){
	//显示班级细节
//	$rootScope.showBanjiDetails=function(index){
//		$rootScope.banjiDetails={id:$scope.banjiList[index].id ,
//												jianjie:$scope.banjiList[index].jianjie ,
//												address:$scope.banjiList[index].address};
//	}
	//显示相册细节
//	$rootScope.showAlbumDetails=function(index){
//		$rootScope.albumDetails={name:$scope.albumList[index].name ,
//												authorName:$scope.albumList[index].authorName ,
//												keyWord:$scope.albumList[index].keyWord ,
//												inTime:$scope.albumList[index].inTime ,
//												image:$scope.albumList[index].image ,
//												updateTime:$scope.albumList[index].updateTime 
//												};
//	}
	//取到社区的用户Id
	$rootScope.showshequUserId=function(index){
		$rootScope.shequUserId=$scope.userList[index].id;
	}
	//显示年级组细节
//	$rootScope.showGradegroupDetails=function(index){
//		 $rootScope.gradegroupDetails={school:$scope.gradegroupList[index].school,number:$scope.gradegroupList[index].number,exercise:$scope.gradegroupList[index].exercise,banji:$scope.gradegroupList[index].banji,name:$scope.gradegroupList[index].name};
//	console.log("学校"+$scope.xuexiao);
//	console.log("学校"+$scope.xuexiao.name);
//	}
	//显示作业细节
//	$rootScope.showZuoyeDetails=function(index){
//		 $rootScope.zuoyeDetails={neirong:$scope.zuoyeList[index].neirong,number:$scope.zuoyeList[index].number,beizhu:$scope.zuoyeList[index].beizhu,shijian:$scope.zuoyeList[index].shijian,subject:$scope.zuoyeList[index].subject,banji:$scope.zuoyeList[index].banji};
//	}
	//测试用
	$scope.fun=function(){
		$scope.id=100;
		console.log("jianjie"+$scope.jianjie);
	}
}]);


// 消息的添加
app.controller('insertnewsController', [ '$rootScope', '$scope', '$location',
		'onodeService', function($rootScope, $scope, $location, onodeService) {
			$scope.submit = function() {
				console.log("name pojo:" + $scope.name);
				console.log("newsfrom pojo:" + $scope.newsfrom);
				console.log("newsto pojo:" + $scope.newsto);
				console.log("number pojo:" + $scope.number);
				onodeService.newspojo({
					'noneid' : 12,
					'myUrl' : 'pojoJson',
					'pojo.name' : $scope.name,
					'pojo.newsfrom.id' : $rootScope.userpojologinmemberId,
					'pojo.newsto.id' : $scope.newsto,
					'pojo.number' : $scope.number,
					'pojo.fasongshijian' : new Date()
				}).success(function(data, status, headers, config) {
					$location.path('/url_news_list');
					console.log("news pojo:" + data);
				});
			};
		} ]);


app.controller('insertnewsbbbbbController', [ '$rootScope', '$scope', '$location',
                                 		'onodeService', function($rootScope, $scope, $location, onodeService) {
                                 			$scope.submit = function() {
                                 				console.log("name pojo:" + $scope.name);
                                 				console.log("newsfrom pojo:" + $scope.newsfrom);
                                 				console.log("newsto pojo:" + $scope.newsto);
                                 				console.log("number pojo:" + $scope.number);
                                 				onodeService.newspojo({
                                 					'noneid' : 12,
                                 					'myUrl' : 'pojoJson',
                                 					'pojo.name' : $scope.name,
                                 					'pojo.newsfrom.id' : $rootScope.userpojologinmemberId,
                                 					'pojo.newsto.id' : $rootScope.shequUserId,
                                 					'pojo.number' : $scope.number,
                                 					'pojo.fasongshijian' : new Date()
                                 				}).success(function(data, status, headers, config) {
                                 					$location.path('/url_news_list');
                                 					console.log("news pojo:" + data);
                                 				});
                                 			};
                                 		} ]);



app.controller('insertnewsaaaController', [ '$rootScope', '$scope', '$location',
                                 		'onodeService', function($rootScope, $scope, $location, onodeService) {
                                 			$scope.submit = function() {
                                 				console.log("name pojo:" + $scope.name);
                                 				console.log("newsfrom pojo:" + $scope.newsfrom);
                                 				console.log("newsto pojo:" + $scope.newsto);
                                 				console.log("number pojo:" + $scope.number);
                                 				onodeService.newspojo({
                                 					'noneid' : 12,
                                 					'myUrl' : 'pojoJson',
                                 					'pojo.name' : $scope.name,
                                 					'pojo.newsfrom.id' : $rootScope.userpojologinmemberId,
                                 					'pojo.newsto.id' : $rootScope.fasongrenid,
                                 					'pojo.number' : $scope.number,
                                 					'pojo.fasongshijian' : new Date()
                                 				}).success(function(data, status, headers, config) {
                                 					$location.path('/url_news_list');
                                 					console.log("news pojo:" + data);
                                 				});
                                 			};
                                 		} ]);
//显示成员细节
app.controller('showMemberDetailsController', [ '$rootScope', '$scope',
		function($rootScope, $scope) {
			$rootScope.showMemberDetails = function(index) {
				$rootScope.memberDetails = {
					id : $scope.memberList[index].user.id,
					name : $scope.memberList[index].name,
					user : $scope.memberList[index].user.username,
					email : $scope.memberList[index].user.email,
					inTime : $scope.memberList[index].user.inTime,
					updateTime : $scope.memberList[index].user.updateTime,
					enabled : $scope.memberList[index].user.enabled
				};
			}
			$scope.fun = function() {
				$scope.id = 100;
				console.log("name" + $scope.name);
			}
		} ]);

//注册
app.controller('registerController',['$rootScope','$scope','$location','onodeService',
                                       function($rootScope,$scope, $location, onodeService){
                                       	 $scope.regist = function(){
                                       		 if($scope.regform.$valid){
                                       			 if($scope.user.password==$scope.user.repassword){
                                       			//注册验证用户名是否重复
                                       				 onodeService.checkusernamepojo({'noneid':12,'myUrl':'pojoJson','pojo.name':$scope.user.name}).success(function(data,status,headers,config){
 									               			console.log("111111111111111data:"+data);
                                       					 	if(data){
                                          					     alert("用户已存在！");
 	
                                       					 	}else{
                                       					     onodeService.userpojozhuce( {'noneid':12,
												     				 											'myUrl':'pojoJson',
												     				 											'userGroupId':3,
												     				 											'pojo.name':$scope.user.name,
												     				 											'pojo.password':$scope.user.password,
												     				 											'pojo.email':$scope.user.email}).success(function(data,status,headers,config){
												     				 		$location.path('/url_user_insert');
												     				 		if(data.pojoid!=''){
												         				 		onodeService.memberpojo( {'noneid':12,
																						'myUrl':'pojoJson',
																						'pojo.name':$scope.user.name,
																						'pojo.user.id':data.pojoid,
																						'pojo.banji.id':$scope.banji}).success(function(data,status,headers,config){
																						$location.path('/url_member_insert');
													                                   });
												     				 		}
												     		           });
												     				console.log("name:"+$scope.user.name);
												             		console.log("password:"+$scope.user.password);
												             		console.log("email:"+$scope.user.email);
												             		console.log("banji:"+$scope.banji);
                                       					 	}
                                       					});
                                       			 }else{
                                       				alert("两次输入的信息不一致");
                                       				console.log("两次输入的密码不一致");
                                       			 }
                                       		 }else{
                                       			 alert("请输入符合要求的信息");
                                       			console.log("请输入符合要求的信息");
                                       		 }
                                         	 };  
                                         	$scope.passreg=false;
                                       		 $scope.showpass=function(){
                                       			 console.log("show");
                                       			 if($scope.user.password!=$scope.user.repassword){
                                       				$scope.passreg=true;
                                       			 }	 
                                       		 }
                                       		 $scope.hidepass=function(){
                                       			 console.log("hide");
                                       			$scope.passreg=false;
                                       		 }
                                       }]);


//登录
app.controller('loginController',['$rootScope','$scope','$location','onodeService','$window',
                                       function($rootScope,$scope, $location, onodeService,$window){
                                       	 $scope.userlogin = function(){
                                       		 if($scope.loginregform.$valid){
                                       				 onodeService.userpojologin( {'noneid':12,
                                       				 											'myUrl':'pojoJson',
                                       				 											//$scope.yonghuming,:$scope.mima,
                                       				 											'pojo.name':$scope.yonghuming,
                                       				 											'myUserName':$scope.yonghuming,
                                       				 											'myPassword':$scope.mima,
                                       				 											'pojo.password':$scope.mima}).success(function(data,status,headers,config){
                                       				 	$location.path('/url_user_login');
                                       				 	$rootScope.scrollableshow=true;
                                       				 	$rootScope.userpojologin = data.username;
                                       				 	$rootScope.userpojologinemail = data.email;
                                       				 	$rootScope.userpojologinmemberId = data.memberId;
                                       				 	//存session
                                						$window.sessionStorage["userInfo"] = JSON.stringify(data);
                                						//因为无论用户名密码是否匹配都会返回data，所以需要判断data的内容
                                						if(data.username==$scope.yonghuming){
                                							$rootScope.rightShow=true;
                                							$window.sessionStorage["login"] = "login";
                                						}
                                						
                                						
                                                   });
                                                		console.log("----------name:"+$scope.yonghuming);
                                                   		console.log("==========password:"+$scope.mima);
                                                   		console.log("==========password:"+$rootScope.userpojologin);
                                                   		
                                       		 }else{
                                       			 alert("请输入符合要求的信息");
                                       			console.log("请输入符合要求的信息");
                                       		 }

                                         	 };  
                                       }]);

//班级消息控制器

app.controller('ClassNewsController',['$rootScope','$scope','$location','onodeService','$window','$interval','$sce',
                                  function($rootScope,$scope, $location, onodeService,$window, $interval,$sce){
	console.log("加载成功");
	var c="qwe&quot;da&quot;";
	console.log(c);
	c=c.replace(/&quot;/g,"\"");
	console.log(c);
	$rootScope.loginVerify();
                                  	
	//1.获取班级消息
	onodeService.newsList({'noneid':6,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("news list:"+data);
		$scope.newsList = data;
		var id = data[0].id;
		var inTime = data[0].inTime;
		for (var i=0;i<data.length;i++)
		{
			if (data[i].inTime>inTime)
			  {
				inTime=data[i].inTime;
				id=data[i].id;
			  }
		}
//		 console.log("news pojoqqqqqqqqqqqqqqq:"+id);
				
		 if(id>0){
			//消息tetail
			   onodeService.newspojodetail({'noneid':12,'myUrl':'NewsJson','pojo.id':id}).success(function(data,status,headers,config){
					 console.log("news pojo:"+data);
					$scope.newsPojodetail = data;
					$rootScope.fasongrenid = data.fasongrenid;
					
					
					//转换json中的html元素为字符串
					$scope.newsPojodetail.content=data.content.replace(/&quot;/g,"\"");
					//抓取图片源文件路径
					$scope.begin=$scope.newsPojodetail.content.indexOf("<img");
					$scope.end=$scope.newsPojodetail.content.indexOf("title");
					$scope.str=$scope.newsPojodetail.content.substring($scope.begin+10,$scope.end-2);

					//angularJS嵌入html代码(controller中必须注入$sec对象)
					$scope.deliberatelyTrustDangerousSnippet = function() {  
						return $sce.trustAsHtml($scope.newsPojodetail.content);  
						};
					
				});
		 }
		 
		 
//		 for (var i=0;i<data.length;i++)
//			{
//				//转换json中的html元素为字符串
//					$scope.newsList[i].content=data[i].content.replace(/&quot;/g,"\"");
//					//抓取图片源文件路径
//					$scope.begin[i]=$scope.newsList[i].content.indexOf("<img");
//					$scope.end[i]=$scope.newsList[i].content.indexOf("title");
//					$scope.str[i]=$scope.newsList[i].content.substring($scope.begin+10,$scope.end-2);
//					$scope.newsList[i].content=$scope.str[i];
//					//angularJS嵌入html代码(controller中必须注入$sec对象)
//					$scope.deliberatelyTrustDangerousSnippet = function() {  
//						return $sce.trustAsHtml($scope.newsList[i].content);  
//						};
//			}
		 
		
				
				
				
	});
//  	console.log("^^^111111111111"+$scope.newsPojodetail);

	
	
	//2.获取作业
	 onodeService.zuoyeList({'noneid':8,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("zuoye list:"+data);
		$scope.zuoyeList = data;
		
	});
	
	//3.获取照片
	 onodeService.albumList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("album list:"+data);
//		$scope.albumList = data;
		for (var i=0;i<2;i++)
		{
//			var list = new Array();
			$scope.albumList[i] = data[i];
//				//转换json中的html元素为字符串
//				$scope.albumList[i].content=data[i].content.replace(/&quot;/g,"\"");
//				//抓取图片源文件路径
//				$scope.begin[i]=$scope.albumList[i].content.indexOf("<img");
//				$scope.end[i]=$scope.albumList[i].content.indexOf("title");
//				$scope.str[i]=$scope.albumList[i].content.substring($scope.begin+10,$scope.end-2);
//				$scope.albumList[i].content=$scope.str[i];
//				//angularJS嵌入html代码(controller中必须注入$sec对象)
//				$scope.deliberatelyTrustDangerousSnippet = function() {  
//					return $sce.trustAsHtml($scope.albumList[i].content);  
//					};
		}
	});
	
                                  }]);

//学校社区controller
	app.controller('SchoolController',['$rootScope','$scope','$location','onodeService','$window','$sce',
                                      function($rootScope,$scope, $location, onodeService,$window,$sce){
    	console.log("加载成功");
    	var c="qwe&quot;da&quot;";
    	console.log(c);
    	c=c.replace(/&quot;/g,"\"");
    	console.log(c);
    	$rootScope.loginVerify();
		   onodeService.schoolpojobyuser({'noneid':12,'myUrl':'SchoolJson'}).success(function(data,status,headers,config){
				 console.log("schoolpojobyuser pojo:"+data);
				$rootScope.schoolPojobyuser = data;
				//转换json中的html元素为字符串
				$rootScope.schoolPojobyuser.school1=$rootScope.schoolPojobyuser.school1.replace(/&quot;/g,"\"");
				//抓取图片源文件路径
				$scope.begin=$scope.schoolPojobyuser.school1.indexOf("<img");
				$scope.end=$scope.schoolPojobyuser.school1.indexOf("title");
				$rootScope.str=$rootScope.schoolPojobyuser.school1.substring($scope.begin+10,$scope.end-2);
				//angularJS嵌入html代码(controller中必须注入$sec对象)
				$scope.deliberatelyTrustDangerousSnippet = function() {  
					return $sce.trustAsHtml($rootScope.schoolPojobyuser.school1);  
					};  
			}); 

    	//1.学校信息
//    	 onodeService.schoolpojobyuser({'noneid':12,'myUrl':'SchoolJson'}).success(function(data,status,headers,config){
//			 console.log("schoolpojobyuser pojo:"+data);
//			$scope.schoolPojobyuser = data;
//		});
//    	 console.log($scope.schoolPojobyuser);
    	//2.学校消息
		   onodeService.articleList({'noneid':12,'myUrl':'listJson'}).success(function(data,status,headers,config){
				 console.log("article list:"+data);
				 $rootScope.articleList = data;
				 $scope.articleList[0].content=$scope.articleList[0].content.replace(/&quot;/g,"\"");
					//angularJS嵌入html代码(controller中必须注入$sec对象)
					$scope.deliberatelyTrustDangerousSnippet = function() {  
						return $sce.trustAsHtml($scope.articleList[0].content);  
						};	


			});
    	//3.论坛列表
  	onodeService.motifList({'noneid':6,'myUrl':'listJson'}).success(function(data,status,headers,config){
		 console.log("motifList list:"+data);
		$rootScope.motifList = data;
		console.log($scope.motifList[0].name);
		$scope.motifList[0].content=$scope.motifList[0].content.replace(/&quot;/g,"\"");
		//angularJS嵌入html代码(controller中必须注入$sec对象)
		$scope.deliberatelyTrustDangerousSnippet = function() {  
			return $sce.trustAsHtml($scope.motifList[0].content);  
			};		
	});
                                      }]);		 
	//4.论坛内容
	 app.controller('LuntanController',['$rootScope','$scope','$location','onodeService','$window','$sce',
	                                      function($rootScope,$scope, $location, onodeService,$window,$sce){
  	console.log("加载成功");
  	$rootScope.loginVerify();
//  		 
  	$scope.replayShowFlag=false;
			//消息tetail
			   onodeService.motifIdPojo({'noneid':12,'myUrl':'listJson','pojo.id':$rootScope.selectIndex}).success(function(data,status,headers,config){
					 console.log("motifpojodetiapojo:"+data);
					$rootScope.motifpojodetial = data[0];
					console.log($scope.motifpojodetial.huiReplies);
					for(var i=0;i<$scope.motifpojodetial.huiReplies.length;i++){
						$scope.motifpojodetial.huiReplies[i].content=data[0].huiReplies[i].content.replace(/&quot;/g,"\"");
						console.log("^_^"+$scope.motifpojodetial.huiReplies[i].content);
					}
					//转换json中的html元素为字符串
					$scope.motifpojodetial.content=data[0].content.replace(/&quot;/g,"\"");
					
					//angularJS嵌入html代码(controller中必须注入$sec对象)
					$scope.deliberatelyTrustDangerousSnippet = function() {  
						console.log("hanshu调用");
						console.log("*_*"+$scope.motifpojodetial.content);
						return $sce.trustAsHtml($scope.motifpojodetial.content);  
						};
						//huiReplies

					$scope.deliberatelyTrustDangerousSnippets = function(index) {  
						return $sce.trustAsHtml($scope.motifpojodetial.huiReplies[index].content);  
						};
				});
		 //5. 论坛回复

			   $scope.replayShow=function(){
				   console.log("replayShow调用");
				   $scope.replayShowFlag=true;
			   };
			   
			   $scope.replayInster=function(){
				   var str1="<p>";
				   var str2="</p>";
				   console.log("inster…");
				   console.log("内容"+$scope.myContent);
				   onodeService.replayInster({
					   'noneid':12,'myUrl':'huidaoMotiflist','pojo.name':$scope.myReplay,'pojo.motif.id':$rootScope.motifpojodetial.id,
					   'pojo.yonghu.id':$rootScope.motifpojodetial.yonghu.id,'pojo.content':$scope.myContent})
					   .success(function(data,status,headers,config){
						   $location.path('/luntan');
							});
			   };
                                    }]);



app.controller('MeController',['$rootScope','$scope','$location','onodeService','$window',
                                      function($rootScope,$scope, $location, onodeService,$window){
    	console.log("加载成功");
    	$rootScope.loginVerify();
                                      	
                                      }]);
app.controller('LivingController',['$rootScope','$scope','$location','onodeService','$window',
                                      function($rootScope,$scope, $location, onodeService,$window){
    	console.log("加载成功");
    	$rootScope.loginVerify();
                                      }]);



