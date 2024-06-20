; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40984 () Bool)

(assert start!40984)

(declare-fun b!189043 () Bool)

(declare-fun res!157568 () Bool)

(declare-fun e!130555 () Bool)

(assert (=> b!189043 (=> res!157568 e!130555)))

(declare-datatypes ((array!9874 0))(
  ( (array!9875 (arr!5282 (Array (_ BitVec 32) (_ BitVec 8))) (size!4352 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7812 0))(
  ( (BitStream!7813 (buf!4826 array!9874) (currentByte!9098 (_ BitVec 32)) (currentBit!9093 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13503 0))(
  ( (Unit!13504) )
))
(declare-datatypes ((tuple2!16324 0))(
  ( (tuple2!16325 (_1!8807 Unit!13503) (_2!8807 BitStream!7812)) )
))
(declare-fun lt!293681 () tuple2!16324)

(declare-fun lt!293660 () tuple2!16324)

(declare-fun isPrefixOf!0 (BitStream!7812 BitStream!7812) Bool)

(assert (=> b!189043 (= res!157568 (not (isPrefixOf!0 (_2!8807 lt!293681) (_2!8807 lt!293660))))))

(declare-fun b!189044 () Bool)

(declare-fun e!130562 () Bool)

(declare-fun e!130554 () Bool)

(assert (=> b!189044 (= e!130562 e!130554)))

(declare-fun res!157564 () Bool)

(assert (=> b!189044 (=> (not res!157564) (not e!130554))))

(declare-datatypes ((tuple2!16326 0))(
  ( (tuple2!16327 (_1!8808 BitStream!7812) (_2!8808 Bool)) )
))
(declare-fun lt!293673 () tuple2!16326)

(declare-fun lt!293682 () Bool)

(assert (=> b!189044 (= res!157564 (and (= (_2!8808 lt!293673) lt!293682) (= (_1!8808 lt!293673) (_2!8807 lt!293681))))))

(declare-fun thiss!1204 () BitStream!7812)

(declare-fun readBitPure!0 (BitStream!7812) tuple2!16326)

(declare-fun readerFrom!0 (BitStream!7812 (_ BitVec 32) (_ BitVec 32)) BitStream!7812)

(assert (=> b!189044 (= lt!293673 (readBitPure!0 (readerFrom!0 (_2!8807 lt!293681) (currentBit!9093 thiss!1204) (currentByte!9098 thiss!1204))))))

(declare-fun b!189046 () Bool)

(declare-fun res!157557 () Bool)

(assert (=> b!189046 (=> (not res!157557) (not e!130562))))

(assert (=> b!189046 (= res!157557 (isPrefixOf!0 thiss!1204 (_2!8807 lt!293681)))))

(declare-fun b!189047 () Bool)

(declare-fun e!130560 () Bool)

(declare-fun e!130557 () Bool)

(assert (=> b!189047 (= e!130560 e!130557)))

(declare-fun res!157548 () Bool)

(assert (=> b!189047 (=> (not res!157548) (not e!130557))))

(declare-fun lt!293675 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!189047 (= res!157548 (validate_offset_bits!1 ((_ sign_extend 32) (size!4352 (buf!4826 thiss!1204))) ((_ sign_extend 32) (currentByte!9098 thiss!1204)) ((_ sign_extend 32) (currentBit!9093 thiss!1204)) lt!293675))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!189047 (= lt!293675 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!189048 () Bool)

(declare-fun e!130561 () Bool)

(assert (=> b!189048 (= e!130555 e!130561)))

(declare-fun res!157554 () Bool)

(assert (=> b!189048 (=> res!157554 e!130561)))

(declare-datatypes ((tuple2!16328 0))(
  ( (tuple2!16329 (_1!8809 BitStream!7812) (_2!8809 (_ BitVec 64))) )
))
(declare-fun lt!293661 () tuple2!16328)

(declare-datatypes ((tuple2!16330 0))(
  ( (tuple2!16331 (_1!8810 BitStream!7812) (_2!8810 BitStream!7812)) )
))
(declare-fun lt!293685 () tuple2!16330)

(assert (=> b!189048 (= res!157554 (not (= (_1!8809 lt!293661) (_2!8810 lt!293685))))))

(declare-fun lt!293677 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16328)

(assert (=> b!189048 (= lt!293661 (readNBitsLSBFirstsLoopPure!0 (_1!8810 lt!293685) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293677))))

(declare-fun lt!293676 () (_ BitVec 64))

(assert (=> b!189048 (validate_offset_bits!1 ((_ sign_extend 32) (size!4352 (buf!4826 (_2!8807 lt!293660)))) ((_ sign_extend 32) (currentByte!9098 (_2!8807 lt!293681))) ((_ sign_extend 32) (currentBit!9093 (_2!8807 lt!293681))) lt!293676)))

(declare-fun lt!293662 () Unit!13503)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7812 array!9874 (_ BitVec 64)) Unit!13503)

(assert (=> b!189048 (= lt!293662 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8807 lt!293681) (buf!4826 (_2!8807 lt!293660)) lt!293676))))

(assert (=> b!189048 (= lt!293676 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!293686 () (_ BitVec 64))

(declare-fun lt!293684 () (_ BitVec 64))

(declare-fun lt!293666 () tuple2!16326)

(assert (=> b!189048 (= lt!293677 (bvor lt!293686 (ite (_2!8808 lt!293666) lt!293684 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!293665 () tuple2!16328)

(declare-fun lt!293679 () tuple2!16330)

(assert (=> b!189048 (= lt!293665 (readNBitsLSBFirstsLoopPure!0 (_1!8810 lt!293679) nBits!348 i!590 lt!293686))))

(assert (=> b!189048 (validate_offset_bits!1 ((_ sign_extend 32) (size!4352 (buf!4826 (_2!8807 lt!293660)))) ((_ sign_extend 32) (currentByte!9098 thiss!1204)) ((_ sign_extend 32) (currentBit!9093 thiss!1204)) lt!293675)))

(declare-fun lt!293667 () Unit!13503)

(assert (=> b!189048 (= lt!293667 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4826 (_2!8807 lt!293660)) lt!293675))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189048 (= lt!293686 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!189048 (= (_2!8808 lt!293666) lt!293682)))

(assert (=> b!189048 (= lt!293666 (readBitPure!0 (_1!8810 lt!293679)))))

(declare-fun reader!0 (BitStream!7812 BitStream!7812) tuple2!16330)

(assert (=> b!189048 (= lt!293685 (reader!0 (_2!8807 lt!293681) (_2!8807 lt!293660)))))

(assert (=> b!189048 (= lt!293679 (reader!0 thiss!1204 (_2!8807 lt!293660)))))

(declare-fun e!130563 () Bool)

(assert (=> b!189048 e!130563))

(declare-fun res!157556 () Bool)

(assert (=> b!189048 (=> (not res!157556) (not e!130563))))

(declare-fun lt!293670 () tuple2!16326)

(declare-fun lt!293678 () tuple2!16326)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189048 (= res!157556 (= (bitIndex!0 (size!4352 (buf!4826 (_1!8808 lt!293670))) (currentByte!9098 (_1!8808 lt!293670)) (currentBit!9093 (_1!8808 lt!293670))) (bitIndex!0 (size!4352 (buf!4826 (_1!8808 lt!293678))) (currentByte!9098 (_1!8808 lt!293678)) (currentBit!9093 (_1!8808 lt!293678)))))))

(declare-fun lt!293664 () Unit!13503)

(declare-fun lt!293671 () BitStream!7812)

(declare-fun readBitPrefixLemma!0 (BitStream!7812 BitStream!7812) Unit!13503)

(assert (=> b!189048 (= lt!293664 (readBitPrefixLemma!0 lt!293671 (_2!8807 lt!293660)))))

(assert (=> b!189048 (= lt!293678 (readBitPure!0 (BitStream!7813 (buf!4826 (_2!8807 lt!293660)) (currentByte!9098 thiss!1204) (currentBit!9093 thiss!1204))))))

(assert (=> b!189048 (= lt!293670 (readBitPure!0 lt!293671))))

(declare-fun e!130565 () Bool)

(assert (=> b!189048 e!130565))

(declare-fun res!157562 () Bool)

(assert (=> b!189048 (=> (not res!157562) (not e!130565))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189048 (= res!157562 (invariant!0 (currentBit!9093 thiss!1204) (currentByte!9098 thiss!1204) (size!4352 (buf!4826 (_2!8807 lt!293681)))))))

(assert (=> b!189048 (= lt!293671 (BitStream!7813 (buf!4826 (_2!8807 lt!293681)) (currentByte!9098 thiss!1204) (currentBit!9093 thiss!1204)))))

(declare-fun lt!293683 () (_ BitVec 64))

(declare-fun e!130556 () Bool)

(declare-fun lt!293663 () BitStream!7812)

(declare-fun lt!293674 () (_ BitVec 64))

(declare-fun b!189049 () Bool)

(assert (=> b!189049 (= e!130556 (and (= lt!293674 (bvsub lt!293683 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8810 lt!293685) lt!293663)) (= (_2!8809 lt!293665) (_2!8809 lt!293661)))))))

(declare-fun b!189050 () Bool)

(declare-fun res!157567 () Bool)

(declare-fun e!130552 () Bool)

(assert (=> b!189050 (=> res!157567 e!130552)))

(assert (=> b!189050 (= res!157567 (not (= (bitIndex!0 (size!4352 (buf!4826 (_1!8809 lt!293665))) (currentByte!9098 (_1!8809 lt!293665)) (currentBit!9093 (_1!8809 lt!293665))) (bitIndex!0 (size!4352 (buf!4826 (_2!8810 lt!293679))) (currentByte!9098 (_2!8810 lt!293679)) (currentBit!9093 (_2!8810 lt!293679))))))))

(declare-fun b!189051 () Bool)

(declare-fun lt!293680 () (_ BitVec 64))

(assert (=> b!189051 (= e!130554 (= (bitIndex!0 (size!4352 (buf!4826 (_1!8808 lt!293673))) (currentByte!9098 (_1!8808 lt!293673)) (currentBit!9093 (_1!8808 lt!293673))) lt!293680))))

(declare-fun b!189052 () Bool)

(declare-fun res!157555 () Bool)

(assert (=> b!189052 (=> res!157555 e!130555)))

(declare-fun lt!293668 () (_ BitVec 64))

(assert (=> b!189052 (= res!157555 (or (not (= (size!4352 (buf!4826 (_2!8807 lt!293660))) (size!4352 (buf!4826 thiss!1204)))) (not (= lt!293668 (bvsub (bvadd lt!293674 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!189053 () Bool)

(declare-fun e!130559 () Bool)

(assert (=> b!189053 (= e!130557 (not e!130559))))

(declare-fun res!157549 () Bool)

(assert (=> b!189053 (=> res!157549 e!130559)))

(assert (=> b!189053 (= res!157549 (not (= lt!293683 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293674))))))

(assert (=> b!189053 (= lt!293683 (bitIndex!0 (size!4352 (buf!4826 (_2!8807 lt!293681))) (currentByte!9098 (_2!8807 lt!293681)) (currentBit!9093 (_2!8807 lt!293681))))))

(assert (=> b!189053 (= lt!293674 (bitIndex!0 (size!4352 (buf!4826 thiss!1204)) (currentByte!9098 thiss!1204) (currentBit!9093 thiss!1204)))))

(declare-fun e!130558 () Bool)

(assert (=> b!189053 e!130558))

(declare-fun res!157560 () Bool)

(assert (=> b!189053 (=> (not res!157560) (not e!130558))))

(assert (=> b!189053 (= res!157560 (= (size!4352 (buf!4826 thiss!1204)) (size!4352 (buf!4826 (_2!8807 lt!293681)))))))

(declare-fun appendBit!0 (BitStream!7812 Bool) tuple2!16324)

(assert (=> b!189053 (= lt!293681 (appendBit!0 thiss!1204 lt!293682))))

(assert (=> b!189053 (= lt!293682 (not (= (bvand v!189 lt!293684) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189053 (= lt!293684 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!189054 () Bool)

(assert (=> b!189054 (= e!130561 e!130552)))

(declare-fun res!157563 () Bool)

(assert (=> b!189054 (=> res!157563 e!130552)))

(assert (=> b!189054 (= res!157563 (not (= (_1!8810 lt!293685) lt!293663)))))

(assert (=> b!189054 e!130556))

(declare-fun res!157559 () Bool)

(assert (=> b!189054 (=> (not res!157559) (not e!130556))))

(declare-fun lt!293669 () tuple2!16328)

(assert (=> b!189054 (= res!157559 (and (= (_2!8809 lt!293665) (_2!8809 lt!293669)) (= (_1!8809 lt!293665) (_1!8809 lt!293669))))))

(declare-fun lt!293658 () Unit!13503)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13503)

(assert (=> b!189054 (= lt!293658 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8810 lt!293679) nBits!348 i!590 lt!293686))))

(assert (=> b!189054 (= lt!293669 (readNBitsLSBFirstsLoopPure!0 lt!293663 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293677))))

(declare-fun withMovedBitIndex!0 (BitStream!7812 (_ BitVec 64)) BitStream!7812)

(assert (=> b!189054 (= lt!293663 (withMovedBitIndex!0 (_1!8810 lt!293679) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!189055 () Bool)

(assert (=> b!189055 (= e!130559 e!130555)))

(declare-fun res!157551 () Bool)

(assert (=> b!189055 (=> res!157551 e!130555)))

(assert (=> b!189055 (= res!157551 (not (= lt!293668 (bvsub (bvsub (bvadd lt!293683 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!189055 (= lt!293668 (bitIndex!0 (size!4352 (buf!4826 (_2!8807 lt!293660))) (currentByte!9098 (_2!8807 lt!293660)) (currentBit!9093 (_2!8807 lt!293660))))))

(assert (=> b!189055 (isPrefixOf!0 thiss!1204 (_2!8807 lt!293660))))

(declare-fun lt!293672 () Unit!13503)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7812 BitStream!7812 BitStream!7812) Unit!13503)

(assert (=> b!189055 (= lt!293672 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8807 lt!293681) (_2!8807 lt!293660)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7812 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16324)

(assert (=> b!189055 (= lt!293660 (appendBitsLSBFirstLoopTR!0 (_2!8807 lt!293681) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!189056 () Bool)

(assert (=> b!189056 (= e!130558 e!130562)))

(declare-fun res!157569 () Bool)

(assert (=> b!189056 (=> (not res!157569) (not e!130562))))

(declare-fun lt!293659 () (_ BitVec 64))

(assert (=> b!189056 (= res!157569 (= lt!293680 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293659)))))

(assert (=> b!189056 (= lt!293680 (bitIndex!0 (size!4352 (buf!4826 (_2!8807 lt!293681))) (currentByte!9098 (_2!8807 lt!293681)) (currentBit!9093 (_2!8807 lt!293681))))))

(assert (=> b!189056 (= lt!293659 (bitIndex!0 (size!4352 (buf!4826 thiss!1204)) (currentByte!9098 thiss!1204) (currentBit!9093 thiss!1204)))))

(declare-fun b!189057 () Bool)

(declare-fun res!157561 () Bool)

(assert (=> b!189057 (=> (not res!157561) (not e!130557))))

(assert (=> b!189057 (= res!157561 (not (= i!590 nBits!348)))))

(declare-fun b!189058 () Bool)

(assert (=> b!189058 (= e!130552 true)))

(assert (=> b!189058 (= (size!4352 (buf!4826 thiss!1204)) (size!4352 (buf!4826 (_2!8807 lt!293660))))))

(declare-fun b!189045 () Bool)

(declare-fun res!157550 () Bool)

(assert (=> b!189045 (=> res!157550 e!130555)))

(assert (=> b!189045 (= res!157550 (not (invariant!0 (currentBit!9093 (_2!8807 lt!293660)) (currentByte!9098 (_2!8807 lt!293660)) (size!4352 (buf!4826 (_2!8807 lt!293660))))))))

(declare-fun res!157553 () Bool)

(assert (=> start!40984 (=> (not res!157553) (not e!130560))))

(assert (=> start!40984 (= res!157553 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40984 e!130560))

(assert (=> start!40984 true))

(declare-fun e!130553 () Bool)

(declare-fun inv!12 (BitStream!7812) Bool)

(assert (=> start!40984 (and (inv!12 thiss!1204) e!130553)))

(declare-fun b!189059 () Bool)

(declare-fun res!157552 () Bool)

(assert (=> b!189059 (=> (not res!157552) (not e!130556))))

(assert (=> b!189059 (= res!157552 (= (_1!8810 lt!293685) (withMovedBitIndex!0 (_2!8810 lt!293685) (bvsub lt!293683 lt!293668))))))

(declare-fun b!189060 () Bool)

(assert (=> b!189060 (= e!130565 (invariant!0 (currentBit!9093 thiss!1204) (currentByte!9098 thiss!1204) (size!4352 (buf!4826 (_2!8807 lt!293660)))))))

(declare-fun b!189061 () Bool)

(declare-fun res!157565 () Bool)

(assert (=> b!189061 (=> (not res!157565) (not e!130556))))

(assert (=> b!189061 (= res!157565 (= (_1!8810 lt!293679) (withMovedBitIndex!0 (_2!8810 lt!293679) (bvsub lt!293674 lt!293668))))))

(declare-fun b!189062 () Bool)

(declare-fun res!157566 () Bool)

(assert (=> b!189062 (=> (not res!157566) (not e!130557))))

(assert (=> b!189062 (= res!157566 (invariant!0 (currentBit!9093 thiss!1204) (currentByte!9098 thiss!1204) (size!4352 (buf!4826 thiss!1204))))))

(declare-fun b!189063 () Bool)

(declare-fun array_inv!4093 (array!9874) Bool)

(assert (=> b!189063 (= e!130553 (array_inv!4093 (buf!4826 thiss!1204)))))

(declare-fun b!189064 () Bool)

(declare-fun res!157558 () Bool)

(assert (=> b!189064 (=> res!157558 e!130555)))

(assert (=> b!189064 (= res!157558 (not (isPrefixOf!0 thiss!1204 (_2!8807 lt!293681))))))

(declare-fun b!189065 () Bool)

(assert (=> b!189065 (= e!130563 (= (_2!8808 lt!293670) (_2!8808 lt!293678)))))

(assert (= (and start!40984 res!157553) b!189047))

(assert (= (and b!189047 res!157548) b!189062))

(assert (= (and b!189062 res!157566) b!189057))

(assert (= (and b!189057 res!157561) b!189053))

(assert (= (and b!189053 res!157560) b!189056))

(assert (= (and b!189056 res!157569) b!189046))

(assert (= (and b!189046 res!157557) b!189044))

(assert (= (and b!189044 res!157564) b!189051))

(assert (= (and b!189053 (not res!157549)) b!189055))

(assert (= (and b!189055 (not res!157551)) b!189045))

(assert (= (and b!189045 (not res!157550)) b!189052))

(assert (= (and b!189052 (not res!157555)) b!189043))

(assert (= (and b!189043 (not res!157568)) b!189064))

(assert (= (and b!189064 (not res!157558)) b!189048))

(assert (= (and b!189048 res!157562) b!189060))

(assert (= (and b!189048 res!157556) b!189065))

(assert (= (and b!189048 (not res!157554)) b!189054))

(assert (= (and b!189054 res!157559) b!189061))

(assert (= (and b!189061 res!157565) b!189059))

(assert (= (and b!189059 res!157552) b!189049))

(assert (= (and b!189054 (not res!157563)) b!189050))

(assert (= (and b!189050 (not res!157567)) b!189058))

(assert (= start!40984 b!189063))

(declare-fun m!293979 () Bool)

(assert (=> b!189062 m!293979))

(declare-fun m!293981 () Bool)

(assert (=> b!189064 m!293981))

(declare-fun m!293983 () Bool)

(assert (=> b!189054 m!293983))

(declare-fun m!293985 () Bool)

(assert (=> b!189054 m!293985))

(declare-fun m!293987 () Bool)

(assert (=> b!189054 m!293987))

(assert (=> b!189046 m!293981))

(declare-fun m!293989 () Bool)

(assert (=> b!189051 m!293989))

(declare-fun m!293991 () Bool)

(assert (=> b!189055 m!293991))

(declare-fun m!293993 () Bool)

(assert (=> b!189055 m!293993))

(declare-fun m!293995 () Bool)

(assert (=> b!189055 m!293995))

(declare-fun m!293997 () Bool)

(assert (=> b!189055 m!293997))

(declare-fun m!293999 () Bool)

(assert (=> b!189063 m!293999))

(declare-fun m!294001 () Bool)

(assert (=> b!189045 m!294001))

(declare-fun m!294003 () Bool)

(assert (=> b!189043 m!294003))

(declare-fun m!294005 () Bool)

(assert (=> b!189061 m!294005))

(declare-fun m!294007 () Bool)

(assert (=> b!189044 m!294007))

(assert (=> b!189044 m!294007))

(declare-fun m!294009 () Bool)

(assert (=> b!189044 m!294009))

(declare-fun m!294011 () Bool)

(assert (=> b!189047 m!294011))

(declare-fun m!294013 () Bool)

(assert (=> b!189053 m!294013))

(declare-fun m!294015 () Bool)

(assert (=> b!189053 m!294015))

(declare-fun m!294017 () Bool)

(assert (=> b!189053 m!294017))

(declare-fun m!294019 () Bool)

(assert (=> b!189059 m!294019))

(declare-fun m!294021 () Bool)

(assert (=> b!189048 m!294021))

(declare-fun m!294023 () Bool)

(assert (=> b!189048 m!294023))

(declare-fun m!294025 () Bool)

(assert (=> b!189048 m!294025))

(declare-fun m!294027 () Bool)

(assert (=> b!189048 m!294027))

(declare-fun m!294029 () Bool)

(assert (=> b!189048 m!294029))

(declare-fun m!294031 () Bool)

(assert (=> b!189048 m!294031))

(declare-fun m!294033 () Bool)

(assert (=> b!189048 m!294033))

(declare-fun m!294035 () Bool)

(assert (=> b!189048 m!294035))

(declare-fun m!294037 () Bool)

(assert (=> b!189048 m!294037))

(declare-fun m!294039 () Bool)

(assert (=> b!189048 m!294039))

(declare-fun m!294041 () Bool)

(assert (=> b!189048 m!294041))

(declare-fun m!294043 () Bool)

(assert (=> b!189048 m!294043))

(declare-fun m!294045 () Bool)

(assert (=> b!189048 m!294045))

(declare-fun m!294047 () Bool)

(assert (=> b!189048 m!294047))

(declare-fun m!294049 () Bool)

(assert (=> b!189048 m!294049))

(declare-fun m!294051 () Bool)

(assert (=> b!189048 m!294051))

(assert (=> b!189056 m!294013))

(assert (=> b!189056 m!294015))

(declare-fun m!294053 () Bool)

(assert (=> b!189050 m!294053))

(declare-fun m!294055 () Bool)

(assert (=> b!189050 m!294055))

(declare-fun m!294057 () Bool)

(assert (=> b!189060 m!294057))

(declare-fun m!294059 () Bool)

(assert (=> start!40984 m!294059))

(check-sat (not b!189062) (not b!189047) (not b!189050) (not b!189056) (not b!189045) (not b!189043) (not b!189046) (not b!189044) (not b!189063) (not b!189059) (not b!189051) (not b!189060) (not b!189053) (not b!189055) (not b!189061) (not b!189054) (not b!189048) (not b!189064) (not start!40984))
