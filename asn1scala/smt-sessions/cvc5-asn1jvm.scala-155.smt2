; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3652 () Bool)

(assert start!3652)

(declare-fun res!14731 () Bool)

(declare-fun e!9903 () Bool)

(assert (=> start!3652 (=> (not res!14731) (not e!9903))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3652 (= res!14731 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3652 e!9903))

(assert (=> start!3652 true))

(declare-datatypes ((array!957 0))(
  ( (array!958 (arr!835 (Array (_ BitVec 32) (_ BitVec 8))) (size!406 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!772 0))(
  ( (BitStream!773 (buf!769 array!957) (currentByte!1938 (_ BitVec 32)) (currentBit!1933 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!772)

(declare-fun e!9904 () Bool)

(declare-fun inv!12 (BitStream!772) Bool)

(assert (=> start!3652 (and (inv!12 thiss!1073) e!9904)))

(declare-fun b!15867 () Bool)

(declare-fun res!14734 () Bool)

(assert (=> b!15867 (=> (not res!14734) (not e!9903))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15867 (= res!14734 (validate_offset_bits!1 ((_ sign_extend 32) (size!406 (buf!769 thiss!1073))) ((_ sign_extend 32) (currentByte!1938 thiss!1073)) ((_ sign_extend 32) (currentBit!1933 thiss!1073)) nBits!313))))

(declare-fun b!15868 () Bool)

(declare-fun array_inv!395 (array!957) Bool)

(assert (=> b!15868 (= e!9904 (array_inv!395 (buf!769 thiss!1073)))))

(declare-fun b!15869 () Bool)

(assert (=> b!15869 (= e!9903 (not true))))

(declare-datatypes ((tuple2!1920 0))(
  ( (tuple2!1921 (_1!1021 BitStream!772) (_2!1021 BitStream!772)) )
))
(declare-fun lt!24240 () tuple2!1920)

(declare-datatypes ((Unit!1305 0))(
  ( (Unit!1306) )
))
(declare-datatypes ((tuple2!1922 0))(
  ( (tuple2!1923 (_1!1022 Unit!1305) (_2!1022 BitStream!772)) )
))
(declare-fun lt!24237 () tuple2!1922)

(declare-fun reader!0 (BitStream!772 BitStream!772) tuple2!1920)

(assert (=> b!15869 (= lt!24240 (reader!0 thiss!1073 (_2!1022 lt!24237)))))

(declare-fun lt!24239 () Bool)

(declare-fun isPrefixOf!0 (BitStream!772 BitStream!772) Bool)

(assert (=> b!15869 (= lt!24239 (isPrefixOf!0 thiss!1073 (_2!1022 lt!24237)))))

(declare-fun lt!24241 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15869 (= lt!24241 (bitIndex!0 (size!406 (buf!769 (_2!1022 lt!24237))) (currentByte!1938 (_2!1022 lt!24237)) (currentBit!1933 (_2!1022 lt!24237))))))

(declare-fun lt!24243 () (_ BitVec 64))

(assert (=> b!15869 (= lt!24243 (bitIndex!0 (size!406 (buf!769 thiss!1073)) (currentByte!1938 thiss!1073) (currentBit!1933 thiss!1073)))))

(declare-fun e!9905 () Bool)

(assert (=> b!15869 e!9905))

(declare-fun res!14732 () Bool)

(assert (=> b!15869 (=> (not res!14732) (not e!9905))))

(assert (=> b!15869 (= res!14732 (= (size!406 (buf!769 thiss!1073)) (size!406 (buf!769 (_2!1022 lt!24237)))))))

(declare-fun appendNBits!0 (BitStream!772 (_ BitVec 64) Bool) tuple2!1922)

(assert (=> b!15869 (= lt!24237 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15870 () Bool)

(declare-datatypes ((tuple2!1924 0))(
  ( (tuple2!1925 (_1!1023 BitStream!772) (_2!1023 Bool)) )
))
(declare-fun lt!24238 () tuple2!1924)

(declare-fun lt!24244 () tuple2!1920)

(assert (=> b!15870 (= e!9905 (not (or (not (_2!1023 lt!24238)) (not (= (_1!1023 lt!24238) (_2!1021 lt!24244))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!772 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1924)

(assert (=> b!15870 (= lt!24238 (checkBitsLoopPure!0 (_1!1021 lt!24244) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15870 (validate_offset_bits!1 ((_ sign_extend 32) (size!406 (buf!769 (_2!1022 lt!24237)))) ((_ sign_extend 32) (currentByte!1938 thiss!1073)) ((_ sign_extend 32) (currentBit!1933 thiss!1073)) nBits!313)))

(declare-fun lt!24242 () Unit!1305)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!772 array!957 (_ BitVec 64)) Unit!1305)

(assert (=> b!15870 (= lt!24242 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!769 (_2!1022 lt!24237)) nBits!313))))

(assert (=> b!15870 (= lt!24244 (reader!0 thiss!1073 (_2!1022 lt!24237)))))

(declare-fun b!15871 () Bool)

(declare-fun res!14735 () Bool)

(assert (=> b!15871 (=> (not res!14735) (not e!9905))))

(assert (=> b!15871 (= res!14735 (= (bitIndex!0 (size!406 (buf!769 (_2!1022 lt!24237))) (currentByte!1938 (_2!1022 lt!24237)) (currentBit!1933 (_2!1022 lt!24237))) (bvadd (bitIndex!0 (size!406 (buf!769 thiss!1073)) (currentByte!1938 thiss!1073) (currentBit!1933 thiss!1073)) nBits!313)))))

(declare-fun b!15872 () Bool)

(declare-fun res!14733 () Bool)

(assert (=> b!15872 (=> (not res!14733) (not e!9905))))

(assert (=> b!15872 (= res!14733 (isPrefixOf!0 thiss!1073 (_2!1022 lt!24237)))))

(assert (= (and start!3652 res!14731) b!15867))

(assert (= (and b!15867 res!14734) b!15869))

(assert (= (and b!15869 res!14732) b!15871))

(assert (= (and b!15871 res!14735) b!15872))

(assert (= (and b!15872 res!14733) b!15870))

(assert (= start!3652 b!15868))

(declare-fun m!22623 () Bool)

(assert (=> b!15871 m!22623))

(declare-fun m!22625 () Bool)

(assert (=> b!15871 m!22625))

(declare-fun m!22627 () Bool)

(assert (=> b!15872 m!22627))

(declare-fun m!22629 () Bool)

(assert (=> b!15867 m!22629))

(declare-fun m!22631 () Bool)

(assert (=> start!3652 m!22631))

(declare-fun m!22633 () Bool)

(assert (=> b!15870 m!22633))

(declare-fun m!22635 () Bool)

(assert (=> b!15870 m!22635))

(declare-fun m!22637 () Bool)

(assert (=> b!15870 m!22637))

(declare-fun m!22639 () Bool)

(assert (=> b!15870 m!22639))

(declare-fun m!22641 () Bool)

(assert (=> b!15868 m!22641))

(assert (=> b!15869 m!22623))

(assert (=> b!15869 m!22625))

(assert (=> b!15869 m!22639))

(declare-fun m!22643 () Bool)

(assert (=> b!15869 m!22643))

(assert (=> b!15869 m!22627))

(push 1)

(assert (not b!15870))

(assert (not b!15868))

(assert (not b!15869))

(assert (not start!3652))

(assert (not b!15867))

(assert (not b!15872))

(assert (not b!15871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

