/**
 *Tab切换
 * */
/*$(".left-list li").click(function () {
    if (!$(this).hasClass("left-active")) {
        $(this).addClass("left-active");
    }
    console.log($(this));
    $(this).siblings().removeClass("left-active");
    var $index = $(this).index();
    if (!$(".items").eq($index).hasClass("show")) {
        $(".items").eq($index).addClass("show");
    }
    $(".items").eq($index).siblings().removeClass("show");
});*/

/**
 * 删除的提示框
 * */
/*$(".delete").click(function () {
    systemConfirm("确认删除该记录?");
})*/

/**
 * 分页效果
 * */
const pageNum = 2;
pageData = {
    totalData: 100,
    pageCapacity: 10
};
$(".pagination").pagination({
    currentPage: pageNum,   // 当前页
    totalPage: Math.ceil(pageData.totalData / pageData.pageCapacity), //总页数
    isShow: true, //是否显示
    //count: 5, // 每次显示的页码数
    //items_per_page:10,
    homePageText: "首页",
    endPageText: "尾页",
    prevPageText: "上一页",
    nextPageText: "下一页",
    // callback: function (current) { //当点击之后的回调函数，current为当前页码
    //     pageData.tempPage = current;
    //     getSoloScore(current);
    // }
});



