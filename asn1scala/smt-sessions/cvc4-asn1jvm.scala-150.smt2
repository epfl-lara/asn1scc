; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3518 () Bool)

(assert start!3518)

(declare-fun res!14312 () Bool)

(declare-fun e!9615 () Bool)

(assert (=> start!3518 (=> (not res!14312) (not e!9615))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3518 (= res!14312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3518 e!9615))

(assert (=> start!3518 true))

(declare-datatypes ((array!925 0))(
  ( (array!926 (arr!822 (Array (_ BitVec 32) (_ BitVec 8))) (size!393 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!746 0))(
  ( (BitStream!747 (buf!750 array!925) (currentByte!1913 (_ BitVec 32)) (currentBit!1908 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!746)

(declare-fun e!9616 () Bool)

(declare-fun inv!12 (BitStream!746) Bool)

(assert (=> start!3518 (and (inv!12 thiss!1073) e!9616)))

(declare-fun b!15369 () Bool)

(declare-fun res!14311 () Bool)

(assert (=> b!15369 (=> (not res!14311) (not e!9615))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15369 (= res!14311 (validate_offset_bits!1 ((_ sign_extend 32) (size!393 (buf!750 thiss!1073))) ((_ sign_extend 32) (currentByte!1913 thiss!1073)) ((_ sign_extend 32) (currentBit!1908 thiss!1073)) nBits!313))))

(declare-fun b!15370 () Bool)

(declare-fun res!14310 () Bool)

(declare-fun e!9618 () Bool)

(assert (=> b!15370 (=> (not res!14310) (not e!9618))))

(declare-datatypes ((Unit!1274 0))(
  ( (Unit!1275) )
))
(declare-datatypes ((tuple2!1832 0))(
  ( (tuple2!1833 (_1!977 Unit!1274) (_2!977 BitStream!746)) )
))
(declare-fun lt!23293 () tuple2!1832)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15370 (= res!14310 (= (bitIndex!0 (size!393 (buf!750 (_2!977 lt!23293))) (currentByte!1913 (_2!977 lt!23293)) (currentBit!1908 (_2!977 lt!23293))) (bvadd (bitIndex!0 (size!393 (buf!750 thiss!1073)) (currentByte!1913 thiss!1073) (currentBit!1908 thiss!1073)) nBits!313)))))

(declare-fun b!15371 () Bool)

(declare-fun array_inv!382 (array!925) Bool)

(assert (=> b!15371 (= e!9616 (array_inv!382 (buf!750 thiss!1073)))))

(declare-fun b!15372 () Bool)

(declare-datatypes ((tuple2!1834 0))(
  ( (tuple2!1835 (_1!978 BitStream!746) (_2!978 Bool)) )
))
(declare-fun lt!23290 () tuple2!1834)

(declare-datatypes ((tuple2!1836 0))(
  ( (tuple2!1837 (_1!979 BitStream!746) (_2!979 BitStream!746)) )
))
(declare-fun lt!23291 () tuple2!1836)

(assert (=> b!15372 (= e!9618 (not (or (not (_2!978 lt!23290)) (not (= (_1!978 lt!23290) (_2!979 lt!23291))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!746 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1834)

(assert (=> b!15372 (= lt!23290 (checkBitsLoopPure!0 (_1!979 lt!23291) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15372 (validate_offset_bits!1 ((_ sign_extend 32) (size!393 (buf!750 (_2!977 lt!23293)))) ((_ sign_extend 32) (currentByte!1913 thiss!1073)) ((_ sign_extend 32) (currentBit!1908 thiss!1073)) nBits!313)))

(declare-fun lt!23287 () Unit!1274)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!746 array!925 (_ BitVec 64)) Unit!1274)

(assert (=> b!15372 (= lt!23287 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!750 (_2!977 lt!23293)) nBits!313))))

(declare-fun reader!0 (BitStream!746 BitStream!746) tuple2!1836)

(assert (=> b!15372 (= lt!23291 (reader!0 thiss!1073 (_2!977 lt!23293)))))

(declare-fun b!15373 () Bool)

(declare-fun res!14308 () Bool)

(assert (=> b!15373 (=> (not res!14308) (not e!9618))))

(declare-fun isPrefixOf!0 (BitStream!746 BitStream!746) Bool)

(assert (=> b!15373 (= res!14308 (isPrefixOf!0 thiss!1073 (_2!977 lt!23293)))))

(declare-fun b!15374 () Bool)

(assert (=> b!15374 (= e!9615 (not true))))

(assert (=> b!15374 (validate_offset_bits!1 ((_ sign_extend 32) (size!393 (buf!750 (_2!977 lt!23293)))) ((_ sign_extend 32) (currentByte!1913 thiss!1073)) ((_ sign_extend 32) (currentBit!1908 thiss!1073)) nBits!313)))

(declare-fun lt!23292 () Unit!1274)

(assert (=> b!15374 (= lt!23292 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!750 (_2!977 lt!23293)) nBits!313))))

(declare-fun lt!23285 () tuple2!1836)

(assert (=> b!15374 (= lt!23285 (reader!0 thiss!1073 (_2!977 lt!23293)))))

(declare-fun lt!23288 () Bool)

(assert (=> b!15374 (= lt!23288 (isPrefixOf!0 thiss!1073 (_2!977 lt!23293)))))

(declare-fun lt!23289 () (_ BitVec 64))

(assert (=> b!15374 (= lt!23289 (bitIndex!0 (size!393 (buf!750 (_2!977 lt!23293))) (currentByte!1913 (_2!977 lt!23293)) (currentBit!1908 (_2!977 lt!23293))))))

(declare-fun lt!23286 () (_ BitVec 64))

(assert (=> b!15374 (= lt!23286 (bitIndex!0 (size!393 (buf!750 thiss!1073)) (currentByte!1913 thiss!1073) (currentBit!1908 thiss!1073)))))

(assert (=> b!15374 e!9618))

(declare-fun res!14309 () Bool)

(assert (=> b!15374 (=> (not res!14309) (not e!9618))))

(assert (=> b!15374 (= res!14309 (= (size!393 (buf!750 thiss!1073)) (size!393 (buf!750 (_2!977 lt!23293)))))))

(declare-fun appendNBits!0 (BitStream!746 (_ BitVec 64) Bool) tuple2!1832)

(assert (=> b!15374 (= lt!23293 (appendNBits!0 thiss!1073 nBits!313 true))))

(assert (= (and start!3518 res!14312) b!15369))

(assert (= (and b!15369 res!14311) b!15374))

(assert (= (and b!15374 res!14309) b!15370))

(assert (= (and b!15370 res!14310) b!15373))

(assert (= (and b!15373 res!14308) b!15372))

(assert (= start!3518 b!15371))

(declare-fun m!21995 () Bool)

(assert (=> b!15371 m!21995))

(declare-fun m!21997 () Bool)

(assert (=> start!3518 m!21997))

(declare-fun m!21999 () Bool)

(assert (=> b!15374 m!21999))

(declare-fun m!22001 () Bool)

(assert (=> b!15374 m!22001))

(declare-fun m!22003 () Bool)

(assert (=> b!15374 m!22003))

(declare-fun m!22005 () Bool)

(assert (=> b!15374 m!22005))

(declare-fun m!22007 () Bool)

(assert (=> b!15374 m!22007))

(declare-fun m!22009 () Bool)

(assert (=> b!15374 m!22009))

(declare-fun m!22011 () Bool)

(assert (=> b!15374 m!22011))

(assert (=> b!15373 m!22005))

(declare-fun m!22013 () Bool)

(assert (=> b!15372 m!22013))

(assert (=> b!15372 m!21999))

(assert (=> b!15372 m!22007))

(assert (=> b!15372 m!22011))

(declare-fun m!22015 () Bool)

(assert (=> b!15369 m!22015))

(assert (=> b!15370 m!22001))

(assert (=> b!15370 m!22003))

(push 1)

