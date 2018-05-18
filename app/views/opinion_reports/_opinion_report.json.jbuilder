json.extract! opinion_report, :id, :opinion_id, :reason, :user_id, :created_at, :updated_at
json.url opinion_report_url(opinion_report, format: :json)
