require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path '/api/v1/users/{user_id}/reservations' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list reservations') do
      response(403, 'successful') do
        let(:user_id) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin').id }

        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    post('create reservation') do
      response(401, 'successful') do
        consumes 'appication/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: { date_reserved: { type: :date }, city: { type: :string }, user_id: { type: :integer },
                        doctor_id: { type: :integer } },
          required: %w[date_reserved city user_id doctor_id]
        }

        let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:doctor) do
          admin.doctors.create(name: 'Chris', speciality: 'Negy', image: 'd07.png', description: 'some',
                               bill: 100, email: 'johnabou@gmail.com', location: 'Cotonou')
        end

        let(:reservation) do
          Reservation.create(date_reserved: '22-10-2022', city: 'Lome', doctor_id: doctor)
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

  path '/api/v1/users/{user_id}/reservations/{id}' do
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show reservation') do
      response(403, 'successful') do
        let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:doctor) do
          admin.doctors.create(
            name: 'Christina Milian',
            speciality: 'Neurology',
            image: 'https://user-images.githubusercontent.com/95297251/192105518-81e2d20a-4990-470a-98a2-eb57c4242d07.png',
            description: 'some description about this Christina Milian',
            bill: 100,
            email: 'johnabou@gmail.com',
            location: 'Cotonou'
          )
        end

        let(:id) do
          admin.reservations.create(date_reserved: '22-10-2022', city: 'Lome', doctor_id: doctor).id
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

  path '/api/v1/users/{user_id}/reservations/{id}' do
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    patch('update reservation') do
      response(200, 'successful') do
        consumes 'appication/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: { date_reserved: { type: :date }, city: { type: :string }, user_id: { type: :integer },
                        doctor_id: { type: :integer } },
          required: %w[date_reserved city user_id doctor_id]
        }
        let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:doctor) do
          admin.doctors.create(name: 'Chris', speciality: 'Negy', image: 'd07.png', description: 'some',
                               bill: 100, email: 'johnabou@gmail.com', location: 'Cotonou')
        end
        let(:reservation) do
          admin.reservations.create(date_reserved: '22-10-2022', city: 'Lome', doctor_id: doctor.id)
        end
        let(:id) { reservation.id }

        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations/{id}' do
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    put('update reservation') do
      response(200, 'successful') do
        consumes 'appication/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: { date_reserved: { type: :date }, city: { type: :string }, user_id: { type: :integer },
                        doctor_id: { type: :integer } },
          required: %w[date_reserved city user_id doctor_id]
        }
        let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:doctor) do
          admin.doctors.create(name: 'Chris', speciality: 'Negy', image: 'd07.png', description: 'some',
                               bill: 100, email: 'johnabou@gmail.com', location: 'Cotonou')
        end
        let(:reservation) do
          admin.reservations.create(date_reserved: '22-10-2022', city: 'Lome', doctor_id: doctor.id)
        end
        let(:id) { reservation.id }

        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations/{id}' do
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    delete('delete reservation') do
      response(200, 'successful') do
        let(:user_id) { User.create(name: 'user', email: 'user@gmail.com', password: '123456').id }
        let(:admin) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', role: 'admin') }
        let(:doctor) do
          admin.doctors.create(name: 'Chris', speciality: 'Negy', image: 'd07.png', description: 'some',
                               bill: 100, email: 'johnabou@gmail.com', location: 'Cotonou')
        end
        let(:id) do
          Reservation.create(date_reserved: '22-10-2022', city: 'Lome', user_id:, doctor_id: doctor.id).id
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body)
            }
          }
        end
        run_test!
      end
    end
  end
end
