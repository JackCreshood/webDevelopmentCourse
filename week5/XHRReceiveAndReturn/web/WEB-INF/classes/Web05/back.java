package Web05;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class back extends HttpServlet{
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String path=request.getSession().getServletContext().getRealPath("/");//获取绝对路径，在ROOT下
        FileReader fr=new FileReader(path+"maintain_order.json");
        BufferedReader br = new BufferedReader(fr);		//使文件可按行读取并具有缓冲功能
        String jsonString="";				//总的要返回的字符串
        String str;					//临时的字符串，读取一行
        while((str = br.readLine()) != null){
            jsonString=jsonString+str;
        }
        br.close();		//注意关闭缓冲
        fr.close();		//注意关闭文件句柄

        PrintWriter pw;
        pw = response.getWriter();
        pw.print(jsonString);
        pw.flush();
        pw.close();
    }
}