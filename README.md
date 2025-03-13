
![walmart-coding-task-01](https://github.com/user-attachments/assets/e2c8332d-8978-4150-a449-287c5d98bc29)

# iOS programming exercise.

1. Fetch a list of countries in JSON format from this URL: https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json 2.

2. Display all the countries in a UITableView ordered by the position they appear in the JSON. In each table cell, show the country's "name", "region", "code" and "capital" in this format:


<img width="309" alt="Screenshot 2025-03-13 at 8 42 26 AM" src="https://github.com/user-attachments/assets/058f72d4-93e5-4d13-b990-3bded86510b2" />

For exampple:   

<img width="310" alt="Screenshot 2025-03-13 at 8 42 30 AM" src="https://github.com/user-attachments/assets/713e36f6-fa57-478e-9833-5707c2586390" />


3. The user should be able to scroll thru the entire list of countries. 3. Use a UISearchController to enable filtering by "name" or "capital" as the user types each character of their search. The implementation should be robust (i.e., handle errors and edge cases), support Dynamic Type, support iPhone and iPad, and support device rotation. Please use UIKit, not SwiftUI, for this exercise. Limit the time you work on this exercise. We don't expect you to finish. The goal is to write high-quality code for the portion you choose to implement, not the number of features implemented. It's okay to use Google, Stack Overflow, ChatGPT, etc. for help, but be forewarned that we expect candidates to have a *solid* understanding of Swift and UIKit, so if you find yourself requiring much assistance, you are likely not a good fit for our position and will not make it thru our live debugging, coding, and architecture interview process that follows this exercise. 

# Solution:

- MVVM Architecture
- Data driven UI
- Unit Tests
