; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40986 () Bool)

(assert start!40986)

(declare-fun b!189112 () Bool)

(declare-fun e!130598 () Bool)

(declare-fun e!130595 () Bool)

(assert (=> b!189112 (= e!130598 (not e!130595))))

(declare-fun res!157635 () Bool)

(assert (=> b!189112 (=> res!157635 e!130595)))

(declare-fun lt!293772 () (_ BitVec 64))

(declare-fun lt!293771 () (_ BitVec 64))

(assert (=> b!189112 (= res!157635 (not (= lt!293772 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293771))))))

(declare-datatypes ((array!9876 0))(
  ( (array!9877 (arr!5283 (Array (_ BitVec 32) (_ BitVec 8))) (size!4353 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7814 0))(
  ( (BitStream!7815 (buf!4827 array!9876) (currentByte!9099 (_ BitVec 32)) (currentBit!9094 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13505 0))(
  ( (Unit!13506) )
))
(declare-datatypes ((tuple2!16332 0))(
  ( (tuple2!16333 (_1!8811 Unit!13505) (_2!8811 BitStream!7814)) )
))
(declare-fun lt!293760 () tuple2!16332)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189112 (= lt!293772 (bitIndex!0 (size!4353 (buf!4827 (_2!8811 lt!293760))) (currentByte!9099 (_2!8811 lt!293760)) (currentBit!9094 (_2!8811 lt!293760))))))

(declare-fun thiss!1204 () BitStream!7814)

(assert (=> b!189112 (= lt!293771 (bitIndex!0 (size!4353 (buf!4827 thiss!1204)) (currentByte!9099 thiss!1204) (currentBit!9094 thiss!1204)))))

(declare-fun e!130600 () Bool)

(assert (=> b!189112 e!130600))

(declare-fun res!157633 () Bool)

(assert (=> b!189112 (=> (not res!157633) (not e!130600))))

(assert (=> b!189112 (= res!157633 (= (size!4353 (buf!4827 thiss!1204)) (size!4353 (buf!4827 (_2!8811 lt!293760)))))))

(declare-fun lt!293761 () Bool)

(declare-fun appendBit!0 (BitStream!7814 Bool) tuple2!16332)

(assert (=> b!189112 (= lt!293760 (appendBit!0 thiss!1204 lt!293761))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!293765 () (_ BitVec 64))

(assert (=> b!189112 (= lt!293761 (not (= (bvand v!189 lt!293765) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!189112 (= lt!293765 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!189113 () Bool)

(declare-fun e!130594 () Bool)

(assert (=> b!189113 (= e!130594 e!130598)))

(declare-fun res!157628 () Bool)

(assert (=> b!189113 (=> (not res!157628) (not e!130598))))

(declare-fun lt!293769 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!189113 (= res!157628 (validate_offset_bits!1 ((_ sign_extend 32) (size!4353 (buf!4827 thiss!1204))) ((_ sign_extend 32) (currentByte!9099 thiss!1204)) ((_ sign_extend 32) (currentBit!9094 thiss!1204)) lt!293769))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!189113 (= lt!293769 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!189114 () Bool)

(declare-fun res!157618 () Bool)

(declare-fun e!130605 () Bool)

(assert (=> b!189114 (=> (not res!157618) (not e!130605))))

(declare-datatypes ((tuple2!16334 0))(
  ( (tuple2!16335 (_1!8812 BitStream!7814) (_2!8812 BitStream!7814)) )
))
(declare-fun lt!293752 () tuple2!16334)

(declare-fun lt!293746 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7814 (_ BitVec 64)) BitStream!7814)

(assert (=> b!189114 (= res!157618 (= (_1!8812 lt!293752) (withMovedBitIndex!0 (_2!8812 lt!293752) (bvsub lt!293772 lt!293746))))))

(declare-fun b!189115 () Bool)

(declare-fun res!157627 () Bool)

(declare-fun e!130602 () Bool)

(assert (=> b!189115 (=> (not res!157627) (not e!130602))))

(declare-fun isPrefixOf!0 (BitStream!7814 BitStream!7814) Bool)

(assert (=> b!189115 (= res!157627 (isPrefixOf!0 thiss!1204 (_2!8811 lt!293760)))))

(declare-fun b!189116 () Bool)

(declare-fun e!130603 () Bool)

(assert (=> b!189116 (= e!130595 e!130603)))

(declare-fun res!157617 () Bool)

(assert (=> b!189116 (=> res!157617 e!130603)))

(assert (=> b!189116 (= res!157617 (not (= lt!293746 (bvsub (bvsub (bvadd lt!293772 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!293759 () tuple2!16332)

(assert (=> b!189116 (= lt!293746 (bitIndex!0 (size!4353 (buf!4827 (_2!8811 lt!293759))) (currentByte!9099 (_2!8811 lt!293759)) (currentBit!9094 (_2!8811 lt!293759))))))

(assert (=> b!189116 (isPrefixOf!0 thiss!1204 (_2!8811 lt!293759))))

(declare-fun lt!293762 () Unit!13505)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7814 BitStream!7814 BitStream!7814) Unit!13505)

(assert (=> b!189116 (= lt!293762 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8811 lt!293760) (_2!8811 lt!293759)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7814 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16332)

(assert (=> b!189116 (= lt!293759 (appendBitsLSBFirstLoopTR!0 (_2!8811 lt!293760) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!189117 () Bool)

(declare-fun res!157626 () Bool)

(assert (=> b!189117 (=> res!157626 e!130603)))

(assert (=> b!189117 (= res!157626 (not (isPrefixOf!0 thiss!1204 (_2!8811 lt!293760))))))

(declare-fun b!189118 () Bool)

(declare-fun res!157629 () Bool)

(assert (=> b!189118 (=> res!157629 e!130603)))

(assert (=> b!189118 (= res!157629 (not (isPrefixOf!0 (_2!8811 lt!293760) (_2!8811 lt!293759))))))

(declare-fun b!189119 () Bool)

(declare-fun e!130597 () Bool)

(assert (=> b!189119 (= e!130602 e!130597)))

(declare-fun res!157623 () Bool)

(assert (=> b!189119 (=> (not res!157623) (not e!130597))))

(declare-datatypes ((tuple2!16336 0))(
  ( (tuple2!16337 (_1!8813 BitStream!7814) (_2!8813 Bool)) )
))
(declare-fun lt!293757 () tuple2!16336)

(assert (=> b!189119 (= res!157623 (and (= (_2!8813 lt!293757) lt!293761) (= (_1!8813 lt!293757) (_2!8811 lt!293760))))))

(declare-fun readBitPure!0 (BitStream!7814) tuple2!16336)

(declare-fun readerFrom!0 (BitStream!7814 (_ BitVec 32) (_ BitVec 32)) BitStream!7814)

(assert (=> b!189119 (= lt!293757 (readBitPure!0 (readerFrom!0 (_2!8811 lt!293760) (currentBit!9094 thiss!1204) (currentByte!9099 thiss!1204))))))

(declare-fun b!189120 () Bool)

(declare-fun res!157625 () Bool)

(assert (=> b!189120 (=> (not res!157625) (not e!130598))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189120 (= res!157625 (invariant!0 (currentBit!9094 thiss!1204) (currentByte!9099 thiss!1204) (size!4353 (buf!4827 thiss!1204))))))

(declare-fun b!189121 () Bool)

(declare-fun res!157619 () Bool)

(declare-fun e!130601 () Bool)

(assert (=> b!189121 (=> res!157619 e!130601)))

(declare-datatypes ((tuple2!16338 0))(
  ( (tuple2!16339 (_1!8814 BitStream!7814) (_2!8814 (_ BitVec 64))) )
))
(declare-fun lt!293756 () tuple2!16338)

(declare-fun lt!293770 () tuple2!16334)

(assert (=> b!189121 (= res!157619 (not (= (bitIndex!0 (size!4353 (buf!4827 (_1!8814 lt!293756))) (currentByte!9099 (_1!8814 lt!293756)) (currentBit!9094 (_1!8814 lt!293756))) (bitIndex!0 (size!4353 (buf!4827 (_2!8812 lt!293770))) (currentByte!9099 (_2!8812 lt!293770)) (currentBit!9094 (_2!8812 lt!293770))))))))

(declare-fun b!189122 () Bool)

(declare-fun res!157616 () Bool)

(assert (=> b!189122 (=> (not res!157616) (not e!130605))))

(assert (=> b!189122 (= res!157616 (= (_1!8812 lt!293770) (withMovedBitIndex!0 (_2!8812 lt!293770) (bvsub lt!293771 lt!293746))))))

(declare-fun b!189123 () Bool)

(declare-fun e!130604 () Bool)

(assert (=> b!189123 (= e!130603 e!130604)))

(declare-fun res!157630 () Bool)

(assert (=> b!189123 (=> res!157630 e!130604)))

(declare-fun lt!293768 () tuple2!16338)

(assert (=> b!189123 (= res!157630 (not (= (_1!8814 lt!293768) (_2!8812 lt!293752))))))

(declare-fun lt!293767 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16338)

(assert (=> b!189123 (= lt!293768 (readNBitsLSBFirstsLoopPure!0 (_1!8812 lt!293752) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293767))))

(declare-fun lt!293766 () (_ BitVec 64))

(assert (=> b!189123 (validate_offset_bits!1 ((_ sign_extend 32) (size!4353 (buf!4827 (_2!8811 lt!293759)))) ((_ sign_extend 32) (currentByte!9099 (_2!8811 lt!293760))) ((_ sign_extend 32) (currentBit!9094 (_2!8811 lt!293760))) lt!293766)))

(declare-fun lt!293745 () Unit!13505)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7814 array!9876 (_ BitVec 64)) Unit!13505)

(assert (=> b!189123 (= lt!293745 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8811 lt!293760) (buf!4827 (_2!8811 lt!293759)) lt!293766))))

(assert (=> b!189123 (= lt!293766 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!293751 () (_ BitVec 64))

(declare-fun lt!293773 () tuple2!16336)

(assert (=> b!189123 (= lt!293767 (bvor lt!293751 (ite (_2!8813 lt!293773) lt!293765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189123 (= lt!293756 (readNBitsLSBFirstsLoopPure!0 (_1!8812 lt!293770) nBits!348 i!590 lt!293751))))

(assert (=> b!189123 (validate_offset_bits!1 ((_ sign_extend 32) (size!4353 (buf!4827 (_2!8811 lt!293759)))) ((_ sign_extend 32) (currentByte!9099 thiss!1204)) ((_ sign_extend 32) (currentBit!9094 thiss!1204)) lt!293769)))

(declare-fun lt!293750 () Unit!13505)

(assert (=> b!189123 (= lt!293750 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4827 (_2!8811 lt!293759)) lt!293769))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189123 (= lt!293751 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!189123 (= (_2!8813 lt!293773) lt!293761)))

(assert (=> b!189123 (= lt!293773 (readBitPure!0 (_1!8812 lt!293770)))))

(declare-fun reader!0 (BitStream!7814 BitStream!7814) tuple2!16334)

(assert (=> b!189123 (= lt!293752 (reader!0 (_2!8811 lt!293760) (_2!8811 lt!293759)))))

(assert (=> b!189123 (= lt!293770 (reader!0 thiss!1204 (_2!8811 lt!293759)))))

(declare-fun e!130607 () Bool)

(assert (=> b!189123 e!130607))

(declare-fun res!157631 () Bool)

(assert (=> b!189123 (=> (not res!157631) (not e!130607))))

(declare-fun lt!293763 () tuple2!16336)

(declare-fun lt!293748 () tuple2!16336)

(assert (=> b!189123 (= res!157631 (= (bitIndex!0 (size!4353 (buf!4827 (_1!8813 lt!293763))) (currentByte!9099 (_1!8813 lt!293763)) (currentBit!9094 (_1!8813 lt!293763))) (bitIndex!0 (size!4353 (buf!4827 (_1!8813 lt!293748))) (currentByte!9099 (_1!8813 lt!293748)) (currentBit!9094 (_1!8813 lt!293748)))))))

(declare-fun lt!293747 () Unit!13505)

(declare-fun lt!293755 () BitStream!7814)

(declare-fun readBitPrefixLemma!0 (BitStream!7814 BitStream!7814) Unit!13505)

(assert (=> b!189123 (= lt!293747 (readBitPrefixLemma!0 lt!293755 (_2!8811 lt!293759)))))

(assert (=> b!189123 (= lt!293748 (readBitPure!0 (BitStream!7815 (buf!4827 (_2!8811 lt!293759)) (currentByte!9099 thiss!1204) (currentBit!9094 thiss!1204))))))

(assert (=> b!189123 (= lt!293763 (readBitPure!0 lt!293755))))

(declare-fun e!130599 () Bool)

(assert (=> b!189123 e!130599))

(declare-fun res!157624 () Bool)

(assert (=> b!189123 (=> (not res!157624) (not e!130599))))

(assert (=> b!189123 (= res!157624 (invariant!0 (currentBit!9094 thiss!1204) (currentByte!9099 thiss!1204) (size!4353 (buf!4827 (_2!8811 lt!293760)))))))

(assert (=> b!189123 (= lt!293755 (BitStream!7815 (buf!4827 (_2!8811 lt!293760)) (currentByte!9099 thiss!1204) (currentBit!9094 thiss!1204)))))

(declare-fun b!189124 () Bool)

(declare-fun lt!293764 () (_ BitVec 64))

(assert (=> b!189124 (= e!130597 (= (bitIndex!0 (size!4353 (buf!4827 (_1!8813 lt!293757))) (currentByte!9099 (_1!8813 lt!293757)) (currentBit!9094 (_1!8813 lt!293757))) lt!293764))))

(declare-fun b!189125 () Bool)

(declare-fun e!130596 () Bool)

(declare-fun array_inv!4094 (array!9876) Bool)

(assert (=> b!189125 (= e!130596 (array_inv!4094 (buf!4827 thiss!1204)))))

(declare-fun b!189126 () Bool)

(declare-fun res!157614 () Bool)

(assert (=> b!189126 (=> res!157614 e!130603)))

(assert (=> b!189126 (= res!157614 (not (invariant!0 (currentBit!9094 (_2!8811 lt!293759)) (currentByte!9099 (_2!8811 lt!293759)) (size!4353 (buf!4827 (_2!8811 lt!293759))))))))

(declare-fun res!157621 () Bool)

(assert (=> start!40986 (=> (not res!157621) (not e!130594))))

(assert (=> start!40986 (= res!157621 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40986 e!130594))

(assert (=> start!40986 true))

(declare-fun inv!12 (BitStream!7814) Bool)

(assert (=> start!40986 (and (inv!12 thiss!1204) e!130596)))

(declare-fun b!189127 () Bool)

(assert (=> b!189127 (= e!130607 (= (_2!8813 lt!293763) (_2!8813 lt!293748)))))

(declare-fun b!189128 () Bool)

(assert (=> b!189128 (= e!130599 (invariant!0 (currentBit!9094 thiss!1204) (currentByte!9099 thiss!1204) (size!4353 (buf!4827 (_2!8811 lt!293759)))))))

(declare-fun b!189129 () Bool)

(declare-fun res!157620 () Bool)

(assert (=> b!189129 (=> (not res!157620) (not e!130598))))

(assert (=> b!189129 (= res!157620 (not (= i!590 nBits!348)))))

(declare-fun b!189130 () Bool)

(assert (=> b!189130 (= e!130600 e!130602)))

(declare-fun res!157615 () Bool)

(assert (=> b!189130 (=> (not res!157615) (not e!130602))))

(declare-fun lt!293749 () (_ BitVec 64))

(assert (=> b!189130 (= res!157615 (= lt!293764 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293749)))))

(assert (=> b!189130 (= lt!293764 (bitIndex!0 (size!4353 (buf!4827 (_2!8811 lt!293760))) (currentByte!9099 (_2!8811 lt!293760)) (currentBit!9094 (_2!8811 lt!293760))))))

(assert (=> b!189130 (= lt!293749 (bitIndex!0 (size!4353 (buf!4827 thiss!1204)) (currentByte!9099 thiss!1204) (currentBit!9094 thiss!1204)))))

(declare-fun b!189131 () Bool)

(assert (=> b!189131 (= e!130601 true)))

(assert (=> b!189131 (= (size!4353 (buf!4827 thiss!1204)) (size!4353 (buf!4827 (_2!8811 lt!293759))))))

(declare-fun lt!293753 () BitStream!7814)

(declare-fun b!189132 () Bool)

(assert (=> b!189132 (= e!130605 (and (= lt!293771 (bvsub lt!293772 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8812 lt!293752) lt!293753)) (= (_2!8814 lt!293756) (_2!8814 lt!293768)))))))

(declare-fun b!189133 () Bool)

(assert (=> b!189133 (= e!130604 e!130601)))

(declare-fun res!157632 () Bool)

(assert (=> b!189133 (=> res!157632 e!130601)))

(assert (=> b!189133 (= res!157632 (not (= (_1!8812 lt!293752) lt!293753)))))

(assert (=> b!189133 e!130605))

(declare-fun res!157634 () Bool)

(assert (=> b!189133 (=> (not res!157634) (not e!130605))))

(declare-fun lt!293754 () tuple2!16338)

(assert (=> b!189133 (= res!157634 (and (= (_2!8814 lt!293756) (_2!8814 lt!293754)) (= (_1!8814 lt!293756) (_1!8814 lt!293754))))))

(declare-fun lt!293758 () Unit!13505)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13505)

(assert (=> b!189133 (= lt!293758 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8812 lt!293770) nBits!348 i!590 lt!293751))))

(assert (=> b!189133 (= lt!293754 (readNBitsLSBFirstsLoopPure!0 lt!293753 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293767))))

(assert (=> b!189133 (= lt!293753 (withMovedBitIndex!0 (_1!8812 lt!293770) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!189134 () Bool)

(declare-fun res!157622 () Bool)

(assert (=> b!189134 (=> res!157622 e!130603)))

(assert (=> b!189134 (= res!157622 (or (not (= (size!4353 (buf!4827 (_2!8811 lt!293759))) (size!4353 (buf!4827 thiss!1204)))) (not (= lt!293746 (bvsub (bvadd lt!293771 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(assert (= (and start!40986 res!157621) b!189113))

(assert (= (and b!189113 res!157628) b!189120))

(assert (= (and b!189120 res!157625) b!189129))

(assert (= (and b!189129 res!157620) b!189112))

(assert (= (and b!189112 res!157633) b!189130))

(assert (= (and b!189130 res!157615) b!189115))

(assert (= (and b!189115 res!157627) b!189119))

(assert (= (and b!189119 res!157623) b!189124))

(assert (= (and b!189112 (not res!157635)) b!189116))

(assert (= (and b!189116 (not res!157617)) b!189126))

(assert (= (and b!189126 (not res!157614)) b!189134))

(assert (= (and b!189134 (not res!157622)) b!189118))

(assert (= (and b!189118 (not res!157629)) b!189117))

(assert (= (and b!189117 (not res!157626)) b!189123))

(assert (= (and b!189123 res!157624) b!189128))

(assert (= (and b!189123 res!157631) b!189127))

(assert (= (and b!189123 (not res!157630)) b!189133))

(assert (= (and b!189133 res!157634) b!189122))

(assert (= (and b!189122 res!157616) b!189114))

(assert (= (and b!189114 res!157618) b!189132))

(assert (= (and b!189133 (not res!157632)) b!189121))

(assert (= (and b!189121 (not res!157619)) b!189131))

(assert (= start!40986 b!189125))

(declare-fun m!294061 () Bool)

(assert (=> b!189112 m!294061))

(declare-fun m!294063 () Bool)

(assert (=> b!189112 m!294063))

(declare-fun m!294065 () Bool)

(assert (=> b!189112 m!294065))

(declare-fun m!294067 () Bool)

(assert (=> b!189113 m!294067))

(assert (=> b!189130 m!294061))

(assert (=> b!189130 m!294063))

(declare-fun m!294069 () Bool)

(assert (=> b!189121 m!294069))

(declare-fun m!294071 () Bool)

(assert (=> b!189121 m!294071))

(declare-fun m!294073 () Bool)

(assert (=> b!189114 m!294073))

(declare-fun m!294075 () Bool)

(assert (=> b!189125 m!294075))

(declare-fun m!294077 () Bool)

(assert (=> b!189118 m!294077))

(declare-fun m!294079 () Bool)

(assert (=> b!189133 m!294079))

(declare-fun m!294081 () Bool)

(assert (=> b!189133 m!294081))

(declare-fun m!294083 () Bool)

(assert (=> b!189133 m!294083))

(declare-fun m!294085 () Bool)

(assert (=> b!189117 m!294085))

(declare-fun m!294087 () Bool)

(assert (=> b!189116 m!294087))

(declare-fun m!294089 () Bool)

(assert (=> b!189116 m!294089))

(declare-fun m!294091 () Bool)

(assert (=> b!189116 m!294091))

(declare-fun m!294093 () Bool)

(assert (=> b!189116 m!294093))

(declare-fun m!294095 () Bool)

(assert (=> b!189128 m!294095))

(declare-fun m!294097 () Bool)

(assert (=> start!40986 m!294097))

(declare-fun m!294099 () Bool)

(assert (=> b!189123 m!294099))

(declare-fun m!294101 () Bool)

(assert (=> b!189123 m!294101))

(declare-fun m!294103 () Bool)

(assert (=> b!189123 m!294103))

(declare-fun m!294105 () Bool)

(assert (=> b!189123 m!294105))

(declare-fun m!294107 () Bool)

(assert (=> b!189123 m!294107))

(declare-fun m!294109 () Bool)

(assert (=> b!189123 m!294109))

(declare-fun m!294111 () Bool)

(assert (=> b!189123 m!294111))

(declare-fun m!294113 () Bool)

(assert (=> b!189123 m!294113))

(declare-fun m!294115 () Bool)

(assert (=> b!189123 m!294115))

(declare-fun m!294117 () Bool)

(assert (=> b!189123 m!294117))

(declare-fun m!294119 () Bool)

(assert (=> b!189123 m!294119))

(declare-fun m!294121 () Bool)

(assert (=> b!189123 m!294121))

(declare-fun m!294123 () Bool)

(assert (=> b!189123 m!294123))

(declare-fun m!294125 () Bool)

(assert (=> b!189123 m!294125))

(declare-fun m!294127 () Bool)

(assert (=> b!189123 m!294127))

(declare-fun m!294129 () Bool)

(assert (=> b!189123 m!294129))

(assert (=> b!189115 m!294085))

(declare-fun m!294131 () Bool)

(assert (=> b!189119 m!294131))

(assert (=> b!189119 m!294131))

(declare-fun m!294133 () Bool)

(assert (=> b!189119 m!294133))

(declare-fun m!294135 () Bool)

(assert (=> b!189120 m!294135))

(declare-fun m!294137 () Bool)

(assert (=> b!189126 m!294137))

(declare-fun m!294139 () Bool)

(assert (=> b!189122 m!294139))

(declare-fun m!294141 () Bool)

(assert (=> b!189124 m!294141))

(push 1)

(assert (not b!189133))

(assert (not b!189123))

(assert (not b!189128))

(assert (not b!189113))

(assert (not b!189125))

(assert (not start!40986))

(assert (not b!189116))

(assert (not b!189120))

(assert (not b!189115))

(assert (not b!189114))

(assert (not b!189122))

(assert (not b!189130))

(assert (not b!189112))

(assert (not b!189118))

(assert (not b!189119))

(assert (not b!189117))

(assert (not b!189121))

(assert (not b!189126))

(assert (not b!189124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

