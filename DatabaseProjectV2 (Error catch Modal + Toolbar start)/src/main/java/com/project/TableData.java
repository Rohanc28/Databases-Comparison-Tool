package com.project;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TableData {
	private static TableData instance;
	private List<List<List<String>>> objectData;
	
	private TableData() {
		//private constructor
	}
	
	public static TableData getInstance() {
        if (instance == null) {
            synchronized (TableData.class) {
                if (instance == null) {
                    instance = new TableData();
                    instance.objectData = new ArrayList<>();
                }
            }
        }
        return instance;
    }

    public boolean isEmpty() {
        return objectData.isEmpty();
    }

    public List<List<List<String>>> getObjectData() {
        return objectData;
    }
    public void setData(List<List<List<String>>> data) {
        if (isEmpty()) {
            objectData.addAll(data);
        }
    }
 
    public static void clearInstance() {
        instance = null;
    }
    
}
