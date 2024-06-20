; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30492 () Bool)

(assert start!30492)

(declare-fun res!130217 () Bool)

(declare-fun e!105008 () Bool)

(assert (=> start!30492 (=> (not res!130217) (not e!105008))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7094 0))(
  ( (array!7095 (arr!4011 (Array (_ BitVec 32) (_ BitVec 8))) (size!3188 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7094)

(assert (=> start!30492 (= res!130217 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3188 arr!153))))))

(assert (=> start!30492 e!105008))

(assert (=> start!30492 true))

(declare-fun array_inv!2977 (array!7094) Bool)

(assert (=> start!30492 (array_inv!2977 arr!153)))

(declare-datatypes ((BitStream!5634 0))(
  ( (BitStream!5635 (buf!3691 array!7094) (currentByte!6749 (_ BitVec 32)) (currentBit!6744 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5634)

(declare-fun e!105005 () Bool)

(declare-fun inv!12 (BitStream!5634) Bool)

(assert (=> start!30492 (and (inv!12 bs!65) e!105005)))

(declare-fun b!155705 () Bool)

(declare-fun res!130216 () Bool)

(assert (=> b!155705 (=> (not res!130216) (not e!105008))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155705 (= res!130216 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3188 (buf!3691 bs!65))) ((_ sign_extend 32) (currentByte!6749 bs!65)) ((_ sign_extend 32) (currentBit!6744 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155706 () Bool)

(declare-fun moveByteIndexPrecond!0 (BitStream!5634 (_ BitVec 32)) Bool)

(assert (=> b!155706 (= e!105008 (not (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13782 0))(
  ( (tuple2!13783 (_1!7311 BitStream!5634) (_2!7311 array!7094)) )
))
(declare-fun lt!242092 () tuple2!13782)

(declare-fun readByteArrayLoopPure!0 (BitStream!5634 array!7094 (_ BitVec 32) (_ BitVec 32)) tuple2!13782)

(assert (=> b!155706 (= lt!242092 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155707 () Bool)

(assert (=> b!155707 (= e!105005 (array_inv!2977 (buf!3691 bs!65)))))

(assert (= (and start!30492 res!130217) b!155705))

(assert (= (and b!155705 res!130216) b!155706))

(assert (= start!30492 b!155707))

(declare-fun m!241851 () Bool)

(assert (=> start!30492 m!241851))

(declare-fun m!241853 () Bool)

(assert (=> start!30492 m!241853))

(declare-fun m!241855 () Bool)

(assert (=> b!155705 m!241855))

(declare-fun m!241857 () Bool)

(assert (=> b!155706 m!241857))

(declare-fun m!241859 () Bool)

(assert (=> b!155706 m!241859))

(declare-fun m!241861 () Bool)

(assert (=> b!155707 m!241861))

(check-sat (not b!155705) (not b!155706) (not b!155707) (not start!30492))
(check-sat)
(get-model)

(declare-fun d!51530 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51530 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3188 (buf!3691 bs!65))) ((_ sign_extend 32) (currentByte!6749 bs!65)) ((_ sign_extend 32) (currentBit!6744 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3188 (buf!3691 bs!65))) ((_ sign_extend 32) (currentByte!6749 bs!65)) ((_ sign_extend 32) (currentBit!6744 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12600 () Bool)

(assert (= bs!12600 d!51530))

(declare-fun m!241881 () Bool)

(assert (=> bs!12600 m!241881))

(assert (=> b!155705 d!51530))

(declare-fun d!51532 () Bool)

(assert (=> d!51532 (= (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001) (and (bvsle (bvneg (size!3188 (buf!3691 bs!65))) #b00000000000000000000000000000001) (bvsle #b00000000000000000000000000000001 (size!3188 (buf!3691 bs!65))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!6749 bs!65)) ((_ sign_extend 32) #b00000000000000000000000000000001)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!3188 (buf!3691 bs!65))))) (and (= (currentBit!6744 bs!65) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!3188 (buf!3691 bs!65)))))))))))

(assert (=> b!155706 d!51532))

(declare-fun d!51542 () Bool)

(declare-datatypes ((Unit!9815 0))(
  ( (Unit!9816) )
))
(declare-datatypes ((tuple3!610 0))(
  ( (tuple3!611 (_1!7315 Unit!9815) (_2!7315 BitStream!5634) (_3!422 array!7094)) )
))
(declare-fun lt!242104 () tuple3!610)

(declare-fun readByteArrayLoop!0 (BitStream!5634 array!7094 (_ BitVec 32) (_ BitVec 32)) tuple3!610)

(assert (=> d!51542 (= lt!242104 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51542 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13783 (_2!7315 lt!242104) (_3!422 lt!242104)))))

(declare-fun bs!12604 () Bool)

(assert (= bs!12604 d!51542))

(declare-fun m!241889 () Bool)

(assert (=> bs!12604 m!241889))

(assert (=> b!155706 d!51542))

(declare-fun d!51544 () Bool)

(assert (=> d!51544 (= (array_inv!2977 (buf!3691 bs!65)) (bvsge (size!3188 (buf!3691 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155707 d!51544))

(declare-fun d!51546 () Bool)

(assert (=> d!51546 (= (array_inv!2977 arr!153) (bvsge (size!3188 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30492 d!51546))

(declare-fun d!51548 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51548 (= (inv!12 bs!65) (invariant!0 (currentBit!6744 bs!65) (currentByte!6749 bs!65) (size!3188 (buf!3691 bs!65))))))

(declare-fun bs!12605 () Bool)

(assert (= bs!12605 d!51548))

(declare-fun m!241891 () Bool)

(assert (=> bs!12605 m!241891))

(assert (=> start!30492 d!51548))

(check-sat (not d!51530) (not d!51548) (not d!51542))
(check-sat)
(get-model)

(declare-fun d!51550 () Bool)

(assert (=> d!51550 (= (remainingBits!0 ((_ sign_extend 32) (size!3188 (buf!3691 bs!65))) ((_ sign_extend 32) (currentByte!6749 bs!65)) ((_ sign_extend 32) (currentBit!6744 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3188 (buf!3691 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6749 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6744 bs!65)))))))

(assert (=> d!51530 d!51550))

(declare-fun d!51552 () Bool)

(assert (=> d!51552 (= (invariant!0 (currentBit!6744 bs!65) (currentByte!6749 bs!65) (size!3188 (buf!3691 bs!65))) (and (bvsge (currentBit!6744 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6744 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6749 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6749 bs!65) (size!3188 (buf!3691 bs!65))) (and (= (currentBit!6744 bs!65) #b00000000000000000000000000000000) (= (currentByte!6749 bs!65) (size!3188 (buf!3691 bs!65)))))))))

(assert (=> d!51548 d!51552))

(declare-fun b!155730 () Bool)

(declare-fun res!130232 () Bool)

(declare-fun e!105029 () Bool)

(assert (=> b!155730 (=> (not res!130232) (not e!105029))))

(declare-fun lt!242200 () tuple3!610)

(assert (=> b!155730 (= res!130232 (and (= (buf!3691 bs!65) (buf!3691 (_2!7315 lt!242200))) (= (size!3188 arr!153) (size!3188 (_3!422 lt!242200)))))))

(declare-fun call!2267 () Bool)

(declare-fun lt!242178 () array!7094)

(declare-fun c!8277 () Bool)

(declare-datatypes ((tuple2!13786 0))(
  ( (tuple2!13787 (_1!7316 (_ BitVec 8)) (_2!7316 BitStream!5634)) )
))
(declare-fun lt!242185 () tuple2!13786)

(declare-fun lt!242189 () (_ BitVec 32))

(declare-fun lt!242203 () (_ BitVec 32))

(declare-fun bm!2262 () Bool)

(declare-fun lt!242209 () array!7094)

(declare-fun arrayRangesEq!410 (array!7094 array!7094 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2262 (= call!2267 (arrayRangesEq!410 (ite c!8277 arr!153 lt!242209) (ite c!8277 (array!7095 (store (arr!4011 arr!153) from!240 (_1!7316 lt!242185)) (size!3188 arr!153)) lt!242178) (ite c!8277 #b00000000000000000000000000000000 lt!242203) (ite c!8277 from!240 lt!242189)))))

(declare-fun call!2266 () Bool)

(declare-fun lt!242207 () tuple3!610)

(declare-fun bm!2263 () Bool)

(assert (=> bm!2263 (= call!2266 (arrayRangesEq!410 arr!153 (ite c!8277 (_3!422 lt!242207) arr!153) #b00000000000000000000000000000000 (ite c!8277 from!240 (size!3188 arr!153))))))

(declare-fun b!155731 () Bool)

(declare-fun e!105027 () Bool)

(declare-datatypes ((tuple2!13788 0))(
  ( (tuple2!13789 (_1!7317 BitStream!5634) (_2!7317 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5634) tuple2!13788)

(assert (=> b!155731 (= e!105027 (= (select (arr!4011 (_3!422 lt!242200)) from!240) (_2!7317 (readBytePure!0 bs!65))))))

(assert (=> b!155731 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3188 (_3!422 lt!242200))))))

(declare-fun b!155732 () Bool)

(declare-fun e!105028 () tuple3!610)

(declare-fun lt!242210 () Unit!9815)

(assert (=> b!155732 (= e!105028 (tuple3!611 lt!242210 (_2!7315 lt!242207) (_3!422 lt!242207)))))

(declare-fun readByte!0 (BitStream!5634) tuple2!13786)

(assert (=> b!155732 (= lt!242185 (readByte!0 bs!65))))

(declare-fun lt!242190 () array!7094)

(assert (=> b!155732 (= lt!242190 (array!7095 (store (arr!4011 arr!153) from!240 (_1!7316 lt!242185)) (size!3188 arr!153)))))

(declare-fun lt!242201 () (_ BitVec 64))

(assert (=> b!155732 (= lt!242201 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!242204 () (_ BitVec 32))

(assert (=> b!155732 (= lt!242204 (bvsub to!236 from!240))))

(declare-fun lt!242208 () Unit!9815)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5634 BitStream!5634 (_ BitVec 64) (_ BitVec 32)) Unit!9815)

(assert (=> b!155732 (= lt!242208 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7316 lt!242185) lt!242201 lt!242204))))

(assert (=> b!155732 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3188 (buf!3691 (_2!7316 lt!242185)))) ((_ sign_extend 32) (currentByte!6749 (_2!7316 lt!242185))) ((_ sign_extend 32) (currentBit!6744 (_2!7316 lt!242185))) (bvsub lt!242204 ((_ extract 31 0) (bvsdiv (bvadd lt!242201 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!242181 () Unit!9815)

(assert (=> b!155732 (= lt!242181 lt!242208)))

(assert (=> b!155732 (= lt!242207 (readByteArrayLoop!0 (_2!7316 lt!242185) lt!242190 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2265 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155732 (= call!2265 (bvadd (bitIndex!0 (size!3188 (buf!3691 bs!65)) (currentByte!6749 bs!65) (currentBit!6744 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!242182 () Unit!9815)

(declare-fun Unit!9817 () Unit!9815)

(assert (=> b!155732 (= lt!242182 Unit!9817)))

(assert (=> b!155732 (= (bvadd call!2265 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3188 (buf!3691 (_2!7315 lt!242207))) (currentByte!6749 (_2!7315 lt!242207)) (currentBit!6744 (_2!7315 lt!242207))))))

(declare-fun lt!242206 () Unit!9815)

(declare-fun Unit!9818 () Unit!9815)

(assert (=> b!155732 (= lt!242206 Unit!9818)))

(assert (=> b!155732 (= (bvadd (bitIndex!0 (size!3188 (buf!3691 bs!65)) (currentByte!6749 bs!65) (currentBit!6744 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3188 (buf!3691 (_2!7315 lt!242207))) (currentByte!6749 (_2!7315 lt!242207)) (currentBit!6744 (_2!7315 lt!242207))))))

(declare-fun lt!242192 () Unit!9815)

(declare-fun Unit!9819 () Unit!9815)

(assert (=> b!155732 (= lt!242192 Unit!9819)))

(assert (=> b!155732 (and (= (buf!3691 bs!65) (buf!3691 (_2!7315 lt!242207))) (= (size!3188 arr!153) (size!3188 (_3!422 lt!242207))))))

(declare-fun lt!242197 () Unit!9815)

(declare-fun Unit!9820 () Unit!9815)

(assert (=> b!155732 (= lt!242197 Unit!9820)))

(declare-fun lt!242191 () Unit!9815)

(declare-fun arrayUpdatedAtPrefixLemma!21 (array!7094 (_ BitVec 32) (_ BitVec 8)) Unit!9815)

(assert (=> b!155732 (= lt!242191 (arrayUpdatedAtPrefixLemma!21 arr!153 from!240 (_1!7316 lt!242185)))))

(assert (=> b!155732 call!2267))

(declare-fun lt!242198 () Unit!9815)

(assert (=> b!155732 (= lt!242198 lt!242191)))

(declare-fun lt!242196 () (_ BitVec 32))

(assert (=> b!155732 (= lt!242196 #b00000000000000000000000000000000)))

(declare-fun lt!242211 () Unit!9815)

(declare-fun arrayRangesEqTransitive!86 (array!7094 array!7094 array!7094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9815)

(assert (=> b!155732 (= lt!242211 (arrayRangesEqTransitive!86 arr!153 lt!242190 (_3!422 lt!242207) lt!242196 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155732 (arrayRangesEq!410 arr!153 (_3!422 lt!242207) lt!242196 from!240)))

(declare-fun lt!242212 () Unit!9815)

(assert (=> b!155732 (= lt!242212 lt!242211)))

(assert (=> b!155732 call!2266))

(declare-fun lt!242193 () Unit!9815)

(declare-fun Unit!9821 () Unit!9815)

(assert (=> b!155732 (= lt!242193 Unit!9821)))

(declare-fun lt!242194 () Unit!9815)

(declare-fun arrayRangesEqImpliesEq!30 (array!7094 array!7094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9815)

(assert (=> b!155732 (= lt!242194 (arrayRangesEqImpliesEq!30 lt!242190 (_3!422 lt!242207) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155732 (= (select (store (arr!4011 arr!153) from!240 (_1!7316 lt!242185)) from!240) (select (arr!4011 (_3!422 lt!242207)) from!240))))

(declare-fun lt!242188 () Unit!9815)

(assert (=> b!155732 (= lt!242188 lt!242194)))

(declare-fun lt!242180 () Bool)

(assert (=> b!155732 (= lt!242180 (= (select (arr!4011 (_3!422 lt!242207)) from!240) (_1!7316 lt!242185)))))

(declare-fun Unit!9822 () Unit!9815)

(assert (=> b!155732 (= lt!242210 Unit!9822)))

(assert (=> b!155732 lt!242180))

(declare-fun d!51554 () Bool)

(assert (=> d!51554 e!105027))

(declare-fun res!130231 () Bool)

(assert (=> d!51554 (=> res!130231 e!105027)))

(assert (=> d!51554 (= res!130231 (bvsge from!240 to!236))))

(declare-fun lt!242199 () Bool)

(assert (=> d!51554 (= lt!242199 e!105029)))

(declare-fun res!130230 () Bool)

(assert (=> d!51554 (=> (not res!130230) (not e!105029))))

(declare-fun lt!242195 () (_ BitVec 64))

(declare-fun lt!242186 () (_ BitVec 64))

(assert (=> d!51554 (= res!130230 (= (bvadd lt!242195 lt!242186) (bitIndex!0 (size!3188 (buf!3691 (_2!7315 lt!242200))) (currentByte!6749 (_2!7315 lt!242200)) (currentBit!6744 (_2!7315 lt!242200)))))))

(assert (=> d!51554 (or (not (= (bvand lt!242195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242186 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242195 lt!242186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!242205 () (_ BitVec 64))

(assert (=> d!51554 (= lt!242186 (bvmul lt!242205 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51554 (or (= lt!242205 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!242205 #b0000000000000000000000000000000000000000000000000000000000001000) lt!242205)))))

(assert (=> d!51554 (= lt!242205 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51554 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51554 (= lt!242195 (bitIndex!0 (size!3188 (buf!3691 bs!65)) (currentByte!6749 bs!65) (currentBit!6744 bs!65)))))

(assert (=> d!51554 (= lt!242200 e!105028)))

(assert (=> d!51554 (= c!8277 (bvslt from!240 to!236))))

(assert (=> d!51554 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3188 arr!153)))))

(assert (=> d!51554 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!242200)))

(declare-fun bm!2264 () Bool)

(assert (=> bm!2264 (= call!2265 (bitIndex!0 (ite c!8277 (size!3188 (buf!3691 (_2!7316 lt!242185))) (size!3188 (buf!3691 bs!65))) (ite c!8277 (currentByte!6749 (_2!7316 lt!242185)) (currentByte!6749 bs!65)) (ite c!8277 (currentBit!6744 (_2!7316 lt!242185)) (currentBit!6744 bs!65))))))

(declare-fun lt!242179 () Unit!9815)

(declare-fun b!155733 () Bool)

(assert (=> b!155733 (= e!105028 (tuple3!611 lt!242179 bs!65 arr!153))))

(assert (=> b!155733 (= call!2265 call!2265)))

(declare-fun lt!242187 () Unit!9815)

(declare-fun Unit!9823 () Unit!9815)

(assert (=> b!155733 (= lt!242187 Unit!9823)))

(declare-fun lt!242184 () Unit!9815)

(declare-fun arrayRangesEqReflexiveLemma!21 (array!7094) Unit!9815)

(assert (=> b!155733 (= lt!242184 (arrayRangesEqReflexiveLemma!21 arr!153))))

(assert (=> b!155733 call!2266))

(declare-fun lt!242202 () Unit!9815)

(assert (=> b!155733 (= lt!242202 lt!242184)))

(assert (=> b!155733 (= lt!242209 arr!153)))

(assert (=> b!155733 (= lt!242178 arr!153)))

(declare-fun lt!242183 () (_ BitVec 32))

(assert (=> b!155733 (= lt!242183 #b00000000000000000000000000000000)))

(declare-fun lt!242177 () (_ BitVec 32))

(assert (=> b!155733 (= lt!242177 (size!3188 arr!153))))

(assert (=> b!155733 (= lt!242203 #b00000000000000000000000000000000)))

(assert (=> b!155733 (= lt!242189 from!240)))

(declare-fun arrayRangesEqSlicedLemma!21 (array!7094 array!7094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9815)

(assert (=> b!155733 (= lt!242179 (arrayRangesEqSlicedLemma!21 lt!242209 lt!242178 lt!242183 lt!242177 lt!242203 lt!242189))))

(assert (=> b!155733 call!2267))

(declare-fun b!155734 () Bool)

(assert (=> b!155734 (= e!105029 (arrayRangesEq!410 arr!153 (_3!422 lt!242200) #b00000000000000000000000000000000 from!240))))

(assert (= (and d!51554 c!8277) b!155732))

(assert (= (and d!51554 (not c!8277)) b!155733))

(assert (= (or b!155732 b!155733) bm!2262))

(assert (= (or b!155732 b!155733) bm!2263))

(assert (= (or b!155732 b!155733) bm!2264))

(assert (= (and d!51554 res!130230) b!155730))

(assert (= (and b!155730 res!130232) b!155734))

(assert (= (and d!51554 (not res!130231)) b!155731))

(declare-fun m!241893 () Bool)

(assert (=> d!51554 m!241893))

(declare-fun m!241895 () Bool)

(assert (=> d!51554 m!241895))

(declare-fun m!241897 () Bool)

(assert (=> b!155733 m!241897))

(declare-fun m!241899 () Bool)

(assert (=> b!155733 m!241899))

(declare-fun m!241901 () Bool)

(assert (=> b!155732 m!241901))

(declare-fun m!241903 () Bool)

(assert (=> b!155732 m!241903))

(declare-fun m!241905 () Bool)

(assert (=> b!155732 m!241905))

(declare-fun m!241907 () Bool)

(assert (=> b!155732 m!241907))

(assert (=> b!155732 m!241895))

(declare-fun m!241909 () Bool)

(assert (=> b!155732 m!241909))

(declare-fun m!241911 () Bool)

(assert (=> b!155732 m!241911))

(declare-fun m!241913 () Bool)

(assert (=> b!155732 m!241913))

(declare-fun m!241915 () Bool)

(assert (=> b!155732 m!241915))

(declare-fun m!241917 () Bool)

(assert (=> b!155732 m!241917))

(declare-fun m!241919 () Bool)

(assert (=> b!155732 m!241919))

(declare-fun m!241921 () Bool)

(assert (=> b!155732 m!241921))

(declare-fun m!241923 () Bool)

(assert (=> b!155732 m!241923))

(declare-fun m!241925 () Bool)

(assert (=> b!155734 m!241925))

(assert (=> bm!2262 m!241917))

(declare-fun m!241927 () Bool)

(assert (=> bm!2262 m!241927))

(declare-fun m!241929 () Bool)

(assert (=> b!155731 m!241929))

(declare-fun m!241931 () Bool)

(assert (=> b!155731 m!241931))

(declare-fun m!241933 () Bool)

(assert (=> bm!2263 m!241933))

(declare-fun m!241935 () Bool)

(assert (=> bm!2264 m!241935))

(assert (=> d!51542 d!51554))

(check-sat (not b!155731) (not bm!2263) (not b!155734) (not bm!2262) (not b!155733) (not b!155732) (not d!51554) (not bm!2264))
(check-sat)
