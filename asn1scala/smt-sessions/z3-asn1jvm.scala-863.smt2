; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24968 () Bool)

(assert start!24968)

(declare-fun res!104782 () Bool)

(declare-fun e!83340 () Bool)

(assert (=> start!24968 (=> (not res!104782) (not e!83340))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5719 0))(
  ( (array!5720 (arr!3193 (Array (_ BitVec 32) (_ BitVec 8))) (size!2588 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5719)

(assert (=> start!24968 (= res!104782 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2588 arr!227))))))

(assert (=> start!24968 e!83340))

(assert (=> start!24968 true))

(declare-fun array_inv!2377 (array!5719) Bool)

(assert (=> start!24968 (array_inv!2377 arr!227)))

(declare-datatypes ((BitStream!4500 0))(
  ( (BitStream!4501 (buf!2970 array!5719) (currentByte!5703 (_ BitVec 32)) (currentBit!5698 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4500)

(declare-fun e!83337 () Bool)

(declare-fun inv!12 (BitStream!4500) Bool)

(assert (=> start!24968 (and (inv!12 thiss!1614) e!83337)))

(declare-fun b!126450 () Bool)

(declare-fun e!83342 () Bool)

(assert (=> b!126450 (= e!83340 (not e!83342))))

(declare-fun res!104783 () Bool)

(assert (=> b!126450 (=> res!104783 e!83342)))

(declare-datatypes ((Unit!7779 0))(
  ( (Unit!7780) )
))
(declare-datatypes ((tuple2!10594 0))(
  ( (tuple2!10595 (_1!5579 Unit!7779) (_2!5579 BitStream!4500)) )
))
(declare-fun lt!197583 () tuple2!10594)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126450 (= res!104783 (not (= (bitIndex!0 (size!2588 (buf!2970 (_2!5579 lt!197583))) (currentByte!5703 (_2!5579 lt!197583)) (currentBit!5698 (_2!5579 lt!197583))) (bvadd (bitIndex!0 (size!2588 (buf!2970 thiss!1614)) (currentByte!5703 thiss!1614) (currentBit!5698 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83341 () Bool)

(assert (=> b!126450 e!83341))

(declare-fun res!104781 () Bool)

(assert (=> b!126450 (=> (not res!104781) (not e!83341))))

(assert (=> b!126450 (= res!104781 (= (size!2588 (buf!2970 thiss!1614)) (size!2588 (buf!2970 (_2!5579 lt!197583)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4500 array!5719 (_ BitVec 32) (_ BitVec 32)) tuple2!10594)

(assert (=> b!126450 (= lt!197583 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126451 () Bool)

(declare-fun e!83335 () Bool)

(declare-fun e!83338 () Bool)

(assert (=> b!126451 (= e!83335 (not e!83338))))

(declare-fun res!104785 () Bool)

(assert (=> b!126451 (=> res!104785 e!83338)))

(declare-datatypes ((tuple2!10596 0))(
  ( (tuple2!10597 (_1!5580 BitStream!4500) (_2!5580 BitStream!4500)) )
))
(declare-fun lt!197587 () tuple2!10596)

(declare-datatypes ((tuple2!10598 0))(
  ( (tuple2!10599 (_1!5581 BitStream!4500) (_2!5581 array!5719)) )
))
(declare-fun lt!197586 () tuple2!10598)

(assert (=> b!126451 (= res!104785 (or (not (= (size!2588 (_2!5581 lt!197586)) (size!2588 arr!227))) (not (= (_1!5581 lt!197586) (_2!5580 lt!197587)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4500 array!5719 (_ BitVec 32) (_ BitVec 32)) tuple2!10598)

(assert (=> b!126451 (= lt!197586 (readByteArrayLoopPure!0 (_1!5580 lt!197587) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197584 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126451 (validate_offset_bits!1 ((_ sign_extend 32) (size!2588 (buf!2970 (_2!5579 lt!197583)))) ((_ sign_extend 32) (currentByte!5703 thiss!1614)) ((_ sign_extend 32) (currentBit!5698 thiss!1614)) lt!197584)))

(declare-fun lt!197585 () Unit!7779)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4500 array!5719 (_ BitVec 64)) Unit!7779)

(assert (=> b!126451 (= lt!197585 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2970 (_2!5579 lt!197583)) lt!197584))))

(declare-fun reader!0 (BitStream!4500 BitStream!4500) tuple2!10596)

(assert (=> b!126451 (= lt!197587 (reader!0 thiss!1614 (_2!5579 lt!197583)))))

(declare-fun b!126452 () Bool)

(declare-fun res!104784 () Bool)

(assert (=> b!126452 (=> (not res!104784) (not e!83335))))

(declare-fun isPrefixOf!0 (BitStream!4500 BitStream!4500) Bool)

(assert (=> b!126452 (= res!104784 (isPrefixOf!0 thiss!1614 (_2!5579 lt!197583)))))

(declare-fun b!126453 () Bool)

(assert (=> b!126453 (= e!83341 e!83335)))

(declare-fun res!104788 () Bool)

(assert (=> b!126453 (=> (not res!104788) (not e!83335))))

(assert (=> b!126453 (= res!104788 (= (bitIndex!0 (size!2588 (buf!2970 (_2!5579 lt!197583))) (currentByte!5703 (_2!5579 lt!197583)) (currentBit!5698 (_2!5579 lt!197583))) (bvadd (bitIndex!0 (size!2588 (buf!2970 thiss!1614)) (currentByte!5703 thiss!1614) (currentBit!5698 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197584))))))

(assert (=> b!126453 (= lt!197584 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126454 () Bool)

(declare-fun arrayRangesEq!75 (array!5719 array!5719 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126454 (= e!83338 (not (arrayRangesEq!75 arr!227 (_2!5581 lt!197586) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126455 () Bool)

(declare-fun res!104786 () Bool)

(assert (=> b!126455 (=> (not res!104786) (not e!83340))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126455 (= res!104786 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2588 (buf!2970 thiss!1614))) ((_ sign_extend 32) (currentByte!5703 thiss!1614)) ((_ sign_extend 32) (currentBit!5698 thiss!1614)) noOfBytes!1))))

(declare-fun b!126456 () Bool)

(assert (=> b!126456 (= e!83342 true)))

(assert (=> b!126456 (validate_offset_bits!1 ((_ sign_extend 32) (size!2588 (buf!2970 (_2!5579 lt!197583)))) ((_ sign_extend 32) (currentByte!5703 thiss!1614)) ((_ sign_extend 32) (currentBit!5698 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197588 () Unit!7779)

(assert (=> b!126456 (= lt!197588 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2970 (_2!5579 lt!197583)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun lt!197582 () tuple2!10596)

(assert (=> b!126456 (= lt!197582 (reader!0 thiss!1614 (_2!5579 lt!197583)))))

(declare-fun b!126457 () Bool)

(declare-fun res!104787 () Bool)

(assert (=> b!126457 (=> res!104787 e!83342)))

(assert (=> b!126457 (= res!104787 (not (isPrefixOf!0 thiss!1614 (_2!5579 lt!197583))))))

(declare-fun b!126458 () Bool)

(assert (=> b!126458 (= e!83337 (array_inv!2377 (buf!2970 thiss!1614)))))

(assert (= (and start!24968 res!104782) b!126455))

(assert (= (and b!126455 res!104786) b!126450))

(assert (= (and b!126450 res!104781) b!126453))

(assert (= (and b!126453 res!104788) b!126452))

(assert (= (and b!126452 res!104784) b!126451))

(assert (= (and b!126451 (not res!104785)) b!126454))

(assert (= (and b!126450 (not res!104783)) b!126457))

(assert (= (and b!126457 (not res!104787)) b!126456))

(assert (= start!24968 b!126458))

(declare-fun m!191943 () Bool)

(assert (=> b!126455 m!191943))

(declare-fun m!191945 () Bool)

(assert (=> b!126453 m!191945))

(declare-fun m!191947 () Bool)

(assert (=> b!126453 m!191947))

(declare-fun m!191949 () Bool)

(assert (=> b!126456 m!191949))

(declare-fun m!191951 () Bool)

(assert (=> b!126456 m!191951))

(declare-fun m!191953 () Bool)

(assert (=> b!126456 m!191953))

(declare-fun m!191955 () Bool)

(assert (=> start!24968 m!191955))

(declare-fun m!191957 () Bool)

(assert (=> start!24968 m!191957))

(declare-fun m!191959 () Bool)

(assert (=> b!126457 m!191959))

(declare-fun m!191961 () Bool)

(assert (=> b!126451 m!191961))

(declare-fun m!191963 () Bool)

(assert (=> b!126451 m!191963))

(declare-fun m!191965 () Bool)

(assert (=> b!126451 m!191965))

(assert (=> b!126451 m!191953))

(assert (=> b!126452 m!191959))

(declare-fun m!191967 () Bool)

(assert (=> b!126454 m!191967))

(declare-fun m!191969 () Bool)

(assert (=> b!126458 m!191969))

(assert (=> b!126450 m!191945))

(assert (=> b!126450 m!191947))

(declare-fun m!191971 () Bool)

(assert (=> b!126450 m!191971))

(check-sat (not b!126457) (not b!126454) (not b!126453) (not start!24968) (not b!126456) (not b!126458) (not b!126450) (not b!126452) (not b!126451) (not b!126455))
