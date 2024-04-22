package com.smhrd.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FollowDAO {

    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String USERNAME = "mini";
    private static final String PASSWORD = "smhrd2";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    public void insertFollow(Follow follow) {
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO follow (my_id, follow_id) VALUES (?, ?)")) {

            pstmt.setString(1, follow.getMy_id());
            pstmt.setString(2, follow.getFollow_id());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("JDBC 드라이버를 로드하였습니다.");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버를 찾을 수 없습니다.");
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
            System.out.println("오라클 데이터베이스에 연결되었습니다.");
        } catch (SQLException e) {
            System.out.println("오라클 데이터베이스 연결 실패");
            e.printStackTrace();
        }
    }
}
