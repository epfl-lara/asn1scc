; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1062 () Bool)

(assert start!1062)

(declare-fun b!4167 () Bool)

(declare-fun res!5566 () Bool)

(declare-fun e!2708 () Bool)

(assert (=> b!4167 (=> (not res!5566) (not e!2708))))

(declare-datatypes ((array!325 0))(
  ( (array!326 (arr!525 (Array (_ BitVec 32) (_ BitVec 8))) (size!135 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!248 0))(
  ( (BitStream!249 (buf!456 array!325) (currentByte!1435 (_ BitVec 32)) (currentBit!1430 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!248)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4167 (= res!5566 (validate_offset_bits!1 ((_ sign_extend 32) (size!135 (buf!456 thiss!1486))) ((_ sign_extend 32) (currentByte!1435 thiss!1486)) ((_ sign_extend 32) (currentBit!1430 thiss!1486)) nBits!460))))

(declare-fun res!5562 () Bool)

(assert (=> start!1062 (=> (not res!5562) (not e!2708))))

(declare-fun srcBuffer!6 () array!325)

(declare-fun from!367 () (_ BitVec 64))

(assert (=> start!1062 (= res!5562 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!135 srcBuffer!6))))))))

(assert (=> start!1062 e!2708))

(assert (=> start!1062 true))

(declare-fun array_inv!130 (array!325) Bool)

(assert (=> start!1062 (array_inv!130 srcBuffer!6)))

(declare-fun e!2709 () Bool)

(declare-fun inv!12 (BitStream!248) Bool)

(assert (=> start!1062 (and (inv!12 thiss!1486) e!2709)))

(declare-fun b!4168 () Bool)

(assert (=> b!4168 (= e!2709 (array_inv!130 (buf!456 thiss!1486)))))

(declare-fun b!4169 () Bool)

(declare-fun res!5561 () Bool)

(declare-fun e!2707 () Bool)

(assert (=> b!4169 (=> (not res!5561) (not e!2707))))

(declare-datatypes ((Unit!320 0))(
  ( (Unit!321) )
))
(declare-datatypes ((tuple2!454 0))(
  ( (tuple2!455 (_1!243 Unit!320) (_2!243 BitStream!248)) )
))
(declare-fun lt!5254 () tuple2!454)

(declare-fun isPrefixOf!0 (BitStream!248 BitStream!248) Bool)

(assert (=> b!4169 (= res!5561 (isPrefixOf!0 thiss!1486 (_2!243 lt!5254)))))

(declare-fun b!4170 () Bool)

(declare-fun res!5564 () Bool)

(assert (=> b!4170 (=> (not res!5564) (not e!2707))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4170 (= res!5564 (= (bitIndex!0 (size!135 (buf!456 (_2!243 lt!5254))) (currentByte!1435 (_2!243 lt!5254)) (currentBit!1430 (_2!243 lt!5254))) (bvadd (bitIndex!0 (size!135 (buf!456 thiss!1486)) (currentByte!1435 thiss!1486) (currentBit!1430 thiss!1486)) nBits!460)))))

(declare-fun b!4171 () Bool)

(assert (=> b!4171 (= e!2708 e!2707)))

(declare-fun res!5563 () Bool)

(assert (=> b!4171 (=> (not res!5563) (not e!2707))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4171 (= res!5563 (invariant!0 (currentBit!1430 (_2!243 lt!5254)) (currentByte!1435 (_2!243 lt!5254)) (size!135 (buf!456 (_2!243 lt!5254)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!248 array!325 (_ BitVec 64) (_ BitVec 64)) tuple2!454)

(assert (=> b!4171 (= lt!5254 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4172 () Bool)

(assert (=> b!4172 (= e!2707 (not true))))

(declare-datatypes ((tuple2!456 0))(
  ( (tuple2!457 (_1!244 BitStream!248) (_2!244 BitStream!248)) )
))
(declare-fun lt!5253 () tuple2!456)

(declare-datatypes ((List!35 0))(
  ( (Nil!32) (Cons!31 (h!150 Bool) (t!785 List!35)) )
))
(declare-fun lt!5251 () List!35)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!248 BitStream!248 (_ BitVec 64)) List!35)

(assert (=> b!4172 (= lt!5251 (bitStreamReadBitsIntoList!0 (_2!243 lt!5254) (_1!244 lt!5253) nBits!460))))

(declare-datatypes ((tuple2!458 0))(
  ( (tuple2!459 (_1!245 array!325) (_2!245 BitStream!248)) )
))
(declare-fun lt!5255 () tuple2!458)

(declare-fun readBits!0 (BitStream!248 (_ BitVec 64)) tuple2!458)

(assert (=> b!4172 (= lt!5255 (readBits!0 (_1!244 lt!5253) nBits!460))))

(assert (=> b!4172 (validate_offset_bits!1 ((_ sign_extend 32) (size!135 (buf!456 (_2!243 lt!5254)))) ((_ sign_extend 32) (currentByte!1435 thiss!1486)) ((_ sign_extend 32) (currentBit!1430 thiss!1486)) nBits!460)))

(declare-fun lt!5252 () Unit!320)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!248 array!325 (_ BitVec 64)) Unit!320)

(assert (=> b!4172 (= lt!5252 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!456 (_2!243 lt!5254)) nBits!460))))

(declare-fun reader!0 (BitStream!248 BitStream!248) tuple2!456)

(assert (=> b!4172 (= lt!5253 (reader!0 thiss!1486 (_2!243 lt!5254)))))

(declare-fun b!4173 () Bool)

(declare-fun res!5565 () Bool)

(assert (=> b!4173 (=> (not res!5565) (not e!2707))))

(assert (=> b!4173 (= res!5565 (= (size!135 (buf!456 thiss!1486)) (size!135 (buf!456 (_2!243 lt!5254)))))))

(assert (= (and start!1062 res!5562) b!4167))

(assert (= (and b!4167 res!5566) b!4171))

(assert (= (and b!4171 res!5563) b!4173))

(assert (= (and b!4173 res!5565) b!4170))

(assert (= (and b!4170 res!5564) b!4169))

(assert (= (and b!4169 res!5561) b!4172))

(assert (= start!1062 b!4168))

(declare-fun m!4889 () Bool)

(assert (=> b!4172 m!4889))

(declare-fun m!4891 () Bool)

(assert (=> b!4172 m!4891))

(declare-fun m!4893 () Bool)

(assert (=> b!4172 m!4893))

(declare-fun m!4895 () Bool)

(assert (=> b!4172 m!4895))

(declare-fun m!4897 () Bool)

(assert (=> b!4172 m!4897))

(declare-fun m!4899 () Bool)

(assert (=> start!1062 m!4899))

(declare-fun m!4901 () Bool)

(assert (=> start!1062 m!4901))

(declare-fun m!4903 () Bool)

(assert (=> b!4168 m!4903))

(declare-fun m!4905 () Bool)

(assert (=> b!4170 m!4905))

(declare-fun m!4907 () Bool)

(assert (=> b!4170 m!4907))

(declare-fun m!4909 () Bool)

(assert (=> b!4171 m!4909))

(declare-fun m!4911 () Bool)

(assert (=> b!4171 m!4911))

(declare-fun m!4913 () Bool)

(assert (=> b!4167 m!4913))

(declare-fun m!4915 () Bool)

(assert (=> b!4169 m!4915))

(push 1)

(assert (not b!4172))

(assert (not b!4170))

(assert (not b!4169))

(assert (not start!1062))

(assert (not b!4168))

(assert (not b!4171))

(assert (not b!4167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

