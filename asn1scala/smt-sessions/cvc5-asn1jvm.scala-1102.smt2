; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31620 () Bool)

(assert start!31620)

(declare-fun b!158266 () Bool)

(declare-fun res!132215 () Bool)

(declare-fun e!107532 () Bool)

(assert (=> b!158266 (=> (not res!132215) (not e!107532))))

(declare-datatypes ((array!7362 0))(
  ( (array!7363 (arr!4248 (Array (_ BitVec 32) (_ BitVec 8))) (size!3339 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5854 0))(
  ( (BitStream!5855 (buf!3801 array!7362) (currentByte!6980 (_ BitVec 32)) (currentBit!6975 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5854)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158266 (= res!132215 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 bs!65))) ((_ sign_extend 32) (currentByte!6980 bs!65)) ((_ sign_extend 32) (currentBit!6975 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158267 () Bool)

(declare-fun res!132217 () Bool)

(declare-fun e!107530 () Bool)

(assert (=> b!158267 (=> res!132217 e!107530)))

(declare-fun lt!249450 () (_ BitVec 64))

(declare-fun lt!249452 () (_ BitVec 64))

(declare-fun lt!249445 () BitStream!5854)

(assert (=> b!158267 (= res!132217 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) lt!249452 lt!249450 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!158268 () Bool)

(declare-fun e!107535 () Bool)

(declare-fun array_inv!3090 (array!7362) Bool)

(assert (=> b!158268 (= e!107535 (array_inv!3090 (buf!3801 bs!65)))))

(declare-fun b!158269 () Bool)

(declare-fun e!107531 () Bool)

(assert (=> b!158269 (= e!107531 (not e!107530))))

(declare-fun res!132216 () Bool)

(assert (=> b!158269 (=> res!132216 e!107530)))

(assert (=> b!158269 (= res!132216 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!158269 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) lt!249452 lt!249450 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158269 (= lt!249450 ((_ sign_extend 32) (currentBit!6975 lt!249445)))))

(assert (=> b!158269 (= lt!249452 ((_ sign_extend 32) (currentByte!6980 lt!249445)))))

(declare-datatypes ((Unit!10580 0))(
  ( (Unit!10581) )
))
(declare-fun lt!249451 () Unit!10580)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5854 BitStream!5854 (_ BitVec 64) (_ BitVec 32)) Unit!10580)

(assert (=> b!158269 (= lt!249451 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249445 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14432 0))(
  ( (tuple2!14433 (_1!7678 BitStream!5854) (_2!7678 (_ BitVec 8))) )
))
(declare-fun lt!249446 () tuple2!14432)

(declare-fun readBytePure!0 (BitStream!5854) tuple2!14432)

(assert (=> b!158269 (= lt!249446 (readBytePure!0 lt!249445))))

(declare-datatypes ((tuple2!14434 0))(
  ( (tuple2!14435 (_1!7679 BitStream!5854) (_2!7679 array!7362)) )
))
(declare-fun lt!249449 () tuple2!14434)

(declare-fun b!158270 () Bool)

(declare-fun lt!249444 () tuple2!14434)

(declare-fun arrayRangesEq!445 (array!7362 array!7362 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158270 (= e!107530 (arrayRangesEq!445 (_2!7679 lt!249449) (_2!7679 lt!249444) #b00000000000000000000000000000000 to!236))))

(declare-fun lt!249448 () tuple2!14434)

(assert (=> b!158270 (arrayRangesEq!445 (_2!7679 lt!249444) (_2!7679 lt!249448) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!249447 () array!7362)

(declare-fun lt!249453 () Unit!10580)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5854 array!7362 (_ BitVec 32) (_ BitVec 32)) Unit!10580)

(assert (=> b!158270 (= lt!249453 (readByteArrayLoopArrayPrefixLemma!0 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun arr!153 () array!7362)

(declare-fun readByteArrayLoopPure!0 (BitStream!5854 array!7362 (_ BitVec 32) (_ BitVec 32)) tuple2!14434)

(declare-fun withMovedByteIndex!0 (BitStream!5854 (_ BitVec 32)) BitStream!5854)

(assert (=> b!158270 (= lt!249448 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001) (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!249443 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!158270 (= lt!249443 (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))))))

(declare-fun b!158271 () Bool)

(assert (=> b!158271 (= e!107532 e!107531)))

(declare-fun res!132214 () Bool)

(assert (=> b!158271 (=> (not res!132214) (not e!107531))))

(assert (=> b!158271 (= res!132214 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(assert (=> b!158271 (= lt!249444 (readByteArrayLoopPure!0 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!158271 (= lt!249447 (array!7363 (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (size!3339 arr!153)))))

(assert (=> b!158271 (= lt!249445 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(assert (=> b!158271 (= lt!249449 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!132218 () Bool)

(assert (=> start!31620 (=> (not res!132218) (not e!107532))))

(assert (=> start!31620 (= res!132218 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3339 arr!153))))))

(assert (=> start!31620 e!107532))

(assert (=> start!31620 true))

(assert (=> start!31620 (array_inv!3090 arr!153)))

(declare-fun inv!12 (BitStream!5854) Bool)

(assert (=> start!31620 (and (inv!12 bs!65) e!107535)))

(assert (= (and start!31620 res!132218) b!158266))

(assert (= (and b!158266 res!132215) b!158271))

(assert (= (and b!158271 res!132214) b!158269))

(assert (= (and b!158269 (not res!132216)) b!158267))

(assert (= (and b!158267 (not res!132217)) b!158270))

(assert (= start!31620 b!158268))

(declare-fun m!248185 () Bool)

(assert (=> b!158270 m!248185))

(declare-fun m!248187 () Bool)

(assert (=> b!158270 m!248187))

(declare-fun m!248189 () Bool)

(assert (=> b!158270 m!248189))

(declare-fun m!248191 () Bool)

(assert (=> b!158270 m!248191))

(declare-fun m!248193 () Bool)

(assert (=> b!158270 m!248193))

(declare-fun m!248195 () Bool)

(assert (=> b!158270 m!248195))

(assert (=> b!158270 m!248185))

(declare-fun m!248197 () Bool)

(assert (=> b!158270 m!248197))

(declare-fun m!248199 () Bool)

(assert (=> b!158270 m!248199))

(declare-fun m!248201 () Bool)

(assert (=> b!158266 m!248201))

(declare-fun m!248203 () Bool)

(assert (=> b!158268 m!248203))

(declare-fun m!248205 () Bool)

(assert (=> b!158267 m!248205))

(declare-fun m!248207 () Bool)

(assert (=> b!158269 m!248207))

(declare-fun m!248209 () Bool)

(assert (=> b!158269 m!248209))

(declare-fun m!248211 () Bool)

(assert (=> b!158269 m!248211))

(declare-fun m!248213 () Bool)

(assert (=> b!158271 m!248213))

(assert (=> b!158271 m!248189))

(declare-fun m!248215 () Bool)

(assert (=> b!158271 m!248215))

(assert (=> b!158271 m!248193))

(declare-fun m!248217 () Bool)

(assert (=> b!158271 m!248217))

(declare-fun m!248219 () Bool)

(assert (=> start!31620 m!248219))

(declare-fun m!248221 () Bool)

(assert (=> start!31620 m!248221))

(push 1)

(assert (not start!31620))

(assert (not b!158268))

(assert (not b!158269))

(assert (not b!158266))

(assert (not b!158271))

(assert (not b!158267))

(assert (not b!158270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-datatypes ((tuple3!692 0))(
  ( (tuple3!693 (_1!7687 Unit!10580) (_2!7687 BitStream!5854) (_3!463 array!7362)) )
))
(declare-fun lt!249540 () tuple3!692)

(declare-fun d!52935 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5854 array!7362 (_ BitVec 32) (_ BitVec 32)) tuple3!692)

(assert (=> d!52935 (= lt!249540 (readByteArrayLoop!0 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52935 (= (readByteArrayLoopPure!0 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14435 (_2!7687 lt!249540) (_3!463 lt!249540)))))

(declare-fun bs!13051 () Bool)

(assert (= bs!13051 d!52935))

(declare-fun m!248321 () Bool)

(assert (=> bs!13051 m!248321))

(assert (=> b!158271 d!52935))

(declare-fun d!52951 () Bool)

(declare-datatypes ((tuple2!14448 0))(
  ( (tuple2!14449 (_1!7688 (_ BitVec 8)) (_2!7688 BitStream!5854)) )
))
(declare-fun lt!249543 () tuple2!14448)

(declare-fun readByte!0 (BitStream!5854) tuple2!14448)

(assert (=> d!52951 (= lt!249543 (readByte!0 bs!65))))

(assert (=> d!52951 (= (readBytePure!0 bs!65) (tuple2!14433 (_2!7688 lt!249543) (_1!7688 lt!249543)))))

(declare-fun bs!13053 () Bool)

(assert (= bs!13053 d!52951))

(declare-fun m!248335 () Bool)

(assert (=> bs!13053 m!248335))

(assert (=> b!158271 d!52951))

(declare-fun d!52959 () Bool)

(declare-datatypes ((tuple2!14450 0))(
  ( (tuple2!14451 (_1!7689 Unit!10580) (_2!7689 BitStream!5854)) )
))
(declare-fun moveByteIndex!0 (BitStream!5854 (_ BitVec 32)) tuple2!14450)

(assert (=> d!52959 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7689 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!13054 () Bool)

(assert (= bs!13054 d!52959))

(declare-fun m!248337 () Bool)

(assert (=> bs!13054 m!248337))

(assert (=> b!158271 d!52959))

(declare-fun lt!249544 () tuple3!692)

(declare-fun d!52961 () Bool)

(assert (=> d!52961 (= lt!249544 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52961 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14435 (_2!7687 lt!249544) (_3!463 lt!249544)))))

(declare-fun bs!13055 () Bool)

(assert (= bs!13055 d!52961))

(declare-fun m!248339 () Bool)

(assert (=> bs!13055 m!248339))

(assert (=> b!158271 d!52961))

(declare-fun d!52963 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52963 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 bs!65))) ((_ sign_extend 32) (currentByte!6980 bs!65)) ((_ sign_extend 32) (currentBit!6975 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3339 (buf!3801 bs!65))) ((_ sign_extend 32) (currentByte!6980 bs!65)) ((_ sign_extend 32) (currentBit!6975 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13056 () Bool)

(assert (= bs!13056 d!52963))

(declare-fun m!248341 () Bool)

(assert (=> bs!13056 m!248341))

(assert (=> b!158266 d!52963))

(declare-fun d!52965 () Bool)

(assert (=> d!52965 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) lt!249452 lt!249450 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) lt!249452 lt!249450) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13057 () Bool)

(assert (= bs!13057 d!52965))

(declare-fun m!248343 () Bool)

(assert (=> bs!13057 m!248343))

(assert (=> b!158267 d!52965))

(declare-fun d!52967 () Bool)

(assert (=> d!52967 (= (array_inv!3090 (buf!3801 bs!65)) (bvsge (size!3339 (buf!3801 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!158268 d!52967))

(declare-fun d!52969 () Bool)

(assert (=> d!52969 (= (array_inv!3090 arr!153) (bvsge (size!3339 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31620 d!52969))

(declare-fun d!52971 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52971 (= (inv!12 bs!65) (invariant!0 (currentBit!6975 bs!65) (currentByte!6980 bs!65) (size!3339 (buf!3801 bs!65))))))

(declare-fun bs!13058 () Bool)

(assert (= bs!13058 d!52971))

(declare-fun m!248345 () Bool)

(assert (=> bs!13058 m!248345))

(assert (=> start!31620 d!52971))

(declare-fun d!52973 () Bool)

(assert (=> d!52973 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) lt!249452 lt!249450 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) lt!249452 lt!249450) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13059 () Bool)

(assert (= bs!13059 d!52973))

(assert (=> bs!13059 m!248343))

(assert (=> b!158269 d!52973))

(declare-fun d!52975 () Bool)

(declare-fun e!107585 () Bool)

(assert (=> d!52975 e!107585))

(declare-fun res!132262 () Bool)

(assert (=> d!52975 (=> (not res!132262) (not e!107585))))

(assert (=> d!52975 (= res!132262 (and (or (let ((rhs!3497 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3497 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3497) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!52976 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!52976 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!52976 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3496 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3496 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3496) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!249564 () Unit!10580)

(declare-fun choose!57 (BitStream!5854 BitStream!5854 (_ BitVec 64) (_ BitVec 32)) Unit!10580)

(assert (=> d!52975 (= lt!249564 (choose!57 bs!65 lt!249445 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!52975 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249445 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!249564)))

(declare-fun b!158321 () Bool)

(declare-fun lt!249565 () (_ BitVec 32))

(assert (=> b!158321 (= e!107585 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) ((_ sign_extend 32) (currentByte!6980 lt!249445)) ((_ sign_extend 32) (currentBit!6975 lt!249445)) (bvsub (bvsub to!236 from!240) lt!249565)))))

(assert (=> b!158321 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!249565 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!249565) #b10000000000000000000000000000000)))))

(declare-fun lt!249563 () (_ BitVec 64))

(assert (=> b!158321 (= lt!249565 ((_ extract 31 0) lt!249563))))

(assert (=> b!158321 (and (bvslt lt!249563 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!249563 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!158321 (= lt!249563 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!52975 res!132262) b!158321))

(declare-fun m!248355 () Bool)

(assert (=> d!52975 m!248355))

(declare-fun m!248357 () Bool)

(assert (=> b!158321 m!248357))

(assert (=> b!158269 d!52975))

(declare-fun d!52980 () Bool)

(declare-fun lt!249566 () tuple2!14448)

(assert (=> d!52980 (= lt!249566 (readByte!0 lt!249445))))

(assert (=> d!52980 (= (readBytePure!0 lt!249445) (tuple2!14433 (_2!7688 lt!249566) (_1!7688 lt!249566)))))

(declare-fun bs!13062 () Bool)

(assert (= bs!13062 d!52980))

(declare-fun m!248359 () Bool)

(assert (=> bs!13062 m!248359))

(assert (=> b!158269 d!52980))

(assert (=> b!158270 d!52951))

(declare-fun d!52982 () Bool)

(declare-fun lt!249575 () tuple2!14434)

(declare-fun lt!249577 () tuple2!14434)

(assert (=> d!52982 (arrayRangesEq!445 (_2!7679 lt!249575) (_2!7679 lt!249577) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!249576 () BitStream!5854)

(declare-fun lt!249578 () Unit!10580)

(declare-fun choose!35 (BitStream!5854 array!7362 (_ BitVec 32) (_ BitVec 32) tuple2!14434 array!7362 BitStream!5854 tuple2!14434 array!7362) Unit!10580)

(assert (=> d!52982 (= lt!249578 (choose!35 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!249575 (_2!7679 lt!249575) lt!249576 lt!249577 (_2!7679 lt!249577)))))

(assert (=> d!52982 (= lt!249577 (readByteArrayLoopPure!0 lt!249576 (array!7363 (store (arr!4248 lt!249447) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 (readBytePure!0 lt!249445))) (size!3339 lt!249447)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52982 (= lt!249576 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001))))

(assert (=> d!52982 (= lt!249575 (readByteArrayLoopPure!0 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52982 (= (readByteArrayLoopArrayPrefixLemma!0 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!249578)))

(declare-fun bs!13064 () Bool)

(assert (= bs!13064 d!52982))

(declare-fun m!248361 () Bool)

(assert (=> bs!13064 m!248361))

(assert (=> bs!13064 m!248185))

(declare-fun m!248363 () Bool)

(assert (=> bs!13064 m!248363))

(declare-fun m!248365 () Bool)

(assert (=> bs!13064 m!248365))

(assert (=> bs!13064 m!248213))

(assert (=> bs!13064 m!248211))

(declare-fun m!248367 () Bool)

(assert (=> bs!13064 m!248367))

(assert (=> b!158270 d!52982))

(declare-fun d!52984 () Bool)

(declare-fun lt!249579 () tuple3!692)

(assert (=> d!52984 (= lt!249579 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001) (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52984 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001) (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14435 (_2!7687 lt!249579) (_3!463 lt!249579)))))

(declare-fun bs!13065 () Bool)

(assert (= bs!13065 d!52984))

(assert (=> bs!13065 m!248185))

(declare-fun m!248369 () Bool)

(assert (=> bs!13065 m!248369))

(assert (=> b!158270 d!52984))

(declare-fun d!52986 () Bool)

(assert (=> d!52986 (= (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001) (_2!7689 (moveByteIndex!0 lt!249445 #b00000000000000000000000000000001)))))

(declare-fun bs!13066 () Bool)

(assert (= bs!13066 d!52986))

(declare-fun m!248371 () Bool)

(assert (=> bs!13066 m!248371))

(assert (=> b!158270 d!52986))

(declare-fun d!52988 () Bool)

(declare-fun res!132267 () Bool)

(declare-fun e!107590 () Bool)

(assert (=> d!52988 (=> res!132267 e!107590)))

(assert (=> d!52988 (= res!132267 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52988 (= (arrayRangesEq!445 (_2!7679 lt!249444) (_2!7679 lt!249448) #b00000000000000000000000000000000 to!236) e!107590)))

(declare-fun b!158326 () Bool)

(declare-fun e!107591 () Bool)

(assert (=> b!158326 (= e!107590 e!107591)))

(declare-fun res!132268 () Bool)

(assert (=> b!158326 (=> (not res!132268) (not e!107591))))

(assert (=> b!158326 (= res!132268 (= (select (arr!4248 (_2!7679 lt!249444)) #b00000000000000000000000000000000) (select (arr!4248 (_2!7679 lt!249448)) #b00000000000000000000000000000000)))))

(declare-fun b!158327 () Bool)

(assert (=> b!158327 (= e!107591 (arrayRangesEq!445 (_2!7679 lt!249444) (_2!7679 lt!249448) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52988 (not res!132267)) b!158326))

(assert (= (and b!158326 res!132268) b!158327))

(declare-fun m!248373 () Bool)

(assert (=> b!158326 m!248373))

(declare-fun m!248375 () Bool)

(assert (=> b!158326 m!248375))

(declare-fun m!248377 () Bool)

(assert (=> b!158327 m!248377))

(assert (=> b!158270 d!52988))

(declare-fun d!52990 () Bool)

(declare-fun res!132269 () Bool)

(declare-fun e!107592 () Bool)

(assert (=> d!52990 (=> res!132269 e!107592)))

(assert (=> d!52990 (= res!132269 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52990 (= (arrayRangesEq!445 (_2!7679 lt!249449) (_2!7679 lt!249444) #b00000000000000000000000000000000 to!236) e!107592)))

(declare-fun b!158328 () Bool)

(declare-fun e!107593 () Bool)

(assert (=> b!158328 (= e!107592 e!107593)))

(declare-fun res!132270 () Bool)

(assert (=> b!158328 (=> (not res!132270) (not e!107593))))

(assert (=> b!158328 (= res!132270 (= (select (arr!4248 (_2!7679 lt!249449)) #b00000000000000000000000000000000) (select (arr!4248 (_2!7679 lt!249444)) #b00000000000000000000000000000000)))))

(declare-fun b!158329 () Bool)

(assert (=> b!158329 (= e!107593 (arrayRangesEq!445 (_2!7679 lt!249449) (_2!7679 lt!249444) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52990 (not res!132269)) b!158328))

(assert (= (and b!158328 res!132270) b!158329))

(declare-fun m!248379 () Bool)

(assert (=> b!158328 m!248379))

(assert (=> b!158328 m!248373))

(declare-fun m!248381 () Bool)

(assert (=> b!158329 m!248381))

(assert (=> b!158270 d!52990))

(push 1)

(assert (not d!52959))

(assert (not d!52973))

(assert (not d!52963))

(assert (not d!52971))

(assert (not d!52975))

(assert (not d!52984))

(assert (not d!52961))

(assert (not d!52980))

(assert (not d!52986))

(assert (not d!52965))

(assert (not d!52935))

(assert (not d!52951))

(assert (not b!158327))

(assert (not b!158321))

(assert (not b!158329))

(assert (not d!52982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53004 () Bool)

(assert (=> d!53004 (= (remainingBits!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) lt!249452 lt!249450) (bvsub (bvmul ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!249452 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249450)))))

(assert (=> d!52965 d!53004))

(declare-fun d!53006 () Bool)

(assert (=> d!53006 (= (remainingBits!0 ((_ sign_extend 32) (size!3339 (buf!3801 bs!65))) ((_ sign_extend 32) (currentByte!6980 bs!65)) ((_ sign_extend 32) (currentBit!6975 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3339 (buf!3801 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6980 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6975 bs!65)))))))

(assert (=> d!52963 d!53006))

(declare-fun d!53008 () Bool)

(declare-fun res!132273 () Bool)

(declare-fun e!107596 () Bool)

(assert (=> d!53008 (=> res!132273 e!107596)))

(assert (=> d!53008 (= res!132273 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53008 (= (arrayRangesEq!445 (_2!7679 lt!249444) (_2!7679 lt!249448) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!107596)))

(declare-fun b!158332 () Bool)

(declare-fun e!107597 () Bool)

(assert (=> b!158332 (= e!107596 e!107597)))

(declare-fun res!132274 () Bool)

(assert (=> b!158332 (=> (not res!132274) (not e!107597))))

(assert (=> b!158332 (= res!132274 (= (select (arr!4248 (_2!7679 lt!249444)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4248 (_2!7679 lt!249448)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!158333 () Bool)

(assert (=> b!158333 (= e!107597 (arrayRangesEq!445 (_2!7679 lt!249444) (_2!7679 lt!249448) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53008 (not res!132273)) b!158332))

(assert (= (and b!158332 res!132274) b!158333))

(declare-fun m!248397 () Bool)

(assert (=> b!158332 m!248397))

(declare-fun m!248399 () Bool)

(assert (=> b!158332 m!248399))

(declare-fun m!248401 () Bool)

(assert (=> b!158333 m!248401))

(assert (=> b!158327 d!53008))

(declare-fun d!53010 () Bool)

(assert (=> d!53010 (arrayRangesEq!445 (_2!7679 (readByteArrayLoopPure!0 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7679 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001) (array!7363 (store (arr!4248 lt!249447) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 (readBytePure!0 lt!249445))) (size!3339 lt!249447)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!53010 true))

(declare-fun _$13!100 () Unit!10580)

(assert (=> d!53010 (= (choose!35 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!249575 (_2!7679 lt!249575) lt!249576 lt!249577 (_2!7679 lt!249577)) _$13!100)))

(declare-fun bs!13072 () Bool)

(assert (= bs!13072 d!53010))

(declare-fun m!248403 () Bool)

(assert (=> bs!13072 m!248403))

(assert (=> bs!13072 m!248185))

(assert (=> bs!13072 m!248185))

(declare-fun m!248405 () Bool)

(assert (=> bs!13072 m!248405))

(assert (=> bs!13072 m!248211))

(assert (=> bs!13072 m!248213))

(assert (=> bs!13072 m!248367))

(assert (=> d!52982 d!53010))

(declare-fun lt!249581 () tuple3!692)

(declare-fun d!53012 () Bool)

(assert (=> d!53012 (= lt!249581 (readByteArrayLoop!0 lt!249576 (array!7363 (store (arr!4248 lt!249447) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 (readBytePure!0 lt!249445))) (size!3339 lt!249447)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53012 (= (readByteArrayLoopPure!0 lt!249576 (array!7363 (store (arr!4248 lt!249447) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 (readBytePure!0 lt!249445))) (size!3339 lt!249447)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14435 (_2!7687 lt!249581) (_3!463 lt!249581)))))

(declare-fun bs!13073 () Bool)

(assert (= bs!13073 d!53012))

(declare-fun m!248407 () Bool)

(assert (=> bs!13073 m!248407))

(assert (=> d!52982 d!53012))

(assert (=> d!52982 d!52986))

(assert (=> d!52982 d!52980))

(declare-fun d!53014 () Bool)

(declare-fun res!132275 () Bool)

(declare-fun e!107598 () Bool)

(assert (=> d!53014 (=> res!132275 e!107598)))

(assert (=> d!53014 (= res!132275 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!53014 (= (arrayRangesEq!445 (_2!7679 lt!249575) (_2!7679 lt!249577) #b00000000000000000000000000000000 to!236) e!107598)))

(declare-fun b!158334 () Bool)

(declare-fun e!107599 () Bool)

(assert (=> b!158334 (= e!107598 e!107599)))

(declare-fun res!132276 () Bool)

(assert (=> b!158334 (=> (not res!132276) (not e!107599))))

(assert (=> b!158334 (= res!132276 (= (select (arr!4248 (_2!7679 lt!249575)) #b00000000000000000000000000000000) (select (arr!4248 (_2!7679 lt!249577)) #b00000000000000000000000000000000)))))

(declare-fun b!158335 () Bool)

(assert (=> b!158335 (= e!107599 (arrayRangesEq!445 (_2!7679 lt!249575) (_2!7679 lt!249577) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53014 (not res!132275)) b!158334))

(assert (= (and b!158334 res!132276) b!158335))

(declare-fun m!248409 () Bool)

(assert (=> b!158334 m!248409))

(declare-fun m!248411 () Bool)

(assert (=> b!158334 m!248411))

(declare-fun m!248413 () Bool)

(assert (=> b!158335 m!248413))

(assert (=> d!52982 d!53014))

(assert (=> d!52982 d!52935))

(declare-fun d!53016 () Bool)

(declare-fun lt!249599 () (_ BitVec 8))

(declare-fun lt!249602 () (_ BitVec 8))

(assert (=> d!53016 (= lt!249599 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4248 (buf!3801 bs!65)) (currentByte!6980 bs!65))) ((_ sign_extend 24) lt!249602))))))

(assert (=> d!53016 (= lt!249602 ((_ extract 7 0) (currentBit!6975 bs!65)))))

(declare-fun e!107604 () Bool)

(assert (=> d!53016 e!107604))

(declare-fun res!132283 () Bool)

(assert (=> d!53016 (=> (not res!132283) (not e!107604))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!53016 (= res!132283 (validate_offset_bits!1 ((_ sign_extend 32) (size!3339 (buf!3801 bs!65))) ((_ sign_extend 32) (currentByte!6980 bs!65)) ((_ sign_extend 32) (currentBit!6975 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14456 0))(
  ( (tuple2!14457 (_1!7693 Unit!10580) (_2!7693 (_ BitVec 8))) )
))
(declare-fun Unit!10593 () Unit!10580)

(declare-fun Unit!10594 () Unit!10580)

(assert (=> d!53016 (= (readByte!0 bs!65) (tuple2!14449 (_2!7693 (ite (bvsgt ((_ sign_extend 24) lt!249602) #b00000000000000000000000000000000) (tuple2!14457 Unit!10593 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249599) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4248 (buf!3801 bs!65)) (bvadd (currentByte!6980 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249602)))))))) (tuple2!14457 Unit!10594 lt!249599))) (BitStream!5855 (buf!3801 bs!65) (bvadd (currentByte!6980 bs!65) #b00000000000000000000000000000001) (currentBit!6975 bs!65))))))

(declare-fun b!158340 () Bool)

(declare-fun e!107605 () Bool)

(assert (=> b!158340 (= e!107604 e!107605)))

(declare-fun res!132282 () Bool)

(assert (=> b!158340 (=> (not res!132282) (not e!107605))))

(declare-fun lt!249600 () tuple2!14448)

(assert (=> b!158340 (= res!132282 (= (buf!3801 (_2!7688 lt!249600)) (buf!3801 bs!65)))))

(declare-fun lt!249598 () (_ BitVec 8))

(declare-fun lt!249601 () (_ BitVec 8))

(declare-fun Unit!10595 () Unit!10580)

(declare-fun Unit!10596 () Unit!10580)

(assert (=> b!158340 (= lt!249600 (tuple2!14449 (_2!7693 (ite (bvsgt ((_ sign_extend 24) lt!249601) #b00000000000000000000000000000000) (tuple2!14457 Unit!10595 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249598) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4248 (buf!3801 bs!65)) (bvadd (currentByte!6980 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249601)))))))) (tuple2!14457 Unit!10596 lt!249598))) (BitStream!5855 (buf!3801 bs!65) (bvadd (currentByte!6980 bs!65) #b00000000000000000000000000000001) (currentBit!6975 bs!65))))))

(assert (=> b!158340 (= lt!249598 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4248 (buf!3801 bs!65)) (currentByte!6980 bs!65))) ((_ sign_extend 24) lt!249601))))))

(assert (=> b!158340 (= lt!249601 ((_ extract 7 0) (currentBit!6975 bs!65)))))

(declare-fun lt!249596 () (_ BitVec 64))

(declare-fun b!158341 () Bool)

(declare-fun lt!249597 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!158341 (= e!107605 (= (bitIndex!0 (size!3339 (buf!3801 (_2!7688 lt!249600))) (currentByte!6980 (_2!7688 lt!249600)) (currentBit!6975 (_2!7688 lt!249600))) (bvadd lt!249596 lt!249597)))))

(assert (=> b!158341 (or (not (= (bvand lt!249596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249597 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249596 lt!249597) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!158341 (= lt!249597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!158341 (= lt!249596 (bitIndex!0 (size!3339 (buf!3801 bs!65)) (currentByte!6980 bs!65) (currentBit!6975 bs!65)))))

(assert (= (and d!53016 res!132283) b!158340))

(assert (= (and b!158340 res!132282) b!158341))

(declare-fun m!248415 () Bool)

(assert (=> d!53016 m!248415))

(declare-fun m!248417 () Bool)

(assert (=> d!53016 m!248417))

(declare-fun m!248419 () Bool)

(assert (=> d!53016 m!248419))

(assert (=> b!158340 m!248419))

(assert (=> b!158340 m!248415))

(declare-fun m!248421 () Bool)

(assert (=> b!158341 m!248421))

(declare-fun m!248423 () Bool)

(assert (=> b!158341 m!248423))

(assert (=> d!52951 d!53016))

(assert (=> d!52973 d!53004))

(declare-fun d!53020 () Bool)

(assert (=> d!53020 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) ((_ sign_extend 32) (currentByte!6980 lt!249445)) ((_ sign_extend 32) (currentBit!6975 lt!249445)) (bvsub (bvsub to!236 from!240) lt!249565)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!249565)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) ((_ sign_extend 32) (currentByte!6980 lt!249445)) ((_ sign_extend 32) (currentBit!6975 lt!249445))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13074 () Bool)

(assert (= bs!13074 d!53020))

(declare-fun m!248425 () Bool)

(assert (=> bs!13074 m!248425))

(assert (=> b!158321 d!53020))

(declare-fun d!53022 () Bool)

(declare-fun res!132284 () Bool)

(declare-fun e!107606 () Bool)

(assert (=> d!53022 (=> res!132284 e!107606)))

(assert (=> d!53022 (= res!132284 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!53022 (= (arrayRangesEq!445 (_2!7679 lt!249449) (_2!7679 lt!249444) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!107606)))

(declare-fun b!158342 () Bool)

(declare-fun e!107607 () Bool)

(assert (=> b!158342 (= e!107606 e!107607)))

(declare-fun res!132285 () Bool)

(assert (=> b!158342 (=> (not res!132285) (not e!107607))))

(assert (=> b!158342 (= res!132285 (= (select (arr!4248 (_2!7679 lt!249449)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4248 (_2!7679 lt!249444)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!158343 () Bool)

(assert (=> b!158343 (= e!107607 (arrayRangesEq!445 (_2!7679 lt!249449) (_2!7679 lt!249444) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!53022 (not res!132284)) b!158342))

(assert (= (and b!158342 res!132285) b!158343))

(declare-fun m!248427 () Bool)

(assert (=> b!158342 m!248427))

(assert (=> b!158342 m!248397))

(declare-fun m!248429 () Bool)

(assert (=> b!158343 m!248429))

(assert (=> b!158329 d!53022))

(declare-fun d!53024 () Bool)

(declare-fun e!107610 () Bool)

(assert (=> d!53024 e!107610))

(declare-fun res!132288 () Bool)

(assert (=> d!53024 (=> (not res!132288) (not e!107610))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5854 (_ BitVec 32)) Bool)

(assert (=> d!53024 (= res!132288 (moveByteIndexPrecond!0 lt!249445 #b00000000000000000000000000000001))))

(declare-fun Unit!10597 () Unit!10580)

(assert (=> d!53024 (= (moveByteIndex!0 lt!249445 #b00000000000000000000000000000001) (tuple2!14451 Unit!10597 (BitStream!5855 (buf!3801 lt!249445) (bvadd (currentByte!6980 lt!249445) #b00000000000000000000000000000001) (currentBit!6975 lt!249445))))))

(declare-fun b!158346 () Bool)

(assert (=> b!158346 (= e!107610 (and (or (not (= (bvand (currentByte!6980 lt!249445) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6980 lt!249445) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6980 lt!249445) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6980 lt!249445) #b00000000000000000000000000000001) (bvadd (currentByte!6980 lt!249445) #b00000000000000000000000000000001))))))

(assert (= (and d!53024 res!132288) b!158346))

(declare-fun m!248435 () Bool)

(assert (=> d!53024 m!248435))

(assert (=> d!52986 d!53024))

(declare-fun d!53030 () Bool)

(assert (=> d!53030 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) ((_ sign_extend 32) (currentByte!6980 lt!249445)) ((_ sign_extend 32) (currentBit!6975 lt!249445)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!53030 true))

(declare-fun _$7!115 () Unit!10580)

(assert (=> d!53030 (= (choose!57 bs!65 lt!249445 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!115)))

(declare-fun bs!13077 () Bool)

(assert (= bs!13077 d!53030))

(declare-fun m!248437 () Bool)

(assert (=> bs!13077 m!248437))

(assert (=> d!52975 d!53030))

(declare-fun d!53032 () Bool)

(assert (=> d!53032 (= (invariant!0 (currentBit!6975 bs!65) (currentByte!6980 bs!65) (size!3339 (buf!3801 bs!65))) (and (bvsge (currentBit!6975 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6975 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6980 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6980 bs!65) (size!3339 (buf!3801 bs!65))) (and (= (currentBit!6975 bs!65) #b00000000000000000000000000000000) (= (currentByte!6980 bs!65) (size!3339 (buf!3801 bs!65)))))))))

(assert (=> d!52971 d!53032))

(declare-fun b!158409 () Bool)

(declare-fun e!107660 () tuple3!692)

(declare-fun lt!249946 () Unit!10580)

(declare-fun lt!249915 () tuple3!692)

(assert (=> b!158409 (= e!107660 (tuple3!693 lt!249946 (_2!7687 lt!249915) (_3!463 lt!249915)))))

(declare-fun lt!249924 () tuple2!14448)

(assert (=> b!158409 (= lt!249924 (readByte!0 lt!249445))))

(declare-fun lt!249925 () array!7362)

(assert (=> b!158409 (= lt!249925 (array!7363 (store (arr!4248 lt!249447) (bvadd #b00000000000000000000000000000001 from!240) (_1!7688 lt!249924)) (size!3339 lt!249447)))))

(declare-fun lt!249918 () (_ BitVec 64))

(assert (=> b!158409 (= lt!249918 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!249936 () (_ BitVec 32))

(assert (=> b!158409 (= lt!249936 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!249926 () Unit!10580)

(assert (=> b!158409 (= lt!249926 (validateOffsetBytesFromBitIndexLemma!0 lt!249445 (_2!7688 lt!249924) lt!249918 lt!249936))))

(assert (=> b!158409 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 (_2!7688 lt!249924)))) ((_ sign_extend 32) (currentByte!6980 (_2!7688 lt!249924))) ((_ sign_extend 32) (currentBit!6975 (_2!7688 lt!249924))) (bvsub lt!249936 ((_ extract 31 0) (bvsdiv (bvadd lt!249918 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!249929 () Unit!10580)

(assert (=> b!158409 (= lt!249929 lt!249926)))

(assert (=> b!158409 (= lt!249915 (readByteArrayLoop!0 (_2!7688 lt!249924) lt!249925 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158409 (= (bitIndex!0 (size!3339 (buf!3801 (_2!7688 lt!249924))) (currentByte!6980 (_2!7688 lt!249924)) (currentBit!6975 (_2!7688 lt!249924))) (bvadd (bitIndex!0 (size!3339 (buf!3801 lt!249445)) (currentByte!6980 lt!249445) (currentBit!6975 lt!249445)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!249938 () Unit!10580)

(declare-fun Unit!10599 () Unit!10580)

(assert (=> b!158409 (= lt!249938 Unit!10599)))

(declare-fun call!2664 () (_ BitVec 64))

(assert (=> b!158409 (= (bvadd (bitIndex!0 (size!3339 (buf!3801 (_2!7688 lt!249924))) (currentByte!6980 (_2!7688 lt!249924)) (currentBit!6975 (_2!7688 lt!249924))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2664)))

(declare-fun lt!249935 () Unit!10580)

(declare-fun Unit!10600 () Unit!10580)

(assert (=> b!158409 (= lt!249935 Unit!10600)))

(assert (=> b!158409 (= (bvadd (bitIndex!0 (size!3339 (buf!3801 lt!249445)) (currentByte!6980 lt!249445) (currentBit!6975 lt!249445)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2664)))

(declare-fun lt!249928 () Unit!10580)

(declare-fun Unit!10601 () Unit!10580)

(assert (=> b!158409 (= lt!249928 Unit!10601)))

(assert (=> b!158409 (and (= (buf!3801 lt!249445) (buf!3801 (_2!7687 lt!249915))) (= (size!3339 lt!249447) (size!3339 (_3!463 lt!249915))))))

(declare-fun lt!249919 () Unit!10580)

(declare-fun Unit!10602 () Unit!10580)

(assert (=> b!158409 (= lt!249919 Unit!10602)))

(declare-fun lt!249933 () Unit!10580)

(declare-fun arrayUpdatedAtPrefixLemma!54 (array!7362 (_ BitVec 32) (_ BitVec 8)) Unit!10580)

(assert (=> b!158409 (= lt!249933 (arrayUpdatedAtPrefixLemma!54 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) (_1!7688 lt!249924)))))

(assert (=> b!158409 (arrayRangesEq!445 lt!249447 (array!7363 (store (arr!4248 lt!249447) (bvadd #b00000000000000000000000000000001 from!240) (_1!7688 lt!249924)) (size!3339 lt!249447)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!249930 () Unit!10580)

(assert (=> b!158409 (= lt!249930 lt!249933)))

(declare-fun lt!249941 () (_ BitVec 32))

(assert (=> b!158409 (= lt!249941 #b00000000000000000000000000000000)))

(declare-fun lt!249917 () Unit!10580)

(declare-fun arrayRangesEqTransitive!119 (array!7362 array!7362 array!7362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10580)

(assert (=> b!158409 (= lt!249917 (arrayRangesEqTransitive!119 lt!249447 lt!249925 (_3!463 lt!249915) lt!249941 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2665 () Bool)

(assert (=> b!158409 call!2665))

(declare-fun lt!249948 () Unit!10580)

(assert (=> b!158409 (= lt!249948 lt!249917)))

(declare-fun call!2666 () Bool)

(assert (=> b!158409 call!2666))

(declare-fun lt!249942 () Unit!10580)

(declare-fun Unit!10604 () Unit!10580)

(assert (=> b!158409 (= lt!249942 Unit!10604)))

(declare-fun lt!249923 () Unit!10580)

(declare-fun arrayRangesEqImpliesEq!63 (array!7362 array!7362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10580)

(assert (=> b!158409 (= lt!249923 (arrayRangesEqImpliesEq!63 lt!249925 (_3!463 lt!249915) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158409 (= (select (store (arr!4248 lt!249447) (bvadd #b00000000000000000000000000000001 from!240) (_1!7688 lt!249924)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4248 (_3!463 lt!249915)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!249932 () Unit!10580)

(assert (=> b!158409 (= lt!249932 lt!249923)))

(declare-fun lt!249931 () Bool)

(assert (=> b!158409 (= lt!249931 (= (select (arr!4248 (_3!463 lt!249915)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7688 lt!249924)))))

(declare-fun Unit!10606 () Unit!10580)

(assert (=> b!158409 (= lt!249946 Unit!10606)))

(assert (=> b!158409 lt!249931))

(declare-fun b!158410 () Bool)

(declare-fun res!132340 () Bool)

(declare-fun e!107659 () Bool)

(assert (=> b!158410 (=> (not res!132340) (not e!107659))))

(declare-fun lt!249939 () tuple3!692)

(assert (=> b!158410 (= res!132340 (and (= (buf!3801 lt!249445) (buf!3801 (_2!7687 lt!249939))) (= (size!3339 lt!249447) (size!3339 (_3!463 lt!249939)))))))

(declare-fun d!53034 () Bool)

(declare-fun e!107661 () Bool)

(assert (=> d!53034 e!107661))

(declare-fun res!132338 () Bool)

(assert (=> d!53034 (=> res!132338 e!107661)))

(assert (=> d!53034 (= res!132338 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!249940 () Bool)

(assert (=> d!53034 (= lt!249940 e!107659)))

(declare-fun res!132339 () Bool)

(assert (=> d!53034 (=> (not res!132339) (not e!107659))))

(declare-fun lt!249920 () (_ BitVec 64))

(declare-fun lt!249947 () (_ BitVec 64))

(assert (=> d!53034 (= res!132339 (= (bvadd lt!249920 lt!249947) (bitIndex!0 (size!3339 (buf!3801 (_2!7687 lt!249939))) (currentByte!6980 (_2!7687 lt!249939)) (currentBit!6975 (_2!7687 lt!249939)))))))

(assert (=> d!53034 (or (not (= (bvand lt!249920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249947 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249920 lt!249947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!249943 () (_ BitVec 64))

(assert (=> d!53034 (= lt!249947 (bvmul lt!249943 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53034 (or (= lt!249943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249943)))))

(assert (=> d!53034 (= lt!249943 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!53034 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!53034 (= lt!249920 (bitIndex!0 (size!3339 (buf!3801 lt!249445)) (currentByte!6980 lt!249445) (currentBit!6975 lt!249445)))))

(assert (=> d!53034 (= lt!249939 e!107660)))

(declare-fun c!8410 () Bool)

(assert (=> d!53034 (= c!8410 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!53034 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3339 lt!249447)))))

(assert (=> d!53034 (= (readByteArrayLoop!0 lt!249445 lt!249447 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!249939)))

(declare-fun bm!2661 () Bool)

(assert (=> bm!2661 (= call!2664 (bitIndex!0 (ite c!8410 (size!3339 (buf!3801 (_2!7687 lt!249915))) (size!3339 (buf!3801 lt!249445))) (ite c!8410 (currentByte!6980 (_2!7687 lt!249915)) (currentByte!6980 lt!249445)) (ite c!8410 (currentBit!6975 (_2!7687 lt!249915)) (currentBit!6975 lt!249445))))))

(declare-fun b!158411 () Bool)

(assert (=> b!158411 (= e!107659 (arrayRangesEq!445 lt!249447 (_3!463 lt!249939) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!249913 () array!7362)

(declare-fun bm!2662 () Bool)

(declare-fun lt!249921 () array!7362)

(declare-fun lt!249944 () (_ BitVec 32))

(declare-fun lt!249934 () (_ BitVec 32))

(assert (=> bm!2662 (= call!2665 (arrayRangesEq!445 (ite c!8410 lt!249447 lt!249921) (ite c!8410 (_3!463 lt!249915) lt!249913) (ite c!8410 lt!249941 lt!249944) (ite c!8410 (bvadd #b00000000000000000000000000000001 from!240) lt!249934)))))

(declare-fun b!158412 () Bool)

(assert (=> b!158412 (= e!107661 (= (select (arr!4248 (_3!463 lt!249939)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7678 (readBytePure!0 lt!249445))))))

(assert (=> b!158412 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3339 (_3!463 lt!249939))))))

(declare-fun bm!2663 () Bool)

(assert (=> bm!2663 (= call!2666 (arrayRangesEq!445 lt!249447 (ite c!8410 (_3!463 lt!249915) lt!249447) #b00000000000000000000000000000000 (ite c!8410 (bvadd #b00000000000000000000000000000001 from!240) (size!3339 lt!249447))))))

(declare-fun lt!249914 () Unit!10580)

(declare-fun b!158413 () Bool)

(assert (=> b!158413 (= e!107660 (tuple3!693 lt!249914 lt!249445 lt!249447))))

(assert (=> b!158413 (= call!2664 call!2664)))

(declare-fun lt!249927 () Unit!10580)

(declare-fun Unit!10611 () Unit!10580)

(assert (=> b!158413 (= lt!249927 Unit!10611)))

(declare-fun lt!249937 () Unit!10580)

(declare-fun arrayRangesEqReflexiveLemma!54 (array!7362) Unit!10580)

(assert (=> b!158413 (= lt!249937 (arrayRangesEqReflexiveLemma!54 lt!249447))))

(assert (=> b!158413 call!2666))

(declare-fun lt!249945 () Unit!10580)

(assert (=> b!158413 (= lt!249945 lt!249937)))

(assert (=> b!158413 (= lt!249921 lt!249447)))

(assert (=> b!158413 (= lt!249913 lt!249447)))

(declare-fun lt!249922 () (_ BitVec 32))

(assert (=> b!158413 (= lt!249922 #b00000000000000000000000000000000)))

(declare-fun lt!249916 () (_ BitVec 32))

(assert (=> b!158413 (= lt!249916 (size!3339 lt!249447))))

(assert (=> b!158413 (= lt!249944 #b00000000000000000000000000000000)))

(assert (=> b!158413 (= lt!249934 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!54 (array!7362 array!7362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10580)

(assert (=> b!158413 (= lt!249914 (arrayRangesEqSlicedLemma!54 lt!249921 lt!249913 lt!249922 lt!249916 lt!249944 lt!249934))))

(assert (=> b!158413 call!2665))

(assert (= (and d!53034 c!8410) b!158409))

(assert (= (and d!53034 (not c!8410)) b!158413))

(assert (= (or b!158409 b!158413) bm!2662))

(assert (= (or b!158409 b!158413) bm!2663))

(assert (= (or b!158409 b!158413) bm!2661))

(assert (= (and d!53034 res!132339) b!158410))

(assert (= (and b!158410 res!132340) b!158411))

(assert (= (and d!53034 (not res!132338)) b!158412))

(declare-fun m!248633 () Bool)

(assert (=> d!53034 m!248633))

(declare-fun m!248635 () Bool)

(assert (=> d!53034 m!248635))

(declare-fun m!248637 () Bool)

(assert (=> bm!2662 m!248637))

(declare-fun m!248639 () Bool)

(assert (=> b!158413 m!248639))

(declare-fun m!248641 () Bool)

(assert (=> b!158413 m!248641))

(declare-fun m!248643 () Bool)

(assert (=> b!158412 m!248643))

(assert (=> b!158412 m!248211))

(declare-fun m!248645 () Bool)

(assert (=> bm!2661 m!248645))

(declare-fun m!248647 () Bool)

(assert (=> b!158409 m!248647))

(declare-fun m!248649 () Bool)

(assert (=> b!158409 m!248649))

(declare-fun m!248651 () Bool)

(assert (=> b!158409 m!248651))

(declare-fun m!248653 () Bool)

(assert (=> b!158409 m!248653))

(declare-fun m!248655 () Bool)

(assert (=> b!158409 m!248655))

(assert (=> b!158409 m!248635))

(declare-fun m!248657 () Bool)

(assert (=> b!158409 m!248657))

(assert (=> b!158409 m!248359))

(declare-fun m!248659 () Bool)

(assert (=> b!158409 m!248659))

(declare-fun m!248661 () Bool)

(assert (=> b!158409 m!248661))

(declare-fun m!248663 () Bool)

(assert (=> b!158409 m!248663))

(declare-fun m!248665 () Bool)

(assert (=> b!158409 m!248665))

(declare-fun m!248667 () Bool)

(assert (=> b!158409 m!248667))

(declare-fun m!248669 () Bool)

(assert (=> b!158411 m!248669))

(declare-fun m!248671 () Bool)

(assert (=> bm!2663 m!248671))

(assert (=> d!52935 d!53034))

(declare-fun b!158414 () Bool)

(declare-fun e!107663 () tuple3!692)

(declare-fun lt!249982 () Unit!10580)

(declare-fun lt!249951 () tuple3!692)

(assert (=> b!158414 (= e!107663 (tuple3!693 lt!249982 (_2!7687 lt!249951) (_3!463 lt!249951)))))

(declare-fun lt!249960 () tuple2!14448)

(assert (=> b!158414 (= lt!249960 (readByte!0 bs!65))))

(declare-fun lt!249961 () array!7362)

(assert (=> b!158414 (= lt!249961 (array!7363 (store (arr!4248 arr!153) from!240 (_1!7688 lt!249960)) (size!3339 arr!153)))))

(declare-fun lt!249954 () (_ BitVec 64))

(assert (=> b!158414 (= lt!249954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!249972 () (_ BitVec 32))

(assert (=> b!158414 (= lt!249972 (bvsub to!236 from!240))))

(declare-fun lt!249962 () Unit!10580)

(assert (=> b!158414 (= lt!249962 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7688 lt!249960) lt!249954 lt!249972))))

(assert (=> b!158414 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 (_2!7688 lt!249960)))) ((_ sign_extend 32) (currentByte!6980 (_2!7688 lt!249960))) ((_ sign_extend 32) (currentBit!6975 (_2!7688 lt!249960))) (bvsub lt!249972 ((_ extract 31 0) (bvsdiv (bvadd lt!249954 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!249965 () Unit!10580)

(assert (=> b!158414 (= lt!249965 lt!249962)))

(assert (=> b!158414 (= lt!249951 (readByteArrayLoop!0 (_2!7688 lt!249960) lt!249961 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158414 (= (bitIndex!0 (size!3339 (buf!3801 (_2!7688 lt!249960))) (currentByte!6980 (_2!7688 lt!249960)) (currentBit!6975 (_2!7688 lt!249960))) (bvadd (bitIndex!0 (size!3339 (buf!3801 bs!65)) (currentByte!6980 bs!65) (currentBit!6975 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!249974 () Unit!10580)

(declare-fun Unit!10612 () Unit!10580)

(assert (=> b!158414 (= lt!249974 Unit!10612)))

(declare-fun call!2667 () (_ BitVec 64))

(assert (=> b!158414 (= (bvadd (bitIndex!0 (size!3339 (buf!3801 (_2!7688 lt!249960))) (currentByte!6980 (_2!7688 lt!249960)) (currentBit!6975 (_2!7688 lt!249960))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2667)))

(declare-fun lt!249971 () Unit!10580)

(declare-fun Unit!10613 () Unit!10580)

(assert (=> b!158414 (= lt!249971 Unit!10613)))

(assert (=> b!158414 (= (bvadd (bitIndex!0 (size!3339 (buf!3801 bs!65)) (currentByte!6980 bs!65) (currentBit!6975 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2667)))

(declare-fun lt!249964 () Unit!10580)

(declare-fun Unit!10614 () Unit!10580)

(assert (=> b!158414 (= lt!249964 Unit!10614)))

(assert (=> b!158414 (and (= (buf!3801 bs!65) (buf!3801 (_2!7687 lt!249951))) (= (size!3339 arr!153) (size!3339 (_3!463 lt!249951))))))

(declare-fun lt!249955 () Unit!10580)

(declare-fun Unit!10615 () Unit!10580)

(assert (=> b!158414 (= lt!249955 Unit!10615)))

(declare-fun lt!249969 () Unit!10580)

(assert (=> b!158414 (= lt!249969 (arrayUpdatedAtPrefixLemma!54 arr!153 from!240 (_1!7688 lt!249960)))))

(assert (=> b!158414 (arrayRangesEq!445 arr!153 (array!7363 (store (arr!4248 arr!153) from!240 (_1!7688 lt!249960)) (size!3339 arr!153)) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!249966 () Unit!10580)

(assert (=> b!158414 (= lt!249966 lt!249969)))

(declare-fun lt!249977 () (_ BitVec 32))

(assert (=> b!158414 (= lt!249977 #b00000000000000000000000000000000)))

(declare-fun lt!249953 () Unit!10580)

(assert (=> b!158414 (= lt!249953 (arrayRangesEqTransitive!119 arr!153 lt!249961 (_3!463 lt!249951) lt!249977 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2668 () Bool)

(assert (=> b!158414 call!2668))

(declare-fun lt!249984 () Unit!10580)

(assert (=> b!158414 (= lt!249984 lt!249953)))

(declare-fun call!2669 () Bool)

(assert (=> b!158414 call!2669))

(declare-fun lt!249978 () Unit!10580)

(declare-fun Unit!10616 () Unit!10580)

(assert (=> b!158414 (= lt!249978 Unit!10616)))

(declare-fun lt!249959 () Unit!10580)

(assert (=> b!158414 (= lt!249959 (arrayRangesEqImpliesEq!63 lt!249961 (_3!463 lt!249951) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158414 (= (select (store (arr!4248 arr!153) from!240 (_1!7688 lt!249960)) from!240) (select (arr!4248 (_3!463 lt!249951)) from!240))))

(declare-fun lt!249968 () Unit!10580)

(assert (=> b!158414 (= lt!249968 lt!249959)))

(declare-fun lt!249967 () Bool)

(assert (=> b!158414 (= lt!249967 (= (select (arr!4248 (_3!463 lt!249951)) from!240) (_1!7688 lt!249960)))))

(declare-fun Unit!10617 () Unit!10580)

(assert (=> b!158414 (= lt!249982 Unit!10617)))

(assert (=> b!158414 lt!249967))

(declare-fun b!158415 () Bool)

(declare-fun res!132343 () Bool)

(declare-fun e!107662 () Bool)

(assert (=> b!158415 (=> (not res!132343) (not e!107662))))

(declare-fun lt!249975 () tuple3!692)

(assert (=> b!158415 (= res!132343 (and (= (buf!3801 bs!65) (buf!3801 (_2!7687 lt!249975))) (= (size!3339 arr!153) (size!3339 (_3!463 lt!249975)))))))

(declare-fun d!53087 () Bool)

(declare-fun e!107664 () Bool)

(assert (=> d!53087 e!107664))

(declare-fun res!132341 () Bool)

(assert (=> d!53087 (=> res!132341 e!107664)))

(assert (=> d!53087 (= res!132341 (bvsge from!240 to!236))))

(declare-fun lt!249976 () Bool)

(assert (=> d!53087 (= lt!249976 e!107662)))

(declare-fun res!132342 () Bool)

(assert (=> d!53087 (=> (not res!132342) (not e!107662))))

(declare-fun lt!249983 () (_ BitVec 64))

(declare-fun lt!249956 () (_ BitVec 64))

(assert (=> d!53087 (= res!132342 (= (bvadd lt!249956 lt!249983) (bitIndex!0 (size!3339 (buf!3801 (_2!7687 lt!249975))) (currentByte!6980 (_2!7687 lt!249975)) (currentBit!6975 (_2!7687 lt!249975)))))))

(assert (=> d!53087 (or (not (= (bvand lt!249956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249983 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249956 lt!249983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!249979 () (_ BitVec 64))

(assert (=> d!53087 (= lt!249983 (bvmul lt!249979 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53087 (or (= lt!249979 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!249979 #b0000000000000000000000000000000000000000000000000000000000001000) lt!249979)))))

(assert (=> d!53087 (= lt!249979 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!53087 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!53087 (= lt!249956 (bitIndex!0 (size!3339 (buf!3801 bs!65)) (currentByte!6980 bs!65) (currentBit!6975 bs!65)))))

(assert (=> d!53087 (= lt!249975 e!107663)))

(declare-fun c!8411 () Bool)

(assert (=> d!53087 (= c!8411 (bvslt from!240 to!236))))

(assert (=> d!53087 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3339 arr!153)))))

(assert (=> d!53087 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!249975)))

(declare-fun bm!2664 () Bool)

(assert (=> bm!2664 (= call!2667 (bitIndex!0 (ite c!8411 (size!3339 (buf!3801 (_2!7687 lt!249951))) (size!3339 (buf!3801 bs!65))) (ite c!8411 (currentByte!6980 (_2!7687 lt!249951)) (currentByte!6980 bs!65)) (ite c!8411 (currentBit!6975 (_2!7687 lt!249951)) (currentBit!6975 bs!65))))))

(declare-fun b!158416 () Bool)

(assert (=> b!158416 (= e!107662 (arrayRangesEq!445 arr!153 (_3!463 lt!249975) #b00000000000000000000000000000000 from!240))))

(declare-fun lt!249949 () array!7362)

(declare-fun lt!249957 () array!7362)

(declare-fun lt!249970 () (_ BitVec 32))

(declare-fun bm!2665 () Bool)

(declare-fun lt!249980 () (_ BitVec 32))

(assert (=> bm!2665 (= call!2668 (arrayRangesEq!445 (ite c!8411 arr!153 lt!249957) (ite c!8411 (_3!463 lt!249951) lt!249949) (ite c!8411 lt!249977 lt!249980) (ite c!8411 from!240 lt!249970)))))

(declare-fun b!158417 () Bool)

(assert (=> b!158417 (= e!107664 (= (select (arr!4248 (_3!463 lt!249975)) from!240) (_2!7678 (readBytePure!0 bs!65))))))

(assert (=> b!158417 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3339 (_3!463 lt!249975))))))

(declare-fun bm!2666 () Bool)

(assert (=> bm!2666 (= call!2669 (arrayRangesEq!445 arr!153 (ite c!8411 (_3!463 lt!249951) arr!153) #b00000000000000000000000000000000 (ite c!8411 from!240 (size!3339 arr!153))))))

(declare-fun lt!249950 () Unit!10580)

(declare-fun b!158418 () Bool)

(assert (=> b!158418 (= e!107663 (tuple3!693 lt!249950 bs!65 arr!153))))

(assert (=> b!158418 (= call!2667 call!2667)))

(declare-fun lt!249963 () Unit!10580)

(declare-fun Unit!10618 () Unit!10580)

(assert (=> b!158418 (= lt!249963 Unit!10618)))

(declare-fun lt!249973 () Unit!10580)

(assert (=> b!158418 (= lt!249973 (arrayRangesEqReflexiveLemma!54 arr!153))))

(assert (=> b!158418 call!2669))

(declare-fun lt!249981 () Unit!10580)

(assert (=> b!158418 (= lt!249981 lt!249973)))

(assert (=> b!158418 (= lt!249957 arr!153)))

(assert (=> b!158418 (= lt!249949 arr!153)))

(declare-fun lt!249958 () (_ BitVec 32))

(assert (=> b!158418 (= lt!249958 #b00000000000000000000000000000000)))

(declare-fun lt!249952 () (_ BitVec 32))

(assert (=> b!158418 (= lt!249952 (size!3339 arr!153))))

(assert (=> b!158418 (= lt!249980 #b00000000000000000000000000000000)))

(assert (=> b!158418 (= lt!249970 from!240)))

(assert (=> b!158418 (= lt!249950 (arrayRangesEqSlicedLemma!54 lt!249957 lt!249949 lt!249958 lt!249952 lt!249980 lt!249970))))

(assert (=> b!158418 call!2668))

(assert (= (and d!53087 c!8411) b!158414))

(assert (= (and d!53087 (not c!8411)) b!158418))

(assert (= (or b!158414 b!158418) bm!2665))

(assert (= (or b!158414 b!158418) bm!2666))

(assert (= (or b!158414 b!158418) bm!2664))

(assert (= (and d!53087 res!132342) b!158415))

(assert (= (and b!158415 res!132343) b!158416))

(assert (= (and d!53087 (not res!132341)) b!158417))

(declare-fun m!248673 () Bool)

(assert (=> d!53087 m!248673))

(assert (=> d!53087 m!248423))

(declare-fun m!248675 () Bool)

(assert (=> bm!2665 m!248675))

(declare-fun m!248677 () Bool)

(assert (=> b!158418 m!248677))

(declare-fun m!248679 () Bool)

(assert (=> b!158418 m!248679))

(declare-fun m!248681 () Bool)

(assert (=> b!158417 m!248681))

(assert (=> b!158417 m!248189))

(declare-fun m!248683 () Bool)

(assert (=> bm!2664 m!248683))

(declare-fun m!248685 () Bool)

(assert (=> b!158414 m!248685))

(declare-fun m!248687 () Bool)

(assert (=> b!158414 m!248687))

(declare-fun m!248689 () Bool)

(assert (=> b!158414 m!248689))

(declare-fun m!248691 () Bool)

(assert (=> b!158414 m!248691))

(declare-fun m!248693 () Bool)

(assert (=> b!158414 m!248693))

(assert (=> b!158414 m!248423))

(declare-fun m!248695 () Bool)

(assert (=> b!158414 m!248695))

(assert (=> b!158414 m!248335))

(declare-fun m!248697 () Bool)

(assert (=> b!158414 m!248697))

(declare-fun m!248699 () Bool)

(assert (=> b!158414 m!248699))

(declare-fun m!248701 () Bool)

(assert (=> b!158414 m!248701))

(declare-fun m!248703 () Bool)

(assert (=> b!158414 m!248703))

(declare-fun m!248705 () Bool)

(assert (=> b!158414 m!248705))

(declare-fun m!248707 () Bool)

(assert (=> b!158416 m!248707))

(declare-fun m!248709 () Bool)

(assert (=> bm!2666 m!248709))

(assert (=> d!52961 d!53087))

(declare-fun d!53089 () Bool)

(declare-fun lt!249988 () (_ BitVec 8))

(declare-fun lt!249991 () (_ BitVec 8))

(assert (=> d!53089 (= lt!249988 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4248 (buf!3801 lt!249445)) (currentByte!6980 lt!249445))) ((_ sign_extend 24) lt!249991))))))

(assert (=> d!53089 (= lt!249991 ((_ extract 7 0) (currentBit!6975 lt!249445)))))

(declare-fun e!107665 () Bool)

(assert (=> d!53089 e!107665))

(declare-fun res!132345 () Bool)

(assert (=> d!53089 (=> (not res!132345) (not e!107665))))

(assert (=> d!53089 (= res!132345 (validate_offset_bits!1 ((_ sign_extend 32) (size!3339 (buf!3801 lt!249445))) ((_ sign_extend 32) (currentByte!6980 lt!249445)) ((_ sign_extend 32) (currentBit!6975 lt!249445)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10623 () Unit!10580)

(declare-fun Unit!10624 () Unit!10580)

(assert (=> d!53089 (= (readByte!0 lt!249445) (tuple2!14449 (_2!7693 (ite (bvsgt ((_ sign_extend 24) lt!249991) #b00000000000000000000000000000000) (tuple2!14457 Unit!10623 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249988) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4248 (buf!3801 lt!249445)) (bvadd (currentByte!6980 lt!249445) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249991)))))))) (tuple2!14457 Unit!10624 lt!249988))) (BitStream!5855 (buf!3801 lt!249445) (bvadd (currentByte!6980 lt!249445) #b00000000000000000000000000000001) (currentBit!6975 lt!249445))))))

(declare-fun b!158419 () Bool)

(declare-fun e!107666 () Bool)

(assert (=> b!158419 (= e!107665 e!107666)))

(declare-fun res!132344 () Bool)

(assert (=> b!158419 (=> (not res!132344) (not e!107666))))

(declare-fun lt!249989 () tuple2!14448)

(assert (=> b!158419 (= res!132344 (= (buf!3801 (_2!7688 lt!249989)) (buf!3801 lt!249445)))))

(declare-fun lt!249990 () (_ BitVec 8))

(declare-fun lt!249987 () (_ BitVec 8))

(declare-fun Unit!10625 () Unit!10580)

(declare-fun Unit!10626 () Unit!10580)

(assert (=> b!158419 (= lt!249989 (tuple2!14449 (_2!7693 (ite (bvsgt ((_ sign_extend 24) lt!249990) #b00000000000000000000000000000000) (tuple2!14457 Unit!10625 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!249987) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4248 (buf!3801 lt!249445)) (bvadd (currentByte!6980 lt!249445) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!249990)))))))) (tuple2!14457 Unit!10626 lt!249987))) (BitStream!5855 (buf!3801 lt!249445) (bvadd (currentByte!6980 lt!249445) #b00000000000000000000000000000001) (currentBit!6975 lt!249445))))))

(assert (=> b!158419 (= lt!249987 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4248 (buf!3801 lt!249445)) (currentByte!6980 lt!249445))) ((_ sign_extend 24) lt!249990))))))

(assert (=> b!158419 (= lt!249990 ((_ extract 7 0) (currentBit!6975 lt!249445)))))

(declare-fun lt!249985 () (_ BitVec 64))

(declare-fun lt!249986 () (_ BitVec 64))

(declare-fun b!158420 () Bool)

(assert (=> b!158420 (= e!107666 (= (bitIndex!0 (size!3339 (buf!3801 (_2!7688 lt!249989))) (currentByte!6980 (_2!7688 lt!249989)) (currentBit!6975 (_2!7688 lt!249989))) (bvadd lt!249985 lt!249986)))))

(assert (=> b!158420 (or (not (= (bvand lt!249985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!249986 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249985 lt!249986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!158420 (= lt!249986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!158420 (= lt!249985 (bitIndex!0 (size!3339 (buf!3801 lt!249445)) (currentByte!6980 lt!249445) (currentBit!6975 lt!249445)))))

(assert (= (and d!53089 res!132345) b!158419))

(assert (= (and b!158419 res!132344) b!158420))

(declare-fun m!248711 () Bool)

(assert (=> d!53089 m!248711))

(declare-fun m!248713 () Bool)

(assert (=> d!53089 m!248713))

(declare-fun m!248715 () Bool)

(assert (=> d!53089 m!248715))

(assert (=> b!158419 m!248715))

(assert (=> b!158419 m!248711))

(declare-fun m!248717 () Bool)

(assert (=> b!158420 m!248717))

(assert (=> b!158420 m!248635))

(assert (=> d!52980 d!53089))

(declare-fun b!158421 () Bool)

(declare-fun e!107668 () tuple3!692)

(declare-fun lt!250025 () Unit!10580)

(declare-fun lt!249994 () tuple3!692)

(assert (=> b!158421 (= e!107668 (tuple3!693 lt!250025 (_2!7687 lt!249994) (_3!463 lt!249994)))))

(declare-fun lt!250003 () tuple2!14448)

(assert (=> b!158421 (= lt!250003 (readByte!0 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)))))

(declare-fun lt!250004 () array!7362)

(assert (=> b!158421 (= lt!250004 (array!7363 (store (arr!4248 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7688 lt!250003)) (size!3339 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)))))))

(declare-fun lt!249997 () (_ BitVec 64))

(assert (=> b!158421 (= lt!249997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!250015 () (_ BitVec 32))

(assert (=> b!158421 (= lt!250015 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!250005 () Unit!10580)

(assert (=> b!158421 (= lt!250005 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001) (_2!7688 lt!250003) lt!249997 lt!250015))))

(assert (=> b!158421 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3339 (buf!3801 (_2!7688 lt!250003)))) ((_ sign_extend 32) (currentByte!6980 (_2!7688 lt!250003))) ((_ sign_extend 32) (currentBit!6975 (_2!7688 lt!250003))) (bvsub lt!250015 ((_ extract 31 0) (bvsdiv (bvadd lt!249997 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!250008 () Unit!10580)

(assert (=> b!158421 (= lt!250008 lt!250005)))

(assert (=> b!158421 (= lt!249994 (readByteArrayLoop!0 (_2!7688 lt!250003) lt!250004 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!158421 (= (bitIndex!0 (size!3339 (buf!3801 (_2!7688 lt!250003))) (currentByte!6980 (_2!7688 lt!250003)) (currentBit!6975 (_2!7688 lt!250003))) (bvadd (bitIndex!0 (size!3339 (buf!3801 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001))) (currentByte!6980 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)) (currentBit!6975 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!250017 () Unit!10580)

(declare-fun Unit!10628 () Unit!10580)

(assert (=> b!158421 (= lt!250017 Unit!10628)))

(declare-fun call!2670 () (_ BitVec 64))

(assert (=> b!158421 (= (bvadd (bitIndex!0 (size!3339 (buf!3801 (_2!7688 lt!250003))) (currentByte!6980 (_2!7688 lt!250003)) (currentBit!6975 (_2!7688 lt!250003))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2670)))

(declare-fun lt!250014 () Unit!10580)

(declare-fun Unit!10629 () Unit!10580)

(assert (=> b!158421 (= lt!250014 Unit!10629)))

(assert (=> b!158421 (= (bvadd (bitIndex!0 (size!3339 (buf!3801 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001))) (currentByte!6980 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)) (currentBit!6975 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2670)))

(declare-fun lt!250007 () Unit!10580)

(declare-fun Unit!10630 () Unit!10580)

(assert (=> b!158421 (= lt!250007 Unit!10630)))

(assert (=> b!158421 (and (= (buf!3801 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)) (buf!3801 (_2!7687 lt!249994))) (= (size!3339 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))) (size!3339 (_3!463 lt!249994))))))

(declare-fun lt!249998 () Unit!10580)

(declare-fun Unit!10631 () Unit!10580)

(assert (=> b!158421 (= lt!249998 Unit!10631)))

(declare-fun lt!250012 () Unit!10580)

(assert (=> b!158421 (= lt!250012 (arrayUpdatedAtPrefixLemma!54 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7688 lt!250003)))))

(assert (=> b!158421 (arrayRangesEq!445 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) (array!7363 (store (arr!4248 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7688 lt!250003)) (size!3339 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!250009 () Unit!10580)

(assert (=> b!158421 (= lt!250009 lt!250012)))

(declare-fun lt!250020 () (_ BitVec 32))

(assert (=> b!158421 (= lt!250020 #b00000000000000000000000000000000)))

(declare-fun lt!249996 () Unit!10580)

(assert (=> b!158421 (= lt!249996 (arrayRangesEqTransitive!119 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) lt!250004 (_3!463 lt!249994) lt!250020 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2671 () Bool)

(assert (=> b!158421 call!2671))

(declare-fun lt!250027 () Unit!10580)

(assert (=> b!158421 (= lt!250027 lt!249996)))

(declare-fun call!2672 () Bool)

(assert (=> b!158421 call!2672))

(declare-fun lt!250021 () Unit!10580)

(declare-fun Unit!10633 () Unit!10580)

(assert (=> b!158421 (= lt!250021 Unit!10633)))

(declare-fun lt!250002 () Unit!10580)

(assert (=> b!158421 (= lt!250002 (arrayRangesEqImpliesEq!63 lt!250004 (_3!463 lt!249994) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!158421 (= (select (store (arr!4248 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7688 lt!250003)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4248 (_3!463 lt!249994)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!250011 () Unit!10580)

(assert (=> b!158421 (= lt!250011 lt!250002)))

(declare-fun lt!250010 () Bool)

(assert (=> b!158421 (= lt!250010 (= (select (arr!4248 (_3!463 lt!249994)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7688 lt!250003)))))

(declare-fun Unit!10634 () Unit!10580)

(assert (=> b!158421 (= lt!250025 Unit!10634)))

(assert (=> b!158421 lt!250010))

(declare-fun b!158422 () Bool)

(declare-fun res!132348 () Bool)

(declare-fun e!107667 () Bool)

(assert (=> b!158422 (=> (not res!132348) (not e!107667))))

(declare-fun lt!250018 () tuple3!692)

(assert (=> b!158422 (= res!132348 (and (= (buf!3801 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)) (buf!3801 (_2!7687 lt!250018))) (= (size!3339 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))) (size!3339 (_3!463 lt!250018)))))))

(declare-fun d!53091 () Bool)

(declare-fun e!107669 () Bool)

(assert (=> d!53091 e!107669))

(declare-fun res!132346 () Bool)

(assert (=> d!53091 (=> res!132346 e!107669)))

(assert (=> d!53091 (= res!132346 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!250019 () Bool)

(assert (=> d!53091 (= lt!250019 e!107667)))

(declare-fun res!132347 () Bool)

(assert (=> d!53091 (=> (not res!132347) (not e!107667))))

(declare-fun lt!250026 () (_ BitVec 64))

(declare-fun lt!249999 () (_ BitVec 64))

(assert (=> d!53091 (= res!132347 (= (bvadd lt!249999 lt!250026) (bitIndex!0 (size!3339 (buf!3801 (_2!7687 lt!250018))) (currentByte!6980 (_2!7687 lt!250018)) (currentBit!6975 (_2!7687 lt!250018)))))))

(assert (=> d!53091 (or (not (= (bvand lt!249999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!250026 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!249999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!249999 lt!250026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!250022 () (_ BitVec 64))

(assert (=> d!53091 (= lt!250026 (bvmul lt!250022 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!53091 (or (= lt!250022 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!250022 #b0000000000000000000000000000000000000000000000000000000000001000) lt!250022)))))

(assert (=> d!53091 (= lt!250022 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!53091 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!53091 (= lt!249999 (bitIndex!0 (size!3339 (buf!3801 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001))) (currentByte!6980 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)) (currentBit!6975 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001))))))

(assert (=> d!53091 (= lt!250018 e!107668)))

(declare-fun c!8412 () Bool)

(assert (=> d!53091 (= c!8412 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!53091 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3339 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)))))))

(assert (=> d!53091 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001) (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!250018)))

(declare-fun bm!2667 () Bool)

(assert (=> bm!2667 (= call!2670 (bitIndex!0 (ite c!8412 (size!3339 (buf!3801 (_2!7687 lt!249994))) (size!3339 (buf!3801 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)))) (ite c!8412 (currentByte!6980 (_2!7687 lt!249994)) (currentByte!6980 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001))) (ite c!8412 (currentBit!6975 (_2!7687 lt!249994)) (currentBit!6975 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)))))))

(declare-fun b!158423 () Bool)

(assert (=> b!158423 (= e!107667 (arrayRangesEq!445 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) (_3!463 lt!250018) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!250023 () (_ BitVec 32))

(declare-fun bm!2668 () Bool)

(declare-fun lt!249992 () array!7362)

(declare-fun lt!250013 () (_ BitVec 32))

(declare-fun lt!250000 () array!7362)

(assert (=> bm!2668 (= call!2671 (arrayRangesEq!445 (ite c!8412 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) lt!250000) (ite c!8412 (_3!463 lt!249994) lt!249992) (ite c!8412 lt!250020 lt!250023) (ite c!8412 (bvadd #b00000000000000000000000000000010 from!240) lt!250013)))))

(declare-fun b!158424 () Bool)

(assert (=> b!158424 (= e!107669 (= (select (arr!4248 (_3!463 lt!250018)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7678 (readBytePure!0 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001)))))))

(assert (=> b!158424 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3339 (_3!463 lt!250018))))))

(declare-fun bm!2669 () Bool)

(assert (=> bm!2669 (= call!2672 (arrayRangesEq!445 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)) (ite c!8412 (_3!463 lt!249994) (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))) #b00000000000000000000000000000000 (ite c!8412 (bvadd #b00000000000000000000000000000010 from!240) (size!3339 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))))))))

(declare-fun lt!249993 () Unit!10580)

(declare-fun b!158425 () Bool)

(assert (=> b!158425 (= e!107668 (tuple3!693 lt!249993 (withMovedByteIndex!0 lt!249445 #b00000000000000000000000000000001) (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))))))

(assert (=> b!158425 (= call!2670 call!2670)))

(declare-fun lt!250006 () Unit!10580)

(declare-fun Unit!10640 () Unit!10580)

(assert (=> b!158425 (= lt!250006 Unit!10640)))

(declare-fun lt!250016 () Unit!10580)

(assert (=> b!158425 (= lt!250016 (arrayRangesEqReflexiveLemma!54 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))))))

(assert (=> b!158425 call!2672))

(declare-fun lt!250024 () Unit!10580)

(assert (=> b!158425 (= lt!250024 lt!250016)))

(assert (=> b!158425 (= lt!250000 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)))))

(assert (=> b!158425 (= lt!249992 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153)))))

(declare-fun lt!250001 () (_ BitVec 32))

(assert (=> b!158425 (= lt!250001 #b00000000000000000000000000000000)))

(declare-fun lt!249995 () (_ BitVec 32))

(assert (=> b!158425 (= lt!249995 (size!3339 (array!7363 (store (store (arr!4248 arr!153) from!240 (_2!7678 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7678 lt!249446)) (size!3339 arr!153))))))

(assert (=> b!158425 (= lt!250023 #b00000000000000000000000000000000)))

(assert (=> b!158425 (= lt!250013 (bvadd #b00000000000000000000000000000010 from!240))))

(assert (=> b!158425 (= lt!249993 (arrayRangesEqSlicedLemma!54 lt!250000 lt!249992 lt!250001 lt!249995 lt!250023 lt!250013))))

(assert (=> b!158425 call!2671))

(assert (= (and d!53091 c!8412) b!158421))

(assert (= (and d!53091 (not c!8412)) b!158425))

(assert (= (or b!158421 b!158425) bm!2668))

(assert (= (or b!158421 b!158425) bm!2669))

(assert (= (or b!158421 b!158425) bm!2667))

(assert (= (and d!53091 res!132347) b!158422))

(assert (= (and b!158422 res!132348) b!158423))

(assert (= (and d!53091 (not res!132346)) b!158424))

(declare-fun m!248719 () Bool)

(assert (=> d!53091 m!248719))

(declare-fun m!248721 () Bool)

(assert (=> d!53091 m!248721))

(declare-fun m!248723 () Bool)

(assert (=> bm!2668 m!248723))

(declare-fun m!248725 () Bool)

(assert (=> b!158425 m!248725))

(declare-fun m!248727 () Bool)

(assert (=> b!158425 m!248727))

(declare-fun m!248729 () Bool)

(assert (=> b!158424 m!248729))

(assert (=> b!158424 m!248185))

(declare-fun m!248731 () Bool)

(assert (=> b!158424 m!248731))

(declare-fun m!248733 () Bool)

(assert (=> bm!2667 m!248733))

(declare-fun m!248735 () Bool)

(assert (=> b!158421 m!248735))

(declare-fun m!248737 () Bool)

(assert (=> b!158421 m!248737))

(assert (=> b!158421 m!248185))

(declare-fun m!248739 () Bool)

(assert (=> b!158421 m!248739))

(declare-fun m!248741 () Bool)

(assert (=> b!158421 m!248741))

(declare-fun m!248743 () Bool)

(assert (=> b!158421 m!248743))

(assert (=> b!158421 m!248721))

(declare-fun m!248745 () Bool)

(assert (=> b!158421 m!248745))

(assert (=> b!158421 m!248185))

(declare-fun m!248747 () Bool)

(assert (=> b!158421 m!248747))

(declare-fun m!248749 () Bool)

(assert (=> b!158421 m!248749))

(declare-fun m!248751 () Bool)

(assert (=> b!158421 m!248751))

(declare-fun m!248753 () Bool)

(assert (=> b!158421 m!248753))

(declare-fun m!248755 () Bool)

(assert (=> b!158421 m!248755))

(declare-fun m!248757 () Bool)

(assert (=> b!158421 m!248757))

(declare-fun m!248759 () Bool)

(assert (=> b!158423 m!248759))

(declare-fun m!248761 () Bool)

(assert (=> bm!2669 m!248761))

(assert (=> d!52984 d!53091))

(declare-fun d!53093 () Bool)

(declare-fun e!107670 () Bool)

(assert (=> d!53093 e!107670))

(declare-fun res!132349 () Bool)

(assert (=> d!53093 (=> (not res!132349) (not e!107670))))

(assert (=> d!53093 (= res!132349 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10642 () Unit!10580)

(assert (=> d!53093 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14451 Unit!10642 (BitStream!5855 (buf!3801 bs!65) (bvadd (currentByte!6980 bs!65) #b00000000000000000000000000000001) (currentBit!6975 bs!65))))))

(declare-fun b!158426 () Bool)

(assert (=> b!158426 (= e!107670 (and (or (not (= (bvand (currentByte!6980 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6980 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6980 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6980 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6980 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!53093 res!132349) b!158426))

(declare-fun m!248763 () Bool)

(assert (=> d!53093 m!248763))

(assert (=> d!52959 d!53093))

(push 1)

(assert (not bm!2663))

(assert (not d!53030))

(assert (not b!158333))

(assert (not bm!2669))

(assert (not bm!2664))

(assert (not b!158414))

(assert (not bm!2662))

(assert (not bm!2666))

(assert (not b!158424))

(assert (not b!158416))

(assert (not b!158412))

(assert (not d!53016))

(assert (not b!158420))

(assert (not d!53093))

(assert (not b!158341))

(assert (not bm!2667))

(assert (not d!53087))

(assert (not d!53012))

(assert (not b!158417))

(assert (not b!158425))

(assert (not bm!2661))

(assert (not bm!2665))

(assert (not d!53089))

(assert (not b!158411))

(assert (not b!158343))

(assert (not d!53024))

(assert (not b!158409))

(assert (not d!53091))

(assert (not d!53020))

(assert (not d!53034))

(assert (not b!158413))

(assert (not b!158421))

(assert (not b!158423))

(assert (not b!158335))

(assert (not d!53010))

(assert (not b!158418))

(assert (not bm!2668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

