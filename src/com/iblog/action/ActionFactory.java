package com.iblog.action;

public class ActionFactory {
	public static Action getAction(String actionClass){
		Action action = null;
		try{
			action =  (Action) Class.forName(actionClass).newInstance();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return action;
	}
}
