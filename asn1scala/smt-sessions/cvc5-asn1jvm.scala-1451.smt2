; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39740 () Bool)

(assert start!39740)

(declare-fun b!180263 () Bool)

(declare-fun e!125290 () Bool)

(declare-fun e!125293 () Bool)

(assert (=> b!180263 (= e!125290 e!125293)))

(declare-fun res!149668 () Bool)

(assert (=> b!180263 (=> (not res!149668) (not e!125293))))

(declare-datatypes ((array!9674 0))(
  ( (array!9675 (arr!5197 (Array (_ BitVec 32) (_ BitVec 8))) (size!4267 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7642 0))(
  ( (BitStream!7643 (buf!4710 array!9674) (currentByte!8920 (_ BitVec 32)) (currentBit!8915 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12953 0))(
  ( (Unit!12954) )
))
(declare-datatypes ((tuple2!15548 0))(
  ( (tuple2!15549 (_1!8419 Unit!12953) (_2!8419 BitStream!7642)) )
))
(declare-fun lt!276376 () tuple2!15548)

(declare-fun lt!276385 () Bool)

(declare-datatypes ((tuple2!15550 0))(
  ( (tuple2!15551 (_1!8420 BitStream!7642) (_2!8420 Bool)) )
))
(declare-fun lt!276377 () tuple2!15550)

(assert (=> b!180263 (= res!149668 (and (= (_2!8420 lt!276377) lt!276385) (= (_1!8420 lt!276377) (_2!8419 lt!276376))))))

(declare-fun thiss!1204 () BitStream!7642)

(declare-fun readBitPure!0 (BitStream!7642) tuple2!15550)

(declare-fun readerFrom!0 (BitStream!7642 (_ BitVec 32) (_ BitVec 32)) BitStream!7642)

(assert (=> b!180263 (= lt!276377 (readBitPure!0 (readerFrom!0 (_2!8419 lt!276376) (currentBit!8915 thiss!1204) (currentByte!8920 thiss!1204))))))

(declare-fun b!180264 () Bool)

(declare-fun e!125289 () Bool)

(declare-fun lt!276372 () tuple2!15550)

(declare-fun lt!276382 () tuple2!15550)

(assert (=> b!180264 (= e!125289 (= (_2!8420 lt!276372) (_2!8420 lt!276382)))))

(declare-fun res!149671 () Bool)

(declare-fun e!125288 () Bool)

(assert (=> start!39740 (=> (not res!149671) (not e!125288))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39740 (= res!149671 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39740 e!125288))

(assert (=> start!39740 true))

(declare-fun e!125284 () Bool)

(declare-fun inv!12 (BitStream!7642) Bool)

(assert (=> start!39740 (and (inv!12 thiss!1204) e!125284)))

(declare-fun b!180265 () Bool)

(declare-fun res!149669 () Bool)

(declare-fun e!125283 () Bool)

(assert (=> b!180265 (=> res!149669 e!125283)))

(declare-fun lt!276373 () tuple2!15548)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180265 (= res!149669 (not (invariant!0 (currentBit!8915 (_2!8419 lt!276373)) (currentByte!8920 (_2!8419 lt!276373)) (size!4267 (buf!4710 (_2!8419 lt!276373))))))))

(declare-fun b!180266 () Bool)

(declare-fun res!149663 () Bool)

(assert (=> b!180266 (=> res!149663 e!125283)))

(declare-fun isPrefixOf!0 (BitStream!7642 BitStream!7642) Bool)

(assert (=> b!180266 (= res!149663 (not (isPrefixOf!0 thiss!1204 (_2!8419 lt!276376))))))

(declare-fun b!180267 () Bool)

(declare-fun res!149665 () Bool)

(declare-fun e!125287 () Bool)

(assert (=> b!180267 (=> (not res!149665) (not e!125287))))

(assert (=> b!180267 (= res!149665 (not (= i!590 nBits!348)))))

(declare-fun b!180268 () Bool)

(declare-fun res!149659 () Bool)

(assert (=> b!180268 (=> (not res!149659) (not e!125290))))

(assert (=> b!180268 (= res!149659 (isPrefixOf!0 thiss!1204 (_2!8419 lt!276376)))))

(declare-fun b!180269 () Bool)

(assert (=> b!180269 (= e!125283 true)))

(declare-fun lt!276375 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180269 (validate_offset_bits!1 ((_ sign_extend 32) (size!4267 (buf!4710 (_2!8419 lt!276373)))) ((_ sign_extend 32) (currentByte!8920 thiss!1204)) ((_ sign_extend 32) (currentBit!8915 thiss!1204)) lt!276375)))

(declare-fun lt!276383 () Unit!12953)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7642 array!9674 (_ BitVec 64)) Unit!12953)

(assert (=> b!180269 (= lt!276383 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4710 (_2!8419 lt!276373)) lt!276375))))

(declare-datatypes ((tuple2!15552 0))(
  ( (tuple2!15553 (_1!8421 BitStream!7642) (_2!8421 BitStream!7642)) )
))
(declare-fun lt!276381 () tuple2!15552)

(assert (=> b!180269 (= (_2!8420 (readBitPure!0 (_1!8421 lt!276381))) lt!276385)))

(declare-fun lt!276384 () tuple2!15552)

(declare-fun reader!0 (BitStream!7642 BitStream!7642) tuple2!15552)

(assert (=> b!180269 (= lt!276384 (reader!0 (_2!8419 lt!276376) (_2!8419 lt!276373)))))

(assert (=> b!180269 (= lt!276381 (reader!0 thiss!1204 (_2!8419 lt!276373)))))

(assert (=> b!180269 e!125289))

(declare-fun res!149667 () Bool)

(assert (=> b!180269 (=> (not res!149667) (not e!125289))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180269 (= res!149667 (= (bitIndex!0 (size!4267 (buf!4710 (_1!8420 lt!276372))) (currentByte!8920 (_1!8420 lt!276372)) (currentBit!8915 (_1!8420 lt!276372))) (bitIndex!0 (size!4267 (buf!4710 (_1!8420 lt!276382))) (currentByte!8920 (_1!8420 lt!276382)) (currentBit!8915 (_1!8420 lt!276382)))))))

(declare-fun lt!276389 () Unit!12953)

(declare-fun lt!276379 () BitStream!7642)

(declare-fun readBitPrefixLemma!0 (BitStream!7642 BitStream!7642) Unit!12953)

(assert (=> b!180269 (= lt!276389 (readBitPrefixLemma!0 lt!276379 (_2!8419 lt!276373)))))

(assert (=> b!180269 (= lt!276382 (readBitPure!0 (BitStream!7643 (buf!4710 (_2!8419 lt!276373)) (currentByte!8920 thiss!1204) (currentBit!8915 thiss!1204))))))

(assert (=> b!180269 (= lt!276372 (readBitPure!0 lt!276379))))

(declare-fun e!125291 () Bool)

(assert (=> b!180269 e!125291))

(declare-fun res!149670 () Bool)

(assert (=> b!180269 (=> (not res!149670) (not e!125291))))

(assert (=> b!180269 (= res!149670 (invariant!0 (currentBit!8915 thiss!1204) (currentByte!8920 thiss!1204) (size!4267 (buf!4710 (_2!8419 lt!276376)))))))

(assert (=> b!180269 (= lt!276379 (BitStream!7643 (buf!4710 (_2!8419 lt!276376)) (currentByte!8920 thiss!1204) (currentBit!8915 thiss!1204)))))

(declare-fun b!180270 () Bool)

(declare-fun res!149658 () Bool)

(assert (=> b!180270 (=> res!149658 e!125283)))

(assert (=> b!180270 (= res!149658 (not (isPrefixOf!0 (_2!8419 lt!276376) (_2!8419 lt!276373))))))

(declare-fun b!180271 () Bool)

(declare-fun array_inv!4008 (array!9674) Bool)

(assert (=> b!180271 (= e!125284 (array_inv!4008 (buf!4710 thiss!1204)))))

(declare-fun b!180272 () Bool)

(declare-fun lt!276378 () (_ BitVec 64))

(assert (=> b!180272 (= e!125293 (= (bitIndex!0 (size!4267 (buf!4710 (_1!8420 lt!276377))) (currentByte!8920 (_1!8420 lt!276377)) (currentBit!8915 (_1!8420 lt!276377))) lt!276378))))

(declare-fun b!180273 () Bool)

(declare-fun e!125285 () Bool)

(assert (=> b!180273 (= e!125285 e!125283)))

(declare-fun res!149664 () Bool)

(assert (=> b!180273 (=> res!149664 e!125283)))

(declare-fun lt!276380 () (_ BitVec 64))

(declare-fun lt!276388 () (_ BitVec 64))

(assert (=> b!180273 (= res!149664 (not (= lt!276380 (bvsub (bvsub (bvadd lt!276388 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180273 (= lt!276380 (bitIndex!0 (size!4267 (buf!4710 (_2!8419 lt!276373))) (currentByte!8920 (_2!8419 lt!276373)) (currentBit!8915 (_2!8419 lt!276373))))))

(assert (=> b!180273 (isPrefixOf!0 thiss!1204 (_2!8419 lt!276373))))

(declare-fun lt!276386 () Unit!12953)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7642 BitStream!7642 BitStream!7642) Unit!12953)

(assert (=> b!180273 (= lt!276386 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8419 lt!276376) (_2!8419 lt!276373)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7642 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15548)

(assert (=> b!180273 (= lt!276373 (appendBitsLSBFirstLoopTR!0 (_2!8419 lt!276376) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180274 () Bool)

(declare-fun e!125286 () Bool)

(assert (=> b!180274 (= e!125286 e!125290)))

(declare-fun res!149662 () Bool)

(assert (=> b!180274 (=> (not res!149662) (not e!125290))))

(declare-fun lt!276387 () (_ BitVec 64))

(assert (=> b!180274 (= res!149662 (= lt!276378 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276387)))))

(assert (=> b!180274 (= lt!276378 (bitIndex!0 (size!4267 (buf!4710 (_2!8419 lt!276376))) (currentByte!8920 (_2!8419 lt!276376)) (currentBit!8915 (_2!8419 lt!276376))))))

(assert (=> b!180274 (= lt!276387 (bitIndex!0 (size!4267 (buf!4710 thiss!1204)) (currentByte!8920 thiss!1204) (currentBit!8915 thiss!1204)))))

(declare-fun b!180275 () Bool)

(assert (=> b!180275 (= e!125288 e!125287)))

(declare-fun res!149660 () Bool)

(assert (=> b!180275 (=> (not res!149660) (not e!125287))))

(assert (=> b!180275 (= res!149660 (validate_offset_bits!1 ((_ sign_extend 32) (size!4267 (buf!4710 thiss!1204))) ((_ sign_extend 32) (currentByte!8920 thiss!1204)) ((_ sign_extend 32) (currentBit!8915 thiss!1204)) lt!276375))))

(assert (=> b!180275 (= lt!276375 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!180276 () Bool)

(assert (=> b!180276 (= e!125287 (not e!125285))))

(declare-fun res!149661 () Bool)

(assert (=> b!180276 (=> res!149661 e!125285)))

(declare-fun lt!276374 () (_ BitVec 64))

(assert (=> b!180276 (= res!149661 (not (= lt!276388 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276374))))))

(assert (=> b!180276 (= lt!276388 (bitIndex!0 (size!4267 (buf!4710 (_2!8419 lt!276376))) (currentByte!8920 (_2!8419 lt!276376)) (currentBit!8915 (_2!8419 lt!276376))))))

(assert (=> b!180276 (= lt!276374 (bitIndex!0 (size!4267 (buf!4710 thiss!1204)) (currentByte!8920 thiss!1204) (currentBit!8915 thiss!1204)))))

(assert (=> b!180276 e!125286))

(declare-fun res!149673 () Bool)

(assert (=> b!180276 (=> (not res!149673) (not e!125286))))

(assert (=> b!180276 (= res!149673 (= (size!4267 (buf!4710 thiss!1204)) (size!4267 (buf!4710 (_2!8419 lt!276376)))))))

(declare-fun appendBit!0 (BitStream!7642 Bool) tuple2!15548)

(assert (=> b!180276 (= lt!276376 (appendBit!0 thiss!1204 lt!276385))))

(assert (=> b!180276 (= lt!276385 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180277 () Bool)

(declare-fun res!149666 () Bool)

(assert (=> b!180277 (=> res!149666 e!125283)))

(assert (=> b!180277 (= res!149666 (or (not (= (size!4267 (buf!4710 (_2!8419 lt!276373))) (size!4267 (buf!4710 thiss!1204)))) (not (= lt!276380 (bvsub (bvadd lt!276374 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180278 () Bool)

(declare-fun res!149672 () Bool)

(assert (=> b!180278 (=> (not res!149672) (not e!125287))))

(assert (=> b!180278 (= res!149672 (invariant!0 (currentBit!8915 thiss!1204) (currentByte!8920 thiss!1204) (size!4267 (buf!4710 thiss!1204))))))

(declare-fun b!180279 () Bool)

(assert (=> b!180279 (= e!125291 (invariant!0 (currentBit!8915 thiss!1204) (currentByte!8920 thiss!1204) (size!4267 (buf!4710 (_2!8419 lt!276373)))))))

(assert (= (and start!39740 res!149671) b!180275))

(assert (= (and b!180275 res!149660) b!180278))

(assert (= (and b!180278 res!149672) b!180267))

(assert (= (and b!180267 res!149665) b!180276))

(assert (= (and b!180276 res!149673) b!180274))

(assert (= (and b!180274 res!149662) b!180268))

(assert (= (and b!180268 res!149659) b!180263))

(assert (= (and b!180263 res!149668) b!180272))

(assert (= (and b!180276 (not res!149661)) b!180273))

(assert (= (and b!180273 (not res!149664)) b!180265))

(assert (= (and b!180265 (not res!149669)) b!180277))

(assert (= (and b!180277 (not res!149666)) b!180270))

(assert (= (and b!180270 (not res!149658)) b!180266))

(assert (= (and b!180266 (not res!149663)) b!180269))

(assert (= (and b!180269 res!149670) b!180279))

(assert (= (and b!180269 res!149667) b!180264))

(assert (= start!39740 b!180271))

(declare-fun m!280651 () Bool)

(assert (=> b!180276 m!280651))

(declare-fun m!280653 () Bool)

(assert (=> b!180276 m!280653))

(declare-fun m!280655 () Bool)

(assert (=> b!180276 m!280655))

(declare-fun m!280657 () Bool)

(assert (=> b!180275 m!280657))

(declare-fun m!280659 () Bool)

(assert (=> b!180278 m!280659))

(declare-fun m!280661 () Bool)

(assert (=> b!180265 m!280661))

(declare-fun m!280663 () Bool)

(assert (=> start!39740 m!280663))

(declare-fun m!280665 () Bool)

(assert (=> b!180273 m!280665))

(declare-fun m!280667 () Bool)

(assert (=> b!180273 m!280667))

(declare-fun m!280669 () Bool)

(assert (=> b!180273 m!280669))

(declare-fun m!280671 () Bool)

(assert (=> b!180273 m!280671))

(declare-fun m!280673 () Bool)

(assert (=> b!180270 m!280673))

(assert (=> b!180274 m!280651))

(assert (=> b!180274 m!280653))

(declare-fun m!280675 () Bool)

(assert (=> b!180266 m!280675))

(declare-fun m!280677 () Bool)

(assert (=> b!180263 m!280677))

(assert (=> b!180263 m!280677))

(declare-fun m!280679 () Bool)

(assert (=> b!180263 m!280679))

(assert (=> b!180268 m!280675))

(declare-fun m!280681 () Bool)

(assert (=> b!180269 m!280681))

(declare-fun m!280683 () Bool)

(assert (=> b!180269 m!280683))

(declare-fun m!280685 () Bool)

(assert (=> b!180269 m!280685))

(declare-fun m!280687 () Bool)

(assert (=> b!180269 m!280687))

(declare-fun m!280689 () Bool)

(assert (=> b!180269 m!280689))

(declare-fun m!280691 () Bool)

(assert (=> b!180269 m!280691))

(declare-fun m!280693 () Bool)

(assert (=> b!180269 m!280693))

(declare-fun m!280695 () Bool)

(assert (=> b!180269 m!280695))

(declare-fun m!280697 () Bool)

(assert (=> b!180269 m!280697))

(declare-fun m!280699 () Bool)

(assert (=> b!180269 m!280699))

(declare-fun m!280701 () Bool)

(assert (=> b!180269 m!280701))

(declare-fun m!280703 () Bool)

(assert (=> b!180279 m!280703))

(declare-fun m!280705 () Bool)

(assert (=> b!180272 m!280705))

(declare-fun m!280707 () Bool)

(assert (=> b!180271 m!280707))

(push 1)

(assert (not b!180266))

(assert (not b!180273))

(assert (not start!39740))

(assert (not b!180269))

(assert (not b!180270))

(assert (not b!180274))

(assert (not b!180279))

(assert (not b!180278))

(assert (not b!180276))

(assert (not b!180265))

(assert (not b!180271))

