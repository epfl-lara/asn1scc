; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58636 () Bool)

(assert start!58636)

(declare-fun b!269200 () Bool)

(declare-fun e!189179 () Bool)

(declare-datatypes ((array!15012 0))(
  ( (array!15013 (arr!7530 (Array (_ BitVec 32) (_ BitVec 8))) (size!6543 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11900 0))(
  ( (BitStream!11901 (buf!7011 array!15012) (currentByte!12947 (_ BitVec 32)) (currentBit!12942 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11900)

(declare-fun array_inv!6267 (array!15012) Bool)

(assert (=> b!269200 (= e!189179 (array_inv!6267 (buf!7011 w3!25)))))

(declare-fun b!269201 () Bool)

(declare-fun e!189183 () Bool)

(declare-fun w2!587 () BitStream!11900)

(assert (=> b!269201 (= e!189183 (array_inv!6267 (buf!7011 w2!587)))))

(declare-fun res!224416 () Bool)

(declare-fun e!189181 () Bool)

(assert (=> start!58636 (=> (not res!224416) (not e!189181))))

(declare-fun w1!591 () BitStream!11900)

(declare-fun isPrefixOf!0 (BitStream!11900 BitStream!11900) Bool)

(assert (=> start!58636 (= res!224416 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58636 e!189181))

(declare-fun e!189180 () Bool)

(declare-fun inv!12 (BitStream!11900) Bool)

(assert (=> start!58636 (and (inv!12 w1!591) e!189180)))

(assert (=> start!58636 (and (inv!12 w2!587) e!189183)))

(assert (=> start!58636 (and (inv!12 w3!25) e!189179)))

(declare-fun b!269202 () Bool)

(assert (=> b!269202 (= e!189180 (array_inv!6267 (buf!7011 w1!591)))))

(declare-fun b!269203 () Bool)

(assert (=> b!269203 (= e!189181 (and (bvsle #b00000000000000000000000000000000 (currentByte!12947 w1!591)) (bvsle (currentByte!12947 w1!591) (currentByte!12947 w2!587)) (bvsle (size!6543 (buf!7011 w1!591)) (size!6543 (buf!7011 w2!587))) (bvsle (size!6543 (buf!7011 w2!587)) (size!6543 (buf!7011 w3!25))) (or (bvsgt (currentByte!12947 w1!591) (size!6543 (buf!7011 w1!591))) (bvsgt (currentByte!12947 w2!587) (size!6543 (buf!7011 w2!587))))))))

(declare-fun b!269204 () Bool)

(declare-fun res!224415 () Bool)

(assert (=> b!269204 (=> (not res!224415) (not e!189181))))

(assert (=> b!269204 (= res!224415 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!58636 res!224416) b!269204))

(assert (= (and b!269204 res!224415) b!269203))

(assert (= start!58636 b!269202))

(assert (= start!58636 b!269201))

(assert (= start!58636 b!269200))

(declare-fun m!400759 () Bool)

(assert (=> b!269204 m!400759))

(declare-fun m!400761 () Bool)

(assert (=> b!269201 m!400761))

(declare-fun m!400763 () Bool)

(assert (=> start!58636 m!400763))

(declare-fun m!400765 () Bool)

(assert (=> start!58636 m!400765))

(declare-fun m!400767 () Bool)

(assert (=> start!58636 m!400767))

(declare-fun m!400769 () Bool)

(assert (=> start!58636 m!400769))

(declare-fun m!400771 () Bool)

(assert (=> b!269202 m!400771))

(declare-fun m!400773 () Bool)

(assert (=> b!269200 m!400773))

(push 1)

(assert (not start!58636))

(assert (not b!269204))

(assert (not b!269201))

(assert (not b!269200))

(assert (not b!269202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91102 () Bool)

(assert (=> d!91102 (= (array_inv!6267 (buf!7011 w2!587)) (bvsge (size!6543 (buf!7011 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269201 d!91102))

(declare-fun d!91104 () Bool)

(assert (=> d!91104 (= (array_inv!6267 (buf!7011 w3!25)) (bvsge (size!6543 (buf!7011 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269200 d!91104))

(declare-fun d!91106 () Bool)

(assert (=> d!91106 (= (array_inv!6267 (buf!7011 w1!591)) (bvsge (size!6543 (buf!7011 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269202 d!91106))

(declare-fun d!91108 () Bool)

(declare-fun res!224441 () Bool)

(declare-fun e!189201 () Bool)

(assert (=> d!91108 (=> (not res!224441) (not e!189201))))

(assert (=> d!91108 (= res!224441 (= (size!6543 (buf!7011 w1!591)) (size!6543 (buf!7011 w2!587))))))

(assert (=> d!91108 (= (isPrefixOf!0 w1!591 w2!587) e!189201)))

(declare-fun b!269229 () Bool)

(declare-fun res!224442 () Bool)

(assert (=> b!269229 (=> (not res!224442) (not e!189201))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269229 (= res!224442 (bvsle (bitIndex!0 (size!6543 (buf!7011 w1!591)) (currentByte!12947 w1!591) (currentBit!12942 w1!591)) (bitIndex!0 (size!6543 (buf!7011 w2!587)) (currentByte!12947 w2!587) (currentBit!12942 w2!587))))))

(declare-fun b!269230 () Bool)

(declare-fun e!189200 () Bool)

(assert (=> b!269230 (= e!189201 e!189200)))

(declare-fun res!224443 () Bool)

(assert (=> b!269230 (=> res!224443 e!189200)))

(assert (=> b!269230 (= res!224443 (= (size!6543 (buf!7011 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269231 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15012 array!15012 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269231 (= e!189200 (arrayBitRangesEq!0 (buf!7011 w1!591) (buf!7011 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6543 (buf!7011 w1!591)) (currentByte!12947 w1!591) (currentBit!12942 w1!591))))))

(assert (= (and d!91108 res!224441) b!269229))

(assert (= (and b!269229 res!224442) b!269230))

(assert (= (and b!269230 (not res!224443)) b!269231))

(declare-fun m!400781 () Bool)

(assert (=> b!269229 m!400781))

(declare-fun m!400783 () Bool)

(assert (=> b!269229 m!400783))

(assert (=> b!269231 m!400781))

(assert (=> b!269231 m!400781))

(declare-fun m!400785 () Bool)

(assert (=> b!269231 m!400785))

(assert (=> start!58636 d!91108))

(declare-fun d!91112 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91112 (= (inv!12 w1!591) (invariant!0 (currentBit!12942 w1!591) (currentByte!12947 w1!591) (size!6543 (buf!7011 w1!591))))))

(declare-fun bs!23097 () Bool)

(assert (= bs!23097 d!91112))

(declare-fun m!400801 () Bool)

(assert (=> bs!23097 m!400801))

(assert (=> start!58636 d!91112))

(declare-fun d!91126 () Bool)

(assert (=> d!91126 (= (inv!12 w2!587) (invariant!0 (currentBit!12942 w2!587) (currentByte!12947 w2!587) (size!6543 (buf!7011 w2!587))))))

(declare-fun bs!23098 () Bool)

(assert (= bs!23098 d!91126))

(declare-fun m!400807 () Bool)

(assert (=> bs!23098 m!400807))

(assert (=> start!58636 d!91126))

(declare-fun d!91130 () Bool)

(assert (=> d!91130 (= (inv!12 w3!25) (invariant!0 (currentBit!12942 w3!25) (currentByte!12947 w3!25) (size!6543 (buf!7011 w3!25))))))

(declare-fun bs!23099 () Bool)

(assert (= bs!23099 d!91130))

(declare-fun m!400811 () Bool)

(assert (=> bs!23099 m!400811))

(assert (=> start!58636 d!91130))

(declare-fun d!91132 () Bool)

(declare-fun res!224450 () Bool)

(declare-fun e!189207 () Bool)

(assert (=> d!91132 (=> (not res!224450) (not e!189207))))

(assert (=> d!91132 (= res!224450 (= (size!6543 (buf!7011 w2!587)) (size!6543 (buf!7011 w3!25))))))

(assert (=> d!91132 (= (isPrefixOf!0 w2!587 w3!25) e!189207)))

(declare-fun b!269238 () Bool)

(declare-fun res!224451 () Bool)

(assert (=> b!269238 (=> (not res!224451) (not e!189207))))

(assert (=> b!269238 (= res!224451 (bvsle (bitIndex!0 (size!6543 (buf!7011 w2!587)) (currentByte!12947 w2!587) (currentBit!12942 w2!587)) (bitIndex!0 (size!6543 (buf!7011 w3!25)) (currentByte!12947 w3!25) (currentBit!12942 w3!25))))))

(declare-fun b!269239 () Bool)

(declare-fun e!189206 () Bool)

(assert (=> b!269239 (= e!189207 e!189206)))

(declare-fun res!224452 () Bool)

(assert (=> b!269239 (=> res!224452 e!189206)))

(assert (=> b!269239 (= res!224452 (= (size!6543 (buf!7011 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269240 () Bool)

(assert (=> b!269240 (= e!189206 (arrayBitRangesEq!0 (buf!7011 w2!587) (buf!7011 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6543 (buf!7011 w2!587)) (currentByte!12947 w2!587) (currentBit!12942 w2!587))))))

(assert (= (and d!91132 res!224450) b!269238))

(assert (= (and b!269238 res!224451) b!269239))

(assert (= (and b!269239 (not res!224452)) b!269240))

(assert (=> b!269238 m!400783))

(declare-fun m!400813 () Bool)

(assert (=> b!269238 m!400813))

(assert (=> b!269240 m!400783))

(assert (=> b!269240 m!400783))

(declare-fun m!400815 () Bool)

(assert (=> b!269240 m!400815))

(assert (=> b!269204 d!91132))

(push 1)

(assert (not d!91126))

(assert (not b!269238))

(assert (not b!269240))

(assert (not d!91130))

(assert (not b!269229))

(assert (not d!91112))

(assert (not b!269231))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!269303 () Bool)

(declare-fun e!189264 () Bool)

(declare-datatypes ((tuple4!436 0))(
  ( (tuple4!437 (_1!12201 (_ BitVec 32)) (_2!12201 (_ BitVec 32)) (_3!998 (_ BitVec 32)) (_4!218 (_ BitVec 32))) )
))
(declare-fun lt!408901 () tuple4!436)

(declare-fun arrayRangesEq!1075 (array!15012 array!15012 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269303 (= e!189264 (arrayRangesEq!1075 (buf!7011 w2!587) (buf!7011 w3!25) (_1!12201 lt!408901) (_2!12201 lt!408901)))))

(declare-fun b!269304 () Bool)

(declare-fun e!189261 () Bool)

(declare-fun call!4280 () Bool)

(assert (=> b!269304 (= e!189261 call!4280)))

(declare-fun b!269306 () Bool)

(declare-fun e!189260 () Bool)

(declare-fun e!189262 () Bool)

(assert (=> b!269306 (= e!189260 e!189262)))

(declare-fun res!224500 () Bool)

(assert (=> b!269306 (=> (not res!224500) (not e!189262))))

(assert (=> b!269306 (= res!224500 e!189264)))

(declare-fun res!224499 () Bool)

(assert (=> b!269306 (=> res!224499 e!189264)))

(assert (=> b!269306 (= res!224499 (bvsge (_1!12201 lt!408901) (_2!12201 lt!408901)))))

(declare-fun lt!408902 () (_ BitVec 32))

(assert (=> b!269306 (= lt!408902 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6543 (buf!7011 w2!587)) (currentByte!12947 w2!587) (currentBit!12942 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408900 () (_ BitVec 32))

(assert (=> b!269306 (= lt!408900 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!436)

(assert (=> b!269306 (= lt!408901 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6543 (buf!7011 w2!587)) (currentByte!12947 w2!587) (currentBit!12942 w2!587))))))

(declare-fun b!269307 () Bool)

(declare-fun e!189259 () Bool)

(assert (=> b!269307 (= e!189261 e!189259)))

(declare-fun res!224501 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269307 (= res!224501 (byteRangesEq!0 (select (arr!7530 (buf!7011 w2!587)) (_3!998 lt!408901)) (select (arr!7530 (buf!7011 w3!25)) (_3!998 lt!408901)) lt!408900 #b00000000000000000000000000001000))))

(assert (=> b!269307 (=> (not res!224501) (not e!189259))))

(declare-fun c!12429 () Bool)

(declare-fun bm!4277 () Bool)

(assert (=> bm!4277 (= call!4280 (byteRangesEq!0 (ite c!12429 (select (arr!7530 (buf!7011 w2!587)) (_3!998 lt!408901)) (select (arr!7530 (buf!7011 w2!587)) (_4!218 lt!408901))) (ite c!12429 (select (arr!7530 (buf!7011 w3!25)) (_3!998 lt!408901)) (select (arr!7530 (buf!7011 w3!25)) (_4!218 lt!408901))) (ite c!12429 lt!408900 #b00000000000000000000000000000000) lt!408902))))

(declare-fun b!269308 () Bool)

(declare-fun res!224503 () Bool)

(assert (=> b!269308 (= res!224503 (= lt!408902 #b00000000000000000000000000000000))))

(declare-fun e!189263 () Bool)

(assert (=> b!269308 (=> res!224503 e!189263)))

(assert (=> b!269308 (= e!189259 e!189263)))

(declare-fun b!269309 () Bool)

(assert (=> b!269309 (= e!189263 call!4280)))

(declare-fun d!91144 () Bool)

(declare-fun res!224502 () Bool)

(assert (=> d!91144 (=> res!224502 e!189260)))

(assert (=> d!91144 (= res!224502 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6543 (buf!7011 w2!587)) (currentByte!12947 w2!587) (currentBit!12942 w2!587))))))

(assert (=> d!91144 (= (arrayBitRangesEq!0 (buf!7011 w2!587) (buf!7011 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6543 (buf!7011 w2!587)) (currentByte!12947 w2!587) (currentBit!12942 w2!587))) e!189260)))

(declare-fun b!269305 () Bool)

(assert (=> b!269305 (= e!189262 e!189261)))

(assert (=> b!269305 (= c!12429 (= (_3!998 lt!408901) (_4!218 lt!408901)))))

(assert (= (and d!91144 (not res!224502)) b!269306))

(assert (= (and b!269306 (not res!224499)) b!269303))

(assert (= (and b!269306 res!224500) b!269305))

(assert (= (and b!269305 c!12429) b!269304))

(assert (= (and b!269305 (not c!12429)) b!269307))

(assert (= (and b!269307 res!224501) b!269308))

(assert (= (and b!269308 (not res!224503)) b!269309))

(assert (= (or b!269304 b!269309) bm!4277))

(declare-fun m!400857 () Bool)

(assert (=> b!269303 m!400857))

(assert (=> b!269306 m!400783))

(declare-fun m!400859 () Bool)

(assert (=> b!269306 m!400859))

(declare-fun m!400861 () Bool)

(assert (=> b!269307 m!400861))

(declare-fun m!400863 () Bool)

(assert (=> b!269307 m!400863))

(assert (=> b!269307 m!400861))

(assert (=> b!269307 m!400863))

(declare-fun m!400865 () Bool)

(assert (=> b!269307 m!400865))

(assert (=> bm!4277 m!400861))

(declare-fun m!400867 () Bool)

(assert (=> bm!4277 m!400867))

(declare-fun m!400871 () Bool)

(assert (=> bm!4277 m!400871))

(assert (=> bm!4277 m!400863))

(declare-fun m!400873 () Bool)

(assert (=> bm!4277 m!400873))

(assert (=> b!269240 d!91144))

(declare-fun d!91156 () Bool)

(declare-fun e!189286 () Bool)

(assert (=> d!91156 e!189286))

(declare-fun res!224532 () Bool)

(assert (=> d!91156 (=> (not res!224532) (not e!189286))))

(declare-fun lt!408966 () (_ BitVec 64))

(declare-fun lt!408968 () (_ BitVec 64))

(declare-fun lt!408965 () (_ BitVec 64))

(assert (=> d!91156 (= res!224532 (= lt!408966 (bvsub lt!408968 lt!408965)))))

(assert (=> d!91156 (or (= (bvand lt!408968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408968 lt!408965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91156 (= lt!408965 (remainingBits!0 ((_ sign_extend 32) (size!6543 (buf!7011 w2!587))) ((_ sign_extend 32) (currentByte!12947 w2!587)) ((_ sign_extend 32) (currentBit!12942 w2!587))))))

(declare-fun lt!408963 () (_ BitVec 64))

(declare-fun lt!408964 () (_ BitVec 64))

(assert (=> d!91156 (= lt!408968 (bvmul lt!408963 lt!408964))))

(assert (=> d!91156 (or (= lt!408963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408964 (bvsdiv (bvmul lt!408963 lt!408964) lt!408963)))))

(assert (=> d!91156 (= lt!408964 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91156 (= lt!408963 ((_ sign_extend 32) (size!6543 (buf!7011 w2!587))))))

(assert (=> d!91156 (= lt!408966 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12947 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12942 w2!587))))))

(assert (=> d!91156 (invariant!0 (currentBit!12942 w2!587) (currentByte!12947 w2!587) (size!6543 (buf!7011 w2!587)))))

(assert (=> d!91156 (= (bitIndex!0 (size!6543 (buf!7011 w2!587)) (currentByte!12947 w2!587) (currentBit!12942 w2!587)) lt!408966)))

(declare-fun b!269342 () Bool)

(declare-fun res!224533 () Bool)

(assert (=> b!269342 (=> (not res!224533) (not e!189286))))

(assert (=> b!269342 (= res!224533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408966))))

(declare-fun b!269343 () Bool)

(declare-fun lt!408967 () (_ BitVec 64))

(assert (=> b!269343 (= e!189286 (bvsle lt!408966 (bvmul lt!408967 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269343 (or (= lt!408967 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408967 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408967)))))

(assert (=> b!269343 (= lt!408967 ((_ sign_extend 32) (size!6543 (buf!7011 w2!587))))))

(assert (= (and d!91156 res!224532) b!269342))

(assert (= (and b!269342 res!224533) b!269343))

(declare-fun m!400915 () Bool)

(assert (=> d!91156 m!400915))

(assert (=> d!91156 m!400807))

(assert (=> b!269240 d!91156))

(declare-fun d!91174 () Bool)

(assert (=> d!91174 (= (invariant!0 (currentBit!12942 w3!25) (currentByte!12947 w3!25) (size!6543 (buf!7011 w3!25))) (and (bvsge (currentBit!12942 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12942 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12947 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12947 w3!25) (size!6543 (buf!7011 w3!25))) (and (= (currentBit!12942 w3!25) #b00000000000000000000000000000000) (= (currentByte!12947 w3!25) (size!6543 (buf!7011 w3!25)))))))))

(assert (=> d!91130 d!91174))

(declare-fun e!189292 () Bool)

(declare-fun b!269344 () Bool)

(declare-fun lt!408970 () tuple4!436)

(assert (=> b!269344 (= e!189292 (arrayRangesEq!1075 (buf!7011 w1!591) (buf!7011 w2!587) (_1!12201 lt!408970) (_2!12201 lt!408970)))))

(declare-fun b!269345 () Bool)

(declare-fun e!189289 () Bool)

(declare-fun call!4283 () Bool)

(assert (=> b!269345 (= e!189289 call!4283)))

(declare-fun b!269347 () Bool)

(declare-fun e!189288 () Bool)

(declare-fun e!189290 () Bool)

(assert (=> b!269347 (= e!189288 e!189290)))

(declare-fun res!224535 () Bool)

(assert (=> b!269347 (=> (not res!224535) (not e!189290))))

(assert (=> b!269347 (= res!224535 e!189292)))

(declare-fun res!224534 () Bool)

(assert (=> b!269347 (=> res!224534 e!189292)))

(assert (=> b!269347 (= res!224534 (bvsge (_1!12201 lt!408970) (_2!12201 lt!408970)))))

(declare-fun lt!408971 () (_ BitVec 32))

(assert (=> b!269347 (= lt!408971 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6543 (buf!7011 w1!591)) (currentByte!12947 w1!591) (currentBit!12942 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408969 () (_ BitVec 32))

(assert (=> b!269347 (= lt!408969 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269347 (= lt!408970 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6543 (buf!7011 w1!591)) (currentByte!12947 w1!591) (currentBit!12942 w1!591))))))

(declare-fun b!269348 () Bool)

(declare-fun e!189287 () Bool)

(assert (=> b!269348 (= e!189289 e!189287)))

(declare-fun res!224536 () Bool)

(assert (=> b!269348 (= res!224536 (byteRangesEq!0 (select (arr!7530 (buf!7011 w1!591)) (_3!998 lt!408970)) (select (arr!7530 (buf!7011 w2!587)) (_3!998 lt!408970)) lt!408969 #b00000000000000000000000000001000))))

(assert (=> b!269348 (=> (not res!224536) (not e!189287))))

(declare-fun bm!4280 () Bool)

(declare-fun c!12432 () Bool)

(assert (=> bm!4280 (= call!4283 (byteRangesEq!0 (ite c!12432 (select (arr!7530 (buf!7011 w1!591)) (_3!998 lt!408970)) (select (arr!7530 (buf!7011 w1!591)) (_4!218 lt!408970))) (ite c!12432 (select (arr!7530 (buf!7011 w2!587)) (_3!998 lt!408970)) (select (arr!7530 (buf!7011 w2!587)) (_4!218 lt!408970))) (ite c!12432 lt!408969 #b00000000000000000000000000000000) lt!408971))))

(declare-fun b!269349 () Bool)

(declare-fun res!224538 () Bool)

(assert (=> b!269349 (= res!224538 (= lt!408971 #b00000000000000000000000000000000))))

(declare-fun e!189291 () Bool)

(assert (=> b!269349 (=> res!224538 e!189291)))

(assert (=> b!269349 (= e!189287 e!189291)))

(declare-fun b!269350 () Bool)

(assert (=> b!269350 (= e!189291 call!4283)))

(declare-fun d!91176 () Bool)

(declare-fun res!224537 () Bool)

(assert (=> d!91176 (=> res!224537 e!189288)))

(assert (=> d!91176 (= res!224537 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6543 (buf!7011 w1!591)) (currentByte!12947 w1!591) (currentBit!12942 w1!591))))))

(assert (=> d!91176 (= (arrayBitRangesEq!0 (buf!7011 w1!591) (buf!7011 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6543 (buf!7011 w1!591)) (currentByte!12947 w1!591) (currentBit!12942 w1!591))) e!189288)))

(declare-fun b!269346 () Bool)

(assert (=> b!269346 (= e!189290 e!189289)))

(assert (=> b!269346 (= c!12432 (= (_3!998 lt!408970) (_4!218 lt!408970)))))

(assert (= (and d!91176 (not res!224537)) b!269347))

(assert (= (and b!269347 (not res!224534)) b!269344))

(assert (= (and b!269347 res!224535) b!269346))

(assert (= (and b!269346 c!12432) b!269345))

(assert (= (and b!269346 (not c!12432)) b!269348))

(assert (= (and b!269348 res!224536) b!269349))

(assert (= (and b!269349 (not res!224538)) b!269350))

(assert (= (or b!269345 b!269350) bm!4280))

(declare-fun m!400917 () Bool)

(assert (=> b!269344 m!400917))

(assert (=> b!269347 m!400781))

(declare-fun m!400919 () Bool)

(assert (=> b!269347 m!400919))

(declare-fun m!400921 () Bool)

(assert (=> b!269348 m!400921))

(declare-fun m!400923 () Bool)

(assert (=> b!269348 m!400923))

(assert (=> b!269348 m!400921))

(assert (=> b!269348 m!400923))

(declare-fun m!400925 () Bool)

(assert (=> b!269348 m!400925))

(assert (=> bm!4280 m!400921))

(declare-fun m!400927 () Bool)

(assert (=> bm!4280 m!400927))

(declare-fun m!400929 () Bool)

(assert (=> bm!4280 m!400929))

(assert (=> bm!4280 m!400923))

(declare-fun m!400931 () Bool)

(assert (=> bm!4280 m!400931))

(assert (=> b!269231 d!91176))

(declare-fun d!91178 () Bool)

(declare-fun e!189293 () Bool)

(assert (=> d!91178 e!189293))

(declare-fun res!224539 () Bool)

(assert (=> d!91178 (=> (not res!224539) (not e!189293))))

(declare-fun lt!408977 () (_ BitVec 64))

(declare-fun lt!408974 () (_ BitVec 64))

(declare-fun lt!408975 () (_ BitVec 64))

(assert (=> d!91178 (= res!224539 (= lt!408975 (bvsub lt!408977 lt!408974)))))

(assert (=> d!91178 (or (= (bvand lt!408977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408974 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408977 lt!408974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91178 (= lt!408974 (remainingBits!0 ((_ sign_extend 32) (size!6543 (buf!7011 w1!591))) ((_ sign_extend 32) (currentByte!12947 w1!591)) ((_ sign_extend 32) (currentBit!12942 w1!591))))))

(declare-fun lt!408972 () (_ BitVec 64))

(declare-fun lt!408973 () (_ BitVec 64))

(assert (=> d!91178 (= lt!408977 (bvmul lt!408972 lt!408973))))

(assert (=> d!91178 (or (= lt!408972 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408973 (bvsdiv (bvmul lt!408972 lt!408973) lt!408972)))))

(assert (=> d!91178 (= lt!408973 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91178 (= lt!408972 ((_ sign_extend 32) (size!6543 (buf!7011 w1!591))))))

(assert (=> d!91178 (= lt!408975 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12947 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12942 w1!591))))))

(assert (=> d!91178 (invariant!0 (currentBit!12942 w1!591) (currentByte!12947 w1!591) (size!6543 (buf!7011 w1!591)))))

(assert (=> d!91178 (= (bitIndex!0 (size!6543 (buf!7011 w1!591)) (currentByte!12947 w1!591) (currentBit!12942 w1!591)) lt!408975)))

(declare-fun b!269351 () Bool)

(declare-fun res!224540 () Bool)

(assert (=> b!269351 (=> (not res!224540) (not e!189293))))

(assert (=> b!269351 (= res!224540 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408975))))

(declare-fun b!269352 () Bool)

(declare-fun lt!408976 () (_ BitVec 64))

(assert (=> b!269352 (= e!189293 (bvsle lt!408975 (bvmul lt!408976 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269352 (or (= lt!408976 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408976 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408976)))))

(assert (=> b!269352 (= lt!408976 ((_ sign_extend 32) (size!6543 (buf!7011 w1!591))))))

(assert (= (and d!91178 res!224539) b!269351))

(assert (= (and b!269351 res!224540) b!269352))

(declare-fun m!400933 () Bool)

(assert (=> d!91178 m!400933))

(assert (=> d!91178 m!400801))

(assert (=> b!269231 d!91178))

(declare-fun d!91180 () Bool)

(assert (=> d!91180 (= (invariant!0 (currentBit!12942 w2!587) (currentByte!12947 w2!587) (size!6543 (buf!7011 w2!587))) (and (bvsge (currentBit!12942 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12942 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12947 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12947 w2!587) (size!6543 (buf!7011 w2!587))) (and (= (currentBit!12942 w2!587) #b00000000000000000000000000000000) (= (currentByte!12947 w2!587) (size!6543 (buf!7011 w2!587)))))))))

(assert (=> d!91126 d!91180))

(assert (=> b!269229 d!91178))

(assert (=> b!269229 d!91156))

(declare-fun d!91182 () Bool)

(assert (=> d!91182 (= (invariant!0 (currentBit!12942 w1!591) (currentByte!12947 w1!591) (size!6543 (buf!7011 w1!591))) (and (bvsge (currentBit!12942 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12942 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12947 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12947 w1!591) (size!6543 (buf!7011 w1!591))) (and (= (currentBit!12942 w1!591) #b00000000000000000000000000000000) (= (currentByte!12947 w1!591) (size!6543 (buf!7011 w1!591)))))))))

(assert (=> d!91112 d!91182))

(assert (=> b!269238 d!91156))

(declare-fun d!91184 () Bool)

(declare-fun e!189294 () Bool)

(assert (=> d!91184 e!189294))

(declare-fun res!224541 () Bool)

(assert (=> d!91184 (=> (not res!224541) (not e!189294))))

(declare-fun lt!408983 () (_ BitVec 64))

(declare-fun lt!408980 () (_ BitVec 64))

(declare-fun lt!408981 () (_ BitVec 64))

(assert (=> d!91184 (= res!224541 (= lt!408981 (bvsub lt!408983 lt!408980)))))

(assert (=> d!91184 (or (= (bvand lt!408983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408983 lt!408980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91184 (= lt!408980 (remainingBits!0 ((_ sign_extend 32) (size!6543 (buf!7011 w3!25))) ((_ sign_extend 32) (currentByte!12947 w3!25)) ((_ sign_extend 32) (currentBit!12942 w3!25))))))

(declare-fun lt!408978 () (_ BitVec 64))

(declare-fun lt!408979 () (_ BitVec 64))

(assert (=> d!91184 (= lt!408983 (bvmul lt!408978 lt!408979))))

(assert (=> d!91184 (or (= lt!408978 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408979 (bvsdiv (bvmul lt!408978 lt!408979) lt!408978)))))

(assert (=> d!91184 (= lt!408979 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91184 (= lt!408978 ((_ sign_extend 32) (size!6543 (buf!7011 w3!25))))))

(assert (=> d!91184 (= lt!408981 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12947 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12942 w3!25))))))

(assert (=> d!91184 (invariant!0 (currentBit!12942 w3!25) (currentByte!12947 w3!25) (size!6543 (buf!7011 w3!25)))))

(assert (=> d!91184 (= (bitIndex!0 (size!6543 (buf!7011 w3!25)) (currentByte!12947 w3!25) (currentBit!12942 w3!25)) lt!408981)))

(declare-fun b!269353 () Bool)

(declare-fun res!224542 () Bool)

(assert (=> b!269353 (=> (not res!224542) (not e!189294))))

(assert (=> b!269353 (= res!224542 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408981))))

(declare-fun b!269354 () Bool)

(declare-fun lt!408982 () (_ BitVec 64))

(assert (=> b!269354 (= e!189294 (bvsle lt!408981 (bvmul lt!408982 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269354 (or (= lt!408982 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408982 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408982)))))

(assert (=> b!269354 (= lt!408982 ((_ sign_extend 32) (size!6543 (buf!7011 w3!25))))))

(assert (= (and d!91184 res!224541) b!269353))

(assert (= (and b!269353 res!224542) b!269354))

(declare-fun m!400935 () Bool)

(assert (=> d!91184 m!400935))

(assert (=> d!91184 m!400811))

(assert (=> b!269238 d!91184))

(push 1)

(assert (not d!91156))

(assert (not b!269306))

(assert (not b!269347))

(assert (not b!269303))

(assert (not d!91184))

(assert (not b!269307))

(assert (not b!269344))

(assert (not b!269348))

(assert (not bm!4277))

(assert (not d!91178))

(assert (not bm!4280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

