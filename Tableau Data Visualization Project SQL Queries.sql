/*
Queries used for Tableau Project
*/

--Query 1

SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases) *100 as DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent is not NULL
ORDER BY 1,2

--Query 2
SELECT location, SUM(cast(new_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is NULL
AND location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount desc 

--Query 3
SELECT Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/Population))*100 as PercentPopulationInfected 
FROM PortfolioProject..CovidDeaths
GROUP BY location,Population
ORDER BY PercentPopulationInfected desc

--Query 4
SELECT Location, Population, date, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/Population)*100 as PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY location,Population,date
ORDER BY PercentPopulationInfected desc