<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!//선언부는 첫 방문자에 의해서 단 한번 수행합니다. 
	Connection conn = null;
    PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "kosea2";
	String pass = "kosea2020a";
	
	String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?)";
	%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String userid=request.getParameter("userid");
String pwd=request.getParameter("pwd");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String admin=request.getParameter("admin");

try{
	//1단계 JDBC 드라이버로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//2단계 데이터베이스 연결 객체인 Connection생성
	conn=DriverManager.getConnection(url,uid,pass);
	//3단계 PreparedStatement 객체 생성하기
	pstmt=conn.prepareStatement(sql);
	//4단계 바인딩 변수
	pstmt.setString(1,name);
	pstmt.setString(2,name);
	pstmt.setString(3,name);
	pstmt.setString(4,name);
	pstmt.setString(5,name);
	pstmt.setInt(6,Integer.parseInt(admin));
    //5단계 SQL문 실행하여 결과 처리
    pstmt.executeUpdate();
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	//6단계 사용한 리소스 해제
	try{
		
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
    }
}

%>
<h3>회원 가입 성공</h3>
<a href="01_allMember.jsp">회원 전체목록 보기</a>
</body>
</html>