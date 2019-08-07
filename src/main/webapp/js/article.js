/**
 * 点赞这个ariticle
 * @param article_id
 */
function love_article(article_id) {
    $.ajax({
        type: "get",
        url: "articles/star?id=" + article_id,
        dataType: "json",
        async: true,
        success: function (data) {
            document.getElementById("love").innerHTML = "&nbsp;" + data.star + "&nbsp;";
        }
    });
}

/**
 * 添加评论
 */
$("#btn").click(function () {
    $.ajax({
        type: "post",
        url: "comments/addComment",
        data: $("#form").serialize(),
        dataType: "json",
        async: true,
        success: function (data) {
            var k;
            var value;
            for (var key in data) {   //key    data[key]
                k = key;
                value = data[key];
            }
            if (k == 1) {
                window.location.reload();
            } else {
                layer.msg(value, {
                    icon: 5,
                    time: 2000,
                });
            }
        },
    });
})

/**
 * 删除评论
 * @param cId
 */
function deletecm(cId) {
    $.ajax({
        type: "get",
        url: "comments/del?id=" + cId,
        dataType: "json",
        async: true,
        success: function (data) {
            var k;
            var value;
            for (var key in data) {   //key    data[key]
                k = key;
                value = data[key];
            }
            if (k == 1) {
                window.location.reload();
            } else {
                layer.msg(value, {
                    icon: 5,
                    time: 2000,
                });
            }
        }
    })

}







