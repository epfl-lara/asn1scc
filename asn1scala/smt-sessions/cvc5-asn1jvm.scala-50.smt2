; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1058 () Bool)

(assert start!1058)

(declare-fun b!4125 () Bool)

(declare-fun res!5530 () Bool)

(declare-fun e!2679 () Bool)

(assert (=> b!4125 (=> (not res!5530) (not e!2679))))

(declare-datatypes ((array!321 0))(
  ( (array!322 (arr!523 (Array (_ BitVec 32) (_ BitVec 8))) (size!133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!244 0))(
  ( (BitStream!245 (buf!454 array!321) (currentByte!1433 (_ BitVec 32)) (currentBit!1428 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!244)

(declare-datatypes ((Unit!316 0))(
  ( (Unit!317) )
))
(declare-datatypes ((tuple2!442 0))(
  ( (tuple2!443 (_1!237 Unit!316) (_2!237 BitStream!244)) )
))
(declare-fun lt!5225 () tuple2!442)

(declare-fun isPrefixOf!0 (BitStream!244 BitStream!244) Bool)

(assert (=> b!4125 (= res!5530 (isPrefixOf!0 thiss!1486 (_2!237 lt!5225)))))

(declare-fun b!4126 () Bool)

(declare-fun res!5528 () Bool)

(assert (=> b!4126 (=> (not res!5528) (not e!2679))))

(assert (=> b!4126 (= res!5528 (= (size!133 (buf!454 thiss!1486)) (size!133 (buf!454 (_2!237 lt!5225)))))))

(declare-fun b!4127 () Bool)

(declare-fun res!5529 () Bool)

(assert (=> b!4127 (=> (not res!5529) (not e!2679))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4127 (= res!5529 (= (bitIndex!0 (size!133 (buf!454 (_2!237 lt!5225))) (currentByte!1433 (_2!237 lt!5225)) (currentBit!1428 (_2!237 lt!5225))) (bvadd (bitIndex!0 (size!133 (buf!454 thiss!1486)) (currentByte!1433 thiss!1486) (currentBit!1428 thiss!1486)) nBits!460)))))

(declare-fun b!4128 () Bool)

(declare-fun res!5526 () Bool)

(declare-fun e!2678 () Bool)

(assert (=> b!4128 (=> (not res!5526) (not e!2678))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4128 (= res!5526 (validate_offset_bits!1 ((_ sign_extend 32) (size!133 (buf!454 thiss!1486))) ((_ sign_extend 32) (currentByte!1433 thiss!1486)) ((_ sign_extend 32) (currentBit!1428 thiss!1486)) nBits!460))))

(declare-fun res!5525 () Bool)

(assert (=> start!1058 (=> (not res!5525) (not e!2678))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!321)

(assert (=> start!1058 (= res!5525 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!133 srcBuffer!6))))))))

(assert (=> start!1058 e!2678))

(assert (=> start!1058 true))

(declare-fun array_inv!128 (array!321) Bool)

(assert (=> start!1058 (array_inv!128 srcBuffer!6)))

(declare-fun e!2680 () Bool)

(declare-fun inv!12 (BitStream!244) Bool)

(assert (=> start!1058 (and (inv!12 thiss!1486) e!2680)))

(declare-fun b!4129 () Bool)

(assert (=> b!4129 (= e!2678 e!2679)))

(declare-fun res!5527 () Bool)

(assert (=> b!4129 (=> (not res!5527) (not e!2679))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4129 (= res!5527 (invariant!0 (currentBit!1428 (_2!237 lt!5225)) (currentByte!1433 (_2!237 lt!5225)) (size!133 (buf!454 (_2!237 lt!5225)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!244 array!321 (_ BitVec 64) (_ BitVec 64)) tuple2!442)

(assert (=> b!4129 (= lt!5225 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4130 () Bool)

(assert (=> b!4130 (= e!2680 (array_inv!128 (buf!454 thiss!1486)))))

(declare-fun b!4131 () Bool)

(assert (=> b!4131 (= e!2679 (not true))))

(declare-datatypes ((List!33 0))(
  ( (Nil!30) (Cons!29 (h!148 Bool) (t!783 List!33)) )
))
(declare-fun lt!5222 () List!33)

(declare-datatypes ((tuple2!444 0))(
  ( (tuple2!445 (_1!238 BitStream!244) (_2!238 BitStream!244)) )
))
(declare-fun lt!5223 () tuple2!444)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!244 BitStream!244 (_ BitVec 64)) List!33)

(assert (=> b!4131 (= lt!5222 (bitStreamReadBitsIntoList!0 (_2!237 lt!5225) (_1!238 lt!5223) nBits!460))))

(declare-datatypes ((tuple2!446 0))(
  ( (tuple2!447 (_1!239 array!321) (_2!239 BitStream!244)) )
))
(declare-fun lt!5224 () tuple2!446)

(declare-fun readBits!0 (BitStream!244 (_ BitVec 64)) tuple2!446)

(assert (=> b!4131 (= lt!5224 (readBits!0 (_1!238 lt!5223) nBits!460))))

(assert (=> b!4131 (validate_offset_bits!1 ((_ sign_extend 32) (size!133 (buf!454 (_2!237 lt!5225)))) ((_ sign_extend 32) (currentByte!1433 thiss!1486)) ((_ sign_extend 32) (currentBit!1428 thiss!1486)) nBits!460)))

(declare-fun lt!5221 () Unit!316)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!244 array!321 (_ BitVec 64)) Unit!316)

(assert (=> b!4131 (= lt!5221 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!454 (_2!237 lt!5225)) nBits!460))))

(declare-fun reader!0 (BitStream!244 BitStream!244) tuple2!444)

(assert (=> b!4131 (= lt!5223 (reader!0 thiss!1486 (_2!237 lt!5225)))))

(assert (= (and start!1058 res!5525) b!4128))

(assert (= (and b!4128 res!5526) b!4129))

(assert (= (and b!4129 res!5527) b!4126))

(assert (= (and b!4126 res!5528) b!4127))

(assert (= (and b!4127 res!5529) b!4125))

(assert (= (and b!4125 res!5530) b!4131))

(assert (= start!1058 b!4130))

(declare-fun m!4833 () Bool)

(assert (=> b!4125 m!4833))

(declare-fun m!4835 () Bool)

(assert (=> b!4127 m!4835))

(declare-fun m!4837 () Bool)

(assert (=> b!4127 m!4837))

(declare-fun m!4839 () Bool)

(assert (=> b!4131 m!4839))

(declare-fun m!4841 () Bool)

(assert (=> b!4131 m!4841))

(declare-fun m!4843 () Bool)

(assert (=> b!4131 m!4843))

(declare-fun m!4845 () Bool)

(assert (=> b!4131 m!4845))

(declare-fun m!4847 () Bool)

(assert (=> b!4131 m!4847))

(declare-fun m!4849 () Bool)

(assert (=> start!1058 m!4849))

(declare-fun m!4851 () Bool)

(assert (=> start!1058 m!4851))

(declare-fun m!4853 () Bool)

(assert (=> b!4129 m!4853))

(declare-fun m!4855 () Bool)

(assert (=> b!4129 m!4855))

(declare-fun m!4857 () Bool)

(assert (=> b!4130 m!4857))

(declare-fun m!4859 () Bool)

(assert (=> b!4128 m!4859))

(push 1)

(assert (not b!4131))

(assert (not start!1058))

(assert (not b!4128))

(assert (not b!4127))

(assert (not b!4125))

(assert (not b!4129))

(assert (not b!4130))

(check-sat)

(pop 1)

