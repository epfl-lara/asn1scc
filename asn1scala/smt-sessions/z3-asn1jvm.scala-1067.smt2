; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30594 () Bool)

(assert start!30594)

(declare-fun b!155840 () Bool)

(declare-fun e!105145 () Bool)

(declare-fun e!105147 () Bool)

(assert (=> b!155840 (= e!105145 e!105147)))

(declare-fun res!130303 () Bool)

(assert (=> b!155840 (=> (not res!130303) (not e!105147))))

(declare-fun from!240 () (_ BitVec 32))

(assert (=> b!155840 (= res!130303 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-datatypes ((array!7118 0))(
  ( (array!7119 (arr!4029 (Array (_ BitVec 32) (_ BitVec 8))) (size!3197 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5652 0))(
  ( (BitStream!5653 (buf!3700 array!7118) (currentByte!6773 (_ BitVec 32)) (currentBit!6768 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13826 0))(
  ( (tuple2!13827 (_1!7339 BitStream!5652) (_2!7339 (_ BitVec 8))) )
))
(declare-fun lt!242498 () tuple2!13826)

(declare-fun bs!65 () BitStream!5652)

(declare-fun readBytePure!0 (BitStream!5652) tuple2!13826)

(assert (=> b!155840 (= lt!242498 (readBytePure!0 bs!65))))

(declare-fun lt!242499 () BitStream!5652)

(declare-fun withMovedByteIndex!0 (BitStream!5652 (_ BitVec 32)) BitStream!5652)

(assert (=> b!155840 (= lt!242499 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((tuple2!13828 0))(
  ( (tuple2!13829 (_1!7340 BitStream!5652) (_2!7340 array!7118)) )
))
(declare-fun lt!242500 () tuple2!13828)

(declare-fun arr!153 () array!7118)

(declare-fun readByteArrayLoopPure!0 (BitStream!5652 array!7118 (_ BitVec 32) (_ BitVec 32)) tuple2!13828)

(assert (=> b!155840 (= lt!242500 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155842 () Bool)

(declare-fun e!105146 () Bool)

(declare-fun array_inv!2986 (array!7118) Bool)

(assert (=> b!155842 (= e!105146 (array_inv!2986 (buf!3700 bs!65)))))

(declare-fun b!155841 () Bool)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155841 (= e!105147 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3197 (buf!3700 lt!242499))) ((_ sign_extend 32) (currentByte!6773 lt!242499)) ((_ sign_extend 32) (currentBit!6768 lt!242499)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!155839 () Bool)

(declare-fun res!130302 () Bool)

(assert (=> b!155839 (=> (not res!130302) (not e!105145))))

(assert (=> b!155839 (= res!130302 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3197 (buf!3700 bs!65))) ((_ sign_extend 32) (currentByte!6773 bs!65)) ((_ sign_extend 32) (currentBit!6768 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!130304 () Bool)

(assert (=> start!30594 (=> (not res!130304) (not e!105145))))

(assert (=> start!30594 (= res!130304 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3197 arr!153))))))

(assert (=> start!30594 e!105145))

(assert (=> start!30594 true))

(assert (=> start!30594 (array_inv!2986 arr!153)))

(declare-fun inv!12 (BitStream!5652) Bool)

(assert (=> start!30594 (and (inv!12 bs!65) e!105146)))

(assert (= (and start!30594 res!130304) b!155839))

(assert (= (and b!155839 res!130302) b!155840))

(assert (= (and b!155840 res!130303) b!155841))

(assert (= start!30594 b!155842))

(declare-fun m!242149 () Bool)

(assert (=> b!155842 m!242149))

(declare-fun m!242151 () Bool)

(assert (=> b!155840 m!242151))

(declare-fun m!242153 () Bool)

(assert (=> b!155840 m!242153))

(declare-fun m!242155 () Bool)

(assert (=> b!155840 m!242155))

(declare-fun m!242157 () Bool)

(assert (=> start!30594 m!242157))

(declare-fun m!242159 () Bool)

(assert (=> start!30594 m!242159))

(declare-fun m!242161 () Bool)

(assert (=> b!155839 m!242161))

(declare-fun m!242163 () Bool)

(assert (=> b!155841 m!242163))

(check-sat (not b!155842) (not start!30594) (not b!155841) (not b!155839) (not b!155840))
(check-sat)
(get-model)

(declare-fun d!51648 () Bool)

(declare-datatypes ((tuple2!13842 0))(
  ( (tuple2!13843 (_1!7349 (_ BitVec 8)) (_2!7349 BitStream!5652)) )
))
(declare-fun lt!242524 () tuple2!13842)

(declare-fun readByte!0 (BitStream!5652) tuple2!13842)

(assert (=> d!51648 (= lt!242524 (readByte!0 bs!65))))

(assert (=> d!51648 (= (readBytePure!0 bs!65) (tuple2!13827 (_2!7349 lt!242524) (_1!7349 lt!242524)))))

(declare-fun bs!12642 () Bool)

(assert (= bs!12642 d!51648))

(declare-fun m!242205 () Bool)

(assert (=> bs!12642 m!242205))

(assert (=> b!155840 d!51648))

(declare-fun d!51650 () Bool)

(declare-datatypes ((Unit!9848 0))(
  ( (Unit!9849) )
))
(declare-datatypes ((tuple2!13844 0))(
  ( (tuple2!13845 (_1!7350 Unit!9848) (_2!7350 BitStream!5652)) )
))
(declare-fun moveByteIndex!0 (BitStream!5652 (_ BitVec 32)) tuple2!13844)

(assert (=> d!51650 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7350 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12643 () Bool)

(assert (= bs!12643 d!51650))

(declare-fun m!242207 () Bool)

(assert (=> bs!12643 m!242207))

(assert (=> b!155840 d!51650))

(declare-datatypes ((tuple3!622 0))(
  ( (tuple3!623 (_1!7351 Unit!9848) (_2!7351 BitStream!5652) (_3!428 array!7118)) )
))
(declare-fun lt!242527 () tuple3!622)

(declare-fun d!51652 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5652 array!7118 (_ BitVec 32) (_ BitVec 32)) tuple3!622)

(assert (=> d!51652 (= lt!242527 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51652 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13829 (_2!7351 lt!242527) (_3!428 lt!242527)))))

(declare-fun bs!12644 () Bool)

(assert (= bs!12644 d!51652))

(declare-fun m!242209 () Bool)

(assert (=> bs!12644 m!242209))

(assert (=> b!155840 d!51652))

(declare-fun d!51654 () Bool)

(assert (=> d!51654 (= (array_inv!2986 arr!153) (bvsge (size!3197 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30594 d!51654))

(declare-fun d!51656 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51656 (= (inv!12 bs!65) (invariant!0 (currentBit!6768 bs!65) (currentByte!6773 bs!65) (size!3197 (buf!3700 bs!65))))))

(declare-fun bs!12645 () Bool)

(assert (= bs!12645 d!51656))

(declare-fun m!242211 () Bool)

(assert (=> bs!12645 m!242211))

(assert (=> start!30594 d!51656))

(declare-fun d!51658 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51658 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3197 (buf!3700 bs!65))) ((_ sign_extend 32) (currentByte!6773 bs!65)) ((_ sign_extend 32) (currentBit!6768 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3197 (buf!3700 bs!65))) ((_ sign_extend 32) (currentByte!6773 bs!65)) ((_ sign_extend 32) (currentBit!6768 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12646 () Bool)

(assert (= bs!12646 d!51658))

(declare-fun m!242213 () Bool)

(assert (=> bs!12646 m!242213))

(assert (=> b!155839 d!51658))

(declare-fun d!51660 () Bool)

(assert (=> d!51660 (= (array_inv!2986 (buf!3700 bs!65)) (bvsge (size!3197 (buf!3700 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155842 d!51660))

(declare-fun d!51662 () Bool)

(assert (=> d!51662 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3197 (buf!3700 lt!242499))) ((_ sign_extend 32) (currentByte!6773 lt!242499)) ((_ sign_extend 32) (currentBit!6768 lt!242499)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3197 (buf!3700 lt!242499))) ((_ sign_extend 32) (currentByte!6773 lt!242499)) ((_ sign_extend 32) (currentBit!6768 lt!242499))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12647 () Bool)

(assert (= bs!12647 d!51662))

(declare-fun m!242215 () Bool)

(assert (=> bs!12647 m!242215))

(assert (=> b!155841 d!51662))

(check-sat (not d!51652) (not d!51650) (not d!51658) (not d!51648) (not d!51662) (not d!51656))
(check-sat)
(get-model)

(declare-fun d!51664 () Bool)

(assert (=> d!51664 (= (remainingBits!0 ((_ sign_extend 32) (size!3197 (buf!3700 bs!65))) ((_ sign_extend 32) (currentByte!6773 bs!65)) ((_ sign_extend 32) (currentBit!6768 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3197 (buf!3700 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6773 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6768 bs!65)))))))

(assert (=> d!51658 d!51664))

(declare-fun d!51666 () Bool)

(assert (=> d!51666 (= (invariant!0 (currentBit!6768 bs!65) (currentByte!6773 bs!65) (size!3197 (buf!3700 bs!65))) (and (bvsge (currentBit!6768 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6768 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6773 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6773 bs!65) (size!3197 (buf!3700 bs!65))) (and (= (currentBit!6768 bs!65) #b00000000000000000000000000000000) (= (currentByte!6773 bs!65) (size!3197 (buf!3700 bs!65)))))))))

(assert (=> d!51656 d!51666))

(declare-fun d!51668 () Bool)

(assert (=> d!51668 (= (remainingBits!0 ((_ sign_extend 32) (size!3197 (buf!3700 lt!242499))) ((_ sign_extend 32) (currentByte!6773 lt!242499)) ((_ sign_extend 32) (currentBit!6768 lt!242499))) (bvsub (bvmul ((_ sign_extend 32) (size!3197 (buf!3700 lt!242499))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6773 lt!242499)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6768 lt!242499)))))))

(assert (=> d!51662 d!51668))

(declare-fun d!51670 () Bool)

(declare-fun e!105167 () Bool)

(assert (=> d!51670 e!105167))

(declare-fun res!130316 () Bool)

(assert (=> d!51670 (=> (not res!130316) (not e!105167))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5652 (_ BitVec 32)) Bool)

(assert (=> d!51670 (= res!130316 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9850 () Unit!9848)

(assert (=> d!51670 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13845 Unit!9850 (BitStream!5653 (buf!3700 bs!65) (bvadd (currentByte!6773 bs!65) #b00000000000000000000000000000001) (currentBit!6768 bs!65))))))

(declare-fun b!155857 () Bool)

(assert (=> b!155857 (= e!105167 (and (or (not (= (bvand (currentByte!6773 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6773 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6773 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6773 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6773 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51670 res!130316) b!155857))

(declare-fun m!242217 () Bool)

(assert (=> d!51670 m!242217))

(assert (=> d!51650 d!51670))

(declare-fun b!155871 () Bool)

(declare-fun res!130326 () Bool)

(declare-fun e!105177 () Bool)

(assert (=> b!155871 (=> (not res!130326) (not e!105177))))

(declare-fun lt!242626 () tuple3!622)

(assert (=> b!155871 (= res!130326 (and (= (buf!3700 bs!65) (buf!3700 (_2!7351 lt!242626))) (= (size!3197 arr!153) (size!3197 (_3!428 lt!242626)))))))

(declare-fun b!155872 () Bool)

(declare-fun e!105178 () tuple3!622)

(declare-fun lt!242622 () Unit!9848)

(declare-fun lt!242616 () tuple3!622)

(assert (=> b!155872 (= e!105178 (tuple3!623 lt!242622 (_2!7351 lt!242616) (_3!428 lt!242616)))))

(declare-fun lt!242633 () tuple2!13842)

(assert (=> b!155872 (= lt!242633 (readByte!0 bs!65))))

(declare-fun lt!242615 () array!7118)

(assert (=> b!155872 (= lt!242615 (array!7119 (store (arr!4029 arr!153) from!240 (_1!7349 lt!242633)) (size!3197 arr!153)))))

(declare-fun lt!242607 () (_ BitVec 64))

(assert (=> b!155872 (= lt!242607 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!242612 () (_ BitVec 32))

(assert (=> b!155872 (= lt!242612 (bvsub to!236 from!240))))

(declare-fun lt!242614 () Unit!9848)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5652 BitStream!5652 (_ BitVec 64) (_ BitVec 32)) Unit!9848)

(assert (=> b!155872 (= lt!242614 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7349 lt!242633) lt!242607 lt!242612))))

(assert (=> b!155872 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3197 (buf!3700 (_2!7349 lt!242633)))) ((_ sign_extend 32) (currentByte!6773 (_2!7349 lt!242633))) ((_ sign_extend 32) (currentBit!6768 (_2!7349 lt!242633))) (bvsub lt!242612 ((_ extract 31 0) (bvsdiv (bvadd lt!242607 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!242617 () Unit!9848)

(assert (=> b!155872 (= lt!242617 lt!242614)))

(assert (=> b!155872 (= lt!242616 (readByteArrayLoop!0 (_2!7349 lt!242633) lt!242615 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155872 (= (bitIndex!0 (size!3197 (buf!3700 (_2!7349 lt!242633))) (currentByte!6773 (_2!7349 lt!242633)) (currentBit!6768 (_2!7349 lt!242633))) (bvadd (bitIndex!0 (size!3197 (buf!3700 bs!65)) (currentByte!6773 bs!65) (currentBit!6768 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!242600 () Unit!9848)

(declare-fun Unit!9851 () Unit!9848)

(assert (=> b!155872 (= lt!242600 Unit!9851)))

(declare-fun call!2293 () (_ BitVec 64))

(assert (=> b!155872 (= (bvadd (bitIndex!0 (size!3197 (buf!3700 (_2!7349 lt!242633))) (currentByte!6773 (_2!7349 lt!242633)) (currentBit!6768 (_2!7349 lt!242633))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2293)))

(declare-fun lt!242623 () Unit!9848)

(declare-fun Unit!9852 () Unit!9848)

(assert (=> b!155872 (= lt!242623 Unit!9852)))

(assert (=> b!155872 (= (bvadd (bitIndex!0 (size!3197 (buf!3700 bs!65)) (currentByte!6773 bs!65) (currentBit!6768 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2293)))

(declare-fun lt!242628 () Unit!9848)

(declare-fun Unit!9853 () Unit!9848)

(assert (=> b!155872 (= lt!242628 Unit!9853)))

(assert (=> b!155872 (and (= (buf!3700 bs!65) (buf!3700 (_2!7351 lt!242616))) (= (size!3197 arr!153) (size!3197 (_3!428 lt!242616))))))

(declare-fun lt!242635 () Unit!9848)

(declare-fun Unit!9854 () Unit!9848)

(assert (=> b!155872 (= lt!242635 Unit!9854)))

(declare-fun lt!242605 () Unit!9848)

(declare-fun arrayUpdatedAtPrefixLemma!24 (array!7118 (_ BitVec 32) (_ BitVec 8)) Unit!9848)

(assert (=> b!155872 (= lt!242605 (arrayUpdatedAtPrefixLemma!24 arr!153 from!240 (_1!7349 lt!242633)))))

(declare-fun arrayRangesEq!413 (array!7118 array!7118 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155872 (arrayRangesEq!413 arr!153 (array!7119 (store (arr!4029 arr!153) from!240 (_1!7349 lt!242633)) (size!3197 arr!153)) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!242604 () Unit!9848)

(assert (=> b!155872 (= lt!242604 lt!242605)))

(declare-fun lt!242629 () (_ BitVec 32))

(assert (=> b!155872 (= lt!242629 #b00000000000000000000000000000000)))

(declare-fun lt!242627 () Unit!9848)

(declare-fun arrayRangesEqTransitive!89 (array!7118 array!7118 array!7118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9848)

(assert (=> b!155872 (= lt!242627 (arrayRangesEqTransitive!89 arr!153 lt!242615 (_3!428 lt!242616) lt!242629 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2292 () Bool)

(assert (=> b!155872 call!2292))

(declare-fun lt!242606 () Unit!9848)

(assert (=> b!155872 (= lt!242606 lt!242627)))

(declare-fun call!2294 () Bool)

(assert (=> b!155872 call!2294))

(declare-fun lt!242613 () Unit!9848)

(declare-fun Unit!9855 () Unit!9848)

(assert (=> b!155872 (= lt!242613 Unit!9855)))

(declare-fun lt!242619 () Unit!9848)

(declare-fun arrayRangesEqImpliesEq!33 (array!7118 array!7118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9848)

(assert (=> b!155872 (= lt!242619 (arrayRangesEqImpliesEq!33 lt!242615 (_3!428 lt!242616) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155872 (= (select (store (arr!4029 arr!153) from!240 (_1!7349 lt!242633)) from!240) (select (arr!4029 (_3!428 lt!242616)) from!240))))

(declare-fun lt!242611 () Unit!9848)

(assert (=> b!155872 (= lt!242611 lt!242619)))

(declare-fun lt!242621 () Bool)

(assert (=> b!155872 (= lt!242621 (= (select (arr!4029 (_3!428 lt!242616)) from!240) (_1!7349 lt!242633)))))

(declare-fun Unit!9856 () Unit!9848)

(assert (=> b!155872 (= lt!242622 Unit!9856)))

(assert (=> b!155872 lt!242621))

(declare-fun c!8286 () Bool)

(declare-fun bm!2289 () Bool)

(declare-fun lt!242608 () array!7118)

(declare-fun lt!242618 () (_ BitVec 32))

(declare-fun lt!242632 () array!7118)

(declare-fun lt!242603 () (_ BitVec 32))

(assert (=> bm!2289 (= call!2292 (arrayRangesEq!413 (ite c!8286 arr!153 lt!242632) (ite c!8286 (_3!428 lt!242616) lt!242608) (ite c!8286 lt!242629 lt!242618) (ite c!8286 from!240 lt!242603)))))

(declare-fun bm!2290 () Bool)

(assert (=> bm!2290 (= call!2293 (bitIndex!0 (ite c!8286 (size!3197 (buf!3700 (_2!7351 lt!242616))) (size!3197 (buf!3700 bs!65))) (ite c!8286 (currentByte!6773 (_2!7351 lt!242616)) (currentByte!6773 bs!65)) (ite c!8286 (currentBit!6768 (_2!7351 lt!242616)) (currentBit!6768 bs!65))))))

(declare-fun bm!2291 () Bool)

(assert (=> bm!2291 (= call!2294 (arrayRangesEq!413 arr!153 (ite c!8286 (_3!428 lt!242616) arr!153) #b00000000000000000000000000000000 (ite c!8286 from!240 (size!3197 arr!153))))))

(declare-fun e!105179 () Bool)

(declare-fun b!155874 () Bool)

(assert (=> b!155874 (= e!105179 (= (select (arr!4029 (_3!428 lt!242626)) from!240) (_2!7339 (readBytePure!0 bs!65))))))

(assert (=> b!155874 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3197 (_3!428 lt!242626))))))

(declare-fun lt!242610 () Unit!9848)

(declare-fun b!155875 () Bool)

(assert (=> b!155875 (= e!105178 (tuple3!623 lt!242610 bs!65 arr!153))))

(assert (=> b!155875 (= call!2293 call!2293)))

(declare-fun lt!242624 () Unit!9848)

(declare-fun Unit!9857 () Unit!9848)

(assert (=> b!155875 (= lt!242624 Unit!9857)))

(declare-fun lt!242602 () Unit!9848)

(declare-fun arrayRangesEqReflexiveLemma!24 (array!7118) Unit!9848)

(assert (=> b!155875 (= lt!242602 (arrayRangesEqReflexiveLemma!24 arr!153))))

(assert (=> b!155875 call!2294))

(declare-fun lt!242609 () Unit!9848)

(assert (=> b!155875 (= lt!242609 lt!242602)))

(assert (=> b!155875 (= lt!242632 arr!153)))

(assert (=> b!155875 (= lt!242608 arr!153)))

(declare-fun lt!242625 () (_ BitVec 32))

(assert (=> b!155875 (= lt!242625 #b00000000000000000000000000000000)))

(declare-fun lt!242620 () (_ BitVec 32))

(assert (=> b!155875 (= lt!242620 (size!3197 arr!153))))

(assert (=> b!155875 (= lt!242618 #b00000000000000000000000000000000)))

(assert (=> b!155875 (= lt!242603 from!240)))

(declare-fun arrayRangesEqSlicedLemma!24 (array!7118 array!7118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9848)

(assert (=> b!155875 (= lt!242610 (arrayRangesEqSlicedLemma!24 lt!242632 lt!242608 lt!242625 lt!242620 lt!242618 lt!242603))))

(assert (=> b!155875 call!2292))

(declare-fun b!155873 () Bool)

(assert (=> b!155873 (= e!105177 (arrayRangesEq!413 arr!153 (_3!428 lt!242626) #b00000000000000000000000000000000 from!240))))

(declare-fun d!51672 () Bool)

(assert (=> d!51672 e!105179))

(declare-fun res!130328 () Bool)

(assert (=> d!51672 (=> res!130328 e!105179)))

(assert (=> d!51672 (= res!130328 (bvsge from!240 to!236))))

(declare-fun lt!242631 () Bool)

(assert (=> d!51672 (= lt!242631 e!105177)))

(declare-fun res!130327 () Bool)

(assert (=> d!51672 (=> (not res!130327) (not e!105177))))

(declare-fun lt!242630 () (_ BitVec 64))

(declare-fun lt!242634 () (_ BitVec 64))

(assert (=> d!51672 (= res!130327 (= (bvadd lt!242630 lt!242634) (bitIndex!0 (size!3197 (buf!3700 (_2!7351 lt!242626))) (currentByte!6773 (_2!7351 lt!242626)) (currentBit!6768 (_2!7351 lt!242626)))))))

(assert (=> d!51672 (or (not (= (bvand lt!242630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242634 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242630 lt!242634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!242601 () (_ BitVec 64))

(assert (=> d!51672 (= lt!242634 (bvmul lt!242601 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51672 (or (= lt!242601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!242601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!242601)))))

(assert (=> d!51672 (= lt!242601 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51672 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51672 (= lt!242630 (bitIndex!0 (size!3197 (buf!3700 bs!65)) (currentByte!6773 bs!65) (currentBit!6768 bs!65)))))

(assert (=> d!51672 (= lt!242626 e!105178)))

(assert (=> d!51672 (= c!8286 (bvslt from!240 to!236))))

(assert (=> d!51672 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3197 arr!153)))))

(assert (=> d!51672 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!242626)))

(assert (= (and d!51672 c!8286) b!155872))

(assert (= (and d!51672 (not c!8286)) b!155875))

(assert (= (or b!155872 b!155875) bm!2289))

(assert (= (or b!155872 b!155875) bm!2291))

(assert (= (or b!155872 b!155875) bm!2290))

(assert (= (and d!51672 res!130327) b!155871))

(assert (= (and b!155871 res!130326) b!155873))

(assert (= (and d!51672 (not res!130328)) b!155874))

(declare-fun m!242221 () Bool)

(assert (=> b!155874 m!242221))

(assert (=> b!155874 m!242151))

(declare-fun m!242223 () Bool)

(assert (=> d!51672 m!242223))

(declare-fun m!242225 () Bool)

(assert (=> d!51672 m!242225))

(declare-fun m!242227 () Bool)

(assert (=> bm!2290 m!242227))

(declare-fun m!242229 () Bool)

(assert (=> bm!2289 m!242229))

(declare-fun m!242231 () Bool)

(assert (=> b!155875 m!242231))

(declare-fun m!242233 () Bool)

(assert (=> b!155875 m!242233))

(declare-fun m!242235 () Bool)

(assert (=> b!155873 m!242235))

(declare-fun m!242237 () Bool)

(assert (=> bm!2291 m!242237))

(declare-fun m!242239 () Bool)

(assert (=> b!155872 m!242239))

(declare-fun m!242241 () Bool)

(assert (=> b!155872 m!242241))

(declare-fun m!242243 () Bool)

(assert (=> b!155872 m!242243))

(assert (=> b!155872 m!242205))

(declare-fun m!242245 () Bool)

(assert (=> b!155872 m!242245))

(declare-fun m!242247 () Bool)

(assert (=> b!155872 m!242247))

(declare-fun m!242249 () Bool)

(assert (=> b!155872 m!242249))

(declare-fun m!242251 () Bool)

(assert (=> b!155872 m!242251))

(declare-fun m!242253 () Bool)

(assert (=> b!155872 m!242253))

(declare-fun m!242255 () Bool)

(assert (=> b!155872 m!242255))

(declare-fun m!242257 () Bool)

(assert (=> b!155872 m!242257))

(declare-fun m!242259 () Bool)

(assert (=> b!155872 m!242259))

(assert (=> b!155872 m!242225))

(assert (=> d!51652 d!51672))

(declare-fun d!51682 () Bool)

(declare-fun lt!242651 () (_ BitVec 8))

(declare-fun lt!242653 () (_ BitVec 8))

(assert (=> d!51682 (= lt!242651 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4029 (buf!3700 bs!65)) (currentByte!6773 bs!65))) ((_ sign_extend 24) lt!242653))))))

(assert (=> d!51682 (= lt!242653 ((_ extract 7 0) (currentBit!6768 bs!65)))))

(declare-fun e!105184 () Bool)

(assert (=> d!51682 e!105184))

(declare-fun res!130335 () Bool)

(assert (=> d!51682 (=> (not res!130335) (not e!105184))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51682 (= res!130335 (validate_offset_bits!1 ((_ sign_extend 32) (size!3197 (buf!3700 bs!65))) ((_ sign_extend 32) (currentByte!6773 bs!65)) ((_ sign_extend 32) (currentBit!6768 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13846 0))(
  ( (tuple2!13847 (_1!7352 Unit!9848) (_2!7352 (_ BitVec 8))) )
))
(declare-fun Unit!9858 () Unit!9848)

(declare-fun Unit!9859 () Unit!9848)

(assert (=> d!51682 (= (readByte!0 bs!65) (tuple2!13843 (_2!7352 (ite (bvsgt ((_ sign_extend 24) lt!242653) #b00000000000000000000000000000000) (tuple2!13847 Unit!9858 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242651) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4029 (buf!3700 bs!65)) (bvadd (currentByte!6773 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242653)))))))) (tuple2!13847 Unit!9859 lt!242651))) (BitStream!5653 (buf!3700 bs!65) (bvadd (currentByte!6773 bs!65) #b00000000000000000000000000000001) (currentBit!6768 bs!65))))))

(declare-fun b!155880 () Bool)

(declare-fun e!105185 () Bool)

(assert (=> b!155880 (= e!105184 e!105185)))

(declare-fun res!130334 () Bool)

(assert (=> b!155880 (=> (not res!130334) (not e!105185))))

(declare-fun lt!242655 () tuple2!13842)

(assert (=> b!155880 (= res!130334 (= (buf!3700 (_2!7349 lt!242655)) (buf!3700 bs!65)))))

(declare-fun lt!242652 () (_ BitVec 8))

(declare-fun lt!242654 () (_ BitVec 8))

(declare-fun Unit!9860 () Unit!9848)

(declare-fun Unit!9861 () Unit!9848)

(assert (=> b!155880 (= lt!242655 (tuple2!13843 (_2!7352 (ite (bvsgt ((_ sign_extend 24) lt!242654) #b00000000000000000000000000000000) (tuple2!13847 Unit!9860 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242652) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4029 (buf!3700 bs!65)) (bvadd (currentByte!6773 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242654)))))))) (tuple2!13847 Unit!9861 lt!242652))) (BitStream!5653 (buf!3700 bs!65) (bvadd (currentByte!6773 bs!65) #b00000000000000000000000000000001) (currentBit!6768 bs!65))))))

(assert (=> b!155880 (= lt!242652 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4029 (buf!3700 bs!65)) (currentByte!6773 bs!65))) ((_ sign_extend 24) lt!242654))))))

(assert (=> b!155880 (= lt!242654 ((_ extract 7 0) (currentBit!6768 bs!65)))))

(declare-fun b!155881 () Bool)

(declare-fun lt!242650 () (_ BitVec 64))

(declare-fun lt!242656 () (_ BitVec 64))

(assert (=> b!155881 (= e!105185 (= (bitIndex!0 (size!3197 (buf!3700 (_2!7349 lt!242655))) (currentByte!6773 (_2!7349 lt!242655)) (currentBit!6768 (_2!7349 lt!242655))) (bvadd lt!242656 lt!242650)))))

(assert (=> b!155881 (or (not (= (bvand lt!242656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242650 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242656 lt!242650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155881 (= lt!242650 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155881 (= lt!242656 (bitIndex!0 (size!3197 (buf!3700 bs!65)) (currentByte!6773 bs!65) (currentBit!6768 bs!65)))))

(assert (= (and d!51682 res!130335) b!155880))

(assert (= (and b!155880 res!130334) b!155881))

(declare-fun m!242261 () Bool)

(assert (=> d!51682 m!242261))

(declare-fun m!242263 () Bool)

(assert (=> d!51682 m!242263))

(declare-fun m!242265 () Bool)

(assert (=> d!51682 m!242265))

(assert (=> b!155880 m!242265))

(assert (=> b!155880 m!242261))

(declare-fun m!242267 () Bool)

(assert (=> b!155881 m!242267))

(assert (=> b!155881 m!242225))

(assert (=> d!51648 d!51682))

(check-sat (not d!51670) (not b!155873) (not b!155881) (not b!155874) (not bm!2289) (not bm!2290) (not d!51672) (not d!51682) (not b!155875) (not b!155872) (not bm!2291))
(check-sat)
