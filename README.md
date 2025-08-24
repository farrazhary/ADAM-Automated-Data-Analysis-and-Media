# ADAM (Automated Data Analysis and Media)

**ADAM** is a **WhatsApp-based automation platform** that combines **workflow automation, data analysis, recommendations, and media generation** in one end-to-end solution.  
Built on **n8n**, ADAM can understand natural language, process multimodal data, and generate both insights and creative content automatically.

---

## 🚀 Features

- **Data Analysis**: Analyze text, audio, images, video, and documents.  
- **Knowledge Retrieval**: Automatically query from **Google Sheets** and **Supabase (Postgres DB)**.  
- **Workflow Automation**: From WhatsApp → analysis → response → data entry runs seamlessly.  
- **Video Generation**: Powered by **Vertex AI + Google VEO 3** with **JSON-based prompts** for consistent characters, voices, and styles. This ensures production-ready video outputs suitable for marketing and branding.  
- **Image Generation**: Instantly create visuals from text or captions.  
- **Financial Reports**: Extract invoices & purchase orders into structured reports.  
- **Natural Language Query (NLQ)**: Everyday language converted into database queries.  
- **Summarization**: Summarize long documents, audio, or video into concise insights.  
- **Recommendations**: Provide actionable suggestions based on data analysis (e.g. product prioritization, profit maximization).  
- **Voice AI**: Integrated with **ElevenLabs TTS + Voice Changer** for interactive audio output.  
- **Data Integration**: Connected with WhatsApp API, Google Gemini AI, Google Sheets, Supabase DB, ElevenLabs, and Vertex AI.  

---

## 🛠 Tech Stack

- **Workflow**: n8n (hosted on **AWS EC2 + Ngrok**)  
- **Messaging**: WhatsApp Business API  
- **AI Models**:  
  - Google Gemini AI (Text, Image, Audio, Video)  
  - **Vertex AI + Google VEO 3** (Video Generation)  
  - ElevenLabs (TTS + Voice Changer)  
- **Database & Storage**:  
  - Google Sheets  
  - Supabase (Postgres Database)  

---

## 📌 Why ADAM?

In today’s digital era, businesses don’t just need **data analysis**.  
They also require **media** to support marketing, promotions, advertising, and branding.  

Most solutions address either analytics or media.  
**ADAM bridges the gap** by combining:  

- **Data Analysis** for insights  
- **Summarization & Recommendations** for actionable decision-making  
- **Media Generation** to turn insights into engaging content  

This allows businesses not only to **understand their data** but also to **act on it instantly** with media and strategy.  

All from one simple interface: **WhatsApp**.  

---

## 📂 Repository Structure
```
ADAM/
├── workflows/
│   └── ADAM.json                 # n8n workflow
│
├── docker/
│   ├── Dockerfile                 # Custom Docker image for n8n + ffmpeg
│   ├── docker-compose.yml         # Setup docker-compose (n8n + ngrok)
│   ├── setup_n8n.sh               # Script install & deploy in AWS EC2
│   └── .env.example               # Example file environment
│
├── docs/
│   ├── README.md                  # feature, tech stack, roadmap documentation
│   └── images/                    # ADAM demo screenshots
│       └── adam-demo.png
│
├── LICENSE                        
└── README.md                      # Project overview
```
This structure ensures that users can easily:
- Import and test workflows (`workflows/ADAM.json`)  
- Deploy quickly on AWS EC2 or other VPS (`docker/`)  
- Explore detailed documentation and demo (`docs/`)  

---

## 📈 Roadmap

- **Predictive Insights**: Forecast future trends and business performance.  
- **Data Visualization**: Deliver insights in interactive charts & dashboards. 
- **Multi-channel Support**: Extend integrations beyond WhatsApp to Telegram, Slack, and more.

---

## 🔗 Author

✨ Created by **Farras Azhary**  
- 📍 GitHub: [github.com/farrazhary](https://github.com/farrazhary)  
- 🔗 LinkedIn: [linkedin.com/in/farrasazhary](https://linkedin.com/in/farrasazhary)
