**Comprehensive Data Management Process**  
*From collection to deletion on Google Cloud Platform*

## **Google Cloud Project Creation Process**

* **GCP Project Initiation**: The Engineering Lead will create a new GCP project, exploring freely available SKUs to architect the cloud backend. The Product Manager will concurrently estimate project/feature usage and associated costs.  
     
* **JIRA Request for Billing Enablement**: A JIRA ticket (Project: DGCLOUD) will be raised to request billing enablement of the project created above, including the following information:  
  * **Annual GCP Spend Estimate**: A detailed estimate of the annual GCP spend, with a clear rationale justifying the projected costs.  
  * **Project Lifetime**: A defined project lifespan, specifying the intended duration of the project.  
  * **Data Description**: A comprehensive description of the data to be hosted, encompassing:  
    * **PII Identification and Anonymization**: Explicit identification of any Personally Identifiable Information (PII) and specification of its anonymization status. This includes clarifying whether PII will be stored in its original form, anonymized using techniques like check-in anonymization, or hashed using SHA256.  
    * **Data Retention Policy**: A clearly defined data retention policy, along with a justification for the chosen retention period.

* **Approvals:** The request requires sequential approvals from:  
  * The Line Manager.  
    * The [Security Team](#contact-details) (mandatory if data is to be stored in its original, un-anonymized form).  
    * The [Billing Administrators](#contact-details) (to approve the estimated spend; securing additional budget is the Product Manager's responsibility for significant spending estimates).  
    * The [Cloud Analytics Team](#contact-details) (final approval for billing).

* **Spend Tracking and Management:** The requestor and their line manager are responsible for diligently tracking monthly GCP spend. Any overspending must be immediately addressed, and projected increases in spending must be proactively communicated to the billing administrators, ensuring sufficient budget allocation. 


## **Access Control Process**

This section covers how access is managed for several types of data.

### **Check-in data**

* **Access to Check-in Data:** Only Motorola employees with official Motorola Google accounts can access the processed check-in data residing in Big Query (BQ) tables.   
  * GCP project owners are suggested to use the Security Command Center (SCC) dashboard of their projects to proactively identify and immediately remove any unauthorized users.

       
* **Access Request Process for Anonymized Data:** Motorola employees requiring access to anonymized   check-in data and aggregated reports (maintained by the Cloud Analytics Team) must utilize the [JIRA ticket](https://idart.mot.com/browse/SVCMA-6415) (in SVCMA project).  
  * Upon the receipt of approval from the line manager, the requester will be added to the *bigqueryusers* group and CR status gets updated.  
  * Following the data handling best practices is crucial for reliable and secure data management.   
    * This sensitization will also be reinforced during the Cloud Analytics Team's bi-annual lunch-and-learn sessions.  
  * Group membership grants access to Big Feed and Moto Insights tools.

       
* **Group Membership Review and Removal:** The Cloud Analytics Team will quarterly review the *bigqueryusers* group membership, removing individuals who:  
  * Have left Motorola.  
  * Have not accessed any BQ tables within the previous six months.  
  * Have transitioned to roles no longer requiring access (requiring manager email confirmation for removal).

       
     

### **Activation data**

* **Accessing Activation Data**: Motorola Employees requiring device activation and login data access must adhere to the following procedures:  
  * **IMEI Data Access:** Access to activation and login data, which are in clear, is managed via the IMEI-data group. To gain access, users must submit a SVCMA Change Request (CR) detailing:  
    * The business purpose and required duration of access.  
    * Manager and [Security team](#contact-details) approval.  
    * If the security leader identifies a significant privacy risk, they will direct the requester to obtain approval from Lenovo's Privacy Working Group.   
    * Upon approval, the [Cloud Analytics team](#contact-details) will grant access to the activation MI3 dashboard.   
    * Quarterly reviews will assess access patterns, and accounts inactive for six months will be deactivated.

### **IOT Data**

* Access to IOT data residing in the *metrics-collector-foundation* GCP project, requires approval from the data owners hosting the IOT data. [Data owners](#contact-details) are the engineering leads of the respective companion app.  
  * This approval process is managed through a change request (CR):  
    * Requestors must submit a SVCMA JIRA CR, outlining the business justification for access and securing their line manager's approval.  
    * Data owners must practice due diligence, granting only the necessary level of access.  
      * For example, a request to query a specific dataset should only grant view access to that dataset, not edit access or broader project-level access.

           
  * To maintain efficient business operations, data owners must approve or deny access requests (including reasons for denial) within three business days.

     

### 

### **Supply Chain, Sales, and Other Business Data**

* **Request Access**: Consult Zhe Li6 \<[zli6@lenovo.com](mailto:zli6@lenovo.com)\> for detailed access request instructions and submit a JIRA request (CR) within the MBGDS project.  
* **Justify Request**: Clearly articulate the business rationale for requiring data access in the JIRA CR description.  
* **Manager Approval**: Secure your manager's approval/sign-off on the JIRA CR.  
* **Access Granted By**: Mitul Rao's team will grant access after assessing your request.

   

### **Data managed by other teams**

* Access to Big Query (BQ) data, including rollups and feature-specific data, requires approval from the GCP project owners hosting the data.   
  * This approval process is managed through a change request (CR):  
    * Data owners may use either the SVCMA JIRA project or their own JIRA project to handle access request CRs.  
    * Requestors must submit a CR to the designated JIRA project, outlining the business justification for access and securing their line manager's approval.  
    * If the data is considered sensitive ("in the clear"), approval from the [Security and Privacy team](#contact-details) is also mandatory.  
    * Data owners must practice due diligence, granting only the necessary level of access.  
      * For example, a request to query a specific dataset, should only grant view access to that dataset, not edit access or broader project-level access.

  * To maintain efficient business operations, data owners must approve or deny access requests (including reasons for denial) within three business days.

       
* Some projects store data in Cloud SQL, Datastore, or Cloud Storage buckets. Access to these data stores is restricted to the respective GCP project owners/editors, primarily for cloud software development.  
  * Data owners should avoid granting access to these non-BQ data storage locations to non-engineering team members.

     

### **Access for Lenovo Employees**

* The access request process for Lenovo engineers mirrors the above; however, they must also obtain a Motorola Google account before accessing the data. 

   

### **Access for 3rd party service providers**

* Access to GCP projects by external entities is occasionally necessary, typically arising from partnerships for development or integration work with third-party companies.  
  * GCP project owners are the senior team members who would have entered into a contract with a third-party company.  
  * Project owners bear the responsibility for ensuring Non-Disclosure Agreements (NDAs) and Unified Security and Data Privacy Addendums are in place and for collaborating with the security team to manage external access.  
  * Prior to granting any third-party access, project owners must obtain written consent from the [Security team](#contact-details)  
  * If the security leader identifies a significant privacy risk, they will direct the requester to obtain approval from Lenovo's Privacy Working Group.  
  * Data owners are required to promptly revoke all external access upon contract termination.

     

### **Regular GCP Access Review** 

* All GCP project owners must regularly review project access permissions. Navigate to your [GCP project homepage](https://ds-datacontainer-prod.appspot.com/#/projectsowned), then select "Security," followed by "Vulnerabilities."

     
  * **Contractual Access Management:** This section displays non-Moto users with access. Periodically reconcile these users against your project's contracts, promptly removing access for those whose contracts have expired.

  * **Modify default firewall in GCP:** Securing your Google Compute Engine instances involves thoughtfully configuring your firewall. Modifying the defaults, particularly restricting the 0.0.0.0/0 rule, is a key step. Explore the firewall [documentation](https://docs.google.com/document/d/1pldhDSCAT0JF9k9EOaee-dlexANJE6KZnO-Vkjw4tKI/edit?tab=t.0) for best practices

  * **Inactive User Removal:** This section also identifies users who have left the company. Remove their access immediately.

  * **Moto Monitor Review (Quarterly)**: Quarterly, review the [Moto Monitor](https://moto-monitor.appspot.com/) to identify core IDs querying your tables. Remove any core IDs that have not performed a query in the past 180 days (about 6 months).

  * **Bi-annual Access Review Survey**: A biannual survey will require all GCP project owners to confirm completion of the above access review steps. 

## **Data Anonymization Process**

**Check-in Data**: All check-in data undergoes automatic PII identification and anonymization within the check-in pipeline, ensuring Instrumentation Review Board (IRB) compliance.  
   
**IOT Data**: Data acquired from IOT devices requires PII identification and anonymization by the data-owning team as part of the Privacy Design Document (PDD) process. The security team will review the anonymization methods employed prior to the PDD being completed to ensure that proper anonymization techniques have been applied.  
 

1. **Anonymization Techniques**: Data owners may utilize one or more of the following anonymization methods:  
   1. **SHA256 Hashing**: A deterministic and readily accessible method available in most programming languages.  
   2. **Check-in Anonymization**: The Big Feed tool provides a utility to convert PIIs into check-in anonymized values, facilitating easy integration with check-in data for advanced analytics.  
   3. **Other Techniques**: Alternative anonymization techniques may be employed after consultation with the security teams. Security team’s approval is mandatory to employ any new anonymization techniques.  
   4. **PII in Clear Text**: Retention of PII in its original, un-anonymized form requires a justified business need, approved by both the [security and privacy teams](#contact-details). 

**Data from Other Sources**: Data acquired from external sources (e.g., SAP, Salesforce, Oracle based systems) requires PII identification and anonymization by the data-owning team as part of the Privacy Design Document (PDD) process. The security team will review the anonymization methods employed prior to the PDD being completed to ensure that proper anonymization techniques have been applied..  
 

2. **Anonymization Techniques**: Data owners may utilize one or more of the following anonymization methods:  
   1. **SHA256 Hashing**: A deterministic and readily accessible method available in most programming languages.  
   2. **Check-in Anonymization**: The Big Feed tool provides a utility to convert PIIs into check-in anonymized values, facilitating easy integration with check-in data for advanced analytics.  
   3. **Other Techniques**: Alternative anonymization techniques may be employed after consultation with the [security team](#contact-details). Security team's approval is mandatory to employ any new anonymization techniques.  
   4. **PII in Clear Text**: Retention of PII in its original, un-anonymized form requires a justified business need, approved by both the [security and privacy teams](#contact-details).   
      1. Stringent access controls must be implemented on tables containing such data, a responsibility of the GCP project owner.

## **Ad-hoc analytics \- Data anonymization and de-anonymization**

   
Entire org is encouraged to do all their analytics on anonymized data to the best extent possible as the entire device check-in is stored in anonymized form.  
However, situations requiring analysis of specific devices (identified by IMEI/barcode) may arise, such as:  
 

1. Investigating carrier-returned devices.  
2. Troubleshooting issues with customer care/service centers.  
3. Fulfilling warranty obligations.

    

### **Anonymization**

Only a handful of employees are allowed to raise the request to anonymize the device identifiers.  
 

**To access the IDLookup tool and anonymize data, engineers must:**  
 

1. **Obtain Security Team Approval**: Clearly articulate their need to anonymize data to the [security team](#contact-details), justifying the request and receiving explicit email authorization.   
      
2. **Secure Managerial Authorization**: Obtain written approval from their line manager before proceeding.  
      
3. **Submit a JIRA Service Request**: With both security and managerial approvals, submit a JIRA DGCLOUD ticket to request access.  
      
4. **Conditional Access Grant**: The Cloud Analytics team will provide access to the IDLookup tool. This access is contingent upon continued employment and responsible tool usage.  
      
5. **Mandatory Logging**: Each use of the IDLookup tool requires a complete and accurate record of the reason for anonymization for each batch of device identifiers. Failure to comply will result in escalation for the engineer's manager. Repeated non-compliance will be reported to the [security team](#contact-details), leading to immediate access revocation.  
      
6. **Strict Prohibition on Parallel Tables**: Creating any parallel lookup table mapping clear and anonymized Personally Identifiable Information (PII) is forbidden and will be reported directly to the [security team](#contact-details) for disciplinary action.  
      
7. **Access Removal Protocol**: Upon an engineer's departure, either the engineer or their line manager is responsible for requesting the immediate removal of their IDLookup tool access from the Cloud Analytics team.  
      
8. **Quarterly review:** The Cloud Analytics team will conduct quarterly reviews to monitor ID lookup tool usage and ensure compliance with established rules. Any violations will be addressed proactively.

    

### **De-anonymization** 

Sometimes, product engineering teams will observe a bunch of anonymized PIIs that are malfunctioning and to resolve these, de-anonymization   may be necessary. However, this requires a formal process:  
 

1. **Requesting De-anonymization**: A JIRA ticket must be submitted to the DGCLOUD project, detailing the specific problem and its impact on troubleshooting. The ticket requires approval from the engineer's line manager.  
     
2. **Security team approval**: Security approval is only required for requests that are not technical in nature or that contain potentially very personalized information.    
      
3. **Cloud analytics team Review and Approval**: The Cloud analytics team will then review the request and, if approved, facilitate the de-anonymization process to provide the necessary clear data.  
      
4. **Manual Process**: It is crucial to understand that de-anonymization is a manual, case-by-case process managed through DGCLOUD change requests (CRs). There is no automated tool for this function.  
      
5. **Note**: We will not provide the link between raw and anonymized values.

This structured approach ensures responsible handling of sensitive data while allowing for effective problem-solving.

## **Data Retention Process**

### **Activation and Check-in**

Processed activation records are retained forever, as there is a strong business need to know,

1. how many of our old models are still active,   
2. when they go out of warranty and   
3. which models can be considered for monetization initiatives.

    

For check-in, below are the retention timelines.

| Data type | Retention |
| :---: | :---: |
| Event raw tables | 30 days |
| Event foundation tables | 30 days |
| Event foundation table (1% data) | 26 months |
| Analytics data tables | Rolling 365 days \+ one day per month going back till 2019 |

   
   
Data collected from PRC is an exception to the above retention periods.

1. Raw unprocessed data is saved within PRC servers for one full year and deleted right after.  
    

### **Retention process for other datasets**

The following are some of the best practices for efficient data retention and cost management.

1. **Data Retention Policy**: Each data owner is responsible for defining a clear retention period for all data stored within Google Cloud Platform (GCP). This policy must be documented.  
      
2. **Cost Optimization**: Remember that longer retention periods directly impact GCP project costs. Carefully consider the necessary retention duration to minimize expenses.  
      
3. **Permanent Data Retention**: For datasets intended for indefinite retention, this must be explicitly stated in the Privacy Design Document (PDD) and approved by the data [security and privacy teams](#contact-details).  
      
4. **Automated Data Cleanup**: Utilize Big Query’s dataset table expiry feature to automate the removal of outdated data, ensuring efficient storage management.  
      
5. **Temporary Data Management**: Many engineers do not consistently delete temporary tables after use.  
   1. To address this, establish a dedicated "temporary" dataset within your GCP project. All team members should store temporary tables within this dataset, which should have a 7-day Big Query retention policy for automatic cleanup.

## **Data Deletion Process**

To ensure easy handling of data deletion requests from end consumers, every data owner must design their data analytics and storage processes accordingly.   
 

1. Data deletion requests may originate from within the application or via the One Trust portal.   
2. The Privacy Design Documentation (PDD) must detail the complete data deletion process triggered by a consumer request, and this process requires approval from the data [privacy and security team](#contact-details).   
3. All user-level or barcode-level data must be deleted or anonymized to the point where it is impossible to trace back to the individual user.   
4. If the data can be traced back to individual users, then the data owners must ensure,  
   1. For data residing in Big Query (BQ), utilize BQ-DML to delete relevant records throughout the data retention window.   
   2. If data is stored elsewhere (e.g., Cloud SQL, Datastore, Cloud Storage Buckets), data must be deleted within a reasonable timeframe following the consumer's request.

       

## **Data Owner’s Responsibility**

Data owners are also Google Cloud Project owners and are entirely responsible for data security and privacy compliance. This section summarizes key data owner responsibilities, building upon information from previous sections. To ensure compliance, data owners should:  
 

1. **Understand Google Cloud [security, privacy](https://cloud.google.com/architecture/framework/security/shared-responsibility-shared-fate)**[, and compliance](https://cloud.google.com/architecture/framework/security/shared-responsibility-shared-fate) best practices.   
      
2. **Implement a strict need-to-know data access policy**. Share data only with individuals who require it for legitimate business purposes.  
      
3. **Grant granular permissions**. Avoid assigning broad permissions (like Project Editor or Viewer). Instead, grant only the specific access required by each requestor.

 

1. All access requests must be documented via a JIRA Change Request (CR) detailing the requestor's identity and the justification for access.  
   2. For sensitive data, involve the [Security team](#contact-details) in the access approval process.

    

4. **Manage data costs effectively**. Collaborating with the product leads to estimate the ongoing costs of data collection, processing, and storage. Ensure that these costs remain within the budget established during initial planning.  
      
5. **Maintain clear and descriptive service accounts**. Service account names and descriptions should clearly indicate their purpose and facilitate tracking.  
      
6. **Define and enforce data retention policies**. Work with the product manager to determine retention policies for all data tables (in Big Query, Datastore, GCS buckets, etc.). Leverage GCP's built-in features to automatically delete data once it has outlived its utility or the predefined retention period.  
      
7. **Participate in data security and privacy surveys**. Respond promptly to all biannual surveys on data security and privacy.  
      
8. **Regularly review and revoke access**. Remove permissions for users who have left the company or changed teams.

## **Data User’s Responsibility**

### **Getting Access**  

To access anonymized check-in data:  
 

1. Submit a JIRA request in the DGCLOUD project to be added to the *bigqueryusers* Google Group. Include a clear business justification and obtain your manager's approval. Access will be granted within two business days.

   
Access to those datasets that contain check-in raw data:  
 

1. Clearly articulate the business need and the required access duration.  
2. Submit a JIRA ticket in the DGCLOUD project detailing this information.  
3. Obtain your reporting manager's approval on the JIRA ticket. This allows the data owner to grant temporary access and revoke it upon task completion.

   
To anonymize Personally Identifiable Information (PII) \[IMEI and barcode\] using the IDLookup Tool:  
 

1. Submit a JIRA ticket in the DGCLOUD project requesting access, clearly stating the business need.  
2. Obtain your manager's approval on the JIRA ticket.  
3. Obtain approval from the [Security Team](#contact-details) via email. Access will then be granted.  
4. Meticulously document the reason for every use of the IDLookup Tool in the justification section; failure to do so will result in access revocation.  
    

To de-anonymize the anonymized values:  
 

1. Submit a separate JIRA ticket for each de-anonymization request.  
2. Provide a clear business justification and obtain your manager's approval.  
3. Obtain approval from the [Security Team](#contact-details) via email.  
4. The Data Platform team will respond within two business days of receiving the request.

 

### 

### **How to Query**

To improve Big Query data handling and ensure efficient resource utilization, please adhere to the following guidelines:  
   
**Big Query Training and Best Practices:**

1. Participate in the twice-yearly lunch-and-learn sessions led by Mark Denzel. These sessions cover crucial topics such as new Big Query features, optimization techniques for faster query execution and cost reduction, effective Big Feed usage, and seamless Power BI integration.  
   

**Querying and Data Handling:**

1. Avoid using scheduled queries or embedding queries directly within Excel spreadsheets.   
2. When saving analysis results to Google Sheets or Excel, promptly delete these files after completing your work.  
3. Never forward data files to unauthorized individuals. Unauthorized sharing will result in accountability measures.  
   

**Access Management:**

1. Your Big Query access will be revoked if you have not executed any queries in the past six months. This will be reviewed every 6 months.  
2. If your role changes and you no longer require access to specific datasets, submit a JIRA CR in the DGCLOUD project to have your access revoked. If you are leaving the company, your manager must submit this request on your behalf.

     

## **Survey questionnaire:**

* The [Data Portal](https://data.motorola.com/#/projectsowned) will include a page allowing data owners to easily identify their GCP projects. A half-yearly survey will be sent to GCP project owners to verify the following aspects, indicated in the questionnaire below. Non compliance on the below aspects will get escalated to the line manager. **Prolonged failure to stay compliant will result in**   
  * **Disabling the billing to GCP projects.**   
  * **Deletion of unbilled, inactive, non-complaint projects**.

   
MBG has a bi-annual certification process for those Google Cloud Platform users who own a project on the Google Cloud. This certification process is to ensure :  
1\) MBG maintains highest level of security and privacy governance of the consumer data hosted on the Google Cloud  
2\) Everyone follow's MBG Data Management Policy

**Question**: 

1. **Are all GCP projects you own still relevant to the business and, if not, should they be shut down as soon as possible to avoid negative cost impacts and data privacy risks associated with unattended projects.**  
   1. Yes.   
   2. No 

   *( If No, then you need to address this and send an email confirmation \[copying your line manager\] to cloudanalytics@motorola.com within 30 days after receiving this survey)*

   

2. **Can you ensure the data in your Big Query tables is accurately classified as PII or non-PII, and that all PII is anonymized, given that un-anonymized consumer data violates global privacy laws?**  
   1. Yes.   
   2. No 

   *( If No, then you need to address this and send an email confirmation \[copying your line manager\] to cloudanalytics@motorola.com within 30 days after receiving this survey)*

   

3. **Can you ensure that all users in your GCP projects are granted only the minimum necessary access privileges to perform their duties, minimizing the risk of data security breaches due to excessive permissions?**  
   1. Yes  
   2. No

   *(If No, then you need to address this and send an email confirmation \[copying your line manager\] to cloudanalytics@motorola.com within 30 days after receiving this survey.)*

   

4. **Could you please ensure that access is appropriately revoked for all users who no longer require it in the GCP projects you own, as unwarranted access can compromise data security?**  
   1. Yes  
   2. No 

   *(If No, then you need to address this and send an email confirmation to cloudanalytics@motorola.com within 30 days after receiving this survey)*

   

5. **Have all service accounts used within the GCP projects you own been reviewed and their permissions minimized, ensuring that excessive permissions, which can pose a data security risk due to the difficulty in tracking service account usage, are addressed?**  
   1. Yes  
   2. No 

   *(If No, then you need to address this and send an email confirmation to cloudanalytics@motorola.com within 30 days after receiving this survey)*

   

6. **Can you ensure your GCP projects adhere to data retention policies, including both retention duration and secure deletion upon data end-of-life, to avoid negative cost impacts and privacy violations caused by non-compliant data?**  
   1. Yes  
   2. No 

   *(If No, then you need to address this and send an email confirmation to cloudanalytics@motorola.com within 30 days after receiving this survey. If you are not sure how to address this aspect, please reach out to the Privacy team)*

   

7. **Did you review and act on Google Cloud's security alerts and vulnerability reports for the GCP projects you own, ensuring no unattended security vulnerabilities compromise data security?**  
   1. Yes  
   2. No 

   *(If No, then you need to address this and send an email confirmation to cloudanalytics@motorola.com within 30 days after receiving this survey.)*

8. **Do you like to continue to have owner privileges to the GCP project(s) listed in your name?**  
   1. Yes  
   2. No 

   *(If No, please contact another owner to request a reduction in your permissions. If you are the sole owner and no longer need the project, disable the project and send an email confirmation to cloudanalytics@motorola.com within 30 days after receiving this survey)*

If the survey recipients do not submit their responses within 30 days of receiving this survey, it will be treated as non-compliance and escalated to the respective managers, the data audit team, security and privacy teams.

## 

## Contact Details {#contact-details}

Security team: 

1. John Clark \[ [johnclark@motorola.com](mailto:johnclark@motorola.com) \]  
   

Legal & Privacy: 

1. Joan Zhang \[ [zhangqiong2@lenovo.com](mailto:zhangqiong2@lenovo.com) \]  
   

Billing Administrator:

1. R\&D:   
   1. Prasad A G \[ [prasadag@motorola.com](mailto:prasadag@motorola.com) \]  
   2. Paul Benson \[ [pbenson@motorola.com](mailto:pbenson@motorola.com) \]  
2. IT:   
   1. Mitul Rao \[ [mitulrao@motorola.com](mailto:mitulrao@motorola.com) \]  
   2. Zhe Li \[ [zli6@motorola.com](mailto:zli6@lenovo.com) \]  
3. AI:  
   1. Prasad A G \[ [prasadag@motorola.com](mailto:prasadag@motorola.com) \]

   

Cloud Analytics team: \[cloudanalytics@motorola.com\]

1. Prasad A G \[ [prasadag@motorola.com](mailto:prasadag@motorola.com) \]  
2. Mark Denzel \[ [markdenzel@motorola.com](mailto:markdenzel@motorola.com) \]  
3. Paul Benson \[ [pbenson@motorola.com](mailto:pbenson@motorola.com)  \]  
4. Praveen Kumar S G \[ [nwpr67@motorola.com](mailto:nwpr67@motorola.com) \]

Engineering leads:

1. Moto Buds and Moto Tag:   
   1. Satya Rout \[ [satya@motorola.com](mailto:satya@motorola.com) \]

