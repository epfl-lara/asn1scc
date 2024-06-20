; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8464 () Bool)

(assert start!8464)

(declare-fun b!42218 () Bool)

(declare-fun res!35912 () Bool)

(declare-fun e!28106 () Bool)

(assert (=> b!42218 (=> (not res!35912) (not e!28106))))

(declare-datatypes ((array!2153 0))(
  ( (array!2154 (arr!1472 (Array (_ BitVec 32) (_ BitVec 8))) (size!973 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1690 0))(
  ( (BitStream!1691 (buf!1304 array!2153) (currentByte!2762 (_ BitVec 32)) (currentBit!2757 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1690)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42218 (= res!35912 (validate_offset_bits!1 ((_ sign_extend 32) (size!973 (buf!1304 thiss!1379))) ((_ sign_extend 32) (currentByte!2762 thiss!1379)) ((_ sign_extend 32) (currentBit!2757 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42219 () Bool)

(declare-fun e!28108 () Bool)

(declare-fun e!28109 () Bool)

(assert (=> b!42219 (= e!28108 e!28109)))

(declare-fun res!35909 () Bool)

(assert (=> b!42219 (=> res!35909 e!28109)))

(assert (=> b!42219 (= res!35909 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4114 0))(
  ( (tuple2!4115 (_1!2150 array!2153) (_2!2150 BitStream!1690)) )
))
(declare-fun lt!63566 () tuple2!4114)

(declare-datatypes ((tuple2!4116 0))(
  ( (tuple2!4117 (_1!2151 BitStream!1690) (_2!2151 BitStream!1690)) )
))
(declare-fun lt!63568 () tuple2!4116)

(declare-fun readBits!0 (BitStream!1690 (_ BitVec 64)) tuple2!4114)

(assert (=> b!42219 (= lt!63566 (readBits!0 (_1!2151 lt!63568) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1690 BitStream!1690) tuple2!4116)

(assert (=> b!42219 (= lt!63568 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42220 () Bool)

(declare-fun e!28111 () Bool)

(declare-fun array_inv!898 (array!2153) Bool)

(assert (=> b!42220 (= e!28111 (array_inv!898 (buf!1304 thiss!1379)))))

(declare-fun b!42221 () Bool)

(assert (=> b!42221 (= e!28109 true)))

(declare-datatypes ((List!492 0))(
  ( (Nil!489) (Cons!488 (h!607 Bool) (t!1242 List!492)) )
))
(declare-fun lt!63569 () List!492)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1690 BitStream!1690 (_ BitVec 64)) List!492)

(assert (=> b!42221 (= lt!63569 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2151 lt!63568) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!3000 0))(
  ( (Unit!3001) )
))
(declare-fun lt!63567 () Unit!3000)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1690 array!2153 (_ BitVec 64)) Unit!3000)

(assert (=> b!42221 (= lt!63567 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1304 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2153)

(declare-fun checkByteArrayBitContent!0 (BitStream!1690 array!2153 array!2153 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42221 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2150 lt!63566) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun res!35911 () Bool)

(assert (=> start!8464 (=> (not res!35911) (not e!28106))))

(assert (=> start!8464 (= res!35911 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!973 srcBuffer!2))))))))

(assert (=> start!8464 e!28106))

(assert (=> start!8464 true))

(assert (=> start!8464 (array_inv!898 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1690) Bool)

(assert (=> start!8464 (and (inv!12 thiss!1379) e!28111)))

(declare-fun b!42222 () Bool)

(assert (=> b!42222 (= e!28106 (not e!28108))))

(declare-fun res!35910 () Bool)

(assert (=> b!42222 (=> res!35910 e!28108)))

(declare-fun lt!63571 () (_ BitVec 64))

(assert (=> b!42222 (= res!35910 (or (bvslt i!635 to!314) (not (= lt!63571 (bvsub (bvadd lt!63571 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1690 BitStream!1690) Bool)

(assert (=> b!42222 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63570 () Unit!3000)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1690) Unit!3000)

(assert (=> b!42222 (= lt!63570 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42222 (= lt!63571 (bitIndex!0 (size!973 (buf!1304 thiss!1379)) (currentByte!2762 thiss!1379) (currentBit!2757 thiss!1379)))))

(declare-fun b!42223 () Bool)

(declare-fun res!35913 () Bool)

(assert (=> b!42223 (=> res!35913 e!28108)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42223 (= res!35913 (not (invariant!0 (currentBit!2757 thiss!1379) (currentByte!2762 thiss!1379) (size!973 (buf!1304 thiss!1379)))))))

(assert (= (and start!8464 res!35911) b!42218))

(assert (= (and b!42218 res!35912) b!42222))

(assert (= (and b!42222 (not res!35910)) b!42223))

(assert (= (and b!42223 (not res!35913)) b!42219))

(assert (= (and b!42219 (not res!35909)) b!42221))

(assert (= start!8464 b!42220))

(declare-fun m!64063 () Bool)

(assert (=> start!8464 m!64063))

(declare-fun m!64065 () Bool)

(assert (=> start!8464 m!64065))

(declare-fun m!64067 () Bool)

(assert (=> b!42219 m!64067))

(declare-fun m!64069 () Bool)

(assert (=> b!42219 m!64069))

(declare-fun m!64071 () Bool)

(assert (=> b!42222 m!64071))

(declare-fun m!64073 () Bool)

(assert (=> b!42222 m!64073))

(declare-fun m!64075 () Bool)

(assert (=> b!42222 m!64075))

(declare-fun m!64077 () Bool)

(assert (=> b!42218 m!64077))

(declare-fun m!64079 () Bool)

(assert (=> b!42223 m!64079))

(declare-fun m!64081 () Bool)

(assert (=> b!42221 m!64081))

(declare-fun m!64083 () Bool)

(assert (=> b!42221 m!64083))

(declare-fun m!64085 () Bool)

(assert (=> b!42221 m!64085))

(declare-fun m!64087 () Bool)

(assert (=> b!42220 m!64087))

(push 1)

(assert (not b!42222))

(assert (not b!42218))

(assert (not b!42219))

(assert (not b!42223))

(assert (not b!42220))

(assert (not start!8464))

(assert (not b!42221))

(check-sat)

