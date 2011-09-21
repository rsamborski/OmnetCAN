/*
 * ccn.h
 *
 *  Created on: 2011-07-24
 *      Author: remik
 */

#ifndef CCN_H_
#define CCN_H_

/* CCN Interest related stuff */
#define CCN_AOK_CS      0x1     // Answer from content store
#define CCN_AOK_NEW     0x2     // OK to produce new content
#define CCN_AOK_DEFAULT (CCN_AOK_CS | CCN_AOK_NEW)
#define CCN_AOK_STALE   0x4     // OK to answer with stale data
#define CCN_AOK_EXPIRE  0x10    // Mark as stale (must have Scope 0)

enum ccn_parsed_interest_offsetid {
    CCN_PI_B_Name,
    CCN_PI_B_Component0,
    CCN_PI_B_LastPrefixComponent,
    CCN_PI_E_LastPrefixComponent,
    CCN_PI_E_ComponentLast = CCN_PI_E_LastPrefixComponent,
    CCN_PI_E_Name,
    CCN_PI_B_MinSuffixComponents,
    CCN_PI_E_MinSuffixComponents,
    CCN_PI_B_MaxSuffixComponents,
    CCN_PI_E_MaxSuffixComponents,
    CCN_PI_B_PublisherID, // XXX - rename
    CCN_PI_B_PublisherIDKeyDigest,
    CCN_PI_E_PublisherIDKeyDigest,
    CCN_PI_E_PublisherID,
    CCN_PI_B_Exclude,
    CCN_PI_E_Exclude,
    CCN_PI_B_ChildSelector,
    CCN_PI_E_ChildSelector,
    CCN_PI_B_AnswerOriginKind,
    CCN_PI_E_AnswerOriginKind,
    CCN_PI_B_Scope,
    CCN_PI_E_Scope,
    CCN_PI_B_InterestLifetime,
    CCN_PI_E_InterestLifetime,
    CCN_PI_B_Nonce,
    CCN_PI_E_Nonce,
    CCN_PI_B_OTHER,
    CCN_PI_E_OTHER,
    CCN_PI_E	// 28
};


/* CCN Content Object related stuff */

enum ccn_parsed_content_object_offsetid {
    CCN_PCO_B_Signature,
    CCN_PCO_B_DigestAlgorithm,
    CCN_PCO_E_DigestAlgorithm,
    CCN_PCO_B_Witness,
    CCN_PCO_E_Witness,
    CCN_PCO_B_SignatureBits,
    CCN_PCO_E_SignatureBits,
    CCN_PCO_E_Signature,
    CCN_PCO_B_Name,
    CCN_PCO_B_Component0,
    CCN_PCO_E_ComponentN,
    CCN_PCO_E_ComponentLast = CCN_PCO_E_ComponentN,
    CCN_PCO_E_Name,
    CCN_PCO_B_SignedInfo,
    CCN_PCO_B_PublisherPublicKeyDigest,
    CCN_PCO_E_PublisherPublicKeyDigest,
    CCN_PCO_B_Timestamp,
    CCN_PCO_E_Timestamp,
    CCN_PCO_B_Type,
    CCN_PCO_E_Type,
    CCN_PCO_B_FreshnessSeconds,
    CCN_PCO_E_FreshnessSeconds,
    CCN_PCO_B_FinalBlockID,
    CCN_PCO_E_FinalBlockID,
    CCN_PCO_B_KeyLocator,
    // Exactly one of Key, Certificate, or KeyName will be present
    CCN_PCO_B_Key_Certificate_KeyName,
    CCN_PCO_B_KeyName_Name,
    CCN_PCO_E_KeyName_Name,
    CCN_PCO_B_KeyName_Pub,
    CCN_PCO_E_KeyName_Pub,
    CCN_PCO_E_Key_Certificate_KeyName,
    CCN_PCO_E_KeyLocator,
    CCN_PCO_E_SignedInfo,
    CCN_PCO_B_Content,
    CCN_PCO_E_Content,
    CCN_PCO_E		// 35
};

enum ccn_content_type  {
    CCN_CONTENT_DATA = 0x0C04C0,
    CCN_CONTENT_ENCR = 0x10D091,
    CCN_CONTENT_GONE = 0x18E344,
    CCN_CONTENT_KEY  = 0x28463F,
    CCN_CONTENT_LINK = 0x2C834A,
    CCN_CONTENT_NACK = 0x34008A
};

/* Other */
/* Not all of these flags make sense with all of the operations */
#define CCN_V_REPLACE  1 /**< if last component is version, replace it */
#define CCN_V_LOW      2 /**< look for early version */
#define CCN_V_HIGH     4 /**< look for newer version */
#define CCN_V_EST      8 /**< look for extreme */
#define CCN_V_LOWEST   (2|8)
#define CCN_V_HIGHEST  (4|8)
#define CCN_V_NEXT     (4|1)
#define CCN_V_PREV     (2|1)
#define CCN_V_NOW      16 /**< use current time */
#define CCN_V_NESTOK   32 /**< version within version is ok */

#endif /* CCN_H_ */
