## GraphQL Endpoints

### Fetch all companies

Returns the full data set of companies. Of minimal utility, but it's there if you want it!
#### Sample Request
```
{
  fetchCompanies {
    id
    companyName
    description
    etc...
  }
}
```

#### Sample Response
```
{
"data": {
        "fetchCompanies": [
            {
                "id": "656",
                "companyName": "1& Mail&Media ",
                "description": "Building on a strong market position with 43 million active users around the world as leading e-mail provider in German, Austria and Switzerland, we develop services and apps that simplify people’s digital lives – from smart mailboxes and cloud storage to personal ID management.",
                "hiringLink": "https://www.mail-and-media.com/en/jobs/job-search.html",
                "rolesHiringFor": "Engineering Manager, DevOps Engineers, Developers, Data Engineers",
                "locationsHiringIn": "Germany (remote), Karlsruhe, Munich, CET",
                "oneNiceThing": "It's mainly the colleagues and atmosphere - and you can very much affect and influence your environment and tasks.",
                "comments": null
            },
            {
                "id": "356",
                "companyName": "10x Banking",
                "description": "Creating the world’s most powerful cloud native banking platform for top tier banks and beyond. ",
                "hiringLink": "https://www.10xbanking.com/job-vacancies",
                "rolesHiringFor": "Business Analysts, DevSecOps, Software Eng (mid, senior, Principal, Lead), Data Engineers",
                "locationsHiringIn": "London, Sydney and Remote ",
                "oneNiceThing": "Microservices architecture and API first design",
                "comments": "We’re a B2B Saas platform with a mission to be the global bank operating system of choice"
            },... 
        ]
    }
}
```

### Fetch a single company

Returns a single company by ID. Probably most useful if, after returning a list of searched companies, we want to be able to click on a company and have a "show" page for it.
#### Sample Request
```
{ 
  fetchCompany(id: 4) {
    companyName
    description
    hiringLink
    rolesHiringFor
    locationsHiringIn
    oneNiceThing
    comments
   }
}
```

#### Sample Response
```
{
    "data": {
        "fetchCompany": {
            "companyName": "Findhotel (now Vio.com)",
            "description": "Online hotel booking engine and metasearch",
            "hiringLink": "https://boards.eu.greenhouse.io/findhotel/jobs/4004576101?gh_jid=4004576101  https://boards.eu.greenhouse.io/findhotel/jobs/4042501101?gh_jid=4042501101 https://boards.eu.greenhouse.io/findhotel/jobs/4004552101?gh_jid=4004552101  https://boards.eu.greenhouse.io/findhotel/jobs/4096337101?gh_jid=4096337101",
            "rolesHiringFor": "Software engineers (Golang, Elixir), ML Engineers, Cyber Sec Lead, Engineering manager",
            "locationsHiringIn": "Netherlands; GMT +- 3; Europe, Middle East, Brazil, Argentina, Turkey, Africa",
            "oneNiceThing": "Flexibility",
            "comments": "Findhotel is super multinaitional stable company with no external investment, amazing team and freedom to create and implement things"
        }
    }
}
```

### Search name/description by keyword

This does a fuzzy search on *both* name and description. Best used along side things like "travel" or "fintech" to narrow down companies to the industries in which you're most interested.
#### Sample Request
```
{
    keywordSearch(keyword: "travel") {
        companyName
        description
        hiringLink
        rolesHiringFor
        locationsHiringIn
        oneNiceThing
        comments
    }
}
```

#### Sample Response
```
{
    "data": {
        "keywordSearch": [
            {
                "companyName": "TravelPerk",
                "description": "Provide a B2B SaaS platform to take the pain out of business travel",
                "hiringLink": "https://www.travelperk.com/careers/",
                "rolesHiringFor": "All software and product roles ",
                "locationsHiringIn": "Barcelona, Berlin, London, Edinburgh ",
                "oneNiceThing": "Work life balance and non corporate (\"we are a family\"), healthy culture.",
                "comments": "https://builders.travelperk.com/how-do-we-hire-engineers-travelperk-afabbf82aedc"
            },
            {
                "companyName": "Skyscanner",
                "description": "Flights, Hotels and Car Hire search\nSearch, compare and book travel\nTravel search and booking",
                "hiringLink": "https://www.skyscanner.net/jobs/current-jobs/\nhttps://www.skyscanner.net/jobs/\nhttps://www.skyscanner.net/jobs/current-jobs/",
                "rolesHiringFor": "Data Engineers, Distributed Systems Engineers, Full Stack Engineers and Engineering Managers\nNative mobile, frontend web, backend node.js/Java/Python\nSoftware engineers and engineering managers ",
                "locationsHiringIn": "London, Barcelona, Edinburgh, Glasgow, Shenzhen\nLondon, Edinburgh, Glasgow, Barcelona\nGlasgow, Edinburgh, London, Barcelona",
                "oneNiceThing": "We're big enough to have exciting challenges with scale, but small enough that our culture is still strong. Plus travel is a fun sector\nGreat culture, transparent and honest leadership\nAmazing culture",
                "comments": null
            },...
        ]
    }
}
```

### Search (multiple)

- Allows you to search multiple qualities simultaneously.

Available Arguments (all Strings)
  - description
  - locationsHiringIn
  - rolesHiringFor
  - companyName

Since the data set is of limited size, many queries using all four arguments won't return any hits. This is meant more to combine things like looking for travel jobs in Europe (see below), but it at least offers the flexibility to be extremely specific if you really want to.
#### Sample Request
```
{
    search(
        description: "travel",
        locationsHiringIn: "europe"
    ) {
        id
        companyName
        description
        locationsHiringIn
        rolesHiringFor
    }
}
```

Sample Response
```
{
    "data": {
        "search": [
            {
                "id": "253",
                "companyName": "Busbud",
                "description": "Intercity bus and train travel marketplace",
                "locationsHiringIn": "Based in Montreal, hiring anywhere in NA or Western Europe ",
                "rolesHiringFor": "Senior Engineer, Engineering Manager"
            },
            {
                "id": "741",
                "companyName": "Omio",
                "description": "Travel Tech, Omio is pursuing a vision of delivering the world's travel inventory to enable journeys to and from anywhere.\nWe help people travel especially via trains and buses",
                "locationsHiringIn": "CET - Berlin, Prague, London, Europe Flexi working \nBerlin, Prague, Remote [CET +- 3 hours]",
                "rolesHiringFor": "Multiple Software Engineers Frontend, Backend, FullStack, Java /  JavaScript  / DevOps / ReactNative\nSoftware Engineers - front end, back end, SRE, data; Product Managers; Design roles"
            }
        ]
    }
}
```





