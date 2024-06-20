; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21466 () Bool)

(assert start!21466)

(declare-fun b!107939 () Bool)

(declare-fun e!70637 () Bool)

(declare-fun e!70634 () Bool)

(assert (=> b!107939 (= e!70637 e!70634)))

(declare-fun res!88951 () Bool)

(assert (=> b!107939 (=> (not res!88951) (not e!70634))))

(declare-fun lt!162106 () (_ BitVec 64))

(declare-fun lt!162098 () (_ BitVec 64))

(assert (=> b!107939 (= res!88951 (= lt!162106 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!162098)))))

(declare-datatypes ((array!4934 0))(
  ( (array!4935 (arr!2838 (Array (_ BitVec 32) (_ BitVec 8))) (size!2245 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3964 0))(
  ( (BitStream!3965 (buf!2633 array!4934) (currentByte!5163 (_ BitVec 32)) (currentBit!5158 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6608 0))(
  ( (Unit!6609) )
))
(declare-datatypes ((tuple2!8880 0))(
  ( (tuple2!8881 (_1!4697 Unit!6608) (_2!4697 BitStream!3964)) )
))
(declare-fun lt!162084 () tuple2!8880)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107939 (= lt!162106 (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))))))

(declare-fun thiss!1305 () BitStream!3964)

(assert (=> b!107939 (= lt!162098 (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)))))

(declare-fun b!107940 () Bool)

(declare-fun e!70630 () Bool)

(declare-fun e!70636 () Bool)

(assert (=> b!107940 (= e!70630 e!70636)))

(declare-fun res!88956 () Bool)

(assert (=> b!107940 (=> (not res!88956) (not e!70636))))

(declare-fun lt!162096 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107940 (= res!88956 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 thiss!1305))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305)) lt!162096))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!107940 (= lt!162096 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!107941 () Bool)

(declare-fun e!70633 () Bool)

(declare-datatypes ((tuple2!8882 0))(
  ( (tuple2!8883 (_1!4698 BitStream!3964) (_2!4698 Bool)) )
))
(declare-fun lt!162080 () tuple2!8882)

(assert (=> b!107941 (= e!70633 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162080))) (currentByte!5163 (_1!4698 lt!162080)) (currentBit!5158 (_1!4698 lt!162080))) lt!162106))))

(declare-fun b!107942 () Bool)

(declare-fun res!88955 () Bool)

(assert (=> b!107942 (=> (not res!88955) (not e!70636))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107942 (= res!88955 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!107943 () Bool)

(declare-fun e!70635 () Bool)

(declare-fun e!70627 () Bool)

(assert (=> b!107943 (= e!70635 e!70627)))

(declare-fun res!88952 () Bool)

(assert (=> b!107943 (=> res!88952 e!70627)))

(declare-fun lt!162101 () tuple2!8880)

(declare-datatypes ((tuple2!8884 0))(
  ( (tuple2!8885 (_1!4699 BitStream!3964) (_2!4699 BitStream!3964)) )
))
(declare-fun lt!162093 () tuple2!8884)

(declare-fun lt!162094 () BitStream!3964)

(assert (=> b!107943 (= res!88952 (or (not (= (_1!4699 lt!162093) lt!162094)) (not (= (size!2245 (buf!2633 thiss!1305)) (size!2245 (buf!2633 (_2!4697 lt!162101)))))))))

(declare-fun e!70628 () Bool)

(assert (=> b!107943 e!70628))

(declare-fun res!88954 () Bool)

(assert (=> b!107943 (=> (not res!88954) (not e!70628))))

(declare-fun lt!162105 () (_ BitVec 64))

(declare-fun lt!162092 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3964 (_ BitVec 64)) BitStream!3964)

(assert (=> b!107943 (= res!88954 (= (_1!4699 lt!162093) (withMovedBitIndex!0 (_2!4699 lt!162093) (bvsub lt!162105 lt!162092))))))

(assert (=> b!107943 (= lt!162105 (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))))))

(declare-fun lt!162104 () tuple2!8884)

(declare-fun lt!162090 () (_ BitVec 64))

(assert (=> b!107943 (= (_1!4699 lt!162104) (withMovedBitIndex!0 (_2!4699 lt!162104) (bvsub lt!162090 lt!162092)))))

(assert (=> b!107943 (= lt!162092 (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162101))) (currentByte!5163 (_2!4697 lt!162101)) (currentBit!5158 (_2!4697 lt!162101))))))

(assert (=> b!107943 (= lt!162090 (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)))))

(declare-datatypes ((tuple2!8886 0))(
  ( (tuple2!8887 (_1!4700 BitStream!3964) (_2!4700 (_ BitVec 64))) )
))
(declare-fun lt!162081 () tuple2!8886)

(declare-fun lt!162088 () tuple2!8886)

(assert (=> b!107943 (and (= (_2!4700 lt!162081) (_2!4700 lt!162088)) (= (_1!4700 lt!162081) (_1!4700 lt!162088)))))

(declare-fun lt!162089 () (_ BitVec 64))

(declare-fun lt!162097 () Unit!6608)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6608)

(assert (=> b!107943 (= lt!162097 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4699 lt!162104) nBits!396 i!615 lt!162089))))

(declare-fun lt!162091 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8886)

(assert (=> b!107943 (= lt!162088 (readNLeastSignificantBitsLoopPure!0 lt!162094 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162091))))

(assert (=> b!107943 (= lt!162094 (withMovedBitIndex!0 (_1!4699 lt!162104) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!107944 () Bool)

(declare-fun e!70631 () Bool)

(declare-fun array_inv!2047 (array!4934) Bool)

(assert (=> b!107944 (= e!70631 (array_inv!2047 (buf!2633 thiss!1305)))))

(declare-fun b!107945 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!107945 (= e!70627 (invariant!0 (currentBit!5158 (_2!4697 lt!162101)) (currentByte!5163 (_2!4697 lt!162101)) (size!2245 (buf!2633 (_2!4697 lt!162101)))))))

(declare-fun b!107946 () Bool)

(declare-fun e!70629 () Bool)

(declare-fun lt!162102 () tuple2!8882)

(declare-fun lt!162099 () tuple2!8882)

(assert (=> b!107946 (= e!70629 (= (_2!4698 lt!162102) (_2!4698 lt!162099)))))

(declare-fun b!107947 () Bool)

(declare-fun e!70632 () Bool)

(assert (=> b!107947 (= e!70632 (invariant!0 (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162101)))))))

(declare-fun b!107948 () Bool)

(declare-fun res!88960 () Bool)

(assert (=> b!107948 (=> (not res!88960) (not e!70632))))

(assert (=> b!107948 (= res!88960 (invariant!0 (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162084)))))))

(declare-fun b!107949 () Bool)

(declare-fun lt!162085 () tuple2!8886)

(assert (=> b!107949 (= e!70628 (and (= lt!162090 (bvsub lt!162105 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4699 lt!162093) lt!162094)) (and (= (_2!4700 lt!162081) (_2!4700 lt!162085)) (= (_1!4700 lt!162081) (_2!4699 lt!162104))))))))

(declare-fun b!107950 () Bool)

(assert (=> b!107950 (= e!70636 (not e!70635))))

(declare-fun res!88959 () Bool)

(assert (=> b!107950 (=> res!88959 e!70635)))

(assert (=> b!107950 (= res!88959 (not (= (_1!4700 lt!162085) (_2!4699 lt!162093))))))

(assert (=> b!107950 (= lt!162085 (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162093) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162091))))

(declare-fun lt!162107 () (_ BitVec 64))

(assert (=> b!107950 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084))) lt!162107)))

(declare-fun lt!162095 () Unit!6608)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3964 array!4934 (_ BitVec 64)) Unit!6608)

(assert (=> b!107950 (= lt!162095 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4697 lt!162084) (buf!2633 (_2!4697 lt!162101)) lt!162107))))

(assert (=> b!107950 (= lt!162107 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!162083 () tuple2!8882)

(declare-fun lt!162100 () (_ BitVec 64))

(assert (=> b!107950 (= lt!162091 (bvor lt!162089 (ite (_2!4698 lt!162083) lt!162100 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107950 (= lt!162081 (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162104) nBits!396 i!615 lt!162089))))

(assert (=> b!107950 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305)) lt!162096)))

(declare-fun lt!162079 () Unit!6608)

(assert (=> b!107950 (= lt!162079 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2633 (_2!4697 lt!162101)) lt!162096))))

(assert (=> b!107950 (= lt!162089 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!162103 () Bool)

(assert (=> b!107950 (= (_2!4698 lt!162083) lt!162103)))

(declare-fun readBitPure!0 (BitStream!3964) tuple2!8882)

(assert (=> b!107950 (= lt!162083 (readBitPure!0 (_1!4699 lt!162104)))))

(declare-fun reader!0 (BitStream!3964 BitStream!3964) tuple2!8884)

(assert (=> b!107950 (= lt!162093 (reader!0 (_2!4697 lt!162084) (_2!4697 lt!162101)))))

(assert (=> b!107950 (= lt!162104 (reader!0 thiss!1305 (_2!4697 lt!162101)))))

(assert (=> b!107950 e!70629))

(declare-fun res!88953 () Bool)

(assert (=> b!107950 (=> (not res!88953) (not e!70629))))

(assert (=> b!107950 (= res!88953 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162102))) (currentByte!5163 (_1!4698 lt!162102)) (currentBit!5158 (_1!4698 lt!162102))) (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162099))) (currentByte!5163 (_1!4698 lt!162099)) (currentBit!5158 (_1!4698 lt!162099)))))))

(declare-fun lt!162082 () Unit!6608)

(declare-fun lt!162086 () BitStream!3964)

(declare-fun readBitPrefixLemma!0 (BitStream!3964 BitStream!3964) Unit!6608)

(assert (=> b!107950 (= lt!162082 (readBitPrefixLemma!0 lt!162086 (_2!4697 lt!162101)))))

(assert (=> b!107950 (= lt!162099 (readBitPure!0 (BitStream!3965 (buf!2633 (_2!4697 lt!162101)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305))))))

(assert (=> b!107950 (= lt!162102 (readBitPure!0 lt!162086))))

(assert (=> b!107950 (= lt!162086 (BitStream!3965 (buf!2633 (_2!4697 lt!162084)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)))))

(assert (=> b!107950 e!70632))

(declare-fun res!88963 () Bool)

(assert (=> b!107950 (=> (not res!88963) (not e!70632))))

(declare-fun isPrefixOf!0 (BitStream!3964 BitStream!3964) Bool)

(assert (=> b!107950 (= res!88963 (isPrefixOf!0 thiss!1305 (_2!4697 lt!162101)))))

(declare-fun lt!162087 () Unit!6608)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3964 BitStream!3964 BitStream!3964) Unit!6608)

(assert (=> b!107950 (= lt!162087 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4697 lt!162084) (_2!4697 lt!162101)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3964 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8880)

(assert (=> b!107950 (= lt!162101 (appendNLeastSignificantBitsLoop!0 (_2!4697 lt!162084) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!107950 e!70637))

(declare-fun res!88958 () Bool)

(assert (=> b!107950 (=> (not res!88958) (not e!70637))))

(assert (=> b!107950 (= res!88958 (= (size!2245 (buf!2633 thiss!1305)) (size!2245 (buf!2633 (_2!4697 lt!162084)))))))

(declare-fun appendBit!0 (BitStream!3964 Bool) tuple2!8880)

(assert (=> b!107950 (= lt!162084 (appendBit!0 thiss!1305 lt!162103))))

(assert (=> b!107950 (= lt!162103 (not (= (bvand v!199 lt!162100) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107950 (= lt!162100 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!107951 () Bool)

(declare-fun res!88961 () Bool)

(assert (=> b!107951 (=> (not res!88961) (not e!70636))))

(assert (=> b!107951 (= res!88961 (bvslt i!615 nBits!396))))

(declare-fun b!107952 () Bool)

(assert (=> b!107952 (= e!70634 e!70633)))

(declare-fun res!88950 () Bool)

(assert (=> b!107952 (=> (not res!88950) (not e!70633))))

(assert (=> b!107952 (= res!88950 (and (= (_2!4698 lt!162080) lt!162103) (= (_1!4698 lt!162080) (_2!4697 lt!162084))))))

(declare-fun readerFrom!0 (BitStream!3964 (_ BitVec 32) (_ BitVec 32)) BitStream!3964)

(assert (=> b!107952 (= lt!162080 (readBitPure!0 (readerFrom!0 (_2!4697 lt!162084) (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305))))))

(declare-fun res!88957 () Bool)

(assert (=> start!21466 (=> (not res!88957) (not e!70630))))

(assert (=> start!21466 (= res!88957 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21466 e!70630))

(assert (=> start!21466 true))

(declare-fun inv!12 (BitStream!3964) Bool)

(assert (=> start!21466 (and (inv!12 thiss!1305) e!70631)))

(declare-fun b!107953 () Bool)

(declare-fun res!88962 () Bool)

(assert (=> b!107953 (=> (not res!88962) (not e!70634))))

(assert (=> b!107953 (= res!88962 (isPrefixOf!0 thiss!1305 (_2!4697 lt!162084)))))

(assert (= (and start!21466 res!88957) b!107940))

(assert (= (and b!107940 res!88956) b!107942))

(assert (= (and b!107942 res!88955) b!107951))

(assert (= (and b!107951 res!88961) b!107950))

(assert (= (and b!107950 res!88958) b!107939))

(assert (= (and b!107939 res!88951) b!107953))

(assert (= (and b!107953 res!88962) b!107952))

(assert (= (and b!107952 res!88950) b!107941))

(assert (= (and b!107950 res!88963) b!107948))

(assert (= (and b!107948 res!88960) b!107947))

(assert (= (and b!107950 res!88953) b!107946))

(assert (= (and b!107950 (not res!88959)) b!107943))

(assert (= (and b!107943 res!88954) b!107949))

(assert (= (and b!107943 (not res!88952)) b!107945))

(assert (= start!21466 b!107944))

(declare-fun m!159695 () Bool)

(assert (=> b!107943 m!159695))

(declare-fun m!159697 () Bool)

(assert (=> b!107943 m!159697))

(declare-fun m!159699 () Bool)

(assert (=> b!107943 m!159699))

(declare-fun m!159701 () Bool)

(assert (=> b!107943 m!159701))

(declare-fun m!159703 () Bool)

(assert (=> b!107943 m!159703))

(declare-fun m!159705 () Bool)

(assert (=> b!107943 m!159705))

(declare-fun m!159707 () Bool)

(assert (=> b!107943 m!159707))

(declare-fun m!159709 () Bool)

(assert (=> b!107943 m!159709))

(declare-fun m!159711 () Bool)

(assert (=> b!107944 m!159711))

(declare-fun m!159713 () Bool)

(assert (=> b!107950 m!159713))

(declare-fun m!159715 () Bool)

(assert (=> b!107950 m!159715))

(declare-fun m!159717 () Bool)

(assert (=> b!107950 m!159717))

(declare-fun m!159719 () Bool)

(assert (=> b!107950 m!159719))

(declare-fun m!159721 () Bool)

(assert (=> b!107950 m!159721))

(declare-fun m!159723 () Bool)

(assert (=> b!107950 m!159723))

(declare-fun m!159725 () Bool)

(assert (=> b!107950 m!159725))

(declare-fun m!159727 () Bool)

(assert (=> b!107950 m!159727))

(declare-fun m!159729 () Bool)

(assert (=> b!107950 m!159729))

(declare-fun m!159731 () Bool)

(assert (=> b!107950 m!159731))

(declare-fun m!159733 () Bool)

(assert (=> b!107950 m!159733))

(declare-fun m!159735 () Bool)

(assert (=> b!107950 m!159735))

(declare-fun m!159737 () Bool)

(assert (=> b!107950 m!159737))

(declare-fun m!159739 () Bool)

(assert (=> b!107950 m!159739))

(declare-fun m!159741 () Bool)

(assert (=> b!107950 m!159741))

(declare-fun m!159743 () Bool)

(assert (=> b!107950 m!159743))

(declare-fun m!159745 () Bool)

(assert (=> b!107950 m!159745))

(declare-fun m!159747 () Bool)

(assert (=> b!107950 m!159747))

(declare-fun m!159749 () Bool)

(assert (=> b!107950 m!159749))

(declare-fun m!159751 () Bool)

(assert (=> b!107940 m!159751))

(declare-fun m!159753 () Bool)

(assert (=> start!21466 m!159753))

(declare-fun m!159755 () Bool)

(assert (=> b!107948 m!159755))

(declare-fun m!159757 () Bool)

(assert (=> b!107952 m!159757))

(assert (=> b!107952 m!159757))

(declare-fun m!159759 () Bool)

(assert (=> b!107952 m!159759))

(declare-fun m!159761 () Bool)

(assert (=> b!107941 m!159761))

(assert (=> b!107939 m!159705))

(assert (=> b!107939 m!159701))

(declare-fun m!159763 () Bool)

(assert (=> b!107953 m!159763))

(declare-fun m!159765 () Bool)

(assert (=> b!107945 m!159765))

(declare-fun m!159767 () Bool)

(assert (=> b!107947 m!159767))

(declare-fun m!159769 () Bool)

(assert (=> b!107942 m!159769))

(push 1)

(assert (not b!107950))

(assert (not b!107940))

(assert (not b!107945))

(assert (not b!107953))

(assert (not b!107941))

(assert (not start!21466))

(assert (not b!107952))

(assert (not b!107947))

(assert (not b!107939))

(assert (not b!107943))

(assert (not b!107942))

(assert (not b!107944))

(assert (not b!107948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34192 () Bool)

(assert (=> d!34192 (= (invariant!0 (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162101)))) (and (bvsge (currentBit!5158 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5158 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5163 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162101)))) (and (= (currentBit!5158 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162101))))))))))

(assert (=> b!107947 d!34192))

(declare-fun d!34194 () Bool)

(assert (=> d!34194 (= (invariant!0 (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162084)))) (and (bvsge (currentBit!5158 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5158 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5163 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162084)))) (and (= (currentBit!5158 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162084))))))))))

(assert (=> b!107948 d!34194))

(declare-fun d!34196 () Bool)

(declare-fun e!70727 () Bool)

(assert (=> d!34196 e!70727))

(declare-fun res!89080 () Bool)

(assert (=> d!34196 (=> (not res!89080) (not e!70727))))

(declare-fun lt!162329 () (_ BitVec 64))

(declare-fun lt!162333 () (_ BitVec 64))

(declare-fun lt!162331 () (_ BitVec 64))

(assert (=> d!34196 (= res!89080 (= lt!162329 (bvsub lt!162333 lt!162331)))))

(assert (=> d!34196 (or (= (bvand lt!162333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162331 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162333 lt!162331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34196 (= lt!162331 (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162084)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084)))))))

(declare-fun lt!162330 () (_ BitVec 64))

(declare-fun lt!162332 () (_ BitVec 64))

(assert (=> d!34196 (= lt!162333 (bvmul lt!162330 lt!162332))))

(assert (=> d!34196 (or (= lt!162330 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162332 (bvsdiv (bvmul lt!162330 lt!162332) lt!162330)))))

(assert (=> d!34196 (= lt!162332 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34196 (= lt!162330 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162084)))))))

(assert (=> d!34196 (= lt!162329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084)))))))

(assert (=> d!34196 (invariant!0 (currentBit!5158 (_2!4697 lt!162084)) (currentByte!5163 (_2!4697 lt!162084)) (size!2245 (buf!2633 (_2!4697 lt!162084))))))

(assert (=> d!34196 (= (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))) lt!162329)))

(declare-fun b!108076 () Bool)

(declare-fun res!89079 () Bool)

(assert (=> b!108076 (=> (not res!89079) (not e!70727))))

(assert (=> b!108076 (= res!89079 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162329))))

(declare-fun b!108077 () Bool)

(declare-fun lt!162328 () (_ BitVec 64))

(assert (=> b!108077 (= e!70727 (bvsle lt!162329 (bvmul lt!162328 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108077 (or (= lt!162328 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162328 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162328)))))

(assert (=> b!108077 (= lt!162328 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162084)))))))

(assert (= (and d!34196 res!89080) b!108076))

(assert (= (and b!108076 res!89079) b!108077))

(declare-fun m!159951 () Bool)

(assert (=> d!34196 m!159951))

(declare-fun m!159953 () Bool)

(assert (=> d!34196 m!159953))

(assert (=> b!107939 d!34196))

(declare-fun d!34200 () Bool)

(declare-fun e!70728 () Bool)

(assert (=> d!34200 e!70728))

(declare-fun res!89082 () Bool)

(assert (=> d!34200 (=> (not res!89082) (not e!70728))))

(declare-fun lt!162337 () (_ BitVec 64))

(declare-fun lt!162339 () (_ BitVec 64))

(declare-fun lt!162335 () (_ BitVec 64))

(assert (=> d!34200 (= res!89082 (= lt!162335 (bvsub lt!162339 lt!162337)))))

(assert (=> d!34200 (or (= (bvand lt!162339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162339 lt!162337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34200 (= lt!162337 (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 thiss!1305))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305))))))

(declare-fun lt!162336 () (_ BitVec 64))

(declare-fun lt!162338 () (_ BitVec 64))

(assert (=> d!34200 (= lt!162339 (bvmul lt!162336 lt!162338))))

(assert (=> d!34200 (or (= lt!162336 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162338 (bvsdiv (bvmul lt!162336 lt!162338) lt!162336)))))

(assert (=> d!34200 (= lt!162338 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34200 (= lt!162336 ((_ sign_extend 32) (size!2245 (buf!2633 thiss!1305))))))

(assert (=> d!34200 (= lt!162335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5163 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5158 thiss!1305))))))

(assert (=> d!34200 (invariant!0 (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305) (size!2245 (buf!2633 thiss!1305)))))

(assert (=> d!34200 (= (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)) lt!162335)))

(declare-fun b!108078 () Bool)

(declare-fun res!89081 () Bool)

(assert (=> b!108078 (=> (not res!89081) (not e!70728))))

(assert (=> b!108078 (= res!89081 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162335))))

(declare-fun b!108079 () Bool)

(declare-fun lt!162334 () (_ BitVec 64))

(assert (=> b!108079 (= e!70728 (bvsle lt!162335 (bvmul lt!162334 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108079 (or (= lt!162334 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162334 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162334)))))

(assert (=> b!108079 (= lt!162334 ((_ sign_extend 32) (size!2245 (buf!2633 thiss!1305))))))

(assert (= (and d!34200 res!89082) b!108078))

(assert (= (and b!108078 res!89081) b!108079))

(declare-fun m!159955 () Bool)

(assert (=> d!34200 m!159955))

(declare-fun m!159957 () Bool)

(assert (=> d!34200 m!159957))

(assert (=> b!107939 d!34200))

(declare-fun d!34202 () Bool)

(assert (=> d!34202 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!107950 d!34202))

(declare-fun d!34204 () Bool)

(declare-fun e!70729 () Bool)

(assert (=> d!34204 e!70729))

(declare-fun res!89084 () Bool)

(assert (=> d!34204 (=> (not res!89084) (not e!70729))))

(declare-fun lt!162345 () (_ BitVec 64))

(declare-fun lt!162341 () (_ BitVec 64))

(declare-fun lt!162343 () (_ BitVec 64))

(assert (=> d!34204 (= res!89084 (= lt!162341 (bvsub lt!162345 lt!162343)))))

(assert (=> d!34204 (or (= (bvand lt!162345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162343 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162345 lt!162343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34204 (= lt!162343 (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162099)))) ((_ sign_extend 32) (currentByte!5163 (_1!4698 lt!162099))) ((_ sign_extend 32) (currentBit!5158 (_1!4698 lt!162099)))))))

(declare-fun lt!162342 () (_ BitVec 64))

(declare-fun lt!162344 () (_ BitVec 64))

(assert (=> d!34204 (= lt!162345 (bvmul lt!162342 lt!162344))))

(assert (=> d!34204 (or (= lt!162342 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162344 (bvsdiv (bvmul lt!162342 lt!162344) lt!162342)))))

(assert (=> d!34204 (= lt!162344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34204 (= lt!162342 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162099)))))))

(assert (=> d!34204 (= lt!162341 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5163 (_1!4698 lt!162099))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5158 (_1!4698 lt!162099)))))))

(assert (=> d!34204 (invariant!0 (currentBit!5158 (_1!4698 lt!162099)) (currentByte!5163 (_1!4698 lt!162099)) (size!2245 (buf!2633 (_1!4698 lt!162099))))))

(assert (=> d!34204 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162099))) (currentByte!5163 (_1!4698 lt!162099)) (currentBit!5158 (_1!4698 lt!162099))) lt!162341)))

(declare-fun b!108080 () Bool)

(declare-fun res!89083 () Bool)

(assert (=> b!108080 (=> (not res!89083) (not e!70729))))

(assert (=> b!108080 (= res!89083 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162341))))

(declare-fun b!108081 () Bool)

(declare-fun lt!162340 () (_ BitVec 64))

(assert (=> b!108081 (= e!70729 (bvsle lt!162341 (bvmul lt!162340 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108081 (or (= lt!162340 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162340 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162340)))))

(assert (=> b!108081 (= lt!162340 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162099)))))))

(assert (= (and d!34204 res!89084) b!108080))

(assert (= (and b!108080 res!89083) b!108081))

(declare-fun m!159959 () Bool)

(assert (=> d!34204 m!159959))

(declare-fun m!159961 () Bool)

(assert (=> d!34204 m!159961))

(assert (=> b!107950 d!34204))

(declare-fun d!34206 () Bool)

(declare-fun e!70740 () Bool)

(assert (=> d!34206 e!70740))

(declare-fun res!89097 () Bool)

(assert (=> d!34206 (=> (not res!89097) (not e!70740))))

(declare-fun lt!162425 () tuple2!8884)

(assert (=> d!34206 (= res!89097 (isPrefixOf!0 (_1!4699 lt!162425) (_2!4699 lt!162425)))))

(declare-fun lt!162432 () BitStream!3964)

(assert (=> d!34206 (= lt!162425 (tuple2!8885 lt!162432 (_2!4697 lt!162101)))))

(declare-fun lt!162424 () Unit!6608)

(declare-fun lt!162435 () Unit!6608)

(assert (=> d!34206 (= lt!162424 lt!162435)))

(assert (=> d!34206 (isPrefixOf!0 lt!162432 (_2!4697 lt!162101))))

(assert (=> d!34206 (= lt!162435 (lemmaIsPrefixTransitive!0 lt!162432 (_2!4697 lt!162101) (_2!4697 lt!162101)))))

(declare-fun lt!162433 () Unit!6608)

(declare-fun lt!162426 () Unit!6608)

(assert (=> d!34206 (= lt!162433 lt!162426)))

(assert (=> d!34206 (isPrefixOf!0 lt!162432 (_2!4697 lt!162101))))

(assert (=> d!34206 (= lt!162426 (lemmaIsPrefixTransitive!0 lt!162432 thiss!1305 (_2!4697 lt!162101)))))

(declare-fun lt!162419 () Unit!6608)

(declare-fun e!70739 () Unit!6608)

(assert (=> d!34206 (= lt!162419 e!70739)))

(declare-fun c!6662 () Bool)

(assert (=> d!34206 (= c!6662 (not (= (size!2245 (buf!2633 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!162417 () Unit!6608)

(declare-fun lt!162421 () Unit!6608)

(assert (=> d!34206 (= lt!162417 lt!162421)))

(assert (=> d!34206 (isPrefixOf!0 (_2!4697 lt!162101) (_2!4697 lt!162101))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3964) Unit!6608)

(assert (=> d!34206 (= lt!162421 (lemmaIsPrefixRefl!0 (_2!4697 lt!162101)))))

(declare-fun lt!162418 () Unit!6608)

(declare-fun lt!162431 () Unit!6608)

(assert (=> d!34206 (= lt!162418 lt!162431)))

(assert (=> d!34206 (= lt!162431 (lemmaIsPrefixRefl!0 (_2!4697 lt!162101)))))

(declare-fun lt!162430 () Unit!6608)

(declare-fun lt!162434 () Unit!6608)

(assert (=> d!34206 (= lt!162430 lt!162434)))

(assert (=> d!34206 (isPrefixOf!0 lt!162432 lt!162432)))

(assert (=> d!34206 (= lt!162434 (lemmaIsPrefixRefl!0 lt!162432))))

(declare-fun lt!162428 () Unit!6608)

(declare-fun lt!162422 () Unit!6608)

(assert (=> d!34206 (= lt!162428 lt!162422)))

(assert (=> d!34206 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34206 (= lt!162422 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34206 (= lt!162432 (BitStream!3965 (buf!2633 (_2!4697 lt!162101)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)))))

(assert (=> d!34206 (isPrefixOf!0 thiss!1305 (_2!4697 lt!162101))))

(assert (=> d!34206 (= (reader!0 thiss!1305 (_2!4697 lt!162101)) lt!162425)))

(declare-fun b!108097 () Bool)

(declare-fun res!89098 () Bool)

(assert (=> b!108097 (=> (not res!89098) (not e!70740))))

(assert (=> b!108097 (= res!89098 (isPrefixOf!0 (_2!4699 lt!162425) (_2!4697 lt!162101)))))

(declare-fun lt!162429 () (_ BitVec 64))

(declare-fun lt!162423 () (_ BitVec 64))

(declare-fun b!108098 () Bool)

(assert (=> b!108098 (= e!70740 (= (_1!4699 lt!162425) (withMovedBitIndex!0 (_2!4699 lt!162425) (bvsub lt!162423 lt!162429))))))

(assert (=> b!108098 (or (= (bvand lt!162423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162429 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162423 lt!162429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108098 (= lt!162429 (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162101))) (currentByte!5163 (_2!4697 lt!162101)) (currentBit!5158 (_2!4697 lt!162101))))))

(assert (=> b!108098 (= lt!162423 (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)))))

(declare-fun b!108099 () Bool)

(declare-fun lt!162420 () Unit!6608)

(assert (=> b!108099 (= e!70739 lt!162420)))

(declare-fun lt!162436 () (_ BitVec 64))

(assert (=> b!108099 (= lt!162436 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162427 () (_ BitVec 64))

(assert (=> b!108099 (= lt!162427 (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4934 array!4934 (_ BitVec 64) (_ BitVec 64)) Unit!6608)

(assert (=> b!108099 (= lt!162420 (arrayBitRangesEqSymmetric!0 (buf!2633 thiss!1305) (buf!2633 (_2!4697 lt!162101)) lt!162436 lt!162427))))

(declare-fun arrayBitRangesEq!0 (array!4934 array!4934 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108099 (arrayBitRangesEq!0 (buf!2633 (_2!4697 lt!162101)) (buf!2633 thiss!1305) lt!162436 lt!162427)))

(declare-fun b!108100 () Bool)

(declare-fun res!89096 () Bool)

(assert (=> b!108100 (=> (not res!89096) (not e!70740))))

(assert (=> b!108100 (= res!89096 (isPrefixOf!0 (_1!4699 lt!162425) thiss!1305))))

(declare-fun b!108101 () Bool)

(declare-fun Unit!6622 () Unit!6608)

(assert (=> b!108101 (= e!70739 Unit!6622)))

(assert (= (and d!34206 c!6662) b!108099))

(assert (= (and d!34206 (not c!6662)) b!108101))

(assert (= (and d!34206 res!89097) b!108100))

(assert (= (and b!108100 res!89096) b!108097))

(assert (= (and b!108097 res!89098) b!108098))

(declare-fun m!159993 () Bool)

(assert (=> b!108098 m!159993))

(assert (=> b!108098 m!159709))

(assert (=> b!108098 m!159701))

(declare-fun m!159995 () Bool)

(assert (=> d!34206 m!159995))

(declare-fun m!159997 () Bool)

(assert (=> d!34206 m!159997))

(assert (=> d!34206 m!159745))

(declare-fun m!159999 () Bool)

(assert (=> d!34206 m!159999))

(declare-fun m!160001 () Bool)

(assert (=> d!34206 m!160001))

(declare-fun m!160003 () Bool)

(assert (=> d!34206 m!160003))

(declare-fun m!160005 () Bool)

(assert (=> d!34206 m!160005))

(declare-fun m!160007 () Bool)

(assert (=> d!34206 m!160007))

(declare-fun m!160009 () Bool)

(assert (=> d!34206 m!160009))

(declare-fun m!160011 () Bool)

(assert (=> d!34206 m!160011))

(declare-fun m!160013 () Bool)

(assert (=> d!34206 m!160013))

(declare-fun m!160015 () Bool)

(assert (=> b!108100 m!160015))

(declare-fun m!160017 () Bool)

(assert (=> b!108097 m!160017))

(assert (=> b!108099 m!159701))

(declare-fun m!160019 () Bool)

(assert (=> b!108099 m!160019))

(declare-fun m!160021 () Bool)

(assert (=> b!108099 m!160021))

(assert (=> b!107950 d!34206))

(declare-fun d!34218 () Bool)

(assert (=> d!34218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305)) lt!162096) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305))) lt!162096))))

(declare-fun bs!8340 () Bool)

(assert (= bs!8340 d!34218))

(declare-fun m!160023 () Bool)

(assert (=> bs!8340 m!160023))

(assert (=> b!107950 d!34218))

(declare-fun d!34220 () Bool)

(declare-fun res!89111 () Bool)

(declare-fun e!70748 () Bool)

(assert (=> d!34220 (=> (not res!89111) (not e!70748))))

(assert (=> d!34220 (= res!89111 (= (size!2245 (buf!2633 thiss!1305)) (size!2245 (buf!2633 (_2!4697 lt!162101)))))))

(assert (=> d!34220 (= (isPrefixOf!0 thiss!1305 (_2!4697 lt!162101)) e!70748)))

(declare-fun b!108114 () Bool)

(declare-fun res!89112 () Bool)

(assert (=> b!108114 (=> (not res!89112) (not e!70748))))

(assert (=> b!108114 (= res!89112 (bvsle (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)) (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162101))) (currentByte!5163 (_2!4697 lt!162101)) (currentBit!5158 (_2!4697 lt!162101)))))))

(declare-fun b!108115 () Bool)

(declare-fun e!70749 () Bool)

(assert (=> b!108115 (= e!70748 e!70749)))

(declare-fun res!89113 () Bool)

(assert (=> b!108115 (=> res!89113 e!70749)))

(assert (=> b!108115 (= res!89113 (= (size!2245 (buf!2633 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!108116 () Bool)

(assert (=> b!108116 (= e!70749 (arrayBitRangesEq!0 (buf!2633 thiss!1305) (buf!2633 (_2!4697 lt!162101)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305))))))

(assert (= (and d!34220 res!89111) b!108114))

(assert (= (and b!108114 res!89112) b!108115))

(assert (= (and b!108115 (not res!89113)) b!108116))

(assert (=> b!108114 m!159701))

(assert (=> b!108114 m!159709))

(assert (=> b!108116 m!159701))

(assert (=> b!108116 m!159701))

(declare-fun m!160031 () Bool)

(assert (=> b!108116 m!160031))

(assert (=> b!107950 d!34220))

(declare-fun d!34226 () Bool)

(declare-datatypes ((tuple2!8908 0))(
  ( (tuple2!8909 (_1!4711 Bool) (_2!4711 BitStream!3964)) )
))
(declare-fun lt!162469 () tuple2!8908)

(declare-fun readBit!0 (BitStream!3964) tuple2!8908)

(assert (=> d!34226 (= lt!162469 (readBit!0 lt!162086))))

(assert (=> d!34226 (= (readBitPure!0 lt!162086) (tuple2!8883 (_2!4711 lt!162469) (_1!4711 lt!162469)))))

(declare-fun bs!8342 () Bool)

(assert (= bs!8342 d!34226))

(declare-fun m!160037 () Bool)

(assert (=> bs!8342 m!160037))

(assert (=> b!107950 d!34226))

(declare-fun d!34234 () Bool)

(declare-datatypes ((tuple2!8910 0))(
  ( (tuple2!8911 (_1!4712 (_ BitVec 64)) (_2!4712 BitStream!3964)) )
))
(declare-fun lt!162475 () tuple2!8910)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8910)

(assert (=> d!34234 (= lt!162475 (readNLeastSignificantBitsLoop!0 (_1!4699 lt!162104) nBits!396 i!615 lt!162089))))

(assert (=> d!34234 (= (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162104) nBits!396 i!615 lt!162089) (tuple2!8887 (_2!4712 lt!162475) (_1!4712 lt!162475)))))

(declare-fun bs!8344 () Bool)

(assert (= bs!8344 d!34234))

(declare-fun m!160041 () Bool)

(assert (=> bs!8344 m!160041))

(assert (=> b!107950 d!34234))

(declare-fun d!34240 () Bool)

(declare-fun e!70763 () Bool)

(assert (=> d!34240 e!70763))

(declare-fun res!89133 () Bool)

(assert (=> d!34240 (=> (not res!89133) (not e!70763))))

(declare-fun lt!162487 () tuple2!8882)

(declare-fun lt!162484 () tuple2!8882)

(assert (=> d!34240 (= res!89133 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162487))) (currentByte!5163 (_1!4698 lt!162487)) (currentBit!5158 (_1!4698 lt!162487))) (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162484))) (currentByte!5163 (_1!4698 lt!162484)) (currentBit!5158 (_1!4698 lt!162484)))))))

(declare-fun lt!162486 () BitStream!3964)

(declare-fun lt!162485 () Unit!6608)

(declare-fun choose!50 (BitStream!3964 BitStream!3964 BitStream!3964 tuple2!8882 tuple2!8882 BitStream!3964 Bool tuple2!8882 tuple2!8882 BitStream!3964 Bool) Unit!6608)

(assert (=> d!34240 (= lt!162485 (choose!50 lt!162086 (_2!4697 lt!162101) lt!162486 lt!162487 (tuple2!8883 (_1!4698 lt!162487) (_2!4698 lt!162487)) (_1!4698 lt!162487) (_2!4698 lt!162487) lt!162484 (tuple2!8883 (_1!4698 lt!162484) (_2!4698 lt!162484)) (_1!4698 lt!162484) (_2!4698 lt!162484)))))

(assert (=> d!34240 (= lt!162484 (readBitPure!0 lt!162486))))

(assert (=> d!34240 (= lt!162487 (readBitPure!0 lt!162086))))

(assert (=> d!34240 (= lt!162486 (BitStream!3965 (buf!2633 (_2!4697 lt!162101)) (currentByte!5163 lt!162086) (currentBit!5158 lt!162086)))))

(assert (=> d!34240 (invariant!0 (currentBit!5158 lt!162086) (currentByte!5163 lt!162086) (size!2245 (buf!2633 (_2!4697 lt!162101))))))

(assert (=> d!34240 (= (readBitPrefixLemma!0 lt!162086 (_2!4697 lt!162101)) lt!162485)))

(declare-fun b!108135 () Bool)

(assert (=> b!108135 (= e!70763 (= (_2!4698 lt!162487) (_2!4698 lt!162484)))))

(assert (= (and d!34240 res!89133) b!108135))

(declare-fun m!160045 () Bool)

(assert (=> d!34240 m!160045))

(declare-fun m!160047 () Bool)

(assert (=> d!34240 m!160047))

(declare-fun m!160049 () Bool)

(assert (=> d!34240 m!160049))

(declare-fun m!160051 () Bool)

(assert (=> d!34240 m!160051))

(declare-fun m!160053 () Bool)

(assert (=> d!34240 m!160053))

(assert (=> d!34240 m!159715))

(assert (=> b!107950 d!34240))

(declare-fun d!34256 () Bool)

(declare-fun lt!162488 () tuple2!8908)

(assert (=> d!34256 (= lt!162488 (readBit!0 (BitStream!3965 (buf!2633 (_2!4697 lt!162101)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305))))))

(assert (=> d!34256 (= (readBitPure!0 (BitStream!3965 (buf!2633 (_2!4697 lt!162101)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305))) (tuple2!8883 (_2!4711 lt!162488) (_1!4711 lt!162488)))))

(declare-fun bs!8346 () Bool)

(assert (= bs!8346 d!34256))

(declare-fun m!160055 () Bool)

(assert (=> bs!8346 m!160055))

(assert (=> b!107950 d!34256))

(declare-fun d!34258 () Bool)

(declare-fun lt!162489 () tuple2!8908)

(assert (=> d!34258 (= lt!162489 (readBit!0 (_1!4699 lt!162104)))))

(assert (=> d!34258 (= (readBitPure!0 (_1!4699 lt!162104)) (tuple2!8883 (_2!4711 lt!162489) (_1!4711 lt!162489)))))

(declare-fun bs!8347 () Bool)

(assert (= bs!8347 d!34258))

(declare-fun m!160057 () Bool)

(assert (=> bs!8347 m!160057))

(assert (=> b!107950 d!34258))

(declare-fun b!108260 () Bool)

(declare-fun res!89230 () Bool)

(declare-fun call!1374 () Bool)

(assert (=> b!108260 (= res!89230 call!1374)))

(declare-fun e!70835 () Bool)

(assert (=> b!108260 (=> (not res!89230) (not e!70835))))

(declare-fun b!108261 () Bool)

(declare-fun res!89231 () Bool)

(declare-fun lt!162984 () tuple2!8880)

(assert (=> b!108261 (= res!89231 (= (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162984))) (currentByte!5163 (_2!4697 lt!162984)) (currentBit!5158 (_2!4697 lt!162984))) (bvadd (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!108261 (=> (not res!89231) (not e!70835))))

(declare-fun b!108262 () Bool)

(declare-fun e!70837 () (_ BitVec 64))

(assert (=> b!108262 (= e!70837 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!108263 () Bool)

(assert (=> b!108263 (= e!70837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!108264 () Bool)

(declare-fun e!70832 () tuple2!8880)

(declare-fun lt!162988 () Unit!6608)

(assert (=> b!108264 (= e!70832 (tuple2!8881 lt!162988 (_2!4697 lt!162084)))))

(declare-fun lt!162976 () BitStream!3964)

(assert (=> b!108264 (= lt!162976 (_2!4697 lt!162084))))

(assert (=> b!108264 (= lt!162988 (lemmaIsPrefixRefl!0 lt!162976))))

(assert (=> b!108264 call!1374))

(declare-fun b!108265 () Bool)

(declare-fun lt!162948 () tuple2!8880)

(declare-fun Unit!6623 () Unit!6608)

(assert (=> b!108265 (= e!70832 (tuple2!8881 Unit!6623 (_2!4697 lt!162948)))))

(declare-fun lt!162964 () Bool)

(assert (=> b!108265 (= lt!162964 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108265 (= lt!162984 (appendBit!0 (_2!4697 lt!162084) lt!162964))))

(declare-fun res!89229 () Bool)

(assert (=> b!108265 (= res!89229 (= (size!2245 (buf!2633 (_2!4697 lt!162084))) (size!2245 (buf!2633 (_2!4697 lt!162984)))))))

(assert (=> b!108265 (=> (not res!89229) (not e!70835))))

(assert (=> b!108265 e!70835))

(declare-fun lt!162983 () tuple2!8880)

(assert (=> b!108265 (= lt!162983 lt!162984)))

(assert (=> b!108265 (= lt!162948 (appendNLeastSignificantBitsLoop!0 (_2!4697 lt!162983) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!162977 () Unit!6608)

(assert (=> b!108265 (= lt!162977 (lemmaIsPrefixTransitive!0 (_2!4697 lt!162084) (_2!4697 lt!162983) (_2!4697 lt!162948)))))

(assert (=> b!108265 (isPrefixOf!0 (_2!4697 lt!162084) (_2!4697 lt!162948))))

(declare-fun lt!162956 () Unit!6608)

(assert (=> b!108265 (= lt!162956 lt!162977)))

(assert (=> b!108265 (invariant!0 (currentBit!5158 (_2!4697 lt!162084)) (currentByte!5163 (_2!4697 lt!162084)) (size!2245 (buf!2633 (_2!4697 lt!162983))))))

(declare-fun lt!162965 () BitStream!3964)

(assert (=> b!108265 (= lt!162965 (BitStream!3965 (buf!2633 (_2!4697 lt!162983)) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))))))

(assert (=> b!108265 (invariant!0 (currentBit!5158 lt!162965) (currentByte!5163 lt!162965) (size!2245 (buf!2633 (_2!4697 lt!162948))))))

(declare-fun lt!162975 () BitStream!3964)

(assert (=> b!108265 (= lt!162975 (BitStream!3965 (buf!2633 (_2!4697 lt!162948)) (currentByte!5163 lt!162965) (currentBit!5158 lt!162965)))))

(declare-fun lt!162971 () tuple2!8882)

(assert (=> b!108265 (= lt!162971 (readBitPure!0 lt!162965))))

(declare-fun lt!162978 () tuple2!8882)

(assert (=> b!108265 (= lt!162978 (readBitPure!0 lt!162975))))

(declare-fun lt!162981 () Unit!6608)

(assert (=> b!108265 (= lt!162981 (readBitPrefixLemma!0 lt!162965 (_2!4697 lt!162948)))))

(declare-fun res!89233 () Bool)

(assert (=> b!108265 (= res!89233 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162971))) (currentByte!5163 (_1!4698 lt!162971)) (currentBit!5158 (_1!4698 lt!162971))) (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162978))) (currentByte!5163 (_1!4698 lt!162978)) (currentBit!5158 (_1!4698 lt!162978)))))))

(declare-fun e!70831 () Bool)

(assert (=> b!108265 (=> (not res!89233) (not e!70831))))

(assert (=> b!108265 e!70831))

(declare-fun lt!162966 () Unit!6608)

(assert (=> b!108265 (= lt!162966 lt!162981)))

(declare-fun lt!162958 () tuple2!8884)

(assert (=> b!108265 (= lt!162958 (reader!0 (_2!4697 lt!162084) (_2!4697 lt!162948)))))

(declare-fun lt!162973 () tuple2!8884)

(assert (=> b!108265 (= lt!162973 (reader!0 (_2!4697 lt!162983) (_2!4697 lt!162948)))))

(declare-fun lt!162980 () tuple2!8882)

(assert (=> b!108265 (= lt!162980 (readBitPure!0 (_1!4699 lt!162958)))))

(assert (=> b!108265 (= (_2!4698 lt!162980) lt!162964)))

(declare-fun lt!162967 () Unit!6608)

(declare-fun Unit!6624 () Unit!6608)

(assert (=> b!108265 (= lt!162967 Unit!6624)))

(declare-fun lt!162962 () (_ BitVec 64))

(assert (=> b!108265 (= lt!162962 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!162959 () (_ BitVec 64))

(assert (=> b!108265 (= lt!162959 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!162950 () Unit!6608)

(assert (=> b!108265 (= lt!162950 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4697 lt!162084) (buf!2633 (_2!4697 lt!162948)) lt!162959))))

(assert (=> b!108265 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162948)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084))) lt!162959)))

(declare-fun lt!162970 () Unit!6608)

(assert (=> b!108265 (= lt!162970 lt!162950)))

(declare-fun lt!162952 () tuple2!8886)

(assert (=> b!108265 (= lt!162952 (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162958) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162962))))

(declare-fun lt!162969 () (_ BitVec 64))

(assert (=> b!108265 (= lt!162969 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!162979 () Unit!6608)

(assert (=> b!108265 (= lt!162979 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4697 lt!162983) (buf!2633 (_2!4697 lt!162948)) lt!162969))))

(assert (=> b!108265 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162948)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162983))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162983))) lt!162969)))

(declare-fun lt!162989 () Unit!6608)

(assert (=> b!108265 (= lt!162989 lt!162979)))

(declare-fun lt!162949 () tuple2!8886)

(assert (=> b!108265 (= lt!162949 (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162973) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!162962 (ite (_2!4698 lt!162980) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!162987 () tuple2!8886)

(assert (=> b!108265 (= lt!162987 (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162958) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162962))))

(declare-fun c!6681 () Bool)

(assert (=> b!108265 (= c!6681 (_2!4698 (readBitPure!0 (_1!4699 lt!162958))))))

(declare-fun lt!162945 () tuple2!8886)

(assert (=> b!108265 (= lt!162945 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4699 lt!162958) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!162962 e!70837)))))

(declare-fun lt!162957 () Unit!6608)

(assert (=> b!108265 (= lt!162957 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4699 lt!162958) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162962))))

(assert (=> b!108265 (and (= (_2!4700 lt!162987) (_2!4700 lt!162945)) (= (_1!4700 lt!162987) (_1!4700 lt!162945)))))

(declare-fun lt!162960 () Unit!6608)

(assert (=> b!108265 (= lt!162960 lt!162957)))

(assert (=> b!108265 (= (_1!4699 lt!162958) (withMovedBitIndex!0 (_2!4699 lt!162958) (bvsub (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))) (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162948))) (currentByte!5163 (_2!4697 lt!162948)) (currentBit!5158 (_2!4697 lt!162948))))))))

(declare-fun lt!162954 () Unit!6608)

(declare-fun Unit!6625 () Unit!6608)

(assert (=> b!108265 (= lt!162954 Unit!6625)))

(assert (=> b!108265 (= (_1!4699 lt!162973) (withMovedBitIndex!0 (_2!4699 lt!162973) (bvsub (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162983))) (currentByte!5163 (_2!4697 lt!162983)) (currentBit!5158 (_2!4697 lt!162983))) (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162948))) (currentByte!5163 (_2!4697 lt!162948)) (currentBit!5158 (_2!4697 lt!162948))))))))

(declare-fun lt!162955 () Unit!6608)

(declare-fun Unit!6626 () Unit!6608)

(assert (=> b!108265 (= lt!162955 Unit!6626)))

(assert (=> b!108265 (= (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))) (bvsub (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162983))) (currentByte!5163 (_2!4697 lt!162983)) (currentBit!5158 (_2!4697 lt!162983))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!162946 () Unit!6608)

(declare-fun Unit!6627 () Unit!6608)

(assert (=> b!108265 (= lt!162946 Unit!6627)))

(assert (=> b!108265 (= (_2!4700 lt!162952) (_2!4700 lt!162949))))

(declare-fun lt!162968 () Unit!6608)

(declare-fun Unit!6628 () Unit!6608)

(assert (=> b!108265 (= lt!162968 Unit!6628)))

(assert (=> b!108265 (= (_1!4700 lt!162952) (_2!4699 lt!162958))))

(declare-fun b!108266 () Bool)

(declare-fun lt!162972 () tuple2!8882)

(assert (=> b!108266 (= lt!162972 (readBitPure!0 (readerFrom!0 (_2!4697 lt!162984) (currentBit!5158 (_2!4697 lt!162084)) (currentByte!5163 (_2!4697 lt!162084)))))))

(declare-fun res!89225 () Bool)

(assert (=> b!108266 (= res!89225 (and (= (_2!4698 lt!162972) lt!162964) (= (_1!4698 lt!162972) (_2!4697 lt!162984))))))

(declare-fun e!70833 () Bool)

(assert (=> b!108266 (=> (not res!89225) (not e!70833))))

(assert (=> b!108266 (= e!70835 e!70833)))

(declare-fun b!108267 () Bool)

(assert (=> b!108267 (= e!70831 (= (_2!4698 lt!162971) (_2!4698 lt!162978)))))

(declare-fun lt!162974 () tuple2!8884)

(declare-fun lt!162947 () tuple2!8886)

(declare-fun b!108268 () Bool)

(declare-fun e!70834 () Bool)

(assert (=> b!108268 (= e!70834 (and (= (_2!4700 lt!162947) v!199) (= (_1!4700 lt!162947) (_2!4699 lt!162974))))))

(declare-fun lt!162961 () (_ BitVec 64))

(assert (=> b!108268 (= lt!162947 (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162974) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162961))))

(declare-fun lt!162982 () Unit!6608)

(declare-fun lt!162951 () Unit!6608)

(assert (=> b!108268 (= lt!162982 lt!162951)))

(declare-fun lt!162953 () tuple2!8880)

(declare-fun lt!162985 () (_ BitVec 64))

(assert (=> b!108268 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162953)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084))) lt!162985)))

(assert (=> b!108268 (= lt!162951 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4697 lt!162084) (buf!2633 (_2!4697 lt!162953)) lt!162985))))

(declare-fun e!70836 () Bool)

(assert (=> b!108268 e!70836))

(declare-fun res!89232 () Bool)

(assert (=> b!108268 (=> (not res!89232) (not e!70836))))

(assert (=> b!108268 (= res!89232 (and (= (size!2245 (buf!2633 (_2!4697 lt!162084))) (size!2245 (buf!2633 (_2!4697 lt!162953)))) (bvsge lt!162985 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108268 (= lt!162985 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!108268 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108268 (= lt!162961 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!108268 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108268 (= lt!162974 (reader!0 (_2!4697 lt!162084) (_2!4697 lt!162953)))))

(declare-fun d!34260 () Bool)

(assert (=> d!34260 e!70834))

(declare-fun res!89227 () Bool)

(assert (=> d!34260 (=> (not res!89227) (not e!70834))))

(assert (=> d!34260 (= res!89227 (= (size!2245 (buf!2633 (_2!4697 lt!162084))) (size!2245 (buf!2633 (_2!4697 lt!162953)))))))

(assert (=> d!34260 (= lt!162953 e!70832)))

(declare-fun c!6680 () Bool)

(assert (=> d!34260 (= c!6680 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34260 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34260 (= (appendNLeastSignificantBitsLoop!0 (_2!4697 lt!162084) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!162953)))

(declare-fun b!108269 () Bool)

(declare-fun res!89228 () Bool)

(assert (=> b!108269 (=> (not res!89228) (not e!70834))))

(declare-fun lt!162963 () (_ BitVec 64))

(declare-fun lt!162986 () (_ BitVec 64))

(assert (=> b!108269 (= res!89228 (= (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162953))) (currentByte!5163 (_2!4697 lt!162953)) (currentBit!5158 (_2!4697 lt!162953))) (bvadd lt!162986 lt!162963)))))

(assert (=> b!108269 (or (not (= (bvand lt!162986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162963 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162986 lt!162963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108269 (= lt!162963 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!108269 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108269 (= lt!162986 (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))))))

(declare-fun bm!1371 () Bool)

(assert (=> bm!1371 (= call!1374 (isPrefixOf!0 (ite c!6680 (_2!4697 lt!162084) lt!162976) (ite c!6680 (_2!4697 lt!162984) lt!162976)))))

(declare-fun b!108270 () Bool)

(assert (=> b!108270 (= e!70836 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162084)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084))) lt!162985))))

(declare-fun b!108271 () Bool)

(assert (=> b!108271 (= e!70833 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162972))) (currentByte!5163 (_1!4698 lt!162972)) (currentBit!5158 (_1!4698 lt!162972))) (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162984))) (currentByte!5163 (_2!4697 lt!162984)) (currentBit!5158 (_2!4697 lt!162984)))))))

(declare-fun b!108272 () Bool)

(declare-fun res!89226 () Bool)

(assert (=> b!108272 (=> (not res!89226) (not e!70834))))

(assert (=> b!108272 (= res!89226 (isPrefixOf!0 (_2!4697 lt!162084) (_2!4697 lt!162953)))))

(assert (= (and d!34260 c!6680) b!108265))

(assert (= (and d!34260 (not c!6680)) b!108264))

(assert (= (and b!108265 res!89229) b!108261))

(assert (= (and b!108261 res!89231) b!108260))

(assert (= (and b!108260 res!89230) b!108266))

(assert (= (and b!108266 res!89225) b!108271))

(assert (= (and b!108265 res!89233) b!108267))

(assert (= (and b!108265 c!6681) b!108262))

(assert (= (and b!108265 (not c!6681)) b!108263))

(assert (= (or b!108260 b!108264) bm!1371))

(assert (= (and d!34260 res!89227) b!108269))

(assert (= (and b!108269 res!89228) b!108272))

(assert (= (and b!108272 res!89226) b!108268))

(assert (= (and b!108268 res!89232) b!108270))

(declare-fun m!160309 () Bool)

(assert (=> b!108269 m!160309))

(assert (=> b!108269 m!159705))

(declare-fun m!160311 () Bool)

(assert (=> b!108272 m!160311))

(declare-fun m!160313 () Bool)

(assert (=> b!108271 m!160313))

(declare-fun m!160315 () Bool)

(assert (=> b!108271 m!160315))

(declare-fun m!160317 () Bool)

(assert (=> b!108270 m!160317))

(declare-fun m!160319 () Bool)

(assert (=> b!108265 m!160319))

(declare-fun m!160321 () Bool)

(assert (=> b!108265 m!160321))

(declare-fun m!160323 () Bool)

(assert (=> b!108265 m!160323))

(declare-fun m!160325 () Bool)

(assert (=> b!108265 m!160325))

(declare-fun m!160327 () Bool)

(assert (=> b!108265 m!160327))

(declare-fun m!160329 () Bool)

(assert (=> b!108265 m!160329))

(declare-fun m!160331 () Bool)

(assert (=> b!108265 m!160331))

(declare-fun m!160333 () Bool)

(assert (=> b!108265 m!160333))

(declare-fun m!160335 () Bool)

(assert (=> b!108265 m!160335))

(declare-fun m!160337 () Bool)

(assert (=> b!108265 m!160337))

(declare-fun m!160339 () Bool)

(assert (=> b!108265 m!160339))

(declare-fun m!160341 () Bool)

(assert (=> b!108265 m!160341))

(declare-fun m!160343 () Bool)

(assert (=> b!108265 m!160343))

(declare-fun m!160345 () Bool)

(assert (=> b!108265 m!160345))

(declare-fun m!160347 () Bool)

(assert (=> b!108265 m!160347))

(declare-fun m!160349 () Bool)

(assert (=> b!108265 m!160349))

(assert (=> b!108265 m!160347))

(declare-fun m!160351 () Bool)

(assert (=> b!108265 m!160351))

(declare-fun m!160353 () Bool)

(assert (=> b!108265 m!160353))

(declare-fun m!160355 () Bool)

(assert (=> b!108265 m!160355))

(assert (=> b!108265 m!159705))

(declare-fun m!160357 () Bool)

(assert (=> b!108265 m!160357))

(declare-fun m!160359 () Bool)

(assert (=> b!108265 m!160359))

(declare-fun m!160361 () Bool)

(assert (=> b!108265 m!160361))

(declare-fun m!160363 () Bool)

(assert (=> b!108265 m!160363))

(declare-fun m!160365 () Bool)

(assert (=> b!108265 m!160365))

(declare-fun m!160367 () Bool)

(assert (=> b!108265 m!160367))

(declare-fun m!160369 () Bool)

(assert (=> b!108265 m!160369))

(declare-fun m!160371 () Bool)

(assert (=> b!108265 m!160371))

(declare-fun m!160373 () Bool)

(assert (=> b!108265 m!160373))

(declare-fun m!160375 () Bool)

(assert (=> b!108268 m!160375))

(declare-fun m!160377 () Bool)

(assert (=> b!108268 m!160377))

(declare-fun m!160379 () Bool)

(assert (=> b!108268 m!160379))

(assert (=> b!108268 m!160355))

(declare-fun m!160381 () Bool)

(assert (=> b!108268 m!160381))

(declare-fun m!160383 () Bool)

(assert (=> bm!1371 m!160383))

(declare-fun m!160385 () Bool)

(assert (=> b!108264 m!160385))

(declare-fun m!160387 () Bool)

(assert (=> b!108266 m!160387))

(assert (=> b!108266 m!160387))

(declare-fun m!160389 () Bool)

(assert (=> b!108266 m!160389))

(assert (=> b!108261 m!160315))

(assert (=> b!108261 m!159705))

(assert (=> b!107950 d!34260))

(declare-fun d!34324 () Bool)

(assert (=> d!34324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084))) lt!162107) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084)))) lt!162107))))

(declare-fun bs!8362 () Bool)

(assert (= bs!8362 d!34324))

(declare-fun m!160391 () Bool)

(assert (=> bs!8362 m!160391))

(assert (=> b!107950 d!34324))

(declare-fun d!34326 () Bool)

(declare-fun e!70839 () Bool)

(assert (=> d!34326 e!70839))

(declare-fun res!89235 () Bool)

(assert (=> d!34326 (=> (not res!89235) (not e!70839))))

(declare-fun lt!162998 () tuple2!8884)

(assert (=> d!34326 (= res!89235 (isPrefixOf!0 (_1!4699 lt!162998) (_2!4699 lt!162998)))))

(declare-fun lt!163005 () BitStream!3964)

(assert (=> d!34326 (= lt!162998 (tuple2!8885 lt!163005 (_2!4697 lt!162101)))))

(declare-fun lt!162997 () Unit!6608)

(declare-fun lt!163008 () Unit!6608)

(assert (=> d!34326 (= lt!162997 lt!163008)))

(assert (=> d!34326 (isPrefixOf!0 lt!163005 (_2!4697 lt!162101))))

(assert (=> d!34326 (= lt!163008 (lemmaIsPrefixTransitive!0 lt!163005 (_2!4697 lt!162101) (_2!4697 lt!162101)))))

(declare-fun lt!163006 () Unit!6608)

(declare-fun lt!162999 () Unit!6608)

(assert (=> d!34326 (= lt!163006 lt!162999)))

(assert (=> d!34326 (isPrefixOf!0 lt!163005 (_2!4697 lt!162101))))

(assert (=> d!34326 (= lt!162999 (lemmaIsPrefixTransitive!0 lt!163005 (_2!4697 lt!162084) (_2!4697 lt!162101)))))

(declare-fun lt!162992 () Unit!6608)

(declare-fun e!70838 () Unit!6608)

(assert (=> d!34326 (= lt!162992 e!70838)))

(declare-fun c!6682 () Bool)

(assert (=> d!34326 (= c!6682 (not (= (size!2245 (buf!2633 (_2!4697 lt!162084))) #b00000000000000000000000000000000)))))

(declare-fun lt!162990 () Unit!6608)

(declare-fun lt!162994 () Unit!6608)

(assert (=> d!34326 (= lt!162990 lt!162994)))

(assert (=> d!34326 (isPrefixOf!0 (_2!4697 lt!162101) (_2!4697 lt!162101))))

(assert (=> d!34326 (= lt!162994 (lemmaIsPrefixRefl!0 (_2!4697 lt!162101)))))

(declare-fun lt!162991 () Unit!6608)

(declare-fun lt!163004 () Unit!6608)

(assert (=> d!34326 (= lt!162991 lt!163004)))

(assert (=> d!34326 (= lt!163004 (lemmaIsPrefixRefl!0 (_2!4697 lt!162101)))))

(declare-fun lt!163003 () Unit!6608)

(declare-fun lt!163007 () Unit!6608)

(assert (=> d!34326 (= lt!163003 lt!163007)))

(assert (=> d!34326 (isPrefixOf!0 lt!163005 lt!163005)))

(assert (=> d!34326 (= lt!163007 (lemmaIsPrefixRefl!0 lt!163005))))

(declare-fun lt!163001 () Unit!6608)

(declare-fun lt!162995 () Unit!6608)

(assert (=> d!34326 (= lt!163001 lt!162995)))

(assert (=> d!34326 (isPrefixOf!0 (_2!4697 lt!162084) (_2!4697 lt!162084))))

(assert (=> d!34326 (= lt!162995 (lemmaIsPrefixRefl!0 (_2!4697 lt!162084)))))

(assert (=> d!34326 (= lt!163005 (BitStream!3965 (buf!2633 (_2!4697 lt!162101)) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))))))

(assert (=> d!34326 (isPrefixOf!0 (_2!4697 lt!162084) (_2!4697 lt!162101))))

(assert (=> d!34326 (= (reader!0 (_2!4697 lt!162084) (_2!4697 lt!162101)) lt!162998)))

(declare-fun b!108273 () Bool)

(declare-fun res!89236 () Bool)

(assert (=> b!108273 (=> (not res!89236) (not e!70839))))

(assert (=> b!108273 (= res!89236 (isPrefixOf!0 (_2!4699 lt!162998) (_2!4697 lt!162101)))))

(declare-fun b!108274 () Bool)

(declare-fun lt!162996 () (_ BitVec 64))

(declare-fun lt!163002 () (_ BitVec 64))

(assert (=> b!108274 (= e!70839 (= (_1!4699 lt!162998) (withMovedBitIndex!0 (_2!4699 lt!162998) (bvsub lt!162996 lt!163002))))))

(assert (=> b!108274 (or (= (bvand lt!162996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!163002 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162996 lt!163002) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108274 (= lt!163002 (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162101))) (currentByte!5163 (_2!4697 lt!162101)) (currentBit!5158 (_2!4697 lt!162101))))))

(assert (=> b!108274 (= lt!162996 (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))))))

(declare-fun b!108275 () Bool)

(declare-fun lt!162993 () Unit!6608)

(assert (=> b!108275 (= e!70838 lt!162993)))

(declare-fun lt!163009 () (_ BitVec 64))

(assert (=> b!108275 (= lt!163009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163000 () (_ BitVec 64))

(assert (=> b!108275 (= lt!163000 (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084))))))

(assert (=> b!108275 (= lt!162993 (arrayBitRangesEqSymmetric!0 (buf!2633 (_2!4697 lt!162084)) (buf!2633 (_2!4697 lt!162101)) lt!163009 lt!163000))))

(assert (=> b!108275 (arrayBitRangesEq!0 (buf!2633 (_2!4697 lt!162101)) (buf!2633 (_2!4697 lt!162084)) lt!163009 lt!163000)))

(declare-fun b!108276 () Bool)

(declare-fun res!89234 () Bool)

(assert (=> b!108276 (=> (not res!89234) (not e!70839))))

(assert (=> b!108276 (= res!89234 (isPrefixOf!0 (_1!4699 lt!162998) (_2!4697 lt!162084)))))

(declare-fun b!108277 () Bool)

(declare-fun Unit!6629 () Unit!6608)

(assert (=> b!108277 (= e!70838 Unit!6629)))

(assert (= (and d!34326 c!6682) b!108275))

(assert (= (and d!34326 (not c!6682)) b!108277))

(assert (= (and d!34326 res!89235) b!108276))

(assert (= (and b!108276 res!89234) b!108273))

(assert (= (and b!108273 res!89236) b!108274))

(declare-fun m!160393 () Bool)

(assert (=> b!108274 m!160393))

(assert (=> b!108274 m!159709))

(assert (=> b!108274 m!159705))

(declare-fun m!160395 () Bool)

(assert (=> d!34326 m!160395))

(declare-fun m!160397 () Bool)

(assert (=> d!34326 m!160397))

(declare-fun m!160399 () Bool)

(assert (=> d!34326 m!160399))

(assert (=> d!34326 m!159999))

(declare-fun m!160401 () Bool)

(assert (=> d!34326 m!160401))

(declare-fun m!160403 () Bool)

(assert (=> d!34326 m!160403))

(assert (=> d!34326 m!160005))

(declare-fun m!160405 () Bool)

(assert (=> d!34326 m!160405))

(declare-fun m!160407 () Bool)

(assert (=> d!34326 m!160407))

(declare-fun m!160409 () Bool)

(assert (=> d!34326 m!160409))

(declare-fun m!160411 () Bool)

(assert (=> d!34326 m!160411))

(declare-fun m!160413 () Bool)

(assert (=> b!108276 m!160413))

(declare-fun m!160415 () Bool)

(assert (=> b!108273 m!160415))

(assert (=> b!108275 m!159705))

(declare-fun m!160417 () Bool)

(assert (=> b!108275 m!160417))

(declare-fun m!160419 () Bool)

(assert (=> b!108275 m!160419))

(assert (=> b!107950 d!34326))

(declare-fun d!34328 () Bool)

(assert (=> d!34328 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305)) lt!162096)))

(declare-fun lt!163012 () Unit!6608)

(declare-fun choose!9 (BitStream!3964 array!4934 (_ BitVec 64) BitStream!3964) Unit!6608)

(assert (=> d!34328 (= lt!163012 (choose!9 thiss!1305 (buf!2633 (_2!4697 lt!162101)) lt!162096 (BitStream!3965 (buf!2633 (_2!4697 lt!162101)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305))))))

(assert (=> d!34328 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2633 (_2!4697 lt!162101)) lt!162096) lt!163012)))

(declare-fun bs!8363 () Bool)

(assert (= bs!8363 d!34328))

(assert (=> bs!8363 m!159741))

(declare-fun m!160421 () Bool)

(assert (=> bs!8363 m!160421))

(assert (=> b!107950 d!34328))

(declare-fun lt!163013 () tuple2!8910)

(declare-fun d!34330 () Bool)

(assert (=> d!34330 (= lt!163013 (readNLeastSignificantBitsLoop!0 (_1!4699 lt!162093) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162091))))

(assert (=> d!34330 (= (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162093) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162091) (tuple2!8887 (_2!4712 lt!163013) (_1!4712 lt!163013)))))

(declare-fun bs!8364 () Bool)

(assert (= bs!8364 d!34330))

(declare-fun m!160423 () Bool)

(assert (=> bs!8364 m!160423))

(assert (=> b!107950 d!34330))

(declare-fun d!34332 () Bool)

(assert (=> d!34332 (isPrefixOf!0 thiss!1305 (_2!4697 lt!162101))))

(declare-fun lt!163016 () Unit!6608)

(declare-fun choose!30 (BitStream!3964 BitStream!3964 BitStream!3964) Unit!6608)

(assert (=> d!34332 (= lt!163016 (choose!30 thiss!1305 (_2!4697 lt!162084) (_2!4697 lt!162101)))))

(assert (=> d!34332 (isPrefixOf!0 thiss!1305 (_2!4697 lt!162084))))

(assert (=> d!34332 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4697 lt!162084) (_2!4697 lt!162101)) lt!163016)))

(declare-fun bs!8365 () Bool)

(assert (= bs!8365 d!34332))

(assert (=> bs!8365 m!159745))

(declare-fun m!160425 () Bool)

(assert (=> bs!8365 m!160425))

(assert (=> bs!8365 m!159763))

(assert (=> b!107950 d!34332))

(declare-fun d!34334 () Bool)

(assert (=> d!34334 (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162084))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162084))) lt!162107)))

(declare-fun lt!163017 () Unit!6608)

(assert (=> d!34334 (= lt!163017 (choose!9 (_2!4697 lt!162084) (buf!2633 (_2!4697 lt!162101)) lt!162107 (BitStream!3965 (buf!2633 (_2!4697 lt!162101)) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084)))))))

(assert (=> d!34334 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4697 lt!162084) (buf!2633 (_2!4697 lt!162101)) lt!162107) lt!163017)))

(declare-fun bs!8366 () Bool)

(assert (= bs!8366 d!34334))

(assert (=> bs!8366 m!159729))

(declare-fun m!160427 () Bool)

(assert (=> bs!8366 m!160427))

(assert (=> b!107950 d!34334))

(declare-fun b!108289 () Bool)

(declare-fun e!70845 () Bool)

(declare-fun e!70844 () Bool)

(assert (=> b!108289 (= e!70845 e!70844)))

(declare-fun res!89247 () Bool)

(assert (=> b!108289 (=> (not res!89247) (not e!70844))))

(declare-fun lt!163026 () tuple2!8882)

(declare-fun lt!163028 () tuple2!8880)

(assert (=> b!108289 (= res!89247 (and (= (_2!4698 lt!163026) lt!162103) (= (_1!4698 lt!163026) (_2!4697 lt!163028))))))

(assert (=> b!108289 (= lt!163026 (readBitPure!0 (readerFrom!0 (_2!4697 lt!163028) (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305))))))

(declare-fun b!108290 () Bool)

(assert (=> b!108290 (= e!70844 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!163026))) (currentByte!5163 (_1!4698 lt!163026)) (currentBit!5158 (_1!4698 lt!163026))) (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!163028))) (currentByte!5163 (_2!4697 lt!163028)) (currentBit!5158 (_2!4697 lt!163028)))))))

(declare-fun b!108288 () Bool)

(declare-fun res!89246 () Bool)

(assert (=> b!108288 (=> (not res!89246) (not e!70845))))

(assert (=> b!108288 (= res!89246 (isPrefixOf!0 thiss!1305 (_2!4697 lt!163028)))))

(declare-fun b!108287 () Bool)

(declare-fun res!89245 () Bool)

(assert (=> b!108287 (=> (not res!89245) (not e!70845))))

(declare-fun lt!163029 () (_ BitVec 64))

(declare-fun lt!163027 () (_ BitVec 64))

(assert (=> b!108287 (= res!89245 (= (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!163028))) (currentByte!5163 (_2!4697 lt!163028)) (currentBit!5158 (_2!4697 lt!163028))) (bvadd lt!163029 lt!163027)))))

(assert (=> b!108287 (or (not (= (bvand lt!163029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!163027 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!163029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!163029 lt!163027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108287 (= lt!163027 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!108287 (= lt!163029 (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)))))

(declare-fun d!34336 () Bool)

(assert (=> d!34336 e!70845))

(declare-fun res!89248 () Bool)

(assert (=> d!34336 (=> (not res!89248) (not e!70845))))

(assert (=> d!34336 (= res!89248 (= (size!2245 (buf!2633 thiss!1305)) (size!2245 (buf!2633 (_2!4697 lt!163028)))))))

(declare-fun choose!16 (BitStream!3964 Bool) tuple2!8880)

(assert (=> d!34336 (= lt!163028 (choose!16 thiss!1305 lt!162103))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34336 (validate_offset_bit!0 ((_ sign_extend 32) (size!2245 (buf!2633 thiss!1305))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305)))))

(assert (=> d!34336 (= (appendBit!0 thiss!1305 lt!162103) lt!163028)))

(assert (= (and d!34336 res!89248) b!108287))

(assert (= (and b!108287 res!89245) b!108288))

(assert (= (and b!108288 res!89246) b!108289))

(assert (= (and b!108289 res!89247) b!108290))

(declare-fun m!160429 () Bool)

(assert (=> b!108290 m!160429))

(declare-fun m!160431 () Bool)

(assert (=> b!108290 m!160431))

(assert (=> b!108287 m!160431))

(assert (=> b!108287 m!159701))

(declare-fun m!160433 () Bool)

(assert (=> b!108289 m!160433))

(assert (=> b!108289 m!160433))

(declare-fun m!160435 () Bool)

(assert (=> b!108289 m!160435))

(declare-fun m!160437 () Bool)

(assert (=> b!108288 m!160437))

(declare-fun m!160439 () Bool)

(assert (=> d!34336 m!160439))

(declare-fun m!160441 () Bool)

(assert (=> d!34336 m!160441))

(assert (=> b!107950 d!34336))

(declare-fun d!34338 () Bool)

(declare-fun e!70846 () Bool)

(assert (=> d!34338 e!70846))

(declare-fun res!89250 () Bool)

(assert (=> d!34338 (=> (not res!89250) (not e!70846))))

(declare-fun lt!163031 () (_ BitVec 64))

(declare-fun lt!163033 () (_ BitVec 64))

(declare-fun lt!163035 () (_ BitVec 64))

(assert (=> d!34338 (= res!89250 (= lt!163031 (bvsub lt!163035 lt!163033)))))

(assert (=> d!34338 (or (= (bvand lt!163035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!163033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!163035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!163035 lt!163033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34338 (= lt!163033 (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162102)))) ((_ sign_extend 32) (currentByte!5163 (_1!4698 lt!162102))) ((_ sign_extend 32) (currentBit!5158 (_1!4698 lt!162102)))))))

(declare-fun lt!163032 () (_ BitVec 64))

(declare-fun lt!163034 () (_ BitVec 64))

(assert (=> d!34338 (= lt!163035 (bvmul lt!163032 lt!163034))))

(assert (=> d!34338 (or (= lt!163032 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!163034 (bvsdiv (bvmul lt!163032 lt!163034) lt!163032)))))

(assert (=> d!34338 (= lt!163034 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34338 (= lt!163032 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162102)))))))

(assert (=> d!34338 (= lt!163031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5163 (_1!4698 lt!162102))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5158 (_1!4698 lt!162102)))))))

(assert (=> d!34338 (invariant!0 (currentBit!5158 (_1!4698 lt!162102)) (currentByte!5163 (_1!4698 lt!162102)) (size!2245 (buf!2633 (_1!4698 lt!162102))))))

(assert (=> d!34338 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162102))) (currentByte!5163 (_1!4698 lt!162102)) (currentBit!5158 (_1!4698 lt!162102))) lt!163031)))

(declare-fun b!108291 () Bool)

(declare-fun res!89249 () Bool)

(assert (=> b!108291 (=> (not res!89249) (not e!70846))))

(assert (=> b!108291 (= res!89249 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!163031))))

(declare-fun b!108292 () Bool)

(declare-fun lt!163030 () (_ BitVec 64))

(assert (=> b!108292 (= e!70846 (bvsle lt!163031 (bvmul lt!163030 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108292 (or (= lt!163030 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!163030 #b0000000000000000000000000000000000000000000000000000000000001000) lt!163030)))))

(assert (=> b!108292 (= lt!163030 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162102)))))))

(assert (= (and d!34338 res!89250) b!108291))

(assert (= (and b!108291 res!89249) b!108292))

(declare-fun m!160443 () Bool)

(assert (=> d!34338 m!160443))

(declare-fun m!160445 () Bool)

(assert (=> d!34338 m!160445))

(assert (=> b!107950 d!34338))

(declare-fun d!34340 () Bool)

(assert (=> d!34340 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2245 (buf!2633 thiss!1305))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305)) lt!162096) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 thiss!1305))) ((_ sign_extend 32) (currentByte!5163 thiss!1305)) ((_ sign_extend 32) (currentBit!5158 thiss!1305))) lt!162096))))

(declare-fun bs!8367 () Bool)

(assert (= bs!8367 d!34340))

(assert (=> bs!8367 m!159955))

(assert (=> b!107940 d!34340))

(declare-fun d!34342 () Bool)

(declare-fun e!70847 () Bool)

(assert (=> d!34342 e!70847))

(declare-fun res!89252 () Bool)

(assert (=> d!34342 (=> (not res!89252) (not e!70847))))

(declare-fun lt!163037 () (_ BitVec 64))

(declare-fun lt!163039 () (_ BitVec 64))

(declare-fun lt!163041 () (_ BitVec 64))

(assert (=> d!34342 (= res!89252 (= lt!163037 (bvsub lt!163041 lt!163039)))))

(assert (=> d!34342 (or (= (bvand lt!163041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!163039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!163041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!163041 lt!163039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34342 (= lt!163039 (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162080)))) ((_ sign_extend 32) (currentByte!5163 (_1!4698 lt!162080))) ((_ sign_extend 32) (currentBit!5158 (_1!4698 lt!162080)))))))

(declare-fun lt!163038 () (_ BitVec 64))

(declare-fun lt!163040 () (_ BitVec 64))

(assert (=> d!34342 (= lt!163041 (bvmul lt!163038 lt!163040))))

(assert (=> d!34342 (or (= lt!163038 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!163040 (bvsdiv (bvmul lt!163038 lt!163040) lt!163038)))))

(assert (=> d!34342 (= lt!163040 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34342 (= lt!163038 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162080)))))))

(assert (=> d!34342 (= lt!163037 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5163 (_1!4698 lt!162080))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5158 (_1!4698 lt!162080)))))))

(assert (=> d!34342 (invariant!0 (currentBit!5158 (_1!4698 lt!162080)) (currentByte!5163 (_1!4698 lt!162080)) (size!2245 (buf!2633 (_1!4698 lt!162080))))))

(assert (=> d!34342 (= (bitIndex!0 (size!2245 (buf!2633 (_1!4698 lt!162080))) (currentByte!5163 (_1!4698 lt!162080)) (currentBit!5158 (_1!4698 lt!162080))) lt!163037)))

(declare-fun b!108293 () Bool)

(declare-fun res!89251 () Bool)

(assert (=> b!108293 (=> (not res!89251) (not e!70847))))

(assert (=> b!108293 (= res!89251 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!163037))))

(declare-fun b!108294 () Bool)

(declare-fun lt!163036 () (_ BitVec 64))

(assert (=> b!108294 (= e!70847 (bvsle lt!163037 (bvmul lt!163036 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108294 (or (= lt!163036 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!163036 #b0000000000000000000000000000000000000000000000000000000000001000) lt!163036)))))

(assert (=> b!108294 (= lt!163036 ((_ sign_extend 32) (size!2245 (buf!2633 (_1!4698 lt!162080)))))))

(assert (= (and d!34342 res!89252) b!108293))

(assert (= (and b!108293 res!89251) b!108294))

(declare-fun m!160447 () Bool)

(assert (=> d!34342 m!160447))

(declare-fun m!160449 () Bool)

(assert (=> d!34342 m!160449))

(assert (=> b!107941 d!34342))

(declare-fun d!34344 () Bool)

(declare-fun lt!163042 () tuple2!8908)

(assert (=> d!34344 (= lt!163042 (readBit!0 (readerFrom!0 (_2!4697 lt!162084) (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305))))))

(assert (=> d!34344 (= (readBitPure!0 (readerFrom!0 (_2!4697 lt!162084) (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305))) (tuple2!8883 (_2!4711 lt!163042) (_1!4711 lt!163042)))))

(declare-fun bs!8368 () Bool)

(assert (= bs!8368 d!34344))

(assert (=> bs!8368 m!159757))

(declare-fun m!160451 () Bool)

(assert (=> bs!8368 m!160451))

(assert (=> b!107952 d!34344))

(declare-fun d!34346 () Bool)

(declare-fun e!70850 () Bool)

(assert (=> d!34346 e!70850))

(declare-fun res!89256 () Bool)

(assert (=> d!34346 (=> (not res!89256) (not e!70850))))

(assert (=> d!34346 (= res!89256 (invariant!0 (currentBit!5158 (_2!4697 lt!162084)) (currentByte!5163 (_2!4697 lt!162084)) (size!2245 (buf!2633 (_2!4697 lt!162084)))))))

(assert (=> d!34346 (= (readerFrom!0 (_2!4697 lt!162084) (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305)) (BitStream!3965 (buf!2633 (_2!4697 lt!162084)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)))))

(declare-fun b!108297 () Bool)

(assert (=> b!108297 (= e!70850 (invariant!0 (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305) (size!2245 (buf!2633 (_2!4697 lt!162084)))))))

(assert (= (and d!34346 res!89256) b!108297))

(assert (=> d!34346 m!159953))

(assert (=> b!108297 m!159755))

(assert (=> b!107952 d!34346))

(declare-fun d!34348 () Bool)

(assert (=> d!34348 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!107942 d!34348))

(declare-fun d!34350 () Bool)

(declare-fun res!89257 () Bool)

(declare-fun e!70851 () Bool)

(assert (=> d!34350 (=> (not res!89257) (not e!70851))))

(assert (=> d!34350 (= res!89257 (= (size!2245 (buf!2633 thiss!1305)) (size!2245 (buf!2633 (_2!4697 lt!162084)))))))

(assert (=> d!34350 (= (isPrefixOf!0 thiss!1305 (_2!4697 lt!162084)) e!70851)))

(declare-fun b!108298 () Bool)

(declare-fun res!89258 () Bool)

(assert (=> b!108298 (=> (not res!89258) (not e!70851))))

(assert (=> b!108298 (= res!89258 (bvsle (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305)) (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162084))) (currentByte!5163 (_2!4697 lt!162084)) (currentBit!5158 (_2!4697 lt!162084)))))))

(declare-fun b!108299 () Bool)

(declare-fun e!70852 () Bool)

(assert (=> b!108299 (= e!70851 e!70852)))

(declare-fun res!89259 () Bool)

(assert (=> b!108299 (=> res!89259 e!70852)))

(assert (=> b!108299 (= res!89259 (= (size!2245 (buf!2633 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!108300 () Bool)

(assert (=> b!108300 (= e!70852 (arrayBitRangesEq!0 (buf!2633 thiss!1305) (buf!2633 (_2!4697 lt!162084)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2245 (buf!2633 thiss!1305)) (currentByte!5163 thiss!1305) (currentBit!5158 thiss!1305))))))

(assert (= (and d!34350 res!89257) b!108298))

(assert (= (and b!108298 res!89258) b!108299))

(assert (= (and b!108299 (not res!89259)) b!108300))

(assert (=> b!108298 m!159701))

(assert (=> b!108298 m!159705))

(assert (=> b!108300 m!159701))

(assert (=> b!108300 m!159701))

(declare-fun m!160453 () Bool)

(assert (=> b!108300 m!160453))

(assert (=> b!107953 d!34350))

(declare-fun d!34352 () Bool)

(declare-fun e!70855 () Bool)

(assert (=> d!34352 e!70855))

(declare-fun res!89262 () Bool)

(assert (=> d!34352 (=> (not res!89262) (not e!70855))))

(declare-fun lt!163048 () (_ BitVec 64))

(declare-fun lt!163047 () BitStream!3964)

(assert (=> d!34352 (= res!89262 (= (bvadd lt!163048 (bvsub lt!162090 lt!162092)) (bitIndex!0 (size!2245 (buf!2633 lt!163047)) (currentByte!5163 lt!163047) (currentBit!5158 lt!163047))))))

(assert (=> d!34352 (or (not (= (bvand lt!163048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162090 lt!162092) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!163048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!163048 (bvsub lt!162090 lt!162092)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34352 (= lt!163048 (bitIndex!0 (size!2245 (buf!2633 (_2!4699 lt!162104))) (currentByte!5163 (_2!4699 lt!162104)) (currentBit!5158 (_2!4699 lt!162104))))))

(declare-fun moveBitIndex!0 (BitStream!3964 (_ BitVec 64)) tuple2!8880)

(assert (=> d!34352 (= lt!163047 (_2!4697 (moveBitIndex!0 (_2!4699 lt!162104) (bvsub lt!162090 lt!162092))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3964 (_ BitVec 64)) Bool)

(assert (=> d!34352 (moveBitIndexPrecond!0 (_2!4699 lt!162104) (bvsub lt!162090 lt!162092))))

(assert (=> d!34352 (= (withMovedBitIndex!0 (_2!4699 lt!162104) (bvsub lt!162090 lt!162092)) lt!163047)))

(declare-fun b!108303 () Bool)

(assert (=> b!108303 (= e!70855 (= (size!2245 (buf!2633 (_2!4699 lt!162104))) (size!2245 (buf!2633 lt!163047))))))

(assert (= (and d!34352 res!89262) b!108303))

(declare-fun m!160455 () Bool)

(assert (=> d!34352 m!160455))

(declare-fun m!160457 () Bool)

(assert (=> d!34352 m!160457))

(declare-fun m!160459 () Bool)

(assert (=> d!34352 m!160459))

(declare-fun m!160461 () Bool)

(assert (=> d!34352 m!160461))

(assert (=> b!107943 d!34352))

(declare-fun d!34354 () Bool)

(declare-fun e!70856 () Bool)

(assert (=> d!34354 e!70856))

(declare-fun res!89263 () Bool)

(assert (=> d!34354 (=> (not res!89263) (not e!70856))))

(declare-fun lt!163050 () (_ BitVec 64))

(declare-fun lt!163049 () BitStream!3964)

(assert (=> d!34354 (= res!89263 (= (bvadd lt!163050 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2245 (buf!2633 lt!163049)) (currentByte!5163 lt!163049) (currentBit!5158 lt!163049))))))

(assert (=> d!34354 (or (not (= (bvand lt!163050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!163050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!163050 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34354 (= lt!163050 (bitIndex!0 (size!2245 (buf!2633 (_1!4699 lt!162104))) (currentByte!5163 (_1!4699 lt!162104)) (currentBit!5158 (_1!4699 lt!162104))))))

(assert (=> d!34354 (= lt!163049 (_2!4697 (moveBitIndex!0 (_1!4699 lt!162104) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!34354 (moveBitIndexPrecond!0 (_1!4699 lt!162104) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!34354 (= (withMovedBitIndex!0 (_1!4699 lt!162104) #b0000000000000000000000000000000000000000000000000000000000000001) lt!163049)))

(declare-fun b!108304 () Bool)

(assert (=> b!108304 (= e!70856 (= (size!2245 (buf!2633 (_1!4699 lt!162104))) (size!2245 (buf!2633 lt!163049))))))

(assert (= (and d!34354 res!89263) b!108304))

(declare-fun m!160463 () Bool)

(assert (=> d!34354 m!160463))

(declare-fun m!160465 () Bool)

(assert (=> d!34354 m!160465))

(declare-fun m!160467 () Bool)

(assert (=> d!34354 m!160467))

(declare-fun m!160469 () Bool)

(assert (=> d!34354 m!160469))

(assert (=> b!107943 d!34354))

(declare-fun lt!163051 () tuple2!8910)

(declare-fun d!34356 () Bool)

(assert (=> d!34356 (= lt!163051 (readNLeastSignificantBitsLoop!0 lt!162094 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162091))))

(assert (=> d!34356 (= (readNLeastSignificantBitsLoopPure!0 lt!162094 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162091) (tuple2!8887 (_2!4712 lt!163051) (_1!4712 lt!163051)))))

(declare-fun bs!8369 () Bool)

(assert (= bs!8369 d!34356))

(declare-fun m!160471 () Bool)

(assert (=> bs!8369 m!160471))

(assert (=> b!107943 d!34356))

(declare-fun d!34358 () Bool)

(declare-fun e!70857 () Bool)

(assert (=> d!34358 e!70857))

(declare-fun res!89264 () Bool)

(assert (=> d!34358 (=> (not res!89264) (not e!70857))))

(declare-fun lt!163053 () (_ BitVec 64))

(declare-fun lt!163052 () BitStream!3964)

(assert (=> d!34358 (= res!89264 (= (bvadd lt!163053 (bvsub lt!162105 lt!162092)) (bitIndex!0 (size!2245 (buf!2633 lt!163052)) (currentByte!5163 lt!163052) (currentBit!5158 lt!163052))))))

(assert (=> d!34358 (or (not (= (bvand lt!163053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162105 lt!162092) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!163053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!163053 (bvsub lt!162105 lt!162092)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34358 (= lt!163053 (bitIndex!0 (size!2245 (buf!2633 (_2!4699 lt!162093))) (currentByte!5163 (_2!4699 lt!162093)) (currentBit!5158 (_2!4699 lt!162093))))))

(assert (=> d!34358 (= lt!163052 (_2!4697 (moveBitIndex!0 (_2!4699 lt!162093) (bvsub lt!162105 lt!162092))))))

(assert (=> d!34358 (moveBitIndexPrecond!0 (_2!4699 lt!162093) (bvsub lt!162105 lt!162092))))

(assert (=> d!34358 (= (withMovedBitIndex!0 (_2!4699 lt!162093) (bvsub lt!162105 lt!162092)) lt!163052)))

(declare-fun b!108305 () Bool)

(assert (=> b!108305 (= e!70857 (= (size!2245 (buf!2633 (_2!4699 lt!162093))) (size!2245 (buf!2633 lt!163052))))))

(assert (= (and d!34358 res!89264) b!108305))

(declare-fun m!160473 () Bool)

(assert (=> d!34358 m!160473))

(declare-fun m!160475 () Bool)

(assert (=> d!34358 m!160475))

(declare-fun m!160477 () Bool)

(assert (=> d!34358 m!160477))

(declare-fun m!160479 () Bool)

(assert (=> d!34358 m!160479))

(assert (=> b!107943 d!34358))

(assert (=> b!107943 d!34196))

(declare-fun d!34360 () Bool)

(declare-fun e!70858 () Bool)

(assert (=> d!34360 e!70858))

(declare-fun res!89266 () Bool)

(assert (=> d!34360 (=> (not res!89266) (not e!70858))))

(declare-fun lt!163055 () (_ BitVec 64))

(declare-fun lt!163059 () (_ BitVec 64))

(declare-fun lt!163057 () (_ BitVec 64))

(assert (=> d!34360 (= res!89266 (= lt!163055 (bvsub lt!163059 lt!163057)))))

(assert (=> d!34360 (or (= (bvand lt!163059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!163057 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!163059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!163059 lt!163057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34360 (= lt!163057 (remainingBits!0 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))) ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162101))) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162101)))))))

(declare-fun lt!163056 () (_ BitVec 64))

(declare-fun lt!163058 () (_ BitVec 64))

(assert (=> d!34360 (= lt!163059 (bvmul lt!163056 lt!163058))))

(assert (=> d!34360 (or (= lt!163056 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!163058 (bvsdiv (bvmul lt!163056 lt!163058) lt!163056)))))

(assert (=> d!34360 (= lt!163058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34360 (= lt!163056 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))))))

(assert (=> d!34360 (= lt!163055 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5163 (_2!4697 lt!162101))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5158 (_2!4697 lt!162101)))))))

(assert (=> d!34360 (invariant!0 (currentBit!5158 (_2!4697 lt!162101)) (currentByte!5163 (_2!4697 lt!162101)) (size!2245 (buf!2633 (_2!4697 lt!162101))))))

(assert (=> d!34360 (= (bitIndex!0 (size!2245 (buf!2633 (_2!4697 lt!162101))) (currentByte!5163 (_2!4697 lt!162101)) (currentBit!5158 (_2!4697 lt!162101))) lt!163055)))

(declare-fun b!108306 () Bool)

(declare-fun res!89265 () Bool)

(assert (=> b!108306 (=> (not res!89265) (not e!70858))))

(assert (=> b!108306 (= res!89265 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!163055))))

(declare-fun b!108307 () Bool)

(declare-fun lt!163054 () (_ BitVec 64))

(assert (=> b!108307 (= e!70858 (bvsle lt!163055 (bvmul lt!163054 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108307 (or (= lt!163054 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!163054 #b0000000000000000000000000000000000000000000000000000000000001000) lt!163054)))))

(assert (=> b!108307 (= lt!163054 ((_ sign_extend 32) (size!2245 (buf!2633 (_2!4697 lt!162101)))))))

(assert (= (and d!34360 res!89266) b!108306))

(assert (= (and b!108306 res!89265) b!108307))

(declare-fun m!160481 () Bool)

(assert (=> d!34360 m!160481))

(assert (=> d!34360 m!159765))

(assert (=> b!107943 d!34360))

(declare-fun d!34362 () Bool)

(declare-fun lt!163147 () tuple2!8886)

(declare-fun lt!163149 () tuple2!8886)

(assert (=> d!34362 (and (= (_2!4700 lt!163147) (_2!4700 lt!163149)) (= (_1!4700 lt!163147) (_1!4700 lt!163149)))))

(declare-fun lt!163148 () Unit!6608)

(declare-fun lt!163150 () Bool)

(declare-fun lt!163151 () BitStream!3964)

(declare-fun lt!163146 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!3964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8886 tuple2!8886 BitStream!3964 (_ BitVec 64) Bool BitStream!3964 (_ BitVec 64) tuple2!8886 tuple2!8886 BitStream!3964 (_ BitVec 64)) Unit!6608)

(assert (=> d!34362 (= lt!163148 (choose!45 (_1!4699 lt!162104) nBits!396 i!615 lt!162089 lt!163147 (tuple2!8887 (_1!4700 lt!163147) (_2!4700 lt!163147)) (_1!4700 lt!163147) (_2!4700 lt!163147) lt!163150 lt!163151 lt!163146 lt!163149 (tuple2!8887 (_1!4700 lt!163149) (_2!4700 lt!163149)) (_1!4700 lt!163149) (_2!4700 lt!163149)))))

(assert (=> d!34362 (= lt!163149 (readNLeastSignificantBitsLoopPure!0 lt!163151 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!163146))))

(assert (=> d!34362 (= lt!163146 (bvor lt!162089 (ite lt!163150 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34362 (= lt!163151 (withMovedBitIndex!0 (_1!4699 lt!162104) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!34362 (= lt!163150 (_2!4698 (readBitPure!0 (_1!4699 lt!162104))))))

(assert (=> d!34362 (= lt!163147 (readNLeastSignificantBitsLoopPure!0 (_1!4699 lt!162104) nBits!396 i!615 lt!162089))))

(assert (=> d!34362 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4699 lt!162104) nBits!396 i!615 lt!162089) lt!163148)))

(declare-fun bs!8371 () Bool)

(assert (= bs!8371 d!34362))

(assert (=> bs!8371 m!159707))

(assert (=> bs!8371 m!159723))

(declare-fun m!160483 () Bool)

(assert (=> bs!8371 m!160483))

(declare-fun m!160485 () Bool)

(assert (=> bs!8371 m!160485))

(assert (=> bs!8371 m!159717))

(assert (=> b!107943 d!34362))

(assert (=> b!107943 d!34200))

(declare-fun d!34364 () Bool)

(assert (=> d!34364 (= (array_inv!2047 (buf!2633 thiss!1305)) (bvsge (size!2245 (buf!2633 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!107944 d!34364))

(declare-fun d!34366 () Bool)

(assert (=> d!34366 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5158 thiss!1305) (currentByte!5163 thiss!1305) (size!2245 (buf!2633 thiss!1305))))))

(declare-fun bs!8372 () Bool)

(assert (= bs!8372 d!34366))

(assert (=> bs!8372 m!159957))

(assert (=> start!21466 d!34366))

(declare-fun d!34368 () Bool)

(assert (=> d!34368 (= (invariant!0 (currentBit!5158 (_2!4697 lt!162101)) (currentByte!5163 (_2!4697 lt!162101)) (size!2245 (buf!2633 (_2!4697 lt!162101)))) (and (bvsge (currentBit!5158 (_2!4697 lt!162101)) #b00000000000000000000000000000000) (bvslt (currentBit!5158 (_2!4697 lt!162101)) #b00000000000000000000000000001000) (bvsge (currentByte!5163 (_2!4697 lt!162101)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5163 (_2!4697 lt!162101)) (size!2245 (buf!2633 (_2!4697 lt!162101)))) (and (= (currentBit!5158 (_2!4697 lt!162101)) #b00000000000000000000000000000000) (= (currentByte!5163 (_2!4697 lt!162101)) (size!2245 (buf!2633 (_2!4697 lt!162101))))))))))

(assert (=> b!107945 d!34368))

(push 1)

(assert (not d!34206))

(assert (not d!34326))

(assert (not d!34226))

(assert (not b!108268))

(assert (not b!108276))

(assert (not d!34332))

(assert (not b!108116))

(assert (not d!34338))

(assert (not bm!1371))

(assert (not d!34258))

(assert (not d!34200))

(assert (not d!34344))

(assert (not b!108271))

(assert (not d!34356))

(assert (not b!108274))

(assert (not b!108287))

(assert (not d!34366))

(assert (not d!34234))

(assert (not d!34196))

(assert (not d!34336))

(assert (not b!108265))

(assert (not d!34240))

(assert (not b!108297))

(assert (not d!34340))

(assert (not b!108266))

(assert (not b!108288))

(assert (not d!34342))

(assert (not b!108261))

(assert (not d!34256))

(assert (not b!108290))

(assert (not b!108270))

(assert (not b!108275))

(assert (not b!108097))

(assert (not d!34358))

(assert (not b!108100))

(assert (not b!108098))

(assert (not b!108114))

(assert (not b!108273))

(assert (not d!34328))

(assert (not b!108269))

(assert (not d!34346))

(assert (not b!108298))

(assert (not d!34204))

(assert (not d!34330))

(assert (not b!108099))

(assert (not d!34334))

(assert (not b!108272))

(assert (not d!34354))

(assert (not b!108289))

(assert (not b!108300))

(assert (not d!34352))

(assert (not d!34362))

(assert (not d!34218))

(assert (not b!108264))

(assert (not d!34324))

(assert (not d!34360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

