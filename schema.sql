-- ====================================================================
-- TerraNova BRICS: Sovereign Digital Twin & Regenerative Agro-Schema
-- Compatible with Google BigQuery, PostgreSQL (PostGIS), & AgGateway DPG
-- ====================================================================

-- 1. Sovereign Nodes & Institutional Gateways
CREATE TABLE IF NOT EXISTS sovereign_nodes (
    node_id VARCHAR(32) PRIMARY KEY,
    country_iso VARCHAR(3) NOT NULL,
    country_name VARCHAR(64) NOT NULL,
    lead_institution VARCHAR(128) NOT NULL,
    endpoint_uri VARCHAR(256) NOT NULL,
    federated_public_key TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. Farm Assets & Sovereign Digital Twins
CREATE TABLE IF NOT EXISTS farm_digital_twins (
    farm_id VARCHAR(64) PRIMARY KEY,
    node_id VARCHAR(32) REFERENCES sovereign_nodes(node_id),
    farmer_pseudo_id VARCHAR(64) NOT NULL, -- Anonymized for privacy
    farm_name VARCHAR(128),
    latitude NUMERIC(9, 6) NOT NULL,
    longitude NUMERIC(9, 6) NOT NULL,
    total_area_hectares NUMERIC(10, 2) NOT NULL,
    soil_classification VARCHAR(64), -- e.g., Vertisol, Chernozem, Oxisol
    primary_crops TEXT[], -- Array of active cultivars
    baseline_soc_pct NUMERIC(4, 2) NOT NULL,
    last_satellite_sync TIMESTAMP WITH TIME ZONE
);

-- 3. High-Frequency Multi-Spectral & Soil Telemetry (Time-Series)
CREATE TABLE IF NOT EXISTS soil_telemetry_timeseries (
    telemetry_id BIGSERIAL PRIMARY KEY,
    farm_id VARCHAR(64) REFERENCES farm_digital_twins(farm_id),
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    ndvi_sentinel2 NUMERIC(5, 3),
    evi_canopy NUMERIC(5, 3),
    ndwi_moisture NUMERIC(5, 3),
    soil_ph NUMERIC(4, 2),
    nitrogen_ppm NUMERIC(6, 2),
    phosphorus_ppm NUMERIC(6, 2),
    potassium_ppm NUMERIC(6, 2),
    bulk_density_g_cm3 NUMERIC(4, 2) DEFAULT 1.35,
    surface_temp_celsius NUMERIC(5, 2),
    volumetric_water_pct NUMERIC(5, 2),
    source_platform VARCHAR(64) DEFAULT 'Sentinel-2_MSI_L2A'
);

-- 4. Gemini 1.5 Pro Multimodal Regenerative Prescriptions
CREATE TABLE IF NOT EXISTS regenerative_prescriptions (
    prescription_id VARCHAR(64) PRIMARY KEY,
    farm_id VARCHAR(64) REFERENCES farm_digital_twins(farm_id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    cgiar_pest_reference VARCHAR(64),
    severity_tier VARCHAR(32), -- Mild, Moderate, Critical
    organic_cure_protocol TEXT NOT NULL,
    companion_planting_strategy TEXT NOT NULL,
    brics_bilateral_source VARCHAR(64), -- e.g., 'Brazil-Embrapa'
    model_inference_version VARCHAR(64) DEFAULT 'gemini-1.5-pro'
);

-- 5. Satellite-Verified Carbon Credit Ledger (IPCC Tier 2 MRV)
CREATE TABLE IF NOT EXISTS carbon_credit_ledger (
    credit_batch_id VARCHAR(64) PRIMARY KEY,
    farm_id VARCHAR(64) REFERENCES farm_digital_twins(farm_id),
    verification_date DATE NOT NULL,
    delta_soc_pct NUMERIC(4, 2) NOT NULL,
    co2e_sequestered_tonnes NUMERIC(12, 2) NOT NULL,
    buffer_pool_tonnes NUMERIC(10, 2) NOT NULL,
    net_tradable_credits NUMERIC(12, 2) NOT NULL,
    clearing_price_usd NUMERIC(8, 2) NOT NULL,
    gross_disbursement_usd NUMERIC(12, 2) NOT NULL,
    registry_standard VARCHAR(64) DEFAULT 'BRICS_AgriN_Sovereign_Oracle',
    on_chain_proof_hash VARCHAR(128)
);

-- 6. Vertex AI Federated Learning Model Checkpoints
CREATE TABLE IF NOT EXISTS federated_model_checkpoints (
    round_id INTEGER PRIMARY KEY,
    aggregated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    global_model_version VARCHAR(64) NOT NULL,
    participating_nodes TEXT[],
    homomorphic_gradient_hash VARCHAR(128) NOT NULL,
    validation_accuracy NUMERIC(5, 2) NOT NULL,
    federated_loss NUMERIC(6, 4) NOT NULL
);

-- Indexing for microsecond query performance in BigQuery / PostgreSQL
CREATE INDEX IF NOT EXISTS idx_telemetry_farm_time ON soil_telemetry_timeseries (farm_id, timestamp DESC);
CREATE INDEX IF NOT EXISTS idx_carbon_farm ON carbon_credit_ledger (farm_id);
