; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30596 () Bool)

(assert start!30596)

(declare-fun res!130313 () Bool)

(declare-fun e!105163 () Bool)

(assert (=> start!30596 (=> (not res!130313) (not e!105163))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7120 0))(
  ( (array!7121 (arr!4030 (Array (_ BitVec 32) (_ BitVec 8))) (size!3198 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7120)

(assert (=> start!30596 (= res!130313 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3198 arr!153))))))

(assert (=> start!30596 e!105163))

(assert (=> start!30596 true))

(declare-fun array_inv!2987 (array!7120) Bool)

(assert (=> start!30596 (array_inv!2987 arr!153)))

(declare-datatypes ((BitStream!5654 0))(
  ( (BitStream!5655 (buf!3701 array!7120) (currentByte!6774 (_ BitVec 32)) (currentBit!6769 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5654)

(declare-fun e!105162 () Bool)

(declare-fun inv!12 (BitStream!5654) Bool)

(assert (=> start!30596 (and (inv!12 bs!65) e!105162)))

(declare-fun b!155851 () Bool)

(declare-fun res!130311 () Bool)

(assert (=> b!155851 (=> (not res!130311) (not e!105163))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155851 (= res!130311 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3198 (buf!3701 bs!65))) ((_ sign_extend 32) (currentByte!6774 bs!65)) ((_ sign_extend 32) (currentBit!6769 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155854 () Bool)

(assert (=> b!155854 (= e!105162 (array_inv!2987 (buf!3701 bs!65)))))

(declare-fun b!155852 () Bool)

(declare-fun e!105160 () Bool)

(assert (=> b!155852 (= e!105163 e!105160)))

(declare-fun res!130312 () Bool)

(assert (=> b!155852 (=> (not res!130312) (not e!105160))))

(assert (=> b!155852 (= res!130312 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-datatypes ((tuple2!13830 0))(
  ( (tuple2!13831 (_1!7341 BitStream!5654) (_2!7341 (_ BitVec 8))) )
))
(declare-fun lt!242507 () tuple2!13830)

(declare-fun readBytePure!0 (BitStream!5654) tuple2!13830)

(assert (=> b!155852 (= lt!242507 (readBytePure!0 bs!65))))

(declare-fun lt!242508 () BitStream!5654)

(declare-fun withMovedByteIndex!0 (BitStream!5654 (_ BitVec 32)) BitStream!5654)

(assert (=> b!155852 (= lt!242508 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!13832 0))(
  ( (tuple2!13833 (_1!7342 BitStream!5654) (_2!7342 array!7120)) )
))
(declare-fun lt!242509 () tuple2!13832)

(declare-fun readByteArrayLoopPure!0 (BitStream!5654 array!7120 (_ BitVec 32) (_ BitVec 32)) tuple2!13832)

(assert (=> b!155852 (= lt!242509 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155853 () Bool)

(assert (=> b!155853 (= e!105160 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3198 (buf!3701 lt!242508))) ((_ sign_extend 32) (currentByte!6774 lt!242508)) ((_ sign_extend 32) (currentBit!6769 lt!242508)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(assert (= (and start!30596 res!130313) b!155851))

(assert (= (and b!155851 res!130311) b!155852))

(assert (= (and b!155852 res!130312) b!155853))

(assert (= start!30596 b!155854))

(declare-fun m!242165 () Bool)

(assert (=> b!155851 m!242165))

(declare-fun m!242167 () Bool)

(assert (=> b!155853 m!242167))

(declare-fun m!242169 () Bool)

(assert (=> b!155852 m!242169))

(declare-fun m!242171 () Bool)

(assert (=> b!155852 m!242171))

(declare-fun m!242173 () Bool)

(assert (=> b!155852 m!242173))

(declare-fun m!242175 () Bool)

(assert (=> b!155854 m!242175))

(declare-fun m!242177 () Bool)

(assert (=> start!30596 m!242177))

(declare-fun m!242179 () Bool)

(assert (=> start!30596 m!242179))

(push 1)

(assert (not b!155853))

(assert (not b!155854))

(assert (not b!155852))

(assert (not start!30596))

(assert (not b!155851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51624 () Bool)

(assert (=> d!51624 (= (array_inv!2987 arr!153) (bvsge (size!3198 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30596 d!51624))

(declare-fun d!51628 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51628 (= (inv!12 bs!65) (invariant!0 (currentBit!6769 bs!65) (currentByte!6774 bs!65) (size!3198 (buf!3701 bs!65))))))

(declare-fun bs!12634 () Bool)

(assert (= bs!12634 d!51628))

(declare-fun m!242189 () Bool)

(assert (=> bs!12634 m!242189))

(assert (=> start!30596 d!51628))

(declare-fun d!51632 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51632 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3198 (buf!3701 bs!65))) ((_ sign_extend 32) (currentByte!6774 bs!65)) ((_ sign_extend 32) (currentBit!6769 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3198 (buf!3701 bs!65))) ((_ sign_extend 32) (currentByte!6774 bs!65)) ((_ sign_extend 32) (currentBit!6769 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12637 () Bool)

(assert (= bs!12637 d!51632))

(declare-fun m!242195 () Bool)

(assert (=> bs!12637 m!242195))

(assert (=> b!155851 d!51632))

(declare-fun d!51638 () Bool)

(assert (=> d!51638 (= (array_inv!2987 (buf!3701 bs!65)) (bvsge (size!3198 (buf!3701 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155854 d!51638))

(declare-fun d!51640 () Bool)

(assert (=> d!51640 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3198 (buf!3701 lt!242508))) ((_ sign_extend 32) (currentByte!6774 lt!242508)) ((_ sign_extend 32) (currentBit!6769 lt!242508)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3198 (buf!3701 lt!242508))) ((_ sign_extend 32) (currentByte!6774 lt!242508)) ((_ sign_extend 32) (currentBit!6769 lt!242508))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12638 () Bool)

(assert (= bs!12638 d!51640))

(declare-fun m!242197 () Bool)

(assert (=> bs!12638 m!242197))

(assert (=> b!155853 d!51640))

(declare-fun d!51642 () Bool)

(declare-datatypes ((tuple2!13838 0))(
  ( (tuple2!13839 (_1!7346 (_ BitVec 8)) (_2!7346 BitStream!5654)) )
))
(declare-fun lt!242518 () tuple2!13838)

(declare-fun readByte!0 (BitStream!5654) tuple2!13838)

(assert (=> d!51642 (= lt!242518 (readByte!0 bs!65))))

(assert (=> d!51642 (= (readBytePure!0 bs!65) (tuple2!13831 (_2!7346 lt!242518) (_1!7346 lt!242518)))))

(declare-fun bs!12639 () Bool)

(assert (= bs!12639 d!51642))

(declare-fun m!242199 () Bool)

(assert (=> bs!12639 m!242199))

(assert (=> b!155852 d!51642))

(declare-fun d!51644 () Bool)

(declare-datatypes ((Unit!9846 0))(
  ( (Unit!9847) )
))
(declare-datatypes ((tuple2!13840 0))(
  ( (tuple2!13841 (_1!7347 Unit!9846) (_2!7347 BitStream!5654)) )
))
(declare-fun moveByteIndex!0 (BitStream!5654 (_ BitVec 32)) tuple2!13840)

(assert (=> d!51644 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7347 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12640 () Bool)

(assert (= bs!12640 d!51644))

(declare-fun m!242201 () Bool)

(assert (=> bs!12640 m!242201))

(assert (=> b!155852 d!51644))

(declare-fun d!51646 () Bool)

(declare-datatypes ((tuple3!620 0))(
  ( (tuple3!621 (_1!7348 Unit!9846) (_2!7348 BitStream!5654) (_3!427 array!7120)) )
))
(declare-fun lt!242521 () tuple3!620)

(declare-fun readByteArrayLoop!0 (BitStream!5654 array!7120 (_ BitVec 32) (_ BitVec 32)) tuple3!620)

(assert (=> d!51646 (= lt!242521 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51646 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13833 (_2!7348 lt!242521) (_3!427 lt!242521)))))

(declare-fun bs!12641 () Bool)

(assert (= bs!12641 d!51646))

(declare-fun m!242203 () Bool)

(assert (=> bs!12641 m!242203))

(assert (=> b!155852 d!51646))

(push 1)

(assert (not d!51640))

(assert (not d!51642))

(assert (not d!51644))

(assert (not d!51646))

(assert (not d!51628))

(assert (not d!51632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51676 () Bool)

(declare-fun e!105170 () Bool)

(assert (=> d!51676 e!105170))

(declare-fun res!130319 () Bool)

(assert (=> d!51676 (=> (not res!130319) (not e!105170))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5654 (_ BitVec 32)) Bool)

(assert (=> d!51676 (= res!130319 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9868 () Unit!9846)

(assert (=> d!51676 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13841 Unit!9868 (BitStream!5655 (buf!3701 bs!65) (bvadd (currentByte!6774 bs!65) #b00000000000000000000000000000001) (currentBit!6769 bs!65))))))

(declare-fun b!155860 () Bool)

(assert (=> b!155860 (= e!105170 (and (or (not (= (bvand (currentByte!6774 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6774 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6774 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6774 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6774 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51676 res!130319) b!155860))

(declare-fun m!242219 () Bool)

(assert (=> d!51676 m!242219))

(assert (=> d!51644 d!51676))

(declare-fun d!51678 () Bool)

(assert (=> d!51678 (= (invariant!0 (currentBit!6769 bs!65) (currentByte!6774 bs!65) (size!3198 (buf!3701 bs!65))) (and (bvsge (currentBit!6769 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6769 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6774 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6774 bs!65) (size!3198 (buf!3701 bs!65))) (and (= (currentBit!6769 bs!65) #b00000000000000000000000000000000) (= (currentByte!6774 bs!65) (size!3198 (buf!3701 bs!65)))))))))

(assert (=> d!51628 d!51678))

(declare-fun b!155910 () Bool)

(declare-fun lt!242854 () tuple3!620)

(declare-fun e!105205 () Bool)

(assert (=> b!155910 (= e!105205 (= (select (arr!4030 (_3!427 lt!242854)) from!240) (_2!7341 (readBytePure!0 bs!65))))))

(assert (=> b!155910 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3198 (_3!427 lt!242854))))))

(declare-fun e!105206 () tuple3!620)

(declare-fun b!155911 () Bool)

(declare-fun lt!242863 () Unit!9846)

(assert (=> b!155911 (= e!105206 (tuple3!621 lt!242863 bs!65 arr!153))))

(declare-fun call!2310 () (_ BitVec 64))

(assert (=> b!155911 (= call!2310 call!2310)))

(declare-fun lt!242856 () Unit!9846)

(declare-fun Unit!9870 () Unit!9846)

(assert (=> b!155911 (= lt!242856 Unit!9870)))

(declare-fun lt!242855 () Unit!9846)

(declare-fun arrayRangesEqReflexiveLemma!26 (array!7120) Unit!9846)

(assert (=> b!155911 (= lt!242855 (arrayRangesEqReflexiveLemma!26 arr!153))))

(declare-fun call!2312 () Bool)

(assert (=> b!155911 call!2312))

(declare-fun lt!242857 () Unit!9846)

(assert (=> b!155911 (= lt!242857 lt!242855)))

(declare-fun lt!242853 () array!7120)

(assert (=> b!155911 (= lt!242853 arr!153)))

(declare-fun lt!242838 () array!7120)

(assert (=> b!155911 (= lt!242838 arr!153)))

(declare-fun lt!242850 () (_ BitVec 32))

(assert (=> b!155911 (= lt!242850 #b00000000000000000000000000000000)))

(declare-fun lt!242864 () (_ BitVec 32))

(assert (=> b!155911 (= lt!242864 (size!3198 arr!153))))

(declare-fun lt!242839 () (_ BitVec 32))

(assert (=> b!155911 (= lt!242839 #b00000000000000000000000000000000)))

(declare-fun lt!242860 () (_ BitVec 32))

(assert (=> b!155911 (= lt!242860 from!240)))

(declare-fun arrayRangesEqSlicedLemma!26 (array!7120 array!7120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9846)

(assert (=> b!155911 (= lt!242863 (arrayRangesEqSlicedLemma!26 lt!242853 lt!242838 lt!242850 lt!242864 lt!242839 lt!242860))))

(declare-fun call!2311 () Bool)

(assert (=> b!155911 call!2311))

(declare-fun b!155912 () Bool)

(declare-fun res!130355 () Bool)

(declare-fun e!105204 () Bool)

(assert (=> b!155912 (=> (not res!130355) (not e!105204))))

(assert (=> b!155912 (= res!130355 (and (= (buf!3701 bs!65) (buf!3701 (_2!7348 lt!242854))) (= (size!3198 arr!153) (size!3198 (_3!427 lt!242854)))))))

(declare-fun b!155913 () Bool)

(declare-fun arrayRangesEq!415 (array!7120 array!7120 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155913 (= e!105204 (arrayRangesEq!415 arr!153 (_3!427 lt!242854) #b00000000000000000000000000000000 from!240))))

(declare-fun d!51680 () Bool)

(assert (=> d!51680 e!105205))

(declare-fun res!130356 () Bool)

(assert (=> d!51680 (=> res!130356 e!105205)))

(assert (=> d!51680 (= res!130356 (bvsge from!240 to!236))))

(declare-fun lt!242859 () Bool)

(assert (=> d!51680 (= lt!242859 e!105204)))

(declare-fun res!130357 () Bool)

(assert (=> d!51680 (=> (not res!130357) (not e!105204))))

(declare-fun lt!242862 () (_ BitVec 64))

(declare-fun lt!242871 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!51680 (= res!130357 (= (bvadd lt!242871 lt!242862) (bitIndex!0 (size!3198 (buf!3701 (_2!7348 lt!242854))) (currentByte!6774 (_2!7348 lt!242854)) (currentBit!6769 (_2!7348 lt!242854)))))))

(assert (=> d!51680 (or (not (= (bvand lt!242871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242862 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242871 lt!242862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!242848 () (_ BitVec 64))

(assert (=> d!51680 (= lt!242862 (bvmul lt!242848 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51680 (or (= lt!242848 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!242848 #b0000000000000000000000000000000000000000000000000000000000001000) lt!242848)))))

(assert (=> d!51680 (= lt!242848 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51680 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51680 (= lt!242871 (bitIndex!0 (size!3198 (buf!3701 bs!65)) (currentByte!6774 bs!65) (currentBit!6769 bs!65)))))

(assert (=> d!51680 (= lt!242854 e!105206)))

(declare-fun c!8292 () Bool)

(assert (=> d!51680 (= c!8292 (bvslt from!240 to!236))))

(assert (=> d!51680 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3198 arr!153)))))

(assert (=> d!51680 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!242854)))

(declare-fun b!155914 () Bool)

(declare-fun lt!242849 () Unit!9846)

(declare-fun lt!242847 () tuple3!620)

(assert (=> b!155914 (= e!105206 (tuple3!621 lt!242849 (_2!7348 lt!242847) (_3!427 lt!242847)))))

(declare-fun lt!242852 () tuple2!13838)

(assert (=> b!155914 (= lt!242852 (readByte!0 bs!65))))

(declare-fun lt!242861 () array!7120)

(assert (=> b!155914 (= lt!242861 (array!7121 (store (arr!4030 arr!153) from!240 (_1!7346 lt!242852)) (size!3198 arr!153)))))

(declare-fun lt!242844 () (_ BitVec 64))

(assert (=> b!155914 (= lt!242844 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!242865 () (_ BitVec 32))

(assert (=> b!155914 (= lt!242865 (bvsub to!236 from!240))))

(declare-fun lt!242869 () Unit!9846)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5654 BitStream!5654 (_ BitVec 64) (_ BitVec 32)) Unit!9846)

(assert (=> b!155914 (= lt!242869 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7346 lt!242852) lt!242844 lt!242865))))

(assert (=> b!155914 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3198 (buf!3701 (_2!7346 lt!242852)))) ((_ sign_extend 32) (currentByte!6774 (_2!7346 lt!242852))) ((_ sign_extend 32) (currentBit!6769 (_2!7346 lt!242852))) (bvsub lt!242865 ((_ extract 31 0) (bvsdiv (bvadd lt!242844 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!242867 () Unit!9846)

(assert (=> b!155914 (= lt!242867 lt!242869)))

(assert (=> b!155914 (= lt!242847 (readByteArrayLoop!0 (_2!7346 lt!242852) lt!242861 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!155914 (= call!2310 (bvadd (bitIndex!0 (size!3198 (buf!3701 bs!65)) (currentByte!6774 bs!65) (currentBit!6769 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!242858 () Unit!9846)

(declare-fun Unit!9876 () Unit!9846)

(assert (=> b!155914 (= lt!242858 Unit!9876)))

(assert (=> b!155914 (= (bvadd call!2310 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3198 (buf!3701 (_2!7348 lt!242847))) (currentByte!6774 (_2!7348 lt!242847)) (currentBit!6769 (_2!7348 lt!242847))))))

(declare-fun lt!242841 () Unit!9846)

(declare-fun Unit!9877 () Unit!9846)

(assert (=> b!155914 (= lt!242841 Unit!9877)))

(assert (=> b!155914 (= (bvadd (bitIndex!0 (size!3198 (buf!3701 bs!65)) (currentByte!6774 bs!65) (currentBit!6769 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3198 (buf!3701 (_2!7348 lt!242847))) (currentByte!6774 (_2!7348 lt!242847)) (currentBit!6769 (_2!7348 lt!242847))))))

(declare-fun lt!242842 () Unit!9846)

(declare-fun Unit!9878 () Unit!9846)

(assert (=> b!155914 (= lt!242842 Unit!9878)))

(assert (=> b!155914 (and (= (buf!3701 bs!65) (buf!3701 (_2!7348 lt!242847))) (= (size!3198 arr!153) (size!3198 (_3!427 lt!242847))))))

(declare-fun lt!242837 () Unit!9846)

(declare-fun Unit!9879 () Unit!9846)

(assert (=> b!155914 (= lt!242837 Unit!9879)))

(declare-fun lt!242843 () Unit!9846)

(declare-fun arrayUpdatedAtPrefixLemma!26 (array!7120 (_ BitVec 32) (_ BitVec 8)) Unit!9846)

(assert (=> b!155914 (= lt!242843 (arrayUpdatedAtPrefixLemma!26 arr!153 from!240 (_1!7346 lt!242852)))))

(assert (=> b!155914 call!2311))

(declare-fun lt!242851 () Unit!9846)

(assert (=> b!155914 (= lt!242851 lt!242843)))

(declare-fun lt!242846 () (_ BitVec 32))

(assert (=> b!155914 (= lt!242846 #b00000000000000000000000000000000)))

(declare-fun lt!242868 () Unit!9846)

(declare-fun arrayRangesEqTransitive!91 (array!7120 array!7120 array!7120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9846)

(assert (=> b!155914 (= lt!242868 (arrayRangesEqTransitive!91 arr!153 lt!242861 (_3!427 lt!242847) lt!242846 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155914 (arrayRangesEq!415 arr!153 (_3!427 lt!242847) lt!242846 from!240)))

(declare-fun lt!242872 () Unit!9846)

(assert (=> b!155914 (= lt!242872 lt!242868)))

(assert (=> b!155914 call!2312))

(declare-fun lt!242866 () Unit!9846)

(declare-fun Unit!9880 () Unit!9846)

(assert (=> b!155914 (= lt!242866 Unit!9880)))

(declare-fun lt!242845 () Unit!9846)

(declare-fun arrayRangesEqImpliesEq!35 (array!7120 array!7120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9846)

(assert (=> b!155914 (= lt!242845 (arrayRangesEqImpliesEq!35 lt!242861 (_3!427 lt!242847) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155914 (= (select (store (arr!4030 arr!153) from!240 (_1!7346 lt!242852)) from!240) (select (arr!4030 (_3!427 lt!242847)) from!240))))

(declare-fun lt!242840 () Unit!9846)

(assert (=> b!155914 (= lt!242840 lt!242845)))

(declare-fun lt!242870 () Bool)

(assert (=> b!155914 (= lt!242870 (= (select (arr!4030 (_3!427 lt!242847)) from!240) (_1!7346 lt!242852)))))

(declare-fun Unit!9881 () Unit!9846)

(assert (=> b!155914 (= lt!242849 Unit!9881)))

(assert (=> b!155914 lt!242870))

(declare-fun bm!2307 () Bool)

(assert (=> bm!2307 (= call!2311 (arrayRangesEq!415 (ite c!8292 arr!153 lt!242853) (ite c!8292 (array!7121 (store (arr!4030 arr!153) from!240 (_1!7346 lt!242852)) (size!3198 arr!153)) lt!242838) (ite c!8292 #b00000000000000000000000000000000 lt!242839) (ite c!8292 from!240 lt!242860)))))

(declare-fun bm!2308 () Bool)

(assert (=> bm!2308 (= call!2312 (arrayRangesEq!415 arr!153 (ite c!8292 (_3!427 lt!242847) arr!153) #b00000000000000000000000000000000 (ite c!8292 from!240 (size!3198 arr!153))))))

(declare-fun bm!2309 () Bool)

(assert (=> bm!2309 (= call!2310 (bitIndex!0 (ite c!8292 (size!3198 (buf!3701 (_2!7346 lt!242852))) (size!3198 (buf!3701 bs!65))) (ite c!8292 (currentByte!6774 (_2!7346 lt!242852)) (currentByte!6774 bs!65)) (ite c!8292 (currentBit!6769 (_2!7346 lt!242852)) (currentBit!6769 bs!65))))))

(assert (= (and d!51680 c!8292) b!155914))

(assert (= (and d!51680 (not c!8292)) b!155911))

(assert (= (or b!155914 b!155911) bm!2307))

(assert (= (or b!155914 b!155911) bm!2308))

(assert (= (or b!155914 b!155911) bm!2309))

(assert (= (and d!51680 res!130357) b!155912))

(assert (= (and b!155912 res!130355) b!155913))

(assert (= (and d!51680 (not res!130356)) b!155910))

(declare-fun m!242311 () Bool)

(assert (=> b!155913 m!242311))

(declare-fun m!242313 () Bool)

(assert (=> bm!2308 m!242313))

(declare-fun m!242315 () Bool)

(assert (=> bm!2309 m!242315))

(declare-fun m!242317 () Bool)

(assert (=> d!51680 m!242317))

(declare-fun m!242319 () Bool)

(assert (=> d!51680 m!242319))

(declare-fun m!242321 () Bool)

(assert (=> b!155911 m!242321))

(declare-fun m!242323 () Bool)

(assert (=> b!155911 m!242323))

(declare-fun m!242325 () Bool)

(assert (=> b!155910 m!242325))

(assert (=> b!155910 m!242169))

(declare-fun m!242327 () Bool)

(assert (=> b!155914 m!242327))

(declare-fun m!242329 () Bool)

(assert (=> b!155914 m!242329))

(declare-fun m!242331 () Bool)

(assert (=> b!155914 m!242331))

(declare-fun m!242333 () Bool)

(assert (=> b!155914 m!242333))

(declare-fun m!242335 () Bool)

(assert (=> b!155914 m!242335))

(declare-fun m!242337 () Bool)

(assert (=> b!155914 m!242337))

(assert (=> b!155914 m!242199))

(declare-fun m!242339 () Bool)

(assert (=> b!155914 m!242339))

(declare-fun m!242341 () Bool)

(assert (=> b!155914 m!242341))

(declare-fun m!242343 () Bool)

(assert (=> b!155914 m!242343))

(assert (=> b!155914 m!242319))

(declare-fun m!242345 () Bool)

(assert (=> b!155914 m!242345))

(declare-fun m!242347 () Bool)

(assert (=> b!155914 m!242347))

(assert (=> bm!2307 m!242327))

(declare-fun m!242349 () Bool)

(assert (=> bm!2307 m!242349))

(assert (=> d!51646 d!51680))

(declare-fun d!51692 () Bool)

(assert (=> d!51692 (= (remainingBits!0 ((_ sign_extend 32) (size!3198 (buf!3701 bs!65))) ((_ sign_extend 32) (currentByte!6774 bs!65)) ((_ sign_extend 32) (currentBit!6769 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3198 (buf!3701 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6774 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6769 bs!65)))))))

(assert (=> d!51632 d!51692))

(declare-fun d!51694 () Bool)

(assert (=> d!51694 (= (remainingBits!0 ((_ sign_extend 32) (size!3198 (buf!3701 lt!242508))) ((_ sign_extend 32) (currentByte!6774 lt!242508)) ((_ sign_extend 32) (currentBit!6769 lt!242508))) (bvsub (bvmul ((_ sign_extend 32) (size!3198 (buf!3701 lt!242508))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6774 lt!242508)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6769 lt!242508)))))))

(assert (=> d!51640 d!51694))

(declare-fun d!51696 () Bool)

(declare-fun lt!242914 () (_ BitVec 8))

(declare-fun lt!242911 () (_ BitVec 8))

(assert (=> d!51696 (= lt!242914 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4030 (buf!3701 bs!65)) (currentByte!6774 bs!65))) ((_ sign_extend 24) lt!242911))))))

(assert (=> d!51696 (= lt!242911 ((_ extract 7 0) (currentBit!6769 bs!65)))))

(declare-fun e!105217 () Bool)

(assert (=> d!51696 e!105217))

(declare-fun res!130369 () Bool)

(assert (=> d!51696 (=> (not res!130369) (not e!105217))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51696 (= res!130369 (validate_offset_bits!1 ((_ sign_extend 32) (size!3198 (buf!3701 bs!65))) ((_ sign_extend 32) (currentByte!6774 bs!65)) ((_ sign_extend 32) (currentBit!6769 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13850 0))(
  ( (tuple2!13851 (_1!7354 Unit!9846) (_2!7354 (_ BitVec 8))) )
))
(declare-fun Unit!9882 () Unit!9846)

(declare-fun Unit!9883 () Unit!9846)

(assert (=> d!51696 (= (readByte!0 bs!65) (tuple2!13839 (_2!7354 (ite (bvsgt ((_ sign_extend 24) lt!242911) #b00000000000000000000000000000000) (tuple2!13851 Unit!9882 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242914) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4030 (buf!3701 bs!65)) (bvadd (currentByte!6774 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242911)))))))) (tuple2!13851 Unit!9883 lt!242914))) (BitStream!5655 (buf!3701 bs!65) (bvadd (currentByte!6774 bs!65) #b00000000000000000000000000000001) (currentBit!6769 bs!65))))))

(declare-fun b!155925 () Bool)

(declare-fun e!105218 () Bool)

(assert (=> b!155925 (= e!105217 e!105218)))

(declare-fun res!130370 () Bool)

(assert (=> b!155925 (=> (not res!130370) (not e!105218))))

(declare-fun lt!242909 () tuple2!13838)

(assert (=> b!155925 (= res!130370 (= (buf!3701 (_2!7346 lt!242909)) (buf!3701 bs!65)))))

(declare-fun lt!242910 () (_ BitVec 8))

(declare-fun lt!242913 () (_ BitVec 8))

(declare-fun Unit!9884 () Unit!9846)

(declare-fun Unit!9885 () Unit!9846)

(assert (=> b!155925 (= lt!242909 (tuple2!13839 (_2!7354 (ite (bvsgt ((_ sign_extend 24) lt!242913) #b00000000000000000000000000000000) (tuple2!13851 Unit!9884 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242910) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4030 (buf!3701 bs!65)) (bvadd (currentByte!6774 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242913)))))))) (tuple2!13851 Unit!9885 lt!242910))) (BitStream!5655 (buf!3701 bs!65) (bvadd (currentByte!6774 bs!65) #b00000000000000000000000000000001) (currentBit!6769 bs!65))))))

(assert (=> b!155925 (= lt!242910 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4030 (buf!3701 bs!65)) (currentByte!6774 bs!65))) ((_ sign_extend 24) lt!242913))))))

(assert (=> b!155925 (= lt!242913 ((_ extract 7 0) (currentBit!6769 bs!65)))))

(declare-fun b!155926 () Bool)

(declare-fun lt!242912 () (_ BitVec 64))

(declare-fun lt!242908 () (_ BitVec 64))

(assert (=> b!155926 (= e!105218 (= (bitIndex!0 (size!3198 (buf!3701 (_2!7346 lt!242909))) (currentByte!6774 (_2!7346 lt!242909)) (currentBit!6769 (_2!7346 lt!242909))) (bvadd lt!242908 lt!242912)))))

(assert (=> b!155926 (or (not (= (bvand lt!242908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242912 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242908 lt!242912) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155926 (= lt!242912 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155926 (= lt!242908 (bitIndex!0 (size!3198 (buf!3701 bs!65)) (currentByte!6774 bs!65) (currentBit!6769 bs!65)))))

(assert (= (and d!51696 res!130369) b!155925))

(assert (= (and b!155925 res!130370) b!155926))

(declare-fun m!242359 () Bool)

(assert (=> d!51696 m!242359))

(declare-fun m!242361 () Bool)

(assert (=> d!51696 m!242361))

(declare-fun m!242363 () Bool)

(assert (=> d!51696 m!242363))

(assert (=> b!155925 m!242363))

(assert (=> b!155925 m!242359))

(declare-fun m!242365 () Bool)

(assert (=> b!155926 m!242365))

(assert (=> b!155926 m!242319))

(assert (=> d!51642 d!51696))

(push 1)

(assert (not b!155913))

(assert (not d!51680))

(assert (not b!155910))

(assert (not b!155911))

(assert (not bm!2309))

(assert (not bm!2307))

(assert (not b!155914))

(assert (not d!51676))

(assert (not bm!2308))

(assert (not b!155926))

(assert (not d!51696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

