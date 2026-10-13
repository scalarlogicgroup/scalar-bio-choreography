# scalar-bio-choreography

> **Status, October 2026.** This repository holds deployment scaffolding only. It doesn't contain the BSC Engine source code, and the current engine, longitudinal simulator and validation harness are not publicly released. No open-source license has been granted for this repository.

## About the BSC Engine

The BSC Engine is a Gaussian-process change detector for serial ctDNA. It is research software at roughly TRL 3–4, tested on simulated patients only. It hasn't been independently audited and isn't a medical device.

- **Corrected preprint (v8):** [doi.org/10.5281/zenodo.23348706](https://doi.org/10.5281/zenodo.23348706)
- **Sample data (500 simulated patients, observations only):** [huggingface.co/datasets/scalarlogicgroup/bsc-simulated-nsclc-sample](https://huggingface.co/datasets/scalarlogicgroup/bsc-simulated-nsclc-sample)
- **Acquisition and licensing inquiries:** info@scalarlogicgroup.com

Figures published earlier for this project (a 22-day lead, a 41% compute reduction, < 45 ms latency, 100% uptime and an 84% click reduction) have been withdrawn because they were not measured. In a 2026 developer self-assessment on simulated patients, the engine showed a median 42-day lead over imaging (3.5–4.5% false alarms), 40–42% compute saving from gating, p99 latency under 0.4 ms, and no failed requests in a short 4× load test. Clinician click reduction has not been measured. See the preprint correction notice.

## The BSC Engine is available for acquisition

Scalar Logic Group, LLC is offering all rights in the BSC Engine for outright sale to a single buyer.

**What the buyer receives**

- The full source code of the BSC Engine v2, a Gaussian-process change detector for serial ctDNA, including the confidence gate and calibration.
- The longitudinal patient simulator, with held-out ground truth.
- The validation harness, frozen pass criteria, and the results and reports from the reference runs.
- The REST API, Docker deployment files and data schemas.
- Documentation: the validation manual, the developer self-assessment and the evaluation reports.
- The names "BSC Engine" and "Bio-Stochastic Continuum".

**Where it stands**

The engine is sold as is. It is research software at roughly technology readiness level 3–4.

- **Simulated patients only.** It has been tested only on simulated patients, in a developer self-assessment, and has not been independently audited.
- **Early-warning result.** In that assessment it flagged rising ctDNA a median of 42 days before imaging progression, with 3.5–4.5% false alarms. This result depends on an assay noise profile that hasn't yet been confirmed with vendor data.
- **Not a medical device.** It has no regulatory clearance.
- **No patents.** No patents have been filed. Earlier versions of the method are published on Zenodo.
- **Licenses already granted stay in place.** Material previously posted on Hugging Face remains under the Apache 2.0 license it was published with. The v2 engine has never been publicly released.

**How to inquire**

Write to info@scalarlogicgroup.com. Qualified buyers can review the code and data room under a non-disclosure agreement.

## Contact

Scalar Logic Group, LLC (developer: David Mincey) — info@scalarlogicgroup.com
