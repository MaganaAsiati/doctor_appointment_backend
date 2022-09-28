# require 'swagger_helper'

# RSpec.describe 'api/v1/doctors', type: :request do
#   path '/api/v1/doctors' do
#     get('list doctors') do
#       tags 'Doctors'
#       produces 'application/json'
#       parameter name: :Authorization, in: :header, type: :string
#       response('200', 'successful') do
#       schema type: :object
#         end
#       end
#     end

# #       post('create doctor') do
# #         tags 'Doctors'
# #         consumes 'application/json'

# response(200, 'successful') do
#   parameter name: :doctor, in: :body, schema: {
#   type: :object,
#   properties: {
#     name: { type: :string },
#     speciality: { type: :string }
#   },
#   required: [ 'title', 'content' ]
# }

# #         response '201', 'blog created' do
# #           let(:blog) { { title: 'foo', content: 'bar' } }
# #           run_test!
# #         end

# #         response '422', 'invalid request' do
# #           let(:blog) { { title: 'foo' } }
# #           run_test!
# #         end
# #       end
# #     end

# #     path '/api/v1/doctors/{id}' do
# #       # You'll want to customize the parameter types...
# #       parameter name: 'id', in: :path, type: :string, description: 'id'

# #     get('show doctor') do
# #       response(200, 'successful') do
# #         let(:id) { '123' }

# #         after do |example|
# #           example.metadata[:response][:content] = {
# #             'application/json' => {
# #               example: JSON.parse(response.body, symbolize_names: true)
# #             }
# #           }
# #         end
# #         run_test!
# #       end
# #     end

# #     delete('delete doctor') do
# #       response(200, 'successful') do
# #         let(:id) { '123' }

# #         after do |example|
# #           example.metadata[:response][:content] = {
# #             'application/json' => {
# #               example: JSON.parse(response.body, symbolize_names: true)
# #             }
# #           }
# #         end
# #         run_test!
# #       end
# #     end
# #   end
# # end

# require 'rails_helper'

# describe 'doctors API', type: :request do
#   describe 'GET /doctors' do
#     before do
#       FactoryBot.create(:doctor, name: 'lila',
#       speciality: 'Neurology',
#       image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
#       description: 'some description about this Christina Milian',
#       bill: 100,
#       email: 'lila@gmail.com',
#       location: 'Cotonou')
#       # FactoryBot.create(:doctor, name: 'Doctor-2', fee: 30, image: 'Doctor-2-photo', details: 'I am Doctor-2')
#       # FactoryBot.create(:doctor, name: 'Doctor-3', fee: 40, image: 'Doctor-3-photo', details: 'I am Doctor-3')
#     end
#     it 'returns all doctors' do
#       get '/api/v1/doctors'

#       expect(response).to have_http_status(:success)
#       expect(JSON.parse(response.body).size).to eq(1)
#     end
#   end

# describe 'POST /doctors' do
#   it 'create a new doctor' do
#     expect do
#       post '/api/v1/doctors', params: {
#         doctor: { name: 'Doctor', fee: 20, image: 'Doctor-photo', details: 'I am Doctor' }
#       }
#     end.to change { Doctor.count }.from(0).to(1)

#     expect(response).to have_http_status(:created)
#   end
# end

# describe 'DELETE /doctors:id' do
#   let!(:doctor1) do
#     FactoryBot.create(:doctor, name: 'Doctor-1', fee: 20, image: 'Doctor-1-photo', details: 'I am Doctor-1')
#   end
#   let!(:doctor2) do
#     FactoryBot.create(:doctor, name: 'Doctor-2', fee: 30, image: 'Doctor-2-photo', details: 'I am Doctor-2')
#   end
#   let!(:doctor3) do
#     FactoryBot.create(:doctor, name: 'Doctor-3', fee: 40, image: 'Doctor-3-photo', details: 'I am Doctor-3')
#   end

#   it 'delete a doctor' do
#     expect do
#       delete "/api/v1/doctors/#{doctor1.id}"
#     end.to change { Doctor.count }.from(3).to(2)

#     expect(response).to have_http_status(:ok)
#   end
#
