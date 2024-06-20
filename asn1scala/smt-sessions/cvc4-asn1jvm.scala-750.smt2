; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21590 () Bool)

(assert start!21590)

(declare-fun b!108624 () Bool)

(declare-fun res!89560 () Bool)

(declare-fun e!71097 () Bool)

(assert (=> b!108624 (=> (not res!89560) (not e!71097))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!108624 (= res!89560 (bvslt i!615 nBits!396))))

(declare-fun b!108625 () Bool)

(declare-fun e!71101 () Bool)

(declare-fun e!71100 () Bool)

(assert (=> b!108625 (= e!71101 e!71100)))

(declare-fun res!89558 () Bool)

(assert (=> b!108625 (=> (not res!89558) (not e!71100))))

(declare-datatypes ((array!4953 0))(
  ( (array!4954 (arr!2846 (Array (_ BitVec 32) (_ BitVec 8))) (size!2253 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3980 0))(
  ( (BitStream!3981 (buf!2644 array!4953) (currentByte!5180 (_ BitVec 32)) (currentBit!5175 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6647 0))(
  ( (Unit!6648) )
))
(declare-datatypes ((tuple2!8956 0))(
  ( (tuple2!8957 (_1!4735 Unit!6647) (_2!4735 BitStream!3980)) )
))
(declare-fun lt!163787 () tuple2!8956)

(declare-datatypes ((tuple2!8958 0))(
  ( (tuple2!8959 (_1!4736 BitStream!3980) (_2!4736 Bool)) )
))
(declare-fun lt!163775 () tuple2!8958)

(declare-fun lt!163802 () Bool)

(assert (=> b!108625 (= res!89558 (and (= (_2!4736 lt!163775) lt!163802) (= (_1!4736 lt!163775) (_2!4735 lt!163787))))))

(declare-fun thiss!1305 () BitStream!3980)

(declare-fun readBitPure!0 (BitStream!3980) tuple2!8958)

(declare-fun readerFrom!0 (BitStream!3980 (_ BitVec 32) (_ BitVec 32)) BitStream!3980)

(assert (=> b!108625 (= lt!163775 (readBitPure!0 (readerFrom!0 (_2!4735 lt!163787) (currentBit!5175 thiss!1305) (currentByte!5180 thiss!1305))))))

(declare-fun b!108626 () Bool)

(declare-fun lt!163797 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108626 (= e!71100 (= (bitIndex!0 (size!2253 (buf!2644 (_1!4736 lt!163775))) (currentByte!5180 (_1!4736 lt!163775)) (currentBit!5175 (_1!4736 lt!163775))) lt!163797))))

(declare-fun b!108627 () Bool)

(declare-fun e!71095 () Bool)

(assert (=> b!108627 (= e!71095 true)))

(declare-fun e!71099 () Bool)

(assert (=> b!108627 e!71099))

(declare-fun res!89556 () Bool)

(assert (=> b!108627 (=> (not res!89556) (not e!71099))))

(declare-fun lt!163774 () (_ BitVec 64))

(declare-fun lt!163786 () (_ BitVec 64))

(declare-datatypes ((tuple2!8960 0))(
  ( (tuple2!8961 (_1!4737 BitStream!3980) (_2!4737 BitStream!3980)) )
))
(declare-fun lt!163780 () tuple2!8960)

(declare-fun withMovedBitIndex!0 (BitStream!3980 (_ BitVec 64)) BitStream!3980)

(assert (=> b!108627 (= res!89556 (= (_1!4737 lt!163780) (withMovedBitIndex!0 (_2!4737 lt!163780) (bvsub lt!163774 lt!163786))))))

(assert (=> b!108627 (= lt!163774 (bitIndex!0 (size!2253 (buf!2644 (_2!4735 lt!163787))) (currentByte!5180 (_2!4735 lt!163787)) (currentBit!5175 (_2!4735 lt!163787))))))

(declare-fun lt!163776 () tuple2!8960)

(declare-fun lt!163794 () (_ BitVec 64))

(assert (=> b!108627 (= (_1!4737 lt!163776) (withMovedBitIndex!0 (_2!4737 lt!163776) (bvsub lt!163794 lt!163786)))))

(declare-fun lt!163799 () tuple2!8956)

(assert (=> b!108627 (= lt!163786 (bitIndex!0 (size!2253 (buf!2644 (_2!4735 lt!163799))) (currentByte!5180 (_2!4735 lt!163799)) (currentBit!5175 (_2!4735 lt!163799))))))

(assert (=> b!108627 (= lt!163794 (bitIndex!0 (size!2253 (buf!2644 thiss!1305)) (currentByte!5180 thiss!1305) (currentBit!5175 thiss!1305)))))

(declare-datatypes ((tuple2!8962 0))(
  ( (tuple2!8963 (_1!4738 BitStream!3980) (_2!4738 (_ BitVec 64))) )
))
(declare-fun lt!163801 () tuple2!8962)

(declare-fun lt!163783 () tuple2!8962)

(assert (=> b!108627 (and (= (_2!4738 lt!163801) (_2!4738 lt!163783)) (= (_1!4738 lt!163801) (_1!4738 lt!163783)))))

(declare-fun lt!163777 () Unit!6647)

(declare-fun lt!163795 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6647)

(assert (=> b!108627 (= lt!163777 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4737 lt!163776) nBits!396 i!615 lt!163795))))

(declare-fun lt!163781 () (_ BitVec 64))

(declare-fun lt!163798 () BitStream!3980)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8962)

(assert (=> b!108627 (= lt!163783 (readNLeastSignificantBitsLoopPure!0 lt!163798 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163781))))

(assert (=> b!108627 (= lt!163798 (withMovedBitIndex!0 (_1!4737 lt!163776) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108628 () Bool)

(declare-fun res!89553 () Bool)

(assert (=> b!108628 (=> (not res!89553) (not e!71097))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108628 (= res!89553 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108629 () Bool)

(assert (=> b!108629 (= e!71097 (not e!71095))))

(declare-fun res!89561 () Bool)

(assert (=> b!108629 (=> res!89561 e!71095)))

(declare-fun lt!163796 () tuple2!8962)

(assert (=> b!108629 (= res!89561 (not (= (_1!4738 lt!163796) (_2!4737 lt!163780))))))

(assert (=> b!108629 (= lt!163796 (readNLeastSignificantBitsLoopPure!0 (_1!4737 lt!163780) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163781))))

(declare-fun lt!163791 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108629 (validate_offset_bits!1 ((_ sign_extend 32) (size!2253 (buf!2644 (_2!4735 lt!163799)))) ((_ sign_extend 32) (currentByte!5180 (_2!4735 lt!163787))) ((_ sign_extend 32) (currentBit!5175 (_2!4735 lt!163787))) lt!163791)))

(declare-fun lt!163782 () Unit!6647)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3980 array!4953 (_ BitVec 64)) Unit!6647)

(assert (=> b!108629 (= lt!163782 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4735 lt!163787) (buf!2644 (_2!4735 lt!163799)) lt!163791))))

(assert (=> b!108629 (= lt!163791 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!163800 () (_ BitVec 64))

(declare-fun lt!163788 () tuple2!8958)

(assert (=> b!108629 (= lt!163781 (bvor lt!163795 (ite (_2!4736 lt!163788) lt!163800 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108629 (= lt!163801 (readNLeastSignificantBitsLoopPure!0 (_1!4737 lt!163776) nBits!396 i!615 lt!163795))))

(declare-fun lt!163784 () (_ BitVec 64))

(assert (=> b!108629 (validate_offset_bits!1 ((_ sign_extend 32) (size!2253 (buf!2644 (_2!4735 lt!163799)))) ((_ sign_extend 32) (currentByte!5180 thiss!1305)) ((_ sign_extend 32) (currentBit!5175 thiss!1305)) lt!163784)))

(declare-fun lt!163789 () Unit!6647)

(assert (=> b!108629 (= lt!163789 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2644 (_2!4735 lt!163799)) lt!163784))))

(assert (=> b!108629 (= lt!163795 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108629 (= (_2!4736 lt!163788) lt!163802)))

(assert (=> b!108629 (= lt!163788 (readBitPure!0 (_1!4737 lt!163776)))))

(declare-fun reader!0 (BitStream!3980 BitStream!3980) tuple2!8960)

(assert (=> b!108629 (= lt!163780 (reader!0 (_2!4735 lt!163787) (_2!4735 lt!163799)))))

(assert (=> b!108629 (= lt!163776 (reader!0 thiss!1305 (_2!4735 lt!163799)))))

(declare-fun e!71098 () Bool)

(assert (=> b!108629 e!71098))

(declare-fun res!89554 () Bool)

(assert (=> b!108629 (=> (not res!89554) (not e!71098))))

(declare-fun lt!163792 () tuple2!8958)

(declare-fun lt!163793 () tuple2!8958)

(assert (=> b!108629 (= res!89554 (= (bitIndex!0 (size!2253 (buf!2644 (_1!4736 lt!163792))) (currentByte!5180 (_1!4736 lt!163792)) (currentBit!5175 (_1!4736 lt!163792))) (bitIndex!0 (size!2253 (buf!2644 (_1!4736 lt!163793))) (currentByte!5180 (_1!4736 lt!163793)) (currentBit!5175 (_1!4736 lt!163793)))))))

(declare-fun lt!163785 () Unit!6647)

(declare-fun lt!163779 () BitStream!3980)

(declare-fun readBitPrefixLemma!0 (BitStream!3980 BitStream!3980) Unit!6647)

(assert (=> b!108629 (= lt!163785 (readBitPrefixLemma!0 lt!163779 (_2!4735 lt!163799)))))

(assert (=> b!108629 (= lt!163793 (readBitPure!0 (BitStream!3981 (buf!2644 (_2!4735 lt!163799)) (currentByte!5180 thiss!1305) (currentBit!5175 thiss!1305))))))

(assert (=> b!108629 (= lt!163792 (readBitPure!0 lt!163779))))

(assert (=> b!108629 (= lt!163779 (BitStream!3981 (buf!2644 (_2!4735 lt!163787)) (currentByte!5180 thiss!1305) (currentBit!5175 thiss!1305)))))

(declare-fun e!71094 () Bool)

(assert (=> b!108629 e!71094))

(declare-fun res!89552 () Bool)

(assert (=> b!108629 (=> (not res!89552) (not e!71094))))

(declare-fun isPrefixOf!0 (BitStream!3980 BitStream!3980) Bool)

(assert (=> b!108629 (= res!89552 (isPrefixOf!0 thiss!1305 (_2!4735 lt!163799)))))

(declare-fun lt!163778 () Unit!6647)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3980 BitStream!3980 BitStream!3980) Unit!6647)

(assert (=> b!108629 (= lt!163778 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4735 lt!163787) (_2!4735 lt!163799)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3980 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8956)

(assert (=> b!108629 (= lt!163799 (appendNLeastSignificantBitsLoop!0 (_2!4735 lt!163787) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71093 () Bool)

(assert (=> b!108629 e!71093))

(declare-fun res!89551 () Bool)

(assert (=> b!108629 (=> (not res!89551) (not e!71093))))

(assert (=> b!108629 (= res!89551 (= (size!2253 (buf!2644 thiss!1305)) (size!2253 (buf!2644 (_2!4735 lt!163787)))))))

(declare-fun appendBit!0 (BitStream!3980 Bool) tuple2!8956)

(assert (=> b!108629 (= lt!163787 (appendBit!0 thiss!1305 lt!163802))))

(assert (=> b!108629 (= lt!163802 (not (= (bvand v!199 lt!163800) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108629 (= lt!163800 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108631 () Bool)

(declare-fun res!89555 () Bool)

(assert (=> b!108631 (=> (not res!89555) (not e!71094))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108631 (= res!89555 (invariant!0 (currentBit!5175 thiss!1305) (currentByte!5180 thiss!1305) (size!2253 (buf!2644 (_2!4735 lt!163787)))))))

(declare-fun b!108632 () Bool)

(assert (=> b!108632 (= e!71098 (= (_2!4736 lt!163792) (_2!4736 lt!163793)))))

(declare-fun b!108633 () Bool)

(declare-fun e!71096 () Bool)

(assert (=> b!108633 (= e!71096 e!71097)))

(declare-fun res!89563 () Bool)

(assert (=> b!108633 (=> (not res!89563) (not e!71097))))

(assert (=> b!108633 (= res!89563 (validate_offset_bits!1 ((_ sign_extend 32) (size!2253 (buf!2644 thiss!1305))) ((_ sign_extend 32) (currentByte!5180 thiss!1305)) ((_ sign_extend 32) (currentBit!5175 thiss!1305)) lt!163784))))

(assert (=> b!108633 (= lt!163784 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108634 () Bool)

(assert (=> b!108634 (= e!71099 (and (= lt!163794 (bvsub lt!163774 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4737 lt!163780) lt!163798)) (and (= (_2!4738 lt!163801) (_2!4738 lt!163796)) (= (_1!4738 lt!163801) (_2!4737 lt!163776))))))))

(declare-fun b!108635 () Bool)

(declare-fun e!71092 () Bool)

(declare-fun array_inv!2055 (array!4953) Bool)

(assert (=> b!108635 (= e!71092 (array_inv!2055 (buf!2644 thiss!1305)))))

(declare-fun b!108630 () Bool)

(assert (=> b!108630 (= e!71093 e!71101)))

(declare-fun res!89562 () Bool)

(assert (=> b!108630 (=> (not res!89562) (not e!71101))))

(declare-fun lt!163790 () (_ BitVec 64))

(assert (=> b!108630 (= res!89562 (= lt!163797 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!163790)))))

(assert (=> b!108630 (= lt!163797 (bitIndex!0 (size!2253 (buf!2644 (_2!4735 lt!163787))) (currentByte!5180 (_2!4735 lt!163787)) (currentBit!5175 (_2!4735 lt!163787))))))

(assert (=> b!108630 (= lt!163790 (bitIndex!0 (size!2253 (buf!2644 thiss!1305)) (currentByte!5180 thiss!1305) (currentBit!5175 thiss!1305)))))

(declare-fun res!89557 () Bool)

(assert (=> start!21590 (=> (not res!89557) (not e!71096))))

(assert (=> start!21590 (= res!89557 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21590 e!71096))

(assert (=> start!21590 true))

(declare-fun inv!12 (BitStream!3980) Bool)

(assert (=> start!21590 (and (inv!12 thiss!1305) e!71092)))

(declare-fun b!108636 () Bool)

(assert (=> b!108636 (= e!71094 (invariant!0 (currentBit!5175 thiss!1305) (currentByte!5180 thiss!1305) (size!2253 (buf!2644 (_2!4735 lt!163799)))))))

(declare-fun b!108637 () Bool)

(declare-fun res!89559 () Bool)

(assert (=> b!108637 (=> (not res!89559) (not e!71101))))

(assert (=> b!108637 (= res!89559 (isPrefixOf!0 thiss!1305 (_2!4735 lt!163787)))))

(assert (= (and start!21590 res!89557) b!108633))

(assert (= (and b!108633 res!89563) b!108628))

(assert (= (and b!108628 res!89553) b!108624))

(assert (= (and b!108624 res!89560) b!108629))

(assert (= (and b!108629 res!89551) b!108630))

(assert (= (and b!108630 res!89562) b!108637))

(assert (= (and b!108637 res!89559) b!108625))

(assert (= (and b!108625 res!89558) b!108626))

(assert (= (and b!108629 res!89552) b!108631))

(assert (= (and b!108631 res!89555) b!108636))

(assert (= (and b!108629 res!89554) b!108632))

(assert (= (and b!108629 (not res!89561)) b!108627))

(assert (= (and b!108627 res!89556) b!108634))

(assert (= start!21590 b!108635))

(declare-fun m!161025 () Bool)

(assert (=> start!21590 m!161025))

(declare-fun m!161027 () Bool)

(assert (=> b!108626 m!161027))

(declare-fun m!161029 () Bool)

(assert (=> b!108631 m!161029))

(declare-fun m!161031 () Bool)

(assert (=> b!108627 m!161031))

(declare-fun m!161033 () Bool)

(assert (=> b!108627 m!161033))

(declare-fun m!161035 () Bool)

(assert (=> b!108627 m!161035))

(declare-fun m!161037 () Bool)

(assert (=> b!108627 m!161037))

(declare-fun m!161039 () Bool)

(assert (=> b!108627 m!161039))

(declare-fun m!161041 () Bool)

(assert (=> b!108627 m!161041))

(declare-fun m!161043 () Bool)

(assert (=> b!108627 m!161043))

(declare-fun m!161045 () Bool)

(assert (=> b!108627 m!161045))

(declare-fun m!161047 () Bool)

(assert (=> b!108635 m!161047))

(declare-fun m!161049 () Bool)

(assert (=> b!108637 m!161049))

(declare-fun m!161051 () Bool)

(assert (=> b!108628 m!161051))

(declare-fun m!161053 () Bool)

(assert (=> b!108633 m!161053))

(declare-fun m!161055 () Bool)

(assert (=> b!108629 m!161055))

(declare-fun m!161057 () Bool)

(assert (=> b!108629 m!161057))

(declare-fun m!161059 () Bool)

(assert (=> b!108629 m!161059))

(declare-fun m!161061 () Bool)

(assert (=> b!108629 m!161061))

(declare-fun m!161063 () Bool)

(assert (=> b!108629 m!161063))

(declare-fun m!161065 () Bool)

(assert (=> b!108629 m!161065))

(declare-fun m!161067 () Bool)

(assert (=> b!108629 m!161067))

(declare-fun m!161069 () Bool)

(assert (=> b!108629 m!161069))

(declare-fun m!161071 () Bool)

(assert (=> b!108629 m!161071))

(declare-fun m!161073 () Bool)

(assert (=> b!108629 m!161073))

(declare-fun m!161075 () Bool)

(assert (=> b!108629 m!161075))

(declare-fun m!161077 () Bool)

(assert (=> b!108629 m!161077))

(declare-fun m!161079 () Bool)

(assert (=> b!108629 m!161079))

(declare-fun m!161081 () Bool)

(assert (=> b!108629 m!161081))

(declare-fun m!161083 () Bool)

(assert (=> b!108629 m!161083))

(declare-fun m!161085 () Bool)

(assert (=> b!108629 m!161085))

(declare-fun m!161087 () Bool)

(assert (=> b!108629 m!161087))

(declare-fun m!161089 () Bool)

(assert (=> b!108629 m!161089))

(declare-fun m!161091 () Bool)

(assert (=> b!108629 m!161091))

(declare-fun m!161093 () Bool)

(assert (=> b!108625 m!161093))

(assert (=> b!108625 m!161093))

(declare-fun m!161095 () Bool)

(assert (=> b!108625 m!161095))

(declare-fun m!161097 () Bool)

(assert (=> b!108636 m!161097))

(assert (=> b!108630 m!161045))

(assert (=> b!108630 m!161033))

(push 1)

(assert (not start!21590))

(assert (not b!108631))

(assert (not b!108630))

(assert (not b!108625))

(assert (not b!108637))

(assert (not b!108628))

(assert (not b!108627))

(assert (not b!108636))

(assert (not b!108635))

(assert (not b!108629))

(assert (not b!108633))

(assert (not b!108626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

