package com.project;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ToolBarComparator {
    public static void compareLists(List<List<String>> table, List<List<String>> tables) {
        if (table == null || table.isEmpty() || tables == null || tables.isEmpty()) {
            System.out.println("One or both of the lists are empty or null.");
            return;
        }

        Set<List<String>> commonElements = new HashSet<>();
        int totalRecords = 0;
        int matchingRecords = 0;

        for (List<String> subList1 : table) {
            if (subList1 == null || subList1.isEmpty()) {
                continue;
            }

            boolean isMatching = false;
            for (List<String> subList2 : tables) {
                if (subList2 != null && !subList2.isEmpty() && subList1.equals(subList2)) {
                    commonElements.add(subList1);
                    matchingRecords += subList1.size();
                    isMatching = true;
                    break;
                }
            }

            if (isMatching) {
                totalRecords += subList1.size();
            }
        }

        if (commonElements.isEmpty()) {
            System.out.println("No matching values found.");
            return;
        }

        System.out.println("Matching Values:");
        for (List<String> element : commonElements) {
            System.out.println(element);
        }

        double matchingPercentage = (double) matchingRecords / totalRecords * 100;
        System.out.println("Matching Percentage: " + matchingPercentage + "%");
    }

    public static void findUniqueValues(List<List<String>> table, List<List<String>> tables) {
        if (table == null && tables == null) {
            System.out.println("Both lists are null.");
            return;
        }

        Set<List<String>> uniqueValues = new HashSet<>();

        if (table != null) {
            for (List<String> subList : table) {
                if (subList != null && !subList.isEmpty()) {
                    uniqueValues.add(subList);
                }
            }
        }

        if (tables != null) {
            for (List<String> subList : tables) {
                if (subList != null && !subList.isEmpty()) {
                    uniqueValues.add(subList);
                }
            }
        }

        if (uniqueValues.isEmpty()) {
            System.out.println("No unique values found.");
            return;
        }

        System.out.println("Unique Values:");
        for (List<String> element : uniqueValues) {
            System.out.println(element);
        }
    }

    
//	public static void main(String[] args) {
//        List<List<Integer>> table = new ArrayList<>();
//        table.add(List.of(1, 2, 3));
//        table.add(List.of(4, 5));
//        table.add(List.of(6));
//
//        List<List<Integer>> tables = new ArrayList<>();
//        tables.add(List.of(1, 2, 3));
//        tables.add(List.of(7, 8));
//
//        compareLists(table, tables);
//        System.out.println();
//        findUniqueValues(table, tables);
//    }
}
