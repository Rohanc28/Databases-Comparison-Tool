# Databases-Comparison-Tool
  Database Comparison Tool which can be able to fetch data from multiple databases and compare entries on a given condition basis.
  
 ## Functionalities – 

- It can connect to two databases initially.
- It should have an option to choose the table name for comparison.
- It should have option to choose the column for comparison (Optional)
- It can provide matched records, unmatched records both.
- Ability to search in result set on UI
- Ability to download result set into file and save locally.


## Technologies used – 

- HTML/CSS for UI develop (TODO: use React js)
- JavaScript for UI responsiveness and event handling
- Node.js or Spring Java for backend development
- Oracle DB for database

## Codepen Demo Pages 
- [x] [Home](https://codepen.io/Ridevrutahc/pen/BaqjexW) 
- [x] [DBConnect](https://codepen.io/Ridevrutahc/pen/poxgGxV)
- [x] [ServerConnect](https://codepen.io/Ridevrutahc/pen/vYVGmyo)
- [x] [TableView](https://codepen.io/Ridevrutahc/pen/OJBNzeL)

## Recent: 
- Added both table renderview, added support for csv, xlsx in both.
- ui to show both files parallely when uploaded in med-large res and stay responsive for small screen as well.
- added split connection forms to /ServerConnect with button spinners if respective form if fully filled.
- working on double server connection with individual sql query classes. retrurning and rendering data from db to the frontend.
- working on frontend formdata control js for form validation for either and both forms, then submit "POST" to next url with data.
- db conn ok, table render ok, working on toolbar for table comparison + ops 
