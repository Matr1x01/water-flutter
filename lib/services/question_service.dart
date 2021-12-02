class QuestionService {
  var question = [
    {
      "id": "1",
      "label": "Select Your Options",
      "options": [
        {
          "label": "Misting System",
          "description": "Sat outside with misting system operating.",
          "value": "false"
        },
        {
          "label": "Spraying Water",
          "description":
              "Sat outside using sprinkler, or periodically spraying water around.",
          "value": "false"
        },
        {
          "label": "Heatware Event",
          "description":
              "Irrigated garden and lawn to prepare for heatwave event.",
          "value": "false"
        },
        {
          "label": "Green Park",
          "description": "Attended local green park.",
          "value": "false"
        },
      ]
    },
    {
      "id": "2",
      "label": "Why were these actions taken?",
      "options": [
        {"label": "Wanted to get the family outside.", "value": "false"},
        {"label": "Entertaining guests.", "value": "false"},
        {"label": "Wanted to save money.", "value": "false"},
        {"label": "Make it comfortable for the pets.", "value": "false"},
        {"label": "Preparing for extreme heat.", "value": "false"}
      ]
    },
    {
      "id": "3",
      "label": "Measurement of activity",
      "options": [
        {
          "label": "Time spent outside",
          "value": "0",
          "unit": "Hours",
          "max": "5",
          "min": "0",
          "interval": "1",
          "division": "5",
          "iconNumber": "59087"
        },
        {
          "label": "Misting system on.",
          "value": "0",
          "unit": "Hours",
          "max": "5",
          "min": "0",
          "interval": "1",
          "division": "5",
          "iconNumber": "59974"
        },
        {
          "label": "Air-con system use.",
          "value": "0",
          "unit": "Hours",
          "max": "5",
          "min": "0",
          "interval": "1",
          "division": "5",
          "iconNumber": "59191"
        },
        {
          "label": "Observed temperature reduction.",
          "value": "0",
          "unit": "Celcius",
          "max": "15",
          "min": "0",
          "interval": "3",
          "division": "15",
          "iconNumber": "58966"
        },
        // {"label": "Slide on your happiness factor.", "value": "0","unit":""}
      ]
    }
  ];
  List<Map<String, Object>> getQuestions() {
    return question;
  }
}
