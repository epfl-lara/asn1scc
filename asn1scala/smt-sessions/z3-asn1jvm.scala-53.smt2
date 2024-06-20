; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1078 () Bool)

(assert start!1078)

(declare-fun b!4335 () Bool)

(declare-fun e!2831 () Bool)

(assert (=> b!4335 (= e!2831 (not true))))

(declare-datatypes ((array!341 0))(
  ( (array!342 (arr!533 (Array (_ BitVec 32) (_ BitVec 8))) (size!143 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!264 0))(
  ( (BitStream!265 (buf!464 array!341) (currentByte!1443 (_ BitVec 32)) (currentBit!1438 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!502 0))(
  ( (tuple2!503 (_1!267 BitStream!264) (_2!267 BitStream!264)) )
))
(declare-fun lt!5372 () tuple2!502)

(declare-datatypes ((Unit!336 0))(
  ( (Unit!337) )
))
(declare-datatypes ((tuple2!504 0))(
  ( (tuple2!505 (_1!268 Unit!336) (_2!268 BitStream!264)) )
))
(declare-fun lt!5374 () tuple2!504)

(declare-datatypes ((List!43 0))(
  ( (Nil!40) (Cons!39 (h!158 Bool) (t!793 List!43)) )
))
(declare-fun lt!5373 () List!43)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!264 BitStream!264 (_ BitVec 64)) List!43)

(assert (=> b!4335 (= lt!5373 (bitStreamReadBitsIntoList!0 (_2!268 lt!5374) (_1!267 lt!5372) nBits!460))))

(declare-datatypes ((tuple2!506 0))(
  ( (tuple2!507 (_1!269 array!341) (_2!269 BitStream!264)) )
))
(declare-fun lt!5371 () tuple2!506)

(declare-fun readBits!0 (BitStream!264 (_ BitVec 64)) tuple2!506)

(assert (=> b!4335 (= lt!5371 (readBits!0 (_1!267 lt!5372) nBits!460))))

(declare-fun thiss!1486 () BitStream!264)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4335 (validate_offset_bits!1 ((_ sign_extend 32) (size!143 (buf!464 (_2!268 lt!5374)))) ((_ sign_extend 32) (currentByte!1443 thiss!1486)) ((_ sign_extend 32) (currentBit!1438 thiss!1486)) nBits!460)))

(declare-fun lt!5375 () Unit!336)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!264 array!341 (_ BitVec 64)) Unit!336)

(assert (=> b!4335 (= lt!5375 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!464 (_2!268 lt!5374)) nBits!460))))

(declare-fun reader!0 (BitStream!264 BitStream!264) tuple2!502)

(assert (=> b!4335 (= lt!5372 (reader!0 thiss!1486 (_2!268 lt!5374)))))

(declare-fun b!4337 () Bool)

(declare-fun e!2829 () Bool)

(declare-fun array_inv!138 (array!341) Bool)

(assert (=> b!4337 (= e!2829 (array_inv!138 (buf!464 thiss!1486)))))

(declare-fun b!4338 () Bool)

(declare-fun e!2828 () Bool)

(assert (=> b!4338 (= e!2828 e!2831)))

(declare-fun res!5708 () Bool)

(assert (=> b!4338 (=> (not res!5708) (not e!2831))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4338 (= res!5708 (invariant!0 (currentBit!1438 (_2!268 lt!5374)) (currentByte!1443 (_2!268 lt!5374)) (size!143 (buf!464 (_2!268 lt!5374)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!341)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!264 array!341 (_ BitVec 64) (_ BitVec 64)) tuple2!504)

(assert (=> b!4338 (= lt!5374 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4339 () Bool)

(declare-fun res!5707 () Bool)

(assert (=> b!4339 (=> (not res!5707) (not e!2831))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4339 (= res!5707 (= (bitIndex!0 (size!143 (buf!464 (_2!268 lt!5374))) (currentByte!1443 (_2!268 lt!5374)) (currentBit!1438 (_2!268 lt!5374))) (bvadd (bitIndex!0 (size!143 (buf!464 thiss!1486)) (currentByte!1443 thiss!1486) (currentBit!1438 thiss!1486)) nBits!460)))))

(declare-fun b!4340 () Bool)

(declare-fun res!5705 () Bool)

(assert (=> b!4340 (=> (not res!5705) (not e!2831))))

(assert (=> b!4340 (= res!5705 (= (size!143 (buf!464 thiss!1486)) (size!143 (buf!464 (_2!268 lt!5374)))))))

(declare-fun b!4341 () Bool)

(declare-fun res!5710 () Bool)

(assert (=> b!4341 (=> (not res!5710) (not e!2828))))

(assert (=> b!4341 (= res!5710 (validate_offset_bits!1 ((_ sign_extend 32) (size!143 (buf!464 thiss!1486))) ((_ sign_extend 32) (currentByte!1443 thiss!1486)) ((_ sign_extend 32) (currentBit!1438 thiss!1486)) nBits!460))))

(declare-fun res!5706 () Bool)

(assert (=> start!1078 (=> (not res!5706) (not e!2828))))

(assert (=> start!1078 (= res!5706 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!143 srcBuffer!6))))))))

(assert (=> start!1078 e!2828))

(assert (=> start!1078 true))

(assert (=> start!1078 (array_inv!138 srcBuffer!6)))

(declare-fun inv!12 (BitStream!264) Bool)

(assert (=> start!1078 (and (inv!12 thiss!1486) e!2829)))

(declare-fun b!4336 () Bool)

(declare-fun res!5709 () Bool)

(assert (=> b!4336 (=> (not res!5709) (not e!2831))))

(declare-fun isPrefixOf!0 (BitStream!264 BitStream!264) Bool)

(assert (=> b!4336 (= res!5709 (isPrefixOf!0 thiss!1486 (_2!268 lt!5374)))))

(assert (= (and start!1078 res!5706) b!4341))

(assert (= (and b!4341 res!5710) b!4338))

(assert (= (and b!4338 res!5708) b!4340))

(assert (= (and b!4340 res!5705) b!4339))

(assert (= (and b!4339 res!5707) b!4336))

(assert (= (and b!4336 res!5709) b!4335))

(assert (= start!1078 b!4337))

(declare-fun m!5113 () Bool)

(assert (=> b!4341 m!5113))

(declare-fun m!5115 () Bool)

(assert (=> b!4336 m!5115))

(declare-fun m!5117 () Bool)

(assert (=> b!4335 m!5117))

(declare-fun m!5119 () Bool)

(assert (=> b!4335 m!5119))

(declare-fun m!5121 () Bool)

(assert (=> b!4335 m!5121))

(declare-fun m!5123 () Bool)

(assert (=> b!4335 m!5123))

(declare-fun m!5125 () Bool)

(assert (=> b!4335 m!5125))

(declare-fun m!5127 () Bool)

(assert (=> b!4337 m!5127))

(declare-fun m!5129 () Bool)

(assert (=> start!1078 m!5129))

(declare-fun m!5131 () Bool)

(assert (=> start!1078 m!5131))

(declare-fun m!5133 () Bool)

(assert (=> b!4339 m!5133))

(declare-fun m!5135 () Bool)

(assert (=> b!4339 m!5135))

(declare-fun m!5137 () Bool)

(assert (=> b!4338 m!5137))

(declare-fun m!5139 () Bool)

(assert (=> b!4338 m!5139))

(check-sat (not b!4335) (not b!4339) (not b!4338) (not b!4336) (not b!4341) (not b!4337) (not start!1078))
