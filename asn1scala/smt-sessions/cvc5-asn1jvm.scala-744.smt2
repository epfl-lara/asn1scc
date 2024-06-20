; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21112 () Bool)

(assert start!21112)

(declare-fun b!106433 () Bool)

(declare-fun e!69673 () Bool)

(declare-datatypes ((array!4901 0))(
  ( (array!4902 (arr!2826 (Array (_ BitVec 32) (_ BitVec 8))) (size!2233 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3940 0))(
  ( (BitStream!3941 (buf!2612 array!4901) (currentByte!5124 (_ BitVec 32)) (currentBit!5119 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8752 0))(
  ( (tuple2!8753 (_1!4633 BitStream!3940) (_2!4633 Bool)) )
))
(declare-fun lt!158160 () tuple2!8752)

(declare-fun lt!158168 () tuple2!8752)

(assert (=> b!106433 (= e!69673 (= (_2!4633 lt!158160) (_2!4633 lt!158168)))))

(declare-fun b!106434 () Bool)

(declare-fun e!69680 () Bool)

(declare-fun e!69675 () Bool)

(assert (=> b!106434 (= e!69680 e!69675)))

(declare-fun res!87675 () Bool)

(assert (=> b!106434 (=> (not res!87675) (not e!69675))))

(declare-fun thiss!1305 () BitStream!3940)

(declare-fun lt!158150 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106434 (= res!87675 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 thiss!1305))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305)) lt!158150))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!106434 (= lt!158150 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!106435 () Bool)

(declare-fun res!87667 () Bool)

(declare-fun e!69681 () Bool)

(assert (=> b!106435 (=> (not res!87667) (not e!69681))))

(declare-datatypes ((Unit!6520 0))(
  ( (Unit!6521) )
))
(declare-datatypes ((tuple2!8754 0))(
  ( (tuple2!8755 (_1!4634 Unit!6520) (_2!4634 BitStream!3940)) )
))
(declare-fun lt!158166 () tuple2!8754)

(declare-fun isPrefixOf!0 (BitStream!3940 BitStream!3940) Bool)

(assert (=> b!106435 (= res!87667 (isPrefixOf!0 thiss!1305 (_2!4634 lt!158166)))))

(declare-fun b!106436 () Bool)

(declare-fun e!69676 () Bool)

(declare-fun array_inv!2035 (array!4901) Bool)

(assert (=> b!106436 (= e!69676 (array_inv!2035 (buf!2612 thiss!1305)))))

(declare-fun res!87669 () Bool)

(assert (=> start!21112 (=> (not res!87669) (not e!69680))))

(assert (=> start!21112 (= res!87669 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21112 e!69680))

(assert (=> start!21112 true))

(declare-fun inv!12 (BitStream!3940) Bool)

(assert (=> start!21112 (and (inv!12 thiss!1305) e!69676)))

(declare-fun b!106437 () Bool)

(declare-fun e!69674 () Bool)

(declare-fun lt!158156 () tuple2!8752)

(declare-fun lt!158151 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106437 (= e!69674 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158156))) (currentByte!5124 (_1!4633 lt!158156)) (currentBit!5119 (_1!4633 lt!158156))) lt!158151))))

(declare-fun b!106438 () Bool)

(declare-fun e!69679 () Bool)

(assert (=> b!106438 (= e!69675 (not e!69679))))

(declare-fun res!87678 () Bool)

(assert (=> b!106438 (=> res!87678 e!69679)))

(declare-datatypes ((tuple2!8756 0))(
  ( (tuple2!8757 (_1!4635 BitStream!3940) (_2!4635 BitStream!3940)) )
))
(declare-fun lt!158152 () tuple2!8756)

(declare-fun lt!158165 () (_ BitVec 64))

(declare-datatypes ((tuple2!8758 0))(
  ( (tuple2!8759 (_1!4636 BitStream!3940) (_2!4636 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8758)

(assert (=> b!106438 (= res!87678 (not (= (_1!4636 (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158152) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158165)) (_2!4635 lt!158152))))))

(declare-fun lt!158162 () tuple2!8754)

(declare-fun lt!158147 () (_ BitVec 64))

(assert (=> b!106438 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166))) lt!158147)))

(declare-fun lt!158167 () Unit!6520)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3940 array!4901 (_ BitVec 64)) Unit!6520)

(assert (=> b!106438 (= lt!158167 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4634 lt!158166) (buf!2612 (_2!4634 lt!158162)) lt!158147))))

(assert (=> b!106438 (= lt!158147 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!158148 () (_ BitVec 64))

(declare-fun lt!158159 () (_ BitVec 64))

(declare-fun lt!158163 () tuple2!8752)

(assert (=> b!106438 (= lt!158165 (bvor lt!158148 (ite (_2!4633 lt!158163) lt!158159 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!158149 () tuple2!8758)

(declare-fun lt!158153 () tuple2!8756)

(assert (=> b!106438 (= lt!158149 (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158153) nBits!396 i!615 lt!158148))))

(assert (=> b!106438 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305)) lt!158150)))

(declare-fun lt!158154 () Unit!6520)

(assert (=> b!106438 (= lt!158154 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2612 (_2!4634 lt!158162)) lt!158150))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106438 (= lt!158148 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!158157 () Bool)

(assert (=> b!106438 (= (_2!4633 lt!158163) lt!158157)))

(declare-fun readBitPure!0 (BitStream!3940) tuple2!8752)

(assert (=> b!106438 (= lt!158163 (readBitPure!0 (_1!4635 lt!158153)))))

(declare-fun reader!0 (BitStream!3940 BitStream!3940) tuple2!8756)

(assert (=> b!106438 (= lt!158152 (reader!0 (_2!4634 lt!158166) (_2!4634 lt!158162)))))

(assert (=> b!106438 (= lt!158153 (reader!0 thiss!1305 (_2!4634 lt!158162)))))

(assert (=> b!106438 e!69673))

(declare-fun res!87670 () Bool)

(assert (=> b!106438 (=> (not res!87670) (not e!69673))))

(assert (=> b!106438 (= res!87670 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158160))) (currentByte!5124 (_1!4633 lt!158160)) (currentBit!5119 (_1!4633 lt!158160))) (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158168))) (currentByte!5124 (_1!4633 lt!158168)) (currentBit!5119 (_1!4633 lt!158168)))))))

(declare-fun lt!158169 () Unit!6520)

(declare-fun lt!158161 () BitStream!3940)

(declare-fun readBitPrefixLemma!0 (BitStream!3940 BitStream!3940) Unit!6520)

(assert (=> b!106438 (= lt!158169 (readBitPrefixLemma!0 lt!158161 (_2!4634 lt!158162)))))

(assert (=> b!106438 (= lt!158168 (readBitPure!0 (BitStream!3941 (buf!2612 (_2!4634 lt!158162)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305))))))

(assert (=> b!106438 (= lt!158160 (readBitPure!0 lt!158161))))

(assert (=> b!106438 (= lt!158161 (BitStream!3941 (buf!2612 (_2!4634 lt!158166)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)))))

(declare-fun e!69677 () Bool)

(assert (=> b!106438 e!69677))

(declare-fun res!87673 () Bool)

(assert (=> b!106438 (=> (not res!87673) (not e!69677))))

(assert (=> b!106438 (= res!87673 (isPrefixOf!0 thiss!1305 (_2!4634 lt!158162)))))

(declare-fun lt!158170 () Unit!6520)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3940 BitStream!3940 BitStream!3940) Unit!6520)

(assert (=> b!106438 (= lt!158170 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4634 lt!158166) (_2!4634 lt!158162)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3940 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8754)

(assert (=> b!106438 (= lt!158162 (appendNLeastSignificantBitsLoop!0 (_2!4634 lt!158166) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!69678 () Bool)

(assert (=> b!106438 e!69678))

(declare-fun res!87674 () Bool)

(assert (=> b!106438 (=> (not res!87674) (not e!69678))))

(assert (=> b!106438 (= res!87674 (= (size!2233 (buf!2612 thiss!1305)) (size!2233 (buf!2612 (_2!4634 lt!158166)))))))

(declare-fun appendBit!0 (BitStream!3940 Bool) tuple2!8754)

(assert (=> b!106438 (= lt!158166 (appendBit!0 thiss!1305 lt!158157))))

(assert (=> b!106438 (= lt!158157 (not (= (bvand v!199 lt!158159) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106438 (= lt!158159 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!106439 () Bool)

(declare-fun res!87676 () Bool)

(assert (=> b!106439 (=> (not res!87676) (not e!69677))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106439 (= res!87676 (invariant!0 (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158166)))))))

(declare-fun b!106440 () Bool)

(declare-fun lt!158155 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!3940 (_ BitVec 64)) Bool)

(assert (=> b!106440 (= e!69679 (moveBitIndexPrecond!0 (_2!4635 lt!158152) (bvsub (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) lt!158155)))))

(declare-fun lt!158171 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3940 (_ BitVec 64)) BitStream!3940)

(assert (=> b!106440 (= (_1!4635 lt!158153) (withMovedBitIndex!0 (_2!4635 lt!158153) (bvsub lt!158171 lt!158155)))))

(assert (=> b!106440 (= lt!158155 (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158162))) (currentByte!5124 (_2!4634 lt!158162)) (currentBit!5119 (_2!4634 lt!158162))))))

(assert (=> b!106440 (= lt!158171 (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)))))

(declare-fun lt!158172 () tuple2!8758)

(assert (=> b!106440 (and (= (_2!4636 lt!158149) (_2!4636 lt!158172)) (= (_1!4636 lt!158149) (_1!4636 lt!158172)))))

(declare-fun lt!158164 () Unit!6520)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6520)

(assert (=> b!106440 (= lt!158164 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4635 lt!158153) nBits!396 i!615 lt!158148))))

(assert (=> b!106440 (= lt!158172 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4635 lt!158153) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158165))))

(declare-fun b!106441 () Bool)

(declare-fun res!87677 () Bool)

(assert (=> b!106441 (=> (not res!87677) (not e!69675))))

(assert (=> b!106441 (= res!87677 (bvslt i!615 nBits!396))))

(declare-fun b!106442 () Bool)

(assert (=> b!106442 (= e!69678 e!69681)))

(declare-fun res!87672 () Bool)

(assert (=> b!106442 (=> (not res!87672) (not e!69681))))

(declare-fun lt!158158 () (_ BitVec 64))

(assert (=> b!106442 (= res!87672 (= lt!158151 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!158158)))))

(assert (=> b!106442 (= lt!158151 (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))))))

(assert (=> b!106442 (= lt!158158 (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)))))

(declare-fun b!106443 () Bool)

(assert (=> b!106443 (= e!69677 (invariant!0 (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158162)))))))

(declare-fun b!106444 () Bool)

(assert (=> b!106444 (= e!69681 e!69674)))

(declare-fun res!87668 () Bool)

(assert (=> b!106444 (=> (not res!87668) (not e!69674))))

(assert (=> b!106444 (= res!87668 (and (= (_2!4633 lt!158156) lt!158157) (= (_1!4633 lt!158156) (_2!4634 lt!158166))))))

(declare-fun readerFrom!0 (BitStream!3940 (_ BitVec 32) (_ BitVec 32)) BitStream!3940)

(assert (=> b!106444 (= lt!158156 (readBitPure!0 (readerFrom!0 (_2!4634 lt!158166) (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305))))))

(declare-fun b!106445 () Bool)

(declare-fun res!87671 () Bool)

(assert (=> b!106445 (=> (not res!87671) (not e!69675))))

(assert (=> b!106445 (= res!87671 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!21112 res!87669) b!106434))

(assert (= (and b!106434 res!87675) b!106445))

(assert (= (and b!106445 res!87671) b!106441))

(assert (= (and b!106441 res!87677) b!106438))

(assert (= (and b!106438 res!87674) b!106442))

(assert (= (and b!106442 res!87672) b!106435))

(assert (= (and b!106435 res!87667) b!106444))

(assert (= (and b!106444 res!87668) b!106437))

(assert (= (and b!106438 res!87673) b!106439))

(assert (= (and b!106439 res!87676) b!106443))

(assert (= (and b!106438 res!87670) b!106433))

(assert (= (and b!106438 (not res!87678)) b!106440))

(assert (= start!21112 b!106436))

(declare-fun m!156735 () Bool)

(assert (=> b!106445 m!156735))

(declare-fun m!156737 () Bool)

(assert (=> b!106435 m!156737))

(declare-fun m!156739 () Bool)

(assert (=> b!106440 m!156739))

(declare-fun m!156741 () Bool)

(assert (=> b!106440 m!156741))

(declare-fun m!156743 () Bool)

(assert (=> b!106440 m!156743))

(declare-fun m!156745 () Bool)

(assert (=> b!106440 m!156745))

(declare-fun m!156747 () Bool)

(assert (=> b!106440 m!156747))

(assert (=> b!106440 m!156747))

(declare-fun m!156749 () Bool)

(assert (=> b!106440 m!156749))

(declare-fun m!156751 () Bool)

(assert (=> b!106440 m!156751))

(declare-fun m!156753 () Bool)

(assert (=> b!106440 m!156753))

(declare-fun m!156755 () Bool)

(assert (=> b!106439 m!156755))

(declare-fun m!156757 () Bool)

(assert (=> b!106434 m!156757))

(declare-fun m!156759 () Bool)

(assert (=> b!106437 m!156759))

(declare-fun m!156761 () Bool)

(assert (=> b!106443 m!156761))

(declare-fun m!156763 () Bool)

(assert (=> start!21112 m!156763))

(assert (=> b!106442 m!156753))

(assert (=> b!106442 m!156743))

(declare-fun m!156765 () Bool)

(assert (=> b!106436 m!156765))

(declare-fun m!156767 () Bool)

(assert (=> b!106444 m!156767))

(assert (=> b!106444 m!156767))

(declare-fun m!156769 () Bool)

(assert (=> b!106444 m!156769))

(declare-fun m!156771 () Bool)

(assert (=> b!106438 m!156771))

(declare-fun m!156773 () Bool)

(assert (=> b!106438 m!156773))

(declare-fun m!156775 () Bool)

(assert (=> b!106438 m!156775))

(declare-fun m!156777 () Bool)

(assert (=> b!106438 m!156777))

(declare-fun m!156779 () Bool)

(assert (=> b!106438 m!156779))

(declare-fun m!156781 () Bool)

(assert (=> b!106438 m!156781))

(declare-fun m!156783 () Bool)

(assert (=> b!106438 m!156783))

(declare-fun m!156785 () Bool)

(assert (=> b!106438 m!156785))

(declare-fun m!156787 () Bool)

(assert (=> b!106438 m!156787))

(declare-fun m!156789 () Bool)

(assert (=> b!106438 m!156789))

(declare-fun m!156791 () Bool)

(assert (=> b!106438 m!156791))

(declare-fun m!156793 () Bool)

(assert (=> b!106438 m!156793))

(declare-fun m!156795 () Bool)

(assert (=> b!106438 m!156795))

(declare-fun m!156797 () Bool)

(assert (=> b!106438 m!156797))

(declare-fun m!156799 () Bool)

(assert (=> b!106438 m!156799))

(declare-fun m!156801 () Bool)

(assert (=> b!106438 m!156801))

(declare-fun m!156803 () Bool)

(assert (=> b!106438 m!156803))

(declare-fun m!156805 () Bool)

(assert (=> b!106438 m!156805))

(declare-fun m!156807 () Bool)

(assert (=> b!106438 m!156807))

(push 1)

(assert (not b!106440))

(assert (not b!106443))

(assert (not b!106435))

(assert (not b!106445))

(assert (not b!106442))

(assert (not b!106439))

(assert (not b!106444))

(assert (not b!106437))

(assert (not b!106438))

(assert (not start!21112))

(assert (not b!106436))

(assert (not b!106434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33514 () Bool)

(declare-fun e!69744 () Bool)

(assert (=> d!33514 e!69744))

(declare-fun res!87755 () Bool)

(assert (=> d!33514 (=> (not res!87755) (not e!69744))))

(declare-fun lt!158344 () (_ BitVec 64))

(declare-fun lt!158345 () (_ BitVec 64))

(declare-fun lt!158342 () (_ BitVec 64))

(assert (=> d!33514 (= res!87755 (= lt!158345 (bvsub lt!158344 lt!158342)))))

(assert (=> d!33514 (or (= (bvand lt!158344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158344 lt!158342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33514 (= lt!158342 (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158166)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166)))))))

(declare-fun lt!158343 () (_ BitVec 64))

(declare-fun lt!158346 () (_ BitVec 64))

(assert (=> d!33514 (= lt!158344 (bvmul lt!158343 lt!158346))))

(assert (=> d!33514 (or (= lt!158343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158346 (bvsdiv (bvmul lt!158343 lt!158346) lt!158343)))))

(assert (=> d!33514 (= lt!158346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33514 (= lt!158343 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158166)))))))

(assert (=> d!33514 (= lt!158345 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166)))))))

(assert (=> d!33514 (invariant!0 (currentBit!5119 (_2!4634 lt!158166)) (currentByte!5124 (_2!4634 lt!158166)) (size!2233 (buf!2612 (_2!4634 lt!158166))))))

(assert (=> d!33514 (= (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) lt!158345)))

(declare-fun b!106528 () Bool)

(declare-fun res!87756 () Bool)

(assert (=> b!106528 (=> (not res!87756) (not e!69744))))

(assert (=> b!106528 (= res!87756 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158345))))

(declare-fun b!106529 () Bool)

(declare-fun lt!158341 () (_ BitVec 64))

(assert (=> b!106529 (= e!69744 (bvsle lt!158345 (bvmul lt!158341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106529 (or (= lt!158341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158341)))))

(assert (=> b!106529 (= lt!158341 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158166)))))))

(assert (= (and d!33514 res!87755) b!106528))

(assert (= (and b!106528 res!87756) b!106529))

(declare-fun m!156957 () Bool)

(assert (=> d!33514 m!156957))

(declare-fun m!156959 () Bool)

(assert (=> d!33514 m!156959))

(assert (=> b!106442 d!33514))

(declare-fun d!33516 () Bool)

(declare-fun e!69745 () Bool)

(assert (=> d!33516 e!69745))

(declare-fun res!87757 () Bool)

(assert (=> d!33516 (=> (not res!87757) (not e!69745))))

(declare-fun lt!158351 () (_ BitVec 64))

(declare-fun lt!158350 () (_ BitVec 64))

(declare-fun lt!158348 () (_ BitVec 64))

(assert (=> d!33516 (= res!87757 (= lt!158351 (bvsub lt!158350 lt!158348)))))

(assert (=> d!33516 (or (= (bvand lt!158350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158350 lt!158348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33516 (= lt!158348 (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 thiss!1305))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305))))))

(declare-fun lt!158349 () (_ BitVec 64))

(declare-fun lt!158352 () (_ BitVec 64))

(assert (=> d!33516 (= lt!158350 (bvmul lt!158349 lt!158352))))

(assert (=> d!33516 (or (= lt!158349 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158352 (bvsdiv (bvmul lt!158349 lt!158352) lt!158349)))))

(assert (=> d!33516 (= lt!158352 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33516 (= lt!158349 ((_ sign_extend 32) (size!2233 (buf!2612 thiss!1305))))))

(assert (=> d!33516 (= lt!158351 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5124 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5119 thiss!1305))))))

(assert (=> d!33516 (invariant!0 (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305) (size!2233 (buf!2612 thiss!1305)))))

(assert (=> d!33516 (= (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)) lt!158351)))

(declare-fun b!106530 () Bool)

(declare-fun res!87758 () Bool)

(assert (=> b!106530 (=> (not res!87758) (not e!69745))))

(assert (=> b!106530 (= res!87758 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158351))))

(declare-fun b!106531 () Bool)

(declare-fun lt!158347 () (_ BitVec 64))

(assert (=> b!106531 (= e!69745 (bvsle lt!158351 (bvmul lt!158347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106531 (or (= lt!158347 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158347 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158347)))))

(assert (=> b!106531 (= lt!158347 ((_ sign_extend 32) (size!2233 (buf!2612 thiss!1305))))))

(assert (= (and d!33516 res!87757) b!106530))

(assert (= (and b!106530 res!87758) b!106531))

(declare-fun m!156961 () Bool)

(assert (=> d!33516 m!156961))

(declare-fun m!156963 () Bool)

(assert (=> d!33516 m!156963))

(assert (=> b!106442 d!33516))

(declare-fun d!33518 () Bool)

(assert (=> d!33518 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305) (size!2233 (buf!2612 thiss!1305))))))

(declare-fun bs!8184 () Bool)

(assert (= bs!8184 d!33518))

(assert (=> bs!8184 m!156963))

(assert (=> start!21112 d!33518))

(declare-fun d!33520 () Bool)

(assert (=> d!33520 (= (invariant!0 (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158166)))) (and (bvsge (currentBit!5119 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5119 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5124 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158166)))) (and (= (currentBit!5119 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158166))))))))))

(assert (=> b!106439 d!33520))

(declare-fun d!33522 () Bool)

(declare-fun e!69748 () Bool)

(assert (=> d!33522 e!69748))

(declare-fun res!87761 () Bool)

(assert (=> d!33522 (=> (not res!87761) (not e!69748))))

(declare-fun lt!158357 () BitStream!3940)

(declare-fun lt!158358 () (_ BitVec 64))

(assert (=> d!33522 (= res!87761 (= (bvadd lt!158358 (bvsub lt!158171 lt!158155)) (bitIndex!0 (size!2233 (buf!2612 lt!158357)) (currentByte!5124 lt!158357) (currentBit!5119 lt!158357))))))

(assert (=> d!33522 (or (not (= (bvand lt!158358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158171 lt!158155) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!158358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!158358 (bvsub lt!158171 lt!158155)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33522 (= lt!158358 (bitIndex!0 (size!2233 (buf!2612 (_2!4635 lt!158153))) (currentByte!5124 (_2!4635 lt!158153)) (currentBit!5119 (_2!4635 lt!158153))))))

(declare-fun moveBitIndex!0 (BitStream!3940 (_ BitVec 64)) tuple2!8754)

(assert (=> d!33522 (= lt!158357 (_2!4634 (moveBitIndex!0 (_2!4635 lt!158153) (bvsub lt!158171 lt!158155))))))

(assert (=> d!33522 (moveBitIndexPrecond!0 (_2!4635 lt!158153) (bvsub lt!158171 lt!158155))))

(assert (=> d!33522 (= (withMovedBitIndex!0 (_2!4635 lt!158153) (bvsub lt!158171 lt!158155)) lt!158357)))

(declare-fun b!106534 () Bool)

(assert (=> b!106534 (= e!69748 (= (size!2233 (buf!2612 (_2!4635 lt!158153))) (size!2233 (buf!2612 lt!158357))))))

(assert (= (and d!33522 res!87761) b!106534))

(declare-fun m!156965 () Bool)

(assert (=> d!33522 m!156965))

(declare-fun m!156967 () Bool)

(assert (=> d!33522 m!156967))

(declare-fun m!156969 () Bool)

(assert (=> d!33522 m!156969))

(declare-fun m!156971 () Bool)

(assert (=> d!33522 m!156971))

(assert (=> b!106440 d!33522))

(declare-fun d!33524 () Bool)

(declare-fun res!87764 () Bool)

(declare-fun e!69751 () Bool)

(assert (=> d!33524 (=> (not res!87764) (not e!69751))))

(assert (=> d!33524 (= res!87764 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4635 lt!158152))))) (bvsub (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) lt!158155)) (bvsle (bvsub (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) lt!158155) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4635 lt!158152))))))))))

(assert (=> d!33524 (= (moveBitIndexPrecond!0 (_2!4635 lt!158152) (bvsub (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) lt!158155)) e!69751)))

(declare-fun b!106538 () Bool)

(declare-fun lt!158361 () (_ BitVec 64))

(assert (=> b!106538 (= e!69751 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158361) (bvsle lt!158361 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4635 lt!158152))))))))))

(assert (=> b!106538 (= lt!158361 (bvadd (bitIndex!0 (size!2233 (buf!2612 (_2!4635 lt!158152))) (currentByte!5124 (_2!4635 lt!158152)) (currentBit!5119 (_2!4635 lt!158152))) (bvsub (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) lt!158155)))))

(assert (= (and d!33524 res!87764) b!106538))

(declare-fun m!156973 () Bool)

(assert (=> b!106538 m!156973))

(assert (=> b!106440 d!33524))

(assert (=> b!106440 d!33514))

(declare-fun d!33526 () Bool)

(declare-fun e!69752 () Bool)

(assert (=> d!33526 e!69752))

(declare-fun res!87765 () Bool)

(assert (=> d!33526 (=> (not res!87765) (not e!69752))))

(declare-fun lt!158366 () (_ BitVec 64))

(declare-fun lt!158363 () (_ BitVec 64))

(declare-fun lt!158365 () (_ BitVec 64))

(assert (=> d!33526 (= res!87765 (= lt!158366 (bvsub lt!158365 lt!158363)))))

(assert (=> d!33526 (or (= (bvand lt!158365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158365 lt!158363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33526 (= lt!158363 (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158162))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158162)))))))

(declare-fun lt!158364 () (_ BitVec 64))

(declare-fun lt!158367 () (_ BitVec 64))

(assert (=> d!33526 (= lt!158365 (bvmul lt!158364 lt!158367))))

(assert (=> d!33526 (or (= lt!158364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158367 (bvsdiv (bvmul lt!158364 lt!158367) lt!158364)))))

(assert (=> d!33526 (= lt!158367 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33526 (= lt!158364 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))))))

(assert (=> d!33526 (= lt!158366 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158162))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158162)))))))

(assert (=> d!33526 (invariant!0 (currentBit!5119 (_2!4634 lt!158162)) (currentByte!5124 (_2!4634 lt!158162)) (size!2233 (buf!2612 (_2!4634 lt!158162))))))

(assert (=> d!33526 (= (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158162))) (currentByte!5124 (_2!4634 lt!158162)) (currentBit!5119 (_2!4634 lt!158162))) lt!158366)))

(declare-fun b!106539 () Bool)

(declare-fun res!87766 () Bool)

(assert (=> b!106539 (=> (not res!87766) (not e!69752))))

(assert (=> b!106539 (= res!87766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158366))))

(declare-fun b!106540 () Bool)

(declare-fun lt!158362 () (_ BitVec 64))

(assert (=> b!106540 (= e!69752 (bvsle lt!158366 (bvmul lt!158362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106540 (or (= lt!158362 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158362 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158362)))))

(assert (=> b!106540 (= lt!158362 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))))))

(assert (= (and d!33526 res!87765) b!106539))

(assert (= (and b!106539 res!87766) b!106540))

(declare-fun m!156975 () Bool)

(assert (=> d!33526 m!156975))

(declare-fun m!156977 () Bool)

(assert (=> d!33526 m!156977))

(assert (=> b!106440 d!33526))

(declare-fun d!33528 () Bool)

(declare-fun e!69753 () Bool)

(assert (=> d!33528 e!69753))

(declare-fun res!87767 () Bool)

(assert (=> d!33528 (=> (not res!87767) (not e!69753))))

(declare-fun lt!158369 () (_ BitVec 64))

(declare-fun lt!158368 () BitStream!3940)

(assert (=> d!33528 (= res!87767 (= (bvadd lt!158369 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2233 (buf!2612 lt!158368)) (currentByte!5124 lt!158368) (currentBit!5119 lt!158368))))))

(assert (=> d!33528 (or (not (= (bvand lt!158369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!158369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!158369 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33528 (= lt!158369 (bitIndex!0 (size!2233 (buf!2612 (_1!4635 lt!158153))) (currentByte!5124 (_1!4635 lt!158153)) (currentBit!5119 (_1!4635 lt!158153))))))

(assert (=> d!33528 (= lt!158368 (_2!4634 (moveBitIndex!0 (_1!4635 lt!158153) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33528 (moveBitIndexPrecond!0 (_1!4635 lt!158153) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33528 (= (withMovedBitIndex!0 (_1!4635 lt!158153) #b0000000000000000000000000000000000000000000000000000000000000001) lt!158368)))

(declare-fun b!106541 () Bool)

(assert (=> b!106541 (= e!69753 (= (size!2233 (buf!2612 (_1!4635 lt!158153))) (size!2233 (buf!2612 lt!158368))))))

(assert (= (and d!33528 res!87767) b!106541))

(declare-fun m!156979 () Bool)

(assert (=> d!33528 m!156979))

(declare-fun m!156981 () Bool)

(assert (=> d!33528 m!156981))

(declare-fun m!156983 () Bool)

(assert (=> d!33528 m!156983))

(declare-fun m!156985 () Bool)

(assert (=> d!33528 m!156985))

(assert (=> b!106440 d!33528))

(declare-fun d!33530 () Bool)

(declare-fun lt!158382 () tuple2!8758)

(declare-fun lt!158383 () tuple2!8758)

(assert (=> d!33530 (and (= (_2!4636 lt!158382) (_2!4636 lt!158383)) (= (_1!4636 lt!158382) (_1!4636 lt!158383)))))

(declare-fun lt!158385 () BitStream!3940)

(declare-fun lt!158386 () (_ BitVec 64))

(declare-fun lt!158384 () Unit!6520)

(declare-fun lt!158387 () Bool)

(declare-fun choose!45 (BitStream!3940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8758 tuple2!8758 BitStream!3940 (_ BitVec 64) Bool BitStream!3940 (_ BitVec 64) tuple2!8758 tuple2!8758 BitStream!3940 (_ BitVec 64)) Unit!6520)

(assert (=> d!33530 (= lt!158384 (choose!45 (_1!4635 lt!158153) nBits!396 i!615 lt!158148 lt!158382 (tuple2!8759 (_1!4636 lt!158382) (_2!4636 lt!158382)) (_1!4636 lt!158382) (_2!4636 lt!158382) lt!158387 lt!158385 lt!158386 lt!158383 (tuple2!8759 (_1!4636 lt!158383) (_2!4636 lt!158383)) (_1!4636 lt!158383) (_2!4636 lt!158383)))))

(assert (=> d!33530 (= lt!158383 (readNLeastSignificantBitsLoopPure!0 lt!158385 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!158386))))

(assert (=> d!33530 (= lt!158386 (bvor lt!158148 (ite lt!158387 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33530 (= lt!158385 (withMovedBitIndex!0 (_1!4635 lt!158153) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33530 (= lt!158387 (_2!4633 (readBitPure!0 (_1!4635 lt!158153))))))

(assert (=> d!33530 (= lt!158382 (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158153) nBits!396 i!615 lt!158148))))

(assert (=> d!33530 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4635 lt!158153) nBits!396 i!615 lt!158148) lt!158384)))

(declare-fun bs!8186 () Bool)

(assert (= bs!8186 d!33530))

(declare-fun m!156987 () Bool)

(assert (=> bs!8186 m!156987))

(assert (=> bs!8186 m!156747))

(declare-fun m!156989 () Bool)

(assert (=> bs!8186 m!156989))

(assert (=> bs!8186 m!156779))

(assert (=> bs!8186 m!156801))

(assert (=> b!106440 d!33530))

(declare-datatypes ((tuple2!8776 0))(
  ( (tuple2!8777 (_1!4645 (_ BitVec 64)) (_2!4645 BitStream!3940)) )
))
(declare-fun lt!158390 () tuple2!8776)

(declare-fun d!33532 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8776)

(assert (=> d!33532 (= lt!158390 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4635 lt!158153) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158165))))

(assert (=> d!33532 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4635 lt!158153) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158165) (tuple2!8759 (_2!4645 lt!158390) (_1!4645 lt!158390)))))

(declare-fun bs!8187 () Bool)

(assert (= bs!8187 d!33532))

(assert (=> bs!8187 m!156747))

(declare-fun m!156991 () Bool)

(assert (=> bs!8187 m!156991))

(assert (=> b!106440 d!33532))

(assert (=> b!106440 d!33516))

(declare-fun d!33534 () Bool)

(declare-fun lt!158391 () tuple2!8776)

(assert (=> d!33534 (= lt!158391 (readNLeastSignificantBitsLoop!0 (_1!4635 lt!158153) nBits!396 i!615 lt!158148))))

(assert (=> d!33534 (= (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158153) nBits!396 i!615 lt!158148) (tuple2!8759 (_2!4645 lt!158391) (_1!4645 lt!158391)))))

(declare-fun bs!8188 () Bool)

(assert (= bs!8188 d!33534))

(declare-fun m!156993 () Bool)

(assert (=> bs!8188 m!156993))

(assert (=> b!106438 d!33534))

(declare-fun d!33536 () Bool)

(declare-fun res!87775 () Bool)

(declare-fun e!69758 () Bool)

(assert (=> d!33536 (=> (not res!87775) (not e!69758))))

(assert (=> d!33536 (= res!87775 (= (size!2233 (buf!2612 thiss!1305)) (size!2233 (buf!2612 (_2!4634 lt!158162)))))))

(assert (=> d!33536 (= (isPrefixOf!0 thiss!1305 (_2!4634 lt!158162)) e!69758)))

(declare-fun b!106548 () Bool)

(declare-fun res!87774 () Bool)

(assert (=> b!106548 (=> (not res!87774) (not e!69758))))

(assert (=> b!106548 (= res!87774 (bvsle (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)) (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158162))) (currentByte!5124 (_2!4634 lt!158162)) (currentBit!5119 (_2!4634 lt!158162)))))))

(declare-fun b!106549 () Bool)

(declare-fun e!69759 () Bool)

(assert (=> b!106549 (= e!69758 e!69759)))

(declare-fun res!87776 () Bool)

(assert (=> b!106549 (=> res!87776 e!69759)))

(assert (=> b!106549 (= res!87776 (= (size!2233 (buf!2612 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106550 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4901 array!4901 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106550 (= e!69759 (arrayBitRangesEq!0 (buf!2612 thiss!1305) (buf!2612 (_2!4634 lt!158162)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305))))))

(assert (= (and d!33536 res!87775) b!106548))

(assert (= (and b!106548 res!87774) b!106549))

(assert (= (and b!106549 (not res!87776)) b!106550))

(assert (=> b!106548 m!156743))

(assert (=> b!106548 m!156745))

(assert (=> b!106550 m!156743))

(assert (=> b!106550 m!156743))

(declare-fun m!156995 () Bool)

(assert (=> b!106550 m!156995))

(assert (=> b!106438 d!33536))

(declare-fun b!106570 () Bool)

(declare-fun res!87792 () Bool)

(declare-fun e!69771 () Bool)

(assert (=> b!106570 (=> (not res!87792) (not e!69771))))

(declare-fun lt!158445 () tuple2!8756)

(assert (=> b!106570 (= res!87792 (isPrefixOf!0 (_1!4635 lt!158445) thiss!1305))))

(declare-fun b!106571 () Bool)

(declare-fun res!87793 () Bool)

(assert (=> b!106571 (=> (not res!87793) (not e!69771))))

(assert (=> b!106571 (= res!87793 (isPrefixOf!0 (_2!4635 lt!158445) (_2!4634 lt!158162)))))

(declare-fun d!33538 () Bool)

(assert (=> d!33538 e!69771))

(declare-fun res!87794 () Bool)

(assert (=> d!33538 (=> (not res!87794) (not e!69771))))

(assert (=> d!33538 (= res!87794 (isPrefixOf!0 (_1!4635 lt!158445) (_2!4635 lt!158445)))))

(declare-fun lt!158448 () BitStream!3940)

(assert (=> d!33538 (= lt!158445 (tuple2!8757 lt!158448 (_2!4634 lt!158162)))))

(declare-fun lt!158452 () Unit!6520)

(declare-fun lt!158439 () Unit!6520)

(assert (=> d!33538 (= lt!158452 lt!158439)))

(assert (=> d!33538 (isPrefixOf!0 lt!158448 (_2!4634 lt!158162))))

(assert (=> d!33538 (= lt!158439 (lemmaIsPrefixTransitive!0 lt!158448 (_2!4634 lt!158162) (_2!4634 lt!158162)))))

(declare-fun lt!158435 () Unit!6520)

(declare-fun lt!158449 () Unit!6520)

(assert (=> d!33538 (= lt!158435 lt!158449)))

(assert (=> d!33538 (isPrefixOf!0 lt!158448 (_2!4634 lt!158162))))

(assert (=> d!33538 (= lt!158449 (lemmaIsPrefixTransitive!0 lt!158448 thiss!1305 (_2!4634 lt!158162)))))

(declare-fun lt!158451 () Unit!6520)

(declare-fun e!69770 () Unit!6520)

(assert (=> d!33538 (= lt!158451 e!69770)))

(declare-fun c!6572 () Bool)

(assert (=> d!33538 (= c!6572 (not (= (size!2233 (buf!2612 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!158453 () Unit!6520)

(declare-fun lt!158436 () Unit!6520)

(assert (=> d!33538 (= lt!158453 lt!158436)))

(assert (=> d!33538 (isPrefixOf!0 (_2!4634 lt!158162) (_2!4634 lt!158162))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3940) Unit!6520)

(assert (=> d!33538 (= lt!158436 (lemmaIsPrefixRefl!0 (_2!4634 lt!158162)))))

(declare-fun lt!158442 () Unit!6520)

(declare-fun lt!158441 () Unit!6520)

(assert (=> d!33538 (= lt!158442 lt!158441)))

(assert (=> d!33538 (= lt!158441 (lemmaIsPrefixRefl!0 (_2!4634 lt!158162)))))

(declare-fun lt!158437 () Unit!6520)

(declare-fun lt!158446 () Unit!6520)

(assert (=> d!33538 (= lt!158437 lt!158446)))

(assert (=> d!33538 (isPrefixOf!0 lt!158448 lt!158448)))

(assert (=> d!33538 (= lt!158446 (lemmaIsPrefixRefl!0 lt!158448))))

(declare-fun lt!158447 () Unit!6520)

(declare-fun lt!158450 () Unit!6520)

(assert (=> d!33538 (= lt!158447 lt!158450)))

(assert (=> d!33538 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33538 (= lt!158450 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33538 (= lt!158448 (BitStream!3941 (buf!2612 (_2!4634 lt!158162)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)))))

(assert (=> d!33538 (isPrefixOf!0 thiss!1305 (_2!4634 lt!158162))))

(assert (=> d!33538 (= (reader!0 thiss!1305 (_2!4634 lt!158162)) lt!158445)))

(declare-fun b!106572 () Bool)

(declare-fun lt!158438 () (_ BitVec 64))

(declare-fun lt!158440 () (_ BitVec 64))

(assert (=> b!106572 (= e!69771 (= (_1!4635 lt!158445) (withMovedBitIndex!0 (_2!4635 lt!158445) (bvsub lt!158438 lt!158440))))))

(assert (=> b!106572 (or (= (bvand lt!158438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158440 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158438 lt!158440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106572 (= lt!158440 (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158162))) (currentByte!5124 (_2!4634 lt!158162)) (currentBit!5119 (_2!4634 lt!158162))))))

(assert (=> b!106572 (= lt!158438 (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)))))

(declare-fun b!106573 () Bool)

(declare-fun Unit!6526 () Unit!6520)

(assert (=> b!106573 (= e!69770 Unit!6526)))

(declare-fun b!106574 () Bool)

(declare-fun lt!158444 () Unit!6520)

(assert (=> b!106574 (= e!69770 lt!158444)))

(declare-fun lt!158443 () (_ BitVec 64))

(assert (=> b!106574 (= lt!158443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158434 () (_ BitVec 64))

(assert (=> b!106574 (= lt!158434 (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4901 array!4901 (_ BitVec 64) (_ BitVec 64)) Unit!6520)

(assert (=> b!106574 (= lt!158444 (arrayBitRangesEqSymmetric!0 (buf!2612 thiss!1305) (buf!2612 (_2!4634 lt!158162)) lt!158443 lt!158434))))

(assert (=> b!106574 (arrayBitRangesEq!0 (buf!2612 (_2!4634 lt!158162)) (buf!2612 thiss!1305) lt!158443 lt!158434)))

(assert (= (and d!33538 c!6572) b!106574))

(assert (= (and d!33538 (not c!6572)) b!106573))

(assert (= (and d!33538 res!87794) b!106570))

(assert (= (and b!106570 res!87792) b!106571))

(assert (= (and b!106571 res!87793) b!106572))

(declare-fun m!157003 () Bool)

(assert (=> b!106570 m!157003))

(assert (=> b!106574 m!156743))

(declare-fun m!157005 () Bool)

(assert (=> b!106574 m!157005))

(declare-fun m!157007 () Bool)

(assert (=> b!106574 m!157007))

(declare-fun m!157009 () Bool)

(assert (=> b!106571 m!157009))

(declare-fun m!157011 () Bool)

(assert (=> b!106572 m!157011))

(assert (=> b!106572 m!156745))

(assert (=> b!106572 m!156743))

(declare-fun m!157013 () Bool)

(assert (=> d!33538 m!157013))

(assert (=> d!33538 m!156771))

(declare-fun m!157015 () Bool)

(assert (=> d!33538 m!157015))

(declare-fun m!157017 () Bool)

(assert (=> d!33538 m!157017))

(declare-fun m!157019 () Bool)

(assert (=> d!33538 m!157019))

(declare-fun m!157021 () Bool)

(assert (=> d!33538 m!157021))

(declare-fun m!157023 () Bool)

(assert (=> d!33538 m!157023))

(declare-fun m!157025 () Bool)

(assert (=> d!33538 m!157025))

(declare-fun m!157027 () Bool)

(assert (=> d!33538 m!157027))

(declare-fun m!157029 () Bool)

(assert (=> d!33538 m!157029))

(declare-fun m!157031 () Bool)

(assert (=> d!33538 m!157031))

(assert (=> b!106438 d!33538))

(declare-fun b!106575 () Bool)

(declare-fun res!87795 () Bool)

(declare-fun e!69773 () Bool)

(assert (=> b!106575 (=> (not res!87795) (not e!69773))))

(declare-fun lt!158466 () tuple2!8756)

(assert (=> b!106575 (= res!87795 (isPrefixOf!0 (_1!4635 lt!158466) (_2!4634 lt!158166)))))

(declare-fun b!106576 () Bool)

(declare-fun res!87796 () Bool)

(assert (=> b!106576 (=> (not res!87796) (not e!69773))))

(assert (=> b!106576 (= res!87796 (isPrefixOf!0 (_2!4635 lt!158466) (_2!4634 lt!158162)))))

(declare-fun d!33550 () Bool)

(assert (=> d!33550 e!69773))

(declare-fun res!87797 () Bool)

(assert (=> d!33550 (=> (not res!87797) (not e!69773))))

(assert (=> d!33550 (= res!87797 (isPrefixOf!0 (_1!4635 lt!158466) (_2!4635 lt!158466)))))

(declare-fun lt!158469 () BitStream!3940)

(assert (=> d!33550 (= lt!158466 (tuple2!8757 lt!158469 (_2!4634 lt!158162)))))

(declare-fun lt!158473 () Unit!6520)

(declare-fun lt!158460 () Unit!6520)

(assert (=> d!33550 (= lt!158473 lt!158460)))

(assert (=> d!33550 (isPrefixOf!0 lt!158469 (_2!4634 lt!158162))))

(assert (=> d!33550 (= lt!158460 (lemmaIsPrefixTransitive!0 lt!158469 (_2!4634 lt!158162) (_2!4634 lt!158162)))))

(declare-fun lt!158456 () Unit!6520)

(declare-fun lt!158470 () Unit!6520)

(assert (=> d!33550 (= lt!158456 lt!158470)))

(assert (=> d!33550 (isPrefixOf!0 lt!158469 (_2!4634 lt!158162))))

(assert (=> d!33550 (= lt!158470 (lemmaIsPrefixTransitive!0 lt!158469 (_2!4634 lt!158166) (_2!4634 lt!158162)))))

(declare-fun lt!158472 () Unit!6520)

(declare-fun e!69772 () Unit!6520)

(assert (=> d!33550 (= lt!158472 e!69772)))

(declare-fun c!6573 () Bool)

(assert (=> d!33550 (= c!6573 (not (= (size!2233 (buf!2612 (_2!4634 lt!158166))) #b00000000000000000000000000000000)))))

(declare-fun lt!158474 () Unit!6520)

(declare-fun lt!158457 () Unit!6520)

(assert (=> d!33550 (= lt!158474 lt!158457)))

(assert (=> d!33550 (isPrefixOf!0 (_2!4634 lt!158162) (_2!4634 lt!158162))))

(assert (=> d!33550 (= lt!158457 (lemmaIsPrefixRefl!0 (_2!4634 lt!158162)))))

(declare-fun lt!158463 () Unit!6520)

(declare-fun lt!158462 () Unit!6520)

(assert (=> d!33550 (= lt!158463 lt!158462)))

(assert (=> d!33550 (= lt!158462 (lemmaIsPrefixRefl!0 (_2!4634 lt!158162)))))

(declare-fun lt!158458 () Unit!6520)

(declare-fun lt!158467 () Unit!6520)

(assert (=> d!33550 (= lt!158458 lt!158467)))

(assert (=> d!33550 (isPrefixOf!0 lt!158469 lt!158469)))

(assert (=> d!33550 (= lt!158467 (lemmaIsPrefixRefl!0 lt!158469))))

(declare-fun lt!158468 () Unit!6520)

(declare-fun lt!158471 () Unit!6520)

(assert (=> d!33550 (= lt!158468 lt!158471)))

(assert (=> d!33550 (isPrefixOf!0 (_2!4634 lt!158166) (_2!4634 lt!158166))))

(assert (=> d!33550 (= lt!158471 (lemmaIsPrefixRefl!0 (_2!4634 lt!158166)))))

(assert (=> d!33550 (= lt!158469 (BitStream!3941 (buf!2612 (_2!4634 lt!158162)) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))))))

(assert (=> d!33550 (isPrefixOf!0 (_2!4634 lt!158166) (_2!4634 lt!158162))))

(assert (=> d!33550 (= (reader!0 (_2!4634 lt!158166) (_2!4634 lt!158162)) lt!158466)))

(declare-fun lt!158459 () (_ BitVec 64))

(declare-fun b!106577 () Bool)

(declare-fun lt!158461 () (_ BitVec 64))

(assert (=> b!106577 (= e!69773 (= (_1!4635 lt!158466) (withMovedBitIndex!0 (_2!4635 lt!158466) (bvsub lt!158459 lt!158461))))))

(assert (=> b!106577 (or (= (bvand lt!158459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158459 lt!158461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106577 (= lt!158461 (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158162))) (currentByte!5124 (_2!4634 lt!158162)) (currentBit!5119 (_2!4634 lt!158162))))))

(assert (=> b!106577 (= lt!158459 (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))))))

(declare-fun b!106578 () Bool)

(declare-fun Unit!6527 () Unit!6520)

(assert (=> b!106578 (= e!69772 Unit!6527)))

(declare-fun b!106579 () Bool)

(declare-fun lt!158465 () Unit!6520)

(assert (=> b!106579 (= e!69772 lt!158465)))

(declare-fun lt!158464 () (_ BitVec 64))

(assert (=> b!106579 (= lt!158464 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158455 () (_ BitVec 64))

(assert (=> b!106579 (= lt!158455 (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))))))

(assert (=> b!106579 (= lt!158465 (arrayBitRangesEqSymmetric!0 (buf!2612 (_2!4634 lt!158166)) (buf!2612 (_2!4634 lt!158162)) lt!158464 lt!158455))))

(assert (=> b!106579 (arrayBitRangesEq!0 (buf!2612 (_2!4634 lt!158162)) (buf!2612 (_2!4634 lt!158166)) lt!158464 lt!158455)))

(assert (= (and d!33550 c!6573) b!106579))

(assert (= (and d!33550 (not c!6573)) b!106578))

(assert (= (and d!33550 res!87797) b!106575))

(assert (= (and b!106575 res!87795) b!106576))

(assert (= (and b!106576 res!87796) b!106577))

(declare-fun m!157033 () Bool)

(assert (=> b!106575 m!157033))

(assert (=> b!106579 m!156753))

(declare-fun m!157035 () Bool)

(assert (=> b!106579 m!157035))

(declare-fun m!157037 () Bool)

(assert (=> b!106579 m!157037))

(declare-fun m!157039 () Bool)

(assert (=> b!106576 m!157039))

(declare-fun m!157041 () Bool)

(assert (=> b!106577 m!157041))

(assert (=> b!106577 m!156745))

(assert (=> b!106577 m!156753))

(declare-fun m!157043 () Bool)

(assert (=> d!33550 m!157043))

(declare-fun m!157045 () Bool)

(assert (=> d!33550 m!157045))

(declare-fun m!157047 () Bool)

(assert (=> d!33550 m!157047))

(declare-fun m!157049 () Bool)

(assert (=> d!33550 m!157049))

(declare-fun m!157051 () Bool)

(assert (=> d!33550 m!157051))

(assert (=> d!33550 m!157021))

(declare-fun m!157053 () Bool)

(assert (=> d!33550 m!157053))

(declare-fun m!157055 () Bool)

(assert (=> d!33550 m!157055))

(declare-fun m!157057 () Bool)

(assert (=> d!33550 m!157057))

(assert (=> d!33550 m!157029))

(declare-fun m!157059 () Bool)

(assert (=> d!33550 m!157059))

(assert (=> b!106438 d!33550))

(declare-fun d!33552 () Bool)

(declare-datatypes ((tuple2!8778 0))(
  ( (tuple2!8779 (_1!4646 Bool) (_2!4646 BitStream!3940)) )
))
(declare-fun lt!158477 () tuple2!8778)

(declare-fun readBit!0 (BitStream!3940) tuple2!8778)

(assert (=> d!33552 (= lt!158477 (readBit!0 lt!158161))))

(assert (=> d!33552 (= (readBitPure!0 lt!158161) (tuple2!8753 (_2!4646 lt!158477) (_1!4646 lt!158477)))))

(declare-fun bs!8191 () Bool)

(assert (= bs!8191 d!33552))

(declare-fun m!157061 () Bool)

(assert (=> bs!8191 m!157061))

(assert (=> b!106438 d!33552))

(declare-fun d!33554 () Bool)

(declare-fun e!69776 () Bool)

(assert (=> d!33554 e!69776))

(declare-fun res!87800 () Bool)

(assert (=> d!33554 (=> (not res!87800) (not e!69776))))

(declare-fun lt!158487 () tuple2!8752)

(declare-fun lt!158488 () tuple2!8752)

(assert (=> d!33554 (= res!87800 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158487))) (currentByte!5124 (_1!4633 lt!158487)) (currentBit!5119 (_1!4633 lt!158487))) (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158488))) (currentByte!5124 (_1!4633 lt!158488)) (currentBit!5119 (_1!4633 lt!158488)))))))

(declare-fun lt!158489 () BitStream!3940)

(declare-fun lt!158486 () Unit!6520)

(declare-fun choose!50 (BitStream!3940 BitStream!3940 BitStream!3940 tuple2!8752 tuple2!8752 BitStream!3940 Bool tuple2!8752 tuple2!8752 BitStream!3940 Bool) Unit!6520)

(assert (=> d!33554 (= lt!158486 (choose!50 lt!158161 (_2!4634 lt!158162) lt!158489 lt!158487 (tuple2!8753 (_1!4633 lt!158487) (_2!4633 lt!158487)) (_1!4633 lt!158487) (_2!4633 lt!158487) lt!158488 (tuple2!8753 (_1!4633 lt!158488) (_2!4633 lt!158488)) (_1!4633 lt!158488) (_2!4633 lt!158488)))))

(assert (=> d!33554 (= lt!158488 (readBitPure!0 lt!158489))))

(assert (=> d!33554 (= lt!158487 (readBitPure!0 lt!158161))))

(assert (=> d!33554 (= lt!158489 (BitStream!3941 (buf!2612 (_2!4634 lt!158162)) (currentByte!5124 lt!158161) (currentBit!5119 lt!158161)))))

(assert (=> d!33554 (invariant!0 (currentBit!5119 lt!158161) (currentByte!5124 lt!158161) (size!2233 (buf!2612 (_2!4634 lt!158162))))))

(assert (=> d!33554 (= (readBitPrefixLemma!0 lt!158161 (_2!4634 lt!158162)) lt!158486)))

(declare-fun b!106582 () Bool)

(assert (=> b!106582 (= e!69776 (= (_2!4633 lt!158487) (_2!4633 lt!158488)))))

(assert (= (and d!33554 res!87800) b!106582))

(declare-fun m!157063 () Bool)

(assert (=> d!33554 m!157063))

(declare-fun m!157065 () Bool)

(assert (=> d!33554 m!157065))

(declare-fun m!157067 () Bool)

(assert (=> d!33554 m!157067))

(declare-fun m!157069 () Bool)

(assert (=> d!33554 m!157069))

(assert (=> d!33554 m!156803))

(declare-fun m!157071 () Bool)

(assert (=> d!33554 m!157071))

(assert (=> b!106438 d!33554))

(declare-fun d!33556 () Bool)

(assert (=> d!33556 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305)) lt!158150)))

(declare-fun lt!158492 () Unit!6520)

(declare-fun choose!9 (BitStream!3940 array!4901 (_ BitVec 64) BitStream!3940) Unit!6520)

(assert (=> d!33556 (= lt!158492 (choose!9 thiss!1305 (buf!2612 (_2!4634 lt!158162)) lt!158150 (BitStream!3941 (buf!2612 (_2!4634 lt!158162)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305))))))

(assert (=> d!33556 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2612 (_2!4634 lt!158162)) lt!158150) lt!158492)))

(declare-fun bs!8192 () Bool)

(assert (= bs!8192 d!33556))

(assert (=> bs!8192 m!156805))

(declare-fun m!157073 () Bool)

(assert (=> bs!8192 m!157073))

(assert (=> b!106438 d!33556))

(declare-fun d!33558 () Bool)

(declare-fun lt!158493 () tuple2!8778)

(assert (=> d!33558 (= lt!158493 (readBit!0 (_1!4635 lt!158153)))))

(assert (=> d!33558 (= (readBitPure!0 (_1!4635 lt!158153)) (tuple2!8753 (_2!4646 lt!158493) (_1!4646 lt!158493)))))

(declare-fun bs!8193 () Bool)

(assert (= bs!8193 d!33558))

(declare-fun m!157075 () Bool)

(assert (=> bs!8193 m!157075))

(assert (=> b!106438 d!33558))

(declare-fun d!33560 () Bool)

(declare-fun lt!158494 () tuple2!8778)

(assert (=> d!33560 (= lt!158494 (readBit!0 (BitStream!3941 (buf!2612 (_2!4634 lt!158162)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305))))))

(assert (=> d!33560 (= (readBitPure!0 (BitStream!3941 (buf!2612 (_2!4634 lt!158162)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305))) (tuple2!8753 (_2!4646 lt!158494) (_1!4646 lt!158494)))))

(declare-fun bs!8194 () Bool)

(assert (= bs!8194 d!33560))

(declare-fun m!157077 () Bool)

(assert (=> bs!8194 m!157077))

(assert (=> b!106438 d!33560))

(declare-fun d!33562 () Bool)

(assert (=> d!33562 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!106438 d!33562))

(declare-fun d!33564 () Bool)

(declare-fun e!69777 () Bool)

(assert (=> d!33564 e!69777))

(declare-fun res!87801 () Bool)

(assert (=> d!33564 (=> (not res!87801) (not e!69777))))

(declare-fun lt!158498 () (_ BitVec 64))

(declare-fun lt!158496 () (_ BitVec 64))

(declare-fun lt!158499 () (_ BitVec 64))

(assert (=> d!33564 (= res!87801 (= lt!158499 (bvsub lt!158498 lt!158496)))))

(assert (=> d!33564 (or (= (bvand lt!158498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158496 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158498 lt!158496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33564 (= lt!158496 (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158160)))) ((_ sign_extend 32) (currentByte!5124 (_1!4633 lt!158160))) ((_ sign_extend 32) (currentBit!5119 (_1!4633 lt!158160)))))))

(declare-fun lt!158497 () (_ BitVec 64))

(declare-fun lt!158500 () (_ BitVec 64))

(assert (=> d!33564 (= lt!158498 (bvmul lt!158497 lt!158500))))

(assert (=> d!33564 (or (= lt!158497 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158500 (bvsdiv (bvmul lt!158497 lt!158500) lt!158497)))))

(assert (=> d!33564 (= lt!158500 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33564 (= lt!158497 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158160)))))))

(assert (=> d!33564 (= lt!158499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5124 (_1!4633 lt!158160))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5119 (_1!4633 lt!158160)))))))

(assert (=> d!33564 (invariant!0 (currentBit!5119 (_1!4633 lt!158160)) (currentByte!5124 (_1!4633 lt!158160)) (size!2233 (buf!2612 (_1!4633 lt!158160))))))

(assert (=> d!33564 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158160))) (currentByte!5124 (_1!4633 lt!158160)) (currentBit!5119 (_1!4633 lt!158160))) lt!158499)))

(declare-fun b!106583 () Bool)

(declare-fun res!87802 () Bool)

(assert (=> b!106583 (=> (not res!87802) (not e!69777))))

(assert (=> b!106583 (= res!87802 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158499))))

(declare-fun b!106584 () Bool)

(declare-fun lt!158495 () (_ BitVec 64))

(assert (=> b!106584 (= e!69777 (bvsle lt!158499 (bvmul lt!158495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106584 (or (= lt!158495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158495)))))

(assert (=> b!106584 (= lt!158495 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158160)))))))

(assert (= (and d!33564 res!87801) b!106583))

(assert (= (and b!106583 res!87802) b!106584))

(declare-fun m!157079 () Bool)

(assert (=> d!33564 m!157079))

(declare-fun m!157081 () Bool)

(assert (=> d!33564 m!157081))

(assert (=> b!106438 d!33564))

(declare-fun d!33566 () Bool)

(declare-fun e!69778 () Bool)

(assert (=> d!33566 e!69778))

(declare-fun res!87803 () Bool)

(assert (=> d!33566 (=> (not res!87803) (not e!69778))))

(declare-fun lt!158502 () (_ BitVec 64))

(declare-fun lt!158504 () (_ BitVec 64))

(declare-fun lt!158505 () (_ BitVec 64))

(assert (=> d!33566 (= res!87803 (= lt!158505 (bvsub lt!158504 lt!158502)))))

(assert (=> d!33566 (or (= (bvand lt!158504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158504 lt!158502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33566 (= lt!158502 (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158168)))) ((_ sign_extend 32) (currentByte!5124 (_1!4633 lt!158168))) ((_ sign_extend 32) (currentBit!5119 (_1!4633 lt!158168)))))))

(declare-fun lt!158503 () (_ BitVec 64))

(declare-fun lt!158506 () (_ BitVec 64))

(assert (=> d!33566 (= lt!158504 (bvmul lt!158503 lt!158506))))

(assert (=> d!33566 (or (= lt!158503 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158506 (bvsdiv (bvmul lt!158503 lt!158506) lt!158503)))))

(assert (=> d!33566 (= lt!158506 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33566 (= lt!158503 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158168)))))))

(assert (=> d!33566 (= lt!158505 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5124 (_1!4633 lt!158168))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5119 (_1!4633 lt!158168)))))))

(assert (=> d!33566 (invariant!0 (currentBit!5119 (_1!4633 lt!158168)) (currentByte!5124 (_1!4633 lt!158168)) (size!2233 (buf!2612 (_1!4633 lt!158168))))))

(assert (=> d!33566 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158168))) (currentByte!5124 (_1!4633 lt!158168)) (currentBit!5119 (_1!4633 lt!158168))) lt!158505)))

(declare-fun b!106585 () Bool)

(declare-fun res!87804 () Bool)

(assert (=> b!106585 (=> (not res!87804) (not e!69778))))

(assert (=> b!106585 (= res!87804 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158505))))

(declare-fun b!106586 () Bool)

(declare-fun lt!158501 () (_ BitVec 64))

(assert (=> b!106586 (= e!69778 (bvsle lt!158505 (bvmul lt!158501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106586 (or (= lt!158501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158501)))))

(assert (=> b!106586 (= lt!158501 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158168)))))))

(assert (= (and d!33566 res!87803) b!106585))

(assert (= (and b!106585 res!87804) b!106586))

(declare-fun m!157083 () Bool)

(assert (=> d!33566 m!157083))

(declare-fun m!157085 () Bool)

(assert (=> d!33566 m!157085))

(assert (=> b!106438 d!33566))

(declare-fun b!106657 () Bool)

(declare-fun e!69820 () (_ BitVec 64))

(assert (=> b!106657 (= e!69820 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!106658 () Bool)

(declare-fun e!69817 () Bool)

(declare-fun lt!158770 () tuple2!8752)

(declare-fun lt!158776 () tuple2!8754)

(assert (=> b!106658 (= e!69817 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158770))) (currentByte!5124 (_1!4633 lt!158770)) (currentBit!5119 (_1!4633 lt!158770))) (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158776))) (currentByte!5124 (_2!4634 lt!158776)) (currentBit!5119 (_2!4634 lt!158776)))))))

(declare-fun d!33568 () Bool)

(declare-fun e!69819 () Bool)

(assert (=> d!33568 e!69819))

(declare-fun res!87860 () Bool)

(assert (=> d!33568 (=> (not res!87860) (not e!69819))))

(declare-fun lt!158749 () tuple2!8754)

(assert (=> d!33568 (= res!87860 (= (size!2233 (buf!2612 (_2!4634 lt!158166))) (size!2233 (buf!2612 (_2!4634 lt!158749)))))))

(declare-fun e!69818 () tuple2!8754)

(assert (=> d!33568 (= lt!158749 e!69818)))

(declare-fun c!6582 () Bool)

(assert (=> d!33568 (= c!6582 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33568 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33568 (= (appendNLeastSignificantBitsLoop!0 (_2!4634 lt!158166) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!158749)))

(declare-fun b!106659 () Bool)

(assert (=> b!106659 (= lt!158770 (readBitPure!0 (readerFrom!0 (_2!4634 lt!158776) (currentBit!5119 (_2!4634 lt!158166)) (currentByte!5124 (_2!4634 lt!158166)))))))

(declare-fun lt!158755 () Bool)

(declare-fun res!87866 () Bool)

(assert (=> b!106659 (= res!87866 (and (= (_2!4633 lt!158770) lt!158755) (= (_1!4633 lt!158770) (_2!4634 lt!158776))))))

(assert (=> b!106659 (=> (not res!87866) (not e!69817))))

(declare-fun e!69816 () Bool)

(assert (=> b!106659 (= e!69816 e!69817)))

(declare-fun b!106660 () Bool)

(declare-fun e!69814 () Bool)

(declare-fun lt!158782 () tuple2!8752)

(declare-fun lt!158780 () tuple2!8752)

(assert (=> b!106660 (= e!69814 (= (_2!4633 lt!158782) (_2!4633 lt!158780)))))

(declare-fun bm!1341 () Bool)

(declare-fun call!1344 () Bool)

(declare-fun lt!158768 () BitStream!3940)

(assert (=> bm!1341 (= call!1344 (isPrefixOf!0 (ite c!6582 (_2!4634 lt!158166) lt!158768) (ite c!6582 (_2!4634 lt!158776) lt!158768)))))

(declare-fun b!106661 () Bool)

(declare-fun res!87858 () Bool)

(assert (=> b!106661 (=> (not res!87858) (not e!69819))))

(assert (=> b!106661 (= res!87858 (isPrefixOf!0 (_2!4634 lt!158166) (_2!4634 lt!158749)))))

(declare-fun b!106662 () Bool)

(declare-fun e!69815 () Bool)

(declare-fun lt!158779 () (_ BitVec 64))

(assert (=> b!106662 (= e!69815 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158166)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166))) lt!158779))))

(declare-fun b!106663 () Bool)

(declare-fun lt!158747 () Unit!6520)

(assert (=> b!106663 (= e!69818 (tuple2!8755 lt!158747 (_2!4634 lt!158166)))))

(assert (=> b!106663 (= lt!158768 (_2!4634 lt!158166))))

(assert (=> b!106663 (= lt!158747 (lemmaIsPrefixRefl!0 lt!158768))))

(assert (=> b!106663 call!1344))

(declare-fun b!106664 () Bool)

(declare-fun res!87863 () Bool)

(assert (=> b!106664 (=> (not res!87863) (not e!69819))))

(declare-fun lt!158756 () (_ BitVec 64))

(declare-fun lt!158742 () (_ BitVec 64))

(assert (=> b!106664 (= res!87863 (= (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158749))) (currentByte!5124 (_2!4634 lt!158749)) (currentBit!5119 (_2!4634 lt!158749))) (bvadd lt!158742 lt!158756)))))

(assert (=> b!106664 (or (not (= (bvand lt!158742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158756 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!158742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!158742 lt!158756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106664 (= lt!158756 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106664 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106664 (= lt!158742 (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))))))

(declare-fun b!106665 () Bool)

(declare-fun res!87861 () Bool)

(assert (=> b!106665 (= res!87861 call!1344)))

(assert (=> b!106665 (=> (not res!87861) (not e!69816))))

(declare-fun b!106666 () Bool)

(declare-fun lt!158764 () tuple2!8754)

(declare-fun Unit!6528 () Unit!6520)

(assert (=> b!106666 (= e!69818 (tuple2!8755 Unit!6528 (_2!4634 lt!158764)))))

(assert (=> b!106666 (= lt!158755 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106666 (= lt!158776 (appendBit!0 (_2!4634 lt!158166) lt!158755))))

(declare-fun res!87865 () Bool)

(assert (=> b!106666 (= res!87865 (= (size!2233 (buf!2612 (_2!4634 lt!158166))) (size!2233 (buf!2612 (_2!4634 lt!158776)))))))

(assert (=> b!106666 (=> (not res!87865) (not e!69816))))

(assert (=> b!106666 e!69816))

(declare-fun lt!158761 () tuple2!8754)

(assert (=> b!106666 (= lt!158761 lt!158776)))

(assert (=> b!106666 (= lt!158764 (appendNLeastSignificantBitsLoop!0 (_2!4634 lt!158761) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!158752 () Unit!6520)

(assert (=> b!106666 (= lt!158752 (lemmaIsPrefixTransitive!0 (_2!4634 lt!158166) (_2!4634 lt!158761) (_2!4634 lt!158764)))))

(assert (=> b!106666 (isPrefixOf!0 (_2!4634 lt!158166) (_2!4634 lt!158764))))

(declare-fun lt!158775 () Unit!6520)

(assert (=> b!106666 (= lt!158775 lt!158752)))

(assert (=> b!106666 (invariant!0 (currentBit!5119 (_2!4634 lt!158166)) (currentByte!5124 (_2!4634 lt!158166)) (size!2233 (buf!2612 (_2!4634 lt!158761))))))

(declare-fun lt!158739 () BitStream!3940)

(assert (=> b!106666 (= lt!158739 (BitStream!3941 (buf!2612 (_2!4634 lt!158761)) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))))))

(assert (=> b!106666 (invariant!0 (currentBit!5119 lt!158739) (currentByte!5124 lt!158739) (size!2233 (buf!2612 (_2!4634 lt!158764))))))

(declare-fun lt!158754 () BitStream!3940)

(assert (=> b!106666 (= lt!158754 (BitStream!3941 (buf!2612 (_2!4634 lt!158764)) (currentByte!5124 lt!158739) (currentBit!5119 lt!158739)))))

(assert (=> b!106666 (= lt!158782 (readBitPure!0 lt!158739))))

(assert (=> b!106666 (= lt!158780 (readBitPure!0 lt!158754))))

(declare-fun lt!158767 () Unit!6520)

(assert (=> b!106666 (= lt!158767 (readBitPrefixLemma!0 lt!158739 (_2!4634 lt!158764)))))

(declare-fun res!87862 () Bool)

(assert (=> b!106666 (= res!87862 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158782))) (currentByte!5124 (_1!4633 lt!158782)) (currentBit!5119 (_1!4633 lt!158782))) (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158780))) (currentByte!5124 (_1!4633 lt!158780)) (currentBit!5119 (_1!4633 lt!158780)))))))

(assert (=> b!106666 (=> (not res!87862) (not e!69814))))

(assert (=> b!106666 e!69814))

(declare-fun lt!158772 () Unit!6520)

(assert (=> b!106666 (= lt!158772 lt!158767)))

(declare-fun lt!158753 () tuple2!8756)

(assert (=> b!106666 (= lt!158753 (reader!0 (_2!4634 lt!158166) (_2!4634 lt!158764)))))

(declare-fun lt!158777 () tuple2!8756)

(assert (=> b!106666 (= lt!158777 (reader!0 (_2!4634 lt!158761) (_2!4634 lt!158764)))))

(declare-fun lt!158773 () tuple2!8752)

(assert (=> b!106666 (= lt!158773 (readBitPure!0 (_1!4635 lt!158753)))))

(assert (=> b!106666 (= (_2!4633 lt!158773) lt!158755)))

(declare-fun lt!158774 () Unit!6520)

(declare-fun Unit!6529 () Unit!6520)

(assert (=> b!106666 (= lt!158774 Unit!6529)))

(declare-fun lt!158759 () (_ BitVec 64))

(assert (=> b!106666 (= lt!158759 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!158757 () (_ BitVec 64))

(assert (=> b!106666 (= lt!158757 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!158762 () Unit!6520)

(assert (=> b!106666 (= lt!158762 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4634 lt!158166) (buf!2612 (_2!4634 lt!158764)) lt!158757))))

(assert (=> b!106666 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158764)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166))) lt!158757)))

(declare-fun lt!158751 () Unit!6520)

(assert (=> b!106666 (= lt!158751 lt!158762)))

(declare-fun lt!158760 () tuple2!8758)

(assert (=> b!106666 (= lt!158760 (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158753) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158759))))

(declare-fun lt!158771 () (_ BitVec 64))

(assert (=> b!106666 (= lt!158771 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!158744 () Unit!6520)

(assert (=> b!106666 (= lt!158744 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4634 lt!158761) (buf!2612 (_2!4634 lt!158764)) lt!158771))))

(assert (=> b!106666 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158764)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158761))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158761))) lt!158771)))

(declare-fun lt!158766 () Unit!6520)

(assert (=> b!106666 (= lt!158766 lt!158744)))

(declare-fun lt!158738 () tuple2!8758)

(assert (=> b!106666 (= lt!158738 (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158777) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!158759 (ite (_2!4633 lt!158773) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!158781 () tuple2!8758)

(assert (=> b!106666 (= lt!158781 (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158753) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158759))))

(declare-fun c!6583 () Bool)

(assert (=> b!106666 (= c!6583 (_2!4633 (readBitPure!0 (_1!4635 lt!158753))))))

(declare-fun lt!158740 () tuple2!8758)

(assert (=> b!106666 (= lt!158740 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4635 lt!158753) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!158759 e!69820)))))

(declare-fun lt!158758 () Unit!6520)

(assert (=> b!106666 (= lt!158758 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4635 lt!158753) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158759))))

(assert (=> b!106666 (and (= (_2!4636 lt!158781) (_2!4636 lt!158740)) (= (_1!4636 lt!158781) (_1!4636 lt!158740)))))

(declare-fun lt!158746 () Unit!6520)

(assert (=> b!106666 (= lt!158746 lt!158758)))

(assert (=> b!106666 (= (_1!4635 lt!158753) (withMovedBitIndex!0 (_2!4635 lt!158753) (bvsub (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158764))) (currentByte!5124 (_2!4634 lt!158764)) (currentBit!5119 (_2!4634 lt!158764))))))))

(declare-fun lt!158778 () Unit!6520)

(declare-fun Unit!6531 () Unit!6520)

(assert (=> b!106666 (= lt!158778 Unit!6531)))

(assert (=> b!106666 (= (_1!4635 lt!158777) (withMovedBitIndex!0 (_2!4635 lt!158777) (bvsub (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158761))) (currentByte!5124 (_2!4634 lt!158761)) (currentBit!5119 (_2!4634 lt!158761))) (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158764))) (currentByte!5124 (_2!4634 lt!158764)) (currentBit!5119 (_2!4634 lt!158764))))))))

(declare-fun lt!158743 () Unit!6520)

(declare-fun Unit!6532 () Unit!6520)

(assert (=> b!106666 (= lt!158743 Unit!6532)))

(assert (=> b!106666 (= (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) (bvsub (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158761))) (currentByte!5124 (_2!4634 lt!158761)) (currentBit!5119 (_2!4634 lt!158761))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!158763 () Unit!6520)

(declare-fun Unit!6533 () Unit!6520)

(assert (=> b!106666 (= lt!158763 Unit!6533)))

(assert (=> b!106666 (= (_2!4636 lt!158760) (_2!4636 lt!158738))))

(declare-fun lt!158769 () Unit!6520)

(declare-fun Unit!6534 () Unit!6520)

(assert (=> b!106666 (= lt!158769 Unit!6534)))

(assert (=> b!106666 (= (_1!4636 lt!158760) (_2!4635 lt!158753))))

(declare-fun b!106667 () Bool)

(assert (=> b!106667 (= e!69820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!106668 () Bool)

(declare-fun lt!158741 () tuple2!8758)

(declare-fun lt!158765 () tuple2!8756)

(assert (=> b!106668 (= e!69819 (and (= (_2!4636 lt!158741) v!199) (= (_1!4636 lt!158741) (_2!4635 lt!158765))))))

(declare-fun lt!158748 () (_ BitVec 64))

(assert (=> b!106668 (= lt!158741 (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158765) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158748))))

(declare-fun lt!158745 () Unit!6520)

(declare-fun lt!158750 () Unit!6520)

(assert (=> b!106668 (= lt!158745 lt!158750)))

(assert (=> b!106668 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158749)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166))) lt!158779)))

(assert (=> b!106668 (= lt!158750 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4634 lt!158166) (buf!2612 (_2!4634 lt!158749)) lt!158779))))

(assert (=> b!106668 e!69815))

(declare-fun res!87859 () Bool)

(assert (=> b!106668 (=> (not res!87859) (not e!69815))))

(assert (=> b!106668 (= res!87859 (and (= (size!2233 (buf!2612 (_2!4634 lt!158166))) (size!2233 (buf!2612 (_2!4634 lt!158749)))) (bvsge lt!158779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106668 (= lt!158779 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106668 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106668 (= lt!158748 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!106668 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106668 (= lt!158765 (reader!0 (_2!4634 lt!158166) (_2!4634 lt!158749)))))

(declare-fun b!106669 () Bool)

(declare-fun res!87864 () Bool)

(assert (=> b!106669 (= res!87864 (= (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158776))) (currentByte!5124 (_2!4634 lt!158776)) (currentBit!5119 (_2!4634 lt!158776))) (bvadd (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!106669 (=> (not res!87864) (not e!69816))))

(assert (= (and d!33568 c!6582) b!106666))

(assert (= (and d!33568 (not c!6582)) b!106663))

(assert (= (and b!106666 res!87865) b!106669))

(assert (= (and b!106669 res!87864) b!106665))

(assert (= (and b!106665 res!87861) b!106659))

(assert (= (and b!106659 res!87866) b!106658))

(assert (= (and b!106666 res!87862) b!106660))

(assert (= (and b!106666 c!6583) b!106657))

(assert (= (and b!106666 (not c!6583)) b!106667))

(assert (= (or b!106665 b!106663) bm!1341))

(assert (= (and d!33568 res!87860) b!106664))

(assert (= (and b!106664 res!87863) b!106661))

(assert (= (and b!106661 res!87858) b!106668))

(assert (= (and b!106668 res!87859) b!106662))

(declare-fun m!157195 () Bool)

(assert (=> b!106659 m!157195))

(assert (=> b!106659 m!157195))

(declare-fun m!157197 () Bool)

(assert (=> b!106659 m!157197))

(declare-fun m!157199 () Bool)

(assert (=> b!106658 m!157199))

(declare-fun m!157201 () Bool)

(assert (=> b!106658 m!157201))

(declare-fun m!157203 () Bool)

(assert (=> b!106664 m!157203))

(assert (=> b!106664 m!156753))

(declare-fun m!157205 () Bool)

(assert (=> b!106661 m!157205))

(declare-fun m!157207 () Bool)

(assert (=> b!106663 m!157207))

(declare-fun m!157209 () Bool)

(assert (=> bm!1341 m!157209))

(declare-fun m!157211 () Bool)

(assert (=> b!106666 m!157211))

(declare-fun m!157213 () Bool)

(assert (=> b!106666 m!157213))

(declare-fun m!157215 () Bool)

(assert (=> b!106666 m!157215))

(declare-fun m!157217 () Bool)

(assert (=> b!106666 m!157217))

(declare-fun m!157219 () Bool)

(assert (=> b!106666 m!157219))

(declare-fun m!157221 () Bool)

(assert (=> b!106666 m!157221))

(declare-fun m!157223 () Bool)

(assert (=> b!106666 m!157223))

(declare-fun m!157225 () Bool)

(assert (=> b!106666 m!157225))

(declare-fun m!157227 () Bool)

(assert (=> b!106666 m!157227))

(declare-fun m!157229 () Bool)

(assert (=> b!106666 m!157229))

(declare-fun m!157231 () Bool)

(assert (=> b!106666 m!157231))

(declare-fun m!157233 () Bool)

(assert (=> b!106666 m!157233))

(declare-fun m!157235 () Bool)

(assert (=> b!106666 m!157235))

(declare-fun m!157237 () Bool)

(assert (=> b!106666 m!157237))

(declare-fun m!157239 () Bool)

(assert (=> b!106666 m!157239))

(assert (=> b!106666 m!156753))

(declare-fun m!157241 () Bool)

(assert (=> b!106666 m!157241))

(assert (=> b!106666 m!157233))

(declare-fun m!157243 () Bool)

(assert (=> b!106666 m!157243))

(declare-fun m!157245 () Bool)

(assert (=> b!106666 m!157245))

(declare-fun m!157247 () Bool)

(assert (=> b!106666 m!157247))

(declare-fun m!157249 () Bool)

(assert (=> b!106666 m!157249))

(declare-fun m!157251 () Bool)

(assert (=> b!106666 m!157251))

(declare-fun m!157253 () Bool)

(assert (=> b!106666 m!157253))

(declare-fun m!157255 () Bool)

(assert (=> b!106666 m!157255))

(declare-fun m!157257 () Bool)

(assert (=> b!106666 m!157257))

(declare-fun m!157259 () Bool)

(assert (=> b!106666 m!157259))

(declare-fun m!157261 () Bool)

(assert (=> b!106666 m!157261))

(declare-fun m!157263 () Bool)

(assert (=> b!106666 m!157263))

(declare-fun m!157265 () Bool)

(assert (=> b!106666 m!157265))

(assert (=> b!106669 m!157201))

(assert (=> b!106669 m!156753))

(declare-fun m!157267 () Bool)

(assert (=> b!106662 m!157267))

(assert (=> b!106668 m!157245))

(declare-fun m!157269 () Bool)

(assert (=> b!106668 m!157269))

(declare-fun m!157271 () Bool)

(assert (=> b!106668 m!157271))

(declare-fun m!157273 () Bool)

(assert (=> b!106668 m!157273))

(declare-fun m!157275 () Bool)

(assert (=> b!106668 m!157275))

(assert (=> b!106438 d!33568))

(declare-fun d!33600 () Bool)

(assert (=> d!33600 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305)) lt!158150) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305))) lt!158150))))

(declare-fun bs!8204 () Bool)

(assert (= bs!8204 d!33600))

(declare-fun m!157277 () Bool)

(assert (=> bs!8204 m!157277))

(assert (=> b!106438 d!33600))

(declare-fun d!33602 () Bool)

(assert (=> d!33602 (isPrefixOf!0 thiss!1305 (_2!4634 lt!158162))))

(declare-fun lt!158785 () Unit!6520)

(declare-fun choose!30 (BitStream!3940 BitStream!3940 BitStream!3940) Unit!6520)

(assert (=> d!33602 (= lt!158785 (choose!30 thiss!1305 (_2!4634 lt!158166) (_2!4634 lt!158162)))))

(assert (=> d!33602 (isPrefixOf!0 thiss!1305 (_2!4634 lt!158166))))

(assert (=> d!33602 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4634 lt!158166) (_2!4634 lt!158162)) lt!158785)))

(declare-fun bs!8205 () Bool)

(assert (= bs!8205 d!33602))

(assert (=> bs!8205 m!156771))

(declare-fun m!157279 () Bool)

(assert (=> bs!8205 m!157279))

(assert (=> bs!8205 m!156737))

(assert (=> b!106438 d!33602))

(declare-fun d!33604 () Bool)

(assert (=> d!33604 (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166))) lt!158147)))

(declare-fun lt!158786 () Unit!6520)

(assert (=> d!33604 (= lt!158786 (choose!9 (_2!4634 lt!158166) (buf!2612 (_2!4634 lt!158162)) lt!158147 (BitStream!3941 (buf!2612 (_2!4634 lt!158162)) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166)))))))

(assert (=> d!33604 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4634 lt!158166) (buf!2612 (_2!4634 lt!158162)) lt!158147) lt!158786)))

(declare-fun bs!8206 () Bool)

(assert (= bs!8206 d!33604))

(assert (=> bs!8206 m!156787))

(declare-fun m!157281 () Bool)

(assert (=> bs!8206 m!157281))

(assert (=> b!106438 d!33604))

(declare-fun d!33606 () Bool)

(assert (=> d!33606 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166))) lt!158147) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 (_2!4634 lt!158162)))) ((_ sign_extend 32) (currentByte!5124 (_2!4634 lt!158166))) ((_ sign_extend 32) (currentBit!5119 (_2!4634 lt!158166)))) lt!158147))))

(declare-fun bs!8207 () Bool)

(assert (= bs!8207 d!33606))

(declare-fun m!157283 () Bool)

(assert (=> bs!8207 m!157283))

(assert (=> b!106438 d!33606))

(declare-fun b!106681 () Bool)

(declare-fun e!69825 () Bool)

(declare-fun e!69826 () Bool)

(assert (=> b!106681 (= e!69825 e!69826)))

(declare-fun res!87876 () Bool)

(assert (=> b!106681 (=> (not res!87876) (not e!69826))))

(declare-fun lt!158797 () tuple2!8754)

(declare-fun lt!158796 () tuple2!8752)

(assert (=> b!106681 (= res!87876 (and (= (_2!4633 lt!158796) lt!158157) (= (_1!4633 lt!158796) (_2!4634 lt!158797))))))

(assert (=> b!106681 (= lt!158796 (readBitPure!0 (readerFrom!0 (_2!4634 lt!158797) (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305))))))

(declare-fun d!33608 () Bool)

(assert (=> d!33608 e!69825))

(declare-fun res!87877 () Bool)

(assert (=> d!33608 (=> (not res!87877) (not e!69825))))

(assert (=> d!33608 (= res!87877 (= (size!2233 (buf!2612 thiss!1305)) (size!2233 (buf!2612 (_2!4634 lt!158797)))))))

(declare-fun choose!16 (BitStream!3940 Bool) tuple2!8754)

(assert (=> d!33608 (= lt!158797 (choose!16 thiss!1305 lt!158157))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33608 (validate_offset_bit!0 ((_ sign_extend 32) (size!2233 (buf!2612 thiss!1305))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305)))))

(assert (=> d!33608 (= (appendBit!0 thiss!1305 lt!158157) lt!158797)))

(declare-fun b!106682 () Bool)

(assert (=> b!106682 (= e!69826 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158796))) (currentByte!5124 (_1!4633 lt!158796)) (currentBit!5119 (_1!4633 lt!158796))) (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158797))) (currentByte!5124 (_2!4634 lt!158797)) (currentBit!5119 (_2!4634 lt!158797)))))))

(declare-fun b!106680 () Bool)

(declare-fun res!87878 () Bool)

(assert (=> b!106680 (=> (not res!87878) (not e!69825))))

(assert (=> b!106680 (= res!87878 (isPrefixOf!0 thiss!1305 (_2!4634 lt!158797)))))

(declare-fun b!106679 () Bool)

(declare-fun res!87875 () Bool)

(assert (=> b!106679 (=> (not res!87875) (not e!69825))))

(declare-fun lt!158798 () (_ BitVec 64))

(declare-fun lt!158795 () (_ BitVec 64))

(assert (=> b!106679 (= res!87875 (= (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158797))) (currentByte!5124 (_2!4634 lt!158797)) (currentBit!5119 (_2!4634 lt!158797))) (bvadd lt!158798 lt!158795)))))

(assert (=> b!106679 (or (not (= (bvand lt!158798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158795 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!158798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!158798 lt!158795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106679 (= lt!158795 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!106679 (= lt!158798 (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)))))

(assert (= (and d!33608 res!87877) b!106679))

(assert (= (and b!106679 res!87875) b!106680))

(assert (= (and b!106680 res!87878) b!106681))

(assert (= (and b!106681 res!87876) b!106682))

(declare-fun m!157285 () Bool)

(assert (=> b!106680 m!157285))

(declare-fun m!157287 () Bool)

(assert (=> b!106682 m!157287))

(declare-fun m!157289 () Bool)

(assert (=> b!106682 m!157289))

(assert (=> b!106679 m!157289))

(assert (=> b!106679 m!156743))

(declare-fun m!157291 () Bool)

(assert (=> b!106681 m!157291))

(assert (=> b!106681 m!157291))

(declare-fun m!157293 () Bool)

(assert (=> b!106681 m!157293))

(declare-fun m!157295 () Bool)

(assert (=> d!33608 m!157295))

(declare-fun m!157297 () Bool)

(assert (=> d!33608 m!157297))

(assert (=> b!106438 d!33608))

(declare-fun lt!158799 () tuple2!8776)

(declare-fun d!33610 () Bool)

(assert (=> d!33610 (= lt!158799 (readNLeastSignificantBitsLoop!0 (_1!4635 lt!158152) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158165))))

(assert (=> d!33610 (= (readNLeastSignificantBitsLoopPure!0 (_1!4635 lt!158152) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158165) (tuple2!8759 (_2!4645 lt!158799) (_1!4645 lt!158799)))))

(declare-fun bs!8208 () Bool)

(assert (= bs!8208 d!33610))

(declare-fun m!157299 () Bool)

(assert (=> bs!8208 m!157299))

(assert (=> b!106438 d!33610))

(declare-fun d!33612 () Bool)

(declare-fun e!69827 () Bool)

(assert (=> d!33612 e!69827))

(declare-fun res!87879 () Bool)

(assert (=> d!33612 (=> (not res!87879) (not e!69827))))

(declare-fun lt!158801 () (_ BitVec 64))

(declare-fun lt!158804 () (_ BitVec 64))

(declare-fun lt!158803 () (_ BitVec 64))

(assert (=> d!33612 (= res!87879 (= lt!158804 (bvsub lt!158803 lt!158801)))))

(assert (=> d!33612 (or (= (bvand lt!158803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158801 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158803 lt!158801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33612 (= lt!158801 (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158156)))) ((_ sign_extend 32) (currentByte!5124 (_1!4633 lt!158156))) ((_ sign_extend 32) (currentBit!5119 (_1!4633 lt!158156)))))))

(declare-fun lt!158802 () (_ BitVec 64))

(declare-fun lt!158805 () (_ BitVec 64))

(assert (=> d!33612 (= lt!158803 (bvmul lt!158802 lt!158805))))

(assert (=> d!33612 (or (= lt!158802 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158805 (bvsdiv (bvmul lt!158802 lt!158805) lt!158802)))))

(assert (=> d!33612 (= lt!158805 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33612 (= lt!158802 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158156)))))))

(assert (=> d!33612 (= lt!158804 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5124 (_1!4633 lt!158156))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5119 (_1!4633 lt!158156)))))))

(assert (=> d!33612 (invariant!0 (currentBit!5119 (_1!4633 lt!158156)) (currentByte!5124 (_1!4633 lt!158156)) (size!2233 (buf!2612 (_1!4633 lt!158156))))))

(assert (=> d!33612 (= (bitIndex!0 (size!2233 (buf!2612 (_1!4633 lt!158156))) (currentByte!5124 (_1!4633 lt!158156)) (currentBit!5119 (_1!4633 lt!158156))) lt!158804)))

(declare-fun b!106683 () Bool)

(declare-fun res!87880 () Bool)

(assert (=> b!106683 (=> (not res!87880) (not e!69827))))

(assert (=> b!106683 (= res!87880 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158804))))

(declare-fun b!106684 () Bool)

(declare-fun lt!158800 () (_ BitVec 64))

(assert (=> b!106684 (= e!69827 (bvsle lt!158804 (bvmul lt!158800 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106684 (or (= lt!158800 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158800 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158800)))))

(assert (=> b!106684 (= lt!158800 ((_ sign_extend 32) (size!2233 (buf!2612 (_1!4633 lt!158156)))))))

(assert (= (and d!33612 res!87879) b!106683))

(assert (= (and b!106683 res!87880) b!106684))

(declare-fun m!157301 () Bool)

(assert (=> d!33612 m!157301))

(declare-fun m!157303 () Bool)

(assert (=> d!33612 m!157303))

(assert (=> b!106437 d!33612))

(declare-fun d!33614 () Bool)

(declare-fun res!87882 () Bool)

(declare-fun e!69828 () Bool)

(assert (=> d!33614 (=> (not res!87882) (not e!69828))))

(assert (=> d!33614 (= res!87882 (= (size!2233 (buf!2612 thiss!1305)) (size!2233 (buf!2612 (_2!4634 lt!158166)))))))

(assert (=> d!33614 (= (isPrefixOf!0 thiss!1305 (_2!4634 lt!158166)) e!69828)))

(declare-fun b!106685 () Bool)

(declare-fun res!87881 () Bool)

(assert (=> b!106685 (=> (not res!87881) (not e!69828))))

(assert (=> b!106685 (= res!87881 (bvsle (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)) (bitIndex!0 (size!2233 (buf!2612 (_2!4634 lt!158166))) (currentByte!5124 (_2!4634 lt!158166)) (currentBit!5119 (_2!4634 lt!158166)))))))

(declare-fun b!106686 () Bool)

(declare-fun e!69829 () Bool)

(assert (=> b!106686 (= e!69828 e!69829)))

(declare-fun res!87883 () Bool)

(assert (=> b!106686 (=> res!87883 e!69829)))

(assert (=> b!106686 (= res!87883 (= (size!2233 (buf!2612 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106687 () Bool)

(assert (=> b!106687 (= e!69829 (arrayBitRangesEq!0 (buf!2612 thiss!1305) (buf!2612 (_2!4634 lt!158166)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2233 (buf!2612 thiss!1305)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305))))))

(assert (= (and d!33614 res!87882) b!106685))

(assert (= (and b!106685 res!87881) b!106686))

(assert (= (and b!106686 (not res!87883)) b!106687))

(assert (=> b!106685 m!156743))

(assert (=> b!106685 m!156753))

(assert (=> b!106687 m!156743))

(assert (=> b!106687 m!156743))

(declare-fun m!157305 () Bool)

(assert (=> b!106687 m!157305))

(assert (=> b!106435 d!33614))

(declare-fun d!33616 () Bool)

(assert (=> d!33616 (= (array_inv!2035 (buf!2612 thiss!1305)) (bvsge (size!2233 (buf!2612 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!106436 d!33616))

(declare-fun d!33618 () Bool)

(assert (=> d!33618 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2233 (buf!2612 thiss!1305))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305)) lt!158150) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2233 (buf!2612 thiss!1305))) ((_ sign_extend 32) (currentByte!5124 thiss!1305)) ((_ sign_extend 32) (currentBit!5119 thiss!1305))) lt!158150))))

(declare-fun bs!8209 () Bool)

(assert (= bs!8209 d!33618))

(assert (=> bs!8209 m!156961))

(assert (=> b!106434 d!33618))

(declare-fun d!33620 () Bool)

(assert (=> d!33620 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!106445 d!33620))

(declare-fun d!33622 () Bool)

(assert (=> d!33622 (= (invariant!0 (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158162)))) (and (bvsge (currentBit!5119 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5119 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5124 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158162)))) (and (= (currentBit!5119 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158162))))))))))

(assert (=> b!106443 d!33622))

(declare-fun d!33624 () Bool)

(declare-fun lt!158806 () tuple2!8778)

(assert (=> d!33624 (= lt!158806 (readBit!0 (readerFrom!0 (_2!4634 lt!158166) (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305))))))

(assert (=> d!33624 (= (readBitPure!0 (readerFrom!0 (_2!4634 lt!158166) (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305))) (tuple2!8753 (_2!4646 lt!158806) (_1!4646 lt!158806)))))

(declare-fun bs!8210 () Bool)

(assert (= bs!8210 d!33624))

(assert (=> bs!8210 m!156767))

(declare-fun m!157307 () Bool)

(assert (=> bs!8210 m!157307))

(assert (=> b!106444 d!33624))

(declare-fun d!33626 () Bool)

(declare-fun e!69832 () Bool)

(assert (=> d!33626 e!69832))

(declare-fun res!87887 () Bool)

(assert (=> d!33626 (=> (not res!87887) (not e!69832))))

(assert (=> d!33626 (= res!87887 (invariant!0 (currentBit!5119 (_2!4634 lt!158166)) (currentByte!5124 (_2!4634 lt!158166)) (size!2233 (buf!2612 (_2!4634 lt!158166)))))))

(assert (=> d!33626 (= (readerFrom!0 (_2!4634 lt!158166) (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305)) (BitStream!3941 (buf!2612 (_2!4634 lt!158166)) (currentByte!5124 thiss!1305) (currentBit!5119 thiss!1305)))))

(declare-fun b!106690 () Bool)

(assert (=> b!106690 (= e!69832 (invariant!0 (currentBit!5119 thiss!1305) (currentByte!5124 thiss!1305) (size!2233 (buf!2612 (_2!4634 lt!158166)))))))

(assert (= (and d!33626 res!87887) b!106690))

(assert (=> d!33626 m!156959))

(assert (=> b!106690 m!156755))

(assert (=> b!106444 d!33626))

(push 1)

(assert (not b!106538))

(assert (not d!33604))

(assert (not d!33600))

(assert (not bm!1341))

(assert (not b!106571))

(assert (not d!33602))

(assert (not d!33618))

(assert (not b!106690))

(assert (not b!106577))

(assert (not d!33624))

(assert (not b!106572))

(assert (not b!106687))

(assert (not b!106662))

(assert (not b!106574))

(assert (not d!33530))

(assert (not b!106685))

(assert (not d!33534))

(assert (not b!106550))

(assert (not d!33516))

(assert (not d!33566))

(assert (not d!33552))

(assert (not b!106548))

(assert (not d!33554))

(assert (not b!106661))

(assert (not d!33528))

(assert (not b!106680))

(assert (not d!33564))

(assert (not b!106659))

(assert (not d!33532))

(assert (not b!106570))

(assert (not b!106576))

(assert (not d!33518))

(assert (not d!33550))

(assert (not b!106575))

(assert (not d!33526))

(assert (not d!33514))

(assert (not d!33612))

(assert (not b!106666))

(assert (not d!33608))

(assert (not b!106663))

(assert (not b!106579))

(assert (not d!33522))

(assert (not d!33556))

(assert (not d!33538))

(assert (not b!106669))

(assert (not b!106682))

(assert (not d!33610))

(assert (not d!33606))

(assert (not b!106668))

(assert (not d!33560))

(assert (not b!106658))

(assert (not b!106679))

(assert (not d!33626))

(assert (not b!106664))

(assert (not b!106681))

(assert (not d!33558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

