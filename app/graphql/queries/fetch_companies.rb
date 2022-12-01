class Queries::FetchCompanies < Queries::BaseQuery
  type [ Types::CompanyType ], null: false

  def resolve
    Company.all.order(company_name: :asc)
  end
end