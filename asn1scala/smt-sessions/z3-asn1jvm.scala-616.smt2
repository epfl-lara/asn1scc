; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17472 () Bool)

(assert start!17472)

(declare-fun b!84220 () Bool)

(declare-fun e!56312 () Bool)

(declare-fun e!56313 () Bool)

(assert (=> b!84220 (= e!56312 e!56313)))

(declare-fun res!69136 () Bool)

(assert (=> b!84220 (=> (not res!69136) (not e!56313))))

(declare-datatypes ((Unit!5644 0))(
  ( (Unit!5645) )
))
(declare-datatypes ((array!3989 0))(
  ( (array!3990 (arr!2443 (Array (_ BitVec 32) (_ BitVec 8))) (size!1806 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3174 0))(
  ( (BitStream!3175 (buf!2196 array!3989) (currentByte!4354 (_ BitVec 32)) (currentBit!4349 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!360 0))(
  ( (tuple3!361 (_1!3818 Unit!5644) (_2!3818 BitStream!3174) (_3!204 (_ BitVec 32))) )
))
(declare-fun lt!134175 () tuple3!360)

(declare-fun thiss!1136 () BitStream!3174)

(assert (=> b!84220 (= res!69136 (= (size!1806 (buf!2196 (_2!3818 lt!134175))) (size!1806 (buf!2196 thiss!1136))))))

(declare-fun e!56311 () tuple3!360)

(assert (=> b!84220 (= lt!134175 e!56311)))

(declare-fun c!5792 () Bool)

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> b!84220 (= c!5792 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84221 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84221 (= e!56313 (not (invariant!0 (currentBit!4349 (_2!3818 lt!134175)) (currentByte!4354 (_2!3818 lt!134175)) (size!1806 (buf!2196 (_2!3818 lt!134175))))))))

(declare-fun res!69135 () Bool)

(assert (=> start!17472 (=> (not res!69135) (not e!56312))))

(assert (=> start!17472 (= res!69135 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17472 e!56312))

(assert (=> start!17472 true))

(declare-fun e!56309 () Bool)

(declare-fun inv!12 (BitStream!3174) Bool)

(assert (=> start!17472 (and (inv!12 thiss!1136) e!56309)))

(declare-fun b!84222 () Bool)

(declare-fun array_inv!1652 (array!3989) Bool)

(assert (=> b!84222 (= e!56309 (array_inv!1652 (buf!2196 thiss!1136)))))

(declare-fun b!84223 () Bool)

(declare-fun v!176 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3174 (_ BitVec 64) BitStream!3174 (_ BitVec 32)) tuple3!360)

(assert (=> b!84223 (= e!56311 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84224 () Bool)

(declare-fun Unit!5646 () Unit!5644)

(assert (=> b!84224 (= e!56311 (tuple3!361 Unit!5646 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84225 () Bool)

(declare-fun res!69133 () Bool)

(assert (=> b!84225 (=> (not res!69133) (not e!56312))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84225 (= res!69133 (validate_offset_bits!1 ((_ sign_extend 32) (size!1806 (buf!2196 thiss!1136))) ((_ sign_extend 32) (currentByte!4354 thiss!1136)) ((_ sign_extend 32) (currentBit!4349 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84226 () Bool)

(declare-fun res!69134 () Bool)

(assert (=> b!84226 (=> (not res!69134) (not e!56312))))

(assert (=> b!84226 (= res!69134 (invariant!0 (currentBit!4349 thiss!1136) (currentByte!4354 thiss!1136) (size!1806 (buf!2196 thiss!1136))))))

(assert (= (and start!17472 res!69135) b!84225))

(assert (= (and b!84225 res!69133) b!84226))

(assert (= (and b!84226 res!69134) b!84220))

(assert (= (and b!84220 c!5792) b!84223))

(assert (= (and b!84220 (not c!5792)) b!84224))

(assert (= (and b!84220 res!69136) b!84221))

(assert (= start!17472 b!84222))

(declare-fun m!130889 () Bool)

(assert (=> b!84223 m!130889))

(declare-fun m!130891 () Bool)

(assert (=> b!84226 m!130891))

(declare-fun m!130893 () Bool)

(assert (=> start!17472 m!130893))

(declare-fun m!130895 () Bool)

(assert (=> b!84221 m!130895))

(declare-fun m!130897 () Bool)

(assert (=> b!84222 m!130897))

(declare-fun m!130899 () Bool)

(assert (=> b!84225 m!130899))

(check-sat (not b!84222) (not b!84226) (not b!84223) (not b!84225) (not b!84221) (not start!17472))
(check-sat)
(get-model)

(declare-fun d!27104 () Bool)

(assert (=> d!27104 (= (array_inv!1652 (buf!2196 thiss!1136)) (bvsge (size!1806 (buf!2196 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84222 d!27104))

(declare-fun d!27108 () Bool)

(assert (=> d!27108 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4349 thiss!1136) (currentByte!4354 thiss!1136) (size!1806 (buf!2196 thiss!1136))))))

(declare-fun bs!6707 () Bool)

(assert (= bs!6707 d!27108))

(assert (=> bs!6707 m!130891))

(assert (=> start!17472 d!27108))

(declare-fun d!27110 () Bool)

(assert (=> d!27110 (= (invariant!0 (currentBit!4349 (_2!3818 lt!134175)) (currentByte!4354 (_2!3818 lt!134175)) (size!1806 (buf!2196 (_2!3818 lt!134175)))) (and (bvsge (currentBit!4349 (_2!3818 lt!134175)) #b00000000000000000000000000000000) (bvslt (currentBit!4349 (_2!3818 lt!134175)) #b00000000000000000000000000001000) (bvsge (currentByte!4354 (_2!3818 lt!134175)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4354 (_2!3818 lt!134175)) (size!1806 (buf!2196 (_2!3818 lt!134175)))) (and (= (currentBit!4349 (_2!3818 lt!134175)) #b00000000000000000000000000000000) (= (currentByte!4354 (_2!3818 lt!134175)) (size!1806 (buf!2196 (_2!3818 lt!134175))))))))))

(assert (=> b!84221 d!27110))

(declare-fun d!27116 () Bool)

(assert (=> d!27116 (= (invariant!0 (currentBit!4349 thiss!1136) (currentByte!4354 thiss!1136) (size!1806 (buf!2196 thiss!1136))) (and (bvsge (currentBit!4349 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4349 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4354 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4354 thiss!1136) (size!1806 (buf!2196 thiss!1136))) (and (= (currentBit!4349 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4354 thiss!1136) (size!1806 (buf!2196 thiss!1136)))))))))

(assert (=> b!84226 d!27116))

(declare-fun d!27118 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1806 (buf!2196 thiss!1136))) ((_ sign_extend 32) (currentByte!4354 thiss!1136)) ((_ sign_extend 32) (currentBit!4349 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1806 (buf!2196 thiss!1136))) ((_ sign_extend 32) (currentByte!4354 thiss!1136)) ((_ sign_extend 32) (currentBit!4349 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6709 () Bool)

(assert (= bs!6709 d!27118))

(declare-fun m!130915 () Bool)

(assert (=> bs!6709 m!130915))

(assert (=> b!84225 d!27118))

(declare-fun b!84376 () Bool)

(declare-fun res!69261 () Bool)

(declare-fun e!56371 () Bool)

(assert (=> b!84376 (=> (not res!69261) (not e!56371))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84376 (= res!69261 (= (bitIndex!0 (size!1806 (buf!2196 thiss!1136)) (currentByte!4354 thiss!1136) (currentBit!4349 thiss!1136)) (bvadd (bitIndex!0 (size!1806 (buf!2196 thiss!1136)) (currentByte!4354 thiss!1136) (currentBit!4349 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun d!27124 () Bool)

(declare-fun e!56373 () Bool)

(assert (=> d!27124 e!56373))

(declare-fun res!69274 () Bool)

(assert (=> d!27124 (=> (not res!69274) (not e!56373))))

(declare-fun lt!134247 () tuple3!360)

(assert (=> d!27124 (= res!69274 (bvsge (_3!204 lt!134247) #b00000000000000000000000000000000))))

(declare-fun e!56369 () tuple3!360)

(assert (=> d!27124 (= lt!134247 e!56369)))

(declare-fun c!5804 () Bool)

(declare-fun lt!134248 () (_ BitVec 32))

(assert (=> d!27124 (= c!5804 (bvslt lt!134248 nBits!333))))

(assert (=> d!27124 (= lt!134248 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!7234 0))(
  ( (tuple2!7235 (_1!3823 Unit!5644) (_2!3823 BitStream!3174)) )
))
(declare-fun lt!134246 () tuple2!7234)

(declare-fun lt!134250 () tuple2!7234)

(assert (=> d!27124 (= lt!134246 lt!134250)))

(declare-fun e!56372 () Bool)

(assert (=> d!27124 e!56372))

(declare-fun res!69263 () Bool)

(assert (=> d!27124 (=> (not res!69263) (not e!56372))))

(assert (=> d!27124 (= res!69263 (= (size!1806 (buf!2196 thiss!1136)) (size!1806 (buf!2196 (_2!3823 lt!134250)))))))

(declare-fun lt!134244 () Bool)

(declare-fun appendBit!0 (BitStream!3174 Bool) tuple2!7234)

(assert (=> d!27124 (= lt!134250 (appendBit!0 thiss!1136 lt!134244))))

(assert (=> d!27124 (= lt!134244 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27124 e!56371))

(declare-fun res!69259 () Bool)

(assert (=> d!27124 (=> (not res!69259) (not e!56371))))

(assert (=> d!27124 (= res!69259 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27124 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134247)))

(declare-fun b!84377 () Bool)

(declare-fun res!69267 () Bool)

(assert (=> b!84377 (=> (not res!69267) (not e!56371))))

(assert (=> b!84377 (= res!69267 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1806 (buf!2196 thiss!1136)) (size!1806 (buf!2196 thiss!1136)))))))

(declare-fun b!84378 () Bool)

(declare-fun res!69269 () Bool)

(assert (=> b!84378 (=> (not res!69269) (not e!56371))))

(assert (=> b!84378 (= res!69269 (validate_offset_bits!1 ((_ sign_extend 32) (size!1806 (buf!2196 thiss!1136))) ((_ sign_extend 32) (currentByte!4354 thiss!1136)) ((_ sign_extend 32) (currentBit!4349 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun b!84379 () Bool)

(declare-fun res!69265 () Bool)

(assert (=> b!84379 (=> (not res!69265) (not e!56372))))

(declare-fun isPrefixOf!0 (BitStream!3174 BitStream!3174) Bool)

(assert (=> b!84379 (= res!69265 (isPrefixOf!0 thiss!1136 (_2!3823 lt!134250)))))

(declare-fun b!84380 () Bool)

(declare-fun res!69273 () Bool)

(assert (=> b!84380 (=> (not res!69273) (not e!56373))))

(assert (=> b!84380 (= res!69273 (validate_offset_bits!1 ((_ sign_extend 32) (size!1806 (buf!2196 (_2!3818 lt!134247)))) ((_ sign_extend 32) (currentByte!4354 (_2!3818 lt!134247))) ((_ sign_extend 32) (currentBit!4349 (_2!3818 lt!134247))) ((_ sign_extend 32) (bvsub nBits!333 (_3!204 lt!134247)))))))

(assert (=> b!84380 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!204 lt!134247) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!204 lt!134247)) #b10000000000000000000000000000000)))))

(declare-fun b!84381 () Bool)

(declare-fun e!56370 () Bool)

(declare-datatypes ((tuple2!7238 0))(
  ( (tuple2!7239 (_1!3825 BitStream!3174) (_2!3825 Bool)) )
))
(declare-fun lt!134245 () tuple2!7238)

(assert (=> b!84381 (= e!56370 (= (bitIndex!0 (size!1806 (buf!2196 (_1!3825 lt!134245))) (currentByte!4354 (_1!3825 lt!134245)) (currentBit!4349 (_1!3825 lt!134245))) (bitIndex!0 (size!1806 (buf!2196 (_2!3823 lt!134250))) (currentByte!4354 (_2!3823 lt!134250)) (currentBit!4349 (_2!3823 lt!134250)))))))

(declare-fun b!84382 () Bool)

(assert (=> b!84382 (= e!56371 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84383 () Bool)

(declare-fun res!69271 () Bool)

(assert (=> b!84383 (=> (not res!69271) (not e!56372))))

(assert (=> b!84383 (= res!69271 (= (bitIndex!0 (size!1806 (buf!2196 (_2!3823 lt!134250))) (currentByte!4354 (_2!3823 lt!134250)) (currentBit!4349 (_2!3823 lt!134250))) (bvadd (bitIndex!0 (size!1806 (buf!2196 thiss!1136)) (currentByte!4354 thiss!1136) (currentBit!4349 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84384 () Bool)

(declare-fun res!69268 () Bool)

(assert (=> b!84384 (=> (not res!69268) (not e!56371))))

(assert (=> b!84384 (= res!69268 (invariant!0 (currentBit!4349 thiss!1136) (currentByte!4354 thiss!1136) (size!1806 (buf!2196 thiss!1136))))))

(declare-fun b!84385 () Bool)

(declare-fun res!69272 () Bool)

(assert (=> b!84385 (=> (not res!69272) (not e!56373))))

(assert (=> b!84385 (= res!69272 (invariant!0 (currentBit!4349 (_2!3818 lt!134247)) (currentByte!4354 (_2!3818 lt!134247)) (size!1806 (buf!2196 (_2!3818 lt!134247)))))))

(declare-fun b!84386 () Bool)

(assert (=> b!84386 (= e!56372 e!56370)))

(declare-fun res!69264 () Bool)

(assert (=> b!84386 (=> (not res!69264) (not e!56370))))

(assert (=> b!84386 (= res!69264 (and (= (_2!3825 lt!134245) lt!134244) (= (_1!3825 lt!134245) (_2!3823 lt!134250))))))

(declare-fun readBitPure!0 (BitStream!3174) tuple2!7238)

(declare-fun readerFrom!0 (BitStream!3174 (_ BitVec 32) (_ BitVec 32)) BitStream!3174)

(assert (=> b!84386 (= lt!134245 (readBitPure!0 (readerFrom!0 (_2!3823 lt!134250) (currentBit!4349 thiss!1136) (currentByte!4354 thiss!1136))))))

(declare-fun b!84387 () Bool)

(declare-fun res!69266 () Bool)

(assert (=> b!84387 (=> (not res!69266) (not e!56373))))

(declare-fun lt!134249 () (_ BitVec 64))

(declare-fun lt!134242 () (_ BitVec 64))

(assert (=> b!84387 (= res!69266 (= (bitIndex!0 (size!1806 (buf!2196 (_2!3818 lt!134247))) (currentByte!4354 (_2!3818 lt!134247)) (currentBit!4349 (_2!3818 lt!134247))) (bvadd lt!134249 lt!134242)))))

(assert (=> b!84387 (or (not (= (bvand lt!134249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134242 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134249 lt!134242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84387 (= lt!134242 ((_ sign_extend 32) (_3!204 lt!134247)))))

(assert (=> b!84387 (= lt!134249 (bitIndex!0 (size!1806 (buf!2196 thiss!1136)) (currentByte!4354 thiss!1136) (currentBit!4349 thiss!1136)))))

(declare-fun b!84388 () Bool)

(assert (=> b!84388 (= e!56373 (bvsge (_3!204 lt!134247) nBits!333))))

(declare-fun b!84389 () Bool)

(declare-fun res!69270 () Bool)

(assert (=> b!84389 (=> (not res!69270) (not e!56373))))

(assert (=> b!84389 (= res!69270 (and (bvsle (_3!204 lt!134247) nBits!333) (= (size!1806 (buf!2196 (_2!3818 lt!134247))) (size!1806 (buf!2196 thiss!1136)))))))

(declare-fun b!84390 () Bool)

(assert (=> b!84390 (= e!56369 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3823 lt!134246) lt!134248))))

(declare-fun b!84391 () Bool)

(declare-fun Unit!5652 () Unit!5644)

(assert (=> b!84391 (= e!56369 (tuple3!361 Unit!5652 (_2!3823 lt!134246) lt!134248))))

(assert (= (and d!27124 res!69259) b!84384))

(assert (= (and b!84384 res!69268) b!84377))

(assert (= (and b!84377 res!69267) b!84376))

(assert (= (and b!84376 res!69261) b!84378))

(assert (= (and b!84378 res!69269) b!84382))

(assert (= (and d!27124 res!69263) b!84383))

(assert (= (and b!84383 res!69271) b!84379))

(assert (= (and b!84379 res!69265) b!84386))

(assert (= (and b!84386 res!69264) b!84381))

(assert (= (and d!27124 c!5804) b!84390))

(assert (= (and d!27124 (not c!5804)) b!84391))

(assert (= (and d!27124 res!69274) b!84385))

(assert (= (and b!84385 res!69272) b!84389))

(assert (= (and b!84389 res!69270) b!84387))

(assert (= (and b!84387 res!69266) b!84380))

(assert (= (and b!84380 res!69273) b!84388))

(declare-fun m!130945 () Bool)

(assert (=> b!84381 m!130945))

(declare-fun m!130951 () Bool)

(assert (=> b!84381 m!130951))

(declare-fun m!130955 () Bool)

(assert (=> b!84385 m!130955))

(assert (=> b!84384 m!130891))

(declare-fun m!130959 () Bool)

(assert (=> b!84387 m!130959))

(declare-fun m!130961 () Bool)

(assert (=> b!84387 m!130961))

(declare-fun m!130965 () Bool)

(assert (=> b!84378 m!130965))

(assert (=> b!84376 m!130961))

(assert (=> b!84376 m!130961))

(declare-fun m!130971 () Bool)

(assert (=> b!84379 m!130971))

(declare-fun m!130973 () Bool)

(assert (=> d!27124 m!130973))

(assert (=> b!84383 m!130951))

(assert (=> b!84383 m!130961))

(declare-fun m!130981 () Bool)

(assert (=> b!84390 m!130981))

(declare-fun m!130983 () Bool)

(assert (=> b!84380 m!130983))

(declare-fun m!130985 () Bool)

(assert (=> b!84386 m!130985))

(assert (=> b!84386 m!130985))

(declare-fun m!130989 () Bool)

(assert (=> b!84386 m!130989))

(assert (=> b!84223 d!27124))

(check-sat (not b!84376) (not b!84390) (not b!84380) (not b!84383) (not b!84385) (not d!27124) (not b!84381) (not d!27108) (not b!84384) (not d!27118) (not b!84379) (not b!84387) (not b!84378) (not b!84386))
(check-sat)
