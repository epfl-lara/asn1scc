; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1412 () Bool)

(assert start!1412)

(declare-fun b!6460 () Bool)

(declare-fun e!4067 () Bool)

(declare-fun e!4065 () Bool)

(assert (=> b!6460 (= e!4067 (not e!4065))))

(declare-fun res!7399 () Bool)

(assert (=> b!6460 (=> res!7399 e!4065)))

(declare-datatypes ((array!450 0))(
  ( (array!451 (arr!592 (Array (_ BitVec 32) (_ BitVec 8))) (size!193 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!364 0))(
  ( (BitStream!365 (buf!523 array!450) (currentByte!1520 (_ BitVec 32)) (currentBit!1515 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!508 0))(
  ( (Unit!509) )
))
(declare-datatypes ((tuple2!838 0))(
  ( (tuple2!839 (_1!444 Unit!508) (_2!444 BitStream!364)) )
))
(declare-fun lt!8549 () tuple2!838)

(declare-datatypes ((List!93 0))(
  ( (Nil!90) (Cons!89 (h!208 Bool) (t!843 List!93)) )
))
(declare-fun lt!8548 () List!93)

(declare-datatypes ((tuple2!840 0))(
  ( (tuple2!841 (_1!445 array!450) (_2!445 BitStream!364)) )
))
(declare-fun lt!8547 () tuple2!840)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!364 array!450 (_ BitVec 64) (_ BitVec 64)) List!93)

(assert (=> b!6460 (= res!7399 (not (= (byteArrayBitContentToList!0 (_2!444 lt!8549) (_1!445 lt!8547) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8548)))))

(declare-datatypes ((tuple2!842 0))(
  ( (tuple2!843 (_1!446 BitStream!364) (_2!446 BitStream!364)) )
))
(declare-fun lt!8545 () tuple2!842)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!364 BitStream!364 (_ BitVec 64)) List!93)

(assert (=> b!6460 (= lt!8548 (bitStreamReadBitsIntoList!0 (_2!444 lt!8549) (_1!446 lt!8545) nBits!460))))

(declare-fun readBits!0 (BitStream!364 (_ BitVec 64)) tuple2!840)

(assert (=> b!6460 (= lt!8547 (readBits!0 (_1!446 lt!8545) nBits!460))))

(declare-fun thiss!1486 () BitStream!364)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6460 (validate_offset_bits!1 ((_ sign_extend 32) (size!193 (buf!523 (_2!444 lt!8549)))) ((_ sign_extend 32) (currentByte!1520 thiss!1486)) ((_ sign_extend 32) (currentBit!1515 thiss!1486)) nBits!460)))

(declare-fun lt!8544 () Unit!508)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!364 array!450 (_ BitVec 64)) Unit!508)

(assert (=> b!6460 (= lt!8544 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!523 (_2!444 lt!8549)) nBits!460))))

(declare-fun reader!0 (BitStream!364 BitStream!364) tuple2!842)

(assert (=> b!6460 (= lt!8545 (reader!0 thiss!1486 (_2!444 lt!8549)))))

(declare-fun b!6461 () Bool)

(assert (=> b!6461 (= e!4065 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun lt!8546 () Unit!508)

(declare-fun srcBuffer!6 () array!450)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!364 array!450 array!450 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!508)

(assert (=> b!6461 (= lt!8546 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!444 lt!8549) srcBuffer!6 (_1!445 lt!8547) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6462 () Bool)

(declare-fun res!7398 () Bool)

(declare-fun e!4070 () Bool)

(assert (=> b!6462 (=> (not res!7398) (not e!4070))))

(assert (=> b!6462 (= res!7398 (validate_offset_bits!1 ((_ sign_extend 32) (size!193 (buf!523 thiss!1486))) ((_ sign_extend 32) (currentByte!1520 thiss!1486)) ((_ sign_extend 32) (currentBit!1515 thiss!1486)) nBits!460))))

(declare-fun b!6463 () Bool)

(declare-fun res!7396 () Bool)

(assert (=> b!6463 (=> (not res!7396) (not e!4067))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6463 (= res!7396 (= (bitIndex!0 (size!193 (buf!523 (_2!444 lt!8549))) (currentByte!1520 (_2!444 lt!8549)) (currentBit!1515 (_2!444 lt!8549))) (bvadd (bitIndex!0 (size!193 (buf!523 thiss!1486)) (currentByte!1520 thiss!1486) (currentBit!1515 thiss!1486)) nBits!460)))))

(declare-fun b!6464 () Bool)

(assert (=> b!6464 (= e!4070 e!4067)))

(declare-fun res!7395 () Bool)

(assert (=> b!6464 (=> (not res!7395) (not e!4067))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6464 (= res!7395 (invariant!0 (currentBit!1515 (_2!444 lt!8549)) (currentByte!1520 (_2!444 lt!8549)) (size!193 (buf!523 (_2!444 lt!8549)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!364 array!450 (_ BitVec 64) (_ BitVec 64)) tuple2!838)

(assert (=> b!6464 (= lt!8549 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!7394 () Bool)

(assert (=> start!1412 (=> (not res!7394) (not e!4070))))

(assert (=> start!1412 (= res!7394 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!193 srcBuffer!6))))))))

(assert (=> start!1412 e!4070))

(assert (=> start!1412 true))

(declare-fun array_inv!188 (array!450) Bool)

(assert (=> start!1412 (array_inv!188 srcBuffer!6)))

(declare-fun e!4068 () Bool)

(declare-fun inv!12 (BitStream!364) Bool)

(assert (=> start!1412 (and (inv!12 thiss!1486) e!4068)))

(declare-fun b!6465 () Bool)

(declare-fun res!7392 () Bool)

(assert (=> b!6465 (=> (not res!7392) (not e!4067))))

(assert (=> b!6465 (= res!7392 (= (size!193 (buf!523 thiss!1486)) (size!193 (buf!523 (_2!444 lt!8549)))))))

(declare-fun b!6466 () Bool)

(declare-fun res!7397 () Bool)

(assert (=> b!6466 (=> res!7397 e!4065)))

(assert (=> b!6466 (= res!7397 (not (= lt!8548 (byteArrayBitContentToList!0 (_2!444 lt!8549) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6467 () Bool)

(declare-fun res!7393 () Bool)

(assert (=> b!6467 (=> (not res!7393) (not e!4067))))

(declare-fun isPrefixOf!0 (BitStream!364 BitStream!364) Bool)

(assert (=> b!6467 (= res!7393 (isPrefixOf!0 thiss!1486 (_2!444 lt!8549)))))

(declare-fun b!6468 () Bool)

(assert (=> b!6468 (= e!4068 (array_inv!188 (buf!523 thiss!1486)))))

(assert (= (and start!1412 res!7394) b!6462))

(assert (= (and b!6462 res!7398) b!6464))

(assert (= (and b!6464 res!7395) b!6465))

(assert (= (and b!6465 res!7392) b!6463))

(assert (= (and b!6463 res!7396) b!6467))

(assert (= (and b!6467 res!7393) b!6460))

(assert (= (and b!6460 (not res!7399)) b!6466))

(assert (= (and b!6466 (not res!7397)) b!6461))

(assert (= start!1412 b!6468))

(declare-fun m!8181 () Bool)

(assert (=> b!6464 m!8181))

(declare-fun m!8183 () Bool)

(assert (=> b!6464 m!8183))

(declare-fun m!8185 () Bool)

(assert (=> b!6460 m!8185))

(declare-fun m!8187 () Bool)

(assert (=> b!6460 m!8187))

(declare-fun m!8189 () Bool)

(assert (=> b!6460 m!8189))

(declare-fun m!8191 () Bool)

(assert (=> b!6460 m!8191))

(declare-fun m!8193 () Bool)

(assert (=> b!6460 m!8193))

(declare-fun m!8195 () Bool)

(assert (=> b!6460 m!8195))

(declare-fun m!8197 () Bool)

(assert (=> b!6466 m!8197))

(declare-fun m!8199 () Bool)

(assert (=> b!6461 m!8199))

(declare-fun m!8201 () Bool)

(assert (=> b!6468 m!8201))

(declare-fun m!8203 () Bool)

(assert (=> start!1412 m!8203))

(declare-fun m!8205 () Bool)

(assert (=> start!1412 m!8205))

(declare-fun m!8207 () Bool)

(assert (=> b!6463 m!8207))

(declare-fun m!8209 () Bool)

(assert (=> b!6463 m!8209))

(declare-fun m!8211 () Bool)

(assert (=> b!6467 m!8211))

(declare-fun m!8213 () Bool)

(assert (=> b!6462 m!8213))

(push 1)

(assert (not b!6468))

(assert (not b!6462))

(assert (not b!6460))

(assert (not b!6463))

(assert (not b!6466))

(assert (not b!6464))

(assert (not b!6461))

(assert (not b!6467))

(assert (not start!1412))

(check-sat)

