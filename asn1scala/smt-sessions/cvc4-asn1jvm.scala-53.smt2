; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1080 () Bool)

(assert start!1080)

(declare-fun b!4356 () Bool)

(declare-fun res!5727 () Bool)

(declare-fun e!2843 () Bool)

(assert (=> b!4356 (=> (not res!5727) (not e!2843))))

(declare-datatypes ((array!343 0))(
  ( (array!344 (arr!534 (Array (_ BitVec 32) (_ BitVec 8))) (size!144 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!266 0))(
  ( (BitStream!267 (buf!465 array!343) (currentByte!1444 (_ BitVec 32)) (currentBit!1439 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!338 0))(
  ( (Unit!339) )
))
(declare-datatypes ((tuple2!508 0))(
  ( (tuple2!509 (_1!270 Unit!338) (_2!270 BitStream!266)) )
))
(declare-fun lt!5387 () tuple2!508)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!266)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4356 (= res!5727 (= (bitIndex!0 (size!144 (buf!465 (_2!270 lt!5387))) (currentByte!1444 (_2!270 lt!5387)) (currentBit!1439 (_2!270 lt!5387))) (bvadd (bitIndex!0 (size!144 (buf!465 thiss!1486)) (currentByte!1444 thiss!1486) (currentBit!1439 thiss!1486)) nBits!460)))))

(declare-fun b!4357 () Bool)

(declare-fun res!5723 () Bool)

(assert (=> b!4357 (=> (not res!5723) (not e!2843))))

(assert (=> b!4357 (= res!5723 (= (size!144 (buf!465 thiss!1486)) (size!144 (buf!465 (_2!270 lt!5387)))))))

(declare-fun b!4358 () Bool)

(declare-fun e!2844 () Bool)

(declare-fun array_inv!139 (array!343) Bool)

(assert (=> b!4358 (= e!2844 (array_inv!139 (buf!465 thiss!1486)))))

(declare-fun b!4359 () Bool)

(declare-fun e!2845 () Bool)

(assert (=> b!4359 (= e!2845 e!2843)))

(declare-fun res!5726 () Bool)

(assert (=> b!4359 (=> (not res!5726) (not e!2843))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4359 (= res!5726 (invariant!0 (currentBit!1439 (_2!270 lt!5387)) (currentByte!1444 (_2!270 lt!5387)) (size!144 (buf!465 (_2!270 lt!5387)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!343)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!266 array!343 (_ BitVec 64) (_ BitVec 64)) tuple2!508)

(assert (=> b!4359 (= lt!5387 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!5724 () Bool)

(assert (=> start!1080 (=> (not res!5724) (not e!2845))))

(assert (=> start!1080 (= res!5724 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!144 srcBuffer!6))))))))

(assert (=> start!1080 e!2845))

(assert (=> start!1080 true))

(assert (=> start!1080 (array_inv!139 srcBuffer!6)))

(declare-fun inv!12 (BitStream!266) Bool)

(assert (=> start!1080 (and (inv!12 thiss!1486) e!2844)))

(declare-fun b!4360 () Bool)

(declare-fun res!5728 () Bool)

(assert (=> b!4360 (=> (not res!5728) (not e!2845))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4360 (= res!5728 (validate_offset_bits!1 ((_ sign_extend 32) (size!144 (buf!465 thiss!1486))) ((_ sign_extend 32) (currentByte!1444 thiss!1486)) ((_ sign_extend 32) (currentBit!1439 thiss!1486)) nBits!460))))

(declare-fun b!4361 () Bool)

(assert (=> b!4361 (= e!2843 (not true))))

(declare-datatypes ((List!44 0))(
  ( (Nil!41) (Cons!40 (h!159 Bool) (t!794 List!44)) )
))
(declare-fun lt!5390 () List!44)

(declare-datatypes ((tuple2!510 0))(
  ( (tuple2!511 (_1!271 BitStream!266) (_2!271 BitStream!266)) )
))
(declare-fun lt!5388 () tuple2!510)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!266 BitStream!266 (_ BitVec 64)) List!44)

(assert (=> b!4361 (= lt!5390 (bitStreamReadBitsIntoList!0 (_2!270 lt!5387) (_1!271 lt!5388) nBits!460))))

(declare-datatypes ((tuple2!512 0))(
  ( (tuple2!513 (_1!272 array!343) (_2!272 BitStream!266)) )
))
(declare-fun lt!5386 () tuple2!512)

(declare-fun readBits!0 (BitStream!266 (_ BitVec 64)) tuple2!512)

(assert (=> b!4361 (= lt!5386 (readBits!0 (_1!271 lt!5388) nBits!460))))

(assert (=> b!4361 (validate_offset_bits!1 ((_ sign_extend 32) (size!144 (buf!465 (_2!270 lt!5387)))) ((_ sign_extend 32) (currentByte!1444 thiss!1486)) ((_ sign_extend 32) (currentBit!1439 thiss!1486)) nBits!460)))

(declare-fun lt!5389 () Unit!338)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!266 array!343 (_ BitVec 64)) Unit!338)

(assert (=> b!4361 (= lt!5389 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!465 (_2!270 lt!5387)) nBits!460))))

(declare-fun reader!0 (BitStream!266 BitStream!266) tuple2!510)

(assert (=> b!4361 (= lt!5388 (reader!0 thiss!1486 (_2!270 lt!5387)))))

(declare-fun b!4362 () Bool)

(declare-fun res!5725 () Bool)

(assert (=> b!4362 (=> (not res!5725) (not e!2843))))

(declare-fun isPrefixOf!0 (BitStream!266 BitStream!266) Bool)

(assert (=> b!4362 (= res!5725 (isPrefixOf!0 thiss!1486 (_2!270 lt!5387)))))

(assert (= (and start!1080 res!5724) b!4360))

(assert (= (and b!4360 res!5728) b!4359))

(assert (= (and b!4359 res!5726) b!4357))

(assert (= (and b!4357 res!5723) b!4356))

(assert (= (and b!4356 res!5727) b!4362))

(assert (= (and b!4362 res!5725) b!4361))

(assert (= start!1080 b!4358))

(declare-fun m!5141 () Bool)

(assert (=> b!4361 m!5141))

(declare-fun m!5143 () Bool)

(assert (=> b!4361 m!5143))

(declare-fun m!5145 () Bool)

(assert (=> b!4361 m!5145))

(declare-fun m!5147 () Bool)

(assert (=> b!4361 m!5147))

(declare-fun m!5149 () Bool)

(assert (=> b!4361 m!5149))

(declare-fun m!5151 () Bool)

(assert (=> b!4358 m!5151))

(declare-fun m!5153 () Bool)

(assert (=> b!4359 m!5153))

(declare-fun m!5155 () Bool)

(assert (=> b!4359 m!5155))

(declare-fun m!5157 () Bool)

(assert (=> b!4360 m!5157))

(declare-fun m!5159 () Bool)

(assert (=> start!1080 m!5159))

(declare-fun m!5161 () Bool)

(assert (=> start!1080 m!5161))

(declare-fun m!5163 () Bool)

(assert (=> b!4362 m!5163))

(declare-fun m!5165 () Bool)

(assert (=> b!4356 m!5165))

(declare-fun m!5167 () Bool)

(assert (=> b!4356 m!5167))

(push 1)

(assert (not b!4361))

(assert (not b!4360))

(assert (not b!4359))

(assert (not b!4356))

(assert (not b!4358))

(assert (not b!4362))

(assert (not start!1080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

