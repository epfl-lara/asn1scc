; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39942 () Bool)

(assert start!39942)

(declare-fun b!181557 () Bool)

(declare-fun res!150800 () Bool)

(declare-fun e!126058 () Bool)

(assert (=> b!181557 (=> (not res!150800) (not e!126058))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!181557 (= res!150800 (not (= i!590 nBits!348)))))

(declare-fun res!150814 () Bool)

(declare-fun e!126061 () Bool)

(assert (=> start!39942 (=> (not res!150814) (not e!126061))))

(assert (=> start!39942 (= res!150814 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39942 e!126061))

(assert (=> start!39942 true))

(declare-datatypes ((array!9702 0))(
  ( (array!9703 (arr!5208 (Array (_ BitVec 32) (_ BitVec 8))) (size!4278 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7664 0))(
  ( (BitStream!7665 (buf!4727 array!9702) (currentByte!8949 (_ BitVec 32)) (currentBit!8944 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7664)

(declare-fun e!126054 () Bool)

(declare-fun inv!12 (BitStream!7664) Bool)

(assert (=> start!39942 (and (inv!12 thiss!1204) e!126054)))

(declare-fun b!181558 () Bool)

(declare-fun res!150801 () Bool)

(declare-fun e!126059 () Bool)

(assert (=> b!181558 (=> res!150801 e!126059)))

(declare-fun lt!278970 () (_ BitVec 64))

(declare-datatypes ((Unit!13053 0))(
  ( (Unit!13054) )
))
(declare-datatypes ((tuple2!15638 0))(
  ( (tuple2!15639 (_1!8464 Unit!13053) (_2!8464 BitStream!7664)) )
))
(declare-fun lt!278976 () tuple2!15638)

(declare-fun lt!278982 () (_ BitVec 64))

(assert (=> b!181558 (= res!150801 (or (not (= (size!4278 (buf!4727 (_2!8464 lt!278976))) (size!4278 (buf!4727 thiss!1204)))) (not (= lt!278982 (bvsub (bvadd lt!278970 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181559 () Bool)

(declare-fun e!126056 () Bool)

(declare-fun e!126060 () Bool)

(assert (=> b!181559 (= e!126056 e!126060)))

(declare-fun res!150806 () Bool)

(assert (=> b!181559 (=> (not res!150806) (not e!126060))))

(declare-fun lt!278972 () (_ BitVec 64))

(declare-fun lt!278983 () (_ BitVec 64))

(assert (=> b!181559 (= res!150806 (= lt!278972 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!278983)))))

(declare-fun lt!278968 () tuple2!15638)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181559 (= lt!278972 (bitIndex!0 (size!4278 (buf!4727 (_2!8464 lt!278968))) (currentByte!8949 (_2!8464 lt!278968)) (currentBit!8944 (_2!8464 lt!278968))))))

(assert (=> b!181559 (= lt!278983 (bitIndex!0 (size!4278 (buf!4727 thiss!1204)) (currentByte!8949 thiss!1204) (currentBit!8944 thiss!1204)))))

(declare-fun b!181560 () Bool)

(declare-fun e!126062 () Bool)

(assert (=> b!181560 (= e!126060 e!126062)))

(declare-fun res!150808 () Bool)

(assert (=> b!181560 (=> (not res!150808) (not e!126062))))

(declare-fun lt!278966 () Bool)

(declare-datatypes ((tuple2!15640 0))(
  ( (tuple2!15641 (_1!8465 BitStream!7664) (_2!8465 Bool)) )
))
(declare-fun lt!278973 () tuple2!15640)

(assert (=> b!181560 (= res!150808 (and (= (_2!8465 lt!278973) lt!278966) (= (_1!8465 lt!278973) (_2!8464 lt!278968))))))

(declare-fun readBitPure!0 (BitStream!7664) tuple2!15640)

(declare-fun readerFrom!0 (BitStream!7664 (_ BitVec 32) (_ BitVec 32)) BitStream!7664)

(assert (=> b!181560 (= lt!278973 (readBitPure!0 (readerFrom!0 (_2!8464 lt!278968) (currentBit!8944 thiss!1204) (currentByte!8949 thiss!1204))))))

(declare-fun b!181561 () Bool)

(declare-fun res!150815 () Bool)

(assert (=> b!181561 (=> res!150815 e!126059)))

(declare-fun isPrefixOf!0 (BitStream!7664 BitStream!7664) Bool)

(assert (=> b!181561 (= res!150815 (not (isPrefixOf!0 (_2!8464 lt!278968) (_2!8464 lt!278976))))))

(declare-fun b!181562 () Bool)

(declare-fun e!126064 () Bool)

(declare-fun lt!278979 () (_ BitVec 64))

(assert (=> b!181562 (= e!126064 (= (bvand lt!278979 #b1111111111111111111111111111111111111111111111111111111111111111) lt!278979))))

(declare-fun b!181563 () Bool)

(assert (=> b!181563 (= e!126059 e!126064)))

(declare-fun res!150803 () Bool)

(assert (=> b!181563 (=> res!150803 e!126064)))

(declare-datatypes ((tuple2!15642 0))(
  ( (tuple2!15643 (_1!8466 BitStream!7664) (_2!8466 BitStream!7664)) )
))
(declare-fun lt!278975 () tuple2!15642)

(declare-fun lt!278969 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181563 (= res!150803 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4278 (buf!4727 (_1!8466 lt!278975)))) ((_ sign_extend 32) (currentByte!8949 (_1!8466 lt!278975))) ((_ sign_extend 32) (currentBit!8944 (_1!8466 lt!278975))) lt!278969)))))

(assert (=> b!181563 (validate_offset_bits!1 ((_ sign_extend 32) (size!4278 (buf!4727 (_2!8464 lt!278976)))) ((_ sign_extend 32) (currentByte!8949 thiss!1204)) ((_ sign_extend 32) (currentBit!8944 thiss!1204)) lt!278969)))

(declare-fun lt!278971 () Unit!13053)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7664 array!9702 (_ BitVec 64)) Unit!13053)

(assert (=> b!181563 (= lt!278971 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4727 (_2!8464 lt!278976)) lt!278969))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181563 (= lt!278979 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!181563 (= (_2!8465 (readBitPure!0 (_1!8466 lt!278975))) lt!278966)))

(declare-fun lt!278974 () tuple2!15642)

(declare-fun reader!0 (BitStream!7664 BitStream!7664) tuple2!15642)

(assert (=> b!181563 (= lt!278974 (reader!0 (_2!8464 lt!278968) (_2!8464 lt!278976)))))

(assert (=> b!181563 (= lt!278975 (reader!0 thiss!1204 (_2!8464 lt!278976)))))

(declare-fun e!126057 () Bool)

(assert (=> b!181563 e!126057))

(declare-fun res!150812 () Bool)

(assert (=> b!181563 (=> (not res!150812) (not e!126057))))

(declare-fun lt!278980 () tuple2!15640)

(declare-fun lt!278978 () tuple2!15640)

(assert (=> b!181563 (= res!150812 (= (bitIndex!0 (size!4278 (buf!4727 (_1!8465 lt!278980))) (currentByte!8949 (_1!8465 lt!278980)) (currentBit!8944 (_1!8465 lt!278980))) (bitIndex!0 (size!4278 (buf!4727 (_1!8465 lt!278978))) (currentByte!8949 (_1!8465 lt!278978)) (currentBit!8944 (_1!8465 lt!278978)))))))

(declare-fun lt!278981 () Unit!13053)

(declare-fun lt!278967 () BitStream!7664)

(declare-fun readBitPrefixLemma!0 (BitStream!7664 BitStream!7664) Unit!13053)

(assert (=> b!181563 (= lt!278981 (readBitPrefixLemma!0 lt!278967 (_2!8464 lt!278976)))))

(assert (=> b!181563 (= lt!278978 (readBitPure!0 (BitStream!7665 (buf!4727 (_2!8464 lt!278976)) (currentByte!8949 thiss!1204) (currentBit!8944 thiss!1204))))))

(assert (=> b!181563 (= lt!278980 (readBitPure!0 lt!278967))))

(declare-fun e!126063 () Bool)

(assert (=> b!181563 e!126063))

(declare-fun res!150813 () Bool)

(assert (=> b!181563 (=> (not res!150813) (not e!126063))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181563 (= res!150813 (invariant!0 (currentBit!8944 thiss!1204) (currentByte!8949 thiss!1204) (size!4278 (buf!4727 (_2!8464 lt!278968)))))))

(assert (=> b!181563 (= lt!278967 (BitStream!7665 (buf!4727 (_2!8464 lt!278968)) (currentByte!8949 thiss!1204) (currentBit!8944 thiss!1204)))))

(declare-fun b!181564 () Bool)

(assert (=> b!181564 (= e!126061 e!126058)))

(declare-fun res!150805 () Bool)

(assert (=> b!181564 (=> (not res!150805) (not e!126058))))

(assert (=> b!181564 (= res!150805 (validate_offset_bits!1 ((_ sign_extend 32) (size!4278 (buf!4727 thiss!1204))) ((_ sign_extend 32) (currentByte!8949 thiss!1204)) ((_ sign_extend 32) (currentBit!8944 thiss!1204)) lt!278969))))

(assert (=> b!181564 (= lt!278969 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181565 () Bool)

(assert (=> b!181565 (= e!126057 (= (_2!8465 lt!278980) (_2!8465 lt!278978)))))

(declare-fun b!181566 () Bool)

(declare-fun res!150811 () Bool)

(assert (=> b!181566 (=> res!150811 e!126059)))

(assert (=> b!181566 (= res!150811 (not (invariant!0 (currentBit!8944 (_2!8464 lt!278976)) (currentByte!8949 (_2!8464 lt!278976)) (size!4278 (buf!4727 (_2!8464 lt!278976))))))))

(declare-fun b!181567 () Bool)

(declare-fun array_inv!4019 (array!9702) Bool)

(assert (=> b!181567 (= e!126054 (array_inv!4019 (buf!4727 thiss!1204)))))

(declare-fun b!181568 () Bool)

(declare-fun res!150809 () Bool)

(assert (=> b!181568 (=> res!150809 e!126064)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181568 (= res!150809 (not (= (bvand lt!278979 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181569 () Bool)

(assert (=> b!181569 (= e!126063 (invariant!0 (currentBit!8944 thiss!1204) (currentByte!8949 thiss!1204) (size!4278 (buf!4727 (_2!8464 lt!278976)))))))

(declare-fun b!181570 () Bool)

(declare-fun e!126055 () Bool)

(assert (=> b!181570 (= e!126055 e!126059)))

(declare-fun res!150810 () Bool)

(assert (=> b!181570 (=> res!150810 e!126059)))

(declare-fun lt!278977 () (_ BitVec 64))

(assert (=> b!181570 (= res!150810 (not (= lt!278982 (bvsub (bvsub (bvadd lt!278977 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!181570 (= lt!278982 (bitIndex!0 (size!4278 (buf!4727 (_2!8464 lt!278976))) (currentByte!8949 (_2!8464 lt!278976)) (currentBit!8944 (_2!8464 lt!278976))))))

(assert (=> b!181570 (isPrefixOf!0 thiss!1204 (_2!8464 lt!278976))))

(declare-fun lt!278984 () Unit!13053)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7664 BitStream!7664 BitStream!7664) Unit!13053)

(assert (=> b!181570 (= lt!278984 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8464 lt!278968) (_2!8464 lt!278976)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15638)

(assert (=> b!181570 (= lt!278976 (appendBitsLSBFirstLoopTR!0 (_2!8464 lt!278968) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181571 () Bool)

(declare-fun res!150799 () Bool)

(assert (=> b!181571 (=> (not res!150799) (not e!126058))))

(assert (=> b!181571 (= res!150799 (invariant!0 (currentBit!8944 thiss!1204) (currentByte!8949 thiss!1204) (size!4278 (buf!4727 thiss!1204))))))

(declare-fun b!181572 () Bool)

(declare-fun res!150807 () Bool)

(assert (=> b!181572 (=> res!150807 e!126059)))

(assert (=> b!181572 (= res!150807 (not (isPrefixOf!0 thiss!1204 (_2!8464 lt!278968))))))

(declare-fun b!181573 () Bool)

(assert (=> b!181573 (= e!126058 (not e!126055))))

(declare-fun res!150802 () Bool)

(assert (=> b!181573 (=> res!150802 e!126055)))

(assert (=> b!181573 (= res!150802 (not (= lt!278977 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!278970))))))

(assert (=> b!181573 (= lt!278977 (bitIndex!0 (size!4278 (buf!4727 (_2!8464 lt!278968))) (currentByte!8949 (_2!8464 lt!278968)) (currentBit!8944 (_2!8464 lt!278968))))))

(assert (=> b!181573 (= lt!278970 (bitIndex!0 (size!4278 (buf!4727 thiss!1204)) (currentByte!8949 thiss!1204) (currentBit!8944 thiss!1204)))))

(assert (=> b!181573 e!126056))

(declare-fun res!150816 () Bool)

(assert (=> b!181573 (=> (not res!150816) (not e!126056))))

(assert (=> b!181573 (= res!150816 (= (size!4278 (buf!4727 thiss!1204)) (size!4278 (buf!4727 (_2!8464 lt!278968)))))))

(declare-fun appendBit!0 (BitStream!7664 Bool) tuple2!15638)

(assert (=> b!181573 (= lt!278968 (appendBit!0 thiss!1204 lt!278966))))

(assert (=> b!181573 (= lt!278966 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181574 () Bool)

(assert (=> b!181574 (= e!126062 (= (bitIndex!0 (size!4278 (buf!4727 (_1!8465 lt!278973))) (currentByte!8949 (_1!8465 lt!278973)) (currentBit!8944 (_1!8465 lt!278973))) lt!278972))))

(declare-fun b!181575 () Bool)

(declare-fun res!150804 () Bool)

(assert (=> b!181575 (=> (not res!150804) (not e!126060))))

(assert (=> b!181575 (= res!150804 (isPrefixOf!0 thiss!1204 (_2!8464 lt!278968)))))

(assert (= (and start!39942 res!150814) b!181564))

(assert (= (and b!181564 res!150805) b!181571))

(assert (= (and b!181571 res!150799) b!181557))

(assert (= (and b!181557 res!150800) b!181573))

(assert (= (and b!181573 res!150816) b!181559))

(assert (= (and b!181559 res!150806) b!181575))

(assert (= (and b!181575 res!150804) b!181560))

(assert (= (and b!181560 res!150808) b!181574))

(assert (= (and b!181573 (not res!150802)) b!181570))

(assert (= (and b!181570 (not res!150810)) b!181566))

(assert (= (and b!181566 (not res!150811)) b!181558))

(assert (= (and b!181558 (not res!150801)) b!181561))

(assert (= (and b!181561 (not res!150815)) b!181572))

(assert (= (and b!181572 (not res!150807)) b!181563))

(assert (= (and b!181563 res!150813) b!181569))

(assert (= (and b!181563 res!150812) b!181565))

(assert (= (and b!181563 (not res!150803)) b!181568))

(assert (= (and b!181568 (not res!150809)) b!181562))

(assert (= start!39942 b!181567))

(declare-fun m!282609 () Bool)

(assert (=> b!181561 m!282609))

(declare-fun m!282611 () Bool)

(assert (=> b!181564 m!282611))

(declare-fun m!282613 () Bool)

(assert (=> b!181575 m!282613))

(declare-fun m!282615 () Bool)

(assert (=> b!181560 m!282615))

(assert (=> b!181560 m!282615))

(declare-fun m!282617 () Bool)

(assert (=> b!181560 m!282617))

(declare-fun m!282619 () Bool)

(assert (=> b!181566 m!282619))

(declare-fun m!282621 () Bool)

(assert (=> b!181573 m!282621))

(declare-fun m!282623 () Bool)

(assert (=> b!181573 m!282623))

(declare-fun m!282625 () Bool)

(assert (=> b!181573 m!282625))

(declare-fun m!282627 () Bool)

(assert (=> b!181571 m!282627))

(declare-fun m!282629 () Bool)

(assert (=> start!39942 m!282629))

(declare-fun m!282631 () Bool)

(assert (=> b!181574 m!282631))

(declare-fun m!282633 () Bool)

(assert (=> b!181570 m!282633))

(declare-fun m!282635 () Bool)

(assert (=> b!181570 m!282635))

(declare-fun m!282637 () Bool)

(assert (=> b!181570 m!282637))

(declare-fun m!282639 () Bool)

(assert (=> b!181570 m!282639))

(declare-fun m!282641 () Bool)

(assert (=> b!181567 m!282641))

(declare-fun m!282643 () Bool)

(assert (=> b!181568 m!282643))

(declare-fun m!282645 () Bool)

(assert (=> b!181563 m!282645))

(declare-fun m!282647 () Bool)

(assert (=> b!181563 m!282647))

(declare-fun m!282649 () Bool)

(assert (=> b!181563 m!282649))

(declare-fun m!282651 () Bool)

(assert (=> b!181563 m!282651))

(declare-fun m!282653 () Bool)

(assert (=> b!181563 m!282653))

(declare-fun m!282655 () Bool)

(assert (=> b!181563 m!282655))

(declare-fun m!282657 () Bool)

(assert (=> b!181563 m!282657))

(declare-fun m!282659 () Bool)

(assert (=> b!181563 m!282659))

(declare-fun m!282661 () Bool)

(assert (=> b!181563 m!282661))

(declare-fun m!282663 () Bool)

(assert (=> b!181563 m!282663))

(declare-fun m!282665 () Bool)

(assert (=> b!181563 m!282665))

(declare-fun m!282667 () Bool)

(assert (=> b!181563 m!282667))

(declare-fun m!282669 () Bool)

(assert (=> b!181563 m!282669))

(assert (=> b!181572 m!282613))

(declare-fun m!282671 () Bool)

(assert (=> b!181569 m!282671))

(assert (=> b!181559 m!282621))

(assert (=> b!181559 m!282623))

(push 1)

(assert (not b!181572))

(assert (not b!181567))

(assert (not start!39942))

(assert (not b!181568))

(assert (not b!181575))

(assert (not b!181559))

(assert (not b!181569))

(assert (not b!181561))

(assert (not b!181574))

(assert (not b!181570))

(assert (not b!181564))

(assert (not b!181571))

(assert (not b!181573))

(assert (not b!181563))

(assert (not b!181560))

(assert (not b!181566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

