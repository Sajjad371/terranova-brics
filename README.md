# TerraNova BRICS: Geospatial AI Command Center
### Code for Communities 2.0 | Track 4: AgriN
> **An Enterprise-Grade Sovereign Digital Twin & Predictive Intelligence Platform for Regenerative Agriculture across BRICS Nations.**

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Python 3.10+](https://img.shields.io/badge/Python-3.10%2B-brightgreen.svg)](https://python.org)
[![Streamlit](https://img.shields.io/badge/Streamlit-1.35%2B-FF4B4B.svg)](https://streamlit.io)
[![Google Gemini 1.5 Pro](https://img.shields.io/badge/AI-Gemini_1.5_Pro-8E75C2.svg)](https://aistudio.google.com/)
[![Google Earth Engine](https://img.shields.io/badge/Earth_Engine-Sentinel--2-34A853.svg)](https://earthengine.google.com/)

---

## Quick Start: Run Locally in 60 Seconds

### 1. Clone & Enter Directory
```bash
git clone https://github.com/Sajjad371/terranova-brics.git
cd terranova-brics
```

### 2. Install Dependencies
```bash
pip install -r requirements.txt
```

### 3. Launch Command Center
```bash
streamlit run app.py
```
*The command center will immediately launch in your browser at `http://localhost:8501`.*

---

## Deployment Guide

### Option A: Free Streamlit Cloud (Judges Live URL)
1. Go to [share.streamlit.io](https://share.streamlit.io).
2. Connect your GitHub account and select repository: `Sajjad371/terranova-brics`.
3. Set the main file path to `app.py` and click **Deploy**.
4. In **App Settings -> Secrets**, add:
   ```toml
   GEMINI_API_KEY = "your-api-key-here"
   ```

### Option B: Google Cloud Run (Docker Container)
```bash
gcloud builds submit --config cloudbuild.yaml
```

---

## Codebase Architecture

```
terranova-brics/
├── app.py                # Google Material 3 Command Console & Geospatial HUD
├── engine.py             # Multimodal Geospatial Fusion, 3-Yr Digital Twin & Carbon MRV
├── gee_client.py         # Google Earth Engine & NASA POWER Agro-Climatology ingestion
├── schema.sql            # BigQuery / PostgreSQL schema for enterprise agricultural records
├── WHITE_PAPER.md        # Technical White Paper, Architecture Diagram & Video Script
├── requirements.txt      # Production dependencies
├── Dockerfile            # Container configuration for Google Cloud Run
├── cloudbuild.yaml       # Google Cloud Build CI/CD pipeline
└── assets/               # High-resolution photographic research specimens
```

---

## Key Technical Features for Judges

1. **Multimodal Geospatial Fusion:** Combines 5-year Sentinel-2 multi-spectral time-series (B4, B8, B11) with in-situ capacitive soil sensors and macro foliar photography.
2. **Sovereign Gateway (Federated Learning):** Simulates Google Vertex AI homomorphic gradient aggregation across Brazil (Embrapa), Russia (Vavilov), India (ICAR), China (CAAS), and South Africa (ARC)—training shared AI without exposing sensitive national soil data.
3. **3-Year Predictive Soil Digital Twin:** Models the transition curve from conventional chemical inputs to regenerative agriculture, demonstrating how soil carbon climbs while buffering the initial yield dip.
4. **CGIAR Global Pest Matching:** Cross-references plant disease symptoms against the international CGIAR pest database to prescribe 100% biological/organic remedies (zero synthetic petrochemicals).
5. **Satellite Carbon Credit Oracle:** Utilizes IPCC Tier 2 volumetric soil stock equations and Verra VM0042 buffer logic to calculate direct voluntary carbon market dividends for farmers.
6. **Mobile Field Agent View:** Offline-ready, lightweight interface translated into all 5 official BRICS languages (English, Hindi, Portuguese, Russian, Mandarin).

---

## Documentation
- Complete System Architecture & Pitch Script: [WHITE_PAPER.md](WHITE_PAPER.md)
- Database Definition: [schema.sql](schema.sql)
