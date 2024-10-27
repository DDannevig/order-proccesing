require 'rails_helper'

describe ProcessOrderWorker do
  subject { described_class.perform(order.identifier) }

  let(:deposit) { FactoryBot.create :deposit, :with_stocked_products }
  let(:order) { Order.create(deposit: deposit, order_products_attributes: order_products_attributes) }
  let(:order_products_attributes) do
    deposit.products.map do |product|
      { product: product, quantity: 1 }
    end
  end

  context 'with valid params' do
    it 'returns de processed order' do
      expect(subject).to eq(order)
    end

    it 'updates the status to processed' do
      expect { subject }.to change { order.reload.status }.from('pending').to('prepared')
    end

    it 'updates the products stocks' do
      expect { subject }.to change { deposit.stocks.first.reload.quantity }.by(-1).and change {
        deposit.stocks.second.reload.quantity
      }.by(-1)
    end
  end
end
