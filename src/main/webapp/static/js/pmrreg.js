$(document).ready(function(){
	
	
	
	var str = $("#pmrreg-form").serialize();
	console.log(str);
	
    $("#penalty-btn").on('click', (event) => {
		
		$("#type1").attr("name", "type");
		$("#task1").attr("name", "task");
		$("#type2").removeAttr("name");
		$("#type3").removeAttr("name");
		$("#task2").removeAttr("name");
		$("#task3").removeAttr("name");
		
		
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
				$("#type1").attr("name", "type1");
                $("#task1").attr("name", "task1");
                
                $("#type2").attr("name", "type2");
				$("#type3").attr("name", "type3");
				$("#task2").attr("name", "task2");
				$("#task3").attr("name", "task3");
		
                /*location.replace("main")*/
            })
            .fail((xhr, status, error) => {
                alert("등록 실패")
            })
    })
    
    $("#mission-btn").on('click', (event) => {
		$("#type2").attr("name", "type");
		$("#task2").attr("name", "task");
		
		$("#type1").removeAttr("name");
		$("#type3").removeAttr("name");
		$("#task1").removeAttr("name");
		$("#task3").removeAttr("name");
		
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
				$("#type2").attr("name", "type2");
                $("#task2").attr("name", "task2");
                
                $("#type1").attr("name", "type1");
				$("#type3").attr("name", "type3");
				$("#task1").attr("name", "task1");
				$("#task3").attr("name", "task3");
                
                /*location.replace("main")*/
            })
            .fail((xhr, status, error) => {
                alert("등록 실패")
                console.log(error)
            })
    })
    
    $("#reward-btn").on('click', (event) => {
		$("#type3").attr("name", "type");
		$("#task3").attr("name", "task");
		
		$("#type1").removeAttr("name");
		$("#type2").removeAttr("name");
		$("#task1").removeAttr("name");
		$("#task2").removeAttr("name");
		
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
				$("#type3").attr("name", "type3");
                $("#task3").attr("name", "task3");
                
                $("#type1").attr("name", "type1");
				$("#type2").attr("name", "type2");
				$("#task1").attr("name", "task1");
				$("#task2").attr("name", "task2");
                
                /*location.replace("main")*/
            })
            .fail((xhr, status, error) => {
                alert("등록 실패")
                console.log(error)
            })
    })
});

//
//$(() => {
//	function checkOnlyOne(element) {
//	  const checkboxes 
//	      = document.getElementsByName("match_id");
//	  
//	  checkboxes.forEach((cb) => {
//	    cb.checked = false;
//	  })
//	  
//	  element.checked = true;
//	}
//	
//	
//	console.log($("#pmrreg-form").serialize());
//    $("#penalty-btn").on('click', (event) => {
//		console.log($("#pmrreg-form").serialize());
//		console.log("1");
////		$("div").attr("class", "testClass");
//        event.preventDefault()
//        $.ajax({
//            url: "/api/action/pmrreg",
//            method: "POST",
//            data: $("#pmrreg-form").serialize(),
//            dataType: "text",
//            contentType: 'application/x-www-form-urlencoded'
//        })
//            .done(() => {
//                alert("등록 완료")
//                /*location.replace("main")*/
//            })
//            .fail((xhr, status, error) => {
//                alert("등록 실패")
//                console.log(error)
//            })
//    })
//    
//    $("#mission-btn").on('click', (event) => {
//		console.log($("#pmrreg-form").serialize());
//        event.preventDefault()
//        $.ajax({
//            url: "/api/action/pmrreg",
//            method: "POST",
//            data: $("#pmrreg-form").serialize(),
//            dataType: "text",
//            contentType: 'application/x-www-form-urlencoded'
//        })
//            .done(() => {
//                alert("등록 완료")
//                /*location.replace("main")*/
//            })
//            .fail((xhr, status, error) => {
//                alert("등록 실패")
//                console.log(error)
//            })
//    })
//    
//    $("#reward-btn").on('click', (event) => {
//		console.log($("#pmrreg-form").serialize());
//        event.preventDefault()
//        $.ajax({
//            url: "/api/action/pmrreg",
//            method: "POST",
//            data: $("#pmrreg-form").serialize(),
//            dataType: "text",
//            contentType: 'application/x-www-form-urlencoded'
//        })
//            .done(() => {
//                alert("등록 완료")
//                /*location.replace("main")*/
//            })
//            .fail((xhr, status, error) => {
//                alert("등록 실패")
//                console.log(error)
//            })
//    })
//})