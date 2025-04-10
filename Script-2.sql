select * from dataset_1; -- df

select weather,temperature from dataset_1; -- df[['weather','temperature']]


select * from dataset_1 limit 5;  -- df.head(5)


select DISTINCT passanger from dataset_1; -- df['passanger'].unique()


select * from dataset_1 where destination = 'Home'; -- df[ df['destination'] == 'Home' ]


select * from dataset_1 order by coupon; -- df.sort_values[coupon]


select destination as Destination from dataset_1; -- df.rename(columns = {'destination': 'Destination'})


select occupation,count(*) as count from dataset_1 group by occupation; -- df.groupby('occupation').size().to_frame('count').reset_index()


--What is average temperature for each weather condition ?
select weather, avg(temperature) from dataset_1 group by weather;  --  df.groupby('weather')['temperature'].mean()


--How many entries are there for each weather type ? 
select weather,COUNT(temperature) from dataset_1 group by weather; -- df.groupby('weather')['temperature'].size()



--How many different temperature values are recorded for each weather type? 
select weather, count(DISTINCT temperature) from dataset_1 group by weather; -- df.groupby('weather')['temperature'].nunique()


--What is the total temperature recorded for each weather condition ? 
select weather, SUM(temperature) from dataset_1 group by weather;  -- df.groupby('weather')['temperature'].sum()


--What is the minimum temperature recorded for each weather condition?
select weather, MIN(temperature) from dataset_1 group by weather;  --df.groupby('weather')['temperature'].min()


--What is maximum temperature for each weather condition?
select weather, MAX(temperature) from dataset_1 group by weather; -- df.groupby('weather')['temperature'].max()

--Show the occupation only if its student
select occupation from dataset_1 where occupation ='Student' group by occupation;  -- df[ df['occupation']=='Student' ] [['occupation']]



--What are all unique travel destinations found across both datset_1 and table_to_union?  -- combined_df = pd.concat([dataset_1, table_to_union]).drop_duplicates()
select DISTINCT destination from (select * from dataset_1 UNION select * from table_to_union);  -- unique_destinations = combined_df['destination'].unique()





-- List all combinations of destinations, time of day, for records where time of day is same in both dataset_1 and table_to union ?
select dataset_1.destination, dataset_1.time  from dataset_1 INNER JOIN table_to_union ON dataset_1.time = table_to_union.time;  
-- result = pd.merge(df,df1, on ='time', how='inner')
-- result[['destination', 'time']]

-- List the destination and passanger details for all records where the passanger was travelling alone.
select destination, passanger FROM(select * from dataset_1 where passanger = 'Alone');

--fetch all records where the weather starts with 'sun' 
select * from dataset_1 WHERE weather LIKE 'sun%'; --df[df['weather'].str.lower().str.startswith('sun')] 


select DISTINCT temperature from dataset_1 WHERE temperature BETWEEN 29 and 75;


select occupation from dataset_1 WHERE occupation IN('Sales & Related','Managment'); --df[  df['occupation'].isin(['Sales & Related','Managment'])  ] 











































































































