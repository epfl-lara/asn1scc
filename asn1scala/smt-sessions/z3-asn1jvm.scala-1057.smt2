; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30294 () Bool)

(assert start!30294)

(declare-fun b!155209 () Bool)

(declare-fun res!129829 () Bool)

(declare-fun e!104495 () Bool)

(assert (=> b!155209 (=> (not res!129829) (not e!104495))))

(declare-fun lt!241607 () (_ BitVec 64))

(declare-datatypes ((array!7042 0))(
  ( (array!7043 (arr!3990 (Array (_ BitVec 32) (_ BitVec 8))) (size!3167 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5592 0))(
  ( (BitStream!5593 (buf!3670 array!7042) (currentByte!6709 (_ BitVec 32)) (currentBit!6704 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5592)

(declare-fun bs2!18 () BitStream!5592)

(declare-fun arrayBitRangesEq!0 (array!7042 array!7042 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155209 (= res!129829 (arrayBitRangesEq!0 (buf!3670 bs1!10) (buf!3670 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241607))))

(declare-fun b!155210 () Bool)

(declare-fun e!104490 () Bool)

(assert (=> b!155210 (= e!104490 e!104495)))

(declare-fun res!129827 () Bool)

(assert (=> b!155210 (=> (not res!129827) (not e!104495))))

(assert (=> b!155210 (= res!129827 (bvsle lt!241607 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3167 (buf!3670 bs1!10))))))))

(declare-fun lt!241609 () (_ BitVec 64))

(assert (=> b!155210 (= lt!241607 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241609))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155210 (= lt!241609 (bitIndex!0 (size!3167 (buf!3670 bs1!10)) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))))

(declare-fun res!129830 () Bool)

(assert (=> start!30294 (=> (not res!129830) (not e!104490))))

(assert (=> start!30294 (= res!129830 (= (size!3167 (buf!3670 bs1!10)) (size!3167 (buf!3670 bs2!18))))))

(assert (=> start!30294 e!104490))

(declare-fun e!104494 () Bool)

(declare-fun inv!12 (BitStream!5592) Bool)

(assert (=> start!30294 (and (inv!12 bs1!10) e!104494)))

(declare-fun e!104489 () Bool)

(assert (=> start!30294 (and (inv!12 bs2!18) e!104489)))

(declare-fun b!155211 () Bool)

(declare-fun array_inv!2956 (array!7042) Bool)

(assert (=> b!155211 (= e!104494 (array_inv!2956 (buf!3670 bs1!10)))))

(declare-fun b!155212 () Bool)

(declare-fun res!129828 () Bool)

(assert (=> b!155212 (=> (not res!129828) (not e!104495))))

(assert (=> b!155212 (= res!129828 (bvsle lt!241607 (bitIndex!0 (size!3167 (buf!3670 bs2!18)) (currentByte!6709 bs2!18) (currentBit!6704 bs2!18))))))

(declare-fun b!155213 () Bool)

(declare-fun e!104492 () Bool)

(assert (=> b!155213 (= e!104495 e!104492)))

(declare-fun res!129831 () Bool)

(assert (=> b!155213 (=> (not res!129831) (not e!104492))))

(declare-fun lt!241606 () (_ BitVec 32))

(assert (=> b!155213 (= res!129831 (and (bvsle #b00000000000000000000000000000000 lt!241606) (bvsle lt!241606 (size!3167 (buf!3670 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6709 bs1!10)) (bvslt (currentByte!6709 bs1!10) lt!241606)))))

(assert (=> b!155213 (= lt!241606 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241609 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13748 0))(
  ( (tuple2!13749 (_1!7288 BitStream!5592) (_2!7288 (_ BitVec 8))) )
))
(declare-fun lt!241610 () tuple2!13748)

(declare-fun readBytePure!0 (BitStream!5592) tuple2!13748)

(assert (=> b!155213 (= lt!241610 (readBytePure!0 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))))))

(declare-fun lt!241608 () tuple2!13748)

(assert (=> b!155213 (= lt!241608 (readBytePure!0 bs1!10))))

(declare-fun b!155214 () Bool)

(assert (=> b!155214 (= e!104489 (array_inv!2956 (buf!3670 bs2!18)))))

(declare-fun b!155215 () Bool)

(declare-fun arrayRangesEq!405 (array!7042 array!7042 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155215 (= e!104492 (not (arrayRangesEq!405 (buf!3670 bs1!10) (buf!3670 bs2!18) #b00000000000000000000000000000000 lt!241606)))))

(assert (= (and start!30294 res!129830) b!155210))

(assert (= (and b!155210 res!129827) b!155212))

(assert (= (and b!155212 res!129828) b!155209))

(assert (= (and b!155209 res!129829) b!155213))

(assert (= (and b!155213 res!129831) b!155215))

(assert (= start!30294 b!155211))

(assert (= start!30294 b!155214))

(declare-fun m!241175 () Bool)

(assert (=> b!155213 m!241175))

(declare-fun m!241177 () Bool)

(assert (=> b!155213 m!241177))

(declare-fun m!241179 () Bool)

(assert (=> b!155214 m!241179))

(declare-fun m!241181 () Bool)

(assert (=> b!155210 m!241181))

(declare-fun m!241183 () Bool)

(assert (=> b!155211 m!241183))

(declare-fun m!241185 () Bool)

(assert (=> b!155215 m!241185))

(declare-fun m!241187 () Bool)

(assert (=> b!155209 m!241187))

(declare-fun m!241189 () Bool)

(assert (=> b!155212 m!241189))

(declare-fun m!241191 () Bool)

(assert (=> start!30294 m!241191))

(declare-fun m!241193 () Bool)

(assert (=> start!30294 m!241193))

(check-sat (not b!155213) (not b!155214) (not b!155212) (not b!155211) (not b!155209) (not start!30294) (not b!155210) (not b!155215))
(check-sat)
(get-model)

(declare-fun d!51192 () Bool)

(assert (=> d!51192 (= (array_inv!2956 (buf!3670 bs1!10)) (bvsge (size!3167 (buf!3670 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155211 d!51192))

(declare-fun d!51194 () Bool)

(declare-fun e!104519 () Bool)

(assert (=> d!51194 e!104519))

(declare-fun res!129852 () Bool)

(assert (=> d!51194 (=> (not res!129852) (not e!104519))))

(declare-fun lt!241641 () (_ BitVec 64))

(declare-fun lt!241639 () (_ BitVec 64))

(declare-fun lt!241640 () (_ BitVec 64))

(assert (=> d!51194 (= res!129852 (= lt!241639 (bvsub lt!241641 lt!241640)))))

(assert (=> d!51194 (or (= (bvand lt!241641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241640 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241641 lt!241640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51194 (= lt!241640 (remainingBits!0 ((_ sign_extend 32) (size!3167 (buf!3670 bs1!10))) ((_ sign_extend 32) (currentByte!6709 bs1!10)) ((_ sign_extend 32) (currentBit!6704 bs1!10))))))

(declare-fun lt!241643 () (_ BitVec 64))

(declare-fun lt!241638 () (_ BitVec 64))

(assert (=> d!51194 (= lt!241641 (bvmul lt!241643 lt!241638))))

(assert (=> d!51194 (or (= lt!241643 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241638 (bvsdiv (bvmul lt!241643 lt!241638) lt!241643)))))

(assert (=> d!51194 (= lt!241638 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51194 (= lt!241643 ((_ sign_extend 32) (size!3167 (buf!3670 bs1!10))))))

(assert (=> d!51194 (= lt!241639 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6709 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6704 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51194 (invariant!0 (currentBit!6704 bs1!10) (currentByte!6709 bs1!10) (size!3167 (buf!3670 bs1!10)))))

(assert (=> d!51194 (= (bitIndex!0 (size!3167 (buf!3670 bs1!10)) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)) lt!241639)))

(declare-fun b!155241 () Bool)

(declare-fun res!129851 () Bool)

(assert (=> b!155241 (=> (not res!129851) (not e!104519))))

(assert (=> b!155241 (= res!129851 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241639))))

(declare-fun b!155242 () Bool)

(declare-fun lt!241642 () (_ BitVec 64))

(assert (=> b!155242 (= e!104519 (bvsle lt!241639 (bvmul lt!241642 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155242 (or (= lt!241642 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241642 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241642)))))

(assert (=> b!155242 (= lt!241642 ((_ sign_extend 32) (size!3167 (buf!3670 bs1!10))))))

(assert (= (and d!51194 res!129852) b!155241))

(assert (= (and b!155241 res!129851) b!155242))

(declare-fun m!241215 () Bool)

(assert (=> d!51194 m!241215))

(declare-fun m!241217 () Bool)

(assert (=> d!51194 m!241217))

(assert (=> b!155210 d!51194))

(declare-fun d!51196 () Bool)

(declare-fun res!129857 () Bool)

(declare-fun e!104524 () Bool)

(assert (=> d!51196 (=> res!129857 e!104524)))

(assert (=> d!51196 (= res!129857 (= #b00000000000000000000000000000000 lt!241606))))

(assert (=> d!51196 (= (arrayRangesEq!405 (buf!3670 bs1!10) (buf!3670 bs2!18) #b00000000000000000000000000000000 lt!241606) e!104524)))

(declare-fun b!155247 () Bool)

(declare-fun e!104525 () Bool)

(assert (=> b!155247 (= e!104524 e!104525)))

(declare-fun res!129858 () Bool)

(assert (=> b!155247 (=> (not res!129858) (not e!104525))))

(assert (=> b!155247 (= res!129858 (= (select (arr!3990 (buf!3670 bs1!10)) #b00000000000000000000000000000000) (select (arr!3990 (buf!3670 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!155248 () Bool)

(assert (=> b!155248 (= e!104525 (arrayRangesEq!405 (buf!3670 bs1!10) (buf!3670 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241606))))

(assert (= (and d!51196 (not res!129857)) b!155247))

(assert (= (and b!155247 res!129858) b!155248))

(declare-fun m!241219 () Bool)

(assert (=> b!155247 m!241219))

(declare-fun m!241221 () Bool)

(assert (=> b!155247 m!241221))

(declare-fun m!241223 () Bool)

(assert (=> b!155248 m!241223))

(assert (=> b!155215 d!51196))

(declare-fun d!51198 () Bool)

(assert (=> d!51198 (= (array_inv!2956 (buf!3670 bs2!18)) (bvsge (size!3167 (buf!3670 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155214 d!51198))

(declare-fun b!155269 () Bool)

(declare-fun e!104544 () Bool)

(declare-datatypes ((tuple4!222 0))(
  ( (tuple4!223 (_1!7290 (_ BitVec 32)) (_2!7290 (_ BitVec 32)) (_3!414 (_ BitVec 32)) (_4!111 (_ BitVec 32))) )
))
(declare-fun lt!241650 () tuple4!222)

(assert (=> b!155269 (= e!104544 (arrayRangesEq!405 (buf!3670 bs1!10) (buf!3670 bs2!18) (_1!7290 lt!241650) (_2!7290 lt!241650)))))

(declare-fun b!155270 () Bool)

(declare-fun e!104548 () Bool)

(declare-fun call!2243 () Bool)

(assert (=> b!155270 (= e!104548 call!2243)))

(declare-fun b!155271 () Bool)

(declare-fun e!104547 () Bool)

(declare-fun e!104545 () Bool)

(assert (=> b!155271 (= e!104547 e!104545)))

(declare-fun lt!241652 () (_ BitVec 32))

(declare-fun res!129875 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155271 (= res!129875 (byteRangesEq!0 (select (arr!3990 (buf!3670 bs1!10)) (_3!414 lt!241650)) (select (arr!3990 (buf!3670 bs2!18)) (_3!414 lt!241650)) lt!241652 #b00000000000000000000000000001000))))

(assert (=> b!155271 (=> (not res!129875) (not e!104545))))

(declare-fun b!155272 () Bool)

(declare-fun res!129876 () Bool)

(declare-fun lt!241651 () (_ BitVec 32))

(assert (=> b!155272 (= res!129876 (= lt!241651 #b00000000000000000000000000000000))))

(assert (=> b!155272 (=> res!129876 e!104548)))

(assert (=> b!155272 (= e!104545 e!104548)))

(declare-fun d!51200 () Bool)

(declare-fun res!129877 () Bool)

(declare-fun e!104546 () Bool)

(assert (=> d!51200 (=> res!129877 e!104546)))

(assert (=> d!51200 (= res!129877 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241607))))

(assert (=> d!51200 (= (arrayBitRangesEq!0 (buf!3670 bs1!10) (buf!3670 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241607) e!104546)))

(declare-fun b!155273 () Bool)

(assert (=> b!155273 (= e!104547 call!2243)))

(declare-fun b!155274 () Bool)

(declare-fun e!104549 () Bool)

(assert (=> b!155274 (= e!104546 e!104549)))

(declare-fun res!129879 () Bool)

(assert (=> b!155274 (=> (not res!129879) (not e!104549))))

(assert (=> b!155274 (= res!129879 e!104544)))

(declare-fun res!129878 () Bool)

(assert (=> b!155274 (=> res!129878 e!104544)))

(assert (=> b!155274 (= res!129878 (bvsge (_1!7290 lt!241650) (_2!7290 lt!241650)))))

(assert (=> b!155274 (= lt!241651 ((_ extract 31 0) (bvsrem lt!241607 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155274 (= lt!241652 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!222)

(assert (=> b!155274 (= lt!241650 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241607))))

(declare-fun c!8259 () Bool)

(declare-fun bm!2240 () Bool)

(assert (=> bm!2240 (= call!2243 (byteRangesEq!0 (ite c!8259 (select (arr!3990 (buf!3670 bs1!10)) (_3!414 lt!241650)) (select (arr!3990 (buf!3670 bs1!10)) (_4!111 lt!241650))) (ite c!8259 (select (arr!3990 (buf!3670 bs2!18)) (_3!414 lt!241650)) (select (arr!3990 (buf!3670 bs2!18)) (_4!111 lt!241650))) (ite c!8259 lt!241652 #b00000000000000000000000000000000) lt!241651))))

(declare-fun b!155275 () Bool)

(assert (=> b!155275 (= e!104549 e!104547)))

(assert (=> b!155275 (= c!8259 (= (_3!414 lt!241650) (_4!111 lt!241650)))))

(assert (= (and d!51200 (not res!129877)) b!155274))

(assert (= (and b!155274 (not res!129878)) b!155269))

(assert (= (and b!155274 res!129879) b!155275))

(assert (= (and b!155275 c!8259) b!155273))

(assert (= (and b!155275 (not c!8259)) b!155271))

(assert (= (and b!155271 res!129875) b!155272))

(assert (= (and b!155272 (not res!129876)) b!155270))

(assert (= (or b!155273 b!155270) bm!2240))

(declare-fun m!241231 () Bool)

(assert (=> b!155269 m!241231))

(declare-fun m!241233 () Bool)

(assert (=> b!155271 m!241233))

(declare-fun m!241235 () Bool)

(assert (=> b!155271 m!241235))

(assert (=> b!155271 m!241233))

(assert (=> b!155271 m!241235))

(declare-fun m!241237 () Bool)

(assert (=> b!155271 m!241237))

(declare-fun m!241239 () Bool)

(assert (=> b!155274 m!241239))

(declare-fun m!241241 () Bool)

(assert (=> bm!2240 m!241241))

(assert (=> bm!2240 m!241235))

(assert (=> bm!2240 m!241233))

(declare-fun m!241243 () Bool)

(assert (=> bm!2240 m!241243))

(declare-fun m!241245 () Bool)

(assert (=> bm!2240 m!241245))

(assert (=> b!155209 d!51200))

(declare-fun d!51206 () Bool)

(declare-datatypes ((tuple2!13752 0))(
  ( (tuple2!13753 (_1!7291 (_ BitVec 8)) (_2!7291 BitStream!5592)) )
))
(declare-fun lt!241655 () tuple2!13752)

(declare-fun readByte!0 (BitStream!5592) tuple2!13752)

(assert (=> d!51206 (= lt!241655 (readByte!0 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))))))

(assert (=> d!51206 (= (readBytePure!0 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) (tuple2!13749 (_2!7291 lt!241655) (_1!7291 lt!241655)))))

(declare-fun bs!12532 () Bool)

(assert (= bs!12532 d!51206))

(declare-fun m!241247 () Bool)

(assert (=> bs!12532 m!241247))

(assert (=> b!155213 d!51206))

(declare-fun d!51208 () Bool)

(declare-fun lt!241656 () tuple2!13752)

(assert (=> d!51208 (= lt!241656 (readByte!0 bs1!10))))

(assert (=> d!51208 (= (readBytePure!0 bs1!10) (tuple2!13749 (_2!7291 lt!241656) (_1!7291 lt!241656)))))

(declare-fun bs!12533 () Bool)

(assert (= bs!12533 d!51208))

(declare-fun m!241249 () Bool)

(assert (=> bs!12533 m!241249))

(assert (=> b!155213 d!51208))

(declare-fun d!51210 () Bool)

(declare-fun e!104550 () Bool)

(assert (=> d!51210 e!104550))

(declare-fun res!129881 () Bool)

(assert (=> d!51210 (=> (not res!129881) (not e!104550))))

(declare-fun lt!241658 () (_ BitVec 64))

(declare-fun lt!241660 () (_ BitVec 64))

(declare-fun lt!241659 () (_ BitVec 64))

(assert (=> d!51210 (= res!129881 (= lt!241658 (bvsub lt!241660 lt!241659)))))

(assert (=> d!51210 (or (= (bvand lt!241660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241659 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241660 lt!241659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51210 (= lt!241659 (remainingBits!0 ((_ sign_extend 32) (size!3167 (buf!3670 bs2!18))) ((_ sign_extend 32) (currentByte!6709 bs2!18)) ((_ sign_extend 32) (currentBit!6704 bs2!18))))))

(declare-fun lt!241662 () (_ BitVec 64))

(declare-fun lt!241657 () (_ BitVec 64))

(assert (=> d!51210 (= lt!241660 (bvmul lt!241662 lt!241657))))

(assert (=> d!51210 (or (= lt!241662 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241657 (bvsdiv (bvmul lt!241662 lt!241657) lt!241662)))))

(assert (=> d!51210 (= lt!241657 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51210 (= lt!241662 ((_ sign_extend 32) (size!3167 (buf!3670 bs2!18))))))

(assert (=> d!51210 (= lt!241658 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6709 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6704 bs2!18))))))

(assert (=> d!51210 (invariant!0 (currentBit!6704 bs2!18) (currentByte!6709 bs2!18) (size!3167 (buf!3670 bs2!18)))))

(assert (=> d!51210 (= (bitIndex!0 (size!3167 (buf!3670 bs2!18)) (currentByte!6709 bs2!18) (currentBit!6704 bs2!18)) lt!241658)))

(declare-fun b!155276 () Bool)

(declare-fun res!129880 () Bool)

(assert (=> b!155276 (=> (not res!129880) (not e!104550))))

(assert (=> b!155276 (= res!129880 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241658))))

(declare-fun b!155277 () Bool)

(declare-fun lt!241661 () (_ BitVec 64))

(assert (=> b!155277 (= e!104550 (bvsle lt!241658 (bvmul lt!241661 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155277 (or (= lt!241661 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241661 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241661)))))

(assert (=> b!155277 (= lt!241661 ((_ sign_extend 32) (size!3167 (buf!3670 bs2!18))))))

(assert (= (and d!51210 res!129881) b!155276))

(assert (= (and b!155276 res!129880) b!155277))

(declare-fun m!241251 () Bool)

(assert (=> d!51210 m!241251))

(declare-fun m!241253 () Bool)

(assert (=> d!51210 m!241253))

(assert (=> b!155212 d!51210))

(declare-fun d!51212 () Bool)

(assert (=> d!51212 (= (inv!12 bs1!10) (invariant!0 (currentBit!6704 bs1!10) (currentByte!6709 bs1!10) (size!3167 (buf!3670 bs1!10))))))

(declare-fun bs!12534 () Bool)

(assert (= bs!12534 d!51212))

(assert (=> bs!12534 m!241217))

(assert (=> start!30294 d!51212))

(declare-fun d!51214 () Bool)

(assert (=> d!51214 (= (inv!12 bs2!18) (invariant!0 (currentBit!6704 bs2!18) (currentByte!6709 bs2!18) (size!3167 (buf!3670 bs2!18))))))

(declare-fun bs!12535 () Bool)

(assert (= bs!12535 d!51214))

(assert (=> bs!12535 m!241253))

(assert (=> start!30294 d!51214))

(check-sat (not b!155271) (not d!51194) (not b!155269) (not d!51212) (not d!51210) (not b!155248) (not d!51208) (not b!155274) (not d!51214) (not bm!2240) (not d!51206))
(check-sat)
(get-model)

(declare-fun d!51252 () Bool)

(declare-fun lt!241757 () (_ BitVec 8))

(declare-fun lt!241754 () (_ BitVec 8))

(assert (=> d!51252 (= lt!241757 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3990 (buf!3670 bs1!10)) (currentByte!6709 bs1!10))) ((_ sign_extend 24) lt!241754))))))

(assert (=> d!51252 (= lt!241754 ((_ extract 7 0) (currentBit!6704 bs1!10)))))

(declare-fun e!104605 () Bool)

(assert (=> d!51252 e!104605))

(declare-fun res!129939 () Bool)

(assert (=> d!51252 (=> (not res!129939) (not e!104605))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51252 (= res!129939 (validate_offset_bits!1 ((_ sign_extend 32) (size!3167 (buf!3670 bs1!10))) ((_ sign_extend 32) (currentByte!6709 bs1!10)) ((_ sign_extend 32) (currentBit!6704 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!9761 0))(
  ( (Unit!9762) )
))
(declare-datatypes ((tuple2!13758 0))(
  ( (tuple2!13759 (_1!7296 Unit!9761) (_2!7296 (_ BitVec 8))) )
))
(declare-fun Unit!9763 () Unit!9761)

(declare-fun Unit!9764 () Unit!9761)

(assert (=> d!51252 (= (readByte!0 bs1!10) (tuple2!13753 (_2!7296 (ite (bvsgt ((_ sign_extend 24) lt!241754) #b00000000000000000000000000000000) (tuple2!13759 Unit!9763 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241757) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3990 (buf!3670 bs1!10)) (bvadd (currentByte!6709 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241754)))))))) (tuple2!13759 Unit!9764 lt!241757))) (BitStream!5593 (buf!3670 bs1!10) (bvadd (currentByte!6709 bs1!10) #b00000000000000000000000000000001) (currentBit!6704 bs1!10))))))

(declare-fun b!155346 () Bool)

(declare-fun e!104606 () Bool)

(assert (=> b!155346 (= e!104605 e!104606)))

(declare-fun res!129940 () Bool)

(assert (=> b!155346 (=> (not res!129940) (not e!104606))))

(declare-fun lt!241751 () tuple2!13752)

(assert (=> b!155346 (= res!129940 (= (buf!3670 (_2!7291 lt!241751)) (buf!3670 bs1!10)))))

(declare-fun lt!241755 () (_ BitVec 8))

(declare-fun lt!241753 () (_ BitVec 8))

(declare-fun Unit!9765 () Unit!9761)

(declare-fun Unit!9766 () Unit!9761)

(assert (=> b!155346 (= lt!241751 (tuple2!13753 (_2!7296 (ite (bvsgt ((_ sign_extend 24) lt!241753) #b00000000000000000000000000000000) (tuple2!13759 Unit!9765 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241755) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3990 (buf!3670 bs1!10)) (bvadd (currentByte!6709 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241753)))))))) (tuple2!13759 Unit!9766 lt!241755))) (BitStream!5593 (buf!3670 bs1!10) (bvadd (currentByte!6709 bs1!10) #b00000000000000000000000000000001) (currentBit!6704 bs1!10))))))

(assert (=> b!155346 (= lt!241755 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3990 (buf!3670 bs1!10)) (currentByte!6709 bs1!10))) ((_ sign_extend 24) lt!241753))))))

(assert (=> b!155346 (= lt!241753 ((_ extract 7 0) (currentBit!6704 bs1!10)))))

(declare-fun b!155347 () Bool)

(declare-fun lt!241756 () (_ BitVec 64))

(declare-fun lt!241752 () (_ BitVec 64))

(assert (=> b!155347 (= e!104606 (= (bitIndex!0 (size!3167 (buf!3670 (_2!7291 lt!241751))) (currentByte!6709 (_2!7291 lt!241751)) (currentBit!6704 (_2!7291 lt!241751))) (bvadd lt!241752 lt!241756)))))

(assert (=> b!155347 (or (not (= (bvand lt!241752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241756 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!241752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!241752 lt!241756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155347 (= lt!241756 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155347 (= lt!241752 (bitIndex!0 (size!3167 (buf!3670 bs1!10)) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))))

(assert (= (and d!51252 res!129939) b!155346))

(assert (= (and b!155346 res!129940) b!155347))

(declare-fun m!241317 () Bool)

(assert (=> d!51252 m!241317))

(declare-fun m!241319 () Bool)

(assert (=> d!51252 m!241319))

(declare-fun m!241321 () Bool)

(assert (=> d!51252 m!241321))

(assert (=> b!155346 m!241321))

(assert (=> b!155346 m!241317))

(declare-fun m!241323 () Bool)

(assert (=> b!155347 m!241323))

(assert (=> b!155347 m!241181))

(assert (=> d!51208 d!51252))

(declare-fun lt!241764 () (_ BitVec 8))

(declare-fun lt!241761 () (_ BitVec 8))

(declare-fun d!51254 () Bool)

(assert (=> d!51254 (= lt!241764 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3990 (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))) (currentByte!6709 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))))) ((_ sign_extend 24) lt!241761))))))

(assert (=> d!51254 (= lt!241761 ((_ extract 7 0) (currentBit!6704 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))))))

(declare-fun e!104607 () Bool)

(assert (=> d!51254 e!104607))

(declare-fun res!129941 () Bool)

(assert (=> d!51254 (=> (not res!129941) (not e!104607))))

(assert (=> d!51254 (= res!129941 (validate_offset_bits!1 ((_ sign_extend 32) (size!3167 (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))))) ((_ sign_extend 32) (currentByte!6709 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))) ((_ sign_extend 32) (currentBit!6704 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9767 () Unit!9761)

(declare-fun Unit!9768 () Unit!9761)

(assert (=> d!51254 (= (readByte!0 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) (tuple2!13753 (_2!7296 (ite (bvsgt ((_ sign_extend 24) lt!241761) #b00000000000000000000000000000000) (tuple2!13759 Unit!9767 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241764) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3990 (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))) (bvadd (currentByte!6709 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241761)))))))) (tuple2!13759 Unit!9768 lt!241764))) (BitStream!5593 (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) (bvadd (currentByte!6709 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) #b00000000000000000000000000000001) (currentBit!6704 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))))))))

(declare-fun b!155348 () Bool)

(declare-fun e!104608 () Bool)

(assert (=> b!155348 (= e!104607 e!104608)))

(declare-fun res!129942 () Bool)

(assert (=> b!155348 (=> (not res!129942) (not e!104608))))

(declare-fun lt!241758 () tuple2!13752)

(assert (=> b!155348 (= res!129942 (= (buf!3670 (_2!7291 lt!241758)) (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))))))

(declare-fun lt!241760 () (_ BitVec 8))

(declare-fun lt!241762 () (_ BitVec 8))

(declare-fun Unit!9769 () Unit!9761)

(declare-fun Unit!9770 () Unit!9761)

(assert (=> b!155348 (= lt!241758 (tuple2!13753 (_2!7296 (ite (bvsgt ((_ sign_extend 24) lt!241760) #b00000000000000000000000000000000) (tuple2!13759 Unit!9769 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241762) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3990 (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))) (bvadd (currentByte!6709 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241760)))))))) (tuple2!13759 Unit!9770 lt!241762))) (BitStream!5593 (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) (bvadd (currentByte!6709 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) #b00000000000000000000000000000001) (currentBit!6704 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))))))))

(assert (=> b!155348 (= lt!241762 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3990 (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))) (currentByte!6709 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))))) ((_ sign_extend 24) lt!241760))))))

(assert (=> b!155348 (= lt!241760 ((_ extract 7 0) (currentBit!6704 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))))))

(declare-fun lt!241763 () (_ BitVec 64))

(declare-fun b!155349 () Bool)

(declare-fun lt!241759 () (_ BitVec 64))

(assert (=> b!155349 (= e!104608 (= (bitIndex!0 (size!3167 (buf!3670 (_2!7291 lt!241758))) (currentByte!6709 (_2!7291 lt!241758)) (currentBit!6704 (_2!7291 lt!241758))) (bvadd lt!241759 lt!241763)))))

(assert (=> b!155349 (or (not (= (bvand lt!241759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241763 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!241759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!241759 lt!241763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155349 (= lt!241763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155349 (= lt!241759 (bitIndex!0 (size!3167 (buf!3670 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))) (currentByte!6709 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10))) (currentBit!6704 (BitStream!5593 (buf!3670 bs2!18) (currentByte!6709 bs1!10) (currentBit!6704 bs1!10)))))))

(assert (= (and d!51254 res!129941) b!155348))

(assert (= (and b!155348 res!129942) b!155349))

(declare-fun m!241325 () Bool)

(assert (=> d!51254 m!241325))

(declare-fun m!241327 () Bool)

(assert (=> d!51254 m!241327))

(declare-fun m!241329 () Bool)

(assert (=> d!51254 m!241329))

(assert (=> b!155348 m!241329))

(assert (=> b!155348 m!241325))

(declare-fun m!241331 () Bool)

(assert (=> b!155349 m!241331))

(declare-fun m!241333 () Bool)

(assert (=> b!155349 m!241333))

(assert (=> d!51206 d!51254))

(declare-fun d!51256 () Bool)

(assert (=> d!51256 (= (remainingBits!0 ((_ sign_extend 32) (size!3167 (buf!3670 bs1!10))) ((_ sign_extend 32) (currentByte!6709 bs1!10)) ((_ sign_extend 32) (currentBit!6704 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3167 (buf!3670 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6709 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6704 bs1!10)))))))

(assert (=> d!51194 d!51256))

(declare-fun d!51258 () Bool)

(assert (=> d!51258 (= (invariant!0 (currentBit!6704 bs1!10) (currentByte!6709 bs1!10) (size!3167 (buf!3670 bs1!10))) (and (bvsge (currentBit!6704 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6704 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6709 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6709 bs1!10) (size!3167 (buf!3670 bs1!10))) (and (= (currentBit!6704 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6709 bs1!10) (size!3167 (buf!3670 bs1!10)))))))))

(assert (=> d!51194 d!51258))

(declare-fun d!51260 () Bool)

(assert (=> d!51260 (= (byteRangesEq!0 (select (arr!3990 (buf!3670 bs1!10)) (_3!414 lt!241650)) (select (arr!3990 (buf!3670 bs2!18)) (_3!414 lt!241650)) lt!241652 #b00000000000000000000000000001000) (or (= lt!241652 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3990 (buf!3670 bs1!10)) (_3!414 lt!241650))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241652)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3990 (buf!3670 bs2!18)) (_3!414 lt!241650))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241652)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12544 () Bool)

(assert (= bs!12544 d!51260))

(declare-fun m!241335 () Bool)

(assert (=> bs!12544 m!241335))

(declare-fun m!241337 () Bool)

(assert (=> bs!12544 m!241337))

(assert (=> b!155271 d!51260))

(declare-fun d!51262 () Bool)

(declare-fun res!129943 () Bool)

(declare-fun e!104609 () Bool)

(assert (=> d!51262 (=> res!129943 e!104609)))

(assert (=> d!51262 (= res!129943 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241606))))

(assert (=> d!51262 (= (arrayRangesEq!405 (buf!3670 bs1!10) (buf!3670 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241606) e!104609)))

(declare-fun b!155350 () Bool)

(declare-fun e!104610 () Bool)

(assert (=> b!155350 (= e!104609 e!104610)))

(declare-fun res!129944 () Bool)

(assert (=> b!155350 (=> (not res!129944) (not e!104610))))

(assert (=> b!155350 (= res!129944 (= (select (arr!3990 (buf!3670 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3990 (buf!3670 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!155351 () Bool)

(assert (=> b!155351 (= e!104610 (arrayRangesEq!405 (buf!3670 bs1!10) (buf!3670 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!241606))))

(assert (= (and d!51262 (not res!129943)) b!155350))

(assert (= (and b!155350 res!129944) b!155351))

(declare-fun m!241339 () Bool)

(assert (=> b!155350 m!241339))

(declare-fun m!241341 () Bool)

(assert (=> b!155350 m!241341))

(declare-fun m!241343 () Bool)

(assert (=> b!155351 m!241343))

(assert (=> b!155248 d!51262))

(declare-fun d!51264 () Bool)

(assert (=> d!51264 (= (byteRangesEq!0 (ite c!8259 (select (arr!3990 (buf!3670 bs1!10)) (_3!414 lt!241650)) (select (arr!3990 (buf!3670 bs1!10)) (_4!111 lt!241650))) (ite c!8259 (select (arr!3990 (buf!3670 bs2!18)) (_3!414 lt!241650)) (select (arr!3990 (buf!3670 bs2!18)) (_4!111 lt!241650))) (ite c!8259 lt!241652 #b00000000000000000000000000000000) lt!241651) (or (= (ite c!8259 lt!241652 #b00000000000000000000000000000000) lt!241651) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8259 (select (arr!3990 (buf!3670 bs1!10)) (_3!414 lt!241650)) (select (arr!3990 (buf!3670 bs1!10)) (_4!111 lt!241650)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241651))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8259 lt!241652 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8259 (select (arr!3990 (buf!3670 bs2!18)) (_3!414 lt!241650)) (select (arr!3990 (buf!3670 bs2!18)) (_4!111 lt!241650)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241651))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8259 lt!241652 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!12545 () Bool)

(assert (= bs!12545 d!51264))

(declare-fun m!241345 () Bool)

(assert (=> bs!12545 m!241345))

(declare-fun m!241347 () Bool)

(assert (=> bs!12545 m!241347))

(assert (=> bm!2240 d!51264))

(assert (=> d!51212 d!51258))

(declare-fun d!51266 () Bool)

(assert (=> d!51266 (= (invariant!0 (currentBit!6704 bs2!18) (currentByte!6709 bs2!18) (size!3167 (buf!3670 bs2!18))) (and (bvsge (currentBit!6704 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6704 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6709 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6709 bs2!18) (size!3167 (buf!3670 bs2!18))) (and (= (currentBit!6704 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6709 bs2!18) (size!3167 (buf!3670 bs2!18)))))))))

(assert (=> d!51214 d!51266))

(declare-fun d!51268 () Bool)

(assert (=> d!51268 (= (remainingBits!0 ((_ sign_extend 32) (size!3167 (buf!3670 bs2!18))) ((_ sign_extend 32) (currentByte!6709 bs2!18)) ((_ sign_extend 32) (currentBit!6704 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3167 (buf!3670 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6709 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6704 bs2!18)))))))

(assert (=> d!51210 d!51268))

(assert (=> d!51210 d!51266))

(declare-fun d!51270 () Bool)

(declare-fun res!129945 () Bool)

(declare-fun e!104611 () Bool)

(assert (=> d!51270 (=> res!129945 e!104611)))

(assert (=> d!51270 (= res!129945 (= (_1!7290 lt!241650) (_2!7290 lt!241650)))))

(assert (=> d!51270 (= (arrayRangesEq!405 (buf!3670 bs1!10) (buf!3670 bs2!18) (_1!7290 lt!241650) (_2!7290 lt!241650)) e!104611)))

(declare-fun b!155352 () Bool)

(declare-fun e!104612 () Bool)

(assert (=> b!155352 (= e!104611 e!104612)))

(declare-fun res!129946 () Bool)

(assert (=> b!155352 (=> (not res!129946) (not e!104612))))

(assert (=> b!155352 (= res!129946 (= (select (arr!3990 (buf!3670 bs1!10)) (_1!7290 lt!241650)) (select (arr!3990 (buf!3670 bs2!18)) (_1!7290 lt!241650))))))

(declare-fun b!155353 () Bool)

(assert (=> b!155353 (= e!104612 (arrayRangesEq!405 (buf!3670 bs1!10) (buf!3670 bs2!18) (bvadd (_1!7290 lt!241650) #b00000000000000000000000000000001) (_2!7290 lt!241650)))))

(assert (= (and d!51270 (not res!129945)) b!155352))

(assert (= (and b!155352 res!129946) b!155353))

(declare-fun m!241349 () Bool)

(assert (=> b!155352 m!241349))

(declare-fun m!241351 () Bool)

(assert (=> b!155352 m!241351))

(declare-fun m!241353 () Bool)

(assert (=> b!155353 m!241353))

(assert (=> b!155269 d!51270))

(declare-fun d!51272 () Bool)

(assert (=> d!51272 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241607) (tuple4!223 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!241607 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!241607 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!155274 d!51272))

(check-sat (not d!51252) (not b!155351) (not d!51254) (not b!155353) (not b!155347) (not b!155349))
(check-sat)
