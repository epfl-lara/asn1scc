; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30818 () Bool)

(assert start!30818)

(declare-fun b!156216 () Bool)

(declare-fun e!105496 () Bool)

(declare-datatypes ((array!7153 0))(
  ( (array!7154 (arr!4060 (Array (_ BitVec 32) (_ BitVec 8))) (size!3210 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5678 0))(
  ( (BitStream!5679 (buf!3713 array!7153) (currentByte!6813 (_ BitVec 32)) (currentBit!6808 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5678)

(declare-fun moveByteIndexPrecond!0 (BitStream!5678 (_ BitVec 32)) Bool)

(assert (=> b!156216 (= e!105496 (not (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun b!156214 () Bool)

(declare-fun res!130583 () Bool)

(declare-fun e!105493 () Bool)

(assert (=> b!156214 (=> (not res!130583) (not e!105493))))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156214 (= res!130583 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3210 (buf!3713 bs!65))) ((_ sign_extend 32) (currentByte!6813 bs!65)) ((_ sign_extend 32) (currentBit!6808 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156215 () Bool)

(assert (=> b!156215 (= e!105493 e!105496)))

(declare-fun res!130582 () Bool)

(assert (=> b!156215 (=> (not res!130582) (not e!105496))))

(assert (=> b!156215 (= res!130582 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13932 0))(
  ( (tuple2!13933 (_1!7401 BitStream!5678) (_2!7401 array!7153)) )
))
(declare-fun lt!244017 () tuple2!13932)

(declare-fun arr!153 () array!7153)

(declare-fun readByteArrayLoopPure!0 (BitStream!5678 array!7153 (_ BitVec 32) (_ BitVec 32)) tuple2!13932)

(declare-fun withMovedByteIndex!0 (BitStream!5678 (_ BitVec 32)) BitStream!5678)

(declare-datatypes ((tuple2!13934 0))(
  ( (tuple2!13935 (_1!7402 BitStream!5678) (_2!7402 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5678) tuple2!13934)

(assert (=> b!156215 (= lt!244017 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244018 () tuple2!13932)

(assert (=> b!156215 (= lt!244018 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156217 () Bool)

(declare-fun e!105494 () Bool)

(declare-fun array_inv!2999 (array!7153) Bool)

(assert (=> b!156217 (= e!105494 (array_inv!2999 (buf!3713 bs!65)))))

(declare-fun res!130581 () Bool)

(assert (=> start!30818 (=> (not res!130581) (not e!105493))))

(assert (=> start!30818 (= res!130581 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3210 arr!153))))))

(assert (=> start!30818 e!105493))

(assert (=> start!30818 true))

(assert (=> start!30818 (array_inv!2999 arr!153)))

(declare-fun inv!12 (BitStream!5678) Bool)

(assert (=> start!30818 (and (inv!12 bs!65) e!105494)))

(assert (= (and start!30818 res!130581) b!156214))

(assert (= (and b!156214 res!130583) b!156215))

(assert (= (and b!156215 res!130582) b!156216))

(assert (= start!30818 b!156217))

(declare-fun m!243205 () Bool)

(assert (=> b!156215 m!243205))

(declare-fun m!243207 () Bool)

(assert (=> b!156215 m!243207))

(assert (=> b!156215 m!243207))

(declare-fun m!243209 () Bool)

(assert (=> b!156215 m!243209))

(declare-fun m!243211 () Bool)

(assert (=> b!156215 m!243211))

(declare-fun m!243213 () Bool)

(assert (=> b!156215 m!243213))

(declare-fun m!243215 () Bool)

(assert (=> b!156214 m!243215))

(declare-fun m!243217 () Bool)

(assert (=> b!156216 m!243217))

(declare-fun m!243219 () Bool)

(assert (=> start!30818 m!243219))

(declare-fun m!243221 () Bool)

(assert (=> start!30818 m!243221))

(declare-fun m!243223 () Bool)

(assert (=> b!156217 m!243223))

(push 1)

(assert (not start!30818))

(assert (not b!156214))

(assert (not b!156216))

(assert (not b!156215))

(assert (not b!156217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51882 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51882 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3210 (buf!3713 bs!65))) ((_ sign_extend 32) (currentByte!6813 bs!65)) ((_ sign_extend 32) (currentBit!6808 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3210 (buf!3713 bs!65))) ((_ sign_extend 32) (currentByte!6813 bs!65)) ((_ sign_extend 32) (currentBit!6808 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12697 () Bool)

(assert (= bs!12697 d!51882))

(declare-fun m!243227 () Bool)

(assert (=> bs!12697 m!243227))

(assert (=> b!156214 d!51882))

(declare-fun d!51886 () Bool)

(declare-datatypes ((Unit!10012 0))(
  ( (Unit!10013) )
))
(declare-datatypes ((tuple3!636 0))(
  ( (tuple3!637 (_1!7403 Unit!10012) (_2!7403 BitStream!5678) (_3!435 array!7153)) )
))
(declare-fun lt!244021 () tuple3!636)

(declare-fun readByteArrayLoop!0 (BitStream!5678 array!7153 (_ BitVec 32) (_ BitVec 32)) tuple3!636)

(assert (=> d!51886 (= lt!244021 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51886 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13933 (_2!7403 lt!244021) (_3!435 lt!244021)))))

(declare-fun bs!12699 () Bool)

(assert (= bs!12699 d!51886))

(assert (=> bs!12699 m!243207))

(declare-fun m!243231 () Bool)

(assert (=> bs!12699 m!243231))

(assert (=> b!156215 d!51886))

(declare-fun d!51890 () Bool)

(declare-datatypes ((tuple2!13938 0))(
  ( (tuple2!13939 (_1!7406 Unit!10012) (_2!7406 BitStream!5678)) )
))
(declare-fun moveByteIndex!0 (BitStream!5678 (_ BitVec 32)) tuple2!13938)

(assert (=> d!51890 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7406 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12701 () Bool)

(assert (= bs!12701 d!51890))

(declare-fun m!243235 () Bool)

(assert (=> bs!12701 m!243235))

(assert (=> b!156215 d!51890))

(declare-fun d!51894 () Bool)

(declare-datatypes ((tuple2!13942 0))(
  ( (tuple2!13943 (_1!7408 (_ BitVec 8)) (_2!7408 BitStream!5678)) )
))
(declare-fun lt!244027 () tuple2!13942)

(declare-fun readByte!0 (BitStream!5678) tuple2!13942)

(assert (=> d!51894 (= lt!244027 (readByte!0 bs!65))))

(assert (=> d!51894 (= (readBytePure!0 bs!65) (tuple2!13935 (_2!7408 lt!244027) (_1!7408 lt!244027)))))

(declare-fun bs!12703 () Bool)

(assert (= bs!12703 d!51894))

(declare-fun m!243239 () Bool)

(assert (=> bs!12703 m!243239))

(assert (=> b!156215 d!51894))

(declare-fun d!51898 () Bool)

(declare-fun lt!244028 () tuple3!636)

(assert (=> d!51898 (= lt!244028 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51898 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13933 (_2!7403 lt!244028) (_3!435 lt!244028)))))

(declare-fun bs!12704 () Bool)

(assert (= bs!12704 d!51898))

(declare-fun m!243241 () Bool)

(assert (=> bs!12704 m!243241))

(assert (=> b!156215 d!51898))

(declare-fun d!51900 () Bool)

(assert (=> d!51900 (= (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001) (and (bvsle (bvneg (size!3210 (buf!3713 bs!65))) #b00000000000000000000000000000001) (bvsle #b00000000000000000000000000000001 (size!3210 (buf!3713 bs!65))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!6813 bs!65)) ((_ sign_extend 32) #b00000000000000000000000000000001)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!3210 (buf!3713 bs!65))))) (and (= (currentBit!6808 bs!65) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!3210 (buf!3713 bs!65)))))))))))

(assert (=> b!156216 d!51900))

(declare-fun d!51906 () Bool)

(assert (=> d!51906 (= (array_inv!2999 (buf!3713 bs!65)) (bvsge (size!3210 (buf!3713 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156217 d!51906))

(declare-fun d!51908 () Bool)

(assert (=> d!51908 (= (array_inv!2999 arr!153) (bvsge (size!3210 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30818 d!51908))

(declare-fun d!51910 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51910 (= (inv!12 bs!65) (invariant!0 (currentBit!6808 bs!65) (currentByte!6813 bs!65) (size!3210 (buf!3713 bs!65))))))

(declare-fun bs!12707 () Bool)

(assert (= bs!12707 d!51910))

(declare-fun m!243247 () Bool)

(assert (=> bs!12707 m!243247))

(assert (=> start!30818 d!51910))

(push 1)

(assert (not d!51882))

(assert (not d!51898))

(assert (not d!51886))

(assert (not d!51894))

(assert (not d!51890))

(assert (not d!51910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51930 () Bool)

(assert (=> d!51930 (= (remainingBits!0 ((_ sign_extend 32) (size!3210 (buf!3713 bs!65))) ((_ sign_extend 32) (currentByte!6813 bs!65)) ((_ sign_extend 32) (currentBit!6808 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3210 (buf!3713 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6813 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6808 bs!65)))))))

(assert (=> d!51882 d!51930))

(declare-fun b!156237 () Bool)

(declare-fun res!130598 () Bool)

(declare-fun e!105512 () Bool)

(assert (=> b!156237 (=> (not res!130598) (not e!105512))))

(declare-fun lt!244149 () tuple3!636)

(assert (=> b!156237 (= res!130598 (and (= (buf!3713 bs!65) (buf!3713 (_2!7403 lt!244149))) (= (size!3210 arr!153) (size!3210 (_3!435 lt!244149)))))))

(declare-fun lt!244161 () Unit!10012)

(declare-fun e!105511 () tuple3!636)

(declare-fun b!156238 () Bool)

(assert (=> b!156238 (= e!105511 (tuple3!637 lt!244161 bs!65 arr!153))))

(declare-fun call!2393 () (_ BitVec 64))

(assert (=> b!156238 (= call!2393 call!2393)))

(declare-fun lt!244134 () Unit!10012)

(declare-fun Unit!10018 () Unit!10012)

(assert (=> b!156238 (= lt!244134 Unit!10018)))

(declare-fun lt!244147 () Unit!10012)

(declare-fun arrayRangesEqReflexiveLemma!33 (array!7153) Unit!10012)

(assert (=> b!156238 (= lt!244147 (arrayRangesEqReflexiveLemma!33 arr!153))))

(declare-fun call!2391 () Bool)

(assert (=> b!156238 call!2391))

(declare-fun lt!244137 () Unit!10012)

(assert (=> b!156238 (= lt!244137 lt!244147)))

(declare-fun lt!244162 () array!7153)

(assert (=> b!156238 (= lt!244162 arr!153)))

(declare-fun lt!244158 () array!7153)

(assert (=> b!156238 (= lt!244158 arr!153)))

(declare-fun lt!244145 () (_ BitVec 32))

(assert (=> b!156238 (= lt!244145 #b00000000000000000000000000000000)))

(declare-fun lt!244141 () (_ BitVec 32))

(assert (=> b!156238 (= lt!244141 (size!3210 arr!153))))

(declare-fun lt!244148 () (_ BitVec 32))

(assert (=> b!156238 (= lt!244148 #b00000000000000000000000000000000)))

(declare-fun lt!244133 () (_ BitVec 32))

(assert (=> b!156238 (= lt!244133 from!240)))

(declare-fun arrayRangesEqSlicedLemma!33 (array!7153 array!7153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10012)

(assert (=> b!156238 (= lt!244161 (arrayRangesEqSlicedLemma!33 lt!244162 lt!244158 lt!244145 lt!244141 lt!244148 lt!244133))))

(declare-fun call!2392 () Bool)

(assert (=> b!156238 call!2392))

(declare-fun c!8319 () Bool)

(declare-fun lt!244146 () tuple2!13942)

(declare-fun bm!2388 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> bm!2388 (= call!2393 (bitIndex!0 (ite c!8319 (size!3210 (buf!3713 (_2!7408 lt!244146))) (size!3210 (buf!3713 bs!65))) (ite c!8319 (currentByte!6813 (_2!7408 lt!244146)) (currentByte!6813 bs!65)) (ite c!8319 (currentBit!6808 (_2!7408 lt!244146)) (currentBit!6808 bs!65))))))

(declare-fun d!51932 () Bool)

(declare-fun e!105510 () Bool)

(assert (=> d!51932 e!105510))

(declare-fun res!130597 () Bool)

(assert (=> d!51932 (=> res!130597 e!105510)))

(assert (=> d!51932 (= res!130597 (bvsge from!240 to!236))))

(declare-fun lt!244138 () Bool)

(assert (=> d!51932 (= lt!244138 e!105512)))

(declare-fun res!130599 () Bool)

(assert (=> d!51932 (=> (not res!130599) (not e!105512))))

(declare-fun lt!244136 () (_ BitVec 64))

(declare-fun lt!244168 () (_ BitVec 64))

(assert (=> d!51932 (= res!130599 (= (bvadd lt!244136 lt!244168) (bitIndex!0 (size!3210 (buf!3713 (_2!7403 lt!244149))) (currentByte!6813 (_2!7403 lt!244149)) (currentBit!6808 (_2!7403 lt!244149)))))))

(assert (=> d!51932 (or (not (= (bvand lt!244136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244168 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244136 lt!244168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244140 () (_ BitVec 64))

(assert (=> d!51932 (= lt!244168 (bvmul lt!244140 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51932 (or (= lt!244140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244140)))))

(assert (=> d!51932 (= lt!244140 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51932 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51932 (= lt!244136 (bitIndex!0 (size!3210 (buf!3713 bs!65)) (currentByte!6813 bs!65) (currentBit!6808 bs!65)))))

(assert (=> d!51932 (= lt!244149 e!105511)))

(assert (=> d!51932 (= c!8319 (bvslt from!240 to!236))))

(assert (=> d!51932 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3210 arr!153)))))

(assert (=> d!51932 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!244149)))

(declare-fun b!156239 () Bool)

(declare-fun arrayRangesEq!422 (array!7153 array!7153 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156239 (= e!105512 (arrayRangesEq!422 arr!153 (_3!435 lt!244149) #b00000000000000000000000000000000 from!240))))

(declare-fun b!156240 () Bool)

(assert (=> b!156240 (= e!105510 (= (select (arr!4060 (_3!435 lt!244149)) from!240) (_2!7402 (readBytePure!0 bs!65))))))

(assert (=> b!156240 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3210 (_3!435 lt!244149))))))

(declare-fun lt!244164 () (_ BitVec 32))

(declare-fun lt!244144 () tuple3!636)

(declare-fun bm!2389 () Bool)

(assert (=> bm!2389 (= call!2392 (arrayRangesEq!422 (ite c!8319 arr!153 lt!244162) (ite c!8319 (_3!435 lt!244144) lt!244158) (ite c!8319 lt!244164 lt!244148) (ite c!8319 from!240 lt!244133)))))

(declare-fun b!156241 () Bool)

(declare-fun lt!244165 () Unit!10012)

(assert (=> b!156241 (= e!105511 (tuple3!637 lt!244165 (_2!7403 lt!244144) (_3!435 lt!244144)))))

(assert (=> b!156241 (= lt!244146 (readByte!0 bs!65))))

(declare-fun lt!244154 () array!7153)

(assert (=> b!156241 (= lt!244154 (array!7154 (store (arr!4060 arr!153) from!240 (_1!7408 lt!244146)) (size!3210 arr!153)))))

(declare-fun lt!244166 () (_ BitVec 64))

(assert (=> b!156241 (= lt!244166 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244150 () (_ BitVec 32))

(assert (=> b!156241 (= lt!244150 (bvsub to!236 from!240))))

(declare-fun lt!244152 () Unit!10012)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5678 BitStream!5678 (_ BitVec 64) (_ BitVec 32)) Unit!10012)

(assert (=> b!156241 (= lt!244152 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7408 lt!244146) lt!244166 lt!244150))))

(assert (=> b!156241 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3210 (buf!3713 (_2!7408 lt!244146)))) ((_ sign_extend 32) (currentByte!6813 (_2!7408 lt!244146))) ((_ sign_extend 32) (currentBit!6808 (_2!7408 lt!244146))) (bvsub lt!244150 ((_ extract 31 0) (bvsdiv (bvadd lt!244166 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244156 () Unit!10012)

(assert (=> b!156241 (= lt!244156 lt!244152)))

(assert (=> b!156241 (= lt!244144 (readByteArrayLoop!0 (_2!7408 lt!244146) lt!244154 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156241 (= call!2393 (bvadd (bitIndex!0 (size!3210 (buf!3713 bs!65)) (currentByte!6813 bs!65) (currentBit!6808 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244151 () Unit!10012)

(declare-fun Unit!10019 () Unit!10012)

(assert (=> b!156241 (= lt!244151 Unit!10019)))

(assert (=> b!156241 (= (bvadd call!2393 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3210 (buf!3713 (_2!7403 lt!244144))) (currentByte!6813 (_2!7403 lt!244144)) (currentBit!6808 (_2!7403 lt!244144))))))

(declare-fun lt!244153 () Unit!10012)

(declare-fun Unit!10020 () Unit!10012)

(assert (=> b!156241 (= lt!244153 Unit!10020)))

(assert (=> b!156241 (= (bvadd (bitIndex!0 (size!3210 (buf!3713 bs!65)) (currentByte!6813 bs!65) (currentBit!6808 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3210 (buf!3713 (_2!7403 lt!244144))) (currentByte!6813 (_2!7403 lt!244144)) (currentBit!6808 (_2!7403 lt!244144))))))

(declare-fun lt!244159 () Unit!10012)

(declare-fun Unit!10021 () Unit!10012)

(assert (=> b!156241 (= lt!244159 Unit!10021)))

(assert (=> b!156241 (and (= (buf!3713 bs!65) (buf!3713 (_2!7403 lt!244144))) (= (size!3210 arr!153) (size!3210 (_3!435 lt!244144))))))

(declare-fun lt!244142 () Unit!10012)

(declare-fun Unit!10022 () Unit!10012)

(assert (=> b!156241 (= lt!244142 Unit!10022)))

(declare-fun lt!244160 () Unit!10012)

(declare-fun arrayUpdatedAtPrefixLemma!33 (array!7153 (_ BitVec 32) (_ BitVec 8)) Unit!10012)

(assert (=> b!156241 (= lt!244160 (arrayUpdatedAtPrefixLemma!33 arr!153 from!240 (_1!7408 lt!244146)))))

(assert (=> b!156241 call!2391))

(declare-fun lt!244139 () Unit!10012)

(assert (=> b!156241 (= lt!244139 lt!244160)))

(assert (=> b!156241 (= lt!244164 #b00000000000000000000000000000000)))

(declare-fun lt!244167 () Unit!10012)

(declare-fun arrayRangesEqTransitive!98 (array!7153 array!7153 array!7153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10012)

(assert (=> b!156241 (= lt!244167 (arrayRangesEqTransitive!98 arr!153 lt!244154 (_3!435 lt!244144) lt!244164 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156241 call!2392))

(declare-fun lt!244155 () Unit!10012)

(assert (=> b!156241 (= lt!244155 lt!244167)))

(assert (=> b!156241 (arrayRangesEq!422 arr!153 (_3!435 lt!244144) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!244157 () Unit!10012)

(declare-fun Unit!10023 () Unit!10012)

(assert (=> b!156241 (= lt!244157 Unit!10023)))

(declare-fun lt!244135 () Unit!10012)

(declare-fun arrayRangesEqImpliesEq!42 (array!7153 array!7153 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10012)

(assert (=> b!156241 (= lt!244135 (arrayRangesEqImpliesEq!42 lt!244154 (_3!435 lt!244144) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156241 (= (select (store (arr!4060 arr!153) from!240 (_1!7408 lt!244146)) from!240) (select (arr!4060 (_3!435 lt!244144)) from!240))))

(declare-fun lt!244163 () Unit!10012)

(assert (=> b!156241 (= lt!244163 lt!244135)))

(declare-fun lt!244143 () Bool)

(assert (=> b!156241 (= lt!244143 (= (select (arr!4060 (_3!435 lt!244144)) from!240) (_1!7408 lt!244146)))))

(declare-fun Unit!10024 () Unit!10012)

(assert (=> b!156241 (= lt!244165 Unit!10024)))

(assert (=> b!156241 lt!244143))

(declare-fun bm!2390 () Bool)

(assert (=> bm!2390 (= call!2391 (arrayRangesEq!422 arr!153 (ite c!8319 (array!7154 (store (arr!4060 arr!153) from!240 (_1!7408 lt!244146)) (size!3210 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8319 from!240 (size!3210 arr!153))))))

(assert (= (and d!51932 c!8319) b!156241))

(assert (= (and d!51932 (not c!8319)) b!156238))

(assert (= (or b!156241 b!156238) bm!2389))

(assert (= (or b!156241 b!156238) bm!2390))

(assert (= (or b!156241 b!156238) bm!2388))

(assert (= (and d!51932 res!130599) b!156237))

(assert (= (and b!156237 res!130598) b!156239))

(assert (= (and d!51932 (not res!130597)) b!156240))

(declare-fun m!243271 () Bool)

(assert (=> b!156240 m!243271))

(assert (=> b!156240 m!243205))

(declare-fun m!243273 () Bool)

(assert (=> b!156241 m!243273))

(declare-fun m!243275 () Bool)

(assert (=> b!156241 m!243275))

(declare-fun m!243277 () Bool)

(assert (=> b!156241 m!243277))

(declare-fun m!243279 () Bool)

(assert (=> b!156241 m!243279))

(declare-fun m!243281 () Bool)

(assert (=> b!156241 m!243281))

(declare-fun m!243283 () Bool)

(assert (=> b!156241 m!243283))

(declare-fun m!243285 () Bool)

(assert (=> b!156241 m!243285))

(declare-fun m!243287 () Bool)

(assert (=> b!156241 m!243287))

(declare-fun m!243289 () Bool)

(assert (=> b!156241 m!243289))

(assert (=> b!156241 m!243239))

(declare-fun m!243291 () Bool)

(assert (=> b!156241 m!243291))

(declare-fun m!243293 () Bool)

(assert (=> b!156241 m!243293))

(declare-fun m!243295 () Bool)

(assert (=> b!156241 m!243295))

(declare-fun m!243297 () Bool)

(assert (=> b!156238 m!243297))

(declare-fun m!243299 () Bool)

(assert (=> b!156238 m!243299))

(declare-fun m!243301 () Bool)

(assert (=> bm!2389 m!243301))

(declare-fun m!243303 () Bool)

(assert (=> bm!2388 m!243303))

(assert (=> bm!2390 m!243291))

(declare-fun m!243305 () Bool)

(assert (=> bm!2390 m!243305))

(declare-fun m!243307 () Bool)

(assert (=> d!51932 m!243307))

(assert (=> d!51932 m!243283))

(declare-fun m!243309 () Bool)

(assert (=> b!156239 m!243309))

(assert (=> d!51898 d!51932))

(declare-fun d!51942 () Bool)

(declare-fun e!105515 () Bool)

(assert (=> d!51942 e!105515))

(declare-fun res!130602 () Bool)

(assert (=> d!51942 (=> (not res!130602) (not e!105515))))

(assert (=> d!51942 (= res!130602 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10025 () Unit!10012)

(assert (=> d!51942 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13939 Unit!10025 (BitStream!5679 (buf!3713 bs!65) (bvadd (currentByte!6813 bs!65) #b00000000000000000000000000000001) (currentBit!6808 bs!65))))))

(declare-fun b!156244 () Bool)

(assert (=> b!156244 (= e!105515 (and (or (not (= (bvand (currentByte!6813 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6813 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6813 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6813 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6813 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51942 res!130602) b!156244))

(assert (=> d!51942 m!243217))

(assert (=> d!51890 d!51942))

(declare-fun d!51944 () Bool)

(declare-fun lt!244183 () (_ BitVec 8))

(declare-fun lt!244189 () (_ BitVec 8))

(assert (=> d!51944 (= lt!244183 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4060 (buf!3713 bs!65)) (currentByte!6813 bs!65))) ((_ sign_extend 24) lt!244189))))))

(assert (=> d!51944 (= lt!244189 ((_ extract 7 0) (currentBit!6808 bs!65)))))

(declare-fun e!105520 () Bool)

(assert (=> d!51944 e!105520))

(declare-fun res!130609 () Bool)

(assert (=> d!51944 (=> (not res!130609) (not e!105520))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51944 (= res!130609 (validate_offset_bits!1 ((_ sign_extend 32) (size!3210 (buf!3713 bs!65))) ((_ sign_extend 32) (currentByte!6813 bs!65)) ((_ sign_extend 32) (currentBit!6808 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13950 0))(
  ( (tuple2!13951 (_1!7413 Unit!10012) (_2!7413 (_ BitVec 8))) )
))
(declare-fun Unit!10030 () Unit!10012)

(declare-fun Unit!10031 () Unit!10012)

(assert (=> d!51944 (= (readByte!0 bs!65) (tuple2!13943 (_2!7413 (ite (bvsgt ((_ sign_extend 24) lt!244189) #b00000000000000000000000000000000) (tuple2!13951 Unit!10030 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244183) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4060 (buf!3713 bs!65)) (bvadd (currentByte!6813 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!244189)))))))) (tuple2!13951 Unit!10031 lt!244183))) (BitStream!5679 (buf!3713 bs!65) (bvadd (currentByte!6813 bs!65) #b00000000000000000000000000000001) (currentBit!6808 bs!65))))))

(declare-fun b!156249 () Bool)

(declare-fun e!105521 () Bool)

(assert (=> b!156249 (= e!105520 e!105521)))

(declare-fun res!130608 () Bool)

(assert (=> b!156249 (=> (not res!130608) (not e!105521))))

(declare-fun lt!244185 () tuple2!13942)

(assert (=> b!156249 (= res!130608 (= (buf!3713 (_2!7408 lt!244185)) (buf!3713 bs!65)))))

(declare-fun lt!244187 () (_ BitVec 8))

(declare-fun lt!244184 () (_ BitVec 8))

(declare-fun Unit!10032 () Unit!10012)

(declare-fun Unit!10033 () Unit!10012)

(assert (=> b!156249 (= lt!244185 (tuple2!13943 (_2!7413 (ite (bvsgt ((_ sign_extend 24) lt!244184) #b00000000000000000000000000000000) (tuple2!13951 Unit!10032 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244187) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4060 (buf!3713 bs!65)) (bvadd (currentByte!6813 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!244184)))))))) (tuple2!13951 Unit!10033 lt!244187))) (BitStream!5679 (buf!3713 bs!65) (bvadd (currentByte!6813 bs!65) #b00000000000000000000000000000001) (currentBit!6808 bs!65))))))

(assert (=> b!156249 (= lt!244187 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4060 (buf!3713 bs!65)) (currentByte!6813 bs!65))) ((_ sign_extend 24) lt!244184))))))

(assert (=> b!156249 (= lt!244184 ((_ extract 7 0) (currentBit!6808 bs!65)))))

(declare-fun lt!244188 () (_ BitVec 64))

(declare-fun b!156250 () Bool)

(declare-fun lt!244186 () (_ BitVec 64))

(assert (=> b!156250 (= e!105521 (= (bitIndex!0 (size!3210 (buf!3713 (_2!7408 lt!244185))) (currentByte!6813 (_2!7408 lt!244185)) (currentBit!6808 (_2!7408 lt!244185))) (bvadd lt!244186 lt!244188)))))

(assert (=> b!156250 (or (not (= (bvand lt!244186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244188 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244186 lt!244188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156250 (= lt!244188 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156250 (= lt!244186 (bitIndex!0 (size!3210 (buf!3713 bs!65)) (currentByte!6813 bs!65) (currentBit!6808 bs!65)))))

(assert (= (and d!51944 res!130609) b!156249))

(assert (= (and b!156249 res!130608) b!156250))

(declare-fun m!243311 () Bool)

(assert (=> d!51944 m!243311))

(declare-fun m!243313 () Bool)

(assert (=> d!51944 m!243313))

(declare-fun m!243315 () Bool)

(assert (=> d!51944 m!243315))

(assert (=> b!156249 m!243315))

(assert (=> b!156249 m!243311))

(declare-fun m!243317 () Bool)

(assert (=> b!156250 m!243317))

(assert (=> b!156250 m!243283))

(assert (=> d!51894 d!51944))

(declare-fun b!156251 () Bool)

(declare-fun res!130611 () Bool)

(declare-fun e!105524 () Bool)

(assert (=> b!156251 (=> (not res!130611) (not e!105524))))

(declare-fun lt!244206 () tuple3!636)

(assert (=> b!156251 (= res!130611 (and (= (buf!3713 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3713 (_2!7403 lt!244206))) (= (size!3210 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))) (size!3210 (_3!435 lt!244206)))))))

(declare-fun lt!244218 () Unit!10012)

(declare-fun b!156252 () Bool)

(declare-fun e!105523 () tuple3!636)

(assert (=> b!156252 (= e!105523 (tuple3!637 lt!244218 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))))))

(declare-fun call!2396 () (_ BitVec 64))

(assert (=> b!156252 (= call!2396 call!2396)))

(declare-fun lt!244191 () Unit!10012)

(declare-fun Unit!10041 () Unit!10012)

(assert (=> b!156252 (= lt!244191 Unit!10041)))

(declare-fun lt!244204 () Unit!10012)

(assert (=> b!156252 (= lt!244204 (arrayRangesEqReflexiveLemma!33 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))))))

(declare-fun call!2394 () Bool)

(assert (=> b!156252 call!2394))

(declare-fun lt!244194 () Unit!10012)

(assert (=> b!156252 (= lt!244194 lt!244204)))

(declare-fun lt!244219 () array!7153)

(assert (=> b!156252 (= lt!244219 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)))))

(declare-fun lt!244215 () array!7153)

(assert (=> b!156252 (= lt!244215 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)))))

(declare-fun lt!244202 () (_ BitVec 32))

(assert (=> b!156252 (= lt!244202 #b00000000000000000000000000000000)))

(declare-fun lt!244198 () (_ BitVec 32))

(assert (=> b!156252 (= lt!244198 (size!3210 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))))))

(declare-fun lt!244205 () (_ BitVec 32))

(assert (=> b!156252 (= lt!244205 #b00000000000000000000000000000000)))

(declare-fun lt!244190 () (_ BitVec 32))

(assert (=> b!156252 (= lt!244190 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!156252 (= lt!244218 (arrayRangesEqSlicedLemma!33 lt!244219 lt!244215 lt!244202 lt!244198 lt!244205 lt!244190))))

(declare-fun call!2395 () Bool)

(assert (=> b!156252 call!2395))

(declare-fun bm!2391 () Bool)

(declare-fun lt!244203 () tuple2!13942)

(declare-fun c!8320 () Bool)

(assert (=> bm!2391 (= call!2396 (bitIndex!0 (ite c!8320 (size!3210 (buf!3713 (_2!7408 lt!244203))) (size!3210 (buf!3713 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))) (ite c!8320 (currentByte!6813 (_2!7408 lt!244203)) (currentByte!6813 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (ite c!8320 (currentBit!6808 (_2!7408 lt!244203)) (currentBit!6808 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(declare-fun d!51946 () Bool)

(declare-fun e!105522 () Bool)

(assert (=> d!51946 e!105522))

(declare-fun res!130610 () Bool)

(assert (=> d!51946 (=> res!130610 e!105522)))

(assert (=> d!51946 (= res!130610 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244195 () Bool)

(assert (=> d!51946 (= lt!244195 e!105524)))

(declare-fun res!130612 () Bool)

(assert (=> d!51946 (=> (not res!130612) (not e!105524))))

(declare-fun lt!244225 () (_ BitVec 64))

(declare-fun lt!244193 () (_ BitVec 64))

(assert (=> d!51946 (= res!130612 (= (bvadd lt!244193 lt!244225) (bitIndex!0 (size!3210 (buf!3713 (_2!7403 lt!244206))) (currentByte!6813 (_2!7403 lt!244206)) (currentBit!6808 (_2!7403 lt!244206)))))))

(assert (=> d!51946 (or (not (= (bvand lt!244193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244225 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244193 lt!244225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244197 () (_ BitVec 64))

(assert (=> d!51946 (= lt!244225 (bvmul lt!244197 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51946 (or (= lt!244197 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244197 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244197)))))

(assert (=> d!51946 (= lt!244197 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51946 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51946 (= lt!244193 (bitIndex!0 (size!3210 (buf!3713 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6813 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6808 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(assert (=> d!51946 (= lt!244206 e!105523)))

(assert (=> d!51946 (= c!8320 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51946 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3210 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)))))))

(assert (=> d!51946 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!244206)))

(declare-fun b!156253 () Bool)

(assert (=> b!156253 (= e!105524 (arrayRangesEq!422 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) (_3!435 lt!244206) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!156254 () Bool)

(assert (=> b!156254 (= e!105522 (= (select (arr!4060 (_3!435 lt!244206)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7402 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156254 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3210 (_3!435 lt!244206))))))

(declare-fun lt!244201 () tuple3!636)

(declare-fun bm!2392 () Bool)

(declare-fun lt!244221 () (_ BitVec 32))

(assert (=> bm!2392 (= call!2395 (arrayRangesEq!422 (ite c!8320 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) lt!244219) (ite c!8320 (_3!435 lt!244201) lt!244215) (ite c!8320 lt!244221 lt!244205) (ite c!8320 (bvadd #b00000000000000000000000000000001 from!240) lt!244190)))))

(declare-fun b!156255 () Bool)

(declare-fun lt!244222 () Unit!10012)

(assert (=> b!156255 (= e!105523 (tuple3!637 lt!244222 (_2!7403 lt!244201) (_3!435 lt!244201)))))

(assert (=> b!156255 (= lt!244203 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!244211 () array!7153)

(assert (=> b!156255 (= lt!244211 (array!7154 (store (arr!4060 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7408 lt!244203)) (size!3210 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)))))))

(declare-fun lt!244223 () (_ BitVec 64))

(assert (=> b!156255 (= lt!244223 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244207 () (_ BitVec 32))

(assert (=> b!156255 (= lt!244207 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244209 () Unit!10012)

(assert (=> b!156255 (= lt!244209 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7408 lt!244203) lt!244223 lt!244207))))

(assert (=> b!156255 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3210 (buf!3713 (_2!7408 lt!244203)))) ((_ sign_extend 32) (currentByte!6813 (_2!7408 lt!244203))) ((_ sign_extend 32) (currentBit!6808 (_2!7408 lt!244203))) (bvsub lt!244207 ((_ extract 31 0) (bvsdiv (bvadd lt!244223 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244213 () Unit!10012)

(assert (=> b!156255 (= lt!244213 lt!244209)))

(assert (=> b!156255 (= lt!244201 (readByteArrayLoop!0 (_2!7408 lt!244203) lt!244211 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156255 (= call!2396 (bvadd (bitIndex!0 (size!3210 (buf!3713 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6813 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6808 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244208 () Unit!10012)

(declare-fun Unit!10055 () Unit!10012)

(assert (=> b!156255 (= lt!244208 Unit!10055)))

(assert (=> b!156255 (= (bvadd call!2396 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3210 (buf!3713 (_2!7403 lt!244201))) (currentByte!6813 (_2!7403 lt!244201)) (currentBit!6808 (_2!7403 lt!244201))))))

(declare-fun lt!244210 () Unit!10012)

(declare-fun Unit!10056 () Unit!10012)

(assert (=> b!156255 (= lt!244210 Unit!10056)))

(assert (=> b!156255 (= (bvadd (bitIndex!0 (size!3210 (buf!3713 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6813 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6808 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3210 (buf!3713 (_2!7403 lt!244201))) (currentByte!6813 (_2!7403 lt!244201)) (currentBit!6808 (_2!7403 lt!244201))))))

(declare-fun lt!244216 () Unit!10012)

(declare-fun Unit!10058 () Unit!10012)

(assert (=> b!156255 (= lt!244216 Unit!10058)))

(assert (=> b!156255 (and (= (buf!3713 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3713 (_2!7403 lt!244201))) (= (size!3210 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))) (size!3210 (_3!435 lt!244201))))))

(declare-fun lt!244199 () Unit!10012)

(declare-fun Unit!10061 () Unit!10012)

(assert (=> b!156255 (= lt!244199 Unit!10061)))

(declare-fun lt!244217 () Unit!10012)

(assert (=> b!156255 (= lt!244217 (arrayUpdatedAtPrefixLemma!33 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7408 lt!244203)))))

(assert (=> b!156255 call!2394))

(declare-fun lt!244196 () Unit!10012)

(assert (=> b!156255 (= lt!244196 lt!244217)))

(assert (=> b!156255 (= lt!244221 #b00000000000000000000000000000000)))

(declare-fun lt!244224 () Unit!10012)

(assert (=> b!156255 (= lt!244224 (arrayRangesEqTransitive!98 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) lt!244211 (_3!435 lt!244201) lt!244221 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156255 call!2395))

(declare-fun lt!244212 () Unit!10012)

(assert (=> b!156255 (= lt!244212 lt!244224)))

(assert (=> b!156255 (arrayRangesEq!422 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) (_3!435 lt!244201) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!244214 () Unit!10012)

(declare-fun Unit!10065 () Unit!10012)

(assert (=> b!156255 (= lt!244214 Unit!10065)))

(declare-fun lt!244192 () Unit!10012)

(assert (=> b!156255 (= lt!244192 (arrayRangesEqImpliesEq!42 lt!244211 (_3!435 lt!244201) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156255 (= (select (store (arr!4060 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7408 lt!244203)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4060 (_3!435 lt!244201)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244220 () Unit!10012)

(assert (=> b!156255 (= lt!244220 lt!244192)))

(declare-fun lt!244200 () Bool)

(assert (=> b!156255 (= lt!244200 (= (select (arr!4060 (_3!435 lt!244201)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7408 lt!244203)))))

(declare-fun Unit!10066 () Unit!10012)

(assert (=> b!156255 (= lt!244222 Unit!10066)))

(assert (=> b!156255 lt!244200))

(declare-fun bm!2393 () Bool)

(assert (=> bm!2393 (= call!2394 (arrayRangesEq!422 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)) (ite c!8320 (array!7154 (store (arr!4060 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7408 lt!244203)) (size!3210 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153)))) (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))) #b00000000000000000000000000000000 (ite c!8320 (bvadd #b00000000000000000000000000000001 from!240) (size!3210 (array!7154 (store (arr!4060 arr!153) from!240 (_2!7402 (readBytePure!0 bs!65))) (size!3210 arr!153))))))))

(assert (= (and d!51946 c!8320) b!156255))

(assert (= (and d!51946 (not c!8320)) b!156252))

(assert (= (or b!156255 b!156252) bm!2392))

(assert (= (or b!156255 b!156252) bm!2393))

(assert (= (or b!156255 b!156252) bm!2391))

(assert (= (and d!51946 res!130612) b!156251))

(assert (= (and b!156251 res!130611) b!156253))

(assert (= (and d!51946 (not res!130610)) b!156254))

(declare-fun m!243319 () Bool)

(assert (=> b!156254 m!243319))

(assert (=> b!156254 m!243207))

(declare-fun m!243321 () Bool)

(assert (=> b!156254 m!243321))

(declare-fun m!243323 () Bool)

(assert (=> b!156255 m!243323))

(declare-fun m!243325 () Bool)

(assert (=> b!156255 m!243325))

(declare-fun m!243327 () Bool)

(assert (=> b!156255 m!243327))

(declare-fun m!243329 () Bool)

(assert (=> b!156255 m!243329))

(declare-fun m!243331 () Bool)

(assert (=> b!156255 m!243331))

(declare-fun m!243333 () Bool)

(assert (=> b!156255 m!243333))

(assert (=> b!156255 m!243207))

(declare-fun m!243335 () Bool)

(assert (=> b!156255 m!243335))

(declare-fun m!243337 () Bool)

(assert (=> b!156255 m!243337))

(declare-fun m!243339 () Bool)

(assert (=> b!156255 m!243339))

(assert (=> b!156255 m!243207))

(declare-fun m!243341 () Bool)

(assert (=> b!156255 m!243341))

(declare-fun m!243343 () Bool)

(assert (=> b!156255 m!243343))

(declare-fun m!243345 () Bool)

(assert (=> b!156255 m!243345))

(declare-fun m!243347 () Bool)

(assert (=> b!156255 m!243347))

(declare-fun m!243349 () Bool)

(assert (=> b!156252 m!243349))

(declare-fun m!243351 () Bool)

(assert (=> b!156252 m!243351))

(declare-fun m!243353 () Bool)

(assert (=> bm!2392 m!243353))

(declare-fun m!243355 () Bool)

(assert (=> bm!2391 m!243355))

(assert (=> bm!2393 m!243343))

(declare-fun m!243357 () Bool)

(assert (=> bm!2393 m!243357))

(declare-fun m!243359 () Bool)

(assert (=> d!51946 m!243359))

(assert (=> d!51946 m!243333))

(declare-fun m!243361 () Bool)

(assert (=> b!156253 m!243361))

(assert (=> d!51886 d!51946))

(declare-fun d!51948 () Bool)

(assert (=> d!51948 (= (invariant!0 (currentBit!6808 bs!65) (currentByte!6813 bs!65) (size!3210 (buf!3713 bs!65))) (and (bvsge (currentBit!6808 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6808 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6813 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6813 bs!65) (size!3210 (buf!3713 bs!65))) (and (= (currentBit!6808 bs!65) #b00000000000000000000000000000000) (= (currentByte!6813 bs!65) (size!3210 (buf!3713 bs!65)))))))))

(assert (=> d!51910 d!51948))

(push 1)

