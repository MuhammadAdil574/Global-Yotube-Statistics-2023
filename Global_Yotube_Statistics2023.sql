create database Global_YouTube_Statistics_2023;
use Global_YouTube_Statistics_2023;
show tables ;
select * from global_youtube_statistics;


SELECT -- Continents,
case
     when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
          "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
          "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
          "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
          "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
          "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'

     when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
          "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
          "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
          "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
          "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
         "Ukraine","United Kingdom","Vatican City") then 'Europe'

     when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
        "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
        "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
        "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
        "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'

     when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
         "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
        "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'

     when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
         "Uruguay","Venezuela") then 'South_America'

     when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
         "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania '
	end 
    as  continents
    from global_youtube_statistics
    group by Continents;



-- YOUTUBE TOP PLAYERS by continents
-- 1a. Top continets in the youtube  space; Uploads, views, earnings and Subs

SELECT 
case
     when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
          "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
          "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
          "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
          "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
          "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'

     when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
          "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
          "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
          "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
          "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
         "Ukraine","United Kingdom","Vatican City") then 'Europe'

     when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
        "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
        "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
        "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
        "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'

     when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
         "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
        "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'

     when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
         "Uruguay","Venezuela") then 'South_America'

     when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
         "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania '
	end 
    as  continents,
 
    sum(subscribers) as Total_subs,
    sum(video_views) as Total_views,
    sum(uploads) as Total_Uploads,
    cast(sum(highest_yearly_earnings) as decimal (10,0))as Total_yearly_earnings,
    Count(Youtuber) as Total_number_of_Yotuber
    
    from global_youtube_statistics
    group by  continents
    order by Total_yearly_earnings desc;
    
-- Percentage of salaries in each continent
    
    WITH Percentage_pay AS (
    SELECT 
        CASE
            WHEN Country IN ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
                "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
                "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
                "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
                "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
                "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") THEN 'Africa'
            WHEN Country IN ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
                "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
                "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
                "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
                "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
                "Ukraine","United Kingdom","Vatican City") THEN 'Europe'
            WHEN Country IN ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
                "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
                "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
                "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
                "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") THEN 'Asia'
            WHEN Country IN ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
                "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
                "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") THEN 'North_America'
            WHEN Country IN ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
                "Uruguay","Venezuela") THEN 'South_America'
            WHEN Country IN ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
                "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") THEN 'Australia_and_Oceania'
        END AS continents,
        SUM(highest_yearly_earnings) AS Total_yearly_earnings
    FROM 
        global_youtube_statistics
    GROUP BY 
        continents
)

SELECT 
    SUM(Total_yearly_earnings) AS Total_yearly_earnings,     
    round(sum(CASE WHEN continents = 'Africa' THEN Total_yearly_earnings ELSE 0 END) * 100 / SUM(Total_yearly_earnings),2) AS Earning_In_Africa,
    round(SUM(CASE WHEN continents = 'Europe' THEN Total_yearly_earnings ELSE 0 END) * 100 / SUM(Total_yearly_earnings),2) AS Earning_In_Europe,
    round(SUM(CASE WHEN continents = 'Asia' THEN Total_yearly_earnings ELSE 0 END) * 100 / SUM(Total_yearly_earnings),2) AS Earning_In_Asia,
    Round(SUM(CASE WHEN continents = 'North_America' THEN Total_yearly_earnings ELSE 0 END) * 100 / SUM(Total_yearly_earnings),2) AS Earning_In_North_America,
    Round(SUM(CASE WHEN continents = 'South_America' THEN Total_yearly_earnings ELSE 0 END) * 100 / SUM(Total_yearly_earnings),2) AS Earning_In_South_America,
    Round(SUM(CASE WHEN continents = 'Australia_and_Oceania' THEN Total_yearly_earnings ELSE 0 END) * 100 / SUM(Total_yearly_earnings),2) AS Earning_In_Australia_and_Oceania
FROM 
    Percentage_pay;

	-- top 8 countries with high percentage pay
    
 select Country, round(sum(highest_yearly_earnings),0) as Total_earning
 from global_youtube_statistics
 group by Country
 order by Total_earning desc limit 8 ;

	-- top 8 countries with high percentage pay

WITH Country_PCT as (
 select Country, round(sum(highest_yearly_earnings),0) as Total_earning
 from global_youtube_statistics
 group by Country
 order by Total_earning desc ) 
 
 select sum(Total_earning) as Total_Earnings,
 
     round(sum(CASE WHEN Country = 'United States' THEN Total_earning ELSE 0 END) * 100 / SUM(Total_earning),2) AS PCT_USA,
     round(sum(CASE WHEN Country = 'India' THEN Total_earning ELSE 0 END) * 100 / SUM(Total_earning),2) AS PCT_India,
	 round(sum(CASE WHEN Country = 'Brazil' THEN Total_earning ELSE 0 END) * 100 / SUM(Total_earning),2) AS PCT_Brazil,
	 round(sum(CASE WHEN Country = 'South Korea' THEN Total_earning ELSE 0 END) * 100 / SUM(Total_earning),2) AS PCT_South_Korea,
     round(sum(CASE WHEN Country = 'United Kingdom' THEN Total_earning ELSE 0 END) * 100 / SUM(Total_earning),2) AS PCT_UK,
     round(sum(CASE WHEN Country = 'Pakistan' THEN Total_earning ELSE 0 END) * 100 / SUM(Total_earning),2) AS PCT_Pak,
     round(sum(CASE WHEN Country = 'Argentina' THEN Total_earning ELSE 0 END) * 100 / SUM(Total_earning),2) AS PCT_Argentina,
     round(sum(CASE WHEN Country = 'Russia' THEN Total_earning ELSE 0 END) * 100 / SUM(Total_earning),2) AS PCT_Russia

    from Country_PCT;
    
    
    -- Top 8 channel types, count views
    -- total number of views  each channel has
    
    select channel_type,sum(video_views) as Views
    
    from global_youtube_statistics
    group by channel_type
    order by Views desc limit 8 ;

    -- so thats the end of the project where our aim was to cover some provided questions  
    -- How top ranked channels with most number of  views 
    -- Top Yotube players around the gloab (I.e in continents and countries respectively)
    -- Percentage of salaries with respect to countries and continents
    -- Used CTE to play within the data making sure nothing would happed to real data
    -- USed case with if else to get the resuts for countries and continents
    
