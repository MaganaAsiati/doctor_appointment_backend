require 'swagger_helper'

RSpec.describe 'api/v1/doctors', type: :request do
  path '/api/v1/doctors' do
    get('list doctors') do
      response(403, 'successful') do
        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
    post('create doctor') do
      response(401, 'successful') do
        consumes 'appication/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: { name: { type: :string }, speciality: { type: :string }, image: { type: :string },
                        description: { type: :string }, bill: { type: :integer }, email: { type: :string },
                        location: { type: :string } },
          required: %w[name speciality image description bill email location]
        }
        let(:doctor) { { name: 'doctor' } }
        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: :id, in: :path, type: :string

    get('show doctor') do
      response(403, 'successful') do
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:id) do
          admin.doctors.create(name: 'Chris', speciality: 'Negy', image: 'd07.png', description: 'some',
                               bill: 100, email: 'johnabou@gmail.com', location: 'Cotonou').id
        end

        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end
  path '/api/v1/doctors/{id}' do
    parameter name: :id, in: :path, type: :string

    patch('update doctor') do
      response(401, 'successful') do
        consumes 'appication/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: { name: { type: :string }, speciality: { type: :string }, image: { type: :string },
                        description: { type: :string }, bill: { type: :integer }, email: { type: :string },
                        location: { type: :string } },
          required: %w[name speciality image description bill email location]
        }
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:doctor) do
          admin.doctors.create(name: 'Chris', speciality: 'Negy', image: 'd07.png', description: 'some',
                               bill: 100, email: 'johnabou@gmail.com', location: 'Cotonou')
        end
        let(:id) { doctor.id }
        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    parameter name: :id, in: :path, type: :string

    put('update doctor') do
      response(401, 'successful') do
        consumes 'appication/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: { name: { type: :string }, speciality: { type: :string }, image: { type: :string },
                        description: { type: :string }, bill: { type: :integer }, email: { type: :string },
                        location: { type: :string } },
          required: %w[name speciality image description bill email location]
        }
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:doctor) do
          admin.doctors.create(name: 'Chris', speciality: 'Negy', image: 'd07.png', description: 'some',
                               bill: 100, email: 'johnabou@gmail.com', location: 'Cotonou')
        end
        let(:id) { doctor.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
  path '/api/v1/doctors/{id}' do
    parameter name: :id, in: :path, type: :string

    delete('delete doctor') do
      response(401, 'successful') do
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:id) do
          admin.doctors.create(name: 'Chris', speciality: 'Negy', image: 'd07.png', description: 'some',
                               bill: 100, email: 'johnabou@gmail.com', location: 'Cotonou').id
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
