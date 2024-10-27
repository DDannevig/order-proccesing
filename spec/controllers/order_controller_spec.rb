require 'rails_helper'

describe OrdersController, type: :controller do
  describe 'POST #create' do
    subject { post :create, params: create_params }

    let(:create_params) do
      { deposit_id: deposit.id,
        products: products }
    end
    let(:deposit) { FactoryBot.create :deposit, :with_stocked_products }
    let(:products) do
      deposit.products.map { |product| { identifier: product.identifier, quantity: 1 } }
    end

    context 'when sending valid parameters' do
      it 'responds with ok status' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it 'responds with correct serializer' do
        subject
        expect(response.body).to eq OrderCreateSerializer.new(Order.last).to_json
      end

      it 'creates the order' do
        expect { subject }.to change(Order, :count).by(1)
      end

      it 'creates the order_products' do
        expect { subject }.to change(OrderProduct, :count).by(2)
      end
    end
  end
end
