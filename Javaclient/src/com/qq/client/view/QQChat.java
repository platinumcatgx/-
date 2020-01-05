/*
 * 聊天的界面
 */
package com.qq.client.view;

import javax.activation.MailcapCommandMap;
import javax.swing.*;

import com.qq.client.model.*;
import com.qq.client.tools.ManageClientConServerThread;
import com.qq.common.Message;
import com.qq.common.MessageType;

import java.awt.*;
import java.awt.event.*;
import java.io.*;

public class QQChat extends JFrame implements ActionListener{

	JTextArea jta;
	JTextField jtf;
	JButton jb;
	JPanel jp;
	String ownerId, friend,sencry;
	
	//测试代码
//	public static void main(String[] args) {
//		QQChat qq = new QQChat("1","1");
//
//	}
	public QQChat(String ownerId, String friend){
		this.ownerId = ownerId;
		this.friend = friend;
		jta = new JTextArea();
		jtf = new JTextField(25);
		jb = new JButton("发送");
		jb.addActionListener(this);
		jp = new JPanel();
		jp.add(jtf);
		jp.add(jb);
		
		this.add(jta,"Center");
		this.add(jp,"South");
		this.setTitle(ownerId+"正在和"+friend+"聊天");
		this.setIconImage((new ImageIcon("企鹅.jpg").getImage()));
		this.setSize(400,400);
		this.setVisible(true);
		
		//启动服务
		
		
	}
	
	//显示消息
	public void showMessage(Message ms){
System.out.println("读取从服务器发来的消息"+ms.getSender()+"给"+ms.getGetter()+"说："+ms.getCon());
		//解密
//		QQEncryption qqe = new QQEncryption();
//		String plaintext= qqe.DESDecryption(ms.getCon());
		
		String info = ms.getSender()+"对"+ms.getGetter()+"说:"+ms.getCon()+"\r\n";
		this.jta.append(info);
	}
	
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource() == jb){
			//点击了发送按钮
			
			
			//进行加密操作
//			QQEncryption qqe = new QQEncryption();
//			sencry = qqe.DESEncryption(jtf.getText());

			Message ms = new Message();
			ms.setMesType(MessageType.message_common_message);
			ms.setSender(this.ownerId);
			ms.setGetter(this.friend);
			ms.setCon(sencry);
			ms.setSendTime(new java.util.Date().toString());//传入当前时间

			this.jta.append(ms.getCon());
			
			jtf.setText("");//处理发送数据后的框,使其为空。
			//发送，要拿到socket
			try {
				ObjectOutputStream oos = new ObjectOutputStream(ManageClientConServerThread.getManageClientThread(this.ownerId).getS().getOutputStream());
				oos.writeObject(ms);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		
	}
	
	
	
//	public void run() {
//		// TODO Auto-generated method stub
//		//开始读取
//		while(true){
//			try {
//				ObjectInputStream  ois = new ObjectInputStream(MyqqclientConnectServer.s.getInputStream());
//				Message ms = (Message)ois.readObject();
//				
//				//显示
//				String info = ms.getSender()+"对"+ms.getGetter()+"说:"+ms.getCon()+"\r\n";
//				this.jta.append(info);			
//				
//				
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} 
//			
//			
//		}
//	}

}
