# require 'swagger_helper'

# RSpec.describe 'api/v1/doctors', type: :request do
#   path '/api/v1/doctors' do
#     get('list doctors') do
#       tags 'Doctors'
#       produces 'application/json'
#       security [Bearer: {}]
#       parameter name: :Authorization, in: :header, type: :string

#       response('200', 'successful') do
#         schema type: :object
#         let(:user) {User.create(name: 'User 1', email: 'user1@gmail.com', password: '123456')}
#         let(:token) {JWT.encode({ user_id: user.id }, 'asia', 'HS256')}
#         let(:Authorization) {token}
#         run_test! do |response|
#           puts user
#         end
#       end
#     end

#       post('create doctor') do
#         tags 'Doctors'
#         consumes 'application/json'

#         response(200, 'successful') do
#           parameter name: :doctor, in: :body, schema: {
#           type: :object,
#           properties: {
#             name: { type: :string },
#             speciality: { type: :string }
#           },
#           required: [ 'title', 'content' ]
#         }

#         response '201', 'blog created' do
#           let(:blog) { { title: 'foo', content: 'bar' } }
#           run_test!
#         end

#         response '422', 'invalid request' do
#           let(:blog) { { title: 'foo' } }
#           run_test!
#         end
#       end
#     end

#     path '/api/v1/doctors/{id}' do
#       # You'll want to customize the parameter types...
#       parameter name: 'id', in: :path, type: :string, description: 'id'

#     get('show doctor') do
#       response(200, 'successful') do
#         let(:id) { '123' }

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end

#     delete('delete doctor') do
#       response(200, 'successful') do
#         let(:id) { '123' }

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end
# end
