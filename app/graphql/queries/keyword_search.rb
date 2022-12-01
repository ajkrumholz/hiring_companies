class Queries::KeywordSearch < Queries::BaseQuery
  type [ Types::CompanyType ], null: false

  argument :keyword, String, required: true

  def resolve(keyword:)
    Company.where("company_name ILIKE ? OR description ILIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
end