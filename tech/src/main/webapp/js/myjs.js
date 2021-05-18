
	function doLike(pid,uid)
	{

	
		const d={
			
			uid:uid,
			pid:pid,
			operation:"status"
				}
				$.ajax({
					
					url:"LikeServlet",
					data:d,
					success: function(result)
					{
						
						$("#like-btn-"+pid).toggleClass("liked");
							
							$("#post"+pid).text(" "+result);
							$(".post"+pid).text(" "+result);
							
						
						
					}
					
				})
					
		
	}

	function likePost(pid,uid)
	{
			console.log(pid +","+uid)
			const d={
					uid:uid,
					pid:pid,
					operation:'like'
			}
			$.ajax({
				url:"LikeServlet",
				data:d,
				success: function (data , textStatus , jqXHR)
				{
				
					console.log(data);
					
					
				},
				error: function (jqXHR, textStaus, errorThrown){
					console.log(data);
					
				
				}
				
				
			
			})
	}
	
	