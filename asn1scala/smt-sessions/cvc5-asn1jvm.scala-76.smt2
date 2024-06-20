; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1532 () Bool)

(assert start!1532)

(declare-fun b!7264 () Bool)

(declare-fun res!8048 () Bool)

(declare-fun e!4544 () Bool)

(assert (=> b!7264 (=> (not res!8048) (not e!4544))))

(declare-datatypes ((array!489 0))(
  ( (array!490 (arr!613 (Array (_ BitVec 32) (_ BitVec 8))) (size!211 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!400 0))(
  ( (BitStream!401 (buf!544 array!489) (currentByte!1547 (_ BitVec 32)) (currentBit!1542 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!400)

(declare-datatypes ((Unit!568 0))(
  ( (Unit!569) )
))
(declare-datatypes ((tuple2!958 0))(
  ( (tuple2!959 (_1!507 Unit!568) (_2!507 BitStream!400)) )
))
(declare-fun lt!9642 () tuple2!958)

(assert (=> b!7264 (= res!8048 (= (size!211 (buf!544 thiss!1486)) (size!211 (buf!544 (_2!507 lt!9642)))))))

(declare-fun b!7265 () Bool)

(declare-fun res!8051 () Bool)

(assert (=> b!7265 (=> (not res!8051) (not e!4544))))

(declare-fun isPrefixOf!0 (BitStream!400 BitStream!400) Bool)

(assert (=> b!7265 (= res!8051 (isPrefixOf!0 thiss!1486 (_2!507 lt!9642)))))

(declare-fun b!7266 () Bool)

(declare-fun res!8049 () Bool)

(declare-fun e!4539 () Bool)

(assert (=> b!7266 (=> res!8049 e!4539)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!111 0))(
  ( (Nil!108) (Cons!107 (h!226 Bool) (t!861 List!111)) )
))
(declare-fun lt!9646 () List!111)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!489)

(declare-fun byteArrayBitContentToList!0 (BitStream!400 array!489 (_ BitVec 64) (_ BitVec 64)) List!111)

(assert (=> b!7266 (= res!8049 (not (= lt!9646 (byteArrayBitContentToList!0 (_2!507 lt!9642) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7267 () Bool)

(declare-fun e!4541 () Bool)

(declare-fun array_inv!206 (array!489) Bool)

(assert (=> b!7267 (= e!4541 (array_inv!206 (buf!544 thiss!1486)))))

(declare-fun b!7268 () Bool)

(declare-fun e!4542 () Bool)

(assert (=> b!7268 (= e!4542 e!4544)))

(declare-fun res!8053 () Bool)

(assert (=> b!7268 (=> (not res!8053) (not e!4544))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7268 (= res!8053 (invariant!0 (currentBit!1542 (_2!507 lt!9642)) (currentByte!1547 (_2!507 lt!9642)) (size!211 (buf!544 (_2!507 lt!9642)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!400 array!489 (_ BitVec 64) (_ BitVec 64)) tuple2!958)

(assert (=> b!7268 (= lt!9642 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7269 () Bool)

(declare-fun res!8046 () Bool)

(assert (=> b!7269 (=> (not res!8046) (not e!4544))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7269 (= res!8046 (= (bitIndex!0 (size!211 (buf!544 (_2!507 lt!9642))) (currentByte!1547 (_2!507 lt!9642)) (currentBit!1542 (_2!507 lt!9642))) (bvadd (bitIndex!0 (size!211 (buf!544 thiss!1486)) (currentByte!1547 thiss!1486) (currentBit!1542 thiss!1486)) nBits!460)))))

(declare-fun b!7270 () Bool)

(assert (=> b!7270 (= e!4544 (not e!4539))))

(declare-fun res!8050 () Bool)

(assert (=> b!7270 (=> res!8050 e!4539)))

(declare-datatypes ((tuple2!960 0))(
  ( (tuple2!961 (_1!508 array!489) (_2!508 BitStream!400)) )
))
(declare-fun lt!9643 () tuple2!960)

(assert (=> b!7270 (= res!8050 (not (= (byteArrayBitContentToList!0 (_2!507 lt!9642) (_1!508 lt!9643) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9646)))))

(declare-datatypes ((tuple2!962 0))(
  ( (tuple2!963 (_1!509 BitStream!400) (_2!509 BitStream!400)) )
))
(declare-fun lt!9645 () tuple2!962)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!400 BitStream!400 (_ BitVec 64)) List!111)

(assert (=> b!7270 (= lt!9646 (bitStreamReadBitsIntoList!0 (_2!507 lt!9642) (_1!509 lt!9645) nBits!460))))

(declare-fun readBits!0 (BitStream!400 (_ BitVec 64)) tuple2!960)

(assert (=> b!7270 (= lt!9643 (readBits!0 (_1!509 lt!9645) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7270 (validate_offset_bits!1 ((_ sign_extend 32) (size!211 (buf!544 (_2!507 lt!9642)))) ((_ sign_extend 32) (currentByte!1547 thiss!1486)) ((_ sign_extend 32) (currentBit!1542 thiss!1486)) nBits!460)))

(declare-fun lt!9644 () Unit!568)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!400 array!489 (_ BitVec 64)) Unit!568)

(assert (=> b!7270 (= lt!9644 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!544 (_2!507 lt!9642)) nBits!460))))

(declare-fun reader!0 (BitStream!400 BitStream!400) tuple2!962)

(assert (=> b!7270 (= lt!9645 (reader!0 thiss!1486 (_2!507 lt!9642)))))

(declare-fun res!8047 () Bool)

(assert (=> start!1532 (=> (not res!8047) (not e!4542))))

(assert (=> start!1532 (= res!8047 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!211 srcBuffer!6))))))))

(assert (=> start!1532 e!4542))

(assert (=> start!1532 true))

(assert (=> start!1532 (array_inv!206 srcBuffer!6)))

(declare-fun inv!12 (BitStream!400) Bool)

(assert (=> start!1532 (and (inv!12 thiss!1486) e!4541)))

(declare-fun b!7271 () Bool)

(declare-fun res!8052 () Bool)

(assert (=> b!7271 (=> (not res!8052) (not e!4542))))

(assert (=> b!7271 (= res!8052 (validate_offset_bits!1 ((_ sign_extend 32) (size!211 (buf!544 thiss!1486))) ((_ sign_extend 32) (currentByte!1547 thiss!1486)) ((_ sign_extend 32) (currentBit!1542 thiss!1486)) nBits!460))))

(declare-fun b!7272 () Bool)

(assert (=> b!7272 (= e!4539 true)))

(declare-fun lt!9647 () Unit!568)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!400 array!489 array!489 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!568)

(assert (=> b!7272 (= lt!9647 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!507 lt!9642) srcBuffer!6 (_1!508 lt!9643) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1532 res!8047) b!7271))

(assert (= (and b!7271 res!8052) b!7268))

(assert (= (and b!7268 res!8053) b!7264))

(assert (= (and b!7264 res!8048) b!7269))

(assert (= (and b!7269 res!8046) b!7265))

(assert (= (and b!7265 res!8051) b!7270))

(assert (= (and b!7270 (not res!8050)) b!7266))

(assert (= (and b!7266 (not res!8049)) b!7272))

(assert (= start!1532 b!7267))

(declare-fun m!9303 () Bool)

(assert (=> b!7265 m!9303))

(declare-fun m!9305 () Bool)

(assert (=> b!7266 m!9305))

(declare-fun m!9307 () Bool)

(assert (=> b!7269 m!9307))

(declare-fun m!9309 () Bool)

(assert (=> b!7269 m!9309))

(declare-fun m!9311 () Bool)

(assert (=> b!7267 m!9311))

(declare-fun m!9313 () Bool)

(assert (=> b!7270 m!9313))

(declare-fun m!9315 () Bool)

(assert (=> b!7270 m!9315))

(declare-fun m!9317 () Bool)

(assert (=> b!7270 m!9317))

(declare-fun m!9319 () Bool)

(assert (=> b!7270 m!9319))

(declare-fun m!9321 () Bool)

(assert (=> b!7270 m!9321))

(declare-fun m!9323 () Bool)

(assert (=> b!7270 m!9323))

(declare-fun m!9325 () Bool)

(assert (=> b!7272 m!9325))

(declare-fun m!9327 () Bool)

(assert (=> start!1532 m!9327))

(declare-fun m!9329 () Bool)

(assert (=> start!1532 m!9329))

(declare-fun m!9331 () Bool)

(assert (=> b!7268 m!9331))

(declare-fun m!9333 () Bool)

(assert (=> b!7268 m!9333))

(declare-fun m!9335 () Bool)

(assert (=> b!7271 m!9335))

(push 1)

(assert (not b!7270))

(assert (not b!7272))

(assert (not b!7268))

(assert (not b!7269))

(assert (not start!1532))

(assert (not b!7265))

(assert (not b!7266))

(assert (not b!7267))

(assert (not b!7271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

