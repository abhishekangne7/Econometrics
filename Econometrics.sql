DROP TABLE IF EXISTS dbo.EconometricsFact

select * from [dbo].[EconometricsFact]
select e.Country,e.Gender,e.Level,e.Year,e.Education_in_Percent,[Euro to Pound]
from Education e
left join Exchange_Rate er on e.Country = er.Country
and e.Year = er.Year;

select * from Unemployment_Rate;

select e.Country,u.Region,e.Gender,e.Level,e.Year,e.Education_in_Percent,u.Unemployment_Rate
from Education e
inner join Unemployment_Rate u on e.Country = u.Country
and e.Year = u.Year;


/*Create Fact Table*/
Create table EconometricsFact(
FactId int primary key identity,
YearID int foreign key references DimYear(YearId),
CountryID int foreign key references DimCountry(CountryID),
GenderId int foreign key references DimGender(GenderId),
Gender varchar(10),Population BigInt,
GDP_PerCapita float,
FDI float, HDI float, 
Unemployment_Rate float, 
HALE float, Freedom_to_make_Life_Choices float, 
Overall_Rank int, WHR_Score float,
Level varchar(10), Education_in_Percent float,
Trade_Balance_in_Billion_USD float,
Euro_to_Pound float
)

insert into EconometricsFact
select dy.YearId,dc.CountryID,dg.GenderId,dg.Gender,p.Population,
g.[GDP Per capita PPS],
f.FDI, h.[HDI Value], 
u.Unemployment_Rate, 
w.[Healthy life expentancy], w.[Freedom to make life choices], w.[Overall Rank], w.[WHR Score],
e.Level, e.Education_in_Percent,
t.Trade_Balance_in_Billion_USD,
er.[Euro to Pound]
from Population p
inner join DimGender dg on p.Gender = dg.Gender
inner join DimCountry dc on p.Country = dc.CountryName
and p.Region = dc.Region
inner join DimYear dy on p.Year = dy.Year
inner join GDP g on p.Country = g.Country
and p.Region = g.Region
and p.Year = g.Year
inner join FDI f on p.Country = f.Country
and p.Region = f.Region
and p.Year = f.Year
inner join HDI h on p.Country = h.Country
and p.Region = h.Region
and p.Year = h.Year
inner join Unemployment_Rate u on p.Country = u.Country
and p.Region = u.Region
and p.Year = u.Year
inner join World_Happiness_Index w on p.Country = w.Country
and p.Year = w.Year
inner join Education e on p.Country = e.Country
and p.Year = e.Year
and p.Gender = e.Gender
left join Trade_Bakance t on p.Country = t.Country
and p.Year = t.Year
left join Exchange_Rate er on p.Country = er.Country
and p.Year = er.Year; 
)
