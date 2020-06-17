class UriValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "must be a valid URI format") unless uri_valid?(value)
  end
  
  def uri_valid?(uri)
    uri = URI.parse(uri) rescue false
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end
end
