; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3640 () Bool)

(assert start!3640)

(declare-fun b!15759 () Bool)

(declare-fun res!14645 () Bool)

(declare-fun e!9833 () Bool)

(assert (=> b!15759 (=> (not res!14645) (not e!9833))))

(declare-datatypes ((array!945 0))(
  ( (array!946 (arr!829 (Array (_ BitVec 32) (_ BitVec 8))) (size!400 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!760 0))(
  ( (BitStream!761 (buf!763 array!945) (currentByte!1932 (_ BitVec 32)) (currentBit!1927 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!760)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15759 (= res!14645 (validate_offset_bits!1 ((_ sign_extend 32) (size!400 (buf!763 thiss!1073))) ((_ sign_extend 32) (currentByte!1932 thiss!1073)) ((_ sign_extend 32) (currentBit!1927 thiss!1073)) nBits!313))))

(declare-fun b!15760 () Bool)

(declare-fun e!9834 () Bool)

(declare-datatypes ((tuple2!1884 0))(
  ( (tuple2!1885 (_1!1003 BitStream!760) (_2!1003 Bool)) )
))
(declare-fun lt!24096 () tuple2!1884)

(declare-datatypes ((tuple2!1886 0))(
  ( (tuple2!1887 (_1!1004 BitStream!760) (_2!1004 BitStream!760)) )
))
(declare-fun lt!24097 () tuple2!1886)

(assert (=> b!15760 (= e!9834 (not (or (not (_2!1003 lt!24096)) (not (= (_1!1003 lt!24096) (_2!1004 lt!24097))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!760 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1884)

(assert (=> b!15760 (= lt!24096 (checkBitsLoopPure!0 (_1!1004 lt!24097) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1293 0))(
  ( (Unit!1294) )
))
(declare-datatypes ((tuple2!1888 0))(
  ( (tuple2!1889 (_1!1005 Unit!1293) (_2!1005 BitStream!760)) )
))
(declare-fun lt!24099 () tuple2!1888)

(assert (=> b!15760 (validate_offset_bits!1 ((_ sign_extend 32) (size!400 (buf!763 (_2!1005 lt!24099)))) ((_ sign_extend 32) (currentByte!1932 thiss!1073)) ((_ sign_extend 32) (currentBit!1927 thiss!1073)) nBits!313)))

(declare-fun lt!24100 () Unit!1293)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!760 array!945 (_ BitVec 64)) Unit!1293)

(assert (=> b!15760 (= lt!24100 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!763 (_2!1005 lt!24099)) nBits!313))))

(declare-fun reader!0 (BitStream!760 BitStream!760) tuple2!1886)

(assert (=> b!15760 (= lt!24097 (reader!0 thiss!1073 (_2!1005 lt!24099)))))

(declare-fun b!15761 () Bool)

(declare-fun res!14644 () Bool)

(assert (=> b!15761 (=> (not res!14644) (not e!9834))))

(declare-fun isPrefixOf!0 (BitStream!760 BitStream!760) Bool)

(assert (=> b!15761 (= res!14644 (isPrefixOf!0 thiss!1073 (_2!1005 lt!24099)))))

(declare-fun b!15762 () Bool)

(declare-fun res!14643 () Bool)

(assert (=> b!15762 (=> (not res!14643) (not e!9834))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15762 (= res!14643 (= (bitIndex!0 (size!400 (buf!763 (_2!1005 lt!24099))) (currentByte!1932 (_2!1005 lt!24099)) (currentBit!1927 (_2!1005 lt!24099))) (bvadd (bitIndex!0 (size!400 (buf!763 thiss!1073)) (currentByte!1932 thiss!1073) (currentBit!1927 thiss!1073)) nBits!313)))))

(declare-fun b!15763 () Bool)

(assert (=> b!15763 (= e!9833 (not true))))

(declare-fun lt!24098 () tuple2!1886)

(assert (=> b!15763 (= lt!24098 (reader!0 thiss!1073 (_2!1005 lt!24099)))))

(declare-fun lt!24093 () Bool)

(assert (=> b!15763 (= lt!24093 (isPrefixOf!0 thiss!1073 (_2!1005 lt!24099)))))

(declare-fun lt!24094 () (_ BitVec 64))

(assert (=> b!15763 (= lt!24094 (bitIndex!0 (size!400 (buf!763 (_2!1005 lt!24099))) (currentByte!1932 (_2!1005 lt!24099)) (currentBit!1927 (_2!1005 lt!24099))))))

(declare-fun lt!24095 () (_ BitVec 64))

(assert (=> b!15763 (= lt!24095 (bitIndex!0 (size!400 (buf!763 thiss!1073)) (currentByte!1932 thiss!1073) (currentBit!1927 thiss!1073)))))

(assert (=> b!15763 e!9834))

(declare-fun res!14642 () Bool)

(assert (=> b!15763 (=> (not res!14642) (not e!9834))))

(assert (=> b!15763 (= res!14642 (= (size!400 (buf!763 thiss!1073)) (size!400 (buf!763 (_2!1005 lt!24099)))))))

(declare-fun appendNBits!0 (BitStream!760 (_ BitVec 64) Bool) tuple2!1888)

(assert (=> b!15763 (= lt!24099 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15764 () Bool)

(declare-fun e!9832 () Bool)

(declare-fun array_inv!389 (array!945) Bool)

(assert (=> b!15764 (= e!9832 (array_inv!389 (buf!763 thiss!1073)))))

(declare-fun res!14641 () Bool)

(assert (=> start!3640 (=> (not res!14641) (not e!9833))))

(assert (=> start!3640 (= res!14641 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3640 e!9833))

(assert (=> start!3640 true))

(declare-fun inv!12 (BitStream!760) Bool)

(assert (=> start!3640 (and (inv!12 thiss!1073) e!9832)))

(assert (= (and start!3640 res!14641) b!15759))

(assert (= (and b!15759 res!14645) b!15763))

(assert (= (and b!15763 res!14642) b!15762))

(assert (= (and b!15762 res!14643) b!15761))

(assert (= (and b!15761 res!14644) b!15760))

(assert (= start!3640 b!15764))

(declare-fun m!22491 () Bool)

(assert (=> b!15763 m!22491))

(declare-fun m!22493 () Bool)

(assert (=> b!15763 m!22493))

(declare-fun m!22495 () Bool)

(assert (=> b!15763 m!22495))

(declare-fun m!22497 () Bool)

(assert (=> b!15763 m!22497))

(declare-fun m!22499 () Bool)

(assert (=> b!15763 m!22499))

(declare-fun m!22501 () Bool)

(assert (=> b!15760 m!22501))

(declare-fun m!22503 () Bool)

(assert (=> b!15760 m!22503))

(declare-fun m!22505 () Bool)

(assert (=> b!15760 m!22505))

(assert (=> b!15760 m!22495))

(assert (=> b!15762 m!22493))

(assert (=> b!15762 m!22491))

(declare-fun m!22507 () Bool)

(assert (=> start!3640 m!22507))

(assert (=> b!15761 m!22497))

(declare-fun m!22509 () Bool)

(assert (=> b!15764 m!22509))

(declare-fun m!22511 () Bool)

(assert (=> b!15759 m!22511))

(push 1)

(assert (not b!15760))

(assert (not b!15759))

(assert (not b!15762))

(assert (not start!3640))

(assert (not b!15761))

(assert (not b!15763))

(assert (not b!15764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

