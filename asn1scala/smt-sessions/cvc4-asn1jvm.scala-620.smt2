; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17588 () Bool)

(assert start!17588)

(declare-fun e!56567 () Bool)

(declare-datatypes ((Unit!5680 0))(
  ( (Unit!5681) )
))
(declare-datatypes ((array!4024 0))(
  ( (array!4025 (arr!2456 (Array (_ BitVec 32) (_ BitVec 8))) (size!1819 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3200 0))(
  ( (BitStream!3201 (buf!2209 array!4024) (currentByte!4388 (_ BitVec 32)) (currentBit!4383 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!380 0))(
  ( (tuple3!381 (_1!3840 Unit!5680) (_2!3840 BitStream!3200) (_3!214 (_ BitVec 32))) )
))
(declare-fun lt!134412 () tuple3!380)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-fun thiss!1136 () BitStream!3200)

(declare-fun b!84754 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84754 (= e!56567 (not (= (bitIndex!0 (size!1819 (buf!2209 (_2!3840 lt!134412))) (currentByte!4388 (_2!3840 lt!134412)) (currentBit!4383 (_2!3840 lt!134412))) (bvadd (bitIndex!0 (size!1819 (buf!2209 thiss!1136)) (currentByte!4388 thiss!1136) (currentBit!4383 thiss!1136)) ((_ sign_extend 32) nBits!333)))))))

(declare-fun b!84755 () Bool)

(declare-fun e!56570 () tuple3!380)

(declare-fun Unit!5682 () Unit!5680)

(assert (=> b!84755 (= e!56570 (tuple3!381 Unit!5682 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84756 () Bool)

(declare-fun res!69535 () Bool)

(declare-fun e!56571 () Bool)

(assert (=> b!84756 (=> (not res!69535) (not e!56571))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84756 (= res!69535 (invariant!0 (currentBit!4383 thiss!1136) (currentByte!4388 thiss!1136) (size!1819 (buf!2209 thiss!1136))))))

(declare-fun res!69533 () Bool)

(assert (=> start!17588 (=> (not res!69533) (not e!56571))))

(assert (=> start!17588 (= res!69533 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17588 e!56571))

(assert (=> start!17588 true))

(declare-fun e!56568 () Bool)

(declare-fun inv!12 (BitStream!3200) Bool)

(assert (=> start!17588 (and (inv!12 thiss!1136) e!56568)))

(declare-fun b!84757 () Bool)

(declare-fun res!69534 () Bool)

(assert (=> b!84757 (=> (not res!69534) (not e!56571))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84757 (= res!69534 (validate_offset_bits!1 ((_ sign_extend 32) (size!1819 (buf!2209 thiss!1136))) ((_ sign_extend 32) (currentByte!4388 thiss!1136)) ((_ sign_extend 32) (currentBit!4383 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84758 () Bool)

(declare-fun array_inv!1665 (array!4024) Bool)

(assert (=> b!84758 (= e!56568 (array_inv!1665 (buf!2209 thiss!1136)))))

(declare-fun b!84759 () Bool)

(declare-fun v!176 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3200 (_ BitVec 64) BitStream!3200 (_ BitVec 32)) tuple3!380)

(assert (=> b!84759 (= e!56570 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84760 () Bool)

(assert (=> b!84760 (= e!56571 e!56567)))

(declare-fun res!69532 () Bool)

(assert (=> b!84760 (=> res!69532 e!56567)))

(assert (=> b!84760 (= res!69532 (not (= (size!1819 (buf!2209 (_2!3840 lt!134412))) (size!1819 (buf!2209 thiss!1136)))))))

(assert (=> b!84760 (= lt!134412 e!56570)))

(declare-fun c!5840 () Bool)

(assert (=> b!84760 (= c!5840 (bvslt #b00000000000000000000000000000000 nBits!333))))

(assert (= (and start!17588 res!69533) b!84757))

(assert (= (and b!84757 res!69534) b!84756))

(assert (= (and b!84756 res!69535) b!84760))

(assert (= (and b!84760 c!5840) b!84759))

(assert (= (and b!84760 (not c!5840)) b!84755))

(assert (= (and b!84760 (not res!69532)) b!84754))

(assert (= start!17588 b!84758))

(declare-fun m!131187 () Bool)

(assert (=> b!84758 m!131187))

(declare-fun m!131189 () Bool)

(assert (=> b!84757 m!131189))

(declare-fun m!131191 () Bool)

(assert (=> start!17588 m!131191))

(declare-fun m!131193 () Bool)

(assert (=> b!84756 m!131193))

(declare-fun m!131195 () Bool)

(assert (=> b!84759 m!131195))

(declare-fun m!131197 () Bool)

(assert (=> b!84754 m!131197))

(declare-fun m!131199 () Bool)

(assert (=> b!84754 m!131199))

(push 1)

(assert (not b!84758))

(assert (not start!17588))

(assert (not b!84759))

(assert (not b!84756))

(assert (not b!84757))

(assert (not b!84754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27208 () Bool)

(assert (=> d!27208 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4383 thiss!1136) (currentByte!4388 thiss!1136) (size!1819 (buf!2209 thiss!1136))))))

(declare-fun bs!6737 () Bool)

(assert (= bs!6737 d!27208))

(assert (=> bs!6737 m!131193))

(assert (=> start!17588 d!27208))

(declare-fun d!27210 () Bool)

(declare-fun e!56574 () Bool)

(assert (=> d!27210 e!56574))

(declare-fun res!69540 () Bool)

(assert (=> d!27210 (=> (not res!69540) (not e!56574))))

(declare-fun lt!134429 () (_ BitVec 64))

(declare-fun lt!134426 () (_ BitVec 64))

(declare-fun lt!134428 () (_ BitVec 64))

(assert (=> d!27210 (= res!69540 (= lt!134426 (bvsub lt!134429 lt!134428)))))

(assert (=> d!27210 (or (= (bvand lt!134429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134428 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134429 lt!134428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27210 (= lt!134428 (remainingBits!0 ((_ sign_extend 32) (size!1819 (buf!2209 (_2!3840 lt!134412)))) ((_ sign_extend 32) (currentByte!4388 (_2!3840 lt!134412))) ((_ sign_extend 32) (currentBit!4383 (_2!3840 lt!134412)))))))

(declare-fun lt!134427 () (_ BitVec 64))

(declare-fun lt!134425 () (_ BitVec 64))

(assert (=> d!27210 (= lt!134429 (bvmul lt!134427 lt!134425))))

(assert (=> d!27210 (or (= lt!134427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134425 (bvsdiv (bvmul lt!134427 lt!134425) lt!134427)))))

(assert (=> d!27210 (= lt!134425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27210 (= lt!134427 ((_ sign_extend 32) (size!1819 (buf!2209 (_2!3840 lt!134412)))))))

(assert (=> d!27210 (= lt!134426 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4388 (_2!3840 lt!134412))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4383 (_2!3840 lt!134412)))))))

(assert (=> d!27210 (invariant!0 (currentBit!4383 (_2!3840 lt!134412)) (currentByte!4388 (_2!3840 lt!134412)) (size!1819 (buf!2209 (_2!3840 lt!134412))))))

(assert (=> d!27210 (= (bitIndex!0 (size!1819 (buf!2209 (_2!3840 lt!134412))) (currentByte!4388 (_2!3840 lt!134412)) (currentBit!4383 (_2!3840 lt!134412))) lt!134426)))

(declare-fun b!84765 () Bool)

(declare-fun res!69541 () Bool)

(assert (=> b!84765 (=> (not res!69541) (not e!56574))))

(assert (=> b!84765 (= res!69541 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134426))))

(declare-fun b!84766 () Bool)

(declare-fun lt!134430 () (_ BitVec 64))

(assert (=> b!84766 (= e!56574 (bvsle lt!134426 (bvmul lt!134430 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84766 (or (= lt!134430 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134430 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134430)))))

(assert (=> b!84766 (= lt!134430 ((_ sign_extend 32) (size!1819 (buf!2209 (_2!3840 lt!134412)))))))

(assert (= (and d!27210 res!69540) b!84765))

(assert (= (and b!84765 res!69541) b!84766))

(declare-fun m!131201 () Bool)

(assert (=> d!27210 m!131201))

(declare-fun m!131203 () Bool)

(assert (=> d!27210 m!131203))

(assert (=> b!84754 d!27210))

(declare-fun d!27214 () Bool)

(declare-fun e!56575 () Bool)

(assert (=> d!27214 e!56575))

(declare-fun res!69542 () Bool)

(assert (=> d!27214 (=> (not res!69542) (not e!56575))))

(declare-fun lt!134432 () (_ BitVec 64))

(declare-fun lt!134434 () (_ BitVec 64))

(declare-fun lt!134435 () (_ BitVec 64))

(assert (=> d!27214 (= res!69542 (= lt!134432 (bvsub lt!134435 lt!134434)))))

(assert (=> d!27214 (or (= (bvand lt!134435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134434 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134435 lt!134434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27214 (= lt!134434 (remainingBits!0 ((_ sign_extend 32) (size!1819 (buf!2209 thiss!1136))) ((_ sign_extend 32) (currentByte!4388 thiss!1136)) ((_ sign_extend 32) (currentBit!4383 thiss!1136))))))

(declare-fun lt!134433 () (_ BitVec 64))

(declare-fun lt!134431 () (_ BitVec 64))

(assert (=> d!27214 (= lt!134435 (bvmul lt!134433 lt!134431))))

(assert (=> d!27214 (or (= lt!134433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134431 (bvsdiv (bvmul lt!134433 lt!134431) lt!134433)))))

(assert (=> d!27214 (= lt!134431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27214 (= lt!134433 ((_ sign_extend 32) (size!1819 (buf!2209 thiss!1136))))))

(assert (=> d!27214 (= lt!134432 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4388 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4383 thiss!1136))))))

(assert (=> d!27214 (invariant!0 (currentBit!4383 thiss!1136) (currentByte!4388 thiss!1136) (size!1819 (buf!2209 thiss!1136)))))

(assert (=> d!27214 (= (bitIndex!0 (size!1819 (buf!2209 thiss!1136)) (currentByte!4388 thiss!1136) (currentBit!4383 thiss!1136)) lt!134432)))

(declare-fun b!84767 () Bool)

(declare-fun res!69543 () Bool)

(assert (=> b!84767 (=> (not res!69543) (not e!56575))))

(assert (=> b!84767 (= res!69543 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134432))))

(declare-fun b!84768 () Bool)

(declare-fun lt!134436 () (_ BitVec 64))

(assert (=> b!84768 (= e!56575 (bvsle lt!134432 (bvmul lt!134436 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84768 (or (= lt!134436 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134436 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134436)))))

(assert (=> b!84768 (= lt!134436 ((_ sign_extend 32) (size!1819 (buf!2209 thiss!1136))))))

(assert (= (and d!27214 res!69542) b!84767))

(assert (= (and b!84767 res!69543) b!84768))

(declare-fun m!131205 () Bool)

(assert (=> d!27214 m!131205))

(assert (=> d!27214 m!131193))

(assert (=> b!84754 d!27214))

(declare-fun d!27216 () Bool)

(assert (=> d!27216 (= (invariant!0 (currentBit!4383 thiss!1136) (currentByte!4388 thiss!1136) (size!1819 (buf!2209 thiss!1136))) (and (bvsge (currentBit!4383 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4383 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4388 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4388 thiss!1136) (size!1819 (buf!2209 thiss!1136))) (and (= (currentBit!4383 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4388 thiss!1136) (size!1819 (buf!2209 thiss!1136)))))))))

(assert (=> b!84756 d!27216))

(declare-fun d!27218 () Bool)

(assert (=> d!27218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1819 (buf!2209 thiss!1136))) ((_ sign_extend 32) (currentByte!4388 thiss!1136)) ((_ sign_extend 32) (currentBit!4383 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1819 (buf!2209 thiss!1136))) ((_ sign_extend 32) (currentByte!4388 thiss!1136)) ((_ sign_extend 32) (currentBit!4383 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6738 () Bool)

(assert (= bs!6738 d!27218))

(assert (=> bs!6738 m!131205))

(assert (=> b!84757 d!27218))

(declare-fun b!84849 () Bool)

(declare-fun res!69623 () Bool)

(declare-fun e!56603 () Bool)

(assert (=> b!84849 (=> (not res!69623) (not e!56603))))

(declare-fun lt!134477 () tuple3!380)

(assert (=> b!84849 (= res!69623 (invariant!0 (currentBit!4383 (_2!3840 lt!134477)) (currentByte!4388 (_2!3840 lt!134477)) (size!1819 (buf!2209 (_2!3840 lt!134477)))))))

(declare-fun b!84850 () Bool)

(declare-fun res!69614 () Bool)

(assert (=> b!84850 (=> (not res!69614) (not e!56603))))

(assert (=> b!84850 (= res!69614 (validate_offset_bits!1 ((_ sign_extend 32) (size!1819 (buf!2209 (_2!3840 lt!134477)))) ((_ sign_extend 32) (currentByte!4388 (_2!3840 lt!134477))) ((_ sign_extend 32) (currentBit!4383 (_2!3840 lt!134477))) ((_ sign_extend 32) (bvsub nBits!333 (_3!214 lt!134477)))))))

(assert (=> b!84850 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!214 lt!134477) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!214 lt!134477)) #b10000000000000000000000000000000)))))

(declare-fun b!84851 () Bool)

(declare-fun res!69624 () Bool)

(declare-fun e!56604 () Bool)

(assert (=> b!84851 (=> (not res!69624) (not e!56604))))

(assert (=> b!84851 (= res!69624 (invariant!0 (currentBit!4383 thiss!1136) (currentByte!4388 thiss!1136) (size!1819 (buf!2209 thiss!1136))))))

(declare-fun b!84852 () Bool)

(assert (=> b!84852 (= e!56603 (bvsge (_3!214 lt!134477) nBits!333))))

(declare-fun b!84853 () Bool)

(declare-fun lt!134483 () (_ BitVec 32))

(declare-fun e!56601 () tuple3!380)

(declare-datatypes ((tuple2!7256 0))(
  ( (tuple2!7257 (_1!3843 Unit!5680) (_2!3843 BitStream!3200)) )
))
(declare-fun lt!134480 () tuple2!7256)

(assert (=> b!84853 (= e!56601 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3843 lt!134480) lt!134483))))

(declare-fun b!84854 () Bool)

(declare-fun e!56602 () Bool)

(declare-fun e!56605 () Bool)

(assert (=> b!84854 (= e!56602 e!56605)))

(declare-fun res!69625 () Bool)

(assert (=> b!84854 (=> (not res!69625) (not e!56605))))

(declare-fun lt!134481 () Bool)

(declare-datatypes ((tuple2!7258 0))(
  ( (tuple2!7259 (_1!3844 BitStream!3200) (_2!3844 Bool)) )
))
(declare-fun lt!134478 () tuple2!7258)

(declare-fun lt!134484 () tuple2!7256)

(assert (=> b!84854 (= res!69625 (and (= (_2!3844 lt!134478) lt!134481) (= (_1!3844 lt!134478) (_2!3843 lt!134484))))))

(declare-fun readBitPure!0 (BitStream!3200) tuple2!7258)

(declare-fun readerFrom!0 (BitStream!3200 (_ BitVec 32) (_ BitVec 32)) BitStream!3200)

(assert (=> b!84854 (= lt!134478 (readBitPure!0 (readerFrom!0 (_2!3843 lt!134484) (currentBit!4383 thiss!1136) (currentByte!4388 thiss!1136))))))

(declare-fun b!84855 () Bool)

(declare-fun res!69618 () Bool)

(assert (=> b!84855 (=> (not res!69618) (not e!56604))))

(assert (=> b!84855 (= res!69618 (validate_offset_bits!1 ((_ sign_extend 32) (size!1819 (buf!2209 thiss!1136))) ((_ sign_extend 32) (currentByte!4388 thiss!1136)) ((_ sign_extend 32) (currentBit!4383 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun b!84856 () Bool)

(declare-fun res!69622 () Bool)

(assert (=> b!84856 (=> (not res!69622) (not e!56603))))

(assert (=> b!84856 (= res!69622 (and (bvsle (_3!214 lt!134477) nBits!333) (= (size!1819 (buf!2209 (_2!3840 lt!134477))) (size!1819 (buf!2209 thiss!1136)))))))

(declare-fun b!84857 () Bool)

(declare-fun res!69617 () Bool)

(assert (=> b!84857 (=> (not res!69617) (not e!56604))))

(assert (=> b!84857 (= res!69617 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1819 (buf!2209 thiss!1136)) (size!1819 (buf!2209 thiss!1136)))))))

(declare-fun b!84858 () Bool)

(declare-fun res!69620 () Bool)

(assert (=> b!84858 (=> (not res!69620) (not e!56602))))

(assert (=> b!84858 (= res!69620 (= (bitIndex!0 (size!1819 (buf!2209 (_2!3843 lt!134484))) (currentByte!4388 (_2!3843 lt!134484)) (currentBit!4383 (_2!3843 lt!134484))) (bvadd (bitIndex!0 (size!1819 (buf!2209 thiss!1136)) (currentByte!4388 thiss!1136) (currentBit!4383 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84859 () Bool)

(assert (=> b!84859 (= e!56604 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84861 () Bool)

(declare-fun Unit!5684 () Unit!5680)

(assert (=> b!84861 (= e!56601 (tuple3!381 Unit!5684 (_2!3843 lt!134480) lt!134483))))

(declare-fun b!84862 () Bool)

(assert (=> b!84862 (= e!56605 (= (bitIndex!0 (size!1819 (buf!2209 (_1!3844 lt!134478))) (currentByte!4388 (_1!3844 lt!134478)) (currentBit!4383 (_1!3844 lt!134478))) (bitIndex!0 (size!1819 (buf!2209 (_2!3843 lt!134484))) (currentByte!4388 (_2!3843 lt!134484)) (currentBit!4383 (_2!3843 lt!134484)))))))

(declare-fun b!84863 () Bool)

(declare-fun res!69619 () Bool)

(assert (=> b!84863 (=> (not res!69619) (not e!56604))))

(assert (=> b!84863 (= res!69619 (= (bitIndex!0 (size!1819 (buf!2209 thiss!1136)) (currentByte!4388 thiss!1136) (currentBit!4383 thiss!1136)) (bvadd (bitIndex!0 (size!1819 (buf!2209 thiss!1136)) (currentByte!4388 thiss!1136) (currentBit!4383 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun b!84864 () Bool)

(declare-fun res!69626 () Bool)

(assert (=> b!84864 (=> (not res!69626) (not e!56603))))

(declare-fun lt!134479 () (_ BitVec 64))

(declare-fun lt!134482 () (_ BitVec 64))

(assert (=> b!84864 (= res!69626 (= (bitIndex!0 (size!1819 (buf!2209 (_2!3840 lt!134477))) (currentByte!4388 (_2!3840 lt!134477)) (currentBit!4383 (_2!3840 lt!134477))) (bvadd lt!134479 lt!134482)))))

(assert (=> b!84864 (or (not (= (bvand lt!134479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134482 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134479 lt!134482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84864 (= lt!134482 ((_ sign_extend 32) (_3!214 lt!134477)))))

(assert (=> b!84864 (= lt!134479 (bitIndex!0 (size!1819 (buf!2209 thiss!1136)) (currentByte!4388 thiss!1136) (currentBit!4383 thiss!1136)))))

(declare-fun d!27220 () Bool)

(assert (=> d!27220 e!56603))

(declare-fun res!69615 () Bool)

(assert (=> d!27220 (=> (not res!69615) (not e!56603))))

(assert (=> d!27220 (= res!69615 (bvsge (_3!214 lt!134477) #b00000000000000000000000000000000))))

(assert (=> d!27220 (= lt!134477 e!56601)))

(declare-fun c!5846 () Bool)

(assert (=> d!27220 (= c!5846 (bvslt lt!134483 nBits!333))))

(assert (=> d!27220 (= lt!134483 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(assert (=> d!27220 (= lt!134480 lt!134484)))

(assert (=> d!27220 e!56602))

(declare-fun res!69616 () Bool)

(assert (=> d!27220 (=> (not res!69616) (not e!56602))))

(assert (=> d!27220 (= res!69616 (= (size!1819 (buf!2209 thiss!1136)) (size!1819 (buf!2209 (_2!3843 lt!134484)))))))

(declare-fun appendBit!0 (BitStream!3200 Bool) tuple2!7256)

(assert (=> d!27220 (= lt!134484 (appendBit!0 thiss!1136 lt!134481))))

(assert (=> d!27220 (= lt!134481 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27220 e!56604))

(declare-fun res!69621 () Bool)

(assert (=> d!27220 (=> (not res!69621) (not e!56604))))

(assert (=> d!27220 (= res!69621 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27220 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134477)))

(declare-fun b!84860 () Bool)

(declare-fun res!69627 () Bool)

(assert (=> b!84860 (=> (not res!69627) (not e!56602))))

(declare-fun isPrefixOf!0 (BitStream!3200 BitStream!3200) Bool)

(assert (=> b!84860 (= res!69627 (isPrefixOf!0 thiss!1136 (_2!3843 lt!134484)))))

(assert (= (and d!27220 res!69621) b!84851))

(assert (= (and b!84851 res!69624) b!84857))

(assert (= (and b!84857 res!69617) b!84863))

(assert (= (and b!84863 res!69619) b!84855))

(assert (= (and b!84855 res!69618) b!84859))

(assert (= (and d!27220 res!69616) b!84858))

(assert (= (and b!84858 res!69620) b!84860))

(assert (= (and b!84860 res!69627) b!84854))

(assert (= (and b!84854 res!69625) b!84862))

(assert (= (and d!27220 c!5846) b!84853))

(assert (= (and d!27220 (not c!5846)) b!84861))

(assert (= (and d!27220 res!69615) b!84849))

(assert (= (and b!84849 res!69623) b!84856))

(assert (= (and b!84856 res!69622) b!84864))

(assert (= (and b!84864 res!69626) b!84850))

(assert (= (and b!84850 res!69614) b!84852))

(declare-fun m!131231 () Bool)

(assert (=> b!84854 m!131231))

(assert (=> b!84854 m!131231))

(declare-fun m!131233 () Bool)

(assert (=> b!84854 m!131233))

(declare-fun m!131235 () Bool)

(assert (=> b!84860 m!131235))

(assert (=> b!84851 m!131193))

(assert (=> b!84863 m!131199))

(assert (=> b!84863 m!131199))

(declare-fun m!131237 () Bool)

(assert (=> b!84853 m!131237))

(declare-fun m!131239 () Bool)

(assert (=> b!84864 m!131239))

(assert (=> b!84864 m!131199))

(declare-fun m!131241 () Bool)

(assert (=> b!84849 m!131241))

(declare-fun m!131243 () Bool)

(assert (=> b!84858 m!131243))

(assert (=> b!84858 m!131199))

(declare-fun m!131245 () Bool)

(assert (=> b!84862 m!131245))

(assert (=> b!84862 m!131243))

(declare-fun m!131247 () Bool)

(assert (=> d!27220 m!131247))

(declare-fun m!131249 () Bool)

(assert (=> b!84850 m!131249))

(declare-fun m!131251 () Bool)

(assert (=> b!84855 m!131251))

(assert (=> b!84759 d!27220))

(declare-fun d!27232 () Bool)

(assert (=> d!27232 (= (array_inv!1665 (buf!2209 thiss!1136)) (bvsge (size!1819 (buf!2209 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84758 d!27232))

(push 1)

(assert (not b!84850))

(assert (not b!84849))

(assert (not b!84854))

(assert (not d!27214))

(assert (not d!27208))

(assert (not b!84862))

(assert (not b!84855))

(assert (not b!84858))

(assert (not b!84863))

(assert (not b!84860))

(assert (not d!27218))

(assert (not b!84851))

(assert (not b!84853))

(assert (not d!27220))

(assert (not d!27210))

(assert (not b!84864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

