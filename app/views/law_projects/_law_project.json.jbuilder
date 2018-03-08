json.extract! law_project, :id, :name, :description, :publication_date, :yes_votes, :not_votes, :created_at, :updated_at
json.url law_project_url(law_project, format: :json)
