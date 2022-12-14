class Queries::FetchCompany < Queries::BaseQuery
  type Types::CompanyType, null: false
  argument :id, ID, required: true

  def resolve(id:)
    company = Company.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new("Company doesn't exist.")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
  end
end