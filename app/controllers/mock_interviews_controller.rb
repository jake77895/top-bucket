class MockInterviewsController < ApplicationController
  # Displays "Your Meetings" page
  def index
    @upcoming_meetings = [
      { title: "Mock Interview with Jane Doe", date: "2025-01-20", time: "10:00 AM" },
      { title: "Case Study with John Smith", date: "2025-01-22", time: "2:00 PM" }
    ]

    @past_meetings = [
      { title: "Mock Interview with Emily Johnson", date: "2025-01-10", time: "11:00 AM", description: "A detailed session on behavioral interviews" },
      { title: "Technical Interview with Mark Lee", date: "2025-01-08", time: "3:00 PM", description: "Focused on finance technical skills" }
    ]
  end

  # Displays the meeting board
  def meeting_board
    # Placeholder for available candidates or slots
    @candidates = 13.times.map do |i|
      { id: i + 1, name: "Candidate #{i + 1}", industry: "Placeholder Industry", skills: "Placeholder Skills" }
    end
  end
end
