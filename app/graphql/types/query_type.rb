module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :fetch_companies, resolver: Queries::FetchCompanies
    field :fetch_company, resolver: Queries::FetchCompany
    field :search, resolver: Queries::Search
    field :search_name, resolver: Queries::SearchName
    field :keyword_search, resolver: Queries::KeywordSearch
  end
end
