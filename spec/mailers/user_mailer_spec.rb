require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    let(:mail) { UserMailer.welcome_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "pending_email" do
    let(:mail) { UserMailer.pending_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Pending email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "approved_email" do
    let(:mail) { UserMailer.approved_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Approved email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
