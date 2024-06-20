; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1092 () Bool)

(assert start!1092)

(declare-fun b!4482 () Bool)

(declare-fun res!5831 () Bool)

(declare-fun e!2933 () Bool)

(assert (=> b!4482 (=> (not res!5831) (not e!2933))))

(declare-datatypes ((array!355 0))(
  ( (array!356 (arr!540 (Array (_ BitVec 32) (_ BitVec 8))) (size!150 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!278 0))(
  ( (BitStream!279 (buf!471 array!355) (currentByte!1450 (_ BitVec 32)) (currentBit!1445 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!278)

(declare-datatypes ((Unit!350 0))(
  ( (Unit!351) )
))
(declare-datatypes ((tuple2!544 0))(
  ( (tuple2!545 (_1!288 Unit!350) (_2!288 BitStream!278)) )
))
(declare-fun lt!5476 () tuple2!544)

(assert (=> b!4482 (= res!5831 (= (size!150 (buf!471 thiss!1486)) (size!150 (buf!471 (_2!288 lt!5476)))))))

(declare-fun res!5834 () Bool)

(declare-fun e!2932 () Bool)

(assert (=> start!1092 (=> (not res!5834) (not e!2932))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!355)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1092 (= res!5834 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!150 srcBuffer!6))))))))

(assert (=> start!1092 e!2932))

(assert (=> start!1092 true))

(declare-fun array_inv!145 (array!355) Bool)

(assert (=> start!1092 (array_inv!145 srcBuffer!6)))

(declare-fun e!2934 () Bool)

(declare-fun inv!12 (BitStream!278) Bool)

(assert (=> start!1092 (and (inv!12 thiss!1486) e!2934)))

(declare-fun b!4483 () Bool)

(assert (=> b!4483 (= e!2934 (array_inv!145 (buf!471 thiss!1486)))))

(declare-fun b!4484 () Bool)

(assert (=> b!4484 (= e!2932 e!2933)))

(declare-fun res!5836 () Bool)

(assert (=> b!4484 (=> (not res!5836) (not e!2933))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4484 (= res!5836 (invariant!0 (currentBit!1445 (_2!288 lt!5476)) (currentByte!1450 (_2!288 lt!5476)) (size!150 (buf!471 (_2!288 lt!5476)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!278 array!355 (_ BitVec 64) (_ BitVec 64)) tuple2!544)

(assert (=> b!4484 (= lt!5476 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4485 () Bool)

(declare-fun res!5835 () Bool)

(assert (=> b!4485 (=> (not res!5835) (not e!2933))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4485 (= res!5835 (= (bitIndex!0 (size!150 (buf!471 (_2!288 lt!5476))) (currentByte!1450 (_2!288 lt!5476)) (currentBit!1445 (_2!288 lt!5476))) (bvadd (bitIndex!0 (size!150 (buf!471 thiss!1486)) (currentByte!1450 thiss!1486) (currentBit!1445 thiss!1486)) nBits!460)))))

(declare-fun b!4486 () Bool)

(assert (=> b!4486 (= e!2933 (not true))))

(declare-datatypes ((List!50 0))(
  ( (Nil!47) (Cons!46 (h!165 Bool) (t!800 List!50)) )
))
(declare-fun lt!5477 () List!50)

(declare-datatypes ((tuple2!546 0))(
  ( (tuple2!547 (_1!289 BitStream!278) (_2!289 BitStream!278)) )
))
(declare-fun lt!5478 () tuple2!546)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!278 BitStream!278 (_ BitVec 64)) List!50)

(assert (=> b!4486 (= lt!5477 (bitStreamReadBitsIntoList!0 (_2!288 lt!5476) (_1!289 lt!5478) nBits!460))))

(declare-datatypes ((tuple2!548 0))(
  ( (tuple2!549 (_1!290 array!355) (_2!290 BitStream!278)) )
))
(declare-fun lt!5479 () tuple2!548)

(declare-fun readBits!0 (BitStream!278 (_ BitVec 64)) tuple2!548)

(assert (=> b!4486 (= lt!5479 (readBits!0 (_1!289 lt!5478) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4486 (validate_offset_bits!1 ((_ sign_extend 32) (size!150 (buf!471 (_2!288 lt!5476)))) ((_ sign_extend 32) (currentByte!1450 thiss!1486)) ((_ sign_extend 32) (currentBit!1445 thiss!1486)) nBits!460)))

(declare-fun lt!5480 () Unit!350)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!278 array!355 (_ BitVec 64)) Unit!350)

(assert (=> b!4486 (= lt!5480 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!471 (_2!288 lt!5476)) nBits!460))))

(declare-fun reader!0 (BitStream!278 BitStream!278) tuple2!546)

(assert (=> b!4486 (= lt!5478 (reader!0 thiss!1486 (_2!288 lt!5476)))))

(declare-fun b!4487 () Bool)

(declare-fun res!5832 () Bool)

(assert (=> b!4487 (=> (not res!5832) (not e!2932))))

(assert (=> b!4487 (= res!5832 (validate_offset_bits!1 ((_ sign_extend 32) (size!150 (buf!471 thiss!1486))) ((_ sign_extend 32) (currentByte!1450 thiss!1486)) ((_ sign_extend 32) (currentBit!1445 thiss!1486)) nBits!460))))

(declare-fun b!4488 () Bool)

(declare-fun res!5833 () Bool)

(assert (=> b!4488 (=> (not res!5833) (not e!2933))))

(declare-fun isPrefixOf!0 (BitStream!278 BitStream!278) Bool)

(assert (=> b!4488 (= res!5833 (isPrefixOf!0 thiss!1486 (_2!288 lt!5476)))))

(assert (= (and start!1092 res!5834) b!4487))

(assert (= (and b!4487 res!5832) b!4484))

(assert (= (and b!4484 res!5836) b!4482))

(assert (= (and b!4482 res!5831) b!4485))

(assert (= (and b!4485 res!5835) b!4488))

(assert (= (and b!4488 res!5833) b!4486))

(assert (= start!1092 b!4483))

(declare-fun m!5309 () Bool)

(assert (=> start!1092 m!5309))

(declare-fun m!5311 () Bool)

(assert (=> start!1092 m!5311))

(declare-fun m!5313 () Bool)

(assert (=> b!4486 m!5313))

(declare-fun m!5315 () Bool)

(assert (=> b!4486 m!5315))

(declare-fun m!5317 () Bool)

(assert (=> b!4486 m!5317))

(declare-fun m!5319 () Bool)

(assert (=> b!4486 m!5319))

(declare-fun m!5321 () Bool)

(assert (=> b!4486 m!5321))

(declare-fun m!5323 () Bool)

(assert (=> b!4487 m!5323))

(declare-fun m!5325 () Bool)

(assert (=> b!4484 m!5325))

(declare-fun m!5327 () Bool)

(assert (=> b!4484 m!5327))

(declare-fun m!5329 () Bool)

(assert (=> b!4488 m!5329))

(declare-fun m!5331 () Bool)

(assert (=> b!4485 m!5331))

(declare-fun m!5333 () Bool)

(assert (=> b!4485 m!5333))

(declare-fun m!5335 () Bool)

(assert (=> b!4483 m!5335))

(push 1)

(assert (not b!4483))

(assert (not b!4486))

(assert (not start!1092))

(assert (not b!4484))

(assert (not b!4487))

(assert (not b!4485))

(assert (not b!4488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

