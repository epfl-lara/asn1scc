; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17542 () Bool)

(assert start!17542)

(declare-fun b!84487 () Bool)

(declare-datatypes ((Unit!5662 0))(
  ( (Unit!5663) )
))
(declare-datatypes ((array!4011 0))(
  ( (array!4012 (arr!2451 (Array (_ BitVec 32) (_ BitVec 8))) (size!1814 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3190 0))(
  ( (BitStream!3191 (buf!2204 array!4011) (currentByte!4374 (_ BitVec 32)) (currentBit!4369 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!370 0))(
  ( (tuple3!371 (_1!3829 Unit!5662) (_2!3829 BitStream!3190) (_3!209 (_ BitVec 32))) )
))
(declare-fun e!56448 () tuple3!370)

(declare-fun thiss!1136 () BitStream!3190)

(declare-fun Unit!5664 () Unit!5662)

(assert (=> b!84487 (= e!56448 (tuple3!371 Unit!5664 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84488 () Bool)

(declare-fun res!69329 () Bool)

(declare-fun e!56446 () Bool)

(assert (=> b!84488 (=> (not res!69329) (not e!56446))))

(assert (=> b!84488 (= res!69329 (= (size!1814 (buf!2204 (_2!3829 e!56448))) (size!1814 (buf!2204 thiss!1136))))))

(declare-fun c!5816 () Bool)

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> b!84488 (= c!5816 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84489 () Bool)

(declare-fun v!176 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3190 (_ BitVec 64) BitStream!3190 (_ BitVec 32)) tuple3!370)

(assert (=> b!84489 (= e!56448 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84490 () Bool)

(declare-fun lt!134264 () (_ BitVec 64))

(declare-fun lt!134265 () (_ BitVec 64))

(assert (=> b!84490 (= e!56446 (and (= lt!134264 (bvand ((_ sign_extend 32) nBits!333) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!134264 (bvand (bvadd lt!134265 ((_ sign_extend 32) nBits!333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!84490 (= lt!134264 (bvand lt!134265 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84490 (= lt!134265 (bitIndex!0 (size!1814 (buf!2204 thiss!1136)) (currentByte!4374 thiss!1136) (currentBit!4369 thiss!1136)))))

(declare-fun res!69328 () Bool)

(assert (=> start!17542 (=> (not res!69328) (not e!56446))))

(assert (=> start!17542 (= res!69328 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17542 e!56446))

(assert (=> start!17542 true))

(declare-fun e!56447 () Bool)

(declare-fun inv!12 (BitStream!3190) Bool)

(assert (=> start!17542 (and (inv!12 thiss!1136) e!56447)))

(declare-fun b!84491 () Bool)

(declare-fun array_inv!1660 (array!4011) Bool)

(assert (=> b!84491 (= e!56447 (array_inv!1660 (buf!2204 thiss!1136)))))

(declare-fun b!84492 () Bool)

(declare-fun res!69331 () Bool)

(assert (=> b!84492 (=> (not res!69331) (not e!56446))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84492 (= res!69331 (invariant!0 (currentBit!4369 thiss!1136) (currentByte!4374 thiss!1136) (size!1814 (buf!2204 thiss!1136))))))

(declare-fun b!84493 () Bool)

(declare-fun res!69330 () Bool)

(assert (=> b!84493 (=> (not res!69330) (not e!56446))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84493 (= res!69330 (validate_offset_bits!1 ((_ sign_extend 32) (size!1814 (buf!2204 thiss!1136))) ((_ sign_extend 32) (currentByte!4374 thiss!1136)) ((_ sign_extend 32) (currentBit!4369 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(assert (= (and start!17542 res!69328) b!84493))

(assert (= (and b!84493 res!69330) b!84492))

(assert (= (and b!84492 res!69331) b!84488))

(assert (= (and b!84488 c!5816) b!84489))

(assert (= (and b!84488 (not c!5816)) b!84487))

(assert (= (and b!84488 res!69329) b!84490))

(assert (= start!17542 b!84491))

(declare-fun m!131051 () Bool)

(assert (=> b!84490 m!131051))

(declare-fun m!131053 () Bool)

(assert (=> start!17542 m!131053))

(declare-fun m!131055 () Bool)

(assert (=> b!84493 m!131055))

(declare-fun m!131057 () Bool)

(assert (=> b!84492 m!131057))

(declare-fun m!131059 () Bool)

(assert (=> b!84489 m!131059))

(declare-fun m!131061 () Bool)

(assert (=> b!84491 m!131061))

(push 1)

(assert (not b!84490))

(assert (not b!84489))

(assert (not b!84491))

(assert (not start!17542))

(assert (not b!84493))

(assert (not b!84492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!84592 () Bool)

(declare-fun e!56494 () Bool)

(declare-fun e!56495 () Bool)

(assert (=> b!84592 (= e!56494 e!56495)))

(declare-fun res!69413 () Bool)

(assert (=> b!84592 (=> (not res!69413) (not e!56495))))

(declare-datatypes ((tuple2!7240 0))(
  ( (tuple2!7241 (_1!3832 Unit!5662) (_2!3832 BitStream!3190)) )
))
(declare-fun lt!134323 () tuple2!7240)

(declare-datatypes ((tuple2!7242 0))(
  ( (tuple2!7243 (_1!3833 BitStream!3190) (_2!3833 Bool)) )
))
(declare-fun lt!134325 () tuple2!7242)

(declare-fun lt!134326 () Bool)

(assert (=> b!84592 (= res!69413 (and (= (_2!3833 lt!134325) lt!134326) (= (_1!3833 lt!134325) (_2!3832 lt!134323))))))

(declare-fun readBitPure!0 (BitStream!3190) tuple2!7242)

(declare-fun readerFrom!0 (BitStream!3190 (_ BitVec 32) (_ BitVec 32)) BitStream!3190)

(assert (=> b!84592 (= lt!134325 (readBitPure!0 (readerFrom!0 (_2!3832 lt!134323) (currentBit!4369 thiss!1136) (currentByte!4374 thiss!1136))))))

(declare-fun d!27170 () Bool)

(declare-fun e!56496 () Bool)

(assert (=> d!27170 e!56496))

(declare-fun res!69421 () Bool)

(assert (=> d!27170 (=> (not res!69421) (not e!56496))))

(declare-fun lt!134322 () tuple3!370)

(assert (=> d!27170 (= res!69421 (bvsge (_3!209 lt!134322) #b00000000000000000000000000000000))))

(declare-fun e!56493 () tuple3!370)

(assert (=> d!27170 (= lt!134322 e!56493)))

(declare-fun c!5825 () Bool)

(declare-fun lt!134328 () (_ BitVec 32))

(assert (=> d!27170 (= c!5825 (bvslt lt!134328 nBits!333))))

(assert (=> d!27170 (= lt!134328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun lt!134324 () tuple2!7240)

(assert (=> d!27170 (= lt!134324 lt!134323)))

(assert (=> d!27170 e!56494))

(declare-fun res!69409 () Bool)

(assert (=> d!27170 (=> (not res!69409) (not e!56494))))

(assert (=> d!27170 (= res!69409 (= (size!1814 (buf!2204 thiss!1136)) (size!1814 (buf!2204 (_2!3832 lt!134323)))))))

(declare-fun appendBit!0 (BitStream!3190 Bool) tuple2!7240)

(assert (=> d!27170 (= lt!134323 (appendBit!0 thiss!1136 lt!134326))))

(assert (=> d!27170 (= lt!134326 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!56492 () Bool)

(assert (=> d!27170 e!56492))

(declare-fun res!69408 () Bool)

(assert (=> d!27170 (=> (not res!69408) (not e!56492))))

(assert (=> d!27170 (= res!69408 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27170 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134322)))

(declare-fun b!84593 () Bool)

(declare-fun res!69411 () Bool)

(assert (=> b!84593 (=> (not res!69411) (not e!56496))))

(declare-fun lt!134327 () (_ BitVec 64))

(declare-fun lt!134331 () (_ BitVec 64))

(assert (=> b!84593 (= res!69411 (= (bitIndex!0 (size!1814 (buf!2204 (_2!3829 lt!134322))) (currentByte!4374 (_2!3829 lt!134322)) (currentBit!4369 (_2!3829 lt!134322))) (bvadd lt!134327 lt!134331)))))

(assert (=> b!84593 (or (not (= (bvand lt!134327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134331 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134327 lt!134331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84593 (= lt!134331 ((_ sign_extend 32) (_3!209 lt!134322)))))

(assert (=> b!84593 (= lt!134327 (bitIndex!0 (size!1814 (buf!2204 thiss!1136)) (currentByte!4374 thiss!1136) (currentBit!4369 thiss!1136)))))

(declare-fun b!84594 () Bool)

(assert (=> b!84594 (= e!56496 (bvsge (_3!209 lt!134322) nBits!333))))

(declare-fun b!84595 () Bool)

(declare-fun res!69416 () Bool)

(assert (=> b!84595 (=> (not res!69416) (not e!56492))))

(assert (=> b!84595 (= res!69416 (validate_offset_bits!1 ((_ sign_extend 32) (size!1814 (buf!2204 thiss!1136))) ((_ sign_extend 32) (currentByte!4374 thiss!1136)) ((_ sign_extend 32) (currentBit!4369 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun b!84596 () Bool)

(declare-fun res!69417 () Bool)

(assert (=> b!84596 (=> (not res!69417) (not e!56496))))

(assert (=> b!84596 (= res!69417 (validate_offset_bits!1 ((_ sign_extend 32) (size!1814 (buf!2204 (_2!3829 lt!134322)))) ((_ sign_extend 32) (currentByte!4374 (_2!3829 lt!134322))) ((_ sign_extend 32) (currentBit!4369 (_2!3829 lt!134322))) ((_ sign_extend 32) (bvsub nBits!333 (_3!209 lt!134322)))))))

(assert (=> b!84596 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!209 lt!134322) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!209 lt!134322)) #b10000000000000000000000000000000)))))

(declare-fun b!84597 () Bool)

(declare-fun res!69412 () Bool)

(assert (=> b!84597 (=> (not res!69412) (not e!56492))))

(assert (=> b!84597 (= res!69412 (invariant!0 (currentBit!4369 thiss!1136) (currentByte!4374 thiss!1136) (size!1814 (buf!2204 thiss!1136))))))

(declare-fun b!84598 () Bool)

(assert (=> b!84598 (= e!56493 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3832 lt!134324) lt!134328))))

(declare-fun b!84599 () Bool)

(declare-fun res!69419 () Bool)

(assert (=> b!84599 (=> (not res!69419) (not e!56492))))

(assert (=> b!84599 (= res!69419 (= (bitIndex!0 (size!1814 (buf!2204 thiss!1136)) (currentByte!4374 thiss!1136) (currentBit!4369 thiss!1136)) (bvadd (bitIndex!0 (size!1814 (buf!2204 thiss!1136)) (currentByte!4374 thiss!1136) (currentBit!4369 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun b!84600 () Bool)

(assert (=> b!84600 (= e!56492 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84601 () Bool)

(assert (=> b!84601 (= e!56495 (= (bitIndex!0 (size!1814 (buf!2204 (_1!3833 lt!134325))) (currentByte!4374 (_1!3833 lt!134325)) (currentBit!4369 (_1!3833 lt!134325))) (bitIndex!0 (size!1814 (buf!2204 (_2!3832 lt!134323))) (currentByte!4374 (_2!3832 lt!134323)) (currentBit!4369 (_2!3832 lt!134323)))))))

(declare-fun b!84602 () Bool)

(declare-fun res!69420 () Bool)

(assert (=> b!84602 (=> (not res!69420) (not e!56496))))

(assert (=> b!84602 (= res!69420 (invariant!0 (currentBit!4369 (_2!3829 lt!134322)) (currentByte!4374 (_2!3829 lt!134322)) (size!1814 (buf!2204 (_2!3829 lt!134322)))))))

(declare-fun b!84603 () Bool)

(declare-fun res!69414 () Bool)

(assert (=> b!84603 (=> (not res!69414) (not e!56494))))

(assert (=> b!84603 (= res!69414 (= (bitIndex!0 (size!1814 (buf!2204 (_2!3832 lt!134323))) (currentByte!4374 (_2!3832 lt!134323)) (currentBit!4369 (_2!3832 lt!134323))) (bvadd (bitIndex!0 (size!1814 (buf!2204 thiss!1136)) (currentByte!4374 thiss!1136) (currentBit!4369 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84604 () Bool)

(declare-fun Unit!5671 () Unit!5662)

(assert (=> b!84604 (= e!56493 (tuple3!371 Unit!5671 (_2!3832 lt!134324) lt!134328))))

(declare-fun b!84605 () Bool)

(declare-fun res!69410 () Bool)

(assert (=> b!84605 (=> (not res!69410) (not e!56496))))

(assert (=> b!84605 (= res!69410 (and (bvsle (_3!209 lt!134322) nBits!333) (= (size!1814 (buf!2204 (_2!3829 lt!134322))) (size!1814 (buf!2204 thiss!1136)))))))

(declare-fun b!84606 () Bool)

(declare-fun res!69418 () Bool)

(assert (=> b!84606 (=> (not res!69418) (not e!56494))))

(declare-fun isPrefixOf!0 (BitStream!3190 BitStream!3190) Bool)

(assert (=> b!84606 (= res!69418 (isPrefixOf!0 thiss!1136 (_2!3832 lt!134323)))))

(declare-fun b!84607 () Bool)

(declare-fun res!69415 () Bool)

(assert (=> b!84607 (=> (not res!69415) (not e!56492))))

(assert (=> b!84607 (= res!69415 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1814 (buf!2204 thiss!1136)) (size!1814 (buf!2204 thiss!1136)))))))

(assert (= (and d!27170 res!69408) b!84597))

(assert (= (and b!84597 res!69412) b!84607))

(assert (= (and b!84607 res!69415) b!84599))

(assert (= (and b!84599 res!69419) b!84595))

(assert (= (and b!84595 res!69416) b!84600))

(assert (= (and d!27170 res!69409) b!84603))

(assert (= (and b!84603 res!69414) b!84606))

(assert (= (and b!84606 res!69418) b!84592))

(assert (= (and b!84592 res!69413) b!84601))

(assert (= (and d!27170 c!5825) b!84598))

(assert (= (and d!27170 (not c!5825)) b!84604))

(assert (= (and d!27170 res!69421) b!84602))

(assert (= (and b!84602 res!69420) b!84605))

(assert (= (and b!84605 res!69410) b!84593))

(assert (= (and b!84593 res!69411) b!84596))

(assert (= (and b!84596 res!69417) b!84594))

(assert (=> b!84597 m!131057))

(declare-fun m!131089 () Bool)

(assert (=> d!27170 m!131089))

(declare-fun m!131091 () Bool)

(assert (=> b!84596 m!131091))

(declare-fun m!131093 () Bool)

(assert (=> b!84601 m!131093))

(declare-fun m!131095 () Bool)

(assert (=> b!84601 m!131095))

(declare-fun m!131097 () Bool)

(assert (=> b!84592 m!131097))

(assert (=> b!84592 m!131097))

(declare-fun m!131099 () Bool)

(assert (=> b!84592 m!131099))

(assert (=> b!84599 m!131051))

(assert (=> b!84599 m!131051))

(declare-fun m!131101 () Bool)

(assert (=> b!84593 m!131101))

(assert (=> b!84593 m!131051))

(declare-fun m!131103 () Bool)

(assert (=> b!84602 m!131103))

(assert (=> b!84603 m!131095))

(assert (=> b!84603 m!131051))

(declare-fun m!131105 () Bool)

(assert (=> b!84606 m!131105))

(declare-fun m!131107 () Bool)

(assert (=> b!84595 m!131107))

(declare-fun m!131109 () Bool)

(assert (=> b!84598 m!131109))

(assert (=> b!84489 d!27170))

(declare-fun d!27186 () Bool)

(assert (=> d!27186 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4369 thiss!1136) (currentByte!4374 thiss!1136) (size!1814 (buf!2204 thiss!1136))))))

(declare-fun bs!6730 () Bool)

(assert (= bs!6730 d!27186))

(assert (=> bs!6730 m!131057))

(assert (=> start!17542 d!27186))

(declare-fun d!27188 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27188 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1814 (buf!2204 thiss!1136))) ((_ sign_extend 32) (currentByte!4374 thiss!1136)) ((_ sign_extend 32) (currentBit!4369 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1814 (buf!2204 thiss!1136))) ((_ sign_extend 32) (currentByte!4374 thiss!1136)) ((_ sign_extend 32) (currentBit!4369 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6731 () Bool)

(assert (= bs!6731 d!27188))

(declare-fun m!131111 () Bool)

(assert (=> bs!6731 m!131111))

(assert (=> b!84493 d!27188))

(declare-fun d!27190 () Bool)

(assert (=> d!27190 (= (array_inv!1660 (buf!2204 thiss!1136)) (bvsge (size!1814 (buf!2204 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84491 d!27190))

(declare-fun d!27192 () Bool)

(assert (=> d!27192 (= (invariant!0 (currentBit!4369 thiss!1136) (currentByte!4374 thiss!1136) (size!1814 (buf!2204 thiss!1136))) (and (bvsge (currentBit!4369 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4369 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4374 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4374 thiss!1136) (size!1814 (buf!2204 thiss!1136))) (and (= (currentBit!4369 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4374 thiss!1136) (size!1814 (buf!2204 thiss!1136)))))))))

(assert (=> b!84492 d!27192))

(declare-fun d!27194 () Bool)

(declare-fun e!56508 () Bool)

(assert (=> d!27194 e!56508))

(declare-fun res!69451 () Bool)

(assert (=> d!27194 (=> (not res!69451) (not e!56508))))

(declare-fun lt!134360 () (_ BitVec 64))

(declare-fun lt!134358 () (_ BitVec 64))

(declare-fun lt!134361 () (_ BitVec 64))

(assert (=> d!27194 (= res!69451 (= lt!134358 (bvsub lt!134361 lt!134360)))))

(assert (=> d!27194 (or (= (bvand lt!134361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134360 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134361 lt!134360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27194 (= lt!134360 (remainingBits!0 ((_ sign_extend 32) (size!1814 (buf!2204 thiss!1136))) ((_ sign_extend 32) (currentByte!4374 thiss!1136)) ((_ sign_extend 32) (currentBit!4369 thiss!1136))))))

(declare-fun lt!134359 () (_ BitVec 64))

(declare-fun lt!134357 () (_ BitVec 64))

(assert (=> d!27194 (= lt!134361 (bvmul lt!134359 lt!134357))))

(assert (=> d!27194 (or (= lt!134359 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134357 (bvsdiv (bvmul lt!134359 lt!134357) lt!134359)))))

(assert (=> d!27194 (= lt!134357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27194 (= lt!134359 ((_ sign_extend 32) (size!1814 (buf!2204 thiss!1136))))))

(assert (=> d!27194 (= lt!134358 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4374 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4369 thiss!1136))))))

(assert (=> d!27194 (invariant!0 (currentBit!4369 thiss!1136) (currentByte!4374 thiss!1136) (size!1814 (buf!2204 thiss!1136)))))

(assert (=> d!27194 (= (bitIndex!0 (size!1814 (buf!2204 thiss!1136)) (currentByte!4374 thiss!1136) (currentBit!4369 thiss!1136)) lt!134358)))

(declare-fun b!84642 () Bool)

(declare-fun res!69450 () Bool)

(assert (=> b!84642 (=> (not res!69450) (not e!56508))))

(assert (=> b!84642 (= res!69450 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134358))))

(declare-fun b!84643 () Bool)

(declare-fun lt!134356 () (_ BitVec 64))

(assert (=> b!84643 (= e!56508 (bvsle lt!134358 (bvmul lt!134356 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84643 (or (= lt!134356 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134356 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134356)))))

(assert (=> b!84643 (= lt!134356 ((_ sign_extend 32) (size!1814 (buf!2204 thiss!1136))))))

(assert (= (and d!27194 res!69451) b!84642))

(assert (= (and b!84642 res!69450) b!84643))

(assert (=> d!27194 m!131111))

(assert (=> d!27194 m!131057))

(assert (=> b!84490 d!27194))

(push 1)

(assert (not d!27194))

(assert (not b!84603))

(assert (not d!27186))

(assert (not b!84602))

(assert (not d!27188))

(assert (not b!84597))

(assert (not b!84601))

(assert (not b!84593))

(assert (not b!84599))

(assert (not b!84595))

(assert (not b!84606))

(assert (not b!84592))

(assert (not b!84598))

(assert (not d!27170))

(assert (not b!84596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

