; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17858 () Bool)

(assert start!17858)

(declare-fun b!87407 () Bool)

(declare-fun res!71878 () Bool)

(declare-fun e!57959 () Bool)

(assert (=> b!87407 (=> (not res!71878) (not e!57959))))

(declare-datatypes ((array!4126 0))(
  ( (array!4127 (arr!2501 (Array (_ BitVec 32) (_ BitVec 8))) (size!1864 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3290 0))(
  ( (BitStream!3291 (buf!2254 array!4126) (currentByte!4469 (_ BitVec 32)) (currentBit!4464 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3290)

(declare-fun thiss!1151 () BitStream!3290)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87407 (= res!71878 (and (bvsle i!576 nBits!336) (= (size!1864 (buf!2254 thiss!1152)) (size!1864 (buf!2254 thiss!1151)))))))

(declare-fun b!87408 () Bool)

(declare-fun e!57965 () Bool)

(declare-fun array_inv!1710 (array!4126) Bool)

(assert (=> b!87408 (= e!57965 (array_inv!1710 (buf!2254 thiss!1152)))))

(declare-fun b!87409 () Bool)

(declare-fun e!57964 () Bool)

(declare-datatypes ((tuple2!7392 0))(
  ( (tuple2!7393 (_1!3929 BitStream!3290) (_2!3929 Bool)) )
))
(declare-fun lt!135625 () tuple2!7392)

(declare-fun lt!135622 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87409 (= e!57964 (= (bitIndex!0 (size!1864 (buf!2254 (_1!3929 lt!135625))) (currentByte!4469 (_1!3929 lt!135625)) (currentBit!4464 (_1!3929 lt!135625))) lt!135622))))

(declare-fun b!87410 () Bool)

(declare-fun e!57960 () Bool)

(assert (=> b!87410 (= e!57960 (array_inv!1710 (buf!2254 thiss!1151)))))

(declare-fun b!87411 () Bool)

(declare-fun e!57966 () Bool)

(assert (=> b!87411 (= e!57966 e!57964)))

(declare-fun res!71885 () Bool)

(assert (=> b!87411 (=> (not res!71885) (not e!57964))))

(declare-fun lt!135623 () Bool)

(declare-datatypes ((Unit!5747 0))(
  ( (Unit!5748) )
))
(declare-datatypes ((tuple2!7394 0))(
  ( (tuple2!7395 (_1!3930 Unit!5747) (_2!3930 BitStream!3290)) )
))
(declare-fun lt!135624 () tuple2!7394)

(assert (=> b!87411 (= res!71885 (and (= (_2!3929 lt!135625) lt!135623) (= (_1!3929 lt!135625) (_2!3930 lt!135624))))))

(declare-fun readBitPure!0 (BitStream!3290) tuple2!7392)

(declare-fun readerFrom!0 (BitStream!3290 (_ BitVec 32) (_ BitVec 32)) BitStream!3290)

(assert (=> b!87411 (= lt!135625 (readBitPure!0 (readerFrom!0 (_2!3930 lt!135624) (currentBit!4464 thiss!1152) (currentByte!4469 thiss!1152))))))

(declare-fun b!87412 () Bool)

(declare-fun e!57962 () Bool)

(assert (=> b!87412 (= e!57962 e!57966)))

(declare-fun res!71882 () Bool)

(assert (=> b!87412 (=> (not res!71882) (not e!57966))))

(declare-fun lt!135626 () (_ BitVec 64))

(assert (=> b!87412 (= res!71882 (= lt!135622 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135626)))))

(assert (=> b!87412 (= lt!135622 (bitIndex!0 (size!1864 (buf!2254 (_2!3930 lt!135624))) (currentByte!4469 (_2!3930 lt!135624)) (currentBit!4464 (_2!3930 lt!135624))))))

(declare-fun b!87413 () Bool)

(declare-fun res!71879 () Bool)

(assert (=> b!87413 (=> (not res!71879) (not e!57959))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87413 (= res!71879 (validate_offset_bits!1 ((_ sign_extend 32) (size!1864 (buf!2254 thiss!1151))) ((_ sign_extend 32) (currentByte!4469 thiss!1151)) ((_ sign_extend 32) (currentBit!4464 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun res!71890 () Bool)

(assert (=> start!17858 (=> (not res!71890) (not e!57959))))

(assert (=> start!17858 (= res!71890 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17858 e!57959))

(declare-fun inv!12 (BitStream!3290) Bool)

(assert (=> start!17858 (and (inv!12 thiss!1152) e!57965)))

(assert (=> start!17858 (and (inv!12 thiss!1151) e!57960)))

(assert (=> start!17858 true))

(declare-fun b!87414 () Bool)

(declare-fun res!71889 () Bool)

(declare-fun e!57963 () Bool)

(assert (=> b!87414 (=> (not res!71889) (not e!57963))))

(assert (=> b!87414 (= res!71889 (validate_offset_bits!1 ((_ sign_extend 32) (size!1864 (buf!2254 thiss!1152))) ((_ sign_extend 32) (currentByte!4469 thiss!1152)) ((_ sign_extend 32) (currentBit!4464 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87415 () Bool)

(assert (=> b!87415 (= e!57963 (not true))))

(assert (=> b!87415 e!57962))

(declare-fun res!71881 () Bool)

(assert (=> b!87415 (=> (not res!71881) (not e!57962))))

(assert (=> b!87415 (= res!71881 (= (size!1864 (buf!2254 thiss!1152)) (size!1864 (buf!2254 (_2!3930 lt!135624)))))))

(declare-fun appendBit!0 (BitStream!3290 Bool) tuple2!7394)

(assert (=> b!87415 (= lt!135624 (appendBit!0 thiss!1152 lt!135623))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87415 (= lt!135623 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87416 () Bool)

(assert (=> b!87416 (= e!57959 e!57963)))

(declare-fun res!71880 () Bool)

(assert (=> b!87416 (=> (not res!71880) (not e!57963))))

(declare-fun lt!135627 () (_ BitVec 64))

(assert (=> b!87416 (= res!71880 (= lt!135626 (bvadd lt!135627 ((_ sign_extend 32) i!576))))))

(assert (=> b!87416 (= lt!135626 (bitIndex!0 (size!1864 (buf!2254 thiss!1152)) (currentByte!4469 thiss!1152) (currentBit!4464 thiss!1152)))))

(assert (=> b!87416 (= lt!135627 (bitIndex!0 (size!1864 (buf!2254 thiss!1151)) (currentByte!4469 thiss!1151) (currentBit!4464 thiss!1151)))))

(declare-fun b!87417 () Bool)

(declare-fun res!71888 () Bool)

(assert (=> b!87417 (=> (not res!71888) (not e!57959))))

(assert (=> b!87417 (= res!71888 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87418 () Bool)

(declare-fun res!71883 () Bool)

(assert (=> b!87418 (=> (not res!71883) (not e!57959))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87418 (= res!71883 (invariant!0 (currentBit!4464 thiss!1151) (currentByte!4469 thiss!1151) (size!1864 (buf!2254 thiss!1151))))))

(declare-fun b!87419 () Bool)

(declare-fun res!71886 () Bool)

(assert (=> b!87419 (=> (not res!71886) (not e!57963))))

(assert (=> b!87419 (= res!71886 (bvslt i!576 nBits!336))))

(declare-fun b!87420 () Bool)

(declare-fun res!71884 () Bool)

(assert (=> b!87420 (=> (not res!71884) (not e!57966))))

(declare-fun isPrefixOf!0 (BitStream!3290 BitStream!3290) Bool)

(assert (=> b!87420 (= res!71884 (isPrefixOf!0 thiss!1152 (_2!3930 lt!135624)))))

(declare-fun b!87421 () Bool)

(declare-fun res!71887 () Bool)

(assert (=> b!87421 (=> (not res!71887) (not e!57959))))

(assert (=> b!87421 (= res!71887 (invariant!0 (currentBit!4464 thiss!1152) (currentByte!4469 thiss!1152) (size!1864 (buf!2254 thiss!1152))))))

(assert (= (and start!17858 res!71890) b!87413))

(assert (= (and b!87413 res!71879) b!87418))

(assert (= (and b!87418 res!71883) b!87417))

(assert (= (and b!87417 res!71888) b!87421))

(assert (= (and b!87421 res!71887) b!87407))

(assert (= (and b!87407 res!71878) b!87416))

(assert (= (and b!87416 res!71880) b!87414))

(assert (= (and b!87414 res!71889) b!87419))

(assert (= (and b!87419 res!71886) b!87415))

(assert (= (and b!87415 res!71881) b!87412))

(assert (= (and b!87412 res!71882) b!87420))

(assert (= (and b!87420 res!71884) b!87411))

(assert (= (and b!87411 res!71885) b!87409))

(assert (= start!17858 b!87408))

(assert (= start!17858 b!87410))

(declare-fun m!132903 () Bool)

(assert (=> b!87414 m!132903))

(declare-fun m!132905 () Bool)

(assert (=> start!17858 m!132905))

(declare-fun m!132907 () Bool)

(assert (=> start!17858 m!132907))

(declare-fun m!132909 () Bool)

(assert (=> b!87408 m!132909))

(declare-fun m!132911 () Bool)

(assert (=> b!87420 m!132911))

(declare-fun m!132913 () Bool)

(assert (=> b!87411 m!132913))

(assert (=> b!87411 m!132913))

(declare-fun m!132915 () Bool)

(assert (=> b!87411 m!132915))

(declare-fun m!132917 () Bool)

(assert (=> b!87421 m!132917))

(declare-fun m!132919 () Bool)

(assert (=> b!87416 m!132919))

(declare-fun m!132921 () Bool)

(assert (=> b!87416 m!132921))

(declare-fun m!132923 () Bool)

(assert (=> b!87418 m!132923))

(declare-fun m!132925 () Bool)

(assert (=> b!87412 m!132925))

(declare-fun m!132927 () Bool)

(assert (=> b!87413 m!132927))

(declare-fun m!132929 () Bool)

(assert (=> b!87415 m!132929))

(declare-fun m!132931 () Bool)

(assert (=> b!87409 m!132931))

(declare-fun m!132933 () Bool)

(assert (=> b!87410 m!132933))

(push 1)

(assert (not b!87414))

(assert (not b!87410))

(assert (not b!87408))

(assert (not b!87412))

(assert (not start!17858))

(assert (not b!87421))

(assert (not b!87411))

(assert (not b!87415))

(assert (not b!87416))

(assert (not b!87409))

(assert (not b!87413))

(assert (not b!87418))

(assert (not b!87420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

