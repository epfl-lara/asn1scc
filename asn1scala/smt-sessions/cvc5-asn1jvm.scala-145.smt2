; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3484 () Bool)

(assert start!3484)

(declare-fun b!15063 () Bool)

(declare-fun e!9411 () Bool)

(declare-datatypes ((array!891 0))(
  ( (array!892 (arr!805 (Array (_ BitVec 32) (_ BitVec 8))) (size!376 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!712 0))(
  ( (BitStream!713 (buf!733 array!891) (currentByte!1896 (_ BitVec 32)) (currentBit!1891 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!712)

(declare-fun array_inv!365 (array!891) Bool)

(assert (=> b!15063 (= e!9411 (array_inv!365 (buf!733 thiss!1073)))))

(declare-fun res!14057 () Bool)

(declare-fun e!9413 () Bool)

(assert (=> start!3484 (=> (not res!14057) (not e!9413))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3484 (= res!14057 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3484 e!9413))

(assert (=> start!3484 true))

(declare-fun inv!12 (BitStream!712) Bool)

(assert (=> start!3484 (and (inv!12 thiss!1073) e!9411)))

(declare-fun b!15064 () Bool)

(declare-fun res!14055 () Bool)

(assert (=> b!15064 (=> (not res!14055) (not e!9413))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15064 (= res!14055 (validate_offset_bits!1 ((_ sign_extend 32) (size!376 (buf!733 thiss!1073))) ((_ sign_extend 32) (currentByte!1896 thiss!1073)) ((_ sign_extend 32) (currentBit!1891 thiss!1073)) nBits!313))))

(declare-fun b!15065 () Bool)

(assert (=> b!15065 (= e!9413 (not true))))

(declare-fun lt!22867 () Bool)

(declare-datatypes ((Unit!1240 0))(
  ( (Unit!1241) )
))
(declare-datatypes ((tuple2!1730 0))(
  ( (tuple2!1731 (_1!926 Unit!1240) (_2!926 BitStream!712)) )
))
(declare-fun lt!22873 () tuple2!1730)

(declare-fun isPrefixOf!0 (BitStream!712 BitStream!712) Bool)

(assert (=> b!15065 (= lt!22867 (isPrefixOf!0 thiss!1073 (_2!926 lt!22873)))))

(declare-fun lt!22872 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15065 (= lt!22872 (bitIndex!0 (size!376 (buf!733 (_2!926 lt!22873))) (currentByte!1896 (_2!926 lt!22873)) (currentBit!1891 (_2!926 lt!22873))))))

(declare-fun lt!22869 () (_ BitVec 64))

(assert (=> b!15065 (= lt!22869 (bitIndex!0 (size!376 (buf!733 thiss!1073)) (currentByte!1896 thiss!1073) (currentBit!1891 thiss!1073)))))

(declare-fun e!9412 () Bool)

(assert (=> b!15065 e!9412))

(declare-fun res!14056 () Bool)

(assert (=> b!15065 (=> (not res!14056) (not e!9412))))

(assert (=> b!15065 (= res!14056 (= (size!376 (buf!733 thiss!1073)) (size!376 (buf!733 (_2!926 lt!22873)))))))

(declare-fun appendNBits!0 (BitStream!712 (_ BitVec 64) Bool) tuple2!1730)

(assert (=> b!15065 (= lt!22873 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15066 () Bool)

(declare-fun res!14053 () Bool)

(assert (=> b!15066 (=> (not res!14053) (not e!9412))))

(assert (=> b!15066 (= res!14053 (isPrefixOf!0 thiss!1073 (_2!926 lt!22873)))))

(declare-fun b!15067 () Bool)

(declare-fun res!14054 () Bool)

(assert (=> b!15067 (=> (not res!14054) (not e!9412))))

(assert (=> b!15067 (= res!14054 (= (bitIndex!0 (size!376 (buf!733 (_2!926 lt!22873))) (currentByte!1896 (_2!926 lt!22873)) (currentBit!1891 (_2!926 lt!22873))) (bvadd (bitIndex!0 (size!376 (buf!733 thiss!1073)) (currentByte!1896 thiss!1073) (currentBit!1891 thiss!1073)) nBits!313)))))

(declare-fun b!15068 () Bool)

(declare-datatypes ((tuple2!1732 0))(
  ( (tuple2!1733 (_1!927 BitStream!712) (_2!927 Bool)) )
))
(declare-fun lt!22871 () tuple2!1732)

(declare-datatypes ((tuple2!1734 0))(
  ( (tuple2!1735 (_1!928 BitStream!712) (_2!928 BitStream!712)) )
))
(declare-fun lt!22870 () tuple2!1734)

(assert (=> b!15068 (= e!9412 (not (or (not (_2!927 lt!22871)) (not (= (_1!927 lt!22871) (_2!928 lt!22870))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!712 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1732)

(assert (=> b!15068 (= lt!22871 (checkBitsLoopPure!0 (_1!928 lt!22870) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15068 (validate_offset_bits!1 ((_ sign_extend 32) (size!376 (buf!733 (_2!926 lt!22873)))) ((_ sign_extend 32) (currentByte!1896 thiss!1073)) ((_ sign_extend 32) (currentBit!1891 thiss!1073)) nBits!313)))

(declare-fun lt!22868 () Unit!1240)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!712 array!891 (_ BitVec 64)) Unit!1240)

(assert (=> b!15068 (= lt!22868 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!733 (_2!926 lt!22873)) nBits!313))))

(declare-fun reader!0 (BitStream!712 BitStream!712) tuple2!1734)

(assert (=> b!15068 (= lt!22870 (reader!0 thiss!1073 (_2!926 lt!22873)))))

(assert (= (and start!3484 res!14057) b!15064))

(assert (= (and b!15064 res!14055) b!15065))

(assert (= (and b!15065 res!14056) b!15067))

(assert (= (and b!15067 res!14054) b!15066))

(assert (= (and b!15066 res!14053) b!15068))

(assert (= start!3484 b!15063))

(declare-fun m!21621 () Bool)

(assert (=> b!15067 m!21621))

(declare-fun m!21623 () Bool)

(assert (=> b!15067 m!21623))

(declare-fun m!21625 () Bool)

(assert (=> b!15065 m!21625))

(assert (=> b!15065 m!21621))

(assert (=> b!15065 m!21623))

(declare-fun m!21627 () Bool)

(assert (=> b!15065 m!21627))

(declare-fun m!21629 () Bool)

(assert (=> b!15064 m!21629))

(assert (=> b!15066 m!21625))

(declare-fun m!21631 () Bool)

(assert (=> b!15068 m!21631))

(declare-fun m!21633 () Bool)

(assert (=> b!15068 m!21633))

(declare-fun m!21635 () Bool)

(assert (=> b!15068 m!21635))

(declare-fun m!21637 () Bool)

(assert (=> b!15068 m!21637))

(declare-fun m!21639 () Bool)

(assert (=> b!15063 m!21639))

(declare-fun m!21641 () Bool)

(assert (=> start!3484 m!21641))

(push 1)

(assert (not b!15068))

(assert (not b!15067))

(assert (not b!15065))

(assert (not b!15063))

(assert (not b!15064))

(assert (not b!15066))

(assert (not start!3484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

