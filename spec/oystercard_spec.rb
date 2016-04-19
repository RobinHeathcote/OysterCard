load "oystercard.rb"

describe Oystercard do

  context "balance" do

		it "shows the balance" do
	  expect(subject.balance).to eq 0
		end

	  it "tops up the balance" do
	    expect{ subject.top_up Oystercard::MINIMUM_BALANCE }.to change{ subject.balance }.by Oystercard::MINIMUM_BALANCE
	  end

	  it "deducts the money from the balance" do
	  	expect{ subject.deduct Oystercard::MINIMUM_BALANCE }.to change{ subject.balance }.by -Oystercard::MINIMUM_BALANCE
	  end

	  it 'cannot top up above the balance limit' do
	    balance_limit = Oystercard::BALANCE_LIMIT
	    subject.top_up(balance_limit)
	    expect { subject.top_up 1}.to raise_error "Your balance cannot exceed £#{balance_limit}"
	  end

  end


describe "Touching in and out" do

  context "Card has enough money" do

    before do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
    end

		it "Charges fare upon touching card in" do
			subject.touch_in
			expect{ subject.deduct Oystercard::MINIMUM_BALANCE }.to change{ subject.balance }.by -Oystercard::MINIMUM_BALANCE
		end

    it "touches card out" do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

		it "confirms user is journey" do
			expect(subject).not_to be_in_journey
		end

  end

  context "No money on the card" do

    it "Does not allow travel below minimum balance" do
      expect {subject.touch_in}.to raise_error "You do not have the minimum balance for travel"
    end
	end
end
end

