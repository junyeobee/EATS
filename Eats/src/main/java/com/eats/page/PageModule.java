package com.eats.page;

public class PageModule {
	
	public static String makePage(String pageName, int totalCnt, int listSize, int pageSize, int cp, String findkey, String findValue) {
		
		StringBuffer sb = new StringBuffer();
		
		int totalPage = (totalCnt/listSize)+1;
		if(totalCnt % listSize == 0) totalPage--;
		int userGroup = cp / pageSize;
		if(cp % pageSize == 0) userGroup--;
		
		if(userGroup != 0){
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			
			int temp=(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			//if(findkey!=null)sb.append("&findkey="+findkey);
			//if(findValue!=null)sb.append("&findValue="+findValue);
			//sb.append("'>&lt;&lt;</a>");
			sb.append("'>◀</a>");
			
			//"<a href='test.jsp?cp=5'></a>"
		}

		for(int i = userGroup*pageSize+1; i <= userGroup*pageSize+pageSize; i++){
			
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			//if(findkey!=null)sb.append("&findkey="+findkey);
			//if(findValue!=null)sb.append("&findValue="+findValue);
			sb.append("'>");
			

			if(cp == i) {
				sb.append("<span class='paging_check'>");
			}else {
				sb.append("<span>");
			}
			sb.append(i);
			sb.append("</span>");
			//sb.append(i);
			
			
			sb.append("</a>&nbsp;&nbsp");

			if(i == totalPage){
				break;
			}
		}
		if(userGroup!=(totalPage/pageSize-(totalPage % pageSize == 0?1:0))){
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			
			int temp=(userGroup+1)*pageSize+1;
			sb.append(temp);
			//if(findkey!=null)sb.append("&findkey="+findkey);
			//if(findValue!=null)sb.append("&findValue="+findValue);
			//sb.append("'>&gt;&gt;</a>");
			sb.append("'>▶</a>");
		}
		return sb.toString();
	}
}


