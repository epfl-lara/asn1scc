; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39172 () Bool)

(assert start!39172)

(declare-fun b!176253 () Bool)

(declare-fun e!122876 () Bool)

(declare-fun e!122878 () Bool)

(assert (=> b!176253 (= e!122876 e!122878)))

(declare-fun res!145987 () Bool)

(assert (=> b!176253 (=> (not res!145987) (not e!122878))))

(declare-fun lt!271492 () (_ BitVec 64))

(declare-fun lt!271489 () (_ BitVec 64))

(assert (=> b!176253 (= res!145987 (= lt!271492 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271489)))))

(declare-datatypes ((array!9517 0))(
  ( (array!9518 (arr!5129 (Array (_ BitVec 32) (_ BitVec 8))) (size!4199 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7506 0))(
  ( (BitStream!7507 (buf!4642 array!9517) (currentByte!8786 (_ BitVec 32)) (currentBit!8781 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12712 0))(
  ( (Unit!12713) )
))
(declare-datatypes ((tuple2!15170 0))(
  ( (tuple2!15171 (_1!8230 Unit!12712) (_2!8230 BitStream!7506)) )
))
(declare-fun lt!271490 () tuple2!15170)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176253 (= lt!271492 (bitIndex!0 (size!4199 (buf!4642 (_2!8230 lt!271490))) (currentByte!8786 (_2!8230 lt!271490)) (currentBit!8781 (_2!8230 lt!271490))))))

(declare-fun thiss!1204 () BitStream!7506)

(assert (=> b!176253 (= lt!271489 (bitIndex!0 (size!4199 (buf!4642 thiss!1204)) (currentByte!8786 thiss!1204) (currentBit!8781 thiss!1204)))))

(declare-fun b!176254 () Bool)

(declare-fun res!145992 () Bool)

(assert (=> b!176254 (=> (not res!145992) (not e!122878))))

(declare-fun isPrefixOf!0 (BitStream!7506 BitStream!7506) Bool)

(assert (=> b!176254 (= res!145992 (isPrefixOf!0 thiss!1204 (_2!8230 lt!271490)))))

(declare-fun res!145986 () Bool)

(declare-fun e!122880 () Bool)

(assert (=> start!39172 (=> (not res!145986) (not e!122880))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39172 (= res!145986 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39172 e!122880))

(assert (=> start!39172 true))

(declare-fun e!122875 () Bool)

(declare-fun inv!12 (BitStream!7506) Bool)

(assert (=> start!39172 (and (inv!12 thiss!1204) e!122875)))

(declare-fun b!176255 () Bool)

(declare-fun e!122881 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176255 (= e!122881 (invariant!0 (currentBit!8781 (_2!8230 lt!271490)) (currentByte!8786 (_2!8230 lt!271490)) (size!4199 (buf!4642 (_2!8230 lt!271490)))))))

(declare-fun b!176256 () Bool)

(declare-fun res!145991 () Bool)

(assert (=> b!176256 (=> (not res!145991) (not e!122880))))

(assert (=> b!176256 (= res!145991 (invariant!0 (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204) (size!4199 (buf!4642 thiss!1204))))))

(declare-fun b!176257 () Bool)

(declare-fun res!145984 () Bool)

(assert (=> b!176257 (=> (not res!145984) (not e!122880))))

(assert (=> b!176257 (= res!145984 (not (= i!590 nBits!348)))))

(declare-fun b!176258 () Bool)

(declare-fun array_inv!3940 (array!9517) Bool)

(assert (=> b!176258 (= e!122875 (array_inv!3940 (buf!4642 thiss!1204)))))

(declare-fun b!176259 () Bool)

(declare-fun e!122877 () Bool)

(assert (=> b!176259 (= e!122878 e!122877)))

(declare-fun res!145990 () Bool)

(assert (=> b!176259 (=> (not res!145990) (not e!122877))))

(declare-fun lt!271491 () Bool)

(declare-datatypes ((tuple2!15172 0))(
  ( (tuple2!15173 (_1!8231 BitStream!7506) (_2!8231 Bool)) )
))
(declare-fun lt!271493 () tuple2!15172)

(assert (=> b!176259 (= res!145990 (and (= (_2!8231 lt!271493) lt!271491) (= (_1!8231 lt!271493) (_2!8230 lt!271490))))))

(declare-fun readBitPure!0 (BitStream!7506) tuple2!15172)

(declare-fun readerFrom!0 (BitStream!7506 (_ BitVec 32) (_ BitVec 32)) BitStream!7506)

(assert (=> b!176259 (= lt!271493 (readBitPure!0 (readerFrom!0 (_2!8230 lt!271490) (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204))))))

(declare-fun b!176260 () Bool)

(assert (=> b!176260 (= e!122877 (= (bitIndex!0 (size!4199 (buf!4642 (_1!8231 lt!271493))) (currentByte!8786 (_1!8231 lt!271493)) (currentBit!8781 (_1!8231 lt!271493))) lt!271492))))

(declare-fun b!176261 () Bool)

(assert (=> b!176261 (= e!122880 (not e!122881))))

(declare-fun res!145989 () Bool)

(assert (=> b!176261 (=> res!145989 e!122881)))

(assert (=> b!176261 (= res!145989 (not (= (bitIndex!0 (size!4199 (buf!4642 (_2!8230 lt!271490))) (currentByte!8786 (_2!8230 lt!271490)) (currentBit!8781 (_2!8230 lt!271490))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4199 (buf!4642 thiss!1204)) (currentByte!8786 thiss!1204) (currentBit!8781 thiss!1204))))))))

(assert (=> b!176261 e!122876))

(declare-fun res!145988 () Bool)

(assert (=> b!176261 (=> (not res!145988) (not e!122876))))

(assert (=> b!176261 (= res!145988 (= (size!4199 (buf!4642 thiss!1204)) (size!4199 (buf!4642 (_2!8230 lt!271490)))))))

(declare-fun appendBit!0 (BitStream!7506 Bool) tuple2!15170)

(assert (=> b!176261 (= lt!271490 (appendBit!0 thiss!1204 lt!271491))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176261 (= lt!271491 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176262 () Bool)

(declare-fun res!145985 () Bool)

(assert (=> b!176262 (=> (not res!145985) (not e!122880))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176262 (= res!145985 (validate_offset_bits!1 ((_ sign_extend 32) (size!4199 (buf!4642 thiss!1204))) ((_ sign_extend 32) (currentByte!8786 thiss!1204)) ((_ sign_extend 32) (currentBit!8781 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!39172 res!145986) b!176262))

(assert (= (and b!176262 res!145985) b!176256))

(assert (= (and b!176256 res!145991) b!176257))

(assert (= (and b!176257 res!145984) b!176261))

(assert (= (and b!176261 res!145988) b!176253))

(assert (= (and b!176253 res!145987) b!176254))

(assert (= (and b!176254 res!145992) b!176259))

(assert (= (and b!176259 res!145990) b!176260))

(assert (= (and b!176261 (not res!145989)) b!176255))

(assert (= start!39172 b!176258))

(declare-fun m!276397 () Bool)

(assert (=> b!176253 m!276397))

(declare-fun m!276399 () Bool)

(assert (=> b!176253 m!276399))

(declare-fun m!276401 () Bool)

(assert (=> b!176255 m!276401))

(declare-fun m!276403 () Bool)

(assert (=> b!176259 m!276403))

(assert (=> b!176259 m!276403))

(declare-fun m!276405 () Bool)

(assert (=> b!176259 m!276405))

(declare-fun m!276407 () Bool)

(assert (=> b!176256 m!276407))

(declare-fun m!276409 () Bool)

(assert (=> b!176254 m!276409))

(declare-fun m!276411 () Bool)

(assert (=> b!176260 m!276411))

(declare-fun m!276413 () Bool)

(assert (=> start!39172 m!276413))

(assert (=> b!176261 m!276397))

(assert (=> b!176261 m!276399))

(declare-fun m!276415 () Bool)

(assert (=> b!176261 m!276415))

(declare-fun m!276417 () Bool)

(assert (=> b!176258 m!276417))

(declare-fun m!276419 () Bool)

(assert (=> b!176262 m!276419))

(check-sat (not start!39172) (not b!176258) (not b!176255) (not b!176256) (not b!176259) (not b!176254) (not b!176260) (not b!176261) (not b!176253) (not b!176262))
(check-sat)
(get-model)

(declare-fun d!62139 () Bool)

(declare-fun e!122905 () Bool)

(assert (=> d!62139 e!122905))

(declare-fun res!146025 () Bool)

(assert (=> d!62139 (=> (not res!146025) (not e!122905))))

(declare-fun lt!271522 () (_ BitVec 64))

(declare-fun lt!271524 () (_ BitVec 64))

(declare-fun lt!271525 () (_ BitVec 64))

(assert (=> d!62139 (= res!146025 (= lt!271524 (bvsub lt!271522 lt!271525)))))

(assert (=> d!62139 (or (= (bvand lt!271522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271522 lt!271525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62139 (= lt!271525 (remainingBits!0 ((_ sign_extend 32) (size!4199 (buf!4642 (_2!8230 lt!271490)))) ((_ sign_extend 32) (currentByte!8786 (_2!8230 lt!271490))) ((_ sign_extend 32) (currentBit!8781 (_2!8230 lt!271490)))))))

(declare-fun lt!271521 () (_ BitVec 64))

(declare-fun lt!271523 () (_ BitVec 64))

(assert (=> d!62139 (= lt!271522 (bvmul lt!271521 lt!271523))))

(assert (=> d!62139 (or (= lt!271521 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271523 (bvsdiv (bvmul lt!271521 lt!271523) lt!271521)))))

(assert (=> d!62139 (= lt!271523 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62139 (= lt!271521 ((_ sign_extend 32) (size!4199 (buf!4642 (_2!8230 lt!271490)))))))

(assert (=> d!62139 (= lt!271524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8786 (_2!8230 lt!271490))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8781 (_2!8230 lt!271490)))))))

(assert (=> d!62139 (invariant!0 (currentBit!8781 (_2!8230 lt!271490)) (currentByte!8786 (_2!8230 lt!271490)) (size!4199 (buf!4642 (_2!8230 lt!271490))))))

(assert (=> d!62139 (= (bitIndex!0 (size!4199 (buf!4642 (_2!8230 lt!271490))) (currentByte!8786 (_2!8230 lt!271490)) (currentBit!8781 (_2!8230 lt!271490))) lt!271524)))

(declare-fun b!176297 () Bool)

(declare-fun res!146024 () Bool)

(assert (=> b!176297 (=> (not res!146024) (not e!122905))))

(assert (=> b!176297 (= res!146024 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271524))))

(declare-fun b!176298 () Bool)

(declare-fun lt!271526 () (_ BitVec 64))

(assert (=> b!176298 (= e!122905 (bvsle lt!271524 (bvmul lt!271526 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176298 (or (= lt!271526 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271526 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271526)))))

(assert (=> b!176298 (= lt!271526 ((_ sign_extend 32) (size!4199 (buf!4642 (_2!8230 lt!271490)))))))

(assert (= (and d!62139 res!146025) b!176297))

(assert (= (and b!176297 res!146024) b!176298))

(declare-fun m!276445 () Bool)

(assert (=> d!62139 m!276445))

(assert (=> d!62139 m!276401))

(assert (=> b!176261 d!62139))

(declare-fun d!62141 () Bool)

(declare-fun e!122906 () Bool)

(assert (=> d!62141 e!122906))

(declare-fun res!146027 () Bool)

(assert (=> d!62141 (=> (not res!146027) (not e!122906))))

(declare-fun lt!271528 () (_ BitVec 64))

(declare-fun lt!271531 () (_ BitVec 64))

(declare-fun lt!271530 () (_ BitVec 64))

(assert (=> d!62141 (= res!146027 (= lt!271530 (bvsub lt!271528 lt!271531)))))

(assert (=> d!62141 (or (= (bvand lt!271528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271531 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271528 lt!271531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62141 (= lt!271531 (remainingBits!0 ((_ sign_extend 32) (size!4199 (buf!4642 thiss!1204))) ((_ sign_extend 32) (currentByte!8786 thiss!1204)) ((_ sign_extend 32) (currentBit!8781 thiss!1204))))))

(declare-fun lt!271527 () (_ BitVec 64))

(declare-fun lt!271529 () (_ BitVec 64))

(assert (=> d!62141 (= lt!271528 (bvmul lt!271527 lt!271529))))

(assert (=> d!62141 (or (= lt!271527 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271529 (bvsdiv (bvmul lt!271527 lt!271529) lt!271527)))))

(assert (=> d!62141 (= lt!271529 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62141 (= lt!271527 ((_ sign_extend 32) (size!4199 (buf!4642 thiss!1204))))))

(assert (=> d!62141 (= lt!271530 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8786 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8781 thiss!1204))))))

(assert (=> d!62141 (invariant!0 (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204) (size!4199 (buf!4642 thiss!1204)))))

(assert (=> d!62141 (= (bitIndex!0 (size!4199 (buf!4642 thiss!1204)) (currentByte!8786 thiss!1204) (currentBit!8781 thiss!1204)) lt!271530)))

(declare-fun b!176299 () Bool)

(declare-fun res!146026 () Bool)

(assert (=> b!176299 (=> (not res!146026) (not e!122906))))

(assert (=> b!176299 (= res!146026 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271530))))

(declare-fun b!176300 () Bool)

(declare-fun lt!271532 () (_ BitVec 64))

(assert (=> b!176300 (= e!122906 (bvsle lt!271530 (bvmul lt!271532 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176300 (or (= lt!271532 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271532 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271532)))))

(assert (=> b!176300 (= lt!271532 ((_ sign_extend 32) (size!4199 (buf!4642 thiss!1204))))))

(assert (= (and d!62141 res!146027) b!176299))

(assert (= (and b!176299 res!146026) b!176300))

(declare-fun m!276447 () Bool)

(assert (=> d!62141 m!276447))

(assert (=> d!62141 m!276407))

(assert (=> b!176261 d!62141))

(declare-fun b!176333 () Bool)

(declare-fun e!122924 () Bool)

(declare-fun lt!271568 () tuple2!15172)

(declare-fun lt!271570 () tuple2!15170)

(assert (=> b!176333 (= e!122924 (= (bitIndex!0 (size!4199 (buf!4642 (_1!8231 lt!271568))) (currentByte!8786 (_1!8231 lt!271568)) (currentBit!8781 (_1!8231 lt!271568))) (bitIndex!0 (size!4199 (buf!4642 (_2!8230 lt!271570))) (currentByte!8786 (_2!8230 lt!271570)) (currentBit!8781 (_2!8230 lt!271570)))))))

(declare-fun b!176330 () Bool)

(declare-fun res!146059 () Bool)

(declare-fun e!122925 () Bool)

(assert (=> b!176330 (=> (not res!146059) (not e!122925))))

(declare-fun lt!271569 () (_ BitVec 64))

(declare-fun lt!271571 () (_ BitVec 64))

(assert (=> b!176330 (= res!146059 (= (bitIndex!0 (size!4199 (buf!4642 (_2!8230 lt!271570))) (currentByte!8786 (_2!8230 lt!271570)) (currentBit!8781 (_2!8230 lt!271570))) (bvadd lt!271571 lt!271569)))))

(assert (=> b!176330 (or (not (= (bvand lt!271571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271569 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271571 lt!271569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176330 (= lt!271569 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176330 (= lt!271571 (bitIndex!0 (size!4199 (buf!4642 thiss!1204)) (currentByte!8786 thiss!1204) (currentBit!8781 thiss!1204)))))

(declare-fun b!176331 () Bool)

(declare-fun res!146060 () Bool)

(assert (=> b!176331 (=> (not res!146060) (not e!122925))))

(assert (=> b!176331 (= res!146060 (isPrefixOf!0 thiss!1204 (_2!8230 lt!271570)))))

(declare-fun d!62143 () Bool)

(assert (=> d!62143 e!122925))

(declare-fun res!146057 () Bool)

(assert (=> d!62143 (=> (not res!146057) (not e!122925))))

(assert (=> d!62143 (= res!146057 (= (size!4199 (buf!4642 thiss!1204)) (size!4199 (buf!4642 (_2!8230 lt!271570)))))))

(declare-fun choose!16 (BitStream!7506 Bool) tuple2!15170)

(assert (=> d!62143 (= lt!271570 (choose!16 thiss!1204 lt!271491))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62143 (validate_offset_bit!0 ((_ sign_extend 32) (size!4199 (buf!4642 thiss!1204))) ((_ sign_extend 32) (currentByte!8786 thiss!1204)) ((_ sign_extend 32) (currentBit!8781 thiss!1204)))))

(assert (=> d!62143 (= (appendBit!0 thiss!1204 lt!271491) lt!271570)))

(declare-fun b!176332 () Bool)

(assert (=> b!176332 (= e!122925 e!122924)))

(declare-fun res!146058 () Bool)

(assert (=> b!176332 (=> (not res!146058) (not e!122924))))

(assert (=> b!176332 (= res!146058 (and (= (_2!8231 lt!271568) lt!271491) (= (_1!8231 lt!271568) (_2!8230 lt!271570))))))

(assert (=> b!176332 (= lt!271568 (readBitPure!0 (readerFrom!0 (_2!8230 lt!271570) (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204))))))

(assert (= (and d!62143 res!146057) b!176330))

(assert (= (and b!176330 res!146059) b!176331))

(assert (= (and b!176331 res!146060) b!176332))

(assert (= (and b!176332 res!146058) b!176333))

(declare-fun m!276459 () Bool)

(assert (=> b!176331 m!276459))

(declare-fun m!276461 () Bool)

(assert (=> d!62143 m!276461))

(declare-fun m!276463 () Bool)

(assert (=> d!62143 m!276463))

(declare-fun m!276465 () Bool)

(assert (=> b!176333 m!276465))

(declare-fun m!276467 () Bool)

(assert (=> b!176333 m!276467))

(assert (=> b!176330 m!276467))

(assert (=> b!176330 m!276399))

(declare-fun m!276469 () Bool)

(assert (=> b!176332 m!276469))

(assert (=> b!176332 m!276469))

(declare-fun m!276471 () Bool)

(assert (=> b!176332 m!276471))

(assert (=> b!176261 d!62143))

(declare-fun d!62163 () Bool)

(assert (=> d!62163 (= (invariant!0 (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204) (size!4199 (buf!4642 thiss!1204))) (and (bvsge (currentBit!8781 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8781 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8786 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8786 thiss!1204) (size!4199 (buf!4642 thiss!1204))) (and (= (currentBit!8781 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8786 thiss!1204) (size!4199 (buf!4642 thiss!1204)))))))))

(assert (=> b!176256 d!62163))

(declare-fun d!62165 () Bool)

(assert (=> d!62165 (= (invariant!0 (currentBit!8781 (_2!8230 lt!271490)) (currentByte!8786 (_2!8230 lt!271490)) (size!4199 (buf!4642 (_2!8230 lt!271490)))) (and (bvsge (currentBit!8781 (_2!8230 lt!271490)) #b00000000000000000000000000000000) (bvslt (currentBit!8781 (_2!8230 lt!271490)) #b00000000000000000000000000001000) (bvsge (currentByte!8786 (_2!8230 lt!271490)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8786 (_2!8230 lt!271490)) (size!4199 (buf!4642 (_2!8230 lt!271490)))) (and (= (currentBit!8781 (_2!8230 lt!271490)) #b00000000000000000000000000000000) (= (currentByte!8786 (_2!8230 lt!271490)) (size!4199 (buf!4642 (_2!8230 lt!271490))))))))))

(assert (=> b!176255 d!62165))

(declare-fun d!62167 () Bool)

(assert (=> d!62167 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4199 (buf!4642 thiss!1204))) ((_ sign_extend 32) (currentByte!8786 thiss!1204)) ((_ sign_extend 32) (currentBit!8781 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4199 (buf!4642 thiss!1204))) ((_ sign_extend 32) (currentByte!8786 thiss!1204)) ((_ sign_extend 32) (currentBit!8781 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15512 () Bool)

(assert (= bs!15512 d!62167))

(assert (=> bs!15512 m!276447))

(assert (=> b!176262 d!62167))

(assert (=> b!176253 d!62139))

(assert (=> b!176253 d!62141))

(declare-fun d!62169 () Bool)

(assert (=> d!62169 (= (array_inv!3940 (buf!4642 thiss!1204)) (bvsge (size!4199 (buf!4642 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176258 d!62169))

(declare-fun d!62171 () Bool)

(assert (=> d!62171 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204) (size!4199 (buf!4642 thiss!1204))))))

(declare-fun bs!15513 () Bool)

(assert (= bs!15513 d!62171))

(assert (=> bs!15513 m!276407))

(assert (=> start!39172 d!62171))

(declare-fun d!62173 () Bool)

(declare-fun e!122926 () Bool)

(assert (=> d!62173 e!122926))

(declare-fun res!146062 () Bool)

(assert (=> d!62173 (=> (not res!146062) (not e!122926))))

(declare-fun lt!271573 () (_ BitVec 64))

(declare-fun lt!271576 () (_ BitVec 64))

(declare-fun lt!271575 () (_ BitVec 64))

(assert (=> d!62173 (= res!146062 (= lt!271575 (bvsub lt!271573 lt!271576)))))

(assert (=> d!62173 (or (= (bvand lt!271573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271576 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271573 lt!271576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62173 (= lt!271576 (remainingBits!0 ((_ sign_extend 32) (size!4199 (buf!4642 (_1!8231 lt!271493)))) ((_ sign_extend 32) (currentByte!8786 (_1!8231 lt!271493))) ((_ sign_extend 32) (currentBit!8781 (_1!8231 lt!271493)))))))

(declare-fun lt!271572 () (_ BitVec 64))

(declare-fun lt!271574 () (_ BitVec 64))

(assert (=> d!62173 (= lt!271573 (bvmul lt!271572 lt!271574))))

(assert (=> d!62173 (or (= lt!271572 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271574 (bvsdiv (bvmul lt!271572 lt!271574) lt!271572)))))

(assert (=> d!62173 (= lt!271574 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62173 (= lt!271572 ((_ sign_extend 32) (size!4199 (buf!4642 (_1!8231 lt!271493)))))))

(assert (=> d!62173 (= lt!271575 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8786 (_1!8231 lt!271493))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8781 (_1!8231 lt!271493)))))))

(assert (=> d!62173 (invariant!0 (currentBit!8781 (_1!8231 lt!271493)) (currentByte!8786 (_1!8231 lt!271493)) (size!4199 (buf!4642 (_1!8231 lt!271493))))))

(assert (=> d!62173 (= (bitIndex!0 (size!4199 (buf!4642 (_1!8231 lt!271493))) (currentByte!8786 (_1!8231 lt!271493)) (currentBit!8781 (_1!8231 lt!271493))) lt!271575)))

(declare-fun b!176334 () Bool)

(declare-fun res!146061 () Bool)

(assert (=> b!176334 (=> (not res!146061) (not e!122926))))

(assert (=> b!176334 (= res!146061 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271575))))

(declare-fun b!176335 () Bool)

(declare-fun lt!271577 () (_ BitVec 64))

(assert (=> b!176335 (= e!122926 (bvsle lt!271575 (bvmul lt!271577 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176335 (or (= lt!271577 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271577 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271577)))))

(assert (=> b!176335 (= lt!271577 ((_ sign_extend 32) (size!4199 (buf!4642 (_1!8231 lt!271493)))))))

(assert (= (and d!62173 res!146062) b!176334))

(assert (= (and b!176334 res!146061) b!176335))

(declare-fun m!276473 () Bool)

(assert (=> d!62173 m!276473))

(declare-fun m!276475 () Bool)

(assert (=> d!62173 m!276475))

(assert (=> b!176260 d!62173))

(declare-fun d!62175 () Bool)

(declare-datatypes ((tuple2!15180 0))(
  ( (tuple2!15181 (_1!8235 Bool) (_2!8235 BitStream!7506)) )
))
(declare-fun lt!271592 () tuple2!15180)

(declare-fun readBit!0 (BitStream!7506) tuple2!15180)

(assert (=> d!62175 (= lt!271592 (readBit!0 (readerFrom!0 (_2!8230 lt!271490) (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204))))))

(assert (=> d!62175 (= (readBitPure!0 (readerFrom!0 (_2!8230 lt!271490) (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204))) (tuple2!15173 (_2!8235 lt!271592) (_1!8235 lt!271592)))))

(declare-fun bs!15514 () Bool)

(assert (= bs!15514 d!62175))

(assert (=> bs!15514 m!276403))

(declare-fun m!276477 () Bool)

(assert (=> bs!15514 m!276477))

(assert (=> b!176259 d!62175))

(declare-fun d!62177 () Bool)

(declare-fun e!122936 () Bool)

(assert (=> d!62177 e!122936))

(declare-fun res!146081 () Bool)

(assert (=> d!62177 (=> (not res!146081) (not e!122936))))

(assert (=> d!62177 (= res!146081 (invariant!0 (currentBit!8781 (_2!8230 lt!271490)) (currentByte!8786 (_2!8230 lt!271490)) (size!4199 (buf!4642 (_2!8230 lt!271490)))))))

(assert (=> d!62177 (= (readerFrom!0 (_2!8230 lt!271490) (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204)) (BitStream!7507 (buf!4642 (_2!8230 lt!271490)) (currentByte!8786 thiss!1204) (currentBit!8781 thiss!1204)))))

(declare-fun b!176353 () Bool)

(assert (=> b!176353 (= e!122936 (invariant!0 (currentBit!8781 thiss!1204) (currentByte!8786 thiss!1204) (size!4199 (buf!4642 (_2!8230 lt!271490)))))))

(assert (= (and d!62177 res!146081) b!176353))

(assert (=> d!62177 m!276401))

(declare-fun m!276483 () Bool)

(assert (=> b!176353 m!276483))

(assert (=> b!176259 d!62177))

(declare-fun d!62183 () Bool)

(declare-fun res!146099 () Bool)

(declare-fun e!122946 () Bool)

(assert (=> d!62183 (=> (not res!146099) (not e!122946))))

(assert (=> d!62183 (= res!146099 (= (size!4199 (buf!4642 thiss!1204)) (size!4199 (buf!4642 (_2!8230 lt!271490)))))))

(assert (=> d!62183 (= (isPrefixOf!0 thiss!1204 (_2!8230 lt!271490)) e!122946)))

(declare-fun b!176370 () Bool)

(declare-fun res!146097 () Bool)

(assert (=> b!176370 (=> (not res!146097) (not e!122946))))

(assert (=> b!176370 (= res!146097 (bvsle (bitIndex!0 (size!4199 (buf!4642 thiss!1204)) (currentByte!8786 thiss!1204) (currentBit!8781 thiss!1204)) (bitIndex!0 (size!4199 (buf!4642 (_2!8230 lt!271490))) (currentByte!8786 (_2!8230 lt!271490)) (currentBit!8781 (_2!8230 lt!271490)))))))

(declare-fun b!176371 () Bool)

(declare-fun e!122947 () Bool)

(assert (=> b!176371 (= e!122946 e!122947)))

(declare-fun res!146098 () Bool)

(assert (=> b!176371 (=> res!146098 e!122947)))

(assert (=> b!176371 (= res!146098 (= (size!4199 (buf!4642 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176372 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9517 array!9517 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176372 (= e!122947 (arrayBitRangesEq!0 (buf!4642 thiss!1204) (buf!4642 (_2!8230 lt!271490)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4199 (buf!4642 thiss!1204)) (currentByte!8786 thiss!1204) (currentBit!8781 thiss!1204))))))

(assert (= (and d!62183 res!146099) b!176370))

(assert (= (and b!176370 res!146097) b!176371))

(assert (= (and b!176371 (not res!146098)) b!176372))

(assert (=> b!176370 m!276399))

(assert (=> b!176370 m!276397))

(assert (=> b!176372 m!276399))

(assert (=> b!176372 m!276399))

(declare-fun m!276507 () Bool)

(assert (=> b!176372 m!276507))

(assert (=> b!176254 d!62183))

(check-sat (not d!62177) (not d!62139) (not b!176333) (not d!62173) (not b!176332) (not d!62141) (not d!62167) (not d!62143) (not b!176330) (not b!176370) (not d!62171) (not b!176372) (not b!176331) (not d!62175) (not b!176353))
