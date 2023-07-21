<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>접근 거부</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            text-align: center;
        }

        h1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <h1>접근이 거부되었습니다</h1>
    <p>죄송합니다, 해당 페이지에 접근할 권한이 없습니다.</p>
    <!-- login.jsp로 href를 걸어두면 로그인한 ID의 권한에 맞는 페이지로 이동함 -->
    <p><a href="logout.jsp">로그인 페이지로 이동</a></p>
</body>
</html>
