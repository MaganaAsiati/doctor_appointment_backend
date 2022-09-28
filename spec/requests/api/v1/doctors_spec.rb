require 'swagger_helper'

RSpec.describe 'api/v1/doctors', type: :request do

  path '/api/v1/doctors' do

    get('list doctors') do
      response(403, 'successful') do

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

    post('create doctor') do
      response(401, 'successful') do
        consumes 'appication/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            speciality: { type: :string },
            image: {type: :string },
            description: { type: :string },
            bill: { type: :integer },
            email: {type: :string },
            location: {type: :string }
          },
          required: %w[name speciality image description bill email location]
        }

        let(:doctor) {}
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
    # You'll want to customize the parameter types...
    parameter name: :id, :in => :path, :type => :string

    get('show doctor') do
      response(403, 'successful') do
        let(:admin) {User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin')}   
        let(:id) { admin.doctors.create(
          name: 'Christina Milian',
          speciality: 'Neurology', 
          image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
          description: 'some description about this Christina Milian',
          bill: 100,
          email: 'johnabou@gmail.com',
          location: 'Cotonou'
        ).id }

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

    patch('update doctor') do
      response(401, 'successful') do
        consumes 'appication/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            speciality: { type: :string },
            image: {type: :string },
            description: { type: :string },
            bill: { type: :integer },
            email: {type: :string },
            location: {type: :string }
          },
          required: %w[name speciality image description bill email location]
        }
        let(:admin) {User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin')}   
        let(:id) { admin.doctors.create(
          name: 'Christina Milian',
          speciality: 'Neurology', 
          image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
          description: 'some description about this Christina Milian',
          bill: 100,
          email: 'johnabou@gmail.com',
          location: 'Cotonou'
        ).id }
        let(:doctor) {{
          name: 'Christina Milian',
          speciality: 'Neurology', 
          image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
          description: 'some description about this Christina Milian',
          bill: 10,
          email: 'johnabou@gmail.com',
          location: 'Cotonou'
        }}

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

    put('update doctor') do
      response(401, 'successful') do
        consumes 'appication/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            speciality: { type: :string },
            image: {type: :string },
            description: { type: :string },
            bill: { type: :integer },
            email: {type: :string },
            location: {type: :string }
          },
          required: %w[name speciality image description bill email location]
        }
        let(:admin) {User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin')}   
        let(:id) { admin.doctors.create(
          name: 'Christina Milian',
          speciality: 'Neurology', 
          image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
          description: 'some description about this Christina Milian',
          bill: 100,
          email: 'johnabou@gmail.com',
          location: 'Cotonou'
        ).id }
        let(:doctor) {{
          name: 'Christina Milian',
          speciality: 'Neurology', 
          image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
          description: 'some description about this Christina Milian',
          bill: 10,
          email: 'johnabou@gmail.com',
          location: 'Cotonou'
        }}

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

    delete('delete doctor') do
      response(401, 'successful') do
        let(:admin) {User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin')}   
        let(:id) { admin.doctors.create(
          name: 'Christina Milian',
          speciality: 'Neurology', 
          image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
          description: 'some description about this Christina Milian',
          bill: 100,
          email: 'johnabou@gmail.com',
          location: 'Cotonou'
        ).id }

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
