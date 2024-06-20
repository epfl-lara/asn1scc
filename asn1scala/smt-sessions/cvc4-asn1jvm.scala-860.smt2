; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24952 () Bool)

(assert start!24952)

(declare-fun b!126234 () Bool)

(declare-fun res!104595 () Bool)

(declare-fun e!83144 () Bool)

(assert (=> b!126234 (=> (not res!104595) (not e!83144))))

(declare-datatypes ((array!5703 0))(
  ( (array!5704 (arr!3185 (Array (_ BitVec 32) (_ BitVec 8))) (size!2580 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4484 0))(
  ( (BitStream!4485 (buf!2962 array!5703) (currentByte!5695 (_ BitVec 32)) (currentBit!5690 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4484)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126234 (= res!104595 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2580 (buf!2962 thiss!1614))) ((_ sign_extend 32) (currentByte!5695 thiss!1614)) ((_ sign_extend 32) (currentBit!5690 thiss!1614)) noOfBytes!1))))

(declare-fun b!126235 () Bool)

(declare-fun e!83148 () Bool)

(declare-fun array_inv!2369 (array!5703) Bool)

(assert (=> b!126235 (= e!83148 (array_inv!2369 (buf!2962 thiss!1614)))))

(declare-fun res!104596 () Bool)

(assert (=> start!24952 (=> (not res!104596) (not e!83144))))

(declare-fun arr!227 () array!5703)

(assert (=> start!24952 (= res!104596 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2580 arr!227))))))

(assert (=> start!24952 e!83144))

(assert (=> start!24952 true))

(assert (=> start!24952 (array_inv!2369 arr!227)))

(declare-fun inv!12 (BitStream!4484) Bool)

(assert (=> start!24952 (and (inv!12 thiss!1614) e!83148)))

(declare-fun b!126236 () Bool)

(declare-fun res!104590 () Bool)

(declare-fun e!83145 () Bool)

(assert (=> b!126236 (=> (not res!104590) (not e!83145))))

(declare-datatypes ((Unit!7763 0))(
  ( (Unit!7764) )
))
(declare-datatypes ((tuple2!10546 0))(
  ( (tuple2!10547 (_1!5555 Unit!7763) (_2!5555 BitStream!4484)) )
))
(declare-fun lt!197438 () tuple2!10546)

(declare-fun isPrefixOf!0 (BitStream!4484 BitStream!4484) Bool)

(assert (=> b!126236 (= res!104590 (isPrefixOf!0 thiss!1614 (_2!5555 lt!197438)))))

(declare-fun b!126237 () Bool)

(declare-fun res!104589 () Bool)

(declare-fun e!83149 () Bool)

(assert (=> b!126237 (=> res!104589 e!83149)))

(assert (=> b!126237 (= res!104589 (not (isPrefixOf!0 thiss!1614 (_2!5555 lt!197438))))))

(declare-fun b!126238 () Bool)

(declare-fun e!83146 () Bool)

(assert (=> b!126238 (= e!83145 (not e!83146))))

(declare-fun res!104594 () Bool)

(assert (=> b!126238 (=> res!104594 e!83146)))

(declare-datatypes ((tuple2!10548 0))(
  ( (tuple2!10549 (_1!5556 BitStream!4484) (_2!5556 array!5703)) )
))
(declare-fun lt!197437 () tuple2!10548)

(declare-datatypes ((tuple2!10550 0))(
  ( (tuple2!10551 (_1!5557 BitStream!4484) (_2!5557 BitStream!4484)) )
))
(declare-fun lt!197433 () tuple2!10550)

(assert (=> b!126238 (= res!104594 (or (not (= (size!2580 (_2!5556 lt!197437)) (size!2580 arr!227))) (not (= (_1!5556 lt!197437) (_2!5557 lt!197433)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4484 array!5703 (_ BitVec 32) (_ BitVec 32)) tuple2!10548)

(assert (=> b!126238 (= lt!197437 (readByteArrayLoopPure!0 (_1!5557 lt!197433) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197434 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126238 (validate_offset_bits!1 ((_ sign_extend 32) (size!2580 (buf!2962 (_2!5555 lt!197438)))) ((_ sign_extend 32) (currentByte!5695 thiss!1614)) ((_ sign_extend 32) (currentBit!5690 thiss!1614)) lt!197434)))

(declare-fun lt!197435 () Unit!7763)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4484 array!5703 (_ BitVec 64)) Unit!7763)

(assert (=> b!126238 (= lt!197435 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2962 (_2!5555 lt!197438)) lt!197434))))

(declare-fun reader!0 (BitStream!4484 BitStream!4484) tuple2!10550)

(assert (=> b!126238 (= lt!197433 (reader!0 thiss!1614 (_2!5555 lt!197438)))))

(declare-fun b!126239 () Bool)

(declare-fun e!83150 () Bool)

(assert (=> b!126239 (= e!83150 e!83145)))

(declare-fun res!104593 () Bool)

(assert (=> b!126239 (=> (not res!104593) (not e!83145))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126239 (= res!104593 (= (bitIndex!0 (size!2580 (buf!2962 (_2!5555 lt!197438))) (currentByte!5695 (_2!5555 lt!197438)) (currentBit!5690 (_2!5555 lt!197438))) (bvadd (bitIndex!0 (size!2580 (buf!2962 thiss!1614)) (currentByte!5695 thiss!1614) (currentBit!5690 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197434))))))

(assert (=> b!126239 (= lt!197434 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126240 () Bool)

(assert (=> b!126240 (= e!83144 (not e!83149))))

(declare-fun res!104592 () Bool)

(assert (=> b!126240 (=> res!104592 e!83149)))

(assert (=> b!126240 (= res!104592 (not (= (bitIndex!0 (size!2580 (buf!2962 (_2!5555 lt!197438))) (currentByte!5695 (_2!5555 lt!197438)) (currentBit!5690 (_2!5555 lt!197438))) (bvadd (bitIndex!0 (size!2580 (buf!2962 thiss!1614)) (currentByte!5695 thiss!1614) (currentBit!5690 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126240 e!83150))

(declare-fun res!104591 () Bool)

(assert (=> b!126240 (=> (not res!104591) (not e!83150))))

(assert (=> b!126240 (= res!104591 (= (size!2580 (buf!2962 thiss!1614)) (size!2580 (buf!2962 (_2!5555 lt!197438)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4484 array!5703 (_ BitVec 32) (_ BitVec 32)) tuple2!10546)

(assert (=> b!126240 (= lt!197438 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126241 () Bool)

(assert (=> b!126241 (= e!83149 true)))

(declare-fun lt!197436 () tuple2!10550)

(assert (=> b!126241 (= lt!197436 (reader!0 thiss!1614 (_2!5555 lt!197438)))))

(declare-fun b!126242 () Bool)

(declare-fun arrayRangesEq!67 (array!5703 array!5703 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126242 (= e!83146 (not (arrayRangesEq!67 arr!227 (_2!5556 lt!197437) #b00000000000000000000000000000000 noOfBytes!1)))))

(assert (= (and start!24952 res!104596) b!126234))

(assert (= (and b!126234 res!104595) b!126240))

(assert (= (and b!126240 res!104591) b!126239))

(assert (= (and b!126239 res!104593) b!126236))

(assert (= (and b!126236 res!104590) b!126238))

(assert (= (and b!126238 (not res!104594)) b!126242))

(assert (= (and b!126240 (not res!104592)) b!126237))

(assert (= (and b!126237 (not res!104589)) b!126241))

(assert (= start!24952 b!126235))

(declare-fun m!191731 () Bool)

(assert (=> start!24952 m!191731))

(declare-fun m!191733 () Bool)

(assert (=> start!24952 m!191733))

(declare-fun m!191735 () Bool)

(assert (=> b!126237 m!191735))

(declare-fun m!191737 () Bool)

(assert (=> b!126240 m!191737))

(declare-fun m!191739 () Bool)

(assert (=> b!126240 m!191739))

(declare-fun m!191741 () Bool)

(assert (=> b!126240 m!191741))

(assert (=> b!126239 m!191737))

(assert (=> b!126239 m!191739))

(declare-fun m!191743 () Bool)

(assert (=> b!126238 m!191743))

(declare-fun m!191745 () Bool)

(assert (=> b!126238 m!191745))

(declare-fun m!191747 () Bool)

(assert (=> b!126238 m!191747))

(declare-fun m!191749 () Bool)

(assert (=> b!126238 m!191749))

(declare-fun m!191751 () Bool)

(assert (=> b!126234 m!191751))

(assert (=> b!126236 m!191735))

(assert (=> b!126241 m!191749))

(declare-fun m!191753 () Bool)

(assert (=> b!126235 m!191753))

(declare-fun m!191755 () Bool)

(assert (=> b!126242 m!191755))

(push 1)

(assert (not b!126240))

(assert (not start!24952))

(assert (not b!126239))

(assert (not b!126238))

(assert (not b!126237))

(assert (not b!126236))

(assert (not b!126241))

(assert (not b!126242))

(assert (not b!126235))

(assert (not b!126234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

