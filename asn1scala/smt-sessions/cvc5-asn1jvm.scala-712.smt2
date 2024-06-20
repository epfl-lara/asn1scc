; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19984 () Bool)

(assert start!19984)

(declare-fun res!81648 () Bool)

(declare-fun e!65130 () Bool)

(assert (=> start!19984 (=> (not res!81648) (not e!65130))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!19984 (= res!81648 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19984 e!65130))

(assert (=> start!19984 true))

(declare-datatypes ((array!4683 0))(
  ( (array!4684 (arr!2730 (Array (_ BitVec 32) (_ BitVec 8))) (size!2137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3748 0))(
  ( (BitStream!3749 (buf!2494 array!4683) (currentByte!4940 (_ BitVec 32)) (currentBit!4935 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3748)

(declare-fun e!65132 () Bool)

(declare-fun inv!12 (BitStream!3748) Bool)

(assert (=> start!19984 (and (inv!12 thiss!1305) e!65132)))

(declare-fun b!99512 () Bool)

(declare-fun e!65133 () Bool)

(declare-fun e!65128 () Bool)

(assert (=> b!99512 (= e!65133 e!65128)))

(declare-fun res!81646 () Bool)

(assert (=> b!99512 (=> (not res!81646) (not e!65128))))

(declare-fun lt!144338 () (_ BitVec 64))

(declare-fun lt!144343 () (_ BitVec 64))

(assert (=> b!99512 (= res!81646 (= lt!144338 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144343)))))

(declare-datatypes ((Unit!6101 0))(
  ( (Unit!6102) )
))
(declare-datatypes ((tuple2!8014 0))(
  ( (tuple2!8015 (_1!4262 Unit!6101) (_2!4262 BitStream!3748)) )
))
(declare-fun lt!144337 () tuple2!8014)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99512 (= lt!144338 (bitIndex!0 (size!2137 (buf!2494 (_2!4262 lt!144337))) (currentByte!4940 (_2!4262 lt!144337)) (currentBit!4935 (_2!4262 lt!144337))))))

(assert (=> b!99512 (= lt!144343 (bitIndex!0 (size!2137 (buf!2494 thiss!1305)) (currentByte!4940 thiss!1305) (currentBit!4935 thiss!1305)))))

(declare-fun b!99513 () Bool)

(declare-fun res!81645 () Bool)

(assert (=> b!99513 (=> (not res!81645) (not e!65130))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99513 (= res!81645 (validate_offset_bits!1 ((_ sign_extend 32) (size!2137 (buf!2494 thiss!1305))) ((_ sign_extend 32) (currentByte!4940 thiss!1305)) ((_ sign_extend 32) (currentBit!4935 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99514 () Bool)

(declare-fun e!65131 () Bool)

(assert (=> b!99514 (= e!65130 (not e!65131))))

(declare-fun res!81650 () Bool)

(assert (=> b!99514 (=> res!81650 e!65131)))

(declare-fun isPrefixOf!0 (BitStream!3748 BitStream!3748) Bool)

(assert (=> b!99514 (= res!81650 (not (isPrefixOf!0 thiss!1305 (_2!4262 lt!144337))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!144340 () tuple2!8014)

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8014)

(assert (=> b!99514 (= lt!144340 (appendNLeastSignificantBitsLoop!0 (_2!4262 lt!144337) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!99514 e!65133))

(declare-fun res!81653 () Bool)

(assert (=> b!99514 (=> (not res!81653) (not e!65133))))

(assert (=> b!99514 (= res!81653 (= (size!2137 (buf!2494 thiss!1305)) (size!2137 (buf!2494 (_2!4262 lt!144337)))))))

(declare-fun lt!144339 () Bool)

(declare-fun appendBit!0 (BitStream!3748 Bool) tuple2!8014)

(assert (=> b!99514 (= lt!144337 (appendBit!0 thiss!1305 lt!144339))))

(assert (=> b!99514 (= lt!144339 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99515 () Bool)

(declare-fun e!65129 () Bool)

(assert (=> b!99515 (= e!65128 e!65129)))

(declare-fun res!81651 () Bool)

(assert (=> b!99515 (=> (not res!81651) (not e!65129))))

(declare-datatypes ((tuple2!8016 0))(
  ( (tuple2!8017 (_1!4263 BitStream!3748) (_2!4263 Bool)) )
))
(declare-fun lt!144341 () tuple2!8016)

(assert (=> b!99515 (= res!81651 (and (= (_2!4263 lt!144341) lt!144339) (= (_1!4263 lt!144341) (_2!4262 lt!144337))))))

(declare-fun readBitPure!0 (BitStream!3748) tuple2!8016)

(declare-fun readerFrom!0 (BitStream!3748 (_ BitVec 32) (_ BitVec 32)) BitStream!3748)

(assert (=> b!99515 (= lt!144341 (readBitPure!0 (readerFrom!0 (_2!4262 lt!144337) (currentBit!4935 thiss!1305) (currentByte!4940 thiss!1305))))))

(declare-fun b!99516 () Bool)

(declare-fun res!81649 () Bool)

(assert (=> b!99516 (=> (not res!81649) (not e!65130))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99516 (= res!81649 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99517 () Bool)

(declare-fun res!81647 () Bool)

(assert (=> b!99517 (=> (not res!81647) (not e!65128))))

(assert (=> b!99517 (= res!81647 (isPrefixOf!0 thiss!1305 (_2!4262 lt!144337)))))

(declare-fun b!99518 () Bool)

(assert (=> b!99518 (= e!65129 (= (bitIndex!0 (size!2137 (buf!2494 (_1!4263 lt!144341))) (currentByte!4940 (_1!4263 lt!144341)) (currentBit!4935 (_1!4263 lt!144341))) lt!144338))))

(declare-fun b!99519 () Bool)

(declare-fun res!81652 () Bool)

(assert (=> b!99519 (=> (not res!81652) (not e!65130))))

(assert (=> b!99519 (= res!81652 (bvslt i!615 nBits!396))))

(declare-fun b!99520 () Bool)

(declare-fun array_inv!1939 (array!4683) Bool)

(assert (=> b!99520 (= e!65132 (array_inv!1939 (buf!2494 thiss!1305)))))

(declare-fun b!99521 () Bool)

(assert (=> b!99521 (= e!65131 true)))

(declare-fun lt!144342 () Bool)

(assert (=> b!99521 (= lt!144342 (isPrefixOf!0 (_2!4262 lt!144337) (_2!4262 lt!144340)))))

(assert (= (and start!19984 res!81648) b!99513))

(assert (= (and b!99513 res!81645) b!99516))

(assert (= (and b!99516 res!81649) b!99519))

(assert (= (and b!99519 res!81652) b!99514))

(assert (= (and b!99514 res!81653) b!99512))

(assert (= (and b!99512 res!81646) b!99517))

(assert (= (and b!99517 res!81647) b!99515))

(assert (= (and b!99515 res!81651) b!99518))

(assert (= (and b!99514 (not res!81650)) b!99521))

(assert (= start!19984 b!99520))

(declare-fun m!144865 () Bool)

(assert (=> b!99517 m!144865))

(declare-fun m!144867 () Bool)

(assert (=> b!99518 m!144867))

(declare-fun m!144869 () Bool)

(assert (=> b!99516 m!144869))

(declare-fun m!144871 () Bool)

(assert (=> b!99515 m!144871))

(assert (=> b!99515 m!144871))

(declare-fun m!144873 () Bool)

(assert (=> b!99515 m!144873))

(declare-fun m!144875 () Bool)

(assert (=> b!99512 m!144875))

(declare-fun m!144877 () Bool)

(assert (=> b!99512 m!144877))

(declare-fun m!144879 () Bool)

(assert (=> b!99520 m!144879))

(declare-fun m!144881 () Bool)

(assert (=> b!99521 m!144881))

(assert (=> b!99514 m!144865))

(declare-fun m!144883 () Bool)

(assert (=> b!99514 m!144883))

(declare-fun m!144885 () Bool)

(assert (=> b!99514 m!144885))

(declare-fun m!144887 () Bool)

(assert (=> b!99513 m!144887))

(declare-fun m!144889 () Bool)

(assert (=> start!19984 m!144889))

(push 1)

(assert (not b!99512))

(assert (not b!99520))

(assert (not b!99517))

(assert (not b!99514))

(assert (not b!99521))

(assert (not b!99513))

(assert (not b!99516))

(assert (not b!99515))

(assert (not start!19984))

(assert (not b!99518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

