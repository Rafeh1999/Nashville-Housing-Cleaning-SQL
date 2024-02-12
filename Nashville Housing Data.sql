---cleaning data in SQL---

select*
From Nashvill

----standardize Date form---

select SaleDateConverted, CONVERT(date,SaleDate)
From Nashvill

UPDATE Nashvill
Set SaleDate = CONVERT(date,SaleDate)

ALTER TABLE Nashvill
Add SaleDateConverted Date;

UPDATE Nashvill
Set SaleDateConverted = CONVERT(date,SaleDate)

---- populate property address data-----

SELECT*
FROM Nashvill
Where Propertyaddress is NULL
ORDER by ParcelID

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.propertyAddress)
FROM Nashvill a
JOIN Nashvill b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is NULL

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.propertyAddress)
FROM Nashvill a
JOIN Nashvill b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is NULL

----Breaking out address into individual colums (Address,city,state)---

select propertyaddress
from Nashvill
--Where PropertyAddress is null
--order by ParcelID


SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address
FROM Nashvill

ALTER TABLE Nashvill
Add Propertysplitaddress NVARCHAR(255);

UPDATE Nashvill
Set Propertysplitaddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) 

ALTER TABLE Nashvill
Add Propertysplitcity NVARCHAR(255);

UPDATE Nashvill
Set Propertysplitcity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))

select*
FROM Nashvill




Select OwnerAddress
From Nashvill


Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
From Nashvill

ALTER TABLE Nashvill
Add ownersplitaddress NVARCHAR(255);

UPDATE Nashvill
Set ownersplitaddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)

ALTER TABLE Nashvill
Add ownersplitcity NVARCHAR(255);

UPDATE Nashvill
Set ownersplitcity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)

ALTER TABLE Nashvill
Add ownersplitstate NVARCHAR(255);

UPDATE Nashvill
Set ownersplitstate = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)

select*
from Nashvill


---- change Y and N in 'SOLD AS VACANT'-------

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From Nashvill
Group by SoldAsVacant
order by 2

Select Soldasvacant
, CASE WHEN soldasvacant = 'Y' THEn 'YES'
	  WHEN soldasvacant = 'N' THEN 'NO'
	  ELSE soldasvacant
	  END
from Nashvill

UPDATE Nashvill
SET SoldAsVacant = CASE WHEN soldasvacant = 'Y' THEn 'YES'
	  WHEN soldasvacant = 'N' THEN 'NO'
	  ELSE soldasvacant
	  END


------REMOVE DUPLICATE------------------


