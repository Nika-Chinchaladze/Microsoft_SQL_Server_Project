SELECT
	ProductName,
	Price,
	CategoryID,
	CHOOSE(CategoryID, 
					'FIRST', 
					'SECOND', 
					'THIRD', 
					'FOURTH', 
					'FIFTH', 
					'SIXTH', 
					'SEVENTH', 
					'EIGHTH'
		   ) AS Chosen_Category
FROM Products;