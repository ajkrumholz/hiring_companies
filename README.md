GraphQL Endpoints

Fetch all companies

{
  fetchCompanies {
    id
    companyName
    description
    etc...
  }
}

Fetch a single company

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

