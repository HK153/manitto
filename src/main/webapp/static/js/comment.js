$(() => {
    $("#comment-btn").on('click', (event) => {
        event.preventDefault()
        $.ajax({
            url: "/api/comment/create",
            method: "POST",
            data: $("#comment-form").serialize(),
            dataType: "text",
            contentType: 'application/x-www-form-urlencoded'
        })
            .done(() => {
                /*alert("등록 완료"+ $("#content").val())*/
                /*location.replace("")*/
                $("#commentlist").append("<br>" +$("#writer").val() + " : " + $("#content").val())
            })
            .fail((xhr, status, error) => {
                alert("등록 실패" + $("#comment-form").serialize())
                console.log(error)
            })
    })
})