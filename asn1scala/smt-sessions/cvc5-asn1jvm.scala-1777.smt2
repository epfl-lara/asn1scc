; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48550 () Bool)

(assert start!48550)

(declare-fun b!230041 () Bool)

(declare-fun e!157958 () Bool)

(declare-fun e!157956 () Bool)

(assert (=> b!230041 (= e!157958 e!157956)))

(declare-fun res!192835 () Bool)

(assert (=> b!230041 (=> (not res!192835) (not e!157956))))

(declare-fun lt!367781 () (_ BitVec 64))

(declare-fun lt!367778 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367777 () (_ BitVec 64))

(assert (=> b!230041 (= res!192835 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367777 (bvsub lt!367778 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367777 lt!367778) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367781))))))

(declare-datatypes ((array!11717 0))(
  ( (array!11718 (arr!6124 (Array (_ BitVec 32) (_ BitVec 8))) (size!5137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9370 0))(
  ( (BitStream!9371 (buf!5678 array!11717) (currentByte!10625 (_ BitVec 32)) (currentBit!10620 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9370)

(assert (=> b!230041 (= lt!367777 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5137 (buf!5678 b2!99)))))))

(declare-fun b!230042 () Bool)

(declare-fun e!157955 () Bool)

(declare-fun e!157952 () Bool)

(assert (=> b!230042 (= e!157955 e!157952)))

(declare-fun res!192829 () Bool)

(assert (=> b!230042 (=> (not res!192829) (not e!157952))))

(declare-fun lt!367780 () (_ BitVec 64))

(declare-fun b1!101 () BitStream!9370)

(assert (=> b!230042 (= res!192829 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5137 (buf!5678 b1!101)))) lt!367780) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230042 (= lt!367780 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10625 b1!101))) ((_ sign_extend 32) (currentBit!10620 b1!101))))))

(declare-fun b!230043 () Bool)

(assert (=> b!230043 (= e!157956 (and (bvsle ((_ sign_extend 32) (size!5137 (buf!5678 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10625 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10620 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5137 (buf!5678 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10625 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10620 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230044 () Bool)

(declare-fun e!157959 () Bool)

(declare-fun array_inv!4878 (array!11717) Bool)

(assert (=> b!230044 (= e!157959 (array_inv!4878 (buf!5678 b1!101)))))

(declare-fun b!230045 () Bool)

(declare-fun e!157954 () Bool)

(assert (=> b!230045 (= e!157954 (array_inv!4878 (buf!5678 b2!99)))))

(declare-fun b!230046 () Bool)

(declare-fun res!192837 () Bool)

(assert (=> b!230046 (=> (not res!192837) (not e!157955))))

(declare-fun lt!367779 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230046 (= res!192837 (= lt!367779 (bvadd (bitIndex!0 (size!5137 (buf!5678 b1!101)) (currentByte!10625 b1!101) (currentBit!10620 b1!101)) bits!86)))))

(declare-fun res!192838 () Bool)

(declare-fun e!157957 () Bool)

(assert (=> start!48550 (=> (not res!192838) (not e!157957))))

(assert (=> start!48550 (= res!192838 (and (= (size!5137 (buf!5678 b1!101)) (size!5137 (buf!5678 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48550 e!157957))

(declare-fun inv!12 (BitStream!9370) Bool)

(assert (=> start!48550 (and (inv!12 b1!101) e!157959)))

(assert (=> start!48550 (and (inv!12 b2!99) e!157954)))

(assert (=> start!48550 true))

(declare-fun b!230047 () Bool)

(declare-fun res!192831 () Bool)

(assert (=> b!230047 (=> (not res!192831) (not e!157956))))

(declare-fun lt!367782 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230047 (= res!192831 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5137 (buf!5678 b2!99))) ((_ sign_extend 32) (currentByte!10625 b2!99)) ((_ sign_extend 32) (currentBit!10620 b2!99)) (bvsub bytes!19 lt!367782)))))

(declare-fun b!230048 () Bool)

(declare-fun res!192836 () Bool)

(assert (=> b!230048 (=> (not res!192836) (not e!157955))))

(assert (=> b!230048 (= res!192836 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5137 (buf!5678 b1!101))) ((_ sign_extend 32) (currentByte!10625 b1!101)) ((_ sign_extend 32) (currentBit!10620 b1!101)) bytes!19))))

(declare-fun b!230049 () Bool)

(declare-fun res!192832 () Bool)

(assert (=> b!230049 (=> (not res!192832) (not e!157955))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230049 (= res!192832 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5137 (buf!5678 b1!101))) ((_ sign_extend 32) (currentByte!10625 b1!101)) ((_ sign_extend 32) (currentBit!10620 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230050 () Bool)

(declare-fun e!157951 () Bool)

(assert (=> b!230050 (= e!157957 e!157951)))

(declare-fun res!192834 () Bool)

(assert (=> b!230050 (=> (not res!192834) (not e!157951))))

(assert (=> b!230050 (= res!192834 (bvsle bits!86 lt!367779))))

(assert (=> b!230050 (= lt!367779 (bitIndex!0 (size!5137 (buf!5678 b2!99)) (currentByte!10625 b2!99) (currentBit!10620 b2!99)))))

(declare-fun b!230051 () Bool)

(assert (=> b!230051 (= e!157951 e!157955)))

(declare-fun res!192830 () Bool)

(assert (=> b!230051 (=> (not res!192830) (not e!157955))))

(assert (=> b!230051 (= res!192830 (bvsle lt!367782 bytes!19))))

(assert (=> b!230051 (= lt!367782 ((_ extract 31 0) lt!367781))))

(assert (=> b!230051 (= lt!367781 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230052 () Bool)

(assert (=> b!230052 (= e!157952 e!157958)))

(declare-fun res!192833 () Bool)

(assert (=> b!230052 (=> (not res!192833) (not e!157958))))

(assert (=> b!230052 (= res!192833 (and (= lt!367779 lt!367778) (= (bvsub lt!367779 bits!86) lt!367780)))))

(assert (=> b!230052 (= lt!367778 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10625 b2!99))) ((_ sign_extend 32) (currentBit!10620 b2!99))))))

(assert (= (and start!48550 res!192838) b!230050))

(assert (= (and b!230050 res!192834) b!230051))

(assert (= (and b!230051 res!192830) b!230048))

(assert (= (and b!230048 res!192836) b!230046))

(assert (= (and b!230046 res!192837) b!230049))

(assert (= (and b!230049 res!192832) b!230042))

(assert (= (and b!230042 res!192829) b!230052))

(assert (= (and b!230052 res!192833) b!230041))

(assert (= (and b!230041 res!192835) b!230047))

(assert (= (and b!230047 res!192831) b!230043))

(assert (= start!48550 b!230044))

(assert (= start!48550 b!230045))

(declare-fun m!353503 () Bool)

(assert (=> b!230046 m!353503))

(declare-fun m!353505 () Bool)

(assert (=> b!230045 m!353505))

(declare-fun m!353507 () Bool)

(assert (=> b!230049 m!353507))

(declare-fun m!353509 () Bool)

(assert (=> b!230048 m!353509))

(declare-fun m!353511 () Bool)

(assert (=> b!230050 m!353511))

(declare-fun m!353513 () Bool)

(assert (=> b!230047 m!353513))

(declare-fun m!353515 () Bool)

(assert (=> start!48550 m!353515))

(declare-fun m!353517 () Bool)

(assert (=> start!48550 m!353517))

(declare-fun m!353519 () Bool)

(assert (=> b!230044 m!353519))

(push 1)

(assert (not b!230045))

(assert (not b!230044))

(assert (not b!230050))

(assert (not b!230047))

(assert (not start!48550))

(assert (not b!230046))

(assert (not b!230049))

(assert (not b!230048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

