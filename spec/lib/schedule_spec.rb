require 'spec_helper'

describe Icalendar::Recurrence::Schedule do
  describe "#occurrences_between" do
    let(:example_occurrence) do
      daily_event = example_event :daily
      schedule = Schedule.new(daily_event)
      schedule.occurrences_between(Date.parse("2014-02-01"), Date.parse("2014-03-01")).first
    end

    it "returns object that responds to start_time and end_time" do
      expect(example_occurrence).to respond_to :start_time
      expect(example_occurrence).to respond_to :end_time
    end

    context "timezoned event" do
      let(:example_occurrence) do
        timezoned_event = example_event :first_saturday_of_month
        schedule = Schedule.new(timezoned_event)
        example_occurrence = schedule.occurrences_between(Date.parse("2014-02-01"), Date.parse("2014-03-01")).first
      end

      it "#occurrences_between return object that responds to #start_time and #end_time (timezoned example)" do
        expect(example_occurrence).to respond_to :start_time
        expect(example_occurrence).to respond_to :end_time
      end
    end
  end
end
