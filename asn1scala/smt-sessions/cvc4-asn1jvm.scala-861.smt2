; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24958 () Bool)

(assert start!24958)

(declare-fun b!126316 () Bool)

(declare-fun e!83218 () Bool)

(declare-datatypes ((array!5709 0))(
  ( (array!5710 (arr!3188 (Array (_ BitVec 32) (_ BitVec 8))) (size!2583 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4490 0))(
  ( (BitStream!4491 (buf!2965 array!5709) (currentByte!5698 (_ BitVec 32)) (currentBit!5693 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4490)

(declare-fun array_inv!2372 (array!5709) Bool)

(assert (=> b!126316 (= e!83218 (array_inv!2372 (buf!2965 thiss!1614)))))

(declare-fun b!126317 () Bool)

(declare-fun e!83216 () Bool)

(declare-fun e!83220 () Bool)

(assert (=> b!126317 (= e!83216 (not e!83220))))

(declare-fun res!104662 () Bool)

(assert (=> b!126317 (=> res!104662 e!83220)))

(declare-datatypes ((tuple2!10564 0))(
  ( (tuple2!10565 (_1!5564 BitStream!4490) (_2!5564 BitStream!4490)) )
))
(declare-fun lt!197490 () tuple2!10564)

(declare-datatypes ((tuple2!10566 0))(
  ( (tuple2!10567 (_1!5565 BitStream!4490) (_2!5565 array!5709)) )
))
(declare-fun lt!197491 () tuple2!10566)

(declare-fun arr!227 () array!5709)

(assert (=> b!126317 (= res!104662 (or (not (= (size!2583 (_2!5565 lt!197491)) (size!2583 arr!227))) (not (= (_1!5565 lt!197491) (_2!5564 lt!197490)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4490 array!5709 (_ BitVec 32) (_ BitVec 32)) tuple2!10566)

(assert (=> b!126317 (= lt!197491 (readByteArrayLoopPure!0 (_1!5564 lt!197490) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7769 0))(
  ( (Unit!7770) )
))
(declare-datatypes ((tuple2!10568 0))(
  ( (tuple2!10569 (_1!5566 Unit!7769) (_2!5566 BitStream!4490)) )
))
(declare-fun lt!197492 () tuple2!10568)

(declare-fun lt!197489 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126317 (validate_offset_bits!1 ((_ sign_extend 32) (size!2583 (buf!2965 (_2!5566 lt!197492)))) ((_ sign_extend 32) (currentByte!5698 thiss!1614)) ((_ sign_extend 32) (currentBit!5693 thiss!1614)) lt!197489)))

(declare-fun lt!197488 () Unit!7769)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4490 array!5709 (_ BitVec 64)) Unit!7769)

(assert (=> b!126317 (= lt!197488 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2965 (_2!5566 lt!197492)) lt!197489))))

(declare-fun reader!0 (BitStream!4490 BitStream!4490) tuple2!10564)

(assert (=> b!126317 (= lt!197490 (reader!0 thiss!1614 (_2!5566 lt!197492)))))

(declare-fun b!126318 () Bool)

(declare-fun e!83217 () Bool)

(declare-fun e!83215 () Bool)

(assert (=> b!126318 (= e!83217 (not e!83215))))

(declare-fun res!104667 () Bool)

(assert (=> b!126318 (=> res!104667 e!83215)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126318 (= res!104667 (not (= (bitIndex!0 (size!2583 (buf!2965 (_2!5566 lt!197492))) (currentByte!5698 (_2!5566 lt!197492)) (currentBit!5693 (_2!5566 lt!197492))) (bvadd (bitIndex!0 (size!2583 (buf!2965 thiss!1614)) (currentByte!5698 thiss!1614) (currentBit!5693 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83222 () Bool)

(assert (=> b!126318 e!83222))

(declare-fun res!104661 () Bool)

(assert (=> b!126318 (=> (not res!104661) (not e!83222))))

(assert (=> b!126318 (= res!104661 (= (size!2583 (buf!2965 thiss!1614)) (size!2583 (buf!2965 (_2!5566 lt!197492)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4490 array!5709 (_ BitVec 32) (_ BitVec 32)) tuple2!10568)

(assert (=> b!126318 (= lt!197492 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126319 () Bool)

(declare-fun res!104668 () Bool)

(assert (=> b!126319 (=> (not res!104668) (not e!83216))))

(declare-fun isPrefixOf!0 (BitStream!4490 BitStream!4490) Bool)

(assert (=> b!126319 (= res!104668 (isPrefixOf!0 thiss!1614 (_2!5566 lt!197492)))))

(declare-fun b!126315 () Bool)

(declare-fun res!104664 () Bool)

(assert (=> b!126315 (=> (not res!104664) (not e!83217))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126315 (= res!104664 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2583 (buf!2965 thiss!1614))) ((_ sign_extend 32) (currentByte!5698 thiss!1614)) ((_ sign_extend 32) (currentBit!5693 thiss!1614)) noOfBytes!1))))

(declare-fun res!104663 () Bool)

(assert (=> start!24958 (=> (not res!104663) (not e!83217))))

(assert (=> start!24958 (= res!104663 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2583 arr!227))))))

(assert (=> start!24958 e!83217))

(assert (=> start!24958 true))

(assert (=> start!24958 (array_inv!2372 arr!227)))

(declare-fun inv!12 (BitStream!4490) Bool)

(assert (=> start!24958 (and (inv!12 thiss!1614) e!83218)))

(declare-fun b!126320 () Bool)

(assert (=> b!126320 (= e!83222 e!83216)))

(declare-fun res!104665 () Bool)

(assert (=> b!126320 (=> (not res!104665) (not e!83216))))

(assert (=> b!126320 (= res!104665 (= (bitIndex!0 (size!2583 (buf!2965 (_2!5566 lt!197492))) (currentByte!5698 (_2!5566 lt!197492)) (currentBit!5693 (_2!5566 lt!197492))) (bvadd (bitIndex!0 (size!2583 (buf!2965 thiss!1614)) (currentByte!5698 thiss!1614) (currentBit!5693 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197489))))))

(assert (=> b!126320 (= lt!197489 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126321 () Bool)

(assert (=> b!126321 (= e!83215 true)))

(declare-fun lt!197487 () tuple2!10564)

(assert (=> b!126321 (= lt!197487 (reader!0 thiss!1614 (_2!5566 lt!197492)))))

(declare-fun b!126322 () Bool)

(declare-fun arrayRangesEq!70 (array!5709 array!5709 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126322 (= e!83220 (not (arrayRangesEq!70 arr!227 (_2!5565 lt!197491) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126323 () Bool)

(declare-fun res!104666 () Bool)

(assert (=> b!126323 (=> res!104666 e!83215)))

(assert (=> b!126323 (= res!104666 (not (isPrefixOf!0 thiss!1614 (_2!5566 lt!197492))))))

(assert (= (and start!24958 res!104663) b!126315))

(assert (= (and b!126315 res!104664) b!126318))

(assert (= (and b!126318 res!104661) b!126320))

(assert (= (and b!126320 res!104665) b!126319))

(assert (= (and b!126319 res!104668) b!126317))

(assert (= (and b!126317 (not res!104662)) b!126322))

(assert (= (and b!126318 (not res!104667)) b!126323))

(assert (= (and b!126323 (not res!104666)) b!126321))

(assert (= start!24958 b!126316))

(declare-fun m!191809 () Bool)

(assert (=> start!24958 m!191809))

(declare-fun m!191811 () Bool)

(assert (=> start!24958 m!191811))

(declare-fun m!191813 () Bool)

(assert (=> b!126323 m!191813))

(declare-fun m!191815 () Bool)

(assert (=> b!126322 m!191815))

(declare-fun m!191817 () Bool)

(assert (=> b!126315 m!191817))

(declare-fun m!191819 () Bool)

(assert (=> b!126321 m!191819))

(declare-fun m!191821 () Bool)

(assert (=> b!126320 m!191821))

(declare-fun m!191823 () Bool)

(assert (=> b!126320 m!191823))

(assert (=> b!126318 m!191821))

(assert (=> b!126318 m!191823))

(declare-fun m!191825 () Bool)

(assert (=> b!126318 m!191825))

(assert (=> b!126319 m!191813))

(declare-fun m!191827 () Bool)

(assert (=> b!126316 m!191827))

(declare-fun m!191829 () Bool)

(assert (=> b!126317 m!191829))

(declare-fun m!191831 () Bool)

(assert (=> b!126317 m!191831))

(declare-fun m!191833 () Bool)

(assert (=> b!126317 m!191833))

(assert (=> b!126317 m!191819))

(push 1)

(assert (not b!126321))

(assert (not b!126318))

(assert (not b!126319))

(assert (not b!126323))

(assert (not b!126317))

(assert (not b!126322))

(assert (not start!24958))

(assert (not b!126320))

(assert (not b!126316))

(assert (not b!126315))

(check-sat)

(pop 1)

