//중복확인
app.get('/idCheck:user_ID', function(req, res){
	var idCheckSQL = 'SELECT * FROM User WHERE user_id = ?';
	console.log('params user id = ' + req.params.user_ID);
	conn.query(idCheckSQL, req.params.user_ID, function(err, rows, fields){
		if(err){
			console.log(err);
		}
		else{
			//검색 결과 check하려는 ID가 있으면 msg = 1, 없으면 msg = 0;
			var msg = 0;
			if(rows.length){
				msg = 1;
			}
			else{
				msg = 0;
			}
			
			res.getWriter().write(msg+"");
		}
	});
});
/**
 * 
 */