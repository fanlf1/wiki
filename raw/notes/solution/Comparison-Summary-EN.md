# Non-Invasive CGM Solutions Comparison: Ruixin vs MixoSense

**Date:** 2026-04-13
**Sources:** Technical documents from both vendors

---

## Executive Summary

| Aspect | Ruixin Micro (睿芯微) | MixoSense (多感科技) |
|--------|---------------------|---------------------|
| **Technology** | Hyperspectral CIS + Vessel Imaging | NIR Spectroscopy (780-2500nm) |
| **Stage** | Clinical Validation | Prototype Development |
| **MARD** | 8.39% | Not available |
| **Clinical Data** | N=30, 809 data points | Animal study only |
| **AI Model** | MoE Transformer | Not specified |
| **Target** | 2028-2029E Certification | 2026 Q1 Demo |

---

## 1. Core Technology Comparison

### Ruixin Micro
```
Hyperspectral CIS → Optical System → Vessel Imaging → AI Analysis
                                      ↓
                   "Smart Camera" - Direct blood glucose detection
```

### MixoSense
```
NIR Source → Tissue → Silicon Spectroscopy Chip → InGaAs Sensor → Algorithm
                                      ↓
                    O-H/C-H bond absorption detection (780-2500nm)
```

---

## 2. Key Differences

| Dimension | Ruixin | MixoSense |
|-----------|--------|-----------|
| **Detection** | "See" glucose (vessel imaging) | "Measure" glucose (spectral absorption) |
| **Data** | Image + Spectrum (high-dim) | Spectrum (112 channels) |
| **AI Dependency** | Strong (MoE Transformer) | Unknown |
| **Maturity** | Clinical validated | Prototype stage |
| **Manufacturing** | Not specified | 8" silicon photonics platform |

---

## 3. Clinical Validation

### Ruixin Micro (Peking University First Hospital)
- **ISO 15197 Zone A:** 96.66%
- **ISO 15197 Zone A+B:** 100%
- **MARD:** 8.39%
- **Sample:** N=30, 809 data points

### MixoSense
- ❌ No clinical data
- ✅ Animal study completed
- ⏳ Human trials not started

---

## 4. AI Architecture

### Ruixin - MoE Transformer
```
Unlabeled Blood Spectra (Large-scale)
              ↓
    Pre-trained Transformer Foundation Model
              ↓
    ┌─────────┬─────────┬─────────┐
    │ Glucose │ Lipid   │ Creatinine │ ...
    │ Trans.  │ Trans.  │ Trans.     │
    └─────────┴─────────┴─────────┘
```

### MixoSense
- Algorithm not specified
- Wavelength correlation completed (900-1750nm)
- Under development

---

## 5. Expansion Capabilities

### Ruixin Roadmap
- ✅ **Clinical:** Glucose monitoring
- 🔄 **R&D:** Lipid, creatinine, uric acid
- 🔬 **Exploration:** Tau protein (Alzheimer's), inflammation markers

### MixoSense
- ⏳ Glucose only (prototype stage)
- 🔧 Can extend to other spectral ranges (technical level)

---

## 6. IP & Business Model

### Ruixin
- **Patents:** 27 global patents
- **Coverage:** Hardware, algorithms, system, data management
- **Business Models:**
  1. B2B/B2B2C product sales
  2. Joint development
  3. Technology licensing + chip/module sales

### MixoSense
- **Patents:** Not disclosed
- **Business Model:** Not specified

---

## 7. SWOT Analysis

### Ruixin Micro
| Strengths | Weaknesses |
|-----------|------------|
| ✓ Clinical validation complete | ✗ High hardware cost (potentially) |
| ✓ Advanced AI (MoE Transformer) | ✗ Complex optical system |
| ✓ Direct vessel detection | ✗ High algorithm dependency |
| ✓ Multi-biomarker expansion | ✗ Long certification cycle (2028-29E) |

| Opportunities | Threats |
|---------------|----------|
| ○ Health management market | ○ Intense competition (Dexcom, Abbott) |
| ○ OTA upgrade capability | ◗ Regulatory hurdles |
| ○ Platform expansion | |

### MixoSense
| Strengths | Weaknesses |
|-----------|------------|
| ✓ Mature silicon photonics process | ✗ No clinical validation |
| ✓ Precise hardware design (DBR) | ✗ Algorithm not specified |
| ✓ Cost control potential | ✗ Early prototype stage |
| ✓ 8" manufacturing platform | ✗ Single application focus |

| Opportunities | Threats |
|---------------|----------|
| ○ Low-cost solution | ◗ Technology uncertainty |
| ◗ Mass production scalability | ◗ Market entry delay |
| ○ Other spectral ranges | ◗ Lack of IP protection |

---

## 8. Competitive Positioning

### Ruixin vs Mainstream CGM Products

| Product | Ruixin | Dexcom G6 | Abbott Libre 2 | Diamond D-Monitor |
|---------|--------|-----------|----------------|------------------|
| **MARD** | <10% | 9.00% | 9.30% | 11.3% |
| **Lifespan** | Years | <2 weeks | <2 weeks | Years |
| **Real-time** | ✓ | ✓ | ✗ | ✗ |
| **Invasive** | Non-invasive | Minimally invasive | Minimally invasive | Non-invasive |
| **Users** | T2D+Health | T1D | T2D | T2D |
| **Biomarkers** | Multi | Glucose | Glucose | Glucose+Cholesterol+UA |
| **Certification** | 2028-29E | 2018 | 2020 | Pre-Sub 2020 |

---

## 9. Investment Criteria

### Choose Ruixin if:
- ✅ Need mature product for quick commercialization
- ✅ Value AI algorithms and multi-biomarker expansion
- ✅ Can accept higher hardware cost
- ✅ Target market includes health management
- ✅ Timeline allows 2028+ certification

### Choose MixoSense if:
- ✅ Value silicon photonics and cost control
- ✅ Willing to take early-stage technology risk
- ✅ Have algorithm development capabilities
- ✅ Can accept longer development cycle
- ✅ Focus on single glucose application

### Collaboration Potential:
- Ruixin AI + MixoSense silicon chip
- MixoSense sensor as Ruixin backup hardware
- Technical complementarity in wavelength selection

---

## 10. Conclusion

**Ruixin Micro** represents a **software-defined hardware** approach:
- Complex AI algorithms compensate for hardware limitations
- Data flywheel for continuous optimization
- Multi-modal fusion for accuracy
- Platform for multi-application expansion

**MixoSense** represents a **hardware-first** approach:
- Carefully designed sensor hardware
- Process-driven manufacturing capability
- Cost control as primary goal
- Single application entry point

**Key Takeaway:** Ruixin is more mature but complex; MixoSense is simpler but unproven. The choice depends on risk tolerance, timeline, and strategic priorities.

---

## References

### Ruixin Micro
- Document: 广州睿芯微-无创血糖检测项目介绍_Jan 2026.pdf
- Clinical Partner: Peking University First Hospital (Endocrinology)

### MixoSense
- Document: 多感科技近红外多光谱介绍202601.pdf
- Partner: University (unspecified)
- Website: www.mixosense.com

### Industry Standards
- ISO 15197:2015 - Blood glucose monitoring accuracy
- Clarke Error Grid - Clinical error assessment
- NMPA Guidelines for CGM Registration

---

**Generated:** 2026-04-13
**Tools:** Claude Code + markitdown
**Sources:** Public company documents
