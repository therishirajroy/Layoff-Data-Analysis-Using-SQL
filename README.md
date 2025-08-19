# Layoff Data Analysis Using SQL

## Overview  
This project is an adaptation of the excellent MySQL-based SQL tutorial created by **Alex The Analyst**, originally featured in the YouTube video *“Learn SQL Beginner to Advanced in Under 4 Hours”* ([Watch Here](https://www.youtube.com/watch?v=OT1RErkfLNQ)). Leveraging his content, I've translated and enhanced the SQL scripts for compatibility with **Microsoft SQL Server**, adapting MySQL-specific syntax and techniques as needed.

---

## Contents  
- **SQL Server Scripts** (`.sql` files)  
  Modified versions of Alex’s original MySQL scripts, fully functional in SQL Server (T-SQL).

- **Mapping Document** (`README.md` or `CHANGELOG.md`)  
  Highlights key syntax changes, such as:  
  - MySQL `LIMIT` → SQL Server `TOP` or `OFFSET…FETCH`  
  - Backtick-quoted identifiers → SQL Server bracketed identifiers  
  - MySQL date/time functions → T-SQL equivalents (e.g., `NOW()` → `GETDATE()`)

- **Sample Data Files** (if included)  
  Test datasets adapted for SQL Server import (if applicable).

- **Usage Instructions**  
  Step-by-step guidance to run the project on SQL Server, including prerequisites, execution commands, and environment setup.

---

## Purpose & Motivation  
This adaptation helps users familiar with Alex The Analyst’s MySQL examples by providing a **SQL Server–compatible version**—ideal for students, professionals, or enthusiasts who prefer or require Microsoft’s SQL dialect. It’s a learning bridge between MySQL and SQL Server, highlighting practical differences and smooth conversions.

---

## Acknowledgments  
A big thank-you to **Alex The Analyst (Alex Freberg)** for crafting such a comprehensive MySQL tutorial that inspired and powered this adaptation.  
👉 [YouTube Channel](https://www.youtube.com/@AlexTheAnalyst)  

---

## How to Use This Repository  

1. **Clone / Download**  
   ```bash
   git clone https://github.com/therishirajroy/Layoff-Data-Analysis-Using-SQL.git
   cd Layoff-Data-Analysis-Using-SQL
   ```
2. **Review the Mapping Document**
   Check the included README or CHANGELOG for syntax adjustments and transformation notes.
3. **Set Up the Environment**
   - Ensure you have SQL Server installed (or SQL Server Express).
   - Launch SQL Server Management Studio (SSMS) or your IDE of choice.
4. **Run the Scripts**
    - Load data if necessary (via BULK INSERT or bcp).
    - Execute the SQL scripts, starting with schema creation followed by queries.
5. **Explore & Compare**
   - Experiment with the scripts.
   - Refer to the mapping document to see how MySQL constructs translate to SQL Server.

---

## Additional Resources
- [Original Tutorial – Learn SQL Beginner to Advanced in Under 4 Hours](https://www.youtube.com/watch?v=OT1RErkfLNQ&ab_channel=AlexTheAnalyst)
- [Alex The Analyst’s GitHub – MySQL YouTube Series](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series)

---

## Contact & Contributions
Feel free to open issues or submit pull requests if you spot inaccuracies or have suggestions for further improvements.
Thanks again to Alex The Analyst for laying the foundation with his MySQL series—this SQL Server adaptation aims to extend that knowledge to a new audience.

Happy querying! 🎉
