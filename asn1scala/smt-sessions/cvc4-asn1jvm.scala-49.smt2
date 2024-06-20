; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1056 () Bool)

(assert start!1056)

(declare-fun res!5510 () Bool)

(declare-fun e!2662 () Bool)

(assert (=> start!1056 (=> (not res!5510) (not e!2662))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!319 0))(
  ( (array!320 (arr!522 (Array (_ BitVec 32) (_ BitVec 8))) (size!132 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!319)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1056 (= res!5510 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!132 srcBuffer!6))))))))

(assert (=> start!1056 e!2662))

(assert (=> start!1056 true))

(declare-fun array_inv!127 (array!319) Bool)

(assert (=> start!1056 (array_inv!127 srcBuffer!6)))

(declare-datatypes ((BitStream!242 0))(
  ( (BitStream!243 (buf!453 array!319) (currentByte!1432 (_ BitVec 32)) (currentBit!1427 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!242)

(declare-fun e!2666 () Bool)

(declare-fun inv!12 (BitStream!242) Bool)

(assert (=> start!1056 (and (inv!12 thiss!1486) e!2666)))

(declare-fun b!4104 () Bool)

(declare-fun res!5509 () Bool)

(assert (=> b!4104 (=> (not res!5509) (not e!2662))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4104 (= res!5509 (validate_offset_bits!1 ((_ sign_extend 32) (size!132 (buf!453 thiss!1486))) ((_ sign_extend 32) (currentByte!1432 thiss!1486)) ((_ sign_extend 32) (currentBit!1427 thiss!1486)) nBits!460))))

(declare-fun b!4105 () Bool)

(declare-fun e!2665 () Bool)

(assert (=> b!4105 (= e!2662 e!2665)))

(declare-fun res!5512 () Bool)

(assert (=> b!4105 (=> (not res!5512) (not e!2665))))

(declare-datatypes ((Unit!314 0))(
  ( (Unit!315) )
))
(declare-datatypes ((tuple2!436 0))(
  ( (tuple2!437 (_1!234 Unit!314) (_2!234 BitStream!242)) )
))
(declare-fun lt!5207 () tuple2!436)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4105 (= res!5512 (invariant!0 (currentBit!1427 (_2!234 lt!5207)) (currentByte!1432 (_2!234 lt!5207)) (size!132 (buf!453 (_2!234 lt!5207)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!242 array!319 (_ BitVec 64) (_ BitVec 64)) tuple2!436)

(assert (=> b!4105 (= lt!5207 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4106 () Bool)

(declare-fun res!5508 () Bool)

(assert (=> b!4106 (=> (not res!5508) (not e!2665))))

(declare-fun isPrefixOf!0 (BitStream!242 BitStream!242) Bool)

(assert (=> b!4106 (= res!5508 (isPrefixOf!0 thiss!1486 (_2!234 lt!5207)))))

(declare-fun b!4107 () Bool)

(declare-fun res!5511 () Bool)

(assert (=> b!4107 (=> (not res!5511) (not e!2665))))

(assert (=> b!4107 (= res!5511 (= (size!132 (buf!453 thiss!1486)) (size!132 (buf!453 (_2!234 lt!5207)))))))

(declare-fun b!4108 () Bool)

(assert (=> b!4108 (= e!2666 (array_inv!127 (buf!453 thiss!1486)))))

(declare-fun b!4109 () Bool)

(assert (=> b!4109 (= e!2665 (not true))))

(declare-datatypes ((tuple2!438 0))(
  ( (tuple2!439 (_1!235 BitStream!242) (_2!235 BitStream!242)) )
))
(declare-fun lt!5210 () tuple2!438)

(declare-datatypes ((List!32 0))(
  ( (Nil!29) (Cons!28 (h!147 Bool) (t!782 List!32)) )
))
(declare-fun lt!5206 () List!32)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!242 BitStream!242 (_ BitVec 64)) List!32)

(assert (=> b!4109 (= lt!5206 (bitStreamReadBitsIntoList!0 (_2!234 lt!5207) (_1!235 lt!5210) nBits!460))))

(declare-datatypes ((tuple2!440 0))(
  ( (tuple2!441 (_1!236 array!319) (_2!236 BitStream!242)) )
))
(declare-fun lt!5209 () tuple2!440)

(declare-fun readBits!0 (BitStream!242 (_ BitVec 64)) tuple2!440)

(assert (=> b!4109 (= lt!5209 (readBits!0 (_1!235 lt!5210) nBits!460))))

(assert (=> b!4109 (validate_offset_bits!1 ((_ sign_extend 32) (size!132 (buf!453 (_2!234 lt!5207)))) ((_ sign_extend 32) (currentByte!1432 thiss!1486)) ((_ sign_extend 32) (currentBit!1427 thiss!1486)) nBits!460)))

(declare-fun lt!5208 () Unit!314)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!242 array!319 (_ BitVec 64)) Unit!314)

(assert (=> b!4109 (= lt!5208 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!453 (_2!234 lt!5207)) nBits!460))))

(declare-fun reader!0 (BitStream!242 BitStream!242) tuple2!438)

(assert (=> b!4109 (= lt!5210 (reader!0 thiss!1486 (_2!234 lt!5207)))))

(declare-fun b!4110 () Bool)

(declare-fun res!5507 () Bool)

(assert (=> b!4110 (=> (not res!5507) (not e!2665))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4110 (= res!5507 (= (bitIndex!0 (size!132 (buf!453 (_2!234 lt!5207))) (currentByte!1432 (_2!234 lt!5207)) (currentBit!1427 (_2!234 lt!5207))) (bvadd (bitIndex!0 (size!132 (buf!453 thiss!1486)) (currentByte!1432 thiss!1486) (currentBit!1427 thiss!1486)) nBits!460)))))

(assert (= (and start!1056 res!5510) b!4104))

(assert (= (and b!4104 res!5509) b!4105))

(assert (= (and b!4105 res!5512) b!4107))

(assert (= (and b!4107 res!5511) b!4110))

(assert (= (and b!4110 res!5507) b!4106))

(assert (= (and b!4106 res!5508) b!4109))

(assert (= start!1056 b!4108))

(declare-fun m!4805 () Bool)

(assert (=> b!4106 m!4805))

(declare-fun m!4807 () Bool)

(assert (=> start!1056 m!4807))

(declare-fun m!4809 () Bool)

(assert (=> start!1056 m!4809))

(declare-fun m!4811 () Bool)

(assert (=> b!4108 m!4811))

(declare-fun m!4813 () Bool)

(assert (=> b!4104 m!4813))

(declare-fun m!4815 () Bool)

(assert (=> b!4109 m!4815))

(declare-fun m!4817 () Bool)

(assert (=> b!4109 m!4817))

(declare-fun m!4819 () Bool)

(assert (=> b!4109 m!4819))

(declare-fun m!4821 () Bool)

(assert (=> b!4109 m!4821))

(declare-fun m!4823 () Bool)

(assert (=> b!4109 m!4823))

(declare-fun m!4825 () Bool)

(assert (=> b!4110 m!4825))

(declare-fun m!4827 () Bool)

(assert (=> b!4110 m!4827))

(declare-fun m!4829 () Bool)

(assert (=> b!4105 m!4829))

(declare-fun m!4831 () Bool)

(assert (=> b!4105 m!4831))

(push 1)

(assert (not b!4110))

(assert (not b!4106))

(assert (not b!4104))

(assert (not b!4105))

(assert (not b!4108))

(assert (not b!4109))

(assert (not start!1056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

