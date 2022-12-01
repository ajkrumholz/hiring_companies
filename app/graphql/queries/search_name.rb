class Queries::SearchName < Queries::BaseQuery
  type [ Types::CompanyType ], null: false

  argument :company_name, String, required: true

  def resolve(company_name:)
    Company.where("company_name ILIKE ?", "%#{company_name}%")
  end
end