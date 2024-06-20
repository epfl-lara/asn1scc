; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40220 () Bool)

(assert start!40220)

(declare-fun b!184562 () Bool)

(declare-fun res!153570 () Bool)

(declare-fun e!127858 () Bool)

(assert (=> b!184562 (=> res!153570 e!127858)))

(declare-datatypes ((array!9788 0))(
  ( (array!9789 (arr!5248 (Array (_ BitVec 32) (_ BitVec 8))) (size!4318 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7744 0))(
  ( (BitStream!7745 (buf!4773 array!9788) (currentByte!9007 (_ BitVec 32)) (currentBit!9002 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7744)

(declare-datatypes ((Unit!13211 0))(
  ( (Unit!13212) )
))
(declare-datatypes ((tuple2!15980 0))(
  ( (tuple2!15981 (_1!8635 Unit!13211) (_2!8635 BitStream!7744)) )
))
(declare-fun lt!283832 () tuple2!15980)

(declare-fun isPrefixOf!0 (BitStream!7744 BitStream!7744) Bool)

(assert (=> b!184562 (= res!153570 (not (isPrefixOf!0 thiss!1204 (_2!8635 lt!283832))))))

(declare-fun b!184563 () Bool)

(declare-fun e!127848 () Bool)

(declare-fun e!127853 () Bool)

(assert (=> b!184563 (= e!127848 (not e!127853))))

(declare-fun res!153573 () Bool)

(assert (=> b!184563 (=> res!153573 e!127853)))

(declare-fun lt!283809 () (_ BitVec 64))

(declare-fun lt!283810 () (_ BitVec 64))

(assert (=> b!184563 (= res!153573 (not (= lt!283809 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283810))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184563 (= lt!283809 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))))))

(assert (=> b!184563 (= lt!283810 (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)))))

(declare-fun e!127849 () Bool)

(assert (=> b!184563 e!127849))

(declare-fun res!153575 () Bool)

(assert (=> b!184563 (=> (not res!153575) (not e!127849))))

(assert (=> b!184563 (= res!153575 (= (size!4318 (buf!4773 thiss!1204)) (size!4318 (buf!4773 (_2!8635 lt!283832)))))))

(declare-fun lt!283829 () Bool)

(declare-fun appendBit!0 (BitStream!7744 Bool) tuple2!15980)

(assert (=> b!184563 (= lt!283832 (appendBit!0 thiss!1204 lt!283829))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!283816 () (_ BitVec 64))

(assert (=> b!184563 (= lt!283829 (not (= (bvand v!189 lt!283816) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!184563 (= lt!283816 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184564 () Bool)

(declare-fun e!127855 () Bool)

(declare-fun lt!283821 () tuple2!15980)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184564 (= e!127855 (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283821)))))))

(declare-fun b!184565 () Bool)

(declare-fun e!127847 () Bool)

(assert (=> b!184565 (= e!127847 e!127848)))

(declare-fun res!153563 () Bool)

(assert (=> b!184565 (=> (not res!153563) (not e!127848))))

(declare-fun lt!283833 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184565 (= res!153563 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 thiss!1204))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204)) lt!283833))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!184565 (= lt!283833 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184566 () Bool)

(declare-fun res!153564 () Bool)

(assert (=> b!184566 (=> res!153564 e!127858)))

(assert (=> b!184566 (= res!153564 (not (invariant!0 (currentBit!9002 (_2!8635 lt!283821)) (currentByte!9007 (_2!8635 lt!283821)) (size!4318 (buf!4773 (_2!8635 lt!283821))))))))

(declare-fun b!184567 () Bool)

(declare-fun res!153567 () Bool)

(assert (=> b!184567 (=> res!153567 e!127858)))

(assert (=> b!184567 (= res!153567 (not (isPrefixOf!0 (_2!8635 lt!283832) (_2!8635 lt!283821))))))

(declare-fun b!184568 () Bool)

(declare-fun res!153572 () Bool)

(assert (=> b!184568 (=> res!153572 e!127858)))

(declare-fun lt!283824 () (_ BitVec 64))

(assert (=> b!184568 (= res!153572 (or (not (= (size!4318 (buf!4773 (_2!8635 lt!283821))) (size!4318 (buf!4773 thiss!1204)))) (not (= lt!283824 (bvsub (bvadd lt!283810 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184569 () Bool)

(declare-fun res!153571 () Bool)

(assert (=> b!184569 (=> (not res!153571) (not e!127848))))

(assert (=> b!184569 (= res!153571 (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 thiss!1204))))))

(declare-fun b!184561 () Bool)

(declare-fun e!127854 () Bool)

(declare-fun e!127852 () Bool)

(assert (=> b!184561 (= e!127854 e!127852)))

(declare-fun res!153578 () Bool)

(assert (=> b!184561 (=> (not res!153578) (not e!127852))))

(declare-datatypes ((tuple2!15982 0))(
  ( (tuple2!15983 (_1!8636 BitStream!7744) (_2!8636 Bool)) )
))
(declare-fun lt!283818 () tuple2!15982)

(assert (=> b!184561 (= res!153578 (and (= (_2!8636 lt!283818) lt!283829) (= (_1!8636 lt!283818) (_2!8635 lt!283832))))))

(declare-fun readBitPure!0 (BitStream!7744) tuple2!15982)

(declare-fun readerFrom!0 (BitStream!7744 (_ BitVec 32) (_ BitVec 32)) BitStream!7744)

(assert (=> b!184561 (= lt!283818 (readBitPure!0 (readerFrom!0 (_2!8635 lt!283832) (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204))))))

(declare-fun res!153574 () Bool)

(assert (=> start!40220 (=> (not res!153574) (not e!127847))))

(assert (=> start!40220 (= res!153574 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40220 e!127847))

(assert (=> start!40220 true))

(declare-fun e!127857 () Bool)

(declare-fun inv!12 (BitStream!7744) Bool)

(assert (=> start!40220 (and (inv!12 thiss!1204) e!127857)))

(declare-fun b!184570 () Bool)

(assert (=> b!184570 (= e!127853 e!127858)))

(declare-fun res!153566 () Bool)

(assert (=> b!184570 (=> res!153566 e!127858)))

(assert (=> b!184570 (= res!153566 (not (= lt!283824 (bvsub (bvsub (bvadd lt!283809 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184570 (= lt!283824 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283821))) (currentByte!9007 (_2!8635 lt!283821)) (currentBit!9002 (_2!8635 lt!283821))))))

(assert (=> b!184570 (isPrefixOf!0 thiss!1204 (_2!8635 lt!283821))))

(declare-fun lt!283830 () Unit!13211)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7744 BitStream!7744 BitStream!7744) Unit!13211)

(assert (=> b!184570 (= lt!283830 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8635 lt!283832) (_2!8635 lt!283821)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7744 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15980)

(assert (=> b!184570 (= lt!283821 (appendBitsLSBFirstLoopTR!0 (_2!8635 lt!283832) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184571 () Bool)

(assert (=> b!184571 (= e!127849 e!127854)))

(declare-fun res!153577 () Bool)

(assert (=> b!184571 (=> (not res!153577) (not e!127854))))

(declare-fun lt!283835 () (_ BitVec 64))

(declare-fun lt!283828 () (_ BitVec 64))

(assert (=> b!184571 (= res!153577 (= lt!283835 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283828)))))

(assert (=> b!184571 (= lt!283835 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))))))

(assert (=> b!184571 (= lt!283828 (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)))))

(declare-fun b!184572 () Bool)

(assert (=> b!184572 (= e!127852 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!283818))) (currentByte!9007 (_1!8636 lt!283818)) (currentBit!9002 (_1!8636 lt!283818))) lt!283835))))

(declare-fun b!184573 () Bool)

(declare-fun res!153576 () Bool)

(assert (=> b!184573 (=> (not res!153576) (not e!127848))))

(assert (=> b!184573 (= res!153576 (not (= i!590 nBits!348)))))

(declare-fun b!184574 () Bool)

(declare-fun e!127850 () Bool)

(declare-datatypes ((tuple2!15984 0))(
  ( (tuple2!15985 (_1!8637 BitStream!7744) (_2!8637 BitStream!7744)) )
))
(declare-fun lt!283822 () tuple2!15984)

(declare-fun moveBitIndexPrecond!0 (BitStream!7744 (_ BitVec 64)) Bool)

(assert (=> b!184574 (= e!127850 (moveBitIndexPrecond!0 (_2!8637 lt!283822) (bvsub lt!283810 lt!283824)))))

(declare-datatypes ((tuple2!15986 0))(
  ( (tuple2!15987 (_1!8638 BitStream!7744) (_2!8638 (_ BitVec 64))) )
))
(declare-fun lt!283826 () tuple2!15986)

(declare-fun lt!283831 () tuple2!15986)

(assert (=> b!184574 (and (= (_2!8638 lt!283826) (_2!8638 lt!283831)) (= (_1!8638 lt!283826) (_1!8638 lt!283831)))))

(declare-fun lt!283827 () (_ BitVec 64))

(declare-fun lt!283823 () Unit!13211)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13211)

(assert (=> b!184574 (= lt!283823 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8637 lt!283822) nBits!348 i!590 lt!283827))))

(declare-fun lt!283813 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15986)

(declare-fun withMovedBitIndex!0 (BitStream!7744 (_ BitVec 64)) BitStream!7744)

(assert (=> b!184574 (= lt!283831 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8637 lt!283822) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283813))))

(declare-fun b!184575 () Bool)

(declare-fun e!127851 () Bool)

(declare-fun lt!283834 () tuple2!15982)

(declare-fun lt!283815 () tuple2!15982)

(assert (=> b!184575 (= e!127851 (= (_2!8636 lt!283834) (_2!8636 lt!283815)))))

(declare-fun b!184576 () Bool)

(declare-fun res!153569 () Bool)

(assert (=> b!184576 (=> (not res!153569) (not e!127854))))

(assert (=> b!184576 (= res!153569 (isPrefixOf!0 thiss!1204 (_2!8635 lt!283832)))))

(declare-fun b!184577 () Bool)

(declare-fun array_inv!4059 (array!9788) Bool)

(assert (=> b!184577 (= e!127857 (array_inv!4059 (buf!4773 thiss!1204)))))

(declare-fun b!184578 () Bool)

(assert (=> b!184578 (= e!127858 e!127850)))

(declare-fun res!153565 () Bool)

(assert (=> b!184578 (=> res!153565 e!127850)))

(declare-fun lt!283812 () tuple2!15984)

(assert (=> b!184578 (= res!153565 (not (= (_1!8638 (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!283812) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283813)) (_2!8637 lt!283812))))))

(declare-fun lt!283811 () (_ BitVec 64))

(assert (=> b!184578 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832))) lt!283811)))

(declare-fun lt!283817 () Unit!13211)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7744 array!9788 (_ BitVec 64)) Unit!13211)

(assert (=> b!184578 (= lt!283817 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8635 lt!283832) (buf!4773 (_2!8635 lt!283821)) lt!283811))))

(assert (=> b!184578 (= lt!283811 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283814 () tuple2!15982)

(assert (=> b!184578 (= lt!283813 (bvor lt!283827 (ite (_2!8636 lt!283814) lt!283816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184578 (= lt!283826 (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!283822) nBits!348 i!590 lt!283827))))

(assert (=> b!184578 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204)) lt!283833)))

(declare-fun lt!283825 () Unit!13211)

(assert (=> b!184578 (= lt!283825 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4773 (_2!8635 lt!283821)) lt!283833))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184578 (= lt!283827 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184578 (= (_2!8636 lt!283814) lt!283829)))

(assert (=> b!184578 (= lt!283814 (readBitPure!0 (_1!8637 lt!283822)))))

(declare-fun reader!0 (BitStream!7744 BitStream!7744) tuple2!15984)

(assert (=> b!184578 (= lt!283812 (reader!0 (_2!8635 lt!283832) (_2!8635 lt!283821)))))

(assert (=> b!184578 (= lt!283822 (reader!0 thiss!1204 (_2!8635 lt!283821)))))

(assert (=> b!184578 e!127851))

(declare-fun res!153579 () Bool)

(assert (=> b!184578 (=> (not res!153579) (not e!127851))))

(assert (=> b!184578 (= res!153579 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!283834))) (currentByte!9007 (_1!8636 lt!283834)) (currentBit!9002 (_1!8636 lt!283834))) (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!283815))) (currentByte!9007 (_1!8636 lt!283815)) (currentBit!9002 (_1!8636 lt!283815)))))))

(declare-fun lt!283820 () Unit!13211)

(declare-fun lt!283819 () BitStream!7744)

(declare-fun readBitPrefixLemma!0 (BitStream!7744 BitStream!7744) Unit!13211)

(assert (=> b!184578 (= lt!283820 (readBitPrefixLemma!0 lt!283819 (_2!8635 lt!283821)))))

(assert (=> b!184578 (= lt!283815 (readBitPure!0 (BitStream!7745 (buf!4773 (_2!8635 lt!283821)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204))))))

(assert (=> b!184578 (= lt!283834 (readBitPure!0 lt!283819))))

(assert (=> b!184578 e!127855))

(declare-fun res!153568 () Bool)

(assert (=> b!184578 (=> (not res!153568) (not e!127855))))

(assert (=> b!184578 (= res!153568 (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283832)))))))

(assert (=> b!184578 (= lt!283819 (BitStream!7745 (buf!4773 (_2!8635 lt!283832)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)))))

(assert (= (and start!40220 res!153574) b!184565))

(assert (= (and b!184565 res!153563) b!184569))

(assert (= (and b!184569 res!153571) b!184573))

(assert (= (and b!184573 res!153576) b!184563))

(assert (= (and b!184563 res!153575) b!184571))

(assert (= (and b!184571 res!153577) b!184576))

(assert (= (and b!184576 res!153569) b!184561))

(assert (= (and b!184561 res!153578) b!184572))

(assert (= (and b!184563 (not res!153573)) b!184570))

(assert (= (and b!184570 (not res!153566)) b!184566))

(assert (= (and b!184566 (not res!153564)) b!184568))

(assert (= (and b!184568 (not res!153572)) b!184567))

(assert (= (and b!184567 (not res!153567)) b!184562))

(assert (= (and b!184562 (not res!153570)) b!184578))

(assert (= (and b!184578 res!153568) b!184564))

(assert (= (and b!184578 res!153579) b!184575))

(assert (= (and b!184578 (not res!153565)) b!184574))

(assert (= start!40220 b!184577))

(declare-fun m!286729 () Bool)

(assert (=> b!184571 m!286729))

(declare-fun m!286731 () Bool)

(assert (=> b!184571 m!286731))

(declare-fun m!286733 () Bool)

(assert (=> b!184577 m!286733))

(declare-fun m!286735 () Bool)

(assert (=> b!184564 m!286735))

(declare-fun m!286737 () Bool)

(assert (=> b!184566 m!286737))

(declare-fun m!286739 () Bool)

(assert (=> b!184570 m!286739))

(declare-fun m!286741 () Bool)

(assert (=> b!184570 m!286741))

(declare-fun m!286743 () Bool)

(assert (=> b!184570 m!286743))

(declare-fun m!286745 () Bool)

(assert (=> b!184570 m!286745))

(declare-fun m!286747 () Bool)

(assert (=> b!184565 m!286747))

(declare-fun m!286749 () Bool)

(assert (=> b!184561 m!286749))

(assert (=> b!184561 m!286749))

(declare-fun m!286751 () Bool)

(assert (=> b!184561 m!286751))

(declare-fun m!286753 () Bool)

(assert (=> b!184562 m!286753))

(assert (=> b!184576 m!286753))

(declare-fun m!286755 () Bool)

(assert (=> start!40220 m!286755))

(declare-fun m!286757 () Bool)

(assert (=> b!184567 m!286757))

(declare-fun m!286759 () Bool)

(assert (=> b!184569 m!286759))

(declare-fun m!286761 () Bool)

(assert (=> b!184578 m!286761))

(declare-fun m!286763 () Bool)

(assert (=> b!184578 m!286763))

(declare-fun m!286765 () Bool)

(assert (=> b!184578 m!286765))

(declare-fun m!286767 () Bool)

(assert (=> b!184578 m!286767))

(declare-fun m!286769 () Bool)

(assert (=> b!184578 m!286769))

(declare-fun m!286771 () Bool)

(assert (=> b!184578 m!286771))

(declare-fun m!286773 () Bool)

(assert (=> b!184578 m!286773))

(declare-fun m!286775 () Bool)

(assert (=> b!184578 m!286775))

(declare-fun m!286777 () Bool)

(assert (=> b!184578 m!286777))

(declare-fun m!286779 () Bool)

(assert (=> b!184578 m!286779))

(declare-fun m!286781 () Bool)

(assert (=> b!184578 m!286781))

(declare-fun m!286783 () Bool)

(assert (=> b!184578 m!286783))

(declare-fun m!286785 () Bool)

(assert (=> b!184578 m!286785))

(declare-fun m!286787 () Bool)

(assert (=> b!184578 m!286787))

(declare-fun m!286789 () Bool)

(assert (=> b!184578 m!286789))

(declare-fun m!286791 () Bool)

(assert (=> b!184578 m!286791))

(declare-fun m!286793 () Bool)

(assert (=> b!184574 m!286793))

(declare-fun m!286795 () Bool)

(assert (=> b!184574 m!286795))

(declare-fun m!286797 () Bool)

(assert (=> b!184574 m!286797))

(assert (=> b!184574 m!286797))

(declare-fun m!286799 () Bool)

(assert (=> b!184574 m!286799))

(assert (=> b!184563 m!286729))

(assert (=> b!184563 m!286731))

(declare-fun m!286801 () Bool)

(assert (=> b!184563 m!286801))

(declare-fun m!286803 () Bool)

(assert (=> b!184572 m!286803))

(push 1)

(assert (not b!184565))

(assert (not b!184564))

(assert (not b!184567))

(assert (not start!40220))

(assert (not b!184563))

(assert (not b!184576))

(assert (not b!184566))

(assert (not b!184570))

(assert (not b!184577))

(assert (not b!184561))

(assert (not b!184569))

(assert (not b!184578))

(assert (not b!184572))

(assert (not b!184562))

(assert (not b!184574))

(assert (not b!184571))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63701 () Bool)

(assert (=> d!63701 (= (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283821)))) (and (bvsge (currentBit!9002 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9002 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9007 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283821)))) (and (= (currentBit!9002 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283821))))))))))

(assert (=> b!184564 d!63701))

(declare-fun d!63703 () Bool)

(declare-fun res!153744 () Bool)

(declare-fun e!127970 () Bool)

(assert (=> d!63703 (=> (not res!153744) (not e!127970))))

(assert (=> d!63703 (= res!153744 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8637 lt!283822))))) (bvsub lt!283810 lt!283824)) (bvsle (bvsub lt!283810 lt!283824) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8637 lt!283822))))))))))

(assert (=> d!63703 (= (moveBitIndexPrecond!0 (_2!8637 lt!283822) (bvsub lt!283810 lt!283824)) e!127970)))

(declare-fun b!184758 () Bool)

(declare-fun lt!284163 () (_ BitVec 64))

(assert (=> b!184758 (= e!127970 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284163) (bvsle lt!284163 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8637 lt!283822))))))))))

(assert (=> b!184758 (= lt!284163 (bvadd (bitIndex!0 (size!4318 (buf!4773 (_2!8637 lt!283822))) (currentByte!9007 (_2!8637 lt!283822)) (currentBit!9002 (_2!8637 lt!283822))) (bvsub lt!283810 lt!283824)))))

(assert (= (and d!63703 res!153744) b!184758))

(declare-fun m!287081 () Bool)

(assert (=> b!184758 m!287081))

(assert (=> b!184574 d!63703))

(declare-fun d!63705 () Bool)

(declare-fun lt!284176 () tuple2!15986)

(declare-fun lt!284178 () tuple2!15986)

(assert (=> d!63705 (and (= (_2!8638 lt!284176) (_2!8638 lt!284178)) (= (_1!8638 lt!284176) (_1!8638 lt!284178)))))

(declare-fun lt!284181 () Bool)

(declare-fun lt!284177 () (_ BitVec 64))

(declare-fun lt!284180 () BitStream!7744)

(declare-fun lt!284179 () Unit!13211)

(declare-fun choose!56 (BitStream!7744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!15986 tuple2!15986 BitStream!7744 (_ BitVec 64) Bool BitStream!7744 (_ BitVec 64) tuple2!15986 tuple2!15986 BitStream!7744 (_ BitVec 64)) Unit!13211)

(assert (=> d!63705 (= lt!284179 (choose!56 (_1!8637 lt!283822) nBits!348 i!590 lt!283827 lt!284176 (tuple2!15987 (_1!8638 lt!284176) (_2!8638 lt!284176)) (_1!8638 lt!284176) (_2!8638 lt!284176) lt!284181 lt!284180 lt!284177 lt!284178 (tuple2!15987 (_1!8638 lt!284178) (_2!8638 lt!284178)) (_1!8638 lt!284178) (_2!8638 lt!284178)))))

(assert (=> d!63705 (= lt!284178 (readNBitsLSBFirstsLoopPure!0 lt!284180 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!284177))))

(assert (=> d!63705 (= lt!284177 (bvor lt!283827 (ite lt!284181 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63705 (= lt!284180 (withMovedBitIndex!0 (_1!8637 lt!283822) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!63705 (= lt!284181 (_2!8636 (readBitPure!0 (_1!8637 lt!283822))))))

(assert (=> d!63705 (= lt!284176 (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!283822) nBits!348 i!590 lt!283827))))

(assert (=> d!63705 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8637 lt!283822) nBits!348 i!590 lt!283827) lt!284179)))

(declare-fun bs!15867 () Bool)

(assert (= bs!15867 d!63705))

(assert (=> bs!15867 m!286797))

(declare-fun m!287083 () Bool)

(assert (=> bs!15867 m!287083))

(assert (=> bs!15867 m!286769))

(declare-fun m!287085 () Bool)

(assert (=> bs!15867 m!287085))

(assert (=> bs!15867 m!286767))

(assert (=> b!184574 d!63705))

(declare-fun d!63707 () Bool)

(declare-datatypes ((tuple2!16008 0))(
  ( (tuple2!16009 (_1!8649 (_ BitVec 64)) (_2!8649 BitStream!7744)) )
))
(declare-fun lt!284184 () tuple2!16008)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16008)

(assert (=> d!63707 (= lt!284184 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8637 lt!283822) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283813))))

(assert (=> d!63707 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8637 lt!283822) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283813) (tuple2!15987 (_2!8649 lt!284184) (_1!8649 lt!284184)))))

(declare-fun bs!15868 () Bool)

(assert (= bs!15868 d!63707))

(assert (=> bs!15868 m!286797))

(declare-fun m!287087 () Bool)

(assert (=> bs!15868 m!287087))

(assert (=> b!184574 d!63707))

(declare-fun d!63709 () Bool)

(declare-fun e!127973 () Bool)

(assert (=> d!63709 e!127973))

(declare-fun res!153747 () Bool)

(assert (=> d!63709 (=> (not res!153747) (not e!127973))))

(declare-fun lt!284190 () (_ BitVec 64))

(declare-fun lt!284189 () BitStream!7744)

(assert (=> d!63709 (= res!153747 (= (bvadd lt!284190 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4318 (buf!4773 lt!284189)) (currentByte!9007 lt!284189) (currentBit!9002 lt!284189))))))

(assert (=> d!63709 (or (not (= (bvand lt!284190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!284190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!284190 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63709 (= lt!284190 (bitIndex!0 (size!4318 (buf!4773 (_1!8637 lt!283822))) (currentByte!9007 (_1!8637 lt!283822)) (currentBit!9002 (_1!8637 lt!283822))))))

(declare-fun moveBitIndex!0 (BitStream!7744 (_ BitVec 64)) tuple2!15980)

(assert (=> d!63709 (= lt!284189 (_2!8635 (moveBitIndex!0 (_1!8637 lt!283822) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!63709 (moveBitIndexPrecond!0 (_1!8637 lt!283822) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!63709 (= (withMovedBitIndex!0 (_1!8637 lt!283822) #b0000000000000000000000000000000000000000000000000000000000000001) lt!284189)))

(declare-fun b!184761 () Bool)

(assert (=> b!184761 (= e!127973 (= (size!4318 (buf!4773 (_1!8637 lt!283822))) (size!4318 (buf!4773 lt!284189))))))

(assert (= (and d!63709 res!153747) b!184761))

(declare-fun m!287089 () Bool)

(assert (=> d!63709 m!287089))

(declare-fun m!287091 () Bool)

(assert (=> d!63709 m!287091))

(declare-fun m!287093 () Bool)

(assert (=> d!63709 m!287093))

(declare-fun m!287095 () Bool)

(assert (=> d!63709 m!287095))

(assert (=> b!184574 d!63709))

(declare-fun d!63711 () Bool)

(declare-fun e!127976 () Bool)

(assert (=> d!63711 e!127976))

(declare-fun res!153752 () Bool)

(assert (=> d!63711 (=> (not res!153752) (not e!127976))))

(declare-fun lt!284207 () (_ BitVec 64))

(declare-fun lt!284203 () (_ BitVec 64))

(declare-fun lt!284208 () (_ BitVec 64))

(assert (=> d!63711 (= res!153752 (= lt!284207 (bvsub lt!284203 lt!284208)))))

(assert (=> d!63711 (or (= (bvand lt!284203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284208 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284203 lt!284208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63711 (= lt!284208 (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283832)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832)))))))

(declare-fun lt!284204 () (_ BitVec 64))

(declare-fun lt!284206 () (_ BitVec 64))

(assert (=> d!63711 (= lt!284203 (bvmul lt!284204 lt!284206))))

(assert (=> d!63711 (or (= lt!284204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284206 (bvsdiv (bvmul lt!284204 lt!284206) lt!284204)))))

(assert (=> d!63711 (= lt!284206 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63711 (= lt!284204 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283832)))))))

(assert (=> d!63711 (= lt!284207 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832)))))))

(assert (=> d!63711 (invariant!0 (currentBit!9002 (_2!8635 lt!283832)) (currentByte!9007 (_2!8635 lt!283832)) (size!4318 (buf!4773 (_2!8635 lt!283832))))))

(assert (=> d!63711 (= (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))) lt!284207)))

(declare-fun b!184766 () Bool)

(declare-fun res!153753 () Bool)

(assert (=> b!184766 (=> (not res!153753) (not e!127976))))

(assert (=> b!184766 (= res!153753 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284207))))

(declare-fun b!184767 () Bool)

(declare-fun lt!284205 () (_ BitVec 64))

(assert (=> b!184767 (= e!127976 (bvsle lt!284207 (bvmul lt!284205 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184767 (or (= lt!284205 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284205 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284205)))))

(assert (=> b!184767 (= lt!284205 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283832)))))))

(assert (= (and d!63711 res!153752) b!184766))

(assert (= (and b!184766 res!153753) b!184767))

(declare-fun m!287097 () Bool)

(assert (=> d!63711 m!287097))

(declare-fun m!287099 () Bool)

(assert (=> d!63711 m!287099))

(assert (=> b!184563 d!63711))

(declare-fun d!63713 () Bool)

(declare-fun e!127977 () Bool)

(assert (=> d!63713 e!127977))

(declare-fun res!153754 () Bool)

(assert (=> d!63713 (=> (not res!153754) (not e!127977))))

(declare-fun lt!284213 () (_ BitVec 64))

(declare-fun lt!284214 () (_ BitVec 64))

(declare-fun lt!284209 () (_ BitVec 64))

(assert (=> d!63713 (= res!153754 (= lt!284213 (bvsub lt!284209 lt!284214)))))

(assert (=> d!63713 (or (= (bvand lt!284209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284214 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284209 lt!284214) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63713 (= lt!284214 (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 thiss!1204))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204))))))

(declare-fun lt!284210 () (_ BitVec 64))

(declare-fun lt!284212 () (_ BitVec 64))

(assert (=> d!63713 (= lt!284209 (bvmul lt!284210 lt!284212))))

(assert (=> d!63713 (or (= lt!284210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284212 (bvsdiv (bvmul lt!284210 lt!284212) lt!284210)))))

(assert (=> d!63713 (= lt!284212 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63713 (= lt!284210 ((_ sign_extend 32) (size!4318 (buf!4773 thiss!1204))))))

(assert (=> d!63713 (= lt!284213 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9007 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9002 thiss!1204))))))

(assert (=> d!63713 (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 thiss!1204)))))

(assert (=> d!63713 (= (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)) lt!284213)))

(declare-fun b!184768 () Bool)

(declare-fun res!153755 () Bool)

(assert (=> b!184768 (=> (not res!153755) (not e!127977))))

(assert (=> b!184768 (= res!153755 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284213))))

(declare-fun b!184769 () Bool)

(declare-fun lt!284211 () (_ BitVec 64))

(assert (=> b!184769 (= e!127977 (bvsle lt!284213 (bvmul lt!284211 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184769 (or (= lt!284211 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284211 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284211)))))

(assert (=> b!184769 (= lt!284211 ((_ sign_extend 32) (size!4318 (buf!4773 thiss!1204))))))

(assert (= (and d!63713 res!153754) b!184768))

(assert (= (and b!184768 res!153755) b!184769))

(declare-fun m!287101 () Bool)

(assert (=> d!63713 m!287101))

(assert (=> d!63713 m!286759))

(assert (=> b!184563 d!63713))

(declare-fun b!184782 () Bool)

(declare-fun e!127983 () Bool)

(declare-fun lt!284225 () tuple2!15982)

(declare-fun lt!284226 () tuple2!15980)

(assert (=> b!184782 (= e!127983 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!284225))) (currentByte!9007 (_1!8636 lt!284225)) (currentBit!9002 (_1!8636 lt!284225))) (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284226))) (currentByte!9007 (_2!8635 lt!284226)) (currentBit!9002 (_2!8635 lt!284226)))))))

(declare-fun b!184781 () Bool)

(declare-fun e!127982 () Bool)

(assert (=> b!184781 (= e!127982 e!127983)))

(declare-fun res!153764 () Bool)

(assert (=> b!184781 (=> (not res!153764) (not e!127983))))

(assert (=> b!184781 (= res!153764 (and (= (_2!8636 lt!284225) lt!283829) (= (_1!8636 lt!284225) (_2!8635 lt!284226))))))

(assert (=> b!184781 (= lt!284225 (readBitPure!0 (readerFrom!0 (_2!8635 lt!284226) (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204))))))

(declare-fun d!63715 () Bool)

(assert (=> d!63715 e!127982))

(declare-fun res!153766 () Bool)

(assert (=> d!63715 (=> (not res!153766) (not e!127982))))

(assert (=> d!63715 (= res!153766 (= (size!4318 (buf!4773 thiss!1204)) (size!4318 (buf!4773 (_2!8635 lt!284226)))))))

(declare-fun choose!16 (BitStream!7744 Bool) tuple2!15980)

(assert (=> d!63715 (= lt!284226 (choose!16 thiss!1204 lt!283829))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63715 (validate_offset_bit!0 ((_ sign_extend 32) (size!4318 (buf!4773 thiss!1204))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204)))))

(assert (=> d!63715 (= (appendBit!0 thiss!1204 lt!283829) lt!284226)))

(declare-fun b!184780 () Bool)

(declare-fun res!153767 () Bool)

(assert (=> b!184780 (=> (not res!153767) (not e!127982))))

(assert (=> b!184780 (= res!153767 (isPrefixOf!0 thiss!1204 (_2!8635 lt!284226)))))

(declare-fun b!184779 () Bool)

(declare-fun res!153765 () Bool)

(assert (=> b!184779 (=> (not res!153765) (not e!127982))))

(declare-fun lt!284224 () (_ BitVec 64))

(declare-fun lt!284223 () (_ BitVec 64))

(assert (=> b!184779 (= res!153765 (= (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284226))) (currentByte!9007 (_2!8635 lt!284226)) (currentBit!9002 (_2!8635 lt!284226))) (bvadd lt!284223 lt!284224)))))

(assert (=> b!184779 (or (not (= (bvand lt!284223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284224 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!284223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!284223 lt!284224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184779 (= lt!284224 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!184779 (= lt!284223 (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)))))

(assert (= (and d!63715 res!153766) b!184779))

(assert (= (and b!184779 res!153765) b!184780))

(assert (= (and b!184780 res!153767) b!184781))

(assert (= (and b!184781 res!153764) b!184782))

(declare-fun m!287103 () Bool)

(assert (=> b!184781 m!287103))

(assert (=> b!184781 m!287103))

(declare-fun m!287105 () Bool)

(assert (=> b!184781 m!287105))

(declare-fun m!287107 () Bool)

(assert (=> b!184780 m!287107))

(declare-fun m!287109 () Bool)

(assert (=> b!184782 m!287109))

(declare-fun m!287111 () Bool)

(assert (=> b!184782 m!287111))

(assert (=> b!184779 m!287111))

(assert (=> b!184779 m!286731))

(declare-fun m!287113 () Bool)

(assert (=> d!63715 m!287113))

(declare-fun m!287115 () Bool)

(assert (=> d!63715 m!287115))

(assert (=> b!184563 d!63715))

(declare-fun d!63717 () Bool)

(assert (=> d!63717 (= (array_inv!4059 (buf!4773 thiss!1204)) (bvsge (size!4318 (buf!4773 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!184577 d!63717))

(declare-fun d!63719 () Bool)

(assert (=> d!63719 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832))) lt!283811) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832)))) lt!283811))))

(declare-fun bs!15869 () Bool)

(assert (= bs!15869 d!63719))

(declare-fun m!287117 () Bool)

(assert (=> bs!15869 m!287117))

(assert (=> b!184578 d!63719))

(declare-fun d!63721 () Bool)

(declare-fun lt!284227 () tuple2!16008)

(assert (=> d!63721 (= lt!284227 (readNBitsLSBFirstsLoop!0 (_1!8637 lt!283822) nBits!348 i!590 lt!283827))))

(assert (=> d!63721 (= (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!283822) nBits!348 i!590 lt!283827) (tuple2!15987 (_2!8649 lt!284227) (_1!8649 lt!284227)))))

(declare-fun bs!15870 () Bool)

(assert (= bs!15870 d!63721))

(declare-fun m!287119 () Bool)

(assert (=> bs!15870 m!287119))

(assert (=> b!184578 d!63721))

(declare-fun d!63723 () Bool)

(assert (=> d!63723 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!184578 d!63723))

(declare-fun lt!284228 () tuple2!16008)

(declare-fun d!63725 () Bool)

(assert (=> d!63725 (= lt!284228 (readNBitsLSBFirstsLoop!0 (_1!8637 lt!283812) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283813))))

(assert (=> d!63725 (= (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!283812) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283813) (tuple2!15987 (_2!8649 lt!284228) (_1!8649 lt!284228)))))

(declare-fun bs!15871 () Bool)

(assert (= bs!15871 d!63725))

(declare-fun m!287121 () Bool)

(assert (=> bs!15871 m!287121))

(assert (=> b!184578 d!63725))

(declare-fun d!63727 () Bool)

(declare-datatypes ((tuple2!16010 0))(
  ( (tuple2!16011 (_1!8650 Bool) (_2!8650 BitStream!7744)) )
))
(declare-fun lt!284231 () tuple2!16010)

(declare-fun readBit!0 (BitStream!7744) tuple2!16010)

(assert (=> d!63727 (= lt!284231 (readBit!0 (_1!8637 lt!283822)))))

(assert (=> d!63727 (= (readBitPure!0 (_1!8637 lt!283822)) (tuple2!15983 (_2!8650 lt!284231) (_1!8650 lt!284231)))))

(declare-fun bs!15872 () Bool)

(assert (= bs!15872 d!63727))

(declare-fun m!287123 () Bool)

(assert (=> bs!15872 m!287123))

(assert (=> b!184578 d!63727))

(declare-fun d!63729 () Bool)

(assert (=> d!63729 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204)) lt!283833) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204))) lt!283833))))

(declare-fun bs!15873 () Bool)

(assert (= bs!15873 d!63729))

(declare-fun m!287125 () Bool)

(assert (=> bs!15873 m!287125))

(assert (=> b!184578 d!63729))

(declare-fun d!63731 () Bool)

(declare-fun e!127986 () Bool)

(assert (=> d!63731 e!127986))

(declare-fun res!153770 () Bool)

(assert (=> d!63731 (=> (not res!153770) (not e!127986))))

(declare-fun lt!284243 () tuple2!15982)

(declare-fun lt!284241 () tuple2!15982)

(assert (=> d!63731 (= res!153770 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!284243))) (currentByte!9007 (_1!8636 lt!284243)) (currentBit!9002 (_1!8636 lt!284243))) (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!284241))) (currentByte!9007 (_1!8636 lt!284241)) (currentBit!9002 (_1!8636 lt!284241)))))))

(declare-fun lt!284242 () BitStream!7744)

(declare-fun lt!284240 () Unit!13211)

(declare-fun choose!50 (BitStream!7744 BitStream!7744 BitStream!7744 tuple2!15982 tuple2!15982 BitStream!7744 Bool tuple2!15982 tuple2!15982 BitStream!7744 Bool) Unit!13211)

(assert (=> d!63731 (= lt!284240 (choose!50 lt!283819 (_2!8635 lt!283821) lt!284242 lt!284243 (tuple2!15983 (_1!8636 lt!284243) (_2!8636 lt!284243)) (_1!8636 lt!284243) (_2!8636 lt!284243) lt!284241 (tuple2!15983 (_1!8636 lt!284241) (_2!8636 lt!284241)) (_1!8636 lt!284241) (_2!8636 lt!284241)))))

(assert (=> d!63731 (= lt!284241 (readBitPure!0 lt!284242))))

(assert (=> d!63731 (= lt!284243 (readBitPure!0 lt!283819))))

(assert (=> d!63731 (= lt!284242 (BitStream!7745 (buf!4773 (_2!8635 lt!283821)) (currentByte!9007 lt!283819) (currentBit!9002 lt!283819)))))

(assert (=> d!63731 (invariant!0 (currentBit!9002 lt!283819) (currentByte!9007 lt!283819) (size!4318 (buf!4773 (_2!8635 lt!283821))))))

(assert (=> d!63731 (= (readBitPrefixLemma!0 lt!283819 (_2!8635 lt!283821)) lt!284240)))

(declare-fun b!184785 () Bool)

(assert (=> b!184785 (= e!127986 (= (_2!8636 lt!284243) (_2!8636 lt!284241)))))

(assert (= (and d!63731 res!153770) b!184785))

(declare-fun m!287127 () Bool)

(assert (=> d!63731 m!287127))

(declare-fun m!287129 () Bool)

(assert (=> d!63731 m!287129))

(declare-fun m!287131 () Bool)

(assert (=> d!63731 m!287131))

(declare-fun m!287133 () Bool)

(assert (=> d!63731 m!287133))

(assert (=> d!63731 m!286783))

(declare-fun m!287135 () Bool)

(assert (=> d!63731 m!287135))

(assert (=> b!184578 d!63731))

(declare-fun d!63733 () Bool)

(assert (=> d!63733 (= (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283832)))) (and (bvsge (currentBit!9002 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9002 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9007 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283832)))) (and (= (currentBit!9002 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283832))))))))))

(assert (=> b!184578 d!63733))

(declare-fun d!63735 () Bool)

(declare-fun e!127987 () Bool)

(assert (=> d!63735 e!127987))

(declare-fun res!153771 () Bool)

(assert (=> d!63735 (=> (not res!153771) (not e!127987))))

(declare-fun lt!284248 () (_ BitVec 64))

(declare-fun lt!284249 () (_ BitVec 64))

(declare-fun lt!284244 () (_ BitVec 64))

(assert (=> d!63735 (= res!153771 (= lt!284248 (bvsub lt!284244 lt!284249)))))

(assert (=> d!63735 (or (= (bvand lt!284244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284244 lt!284249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63735 (= lt!284249 (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283834)))) ((_ sign_extend 32) (currentByte!9007 (_1!8636 lt!283834))) ((_ sign_extend 32) (currentBit!9002 (_1!8636 lt!283834)))))))

(declare-fun lt!284245 () (_ BitVec 64))

(declare-fun lt!284247 () (_ BitVec 64))

(assert (=> d!63735 (= lt!284244 (bvmul lt!284245 lt!284247))))

(assert (=> d!63735 (or (= lt!284245 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284247 (bvsdiv (bvmul lt!284245 lt!284247) lt!284245)))))

(assert (=> d!63735 (= lt!284247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63735 (= lt!284245 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283834)))))))

(assert (=> d!63735 (= lt!284248 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9007 (_1!8636 lt!283834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9002 (_1!8636 lt!283834)))))))

(assert (=> d!63735 (invariant!0 (currentBit!9002 (_1!8636 lt!283834)) (currentByte!9007 (_1!8636 lt!283834)) (size!4318 (buf!4773 (_1!8636 lt!283834))))))

(assert (=> d!63735 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!283834))) (currentByte!9007 (_1!8636 lt!283834)) (currentBit!9002 (_1!8636 lt!283834))) lt!284248)))

(declare-fun b!184786 () Bool)

(declare-fun res!153772 () Bool)

(assert (=> b!184786 (=> (not res!153772) (not e!127987))))

(assert (=> b!184786 (= res!153772 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284248))))

(declare-fun b!184787 () Bool)

(declare-fun lt!284246 () (_ BitVec 64))

(assert (=> b!184787 (= e!127987 (bvsle lt!284248 (bvmul lt!284246 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184787 (or (= lt!284246 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284246 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284246)))))

(assert (=> b!184787 (= lt!284246 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283834)))))))

(assert (= (and d!63735 res!153771) b!184786))

(assert (= (and b!184786 res!153772) b!184787))

(declare-fun m!287137 () Bool)

(assert (=> d!63735 m!287137))

(declare-fun m!287139 () Bool)

(assert (=> d!63735 m!287139))

(assert (=> b!184578 d!63735))

(declare-fun d!63737 () Bool)

(declare-fun lt!284250 () tuple2!16010)

(assert (=> d!63737 (= lt!284250 (readBit!0 lt!283819))))

(assert (=> d!63737 (= (readBitPure!0 lt!283819) (tuple2!15983 (_2!8650 lt!284250) (_1!8650 lt!284250)))))

(declare-fun bs!15874 () Bool)

(assert (= bs!15874 d!63737))

(declare-fun m!287141 () Bool)

(assert (=> bs!15874 m!287141))

(assert (=> b!184578 d!63737))

(declare-fun d!63739 () Bool)

(declare-fun e!127988 () Bool)

(assert (=> d!63739 e!127988))

(declare-fun res!153773 () Bool)

(assert (=> d!63739 (=> (not res!153773) (not e!127988))))

(declare-fun lt!284255 () (_ BitVec 64))

(declare-fun lt!284251 () (_ BitVec 64))

(declare-fun lt!284256 () (_ BitVec 64))

(assert (=> d!63739 (= res!153773 (= lt!284255 (bvsub lt!284251 lt!284256)))))

(assert (=> d!63739 (or (= (bvand lt!284251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284251 lt!284256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63739 (= lt!284256 (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283815)))) ((_ sign_extend 32) (currentByte!9007 (_1!8636 lt!283815))) ((_ sign_extend 32) (currentBit!9002 (_1!8636 lt!283815)))))))

(declare-fun lt!284252 () (_ BitVec 64))

(declare-fun lt!284254 () (_ BitVec 64))

(assert (=> d!63739 (= lt!284251 (bvmul lt!284252 lt!284254))))

(assert (=> d!63739 (or (= lt!284252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284254 (bvsdiv (bvmul lt!284252 lt!284254) lt!284252)))))

(assert (=> d!63739 (= lt!284254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63739 (= lt!284252 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283815)))))))

(assert (=> d!63739 (= lt!284255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9007 (_1!8636 lt!283815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9002 (_1!8636 lt!283815)))))))

(assert (=> d!63739 (invariant!0 (currentBit!9002 (_1!8636 lt!283815)) (currentByte!9007 (_1!8636 lt!283815)) (size!4318 (buf!4773 (_1!8636 lt!283815))))))

(assert (=> d!63739 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!283815))) (currentByte!9007 (_1!8636 lt!283815)) (currentBit!9002 (_1!8636 lt!283815))) lt!284255)))

(declare-fun b!184788 () Bool)

(declare-fun res!153774 () Bool)

(assert (=> b!184788 (=> (not res!153774) (not e!127988))))

(assert (=> b!184788 (= res!153774 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284255))))

(declare-fun b!184789 () Bool)

(declare-fun lt!284253 () (_ BitVec 64))

(assert (=> b!184789 (= e!127988 (bvsle lt!284255 (bvmul lt!284253 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184789 (or (= lt!284253 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284253 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284253)))))

(assert (=> b!184789 (= lt!284253 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283815)))))))

(assert (= (and d!63739 res!153773) b!184788))

(assert (= (and b!184788 res!153774) b!184789))

(declare-fun m!287143 () Bool)

(assert (=> d!63739 m!287143))

(declare-fun m!287145 () Bool)

(assert (=> d!63739 m!287145))

(assert (=> b!184578 d!63739))

(declare-fun d!63741 () Bool)

(declare-fun lt!284257 () tuple2!16010)

(assert (=> d!63741 (= lt!284257 (readBit!0 (BitStream!7745 (buf!4773 (_2!8635 lt!283821)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204))))))

(assert (=> d!63741 (= (readBitPure!0 (BitStream!7745 (buf!4773 (_2!8635 lt!283821)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204))) (tuple2!15983 (_2!8650 lt!284257) (_1!8650 lt!284257)))))

(declare-fun bs!15875 () Bool)

(assert (= bs!15875 d!63741))

(declare-fun m!287147 () Bool)

(assert (=> bs!15875 m!287147))

(assert (=> b!184578 d!63741))

(declare-fun lt!284300 () (_ BitVec 64))

(declare-fun b!184801 () Bool)

(declare-fun e!127993 () Bool)

(declare-fun lt!284298 () (_ BitVec 64))

(declare-fun lt!284302 () tuple2!15984)

(assert (=> b!184801 (= e!127993 (= (_1!8637 lt!284302) (withMovedBitIndex!0 (_2!8637 lt!284302) (bvsub lt!284298 lt!284300))))))

(assert (=> b!184801 (or (= (bvand lt!284298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284298 lt!284300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184801 (= lt!284300 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283821))) (currentByte!9007 (_2!8635 lt!283821)) (currentBit!9002 (_2!8635 lt!283821))))))

(assert (=> b!184801 (= lt!284298 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))))))

(declare-fun b!184802 () Bool)

(declare-fun res!153782 () Bool)

(assert (=> b!184802 (=> (not res!153782) (not e!127993))))

(assert (=> b!184802 (= res!153782 (isPrefixOf!0 (_1!8637 lt!284302) (_2!8635 lt!283832)))))

(declare-fun d!63743 () Bool)

(assert (=> d!63743 e!127993))

(declare-fun res!153781 () Bool)

(assert (=> d!63743 (=> (not res!153781) (not e!127993))))

(assert (=> d!63743 (= res!153781 (isPrefixOf!0 (_1!8637 lt!284302) (_2!8637 lt!284302)))))

(declare-fun lt!284316 () BitStream!7744)

(assert (=> d!63743 (= lt!284302 (tuple2!15985 lt!284316 (_2!8635 lt!283821)))))

(declare-fun lt!284304 () Unit!13211)

(declare-fun lt!284315 () Unit!13211)

(assert (=> d!63743 (= lt!284304 lt!284315)))

(assert (=> d!63743 (isPrefixOf!0 lt!284316 (_2!8635 lt!283821))))

(assert (=> d!63743 (= lt!284315 (lemmaIsPrefixTransitive!0 lt!284316 (_2!8635 lt!283821) (_2!8635 lt!283821)))))

(declare-fun lt!284301 () Unit!13211)

(declare-fun lt!284305 () Unit!13211)

(assert (=> d!63743 (= lt!284301 lt!284305)))

(assert (=> d!63743 (isPrefixOf!0 lt!284316 (_2!8635 lt!283821))))

(assert (=> d!63743 (= lt!284305 (lemmaIsPrefixTransitive!0 lt!284316 (_2!8635 lt!283832) (_2!8635 lt!283821)))))

(declare-fun lt!284312 () Unit!13211)

(declare-fun e!127994 () Unit!13211)

(assert (=> d!63743 (= lt!284312 e!127994)))

(declare-fun c!9433 () Bool)

(assert (=> d!63743 (= c!9433 (not (= (size!4318 (buf!4773 (_2!8635 lt!283832))) #b00000000000000000000000000000000)))))

(declare-fun lt!284310 () Unit!13211)

(declare-fun lt!284306 () Unit!13211)

(assert (=> d!63743 (= lt!284310 lt!284306)))

(assert (=> d!63743 (isPrefixOf!0 (_2!8635 lt!283821) (_2!8635 lt!283821))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7744) Unit!13211)

(assert (=> d!63743 (= lt!284306 (lemmaIsPrefixRefl!0 (_2!8635 lt!283821)))))

(declare-fun lt!284303 () Unit!13211)

(declare-fun lt!284299 () Unit!13211)

(assert (=> d!63743 (= lt!284303 lt!284299)))

(assert (=> d!63743 (= lt!284299 (lemmaIsPrefixRefl!0 (_2!8635 lt!283821)))))

(declare-fun lt!284307 () Unit!13211)

(declare-fun lt!284308 () Unit!13211)

(assert (=> d!63743 (= lt!284307 lt!284308)))

(assert (=> d!63743 (isPrefixOf!0 lt!284316 lt!284316)))

(assert (=> d!63743 (= lt!284308 (lemmaIsPrefixRefl!0 lt!284316))))

(declare-fun lt!284317 () Unit!13211)

(declare-fun lt!284313 () Unit!13211)

(assert (=> d!63743 (= lt!284317 lt!284313)))

(assert (=> d!63743 (isPrefixOf!0 (_2!8635 lt!283832) (_2!8635 lt!283832))))

(assert (=> d!63743 (= lt!284313 (lemmaIsPrefixRefl!0 (_2!8635 lt!283832)))))

(assert (=> d!63743 (= lt!284316 (BitStream!7745 (buf!4773 (_2!8635 lt!283821)) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))))))

(assert (=> d!63743 (isPrefixOf!0 (_2!8635 lt!283832) (_2!8635 lt!283821))))

(assert (=> d!63743 (= (reader!0 (_2!8635 lt!283832) (_2!8635 lt!283821)) lt!284302)))

(declare-fun b!184800 () Bool)

(declare-fun Unit!13226 () Unit!13211)

(assert (=> b!184800 (= e!127994 Unit!13226)))

(declare-fun b!184803 () Bool)

(declare-fun res!153783 () Bool)

(assert (=> b!184803 (=> (not res!153783) (not e!127993))))

(assert (=> b!184803 (= res!153783 (isPrefixOf!0 (_2!8637 lt!284302) (_2!8635 lt!283821)))))

(declare-fun b!184804 () Bool)

(declare-fun lt!284314 () Unit!13211)

(assert (=> b!184804 (= e!127994 lt!284314)))

(declare-fun lt!284309 () (_ BitVec 64))

(assert (=> b!184804 (= lt!284309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!284311 () (_ BitVec 64))

(assert (=> b!184804 (= lt!284311 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9788 array!9788 (_ BitVec 64) (_ BitVec 64)) Unit!13211)

(assert (=> b!184804 (= lt!284314 (arrayBitRangesEqSymmetric!0 (buf!4773 (_2!8635 lt!283832)) (buf!4773 (_2!8635 lt!283821)) lt!284309 lt!284311))))

(declare-fun arrayBitRangesEq!0 (array!9788 array!9788 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184804 (arrayBitRangesEq!0 (buf!4773 (_2!8635 lt!283821)) (buf!4773 (_2!8635 lt!283832)) lt!284309 lt!284311)))

(assert (= (and d!63743 c!9433) b!184804))

(assert (= (and d!63743 (not c!9433)) b!184800))

(assert (= (and d!63743 res!153781) b!184802))

(assert (= (and b!184802 res!153782) b!184803))

(assert (= (and b!184803 res!153783) b!184801))

(assert (=> b!184804 m!286729))

(declare-fun m!287149 () Bool)

(assert (=> b!184804 m!287149))

(declare-fun m!287151 () Bool)

(assert (=> b!184804 m!287151))

(declare-fun m!287153 () Bool)

(assert (=> b!184803 m!287153))

(declare-fun m!287155 () Bool)

(assert (=> d!63743 m!287155))

(assert (=> d!63743 m!286757))

(declare-fun m!287157 () Bool)

(assert (=> d!63743 m!287157))

(declare-fun m!287159 () Bool)

(assert (=> d!63743 m!287159))

(declare-fun m!287161 () Bool)

(assert (=> d!63743 m!287161))

(declare-fun m!287163 () Bool)

(assert (=> d!63743 m!287163))

(declare-fun m!287165 () Bool)

(assert (=> d!63743 m!287165))

(declare-fun m!287167 () Bool)

(assert (=> d!63743 m!287167))

(declare-fun m!287169 () Bool)

(assert (=> d!63743 m!287169))

(declare-fun m!287171 () Bool)

(assert (=> d!63743 m!287171))

(declare-fun m!287173 () Bool)

(assert (=> d!63743 m!287173))

(declare-fun m!287175 () Bool)

(assert (=> b!184801 m!287175))

(assert (=> b!184801 m!286739))

(assert (=> b!184801 m!286729))

(declare-fun m!287177 () Bool)

(assert (=> b!184802 m!287177))

(assert (=> b!184578 d!63743))

(declare-fun d!63745 () Bool)

(assert (=> d!63745 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204)) lt!283833)))

(declare-fun lt!284320 () Unit!13211)

(declare-fun choose!9 (BitStream!7744 array!9788 (_ BitVec 64) BitStream!7744) Unit!13211)

(assert (=> d!63745 (= lt!284320 (choose!9 thiss!1204 (buf!4773 (_2!8635 lt!283821)) lt!283833 (BitStream!7745 (buf!4773 (_2!8635 lt!283821)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204))))))

(assert (=> d!63745 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4773 (_2!8635 lt!283821)) lt!283833) lt!284320)))

(declare-fun bs!15876 () Bool)

(assert (= bs!15876 d!63745))

(assert (=> bs!15876 m!286771))

(declare-fun m!287179 () Bool)

(assert (=> bs!15876 m!287179))

(assert (=> b!184578 d!63745))

(declare-fun d!63747 () Bool)

(assert (=> d!63747 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832))) lt!283811)))

(declare-fun lt!284321 () Unit!13211)

(assert (=> d!63747 (= lt!284321 (choose!9 (_2!8635 lt!283832) (buf!4773 (_2!8635 lt!283821)) lt!283811 (BitStream!7745 (buf!4773 (_2!8635 lt!283821)) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832)))))))

(assert (=> d!63747 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8635 lt!283832) (buf!4773 (_2!8635 lt!283821)) lt!283811) lt!284321)))

(declare-fun bs!15877 () Bool)

(assert (= bs!15877 d!63747))

(assert (=> bs!15877 m!286765))

(declare-fun m!287181 () Bool)

(assert (=> bs!15877 m!287181))

(assert (=> b!184578 d!63747))

(declare-fun lt!284322 () (_ BitVec 64))

(declare-fun lt!284326 () tuple2!15984)

(declare-fun b!184806 () Bool)

(declare-fun e!127995 () Bool)

(declare-fun lt!284324 () (_ BitVec 64))

(assert (=> b!184806 (= e!127995 (= (_1!8637 lt!284326) (withMovedBitIndex!0 (_2!8637 lt!284326) (bvsub lt!284322 lt!284324))))))

(assert (=> b!184806 (or (= (bvand lt!284322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284322 lt!284324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184806 (= lt!284324 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283821))) (currentByte!9007 (_2!8635 lt!283821)) (currentBit!9002 (_2!8635 lt!283821))))))

(assert (=> b!184806 (= lt!284322 (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)))))

(declare-fun b!184807 () Bool)

(declare-fun res!153785 () Bool)

(assert (=> b!184807 (=> (not res!153785) (not e!127995))))

(assert (=> b!184807 (= res!153785 (isPrefixOf!0 (_1!8637 lt!284326) thiss!1204))))

(declare-fun d!63749 () Bool)

(assert (=> d!63749 e!127995))

(declare-fun res!153784 () Bool)

(assert (=> d!63749 (=> (not res!153784) (not e!127995))))

(assert (=> d!63749 (= res!153784 (isPrefixOf!0 (_1!8637 lt!284326) (_2!8637 lt!284326)))))

(declare-fun lt!284340 () BitStream!7744)

(assert (=> d!63749 (= lt!284326 (tuple2!15985 lt!284340 (_2!8635 lt!283821)))))

(declare-fun lt!284328 () Unit!13211)

(declare-fun lt!284339 () Unit!13211)

(assert (=> d!63749 (= lt!284328 lt!284339)))

(assert (=> d!63749 (isPrefixOf!0 lt!284340 (_2!8635 lt!283821))))

(assert (=> d!63749 (= lt!284339 (lemmaIsPrefixTransitive!0 lt!284340 (_2!8635 lt!283821) (_2!8635 lt!283821)))))

(declare-fun lt!284325 () Unit!13211)

(declare-fun lt!284329 () Unit!13211)

(assert (=> d!63749 (= lt!284325 lt!284329)))

(assert (=> d!63749 (isPrefixOf!0 lt!284340 (_2!8635 lt!283821))))

(assert (=> d!63749 (= lt!284329 (lemmaIsPrefixTransitive!0 lt!284340 thiss!1204 (_2!8635 lt!283821)))))

(declare-fun lt!284336 () Unit!13211)

(declare-fun e!127996 () Unit!13211)

(assert (=> d!63749 (= lt!284336 e!127996)))

(declare-fun c!9434 () Bool)

(assert (=> d!63749 (= c!9434 (not (= (size!4318 (buf!4773 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!284334 () Unit!13211)

(declare-fun lt!284330 () Unit!13211)

(assert (=> d!63749 (= lt!284334 lt!284330)))

(assert (=> d!63749 (isPrefixOf!0 (_2!8635 lt!283821) (_2!8635 lt!283821))))

(assert (=> d!63749 (= lt!284330 (lemmaIsPrefixRefl!0 (_2!8635 lt!283821)))))

(declare-fun lt!284327 () Unit!13211)

(declare-fun lt!284323 () Unit!13211)

(assert (=> d!63749 (= lt!284327 lt!284323)))

(assert (=> d!63749 (= lt!284323 (lemmaIsPrefixRefl!0 (_2!8635 lt!283821)))))

(declare-fun lt!284331 () Unit!13211)

(declare-fun lt!284332 () Unit!13211)

(assert (=> d!63749 (= lt!284331 lt!284332)))

(assert (=> d!63749 (isPrefixOf!0 lt!284340 lt!284340)))

(assert (=> d!63749 (= lt!284332 (lemmaIsPrefixRefl!0 lt!284340))))

(declare-fun lt!284341 () Unit!13211)

(declare-fun lt!284337 () Unit!13211)

(assert (=> d!63749 (= lt!284341 lt!284337)))

(assert (=> d!63749 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63749 (= lt!284337 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63749 (= lt!284340 (BitStream!7745 (buf!4773 (_2!8635 lt!283821)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)))))

(assert (=> d!63749 (isPrefixOf!0 thiss!1204 (_2!8635 lt!283821))))

(assert (=> d!63749 (= (reader!0 thiss!1204 (_2!8635 lt!283821)) lt!284326)))

(declare-fun b!184805 () Bool)

(declare-fun Unit!13231 () Unit!13211)

(assert (=> b!184805 (= e!127996 Unit!13231)))

(declare-fun b!184808 () Bool)

(declare-fun res!153786 () Bool)

(assert (=> b!184808 (=> (not res!153786) (not e!127995))))

(assert (=> b!184808 (= res!153786 (isPrefixOf!0 (_2!8637 lt!284326) (_2!8635 lt!283821)))))

(declare-fun b!184809 () Bool)

(declare-fun lt!284338 () Unit!13211)

(assert (=> b!184809 (= e!127996 lt!284338)))

(declare-fun lt!284333 () (_ BitVec 64))

(assert (=> b!184809 (= lt!284333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!284335 () (_ BitVec 64))

(assert (=> b!184809 (= lt!284335 (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)))))

(assert (=> b!184809 (= lt!284338 (arrayBitRangesEqSymmetric!0 (buf!4773 thiss!1204) (buf!4773 (_2!8635 lt!283821)) lt!284333 lt!284335))))

(assert (=> b!184809 (arrayBitRangesEq!0 (buf!4773 (_2!8635 lt!283821)) (buf!4773 thiss!1204) lt!284333 lt!284335)))

(assert (= (and d!63749 c!9434) b!184809))

(assert (= (and d!63749 (not c!9434)) b!184805))

(assert (= (and d!63749 res!153784) b!184807))

(assert (= (and b!184807 res!153785) b!184808))

(assert (= (and b!184808 res!153786) b!184806))

(assert (=> b!184809 m!286731))

(declare-fun m!287183 () Bool)

(assert (=> b!184809 m!287183))

(declare-fun m!287185 () Bool)

(assert (=> b!184809 m!287185))

(declare-fun m!287187 () Bool)

(assert (=> b!184808 m!287187))

(assert (=> d!63749 m!287155))

(assert (=> d!63749 m!286741))

(declare-fun m!287189 () Bool)

(assert (=> d!63749 m!287189))

(assert (=> d!63749 m!287159))

(declare-fun m!287191 () Bool)

(assert (=> d!63749 m!287191))

(declare-fun m!287193 () Bool)

(assert (=> d!63749 m!287193))

(declare-fun m!287195 () Bool)

(assert (=> d!63749 m!287195))

(declare-fun m!287197 () Bool)

(assert (=> d!63749 m!287197))

(declare-fun m!287199 () Bool)

(assert (=> d!63749 m!287199))

(declare-fun m!287201 () Bool)

(assert (=> d!63749 m!287201))

(declare-fun m!287203 () Bool)

(assert (=> d!63749 m!287203))

(declare-fun m!287205 () Bool)

(assert (=> b!184806 m!287205))

(assert (=> b!184806 m!286739))

(assert (=> b!184806 m!286731))

(declare-fun m!287207 () Bool)

(assert (=> b!184807 m!287207))

(assert (=> b!184578 d!63749))

(declare-fun d!63751 () Bool)

(declare-fun res!153794 () Bool)

(declare-fun e!128002 () Bool)

(assert (=> d!63751 (=> (not res!153794) (not e!128002))))

(assert (=> d!63751 (= res!153794 (= (size!4318 (buf!4773 (_2!8635 lt!283832))) (size!4318 (buf!4773 (_2!8635 lt!283821)))))))

(assert (=> d!63751 (= (isPrefixOf!0 (_2!8635 lt!283832) (_2!8635 lt!283821)) e!128002)))

(declare-fun b!184816 () Bool)

(declare-fun res!153793 () Bool)

(assert (=> b!184816 (=> (not res!153793) (not e!128002))))

(assert (=> b!184816 (= res!153793 (bvsle (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))) (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283821))) (currentByte!9007 (_2!8635 lt!283821)) (currentBit!9002 (_2!8635 lt!283821)))))))

(declare-fun b!184817 () Bool)

(declare-fun e!128001 () Bool)

(assert (=> b!184817 (= e!128002 e!128001)))

(declare-fun res!153795 () Bool)

(assert (=> b!184817 (=> res!153795 e!128001)))

(assert (=> b!184817 (= res!153795 (= (size!4318 (buf!4773 (_2!8635 lt!283832))) #b00000000000000000000000000000000))))

(declare-fun b!184818 () Bool)

(assert (=> b!184818 (= e!128001 (arrayBitRangesEq!0 (buf!4773 (_2!8635 lt!283832)) (buf!4773 (_2!8635 lt!283821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832)))))))

(assert (= (and d!63751 res!153794) b!184816))

(assert (= (and b!184816 res!153793) b!184817))

(assert (= (and b!184817 (not res!153795)) b!184818))

(assert (=> b!184816 m!286729))

(assert (=> b!184816 m!286739))

(assert (=> b!184818 m!286729))

(assert (=> b!184818 m!286729))

(declare-fun m!287209 () Bool)

(assert (=> b!184818 m!287209))

(assert (=> b!184567 d!63751))

(declare-fun d!63753 () Bool)

(declare-fun res!153797 () Bool)

(declare-fun e!128004 () Bool)

(assert (=> d!63753 (=> (not res!153797) (not e!128004))))

(assert (=> d!63753 (= res!153797 (= (size!4318 (buf!4773 thiss!1204)) (size!4318 (buf!4773 (_2!8635 lt!283832)))))))

(assert (=> d!63753 (= (isPrefixOf!0 thiss!1204 (_2!8635 lt!283832)) e!128004)))

(declare-fun b!184819 () Bool)

(declare-fun res!153796 () Bool)

(assert (=> b!184819 (=> (not res!153796) (not e!128004))))

(assert (=> b!184819 (= res!153796 (bvsle (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)) (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832)))))))

(declare-fun b!184820 () Bool)

(declare-fun e!128003 () Bool)

(assert (=> b!184820 (= e!128004 e!128003)))

(declare-fun res!153798 () Bool)

(assert (=> b!184820 (=> res!153798 e!128003)))

(assert (=> b!184820 (= res!153798 (= (size!4318 (buf!4773 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!184821 () Bool)

(assert (=> b!184821 (= e!128003 (arrayBitRangesEq!0 (buf!4773 thiss!1204) (buf!4773 (_2!8635 lt!283832)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204))))))

(assert (= (and d!63753 res!153797) b!184819))

(assert (= (and b!184819 res!153796) b!184820))

(assert (= (and b!184820 (not res!153798)) b!184821))

(assert (=> b!184819 m!286731))

(assert (=> b!184819 m!286729))

(assert (=> b!184821 m!286731))

(assert (=> b!184821 m!286731))

(declare-fun m!287211 () Bool)

(assert (=> b!184821 m!287211))

(assert (=> b!184576 d!63753))

(declare-fun d!63755 () Bool)

(assert (=> d!63755 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 thiss!1204))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204)) lt!283833) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 thiss!1204))) ((_ sign_extend 32) (currentByte!9007 thiss!1204)) ((_ sign_extend 32) (currentBit!9002 thiss!1204))) lt!283833))))

(declare-fun bs!15878 () Bool)

(assert (= bs!15878 d!63755))

(assert (=> bs!15878 m!287101))

(assert (=> b!184565 d!63755))

(declare-fun d!63757 () Bool)

(assert (=> d!63757 (= (invariant!0 (currentBit!9002 (_2!8635 lt!283821)) (currentByte!9007 (_2!8635 lt!283821)) (size!4318 (buf!4773 (_2!8635 lt!283821)))) (and (bvsge (currentBit!9002 (_2!8635 lt!283821)) #b00000000000000000000000000000000) (bvslt (currentBit!9002 (_2!8635 lt!283821)) #b00000000000000000000000000001000) (bvsge (currentByte!9007 (_2!8635 lt!283821)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9007 (_2!8635 lt!283821)) (size!4318 (buf!4773 (_2!8635 lt!283821)))) (and (= (currentBit!9002 (_2!8635 lt!283821)) #b00000000000000000000000000000000) (= (currentByte!9007 (_2!8635 lt!283821)) (size!4318 (buf!4773 (_2!8635 lt!283821))))))))))

(assert (=> b!184566 d!63757))

(declare-fun d!63759 () Bool)

(assert (=> d!63759 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 thiss!1204))))))

(declare-fun bs!15879 () Bool)

(assert (= bs!15879 d!63759))

(assert (=> bs!15879 m!286759))

(assert (=> start!40220 d!63759))

(declare-fun d!63761 () Bool)

(assert (=> d!63761 (= (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 thiss!1204))) (and (bvsge (currentBit!9002 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9002 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9007 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9007 thiss!1204) (size!4318 (buf!4773 thiss!1204))) (and (= (currentBit!9002 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9007 thiss!1204) (size!4318 (buf!4773 thiss!1204)))))))))

(assert (=> b!184569 d!63761))

(declare-fun d!63763 () Bool)

(declare-fun e!128005 () Bool)

(assert (=> d!63763 e!128005))

(declare-fun res!153799 () Bool)

(assert (=> d!63763 (=> (not res!153799) (not e!128005))))

(declare-fun lt!284346 () (_ BitVec 64))

(declare-fun lt!284347 () (_ BitVec 64))

(declare-fun lt!284342 () (_ BitVec 64))

(assert (=> d!63763 (= res!153799 (= lt!284346 (bvsub lt!284342 lt!284347)))))

(assert (=> d!63763 (or (= (bvand lt!284342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284347 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284342 lt!284347) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63763 (= lt!284347 (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283821))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283821)))))))

(declare-fun lt!284343 () (_ BitVec 64))

(declare-fun lt!284345 () (_ BitVec 64))

(assert (=> d!63763 (= lt!284342 (bvmul lt!284343 lt!284345))))

(assert (=> d!63763 (or (= lt!284343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284345 (bvsdiv (bvmul lt!284343 lt!284345) lt!284343)))))

(assert (=> d!63763 (= lt!284345 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63763 (= lt!284343 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))))))

(assert (=> d!63763 (= lt!284346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283821))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283821)))))))

(assert (=> d!63763 (invariant!0 (currentBit!9002 (_2!8635 lt!283821)) (currentByte!9007 (_2!8635 lt!283821)) (size!4318 (buf!4773 (_2!8635 lt!283821))))))

(assert (=> d!63763 (= (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283821))) (currentByte!9007 (_2!8635 lt!283821)) (currentBit!9002 (_2!8635 lt!283821))) lt!284346)))

(declare-fun b!184822 () Bool)

(declare-fun res!153800 () Bool)

(assert (=> b!184822 (=> (not res!153800) (not e!128005))))

(assert (=> b!184822 (= res!153800 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284346))))

(declare-fun b!184823 () Bool)

(declare-fun lt!284344 () (_ BitVec 64))

(assert (=> b!184823 (= e!128005 (bvsle lt!284346 (bvmul lt!284344 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184823 (or (= lt!284344 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284344 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284344)))))

(assert (=> b!184823 (= lt!284344 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283821)))))))

(assert (= (and d!63763 res!153799) b!184822))

(assert (= (and b!184822 res!153800) b!184823))

(declare-fun m!287213 () Bool)

(assert (=> d!63763 m!287213))

(assert (=> d!63763 m!286737))

(assert (=> b!184570 d!63763))

(declare-fun d!63765 () Bool)

(declare-fun res!153802 () Bool)

(declare-fun e!128007 () Bool)

(assert (=> d!63765 (=> (not res!153802) (not e!128007))))

(assert (=> d!63765 (= res!153802 (= (size!4318 (buf!4773 thiss!1204)) (size!4318 (buf!4773 (_2!8635 lt!283821)))))))

(assert (=> d!63765 (= (isPrefixOf!0 thiss!1204 (_2!8635 lt!283821)) e!128007)))

(declare-fun b!184824 () Bool)

(declare-fun res!153801 () Bool)

(assert (=> b!184824 (=> (not res!153801) (not e!128007))))

(assert (=> b!184824 (= res!153801 (bvsle (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)) (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283821))) (currentByte!9007 (_2!8635 lt!283821)) (currentBit!9002 (_2!8635 lt!283821)))))))

(declare-fun b!184825 () Bool)

(declare-fun e!128006 () Bool)

(assert (=> b!184825 (= e!128007 e!128006)))

(declare-fun res!153803 () Bool)

(assert (=> b!184825 (=> res!153803 e!128006)))

(assert (=> b!184825 (= res!153803 (= (size!4318 (buf!4773 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!184826 () Bool)

(assert (=> b!184826 (= e!128006 (arrayBitRangesEq!0 (buf!4773 thiss!1204) (buf!4773 (_2!8635 lt!283821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4318 (buf!4773 thiss!1204)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204))))))

(assert (= (and d!63765 res!153802) b!184824))

(assert (= (and b!184824 res!153801) b!184825))

(assert (= (and b!184825 (not res!153803)) b!184826))

(assert (=> b!184824 m!286731))

(assert (=> b!184824 m!286739))

(assert (=> b!184826 m!286731))

(assert (=> b!184826 m!286731))

(declare-fun m!287215 () Bool)

(assert (=> b!184826 m!287215))

(assert (=> b!184570 d!63765))

(declare-fun d!63767 () Bool)

(assert (=> d!63767 (isPrefixOf!0 thiss!1204 (_2!8635 lt!283821))))

(declare-fun lt!284350 () Unit!13211)

(declare-fun choose!30 (BitStream!7744 BitStream!7744 BitStream!7744) Unit!13211)

(assert (=> d!63767 (= lt!284350 (choose!30 thiss!1204 (_2!8635 lt!283832) (_2!8635 lt!283821)))))

(assert (=> d!63767 (isPrefixOf!0 thiss!1204 (_2!8635 lt!283832))))

(assert (=> d!63767 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8635 lt!283832) (_2!8635 lt!283821)) lt!284350)))

(declare-fun bs!15880 () Bool)

(assert (= bs!15880 d!63767))

(assert (=> bs!15880 m!286741))

(declare-fun m!287217 () Bool)

(assert (=> bs!15880 m!287217))

(assert (=> bs!15880 m!286753))

(assert (=> b!184570 d!63767))

(declare-fun d!63769 () Bool)

(declare-fun e!128079 () Bool)

(assert (=> d!63769 e!128079))

(declare-fun res!153906 () Bool)

(assert (=> d!63769 (=> (not res!153906) (not e!128079))))

(declare-fun lt!284746 () tuple2!15980)

(assert (=> d!63769 (= res!153906 (invariant!0 (currentBit!9002 (_2!8635 lt!284746)) (currentByte!9007 (_2!8635 lt!284746)) (size!4318 (buf!4773 (_2!8635 lt!284746)))))))

(declare-fun e!128084 () tuple2!15980)

(assert (=> d!63769 (= lt!284746 e!128084)))

(declare-fun c!9446 () Bool)

(assert (=> d!63769 (= c!9446 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63769 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63769 (= (appendBitsLSBFirstLoopTR!0 (_2!8635 lt!283832) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!284746)))

(declare-fun b!184943 () Bool)

(declare-fun e!128085 () (_ BitVec 64))

(assert (=> b!184943 (= e!128085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!184944 () Bool)

(declare-fun lt!284766 () tuple2!15982)

(declare-fun lt!284735 () tuple2!15980)

(assert (=> b!184944 (= lt!284766 (readBitPure!0 (readerFrom!0 (_2!8635 lt!284735) (currentBit!9002 (_2!8635 lt!283832)) (currentByte!9007 (_2!8635 lt!283832)))))))

(declare-fun lt!284770 () Bool)

(declare-fun res!153909 () Bool)

(assert (=> b!184944 (= res!153909 (and (= (_2!8636 lt!284766) lt!284770) (= (_1!8636 lt!284766) (_2!8635 lt!284735))))))

(declare-fun e!128083 () Bool)

(assert (=> b!184944 (=> (not res!153909) (not e!128083))))

(declare-fun e!128080 () Bool)

(assert (=> b!184944 (= e!128080 e!128083)))

(declare-fun b!184945 () Bool)

(declare-fun res!153904 () Bool)

(assert (=> b!184945 (= res!153904 (isPrefixOf!0 (_2!8635 lt!283832) (_2!8635 lt!284735)))))

(assert (=> b!184945 (=> (not res!153904) (not e!128080))))

(declare-fun b!184946 () Bool)

(declare-fun res!153899 () Bool)

(assert (=> b!184946 (=> (not res!153899) (not e!128079))))

(assert (=> b!184946 (= res!153899 (isPrefixOf!0 (_2!8635 lt!283832) (_2!8635 lt!284746)))))

(declare-fun b!184947 () Bool)

(declare-fun e!128086 () Bool)

(declare-fun lt!284737 () tuple2!15986)

(declare-fun lt!284734 () tuple2!15984)

(assert (=> b!184947 (= e!128086 (= (_1!8638 lt!284737) (_2!8637 lt!284734)))))

(declare-fun b!184948 () Bool)

(declare-fun Unit!13232 () Unit!13211)

(assert (=> b!184948 (= e!128084 (tuple2!15981 Unit!13232 (_2!8635 lt!283832)))))

(declare-fun lt!284723 () Unit!13211)

(assert (=> b!184948 (= lt!284723 (lemmaIsPrefixRefl!0 (_2!8635 lt!283832)))))

(declare-fun call!2978 () Bool)

(assert (=> b!184948 call!2978))

(declare-fun lt!284759 () Unit!13211)

(assert (=> b!184948 (= lt!284759 lt!284723)))

(declare-fun b!184949 () Bool)

(assert (=> b!184949 (= e!128079 e!128086)))

(declare-fun res!153905 () Bool)

(assert (=> b!184949 (=> (not res!153905) (not e!128086))))

(assert (=> b!184949 (= res!153905 (= (_2!8638 lt!284737) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!184949 (= lt!284737 (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!284734) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!284761 () Unit!13211)

(declare-fun lt!284758 () Unit!13211)

(assert (=> b!184949 (= lt!284761 lt!284758)))

(declare-fun lt!284748 () (_ BitVec 64))

(assert (=> b!184949 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!284746)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832))) lt!284748)))

(assert (=> b!184949 (= lt!284758 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8635 lt!283832) (buf!4773 (_2!8635 lt!284746)) lt!284748))))

(declare-fun e!128082 () Bool)

(assert (=> b!184949 e!128082))

(declare-fun res!153903 () Bool)

(assert (=> b!184949 (=> (not res!153903) (not e!128082))))

(assert (=> b!184949 (= res!153903 (and (= (size!4318 (buf!4773 (_2!8635 lt!283832))) (size!4318 (buf!4773 (_2!8635 lt!284746)))) (bvsge lt!284748 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184949 (= lt!284748 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!184949 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!184949 (= lt!284734 (reader!0 (_2!8635 lt!283832) (_2!8635 lt!284746)))))

(declare-fun b!184950 () Bool)

(declare-fun e!128078 () Bool)

(declare-fun lt!284750 () tuple2!15986)

(declare-fun lt!284730 () tuple2!15984)

(assert (=> b!184950 (= e!128078 (= (_1!8638 lt!284750) (_2!8637 lt!284730)))))

(declare-fun b!184951 () Bool)

(declare-fun res!153898 () Bool)

(assert (=> b!184951 (= res!153898 (= (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284735))) (currentByte!9007 (_2!8635 lt!284735)) (currentBit!9002 (_2!8635 lt!284735))) (bvadd (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!184951 (=> (not res!153898) (not e!128080))))

(declare-fun b!184952 () Bool)

(declare-fun lt!284763 () tuple2!15980)

(assert (=> b!184952 (= e!128084 (tuple2!15981 (_1!8635 lt!284763) (_2!8635 lt!284763)))))

(assert (=> b!184952 (= lt!284770 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184952 (= lt!284735 (appendBit!0 (_2!8635 lt!283832) lt!284770))))

(declare-fun res!153902 () Bool)

(assert (=> b!184952 (= res!153902 (= (size!4318 (buf!4773 (_2!8635 lt!283832))) (size!4318 (buf!4773 (_2!8635 lt!284735)))))))

(assert (=> b!184952 (=> (not res!153902) (not e!128080))))

(assert (=> b!184952 e!128080))

(declare-fun lt!284765 () tuple2!15980)

(assert (=> b!184952 (= lt!284765 lt!284735)))

(assert (=> b!184952 (= lt!284763 (appendBitsLSBFirstLoopTR!0 (_2!8635 lt!284765) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!284741 () Unit!13211)

(assert (=> b!184952 (= lt!284741 (lemmaIsPrefixTransitive!0 (_2!8635 lt!283832) (_2!8635 lt!284765) (_2!8635 lt!284763)))))

(assert (=> b!184952 call!2978))

(declare-fun lt!284738 () Unit!13211)

(assert (=> b!184952 (= lt!284738 lt!284741)))

(assert (=> b!184952 (invariant!0 (currentBit!9002 (_2!8635 lt!283832)) (currentByte!9007 (_2!8635 lt!283832)) (size!4318 (buf!4773 (_2!8635 lt!284765))))))

(declare-fun lt!284749 () BitStream!7744)

(assert (=> b!184952 (= lt!284749 (BitStream!7745 (buf!4773 (_2!8635 lt!284765)) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))))))

(assert (=> b!184952 (invariant!0 (currentBit!9002 lt!284749) (currentByte!9007 lt!284749) (size!4318 (buf!4773 (_2!8635 lt!284763))))))

(declare-fun lt!284733 () BitStream!7744)

(assert (=> b!184952 (= lt!284733 (BitStream!7745 (buf!4773 (_2!8635 lt!284763)) (currentByte!9007 lt!284749) (currentBit!9002 lt!284749)))))

(declare-fun lt!284732 () tuple2!15982)

(assert (=> b!184952 (= lt!284732 (readBitPure!0 lt!284749))))

(declare-fun lt!284742 () tuple2!15982)

(assert (=> b!184952 (= lt!284742 (readBitPure!0 lt!284733))))

(declare-fun lt!284726 () Unit!13211)

(assert (=> b!184952 (= lt!284726 (readBitPrefixLemma!0 lt!284749 (_2!8635 lt!284763)))))

(declare-fun res!153908 () Bool)

(assert (=> b!184952 (= res!153908 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!284732))) (currentByte!9007 (_1!8636 lt!284732)) (currentBit!9002 (_1!8636 lt!284732))) (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!284742))) (currentByte!9007 (_1!8636 lt!284742)) (currentBit!9002 (_1!8636 lt!284742)))))))

(declare-fun e!128081 () Bool)

(assert (=> b!184952 (=> (not res!153908) (not e!128081))))

(assert (=> b!184952 e!128081))

(declare-fun lt!284775 () Unit!13211)

(assert (=> b!184952 (= lt!284775 lt!284726)))

(declare-fun lt!284727 () tuple2!15984)

(assert (=> b!184952 (= lt!284727 (reader!0 (_2!8635 lt!283832) (_2!8635 lt!284763)))))

(declare-fun lt!284740 () tuple2!15984)

(assert (=> b!184952 (= lt!284740 (reader!0 (_2!8635 lt!284765) (_2!8635 lt!284763)))))

(declare-fun lt!284728 () tuple2!15982)

(assert (=> b!184952 (= lt!284728 (readBitPure!0 (_1!8637 lt!284727)))))

(assert (=> b!184952 (= (_2!8636 lt!284728) lt!284770)))

(declare-fun lt!284745 () Unit!13211)

(declare-fun Unit!13233 () Unit!13211)

(assert (=> b!184952 (= lt!284745 Unit!13233)))

(declare-fun lt!284739 () (_ BitVec 64))

(assert (=> b!184952 (= lt!284739 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284753 () (_ BitVec 64))

(assert (=> b!184952 (= lt!284753 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284736 () Unit!13211)

(assert (=> b!184952 (= lt!284736 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8635 lt!283832) (buf!4773 (_2!8635 lt!284763)) lt!284753))))

(assert (=> b!184952 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!284763)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832))) lt!284753)))

(declare-fun lt!284771 () Unit!13211)

(assert (=> b!184952 (= lt!284771 lt!284736)))

(declare-fun lt!284754 () tuple2!15986)

(assert (=> b!184952 (= lt!284754 (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!284727) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284739))))

(declare-fun lt!284773 () (_ BitVec 64))

(assert (=> b!184952 (= lt!284773 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!284774 () Unit!13211)

(assert (=> b!184952 (= lt!284774 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8635 lt!284765) (buf!4773 (_2!8635 lt!284763)) lt!284773))))

(assert (=> b!184952 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!284763)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!284765))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!284765))) lt!284773)))

(declare-fun lt!284752 () Unit!13211)

(assert (=> b!184952 (= lt!284752 lt!284774)))

(declare-fun lt!284760 () tuple2!15986)

(assert (=> b!184952 (= lt!284760 (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!284740) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!284739 (ite (_2!8636 lt!284728) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!284729 () tuple2!15986)

(assert (=> b!184952 (= lt!284729 (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!284727) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284739))))

(declare-fun c!9445 () Bool)

(assert (=> b!184952 (= c!9445 (_2!8636 (readBitPure!0 (_1!8637 lt!284727))))))

(declare-fun lt!284722 () tuple2!15986)

(assert (=> b!184952 (= lt!284722 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8637 lt!284727) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!284739 e!128085)))))

(declare-fun lt!284776 () Unit!13211)

(assert (=> b!184952 (= lt!284776 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8637 lt!284727) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284739))))

(assert (=> b!184952 (and (= (_2!8638 lt!284729) (_2!8638 lt!284722)) (= (_1!8638 lt!284729) (_1!8638 lt!284722)))))

(declare-fun lt!284769 () Unit!13211)

(assert (=> b!184952 (= lt!284769 lt!284776)))

(assert (=> b!184952 (= (_1!8637 lt!284727) (withMovedBitIndex!0 (_2!8637 lt!284727) (bvsub (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))) (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284763))) (currentByte!9007 (_2!8635 lt!284763)) (currentBit!9002 (_2!8635 lt!284763))))))))

(declare-fun lt!284744 () Unit!13211)

(declare-fun Unit!13234 () Unit!13211)

(assert (=> b!184952 (= lt!284744 Unit!13234)))

(assert (=> b!184952 (= (_1!8637 lt!284740) (withMovedBitIndex!0 (_2!8637 lt!284740) (bvsub (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284765))) (currentByte!9007 (_2!8635 lt!284765)) (currentBit!9002 (_2!8635 lt!284765))) (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284763))) (currentByte!9007 (_2!8635 lt!284763)) (currentBit!9002 (_2!8635 lt!284763))))))))

(declare-fun lt!284757 () Unit!13211)

(declare-fun Unit!13235 () Unit!13211)

(assert (=> b!184952 (= lt!284757 Unit!13235)))

(assert (=> b!184952 (= (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))) (bvsub (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284765))) (currentByte!9007 (_2!8635 lt!284765)) (currentBit!9002 (_2!8635 lt!284765))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!284743 () Unit!13211)

(declare-fun Unit!13236 () Unit!13211)

(assert (=> b!184952 (= lt!284743 Unit!13236)))

(assert (=> b!184952 (= (_2!8638 lt!284754) (_2!8638 lt!284760))))

(declare-fun lt!284731 () Unit!13211)

(declare-fun Unit!13237 () Unit!13211)

(assert (=> b!184952 (= lt!284731 Unit!13237)))

(assert (=> b!184952 (invariant!0 (currentBit!9002 (_2!8635 lt!284763)) (currentByte!9007 (_2!8635 lt!284763)) (size!4318 (buf!4773 (_2!8635 lt!284763))))))

(declare-fun lt!284756 () Unit!13211)

(declare-fun Unit!13238 () Unit!13211)

(assert (=> b!184952 (= lt!284756 Unit!13238)))

(assert (=> b!184952 (= (size!4318 (buf!4773 (_2!8635 lt!283832))) (size!4318 (buf!4773 (_2!8635 lt!284763))))))

(declare-fun lt!284768 () Unit!13211)

(declare-fun Unit!13239 () Unit!13211)

(assert (=> b!184952 (= lt!284768 Unit!13239)))

(assert (=> b!184952 (= (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284763))) (currentByte!9007 (_2!8635 lt!284763)) (currentBit!9002 (_2!8635 lt!284763))) (bvsub (bvadd (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284751 () Unit!13211)

(declare-fun Unit!13240 () Unit!13211)

(assert (=> b!184952 (= lt!284751 Unit!13240)))

(declare-fun lt!284767 () Unit!13211)

(declare-fun Unit!13241 () Unit!13211)

(assert (=> b!184952 (= lt!284767 Unit!13241)))

(assert (=> b!184952 (= lt!284730 (reader!0 (_2!8635 lt!283832) (_2!8635 lt!284763)))))

(declare-fun lt!284777 () (_ BitVec 64))

(assert (=> b!184952 (= lt!284777 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284762 () Unit!13211)

(assert (=> b!184952 (= lt!284762 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8635 lt!283832) (buf!4773 (_2!8635 lt!284763)) lt!284777))))

(assert (=> b!184952 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!284763)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832))) lt!284777)))

(declare-fun lt!284747 () Unit!13211)

(assert (=> b!184952 (= lt!284747 lt!284762)))

(assert (=> b!184952 (= lt!284750 (readNBitsLSBFirstsLoopPure!0 (_1!8637 lt!284730) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!153900 () Bool)

(assert (=> b!184952 (= res!153900 (= (_2!8638 lt!284750) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!184952 (=> (not res!153900) (not e!128078))))

(assert (=> b!184952 e!128078))

(declare-fun lt!284725 () Unit!13211)

(declare-fun Unit!13242 () Unit!13211)

(assert (=> b!184952 (= lt!284725 Unit!13242)))

(declare-fun b!184953 () Bool)

(assert (=> b!184953 (= e!128081 (= (_2!8636 lt!284732) (_2!8636 lt!284742)))))

(declare-fun b!184954 () Bool)

(declare-fun res!153901 () Bool)

(assert (=> b!184954 (=> (not res!153901) (not e!128079))))

(assert (=> b!184954 (= res!153901 (= (size!4318 (buf!4773 (_2!8635 lt!283832))) (size!4318 (buf!4773 (_2!8635 lt!284746)))))))

(declare-fun b!184955 () Bool)

(declare-fun res!153907 () Bool)

(assert (=> b!184955 (=> (not res!153907) (not e!128079))))

(declare-fun lt!284764 () (_ BitVec 64))

(declare-fun lt!284755 () (_ BitVec 64))

(assert (=> b!184955 (= res!153907 (= (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284746))) (currentByte!9007 (_2!8635 lt!284746)) (currentBit!9002 (_2!8635 lt!284746))) (bvsub lt!284755 lt!284764)))))

(assert (=> b!184955 (or (= (bvand lt!284755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284764 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284755 lt!284764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184955 (= lt!284764 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!284772 () (_ BitVec 64))

(declare-fun lt!284724 () (_ BitVec 64))

(assert (=> b!184955 (= lt!284755 (bvadd lt!284772 lt!284724))))

(assert (=> b!184955 (or (not (= (bvand lt!284772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284724 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!284772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!284772 lt!284724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184955 (= lt!284724 ((_ sign_extend 32) nBits!348))))

(assert (=> b!184955 (= lt!284772 (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!283832))) (currentByte!9007 (_2!8635 lt!283832)) (currentBit!9002 (_2!8635 lt!283832))))))

(declare-fun b!184956 () Bool)

(assert (=> b!184956 (= e!128085 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!184957 () Bool)

(assert (=> b!184957 (= e!128082 (validate_offset_bits!1 ((_ sign_extend 32) (size!4318 (buf!4773 (_2!8635 lt!283832)))) ((_ sign_extend 32) (currentByte!9007 (_2!8635 lt!283832))) ((_ sign_extend 32) (currentBit!9002 (_2!8635 lt!283832))) lt!284748))))

(declare-fun b!184958 () Bool)

(assert (=> b!184958 (= e!128083 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!284766))) (currentByte!9007 (_1!8636 lt!284766)) (currentBit!9002 (_1!8636 lt!284766))) (bitIndex!0 (size!4318 (buf!4773 (_2!8635 lt!284735))) (currentByte!9007 (_2!8635 lt!284735)) (currentBit!9002 (_2!8635 lt!284735)))))))

(declare-fun bm!2975 () Bool)

(assert (=> bm!2975 (= call!2978 (isPrefixOf!0 (_2!8635 lt!283832) (ite c!9446 (_2!8635 lt!283832) (_2!8635 lt!284763))))))

(assert (= (and d!63769 c!9446) b!184948))

(assert (= (and d!63769 (not c!9446)) b!184952))

(assert (= (and b!184952 res!153902) b!184951))

(assert (= (and b!184951 res!153898) b!184945))

(assert (= (and b!184945 res!153904) b!184944))

(assert (= (and b!184944 res!153909) b!184958))

(assert (= (and b!184952 res!153908) b!184953))

(assert (= (and b!184952 c!9445) b!184956))

(assert (= (and b!184952 (not c!9445)) b!184943))

(assert (= (and b!184952 res!153900) b!184950))

(assert (= (or b!184948 b!184952) bm!2975))

(assert (= (and d!63769 res!153906) b!184954))

(assert (= (and b!184954 res!153901) b!184955))

(assert (= (and b!184955 res!153907) b!184946))

(assert (= (and b!184946 res!153899) b!184949))

(assert (= (and b!184949 res!153903) b!184957))

(assert (= (and b!184949 res!153905) b!184947))

(declare-fun m!287361 () Bool)

(assert (=> b!184945 m!287361))

(declare-fun m!287363 () Bool)

(assert (=> b!184957 m!287363))

(declare-fun m!287365 () Bool)

(assert (=> b!184949 m!287365))

(declare-fun m!287367 () Bool)

(assert (=> b!184949 m!287367))

(declare-fun m!287369 () Bool)

(assert (=> b!184949 m!287369))

(declare-fun m!287371 () Bool)

(assert (=> b!184949 m!287371))

(declare-fun m!287373 () Bool)

(assert (=> b!184949 m!287373))

(declare-fun m!287375 () Bool)

(assert (=> b!184949 m!287375))

(declare-fun m!287377 () Bool)

(assert (=> d!63769 m!287377))

(declare-fun m!287379 () Bool)

(assert (=> b!184958 m!287379))

(declare-fun m!287381 () Bool)

(assert (=> b!184958 m!287381))

(assert (=> b!184948 m!287157))

(declare-fun m!287383 () Bool)

(assert (=> b!184946 m!287383))

(assert (=> b!184951 m!287381))

(assert (=> b!184951 m!286729))

(declare-fun m!287385 () Bool)

(assert (=> bm!2975 m!287385))

(declare-fun m!287387 () Bool)

(assert (=> b!184955 m!287387))

(assert (=> b!184955 m!286729))

(declare-fun m!287389 () Bool)

(assert (=> b!184944 m!287389))

(assert (=> b!184944 m!287389))

(declare-fun m!287391 () Bool)

(assert (=> b!184944 m!287391))

(declare-fun m!287393 () Bool)

(assert (=> b!184952 m!287393))

(declare-fun m!287395 () Bool)

(assert (=> b!184952 m!287395))

(assert (=> b!184952 m!287365))

(declare-fun m!287397 () Bool)

(assert (=> b!184952 m!287397))

(declare-fun m!287399 () Bool)

(assert (=> b!184952 m!287399))

(declare-fun m!287401 () Bool)

(assert (=> b!184952 m!287401))

(declare-fun m!287403 () Bool)

(assert (=> b!184952 m!287403))

(declare-fun m!287405 () Bool)

(assert (=> b!184952 m!287405))

(declare-fun m!287407 () Bool)

(assert (=> b!184952 m!287407))

(declare-fun m!287409 () Bool)

(assert (=> b!184952 m!287409))

(declare-fun m!287411 () Bool)

(assert (=> b!184952 m!287411))

(declare-fun m!287413 () Bool)

(assert (=> b!184952 m!287413))

(declare-fun m!287415 () Bool)

(assert (=> b!184952 m!287415))

(declare-fun m!287417 () Bool)

(assert (=> b!184952 m!287417))

(declare-fun m!287419 () Bool)

(assert (=> b!184952 m!287419))

(declare-fun m!287421 () Bool)

(assert (=> b!184952 m!287421))

(declare-fun m!287423 () Bool)

(assert (=> b!184952 m!287423))

(declare-fun m!287425 () Bool)

(assert (=> b!184952 m!287425))

(declare-fun m!287427 () Bool)

(assert (=> b!184952 m!287427))

(declare-fun m!287429 () Bool)

(assert (=> b!184952 m!287429))

(assert (=> b!184952 m!287413))

(declare-fun m!287431 () Bool)

(assert (=> b!184952 m!287431))

(declare-fun m!287433 () Bool)

(assert (=> b!184952 m!287433))

(assert (=> b!184952 m!287375))

(declare-fun m!287435 () Bool)

(assert (=> b!184952 m!287435))

(declare-fun m!287437 () Bool)

(assert (=> b!184952 m!287437))

(declare-fun m!287439 () Bool)

(assert (=> b!184952 m!287439))

(declare-fun m!287441 () Bool)

(assert (=> b!184952 m!287441))

(declare-fun m!287443 () Bool)

(assert (=> b!184952 m!287443))

(declare-fun m!287445 () Bool)

(assert (=> b!184952 m!287445))

(declare-fun m!287447 () Bool)

(assert (=> b!184952 m!287447))

(declare-fun m!287449 () Bool)

(assert (=> b!184952 m!287449))

(assert (=> b!184952 m!286729))

(declare-fun m!287451 () Bool)

(assert (=> b!184952 m!287451))

(assert (=> b!184570 d!63769))

(declare-fun d!63809 () Bool)

(declare-fun e!128087 () Bool)

(assert (=> d!63809 e!128087))

(declare-fun res!153910 () Bool)

(assert (=> d!63809 (=> (not res!153910) (not e!128087))))

(declare-fun lt!284783 () (_ BitVec 64))

(declare-fun lt!284778 () (_ BitVec 64))

(declare-fun lt!284782 () (_ BitVec 64))

(assert (=> d!63809 (= res!153910 (= lt!284782 (bvsub lt!284778 lt!284783)))))

(assert (=> d!63809 (or (= (bvand lt!284778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284778 lt!284783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63809 (= lt!284783 (remainingBits!0 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283818)))) ((_ sign_extend 32) (currentByte!9007 (_1!8636 lt!283818))) ((_ sign_extend 32) (currentBit!9002 (_1!8636 lt!283818)))))))

(declare-fun lt!284779 () (_ BitVec 64))

(declare-fun lt!284781 () (_ BitVec 64))

(assert (=> d!63809 (= lt!284778 (bvmul lt!284779 lt!284781))))

(assert (=> d!63809 (or (= lt!284779 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284781 (bvsdiv (bvmul lt!284779 lt!284781) lt!284779)))))

(assert (=> d!63809 (= lt!284781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63809 (= lt!284779 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283818)))))))

(assert (=> d!63809 (= lt!284782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9007 (_1!8636 lt!283818))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9002 (_1!8636 lt!283818)))))))

(assert (=> d!63809 (invariant!0 (currentBit!9002 (_1!8636 lt!283818)) (currentByte!9007 (_1!8636 lt!283818)) (size!4318 (buf!4773 (_1!8636 lt!283818))))))

(assert (=> d!63809 (= (bitIndex!0 (size!4318 (buf!4773 (_1!8636 lt!283818))) (currentByte!9007 (_1!8636 lt!283818)) (currentBit!9002 (_1!8636 lt!283818))) lt!284782)))

(declare-fun b!184959 () Bool)

(declare-fun res!153911 () Bool)

(assert (=> b!184959 (=> (not res!153911) (not e!128087))))

(assert (=> b!184959 (= res!153911 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284782))))

(declare-fun b!184960 () Bool)

(declare-fun lt!284780 () (_ BitVec 64))

(assert (=> b!184960 (= e!128087 (bvsle lt!284782 (bvmul lt!284780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184960 (or (= lt!284780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284780)))))

(assert (=> b!184960 (= lt!284780 ((_ sign_extend 32) (size!4318 (buf!4773 (_1!8636 lt!283818)))))))

(assert (= (and d!63809 res!153910) b!184959))

(assert (= (and b!184959 res!153911) b!184960))

(declare-fun m!287453 () Bool)

(assert (=> d!63809 m!287453))

(declare-fun m!287455 () Bool)

(assert (=> d!63809 m!287455))

(assert (=> b!184572 d!63809))

(declare-fun d!63811 () Bool)

(declare-fun lt!284784 () tuple2!16010)

(assert (=> d!63811 (= lt!284784 (readBit!0 (readerFrom!0 (_2!8635 lt!283832) (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204))))))

(assert (=> d!63811 (= (readBitPure!0 (readerFrom!0 (_2!8635 lt!283832) (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204))) (tuple2!15983 (_2!8650 lt!284784) (_1!8650 lt!284784)))))

(declare-fun bs!15890 () Bool)

(assert (= bs!15890 d!63811))

(assert (=> bs!15890 m!286749))

(declare-fun m!287457 () Bool)

(assert (=> bs!15890 m!287457))

(assert (=> b!184561 d!63811))

(declare-fun d!63813 () Bool)

(declare-fun e!128090 () Bool)

(assert (=> d!63813 e!128090))

(declare-fun res!153915 () Bool)

(assert (=> d!63813 (=> (not res!153915) (not e!128090))))

(assert (=> d!63813 (= res!153915 (invariant!0 (currentBit!9002 (_2!8635 lt!283832)) (currentByte!9007 (_2!8635 lt!283832)) (size!4318 (buf!4773 (_2!8635 lt!283832)))))))

(assert (=> d!63813 (= (readerFrom!0 (_2!8635 lt!283832) (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204)) (BitStream!7745 (buf!4773 (_2!8635 lt!283832)) (currentByte!9007 thiss!1204) (currentBit!9002 thiss!1204)))))

(declare-fun b!184963 () Bool)

(assert (=> b!184963 (= e!128090 (invariant!0 (currentBit!9002 thiss!1204) (currentByte!9007 thiss!1204) (size!4318 (buf!4773 (_2!8635 lt!283832)))))))

(assert (= (and d!63813 res!153915) b!184963))

(assert (=> d!63813 m!287099))

(assert (=> b!184963 m!286779))

(assert (=> b!184561 d!63813))

(assert (=> b!184562 d!63753))

(assert (=> b!184571 d!63711))

(assert (=> b!184571 d!63713))

(push 1)

(assert (not b!184957))

(assert (not b!184803))

(assert (not d!63745))

(assert (not b!184949))

(assert (not b!184802))

(assert (not b!184819))

(assert (not b!184958))

(assert (not d!63739))

(assert (not d!63711))

(assert (not d!63715))

(assert (not d!63741))

(assert (not d!63729))

(assert (not b!184951))

(assert (not b!184955))

(assert (not b!184944))

(assert (not b!184801))

(assert (not d!63727))

(assert (not d!63735))

(assert (not b!184952))

(assert (not bm!2975))

(assert (not b!184806))

(assert (not b!184818))

(assert (not b!184945))

(assert (not d!63749))

(assert (not d!63769))

(assert (not b!184946))

(assert (not d!63707))

(assert (not d!63813))

(assert (not d!63747))

(assert (not d!63713))

(assert (not b!184816))

(assert (not d!63731))

(assert (not b!184779))

(assert (not d!63719))

(assert (not b!184804))

(assert (not b!184808))

(assert (not b!184821))

(assert (not b!184782))

(assert (not d!63767))

(assert (not b!184948))

(assert (not b!184826))

(assert (not d!63809))

(assert (not d!63743))

(assert (not b!184824))

(assert (not d!63705))

(assert (not b!184807))

(assert (not d!63737))

(assert (not d!63725))

(assert (not b!184963))

(assert (not d!63721))

(assert (not b!184758))

(assert (not b!184780))

(assert (not d!63759))

(assert (not d!63755))

(assert (not b!184809))

(assert (not b!184781))

(assert (not d!63763))

(assert (not d!63709))

(assert (not d!63811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

