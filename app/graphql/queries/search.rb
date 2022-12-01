class Queries::Search < Queries::BaseQuery
  type [ Types::CompanyType ], null: false

  argument :locations_hiring_in, String, required: false
  argument :roles_hiring_for, String, required: false

  def resolve(args)
    found_companies = Company.all
    args.each do |column_name, value|
      if Company.column_names.include?(column_name.to_s)
        found_companies = found_companies.where("#{column_name} ILIKE ?", "%#{value}%")
      end
    end
    found_companies
  end
end