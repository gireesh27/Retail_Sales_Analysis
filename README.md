# Global Retail Sales Analysis
Global store retail sales analytics using SQL, Claude AI and Power BI


## Overview
In order to analyze the global sales of a retail chain of office and stationery items, an interactive report was created in Power BI.\
SQL queries were performed to answer specific questions about the last semester. In addition to the creation of the tables, Claude AI was used to support the discovery of insights and analysis of the queries.


## Technologies Used
- SQL
- Power BI
- Power Query
- DAX
- Claude AI


## Interactive Report (Power BI)
Aspects of interest:
- Monthly financial metrics and KPI's
- Market Analysis
- Analysis by Region
- Analysis of Returned Products
- Clusters of regions and categories

https://app.powerbi.com/view?r=eyJrIjoiYWUwMDVjM2EtZmNmYy00YjNhLWE5ZmMtODNjZmI0N2UxZjliIiwidCI6IjZmMDM0OGYyLWU0OTgtNDVjOS04NGY0LWM2ZDgxZGNmZmRmZSIsImMiOjR9

[<img src="https://github.com/user-attachments/assets/2195aa2f-3555-40fb-89b2-5db0fd262fbf">](https://app.powerbi.com/view?r=eyJrIjoiYWUwMDVjM2EtZmNmYy00YjNhLWE5ZmMtODNjZmI0N2UxZjliIiwidCI6IjZmMDM0OGYyLWU0OTgtNDVjOS04NGY0LWM2ZDgxZGNmZmRmZSIsImMiOjR9)


## Analysis
Specific SQL queries were performed to answer the following questions about the last semester:
- Which products have the best profit margin by subcategory?
- Which are the customers that spends the most for each business segment?
- Are the top products by sales the same as the top products by profit?
- Are the top cities by sales the same as the top cities by profit?

In addition to the creation of the tables, Claude AI was used to support the discovery of insights and analysis of the queries.


### Which products have the best profit margin by subcategory?
The following table shows the products with the best profit margins by subcategory.

|category       |subcategory|id_product |product                                                                              |profit_margin|
|---------------|-----------|-----------|-------------------------------------------------------------------------------------|-------------|
|Furniture      |Bookcases  |FUR-BO-5780|Safco Floating Shelf Set, Traditional                                                |41.21        |
|Furniture      |Chairs     |FUR-CH-5803|SAFCO Steel Folding Chair, Set of Two                                                |41.94        |
|Furniture      |Furnishings|FUR-FU-3953|Deflect-O Photo Frame, Erganomic                                                     |48.99        |
|Furniture      |Tables     |FUR-TA-3421|Bevis Conference Table, Rectangular                                                  |48.00        |
|Office Supplies|Appliances |OFF-AP-4748|Hoover Toaster, Silver                                                               |45.97        |
|Office Supplies|Art        |OFF-AR-5633|Prang Dustless Chalk Sticks                                                          |50.00        |
|Office Supplies|Binders    |OFF-BI-3326|Avery Triangle Shaped Sheet Lifters, Black, 2/Pack                                   |50.00        |
|Office Supplies|Envelopes  |OFF-EN-6359|White Business Envelopes with Contemporary Seam, Recycled White Business Envelopes   |50.00        |
|Office Supplies|Fasteners  |OFF-FA-5459|OIC Binder Clips                                                                     |50.00        |
|Office Supplies|Labels     |OFF-LA-3193|Avery 475                                                                            |50.00        |
|Office Supplies|Paper      |OFF-PA-3012|Adams Telephone Message Book w/Frequently-Called Numbers Space, 400 Messages per Book|50.00        |
|Office Supplies|Paper      |OFF-PA-6308|Tops Green Bar Computer Printout Paper                                               |50.00        |
|Office Supplies|Paper      |OFF-PA-6440|Xerox 1890                                                                           |50.00        |
|Office Supplies|Storage    |OFF-ST-4062|Eldon Folders, Single Width                                                          |46.91        |
|Office Supplies|Supplies   |OFF-SU-4127|Elite Scissors, Easy Grip                                                            |45.96        |
|Technology     |Accessories|TEC-AC-3389|Belkin Memory Card, Erganomic                                                        |50.00        |
|Technology     |Copiers    |TEC-CO-4770|HP Fax and Copier, Digital                                                           |46.98        |
|Technology     |Machines   |TEC-MA-4594|Hewlett-Packard 300S Scientific Calculator                                           |46.00        |
|Technology     |Phones     |TEC-PH-5825|Samsung Headset, Full Size                                                           |49.98        |

Note that in the Office Supplies category, several subcategories have products with a 50% profit margin, which is the highest in the dataset.


### Which are the customers that spends the most for each business segment?
The following table shows the customers that spends the most for each business segment.

|segment    |sales_rank|id_customer |customer         |country      |sales|
|-----------|----------|------------|-----------------|-------------|-----|
|Consumer   |1         |HL-150401406|Hunter Lopez     |United States|10523|
|Consumer   |2         |SV-203651406|Seth Vernon      |United States|8299 |
|Consumer   |3         |DL-133158   |Delfina Latchford|Austria      |7384 |
|Consumer   |4         |HG-1484545  |Harry Greene     |France       |6286 |
|Consumer   |5         |LT-7110117  |Liz Thompson     |South Africa |6098 |
|Corporate  |1         |VG-2180558  |Vivek Grady      |India        |9032 |
|Corporate  |2         |GT-146351408|Grant Thornton   |United States|8167 |
|Corporate  |3         |PJ-1883564  |Patrick Jones    |Italy        |7959 |
|Corporate  |4         |TS-213701406|Todd Sumrall     |United States|6492 |
|Corporate  |5         |CP-1234058  |Christine Phan   |India        |5614 |
|Home Office|1         |TA-213851406|Tom Ashbrook     |United States|13716|
|Home Office|2         |BF-1100558  |Barry Franz      |India        |9287 |
|Home Office|3         |PO-919586   |Phillina Ober    |Morocco      |7065 |
|Home Office|4         |EH-1412545  |Eugene Hildebrand|France       |5697 |
|Home Office|5         |BE-1133527  |Bill Eplett      |China        |4913 |

Regarding the customers that spends the most for each business segment, the following was found:
- The United States appears most frequently (5 times), besides the fact that the US has top consumers in all three segments, indicating it's a significant market.
- India appears three times, all in different segments, suggesting strong performance across segments in this market.
- The highest overall sales come from the Home Office segment, with Tom Ashbrook (US) at $13,716. However, Home Office has the highest top sale ($13,716) and the lowest top 5 sale ($4,913).


### Are the top products by sales the same as the top products by profit?
With regard to the question of whether the best-selling products are the ones that generate the most profits according to each category, the following was found:
- The Office Supplies category shows the highest similarity between top products by sales and profit, with 2 out of 3 products being identical.
- The Technology category also shows high similarity, with all three products appearing in both lists, albeit in different orders.
- The Furniture category shows no overlap between top products by sales and profit, indicating that the products with the highest sales are not necessarily the most profitable in this category.

In conclusion, the top products by sales are partially the same as the top products by profit, with the degree of similarity varying by category. The Technology and Office Supplies categories show significant overlap, while the Furniture category shows no overlap at all. This suggests that in some categories (like Technology and Office Supplies), high sales volume often correlates with high profitability, while in others (like Furniture), there might be factors such as higher margins on certain items that don't necessarily have the highest sales volumes.


### Are the top cities by sales the same as the top cities by profit?
In relation to the question of whether the cities that generate the most sales are the same as those that generate the most profits according to each market, the following was found:
- The USCA market shows the highest similarity, with 2 out of 3 cities appearing in both lists.
- Africa also shows significant overlap, with 2 out of 3 cities in both lists.
- Europe and LATAM each have one city appearing in both lists.
- Asia Pacific shows no overlap between the top cities by sales and profit.

Overall, the top cities by sales are partially the same as the top cities by profit, but there are significant differences:
- Only 6 out of 15 cities (40%) appear in both lists across all markets.
- New York City is the top city for both sales and profit in the USCA market.
- Managua (Nicaragua) is the top city for both sales and profit in the LATAM market.
- The order of cities often differs between sales and profit rankings, even when they appear in both lists.
- The Asia Pacific market shows the most disparity, with completely different cities in the sales and profit lists.

These differences suggest that high sales volume doesn't always translate directly to high profits. Factors such as costs, pricing strategies, and product mix likely play significant roles in determining profitability in different cities and markets.
