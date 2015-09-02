puts 'PaymentMethod'

Spree::PaymentMethod::Check.create!(name: 'Offline Payment', active: true, environment: 'development')
Spree::Gateway::AuthorizeNet.create!(name: 'Authorize.net', active: true, environment: 'development')
Spree::Gateway::PayPal.create!(name: 'PayPal', active: true, environment: 'development')
Spree::Gateway::Bogus.create!(name: 'Bogus', active: true, environment: 'development')
