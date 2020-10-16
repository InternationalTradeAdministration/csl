# frozen_string_literal: true

json.partial! "shared/queryinfo"
json.results do
  json.array! @search[:hits] do |hit|
    entry = hit.deep_symbolize_keys
    json.id hit[:_id]
    json.partial! "consolidated/#{entry[:_source][:source][:code].downcase}/entry", entry: entry
    if @_request["fuzzy_name"].present? && @_request["fuzzy_name"].casecmp("true").zero?
      json.score entry[:_score]
      json.matched_fields entry[:highlight] if entry[:highlight].present?
    end
  end
end
