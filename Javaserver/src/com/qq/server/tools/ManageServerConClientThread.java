/*
 * ����ͻ��˵�Socket
 */
package com.qq.server.tools;

import java.util.*;

public class ManageServerConClientThread {
	
	public static HashMap hm = new HashMap<String, ServerConnectClientThread>();//���ɾ�̬��

	public static void addClientThread(ServerConnectClientThread sct, String uid){
		hm.put(uid, sct);
	}
	
	public static ServerConnectClientThread getClientThread(String uid){
		return (ServerConnectClientThread)hm.get(uid);
	}
	
	//�������ߺ��ѵ����
	public static String GetOnlineUserId(){
		String res = "";
		//ʹ�õ�����
		Iterator it = hm.keySet().iterator();
		while(it.hasNext()){
			res +=it.next().toString()+" ";
		}
		return res;
		
	}
}
