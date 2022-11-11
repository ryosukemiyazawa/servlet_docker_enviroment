import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
public class dbtest {
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
 
        try {
            // データベース接続
            conn = DriverManager.getConnection(
                    // ホスト名、データベース名
                    "jdbc:mysql://mysql:3306/study",
                    // ユーザー名
                    "system",
                    // パスワード
                    "system");
 
            // SQL文をセット
            stmt = conn.prepareStatement("show columns from customer_info");
            // SQL文を実行
            rs = stmt.executeQuery();
 
            // ループして1レコードずつ取得
            while (rs.next()) {
				String field = rs.getString("Field");
				String type = rs.getString("Type");
                System.out.println(field + " " + type);
            }
 
        } catch (SQLException e) {
			e.printStackTrace();
            System.out.println("データベース接続エラー。");
 
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println("データベース接続エラー。");
            }
        }
    }
}