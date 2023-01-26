$(() => {
    $("#pmrreg-btn").on('click', (event) => {
        event.preventDefault()
        $.ajax({
            url: "/api/action/pmrreg",
            method: "POST",
            data: $("#pmrreg-form").serialize(),
            dataType: "text",
            contentType: 'application/x-www-form-urlencoded'
        })
            .done(() => {
                alert("등록 완료")
                /*location.replace("main")*/
            })
            .fail((xhr, status, error) => {
                alert("등록 실패")
                console.log(error)
            })
    })
})