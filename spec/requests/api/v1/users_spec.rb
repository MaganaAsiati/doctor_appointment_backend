require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users' do

    get('list users') do
      response(200, 'successful') do

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

    post('create user') do
      response(422, 'successful') do
        consumes 'appication/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            email: {type: :string },
            password: {type: :string }
          },
          required: %w[name email password]
        }
        let(:user) { User.create(name: 'abobo', email: 'some@gmail.com', password: 'dkdkdk') }

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

  path '/api/v1/users/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      response(200, 'successful') do
        let(:id) { User.create(name: 'abobo', email: 'some@gmail.com', password: 'dkdkdk').id }
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

    patch('update user') do
      response(403, 'successful') do
        consumes 'appication/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            email: {type: :string },
            password: {type: :string }
          },
          required: %w[name email password]
        }
        let(:user) { User.create(name: 'abobo', email: 'some@gmail.com', password: 'dkdkdk') }
        let(:id) { User.create(name: 'abobo', email: 'some@gmail.com', password: 'dkdkdk').id }

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

    put('update user') do
      response(403, 'successful') do
        consumes 'appication/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            email: {type: :string },
            password: {type: :string }
          },
          required: %w[name email password]
        }
        let(:user) { User.create(name: 'abobo', email: 'some@gmail.com', password: 'dkdkdk') }
        let(:id) { User.create(name: 'abobo', email: 'some@gmail.com', password: 'dkdkdk').id }

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

    delete('delete user') do
      response(200, 'successful') do
        let(:id) { User.create(name: 'abobo', email: 'some@gmail.com', password: 'dkdkdk').id }

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
