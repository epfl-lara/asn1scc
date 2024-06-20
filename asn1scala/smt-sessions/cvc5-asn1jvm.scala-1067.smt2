; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30592 () Bool)

(assert start!30592)

(declare-fun b!155830 () Bool)

(declare-fun e!105131 () Bool)

(declare-datatypes ((array!7116 0))(
  ( (array!7117 (arr!4028 (Array (_ BitVec 32) (_ BitVec 8))) (size!3196 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5650 0))(
  ( (BitStream!5651 (buf!3699 array!7116) (currentByte!6772 (_ BitVec 32)) (currentBit!6767 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5650)

(declare-fun array_inv!2985 (array!7116) Bool)

(assert (=> b!155830 (= e!105131 (array_inv!2985 (buf!3699 bs!65)))))

(declare-fun b!155827 () Bool)

(declare-fun res!130293 () Bool)

(declare-fun e!105133 () Bool)

(assert (=> b!155827 (=> (not res!130293) (not e!105133))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155827 (= res!130293 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3196 (buf!3699 bs!65))) ((_ sign_extend 32) (currentByte!6772 bs!65)) ((_ sign_extend 32) (currentBit!6767 bs!65)) (bvsub to!236 from!240)))))

(declare-fun lt!242490 () BitStream!5650)

(declare-fun e!105134 () Bool)

(declare-fun b!155829 () Bool)

(assert (=> b!155829 (= e!105134 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3196 (buf!3699 lt!242490))) ((_ sign_extend 32) (currentByte!6772 lt!242490)) ((_ sign_extend 32) (currentBit!6767 lt!242490)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!155828 () Bool)

(assert (=> b!155828 (= e!105133 e!105134)))

(declare-fun res!130295 () Bool)

(assert (=> b!155828 (=> (not res!130295) (not e!105134))))

(assert (=> b!155828 (= res!130295 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-datatypes ((tuple2!13822 0))(
  ( (tuple2!13823 (_1!7337 BitStream!5650) (_2!7337 (_ BitVec 8))) )
))
(declare-fun lt!242491 () tuple2!13822)

(declare-fun readBytePure!0 (BitStream!5650) tuple2!13822)

(assert (=> b!155828 (= lt!242491 (readBytePure!0 bs!65))))

(declare-fun withMovedByteIndex!0 (BitStream!5650 (_ BitVec 32)) BitStream!5650)

(assert (=> b!155828 (= lt!242490 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!13824 0))(
  ( (tuple2!13825 (_1!7338 BitStream!5650) (_2!7338 array!7116)) )
))
(declare-fun lt!242489 () tuple2!13824)

(declare-fun arr!153 () array!7116)

(declare-fun readByteArrayLoopPure!0 (BitStream!5650 array!7116 (_ BitVec 32) (_ BitVec 32)) tuple2!13824)

(assert (=> b!155828 (= lt!242489 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!130294 () Bool)

(assert (=> start!30592 (=> (not res!130294) (not e!105133))))

(assert (=> start!30592 (= res!130294 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3196 arr!153))))))

(assert (=> start!30592 e!105133))

(assert (=> start!30592 true))

(assert (=> start!30592 (array_inv!2985 arr!153)))

(declare-fun inv!12 (BitStream!5650) Bool)

(assert (=> start!30592 (and (inv!12 bs!65) e!105131)))

(assert (= (and start!30592 res!130294) b!155827))

(assert (= (and b!155827 res!130293) b!155828))

(assert (= (and b!155828 res!130295) b!155829))

(assert (= start!30592 b!155830))

(declare-fun m!242133 () Bool)

(assert (=> b!155828 m!242133))

(declare-fun m!242135 () Bool)

(assert (=> b!155828 m!242135))

(declare-fun m!242137 () Bool)

(assert (=> b!155828 m!242137))

(declare-fun m!242139 () Bool)

(assert (=> start!30592 m!242139))

(declare-fun m!242141 () Bool)

(assert (=> start!30592 m!242141))

(declare-fun m!242143 () Bool)

(assert (=> b!155830 m!242143))

(declare-fun m!242145 () Bool)

(assert (=> b!155827 m!242145))

(declare-fun m!242147 () Bool)

(assert (=> b!155829 m!242147))

(push 1)

(assert (not b!155830))

(assert (not b!155828))

(assert (not b!155827))

(assert (not start!30592))

(assert (not b!155829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51616 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51616 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3196 (buf!3699 lt!242490))) ((_ sign_extend 32) (currentByte!6772 lt!242490)) ((_ sign_extend 32) (currentBit!6767 lt!242490)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3196 (buf!3699 lt!242490))) ((_ sign_extend 32) (currentByte!6772 lt!242490)) ((_ sign_extend 32) (currentBit!6767 lt!242490))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12630 () Bool)

(assert (= bs!12630 d!51616))

(declare-fun m!242181 () Bool)

(assert (=> bs!12630 m!242181))

(assert (=> b!155829 d!51616))

(declare-fun d!51618 () Bool)

(declare-datatypes ((tuple2!13834 0))(
  ( (tuple2!13835 (_1!7343 (_ BitVec 8)) (_2!7343 BitStream!5650)) )
))
(declare-fun lt!242512 () tuple2!13834)

(declare-fun readByte!0 (BitStream!5650) tuple2!13834)

(assert (=> d!51618 (= lt!242512 (readByte!0 bs!65))))

(assert (=> d!51618 (= (readBytePure!0 bs!65) (tuple2!13823 (_2!7343 lt!242512) (_1!7343 lt!242512)))))

(declare-fun bs!12631 () Bool)

(assert (= bs!12631 d!51618))

(declare-fun m!242183 () Bool)

(assert (=> bs!12631 m!242183))

(assert (=> b!155828 d!51618))

(declare-fun d!51620 () Bool)

(declare-datatypes ((Unit!9844 0))(
  ( (Unit!9845) )
))
(declare-datatypes ((tuple2!13836 0))(
  ( (tuple2!13837 (_1!7344 Unit!9844) (_2!7344 BitStream!5650)) )
))
(declare-fun moveByteIndex!0 (BitStream!5650 (_ BitVec 32)) tuple2!13836)

(assert (=> d!51620 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7344 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12632 () Bool)

(assert (= bs!12632 d!51620))

(declare-fun m!242185 () Bool)

(assert (=> bs!12632 m!242185))

(assert (=> b!155828 d!51620))

(declare-datatypes ((tuple3!618 0))(
  ( (tuple3!619 (_1!7345 Unit!9844) (_2!7345 BitStream!5650) (_3!426 array!7116)) )
))
(declare-fun lt!242515 () tuple3!618)

(declare-fun d!51622 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5650 array!7116 (_ BitVec 32) (_ BitVec 32)) tuple3!618)

(assert (=> d!51622 (= lt!242515 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51622 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13825 (_2!7345 lt!242515) (_3!426 lt!242515)))))

(declare-fun bs!12633 () Bool)

(assert (= bs!12633 d!51622))

(declare-fun m!242187 () Bool)

(assert (=> bs!12633 m!242187))

(assert (=> b!155828 d!51622))

(declare-fun d!51626 () Bool)

(assert (=> d!51626 (= (array_inv!2985 arr!153) (bvsge (size!3196 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30592 d!51626))

(declare-fun d!51630 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51630 (= (inv!12 bs!65) (invariant!0 (currentBit!6767 bs!65) (currentByte!6772 bs!65) (size!3196 (buf!3699 bs!65))))))

(declare-fun bs!12635 () Bool)

(assert (= bs!12635 d!51630))

(declare-fun m!242191 () Bool)

(assert (=> bs!12635 m!242191))

(assert (=> start!30592 d!51630))

(declare-fun d!51634 () Bool)

(assert (=> d!51634 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3196 (buf!3699 bs!65))) ((_ sign_extend 32) (currentByte!6772 bs!65)) ((_ sign_extend 32) (currentBit!6767 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3196 (buf!3699 bs!65))) ((_ sign_extend 32) (currentByte!6772 bs!65)) ((_ sign_extend 32) (currentBit!6767 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12636 () Bool)

(assert (= bs!12636 d!51634))

(declare-fun m!242193 () Bool)

(assert (=> bs!12636 m!242193))

(assert (=> b!155827 d!51634))

(declare-fun d!51636 () Bool)

(assert (=> d!51636 (= (array_inv!2985 (buf!3699 bs!65)) (bvsge (size!3196 (buf!3699 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155830 d!51636))

(push 1)

(assert (not d!51630))

(assert (not d!51622))

(assert (not d!51620))

(assert (not d!51616))

(assert (not d!51634))

(assert (not d!51618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!242762 () tuple3!618)

(declare-fun e!105193 () Bool)

(declare-fun b!155892 () Bool)

(declare-fun arrayRangesEq!414 (array!7116 array!7116 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155892 (= e!105193 (arrayRangesEq!414 arr!153 (_3!426 lt!242762) #b00000000000000000000000000000000 from!240))))

(declare-fun lt!242738 () tuple2!13834)

(declare-fun c!8289 () Bool)

(declare-fun call!2303 () (_ BitVec 64))

(declare-fun bm!2298 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> bm!2298 (= call!2303 (bitIndex!0 (ite c!8289 (size!3196 (buf!3699 (_2!7343 lt!242738))) (size!3196 (buf!3699 bs!65))) (ite c!8289 (currentByte!6772 (_2!7343 lt!242738)) (currentByte!6772 bs!65)) (ite c!8289 (currentBit!6767 (_2!7343 lt!242738)) (currentBit!6767 bs!65))))))

(declare-fun b!155893 () Bool)

(declare-fun e!105194 () tuple3!618)

(declare-fun lt!242735 () Unit!9844)

(assert (=> b!155893 (= e!105194 (tuple3!619 lt!242735 bs!65 arr!153))))

(assert (=> b!155893 (= call!2303 call!2303)))

(declare-fun lt!242736 () Unit!9844)

(declare-fun Unit!9862 () Unit!9844)

(assert (=> b!155893 (= lt!242736 Unit!9862)))

(declare-fun lt!242759 () Unit!9844)

(declare-fun arrayRangesEqReflexiveLemma!25 (array!7116) Unit!9844)

(assert (=> b!155893 (= lt!242759 (arrayRangesEqReflexiveLemma!25 arr!153))))

(declare-fun call!2301 () Bool)

(assert (=> b!155893 call!2301))

(declare-fun lt!242747 () Unit!9844)

(assert (=> b!155893 (= lt!242747 lt!242759)))

(declare-fun lt!242737 () array!7116)

(assert (=> b!155893 (= lt!242737 arr!153)))

(declare-fun lt!242748 () array!7116)

(assert (=> b!155893 (= lt!242748 arr!153)))

(declare-fun lt!242740 () (_ BitVec 32))

(assert (=> b!155893 (= lt!242740 #b00000000000000000000000000000000)))

(declare-fun lt!242730 () (_ BitVec 32))

(assert (=> b!155893 (= lt!242730 (size!3196 arr!153))))

(declare-fun lt!242756 () (_ BitVec 32))

(assert (=> b!155893 (= lt!242756 #b00000000000000000000000000000000)))

(declare-fun lt!242729 () (_ BitVec 32))

(assert (=> b!155893 (= lt!242729 from!240)))

(declare-fun arrayRangesEqSlicedLemma!25 (array!7116 array!7116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9844)

(assert (=> b!155893 (= lt!242735 (arrayRangesEqSlicedLemma!25 lt!242737 lt!242748 lt!242740 lt!242730 lt!242756 lt!242729))))

(declare-fun call!2302 () Bool)

(assert (=> b!155893 call!2302))

(declare-fun lt!242764 () (_ BitVec 32))

(declare-fun bm!2299 () Bool)

(declare-fun lt!242742 () tuple3!618)

(assert (=> bm!2299 (= call!2301 (arrayRangesEq!414 arr!153 (ite c!8289 (_3!426 lt!242742) arr!153) (ite c!8289 lt!242764 #b00000000000000000000000000000000) (ite c!8289 from!240 (size!3196 arr!153))))))

(declare-fun b!155894 () Bool)

(declare-fun lt!242743 () Unit!9844)

(assert (=> b!155894 (= e!105194 (tuple3!619 lt!242743 (_2!7345 lt!242742) (_3!426 lt!242742)))))

(assert (=> b!155894 (= lt!242738 (readByte!0 bs!65))))

(declare-fun lt!242760 () array!7116)

(assert (=> b!155894 (= lt!242760 (array!7117 (store (arr!4028 arr!153) from!240 (_1!7343 lt!242738)) (size!3196 arr!153)))))

(declare-fun lt!242755 () (_ BitVec 64))

(assert (=> b!155894 (= lt!242755 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!242754 () (_ BitVec 32))

(assert (=> b!155894 (= lt!242754 (bvsub to!236 from!240))))

(declare-fun lt!242734 () Unit!9844)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5650 BitStream!5650 (_ BitVec 64) (_ BitVec 32)) Unit!9844)

(assert (=> b!155894 (= lt!242734 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7343 lt!242738) lt!242755 lt!242754))))

(assert (=> b!155894 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3196 (buf!3699 (_2!7343 lt!242738)))) ((_ sign_extend 32) (currentByte!6772 (_2!7343 lt!242738))) ((_ sign_extend 32) (currentBit!6767 (_2!7343 lt!242738))) (bvsub lt!242754 ((_ extract 31 0) (bvsdiv (bvadd lt!242755 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!242739 () Unit!9844)

(assert (=> b!155894 (= lt!242739 lt!242734)))

(assert (=> b!155894 (= lt!242742 (readByteArrayLoop!0 (_2!7343 lt!242738) lt!242760 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!155894 (= call!2303 (bvadd (bitIndex!0 (size!3196 (buf!3699 bs!65)) (currentByte!6772 bs!65) (currentBit!6767 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!242746 () Unit!9844)

(declare-fun Unit!9863 () Unit!9844)

(assert (=> b!155894 (= lt!242746 Unit!9863)))

(assert (=> b!155894 (= (bvadd call!2303 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3196 (buf!3699 (_2!7345 lt!242742))) (currentByte!6772 (_2!7345 lt!242742)) (currentBit!6767 (_2!7345 lt!242742))))))

(declare-fun lt!242757 () Unit!9844)

(declare-fun Unit!9864 () Unit!9844)

(assert (=> b!155894 (= lt!242757 Unit!9864)))

(assert (=> b!155894 (= (bvadd (bitIndex!0 (size!3196 (buf!3699 bs!65)) (currentByte!6772 bs!65) (currentBit!6767 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3196 (buf!3699 (_2!7345 lt!242742))) (currentByte!6772 (_2!7345 lt!242742)) (currentBit!6767 (_2!7345 lt!242742))))))

(declare-fun lt!242751 () Unit!9844)

(declare-fun Unit!9865 () Unit!9844)

(assert (=> b!155894 (= lt!242751 Unit!9865)))

(assert (=> b!155894 (and (= (buf!3699 bs!65) (buf!3699 (_2!7345 lt!242742))) (= (size!3196 arr!153) (size!3196 (_3!426 lt!242742))))))

(declare-fun lt!242745 () Unit!9844)

(declare-fun Unit!9866 () Unit!9844)

(assert (=> b!155894 (= lt!242745 Unit!9866)))

(declare-fun lt!242761 () Unit!9844)

(declare-fun arrayUpdatedAtPrefixLemma!25 (array!7116 (_ BitVec 32) (_ BitVec 8)) Unit!9844)

(assert (=> b!155894 (= lt!242761 (arrayUpdatedAtPrefixLemma!25 arr!153 from!240 (_1!7343 lt!242738)))))

(assert (=> b!155894 (arrayRangesEq!414 arr!153 (array!7117 (store (arr!4028 arr!153) from!240 (_1!7343 lt!242738)) (size!3196 arr!153)) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!242749 () Unit!9844)

(assert (=> b!155894 (= lt!242749 lt!242761)))

(assert (=> b!155894 (= lt!242764 #b00000000000000000000000000000000)))

(declare-fun lt!242752 () Unit!9844)

(declare-fun arrayRangesEqTransitive!90 (array!7116 array!7116 array!7116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9844)

(assert (=> b!155894 (= lt!242752 (arrayRangesEqTransitive!90 arr!153 lt!242760 (_3!426 lt!242742) lt!242764 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155894 call!2301))

(declare-fun lt!242763 () Unit!9844)

(assert (=> b!155894 (= lt!242763 lt!242752)))

(assert (=> b!155894 call!2302))

(declare-fun lt!242750 () Unit!9844)

(declare-fun Unit!9867 () Unit!9844)

(assert (=> b!155894 (= lt!242750 Unit!9867)))

(declare-fun lt!242732 () Unit!9844)

(declare-fun arrayRangesEqImpliesEq!34 (array!7116 array!7116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9844)

(assert (=> b!155894 (= lt!242732 (arrayRangesEqImpliesEq!34 lt!242760 (_3!426 lt!242742) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155894 (= (select (store (arr!4028 arr!153) from!240 (_1!7343 lt!242738)) from!240) (select (arr!4028 (_3!426 lt!242742)) from!240))))

(declare-fun lt!242744 () Unit!9844)

(assert (=> b!155894 (= lt!242744 lt!242732)))

(declare-fun lt!242753 () Bool)

(assert (=> b!155894 (= lt!242753 (= (select (arr!4028 (_3!426 lt!242742)) from!240) (_1!7343 lt!242738)))))

(declare-fun Unit!9869 () Unit!9844)

(assert (=> b!155894 (= lt!242743 Unit!9869)))

(assert (=> b!155894 lt!242753))

(declare-fun bm!2300 () Bool)

(assert (=> bm!2300 (= call!2302 (arrayRangesEq!414 (ite c!8289 arr!153 lt!242737) (ite c!8289 (_3!426 lt!242742) lt!242748) (ite c!8289 #b00000000000000000000000000000000 lt!242756) (ite c!8289 from!240 lt!242729)))))

(declare-fun d!51674 () Bool)

(declare-fun e!105192 () Bool)

(assert (=> d!51674 e!105192))

(declare-fun res!130344 () Bool)

(assert (=> d!51674 (=> res!130344 e!105192)))

(assert (=> d!51674 (= res!130344 (bvsge from!240 to!236))))

(declare-fun lt!242733 () Bool)

(assert (=> d!51674 (= lt!242733 e!105193)))

(declare-fun res!130342 () Bool)

(assert (=> d!51674 (=> (not res!130342) (not e!105193))))

(declare-fun lt!242741 () (_ BitVec 64))

(declare-fun lt!242731 () (_ BitVec 64))

(assert (=> d!51674 (= res!130342 (= (bvadd lt!242741 lt!242731) (bitIndex!0 (size!3196 (buf!3699 (_2!7345 lt!242762))) (currentByte!6772 (_2!7345 lt!242762)) (currentBit!6767 (_2!7345 lt!242762)))))))

(assert (=> d!51674 (or (not (= (bvand lt!242741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242731 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242741 lt!242731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!242758 () (_ BitVec 64))

(assert (=> d!51674 (= lt!242731 (bvmul lt!242758 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51674 (or (= lt!242758 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!242758 #b0000000000000000000000000000000000000000000000000000000000001000) lt!242758)))))

(assert (=> d!51674 (= lt!242758 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51674 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51674 (= lt!242741 (bitIndex!0 (size!3196 (buf!3699 bs!65)) (currentByte!6772 bs!65) (currentBit!6767 bs!65)))))

(assert (=> d!51674 (= lt!242762 e!105194)))

(assert (=> d!51674 (= c!8289 (bvslt from!240 to!236))))

(assert (=> d!51674 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3196 arr!153)))))

(assert (=> d!51674 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!242762)))

(declare-fun b!155895 () Bool)

(declare-fun res!130343 () Bool)

(assert (=> b!155895 (=> (not res!130343) (not e!105193))))

(assert (=> b!155895 (= res!130343 (and (= (buf!3699 bs!65) (buf!3699 (_2!7345 lt!242762))) (= (size!3196 arr!153) (size!3196 (_3!426 lt!242762)))))))

(declare-fun b!155896 () Bool)

(assert (=> b!155896 (= e!105192 (= (select (arr!4028 (_3!426 lt!242762)) from!240) (_2!7337 (readBytePure!0 bs!65))))))

(assert (=> b!155896 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3196 (_3!426 lt!242762))))))

(assert (= (and d!51674 c!8289) b!155894))

(assert (= (and d!51674 (not c!8289)) b!155893))

(assert (= (or b!155894 b!155893) bm!2300))

(assert (= (or b!155894 b!155893) bm!2299))

(assert (= (or b!155894 b!155893) bm!2298))

(assert (= (and d!51674 res!130342) b!155895))

(assert (= (and b!155895 res!130343) b!155892))

(assert (= (and d!51674 (not res!130344)) b!155896))

(declare-fun m!242269 () Bool)

(assert (=> b!155892 m!242269))

(declare-fun m!242271 () Bool)

(assert (=> b!155894 m!242271))

(declare-fun m!242273 () Bool)

(assert (=> b!155894 m!242273))

(declare-fun m!242275 () Bool)

(assert (=> b!155894 m!242275))

(declare-fun m!242277 () Bool)

(assert (=> b!155894 m!242277))

(declare-fun m!242279 () Bool)

(assert (=> b!155894 m!242279))

(declare-fun m!242281 () Bool)

(assert (=> b!155894 m!242281))

(declare-fun m!242283 () Bool)

(assert (=> b!155894 m!242283))

(declare-fun m!242285 () Bool)

(assert (=> b!155894 m!242285))

(declare-fun m!242287 () Bool)

(assert (=> b!155894 m!242287))

(declare-fun m!242289 () Bool)

(assert (=> b!155894 m!242289))

(declare-fun m!242291 () Bool)

(assert (=> b!155894 m!242291))

(declare-fun m!242293 () Bool)

(assert (=> b!155894 m!242293))

(assert (=> b!155894 m!242183))

(declare-fun m!242295 () Bool)

(assert (=> bm!2298 m!242295))

(declare-fun m!242297 () Bool)

(assert (=> b!155896 m!242297))

(assert (=> b!155896 m!242133))

(declare-fun m!242299 () Bool)

(assert (=> bm!2299 m!242299))

(declare-fun m!242301 () Bool)

(assert (=> d!51674 m!242301))

(assert (=> d!51674 m!242273))

(declare-fun m!242303 () Bool)

(assert (=> b!155893 m!242303))

(declare-fun m!242305 () Bool)

(assert (=> b!155893 m!242305))

(declare-fun m!242307 () Bool)

(assert (=> bm!2300 m!242307))

(assert (=> d!51622 d!51674))

(declare-fun d!51684 () Bool)

(assert (=> d!51684 (= (remainingBits!0 ((_ sign_extend 32) (size!3196 (buf!3699 bs!65))) ((_ sign_extend 32) (currentByte!6772 bs!65)) ((_ sign_extend 32) (currentBit!6767 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3196 (buf!3699 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6772 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6767 bs!65)))))))

(assert (=> d!51634 d!51684))

(declare-fun d!51686 () Bool)

(assert (=> d!51686 (= (invariant!0 (currentBit!6767 bs!65) (currentByte!6772 bs!65) (size!3196 (buf!3699 bs!65))) (and (bvsge (currentBit!6767 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6767 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6772 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6772 bs!65) (size!3196 (buf!3699 bs!65))) (and (= (currentBit!6767 bs!65) #b00000000000000000000000000000000) (= (currentByte!6772 bs!65) (size!3196 (buf!3699 bs!65)))))))))

(assert (=> d!51630 d!51686))

(declare-fun d!51688 () Bool)

(declare-fun e!105199 () Bool)

(assert (=> d!51688 e!105199))

(declare-fun res!130347 () Bool)

(assert (=> d!51688 (=> (not res!130347) (not e!105199))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5650 (_ BitVec 32)) Bool)

(assert (=> d!51688 (= res!130347 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9871 () Unit!9844)

(assert (=> d!51688 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13837 Unit!9871 (BitStream!5651 (buf!3699 bs!65) (bvadd (currentByte!6772 bs!65) #b00000000000000000000000000000001) (currentBit!6767 bs!65))))))

(declare-fun b!155903 () Bool)

(assert (=> b!155903 (= e!105199 (and (or (not (= (bvand (currentByte!6772 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6772 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6772 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6772 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6772 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51688 res!130347) b!155903))

(declare-fun m!242309 () Bool)

(assert (=> d!51688 m!242309))

(assert (=> d!51620 d!51688))

(declare-fun d!51690 () Bool)

(declare-fun lt!242889 () (_ BitVec 8))

(declare-fun lt!242888 () (_ BitVec 8))

(assert (=> d!51690 (= lt!242889 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4028 (buf!3699 bs!65)) (currentByte!6772 bs!65))) ((_ sign_extend 24) lt!242888))))))

(assert (=> d!51690 (= lt!242888 ((_ extract 7 0) (currentBit!6767 bs!65)))))

(declare-fun e!105212 () Bool)

(assert (=> d!51690 e!105212))

(declare-fun res!130363 () Bool)

(assert (=> d!51690 (=> (not res!130363) (not e!105212))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51690 (= res!130363 (validate_offset_bits!1 ((_ sign_extend 32) (size!3196 (buf!3699 bs!65))) ((_ sign_extend 32) (currentByte!6772 bs!65)) ((_ sign_extend 32) (currentBit!6767 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13848 0))(
  ( (tuple2!13849 (_1!7353 Unit!9844) (_2!7353 (_ BitVec 8))) )
))
(declare-fun Unit!9872 () Unit!9844)

(declare-fun Unit!9873 () Unit!9844)

(assert (=> d!51690 (= (readByte!0 bs!65) (tuple2!13835 (_2!7353 (ite (bvsgt ((_ sign_extend 24) lt!242888) #b00000000000000000000000000000000) (tuple2!13849 Unit!9872 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242889) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4028 (buf!3699 bs!65)) (bvadd (currentByte!6772 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242888)))))))) (tuple2!13849 Unit!9873 lt!242889))) (BitStream!5651 (buf!3699 bs!65) (bvadd (currentByte!6772 bs!65) #b00000000000000000000000000000001) (currentBit!6767 bs!65))))))

(declare-fun b!155919 () Bool)

(declare-fun e!105211 () Bool)

(assert (=> b!155919 (= e!105212 e!105211)))

(declare-fun res!130364 () Bool)

(assert (=> b!155919 (=> (not res!130364) (not e!105211))))

(declare-fun lt!242887 () tuple2!13834)

(assert (=> b!155919 (= res!130364 (= (buf!3699 (_2!7343 lt!242887)) (buf!3699 bs!65)))))

(declare-fun lt!242890 () (_ BitVec 8))

(declare-fun lt!242893 () (_ BitVec 8))

(declare-fun Unit!9874 () Unit!9844)

(declare-fun Unit!9875 () Unit!9844)

(assert (=> b!155919 (= lt!242887 (tuple2!13835 (_2!7353 (ite (bvsgt ((_ sign_extend 24) lt!242890) #b00000000000000000000000000000000) (tuple2!13849 Unit!9874 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242893) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4028 (buf!3699 bs!65)) (bvadd (currentByte!6772 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242890)))))))) (tuple2!13849 Unit!9875 lt!242893))) (BitStream!5651 (buf!3699 bs!65) (bvadd (currentByte!6772 bs!65) #b00000000000000000000000000000001) (currentBit!6767 bs!65))))))

(assert (=> b!155919 (= lt!242893 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4028 (buf!3699 bs!65)) (currentByte!6772 bs!65))) ((_ sign_extend 24) lt!242890))))))

(assert (=> b!155919 (= lt!242890 ((_ extract 7 0) (currentBit!6767 bs!65)))))

(declare-fun lt!242891 () (_ BitVec 64))

(declare-fun b!155920 () Bool)

(declare-fun lt!242892 () (_ BitVec 64))

(assert (=> b!155920 (= e!105211 (= (bitIndex!0 (size!3196 (buf!3699 (_2!7343 lt!242887))) (currentByte!6772 (_2!7343 lt!242887)) (currentBit!6767 (_2!7343 lt!242887))) (bvadd lt!242892 lt!242891)))))

(assert (=> b!155920 (or (not (= (bvand lt!242892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242891 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242892 lt!242891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155920 (= lt!242891 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155920 (= lt!242892 (bitIndex!0 (size!3196 (buf!3699 bs!65)) (currentByte!6772 bs!65) (currentBit!6767 bs!65)))))

(assert (= (and d!51690 res!130363) b!155919))

(assert (= (and b!155919 res!130364) b!155920))

(declare-fun m!242351 () Bool)

(assert (=> d!51690 m!242351))

(declare-fun m!242353 () Bool)

(assert (=> d!51690 m!242353))

(declare-fun m!242355 () Bool)

(assert (=> d!51690 m!242355))

(assert (=> b!155919 m!242355))

(assert (=> b!155919 m!242351))

(declare-fun m!242357 () Bool)

(assert (=> b!155920 m!242357))

(assert (=> b!155920 m!242273))

(assert (=> d!51618 d!51690))

(declare-fun d!51698 () Bool)

(assert (=> d!51698 (= (remainingBits!0 ((_ sign_extend 32) (size!3196 (buf!3699 lt!242490))) ((_ sign_extend 32) (currentByte!6772 lt!242490)) ((_ sign_extend 32) (currentBit!6767 lt!242490))) (bvsub (bvmul ((_ sign_extend 32) (size!3196 (buf!3699 lt!242490))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6772 lt!242490)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6767 lt!242490)))))))

(assert (=> d!51616 d!51698))

(push 1)

(assert (not bm!2298))

(assert (not d!51674))

(assert (not b!155894))

(assert (not b!155892))

(assert (not d!51688))

(assert (not b!155893))

(assert (not d!51690))

(assert (not b!155896))

(assert (not bm!2300))

(assert (not b!155920))

(assert (not bm!2299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

