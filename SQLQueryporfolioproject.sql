select *
from [Portfolio Project]..Coviddeaths
where continent is not null
order by 3,4

--select *
--from [Portfolio Project]..covidVacination
--order by 3,4

select Location,date,total_cases, new_cases,total_deaths,population
from [Portfolio Project]..Coviddeaths
order by 1,2

--looking total cases vs total deaths

select Location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as deathpercentage
from [Portfolio Project]..Coviddeaths
where location LIKE '%India%'
order by 1,2

--looking at total cases vs population

select Location,date,population,total_cases,(total_deaths/population)*100 as percentpopulationinfected
from [Portfolio Project]..Coviddeaths
where location LIKE '%India%'
order by 1,2

--looking at coutries with highest infection rate compared to Population 
select Location,population,max(total_cases) as highetinfectionrate,max((total_deaths/population))*100 as percentpopulationinfected
from [Portfolio Project]..Coviddeaths
--where location LIKE '%India%'
group by location,population
order by percentpopulationinfected desc

--showing countries with highest death count per population 
select Location,max(cast(total_deaths as int)) as totalDeathCount
from [Portfolio Project]..Coviddeaths
--where location LIKE '%India%'
where continent is not null
group by location
order by totalDeathCount desc

--LETS BREAKS THINGS DOWN BY CONTINENT



--showing continents with the highest death count per population 

select continent,max(cast(total_deaths as int)) as totalDeathCount
from [Portfolio Project]..Coviddeaths
--where location LIKE '%India%'
where continent is not null
group by continent
order by totalDeathCount desc

--GLOBAL NUMBERS 

select sum(new_cases) as totalcases,sum(cast(new_deaths as int))as totaldeaths,sum(cast(new_deaths as int))/sum(new_cases) * 100 as deathpercentage
from [Portfolio Project]..Coviddeaths
--where location LIKE '%India%'
where continent is not null
--group by date
order by 1,2
 

