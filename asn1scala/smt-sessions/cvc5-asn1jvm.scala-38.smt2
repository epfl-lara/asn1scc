; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!794 () Bool)

(assert start!794)

(declare-fun b!2667 () Bool)

(declare-fun res!4341 () Bool)

(declare-fun e!1851 () Bool)

(assert (=> b!2667 (=> (not res!4341) (not e!1851))))

(declare-datatypes ((array!240 0))(
  ( (array!241 (arr!484 (Array (_ BitVec 32) (_ BitVec 8))) (size!97 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!172 0))(
  ( (BitStream!173 (buf!409 array!240) (currentByte!1370 (_ BitVec 32)) (currentBit!1365 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!172)

(declare-datatypes ((Unit!172 0))(
  ( (Unit!173) )
))
(declare-datatypes ((tuple2!214 0))(
  ( (tuple2!215 (_1!114 Unit!172) (_2!114 BitStream!172)) )
))
(declare-fun lt!2519 () tuple2!214)

(declare-fun isPrefixOf!0 (BitStream!172 BitStream!172) Bool)

(assert (=> b!2667 (= res!4341 (isPrefixOf!0 thiss!1486 (_2!114 lt!2519)))))

(declare-fun b!2668 () Bool)

(declare-fun res!4340 () Bool)

(assert (=> b!2668 (=> (not res!4340) (not e!1851))))

(assert (=> b!2668 (= res!4340 (= (size!97 (buf!409 thiss!1486)) (size!97 (buf!409 (_2!114 lt!2519)))))))

(declare-fun b!2670 () Bool)

(declare-fun e!1849 () Bool)

(assert (=> b!2670 (= e!1849 e!1851)))

(declare-fun res!4342 () Bool)

(assert (=> b!2670 (=> (not res!4342) (not e!1851))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2670 (= res!4342 (invariant!0 (currentBit!1365 (_2!114 lt!2519)) (currentByte!1370 (_2!114 lt!2519)) (size!97 (buf!409 (_2!114 lt!2519)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!240)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!172 array!240 (_ BitVec 64) (_ BitVec 64)) tuple2!214)

(assert (=> b!2670 (= lt!2519 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2671 () Bool)

(declare-fun res!4339 () Bool)

(assert (=> b!2671 (=> (not res!4339) (not e!1849))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2671 (= res!4339 (validate_offset_bits!1 ((_ sign_extend 32) (size!97 (buf!409 thiss!1486))) ((_ sign_extend 32) (currentByte!1370 thiss!1486)) ((_ sign_extend 32) (currentBit!1365 thiss!1486)) nBits!460))))

(declare-fun b!2669 () Bool)

(declare-fun res!4337 () Bool)

(assert (=> b!2669 (=> (not res!4337) (not e!1851))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2669 (= res!4337 (= (bitIndex!0 (size!97 (buf!409 (_2!114 lt!2519))) (currentByte!1370 (_2!114 lt!2519)) (currentBit!1365 (_2!114 lt!2519))) (bvadd (bitIndex!0 (size!97 (buf!409 thiss!1486)) (currentByte!1370 thiss!1486) (currentBit!1365 thiss!1486)) nBits!460)))))

(declare-fun res!4338 () Bool)

(assert (=> start!794 (=> (not res!4338) (not e!1849))))

(assert (=> start!794 (= res!4338 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!97 srcBuffer!6))))))))

(assert (=> start!794 e!1849))

(assert (=> start!794 true))

(declare-fun array_inv!92 (array!240) Bool)

(assert (=> start!794 (array_inv!92 srcBuffer!6)))

(declare-fun e!1850 () Bool)

(declare-fun inv!12 (BitStream!172) Bool)

(assert (=> start!794 (and (inv!12 thiss!1486) e!1850)))

(declare-fun b!2672 () Bool)

(assert (=> b!2672 (= e!1850 (array_inv!92 (buf!409 thiss!1486)))))

(declare-fun b!2673 () Bool)

(assert (=> b!2673 (= e!1851 (not true))))

(declare-datatypes ((tuple2!216 0))(
  ( (tuple2!217 (_1!115 array!240) (_2!115 BitStream!172)) )
))
(declare-fun lt!2521 () tuple2!216)

(declare-datatypes ((tuple2!218 0))(
  ( (tuple2!219 (_1!116 BitStream!172) (_2!116 BitStream!172)) )
))
(declare-fun lt!2522 () tuple2!218)

(declare-fun readBits!0 (BitStream!172 (_ BitVec 64)) tuple2!216)

(assert (=> b!2673 (= lt!2521 (readBits!0 (_1!116 lt!2522) nBits!460))))

(assert (=> b!2673 (validate_offset_bits!1 ((_ sign_extend 32) (size!97 (buf!409 (_2!114 lt!2519)))) ((_ sign_extend 32) (currentByte!1370 thiss!1486)) ((_ sign_extend 32) (currentBit!1365 thiss!1486)) nBits!460)))

(declare-fun lt!2520 () Unit!172)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!172 array!240 (_ BitVec 64)) Unit!172)

(assert (=> b!2673 (= lt!2520 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!409 (_2!114 lt!2519)) nBits!460))))

(declare-fun reader!0 (BitStream!172 BitStream!172) tuple2!218)

(assert (=> b!2673 (= lt!2522 (reader!0 thiss!1486 (_2!114 lt!2519)))))

(assert (= (and start!794 res!4338) b!2671))

(assert (= (and b!2671 res!4339) b!2670))

(assert (= (and b!2670 res!4342) b!2668))

(assert (= (and b!2668 res!4340) b!2669))

(assert (= (and b!2669 res!4337) b!2667))

(assert (= (and b!2667 res!4341) b!2673))

(assert (= start!794 b!2672))

(declare-fun m!2535 () Bool)

(assert (=> b!2669 m!2535))

(declare-fun m!2537 () Bool)

(assert (=> b!2669 m!2537))

(declare-fun m!2539 () Bool)

(assert (=> b!2673 m!2539))

(declare-fun m!2541 () Bool)

(assert (=> b!2673 m!2541))

(declare-fun m!2543 () Bool)

(assert (=> b!2673 m!2543))

(declare-fun m!2545 () Bool)

(assert (=> b!2673 m!2545))

(declare-fun m!2547 () Bool)

(assert (=> b!2667 m!2547))

(declare-fun m!2549 () Bool)

(assert (=> b!2672 m!2549))

(declare-fun m!2551 () Bool)

(assert (=> b!2671 m!2551))

(declare-fun m!2553 () Bool)

(assert (=> b!2670 m!2553))

(declare-fun m!2555 () Bool)

(assert (=> b!2670 m!2555))

(declare-fun m!2557 () Bool)

(assert (=> start!794 m!2557))

(declare-fun m!2559 () Bool)

(assert (=> start!794 m!2559))

(push 1)

(assert (not start!794))

(assert (not b!2671))

(assert (not b!2669))

(assert (not b!2673))

(assert (not b!2672))

(assert (not b!2667))

(assert (not b!2670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

