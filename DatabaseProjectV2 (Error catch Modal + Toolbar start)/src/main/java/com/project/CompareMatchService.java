package com.project;

import java.util.ArrayList;
import java.util.List;

public class CompareMatchService {
	public List<List<String>> compareTables(List<List<List<String>>> tables) {
        // Perform the comparison logic here
        // For simplicity, let's assume we only compare the first two tables in the list

        List<List<String>> table1 = tables.get(0);
        List<List<String>> table2 = tables.get(1);

        List<List<String>> matchingRows = new ArrayList<>();

        for (List<String> row1 : table1) {
            for (List<String> row2 : table2) {
                if (compareRows(row1, row2)) {
                    matchingRows.add(row1);
                    break;
                }
            }
        }
        //can be improved with less space by using table(0) or table(1)
        //and simply remove a row incase they dont match with row in other table.
        //using this naive method for currently for readability and debuging

        return matchingRows;
    }
	private boolean compareRows(List<String> row1, List<String> row2) {
        // Compare the cells in the rows here
        // For simplicity, let's assume the rows match if all cells match (case-insensitive)

        if (row1.size() != row2.size()) {
            return false;
        }

        for (int i = 0; i < row1.size(); i++) {
            String cell1 = row1.get(i);
            String cell2 = row2.get(i);

            if (!cell1.equalsIgnoreCase(cell2)) {
                return false;
            }
        }

        return true;
    }
}
