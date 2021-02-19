package cn.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import cn.controller.BaseAction;

import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
@Controller("uploadAction")
public class UploadAction extends BaseAction
{
	private static final int BUFFER_SIZE = 16 * 1024;
	private File fujian;
	private String fujianFileName;
	private String fujianContentType;
	
	
	public String upload() throws IOException
	{
		String realPath = ServletActionContext.getServletContext().getRealPath("upload");
		//检查目录是否存在
		SimpleDateFormat sdym=new SimpleDateFormat("yyyyMM");
		String ym=sdym.format(new Date());
		File filem=new File(realPath+"\\"+ym);
		if(!filem.exists()){
			filem.mkdir();//不存在就创建目录
		}
		SimpleDateFormat sdfd=new SimpleDateFormat("dd");
		String d=sdfd.format(new Date());
		File filed=new File(realPath+"\\"+ym+"\\"+d);
		if(!filed.exists()){
			filed.mkdir();//不存在就创建目录
		}
		String newFujianName=Const.getFileId()+fujianFileName.substring(fujianFileName.indexOf("."));
		File dstFile = new File(realPath+"\\"+ym+"\\"+d+"\\"+newFujianName);
		copy(this.getFujian(),dstFile);
		PrintWriter out=response.getWriter();
		out.print(ym+"/"+d+"/"+newFujianName);
		out.close();
		return null;

	}
	
	
	private static void copy(File src, File dst) 
    {
        InputStream in = null;
        OutputStream out = null;
        try 
        {
            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
            out = new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
            byte[] buffer = new byte[BUFFER_SIZE];
            int len = 0;
            while ((len = in.read(buffer)) > 0) 
            {
                out.write(buffer, 0, len);
            }
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        } 
        finally
        {
            if (null != in) 
            {
                try 
                {
                    in.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
            if (null != out) 
            {
                try 
                {
                    out.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
        }
    }


	public File getFujian()
	{
		return fujian;
	}


	public void setFujian(File fujian)
	{
		this.fujian = fujian;
	}


	public String getFujianContentType()
	{
		return fujianContentType;
	}


	public void setFujianContentType(String fujianContentType)
	{
		this.fujianContentType = fujianContentType;
	}


	public String getFujianFileName()
	{
		return fujianFileName;
	}


	public void setFujianFileName(String fujianFileName)
	{
		this.fujianFileName = fujianFileName;
	}

}
