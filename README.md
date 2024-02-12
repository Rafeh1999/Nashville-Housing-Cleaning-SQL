# Nashville-Housing-Cleaning-SQL
In my SQL project, I organized data into clean tables, making it easier to work with. I carefully sorted through information, ensuring accuracy and efficiency. This project showcases my ability to handle complex datasets and extract valuable insights using SQL.

the Following Steps I took inorder to Format and modify the data in the best possible way

# 1)Standardize Sales Date Format:
This query retrieves the SaleDate from the NashvilleHousing table and converts it to a standard date format.
Populate Property Address Data

# 2)Populate the missing Property Address by merging the with the ParcelID using JOIN Function:
we populate missing PropertyAddress entries by matching ParcelIDs and filling in the gaps.
Breaking out Address into Individual Columns (Address, City, State)

# 3)Create Tables and Split the Owner Address into Individual Columns:
we split the OwnerAddress entries into different columns (Address, city, and State) 

# 4)Updating the SoldAsVacant columns:
This query separates PropertyAddress into distinct Address, City, and State columns for easier analysis.
Change Y and N to Yes and No in "Sold as Vacant" Field.
It updates the "SoldAsVacant" field to replace 'Y' and 'N' with 'YES' and 'NO' for clarity.
