; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3512 () Bool)

(assert start!3512)

(declare-fun b!15315 () Bool)

(declare-fun res!14263 () Bool)

(declare-fun e!9581 () Bool)

(assert (=> b!15315 (=> (not res!14263) (not e!9581))))

(declare-datatypes ((array!919 0))(
  ( (array!920 (arr!819 (Array (_ BitVec 32) (_ BitVec 8))) (size!390 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!740 0))(
  ( (BitStream!741 (buf!747 array!919) (currentByte!1910 (_ BitVec 32)) (currentBit!1905 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!740)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15315 (= res!14263 (validate_offset_bits!1 ((_ sign_extend 32) (size!390 (buf!747 thiss!1073))) ((_ sign_extend 32) (currentByte!1910 thiss!1073)) ((_ sign_extend 32) (currentBit!1905 thiss!1073)) nBits!313))))

(declare-fun b!15316 () Bool)

(declare-fun e!9582 () Bool)

(declare-fun array_inv!379 (array!919) Bool)

(assert (=> b!15316 (= e!9582 (array_inv!379 (buf!747 thiss!1073)))))

(declare-fun b!15317 () Bool)

(declare-fun e!9580 () Bool)

(declare-datatypes ((tuple2!1814 0))(
  ( (tuple2!1815 (_1!968 BitStream!740) (_2!968 Bool)) )
))
(declare-fun lt!23205 () tuple2!1814)

(declare-datatypes ((tuple2!1816 0))(
  ( (tuple2!1817 (_1!969 BitStream!740) (_2!969 BitStream!740)) )
))
(declare-fun lt!23210 () tuple2!1816)

(assert (=> b!15317 (= e!9580 (not (or (not (_2!968 lt!23205)) (not (= (_1!968 lt!23205) (_2!969 lt!23210))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!740 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1814)

(assert (=> b!15317 (= lt!23205 (checkBitsLoopPure!0 (_1!969 lt!23210) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1268 0))(
  ( (Unit!1269) )
))
(declare-datatypes ((tuple2!1818 0))(
  ( (tuple2!1819 (_1!970 Unit!1268) (_2!970 BitStream!740)) )
))
(declare-fun lt!23204 () tuple2!1818)

(assert (=> b!15317 (validate_offset_bits!1 ((_ sign_extend 32) (size!390 (buf!747 (_2!970 lt!23204)))) ((_ sign_extend 32) (currentByte!1910 thiss!1073)) ((_ sign_extend 32) (currentBit!1905 thiss!1073)) nBits!313)))

(declare-fun lt!23207 () Unit!1268)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!740 array!919 (_ BitVec 64)) Unit!1268)

(assert (=> b!15317 (= lt!23207 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!747 (_2!970 lt!23204)) nBits!313))))

(declare-fun reader!0 (BitStream!740 BitStream!740) tuple2!1816)

(assert (=> b!15317 (= lt!23210 (reader!0 thiss!1073 (_2!970 lt!23204)))))

(declare-fun b!15318 () Bool)

(assert (=> b!15318 (= e!9581 (not true))))

(assert (=> b!15318 (validate_offset_bits!1 ((_ sign_extend 32) (size!390 (buf!747 (_2!970 lt!23204)))) ((_ sign_extend 32) (currentByte!1910 thiss!1073)) ((_ sign_extend 32) (currentBit!1905 thiss!1073)) nBits!313)))

(declare-fun lt!23209 () Unit!1268)

(assert (=> b!15318 (= lt!23209 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!747 (_2!970 lt!23204)) nBits!313))))

(declare-fun lt!23208 () tuple2!1816)

(assert (=> b!15318 (= lt!23208 (reader!0 thiss!1073 (_2!970 lt!23204)))))

(declare-fun lt!23206 () Bool)

(declare-fun isPrefixOf!0 (BitStream!740 BitStream!740) Bool)

(assert (=> b!15318 (= lt!23206 (isPrefixOf!0 thiss!1073 (_2!970 lt!23204)))))

(declare-fun lt!23211 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15318 (= lt!23211 (bitIndex!0 (size!390 (buf!747 (_2!970 lt!23204))) (currentByte!1910 (_2!970 lt!23204)) (currentBit!1905 (_2!970 lt!23204))))))

(declare-fun lt!23212 () (_ BitVec 64))

(assert (=> b!15318 (= lt!23212 (bitIndex!0 (size!390 (buf!747 thiss!1073)) (currentByte!1910 thiss!1073) (currentBit!1905 thiss!1073)))))

(assert (=> b!15318 e!9580))

(declare-fun res!14264 () Bool)

(assert (=> b!15318 (=> (not res!14264) (not e!9580))))

(assert (=> b!15318 (= res!14264 (= (size!390 (buf!747 thiss!1073)) (size!390 (buf!747 (_2!970 lt!23204)))))))

(declare-fun appendNBits!0 (BitStream!740 (_ BitVec 64) Bool) tuple2!1818)

(assert (=> b!15318 (= lt!23204 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!14266 () Bool)

(assert (=> start!3512 (=> (not res!14266) (not e!9581))))

(assert (=> start!3512 (= res!14266 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3512 e!9581))

(assert (=> start!3512 true))

(declare-fun inv!12 (BitStream!740) Bool)

(assert (=> start!3512 (and (inv!12 thiss!1073) e!9582)))

(declare-fun b!15319 () Bool)

(declare-fun res!14267 () Bool)

(assert (=> b!15319 (=> (not res!14267) (not e!9580))))

(assert (=> b!15319 (= res!14267 (= (bitIndex!0 (size!390 (buf!747 (_2!970 lt!23204))) (currentByte!1910 (_2!970 lt!23204)) (currentBit!1905 (_2!970 lt!23204))) (bvadd (bitIndex!0 (size!390 (buf!747 thiss!1073)) (currentByte!1910 thiss!1073) (currentBit!1905 thiss!1073)) nBits!313)))))

(declare-fun b!15320 () Bool)

(declare-fun res!14265 () Bool)

(assert (=> b!15320 (=> (not res!14265) (not e!9580))))

(assert (=> b!15320 (= res!14265 (isPrefixOf!0 thiss!1073 (_2!970 lt!23204)))))

(assert (= (and start!3512 res!14266) b!15315))

(assert (= (and b!15315 res!14263) b!15318))

(assert (= (and b!15318 res!14264) b!15319))

(assert (= (and b!15319 res!14267) b!15320))

(assert (= (and b!15320 res!14265) b!15317))

(assert (= start!3512 b!15316))

(declare-fun m!21929 () Bool)

(assert (=> b!15320 m!21929))

(declare-fun m!21931 () Bool)

(assert (=> b!15317 m!21931))

(declare-fun m!21933 () Bool)

(assert (=> b!15317 m!21933))

(declare-fun m!21935 () Bool)

(assert (=> b!15317 m!21935))

(declare-fun m!21937 () Bool)

(assert (=> b!15317 m!21937))

(declare-fun m!21939 () Bool)

(assert (=> b!15315 m!21939))

(declare-fun m!21941 () Bool)

(assert (=> start!3512 m!21941))

(declare-fun m!21943 () Bool)

(assert (=> b!15319 m!21943))

(declare-fun m!21945 () Bool)

(assert (=> b!15319 m!21945))

(declare-fun m!21947 () Bool)

(assert (=> b!15316 m!21947))

(assert (=> b!15318 m!21937))

(assert (=> b!15318 m!21943))

(assert (=> b!15318 m!21933))

(declare-fun m!21949 () Bool)

(assert (=> b!15318 m!21949))

(assert (=> b!15318 m!21929))

(assert (=> b!15318 m!21935))

(assert (=> b!15318 m!21945))

(push 1)

(assert (not b!15316))

(assert (not b!15319))

(assert (not b!15318))

(assert (not b!15317))

(assert (not b!15315))

(assert (not start!3512))

(assert (not b!15320))

(check-sat)

