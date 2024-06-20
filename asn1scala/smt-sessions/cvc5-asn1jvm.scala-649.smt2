; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18112 () Bool)

(assert start!18112)

(declare-fun b!89326 () Bool)

(declare-fun e!59030 () Bool)

(declare-datatypes ((array!4218 0))(
  ( (array!4219 (arr!2541 (Array (_ BitVec 32) (_ BitVec 8))) (size!1904 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3370 0))(
  ( (BitStream!3371 (buf!2294 array!4218) (currentByte!4548 (_ BitVec 32)) (currentBit!4543 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3370)

(declare-fun array_inv!1750 (array!4218) Bool)

(assert (=> b!89326 (= e!59030 (array_inv!1750 (buf!2294 thiss!1151)))))

(declare-fun b!89327 () Bool)

(declare-fun res!73560 () Bool)

(declare-fun e!59027 () Bool)

(assert (=> b!89327 (=> (not res!73560) (not e!59027))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!89327 (= res!73560 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89328 () Bool)

(declare-fun res!73565 () Bool)

(assert (=> b!89328 (=> (not res!73565) (not e!59027))))

(declare-fun thiss!1152 () BitStream!3370)

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!89328 (= res!73565 (and (bvsle i!576 nBits!336) (= (size!1904 (buf!2294 thiss!1152)) (size!1904 (buf!2294 thiss!1151)))))))

(declare-fun b!89329 () Bool)

(declare-fun e!59034 () Bool)

(declare-fun e!59029 () Bool)

(assert (=> b!89329 (= e!59034 e!59029)))

(declare-fun res!73558 () Bool)

(assert (=> b!89329 (=> (not res!73558) (not e!59029))))

(declare-fun lt!136482 () (_ BitVec 64))

(declare-fun lt!136485 () (_ BitVec 64))

(assert (=> b!89329 (= res!73558 (= lt!136482 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136485)))))

(declare-datatypes ((Unit!5791 0))(
  ( (Unit!5792) )
))
(declare-datatypes ((tuple2!7492 0))(
  ( (tuple2!7493 (_1!3979 Unit!5791) (_2!3979 BitStream!3370)) )
))
(declare-fun lt!136483 () tuple2!7492)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89329 (= lt!136482 (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136483))) (currentByte!4548 (_2!3979 lt!136483)) (currentBit!4543 (_2!3979 lt!136483))))))

(declare-fun b!89330 () Bool)

(declare-fun e!59031 () Bool)

(declare-fun e!59033 () Bool)

(assert (=> b!89330 (= e!59031 (not e!59033))))

(declare-fun res!73570 () Bool)

(assert (=> b!89330 (=> res!73570 e!59033)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89330 (= res!73570 (not (invariant!0 (currentBit!4543 (_2!3979 lt!136483)) (currentByte!4548 (_2!3979 lt!136483)) (size!1904 (buf!2294 (_2!3979 lt!136483))))))))

(assert (=> b!89330 e!59034))

(declare-fun res!73559 () Bool)

(assert (=> b!89330 (=> (not res!73559) (not e!59034))))

(assert (=> b!89330 (= res!73559 (= (size!1904 (buf!2294 thiss!1152)) (size!1904 (buf!2294 (_2!3979 lt!136483)))))))

(declare-fun lt!136481 () Bool)

(declare-fun appendBit!0 (BitStream!3370 Bool) tuple2!7492)

(assert (=> b!89330 (= lt!136483 (appendBit!0 thiss!1152 lt!136481))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89330 (= lt!136481 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89331 () Bool)

(declare-fun res!73566 () Bool)

(assert (=> b!89331 (=> (not res!73566) (not e!59027))))

(assert (=> b!89331 (= res!73566 (invariant!0 (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152) (size!1904 (buf!2294 thiss!1152))))))

(declare-fun b!89332 () Bool)

(declare-fun e!59035 () Bool)

(declare-datatypes ((tuple2!7494 0))(
  ( (tuple2!7495 (_1!3980 BitStream!3370) (_2!3980 Bool)) )
))
(declare-fun lt!136484 () tuple2!7494)

(assert (=> b!89332 (= e!59035 (= (bitIndex!0 (size!1904 (buf!2294 (_1!3980 lt!136484))) (currentByte!4548 (_1!3980 lt!136484)) (currentBit!4543 (_1!3980 lt!136484))) lt!136482))))

(declare-fun b!89333 () Bool)

(declare-fun e!59036 () Bool)

(assert (=> b!89333 (= e!59033 e!59036)))

(declare-fun res!73572 () Bool)

(assert (=> b!89333 (=> res!73572 e!59036)))

(declare-datatypes ((tuple3!418 0))(
  ( (tuple3!419 (_1!3981 Unit!5791) (_2!3981 BitStream!3370) (_3!233 (_ BitVec 32))) )
))
(declare-fun lt!136480 () tuple3!418)

(assert (=> b!89333 (= res!73572 (bvslt (_3!233 lt!136480) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3370 (_ BitVec 64) BitStream!3370 (_ BitVec 32)) tuple3!418)

(assert (=> b!89333 (= lt!136480 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3979 lt!136483) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!89334 () Bool)

(declare-fun res!73561 () Bool)

(assert (=> b!89334 (=> (not res!73561) (not e!59027))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89334 (= res!73561 (validate_offset_bits!1 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1151))) ((_ sign_extend 32) (currentByte!4548 thiss!1151)) ((_ sign_extend 32) (currentBit!4543 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89336 () Bool)

(declare-fun res!73567 () Bool)

(assert (=> b!89336 (=> res!73567 e!59036)))

(assert (=> b!89336 (= res!73567 (not (invariant!0 (currentBit!4543 (_2!3981 lt!136480)) (currentByte!4548 (_2!3981 lt!136480)) (size!1904 (buf!2294 (_2!3981 lt!136480))))))))

(declare-fun b!89337 () Bool)

(declare-fun res!73569 () Bool)

(assert (=> b!89337 (=> (not res!73569) (not e!59031))))

(assert (=> b!89337 (= res!73569 (bvslt i!576 nBits!336))))

(declare-fun b!89338 () Bool)

(declare-fun res!73573 () Bool)

(assert (=> b!89338 (=> (not res!73573) (not e!59029))))

(declare-fun isPrefixOf!0 (BitStream!3370 BitStream!3370) Bool)

(assert (=> b!89338 (= res!73573 (isPrefixOf!0 thiss!1152 (_2!3979 lt!136483)))))

(declare-fun b!89339 () Bool)

(assert (=> b!89339 (= e!59029 e!59035)))

(declare-fun res!73568 () Bool)

(assert (=> b!89339 (=> (not res!73568) (not e!59035))))

(assert (=> b!89339 (= res!73568 (and (= (_2!3980 lt!136484) lt!136481) (= (_1!3980 lt!136484) (_2!3979 lt!136483))))))

(declare-fun readBitPure!0 (BitStream!3370) tuple2!7494)

(declare-fun readerFrom!0 (BitStream!3370 (_ BitVec 32) (_ BitVec 32)) BitStream!3370)

(assert (=> b!89339 (= lt!136484 (readBitPure!0 (readerFrom!0 (_2!3979 lt!136483) (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152))))))

(declare-fun b!89340 () Bool)

(declare-fun res!73571 () Bool)

(assert (=> b!89340 (=> res!73571 e!59033)))

(assert (=> b!89340 (= res!73571 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun lt!136479 () (_ BitVec 64))

(declare-fun b!89341 () Bool)

(assert (=> b!89341 (= e!59036 (or (bvsgt (_3!233 lt!136480) nBits!336) (not (= (size!1904 (buf!2294 (_2!3981 lt!136480))) (size!1904 (buf!2294 thiss!1151)))) (let ((bdg!4221 (bvand lt!136479 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!4221 (bvand ((_ sign_extend 32) (_3!233 lt!136480)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!4221 (bvand (bvadd lt!136479 ((_ sign_extend 32) (_3!233 lt!136480))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!89342 () Bool)

(declare-fun res!73564 () Bool)

(assert (=> b!89342 (=> (not res!73564) (not e!59027))))

(assert (=> b!89342 (= res!73564 (invariant!0 (currentBit!4543 thiss!1151) (currentByte!4548 thiss!1151) (size!1904 (buf!2294 thiss!1151))))))

(declare-fun b!89335 () Bool)

(assert (=> b!89335 (= e!59027 e!59031)))

(declare-fun res!73562 () Bool)

(assert (=> b!89335 (=> (not res!73562) (not e!59031))))

(assert (=> b!89335 (= res!73562 (= lt!136485 (bvadd lt!136479 ((_ sign_extend 32) i!576))))))

(assert (=> b!89335 (= lt!136485 (bitIndex!0 (size!1904 (buf!2294 thiss!1152)) (currentByte!4548 thiss!1152) (currentBit!4543 thiss!1152)))))

(assert (=> b!89335 (= lt!136479 (bitIndex!0 (size!1904 (buf!2294 thiss!1151)) (currentByte!4548 thiss!1151) (currentBit!4543 thiss!1151)))))

(declare-fun res!73563 () Bool)

(assert (=> start!18112 (=> (not res!73563) (not e!59027))))

(assert (=> start!18112 (= res!73563 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18112 e!59027))

(declare-fun e!59032 () Bool)

(declare-fun inv!12 (BitStream!3370) Bool)

(assert (=> start!18112 (and (inv!12 thiss!1152) e!59032)))

(assert (=> start!18112 (and (inv!12 thiss!1151) e!59030)))

(assert (=> start!18112 true))

(declare-fun b!89343 () Bool)

(assert (=> b!89343 (= e!59032 (array_inv!1750 (buf!2294 thiss!1152)))))

(declare-fun b!89344 () Bool)

(declare-fun res!73557 () Bool)

(assert (=> b!89344 (=> (not res!73557) (not e!59031))))

(assert (=> b!89344 (= res!73557 (validate_offset_bits!1 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1152))) ((_ sign_extend 32) (currentByte!4548 thiss!1152)) ((_ sign_extend 32) (currentBit!4543 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(assert (= (and start!18112 res!73563) b!89334))

(assert (= (and b!89334 res!73561) b!89342))

(assert (= (and b!89342 res!73564) b!89327))

(assert (= (and b!89327 res!73560) b!89331))

(assert (= (and b!89331 res!73566) b!89328))

(assert (= (and b!89328 res!73565) b!89335))

(assert (= (and b!89335 res!73562) b!89344))

(assert (= (and b!89344 res!73557) b!89337))

(assert (= (and b!89337 res!73569) b!89330))

(assert (= (and b!89330 res!73559) b!89329))

(assert (= (and b!89329 res!73558) b!89338))

(assert (= (and b!89338 res!73573) b!89339))

(assert (= (and b!89339 res!73568) b!89332))

(assert (= (and b!89330 (not res!73570)) b!89340))

(assert (= (and b!89340 (not res!73571)) b!89333))

(assert (= (and b!89333 (not res!73572)) b!89336))

(assert (= (and b!89336 (not res!73567)) b!89341))

(assert (= start!18112 b!89343))

(assert (= start!18112 b!89326))

(declare-fun m!134195 () Bool)

(assert (=> b!89336 m!134195))

(declare-fun m!134197 () Bool)

(assert (=> b!89344 m!134197))

(declare-fun m!134199 () Bool)

(assert (=> b!89342 m!134199))

(declare-fun m!134201 () Bool)

(assert (=> b!89338 m!134201))

(declare-fun m!134203 () Bool)

(assert (=> b!89334 m!134203))

(declare-fun m!134205 () Bool)

(assert (=> b!89333 m!134205))

(declare-fun m!134207 () Bool)

(assert (=> b!89331 m!134207))

(declare-fun m!134209 () Bool)

(assert (=> b!89339 m!134209))

(assert (=> b!89339 m!134209))

(declare-fun m!134211 () Bool)

(assert (=> b!89339 m!134211))

(declare-fun m!134213 () Bool)

(assert (=> start!18112 m!134213))

(declare-fun m!134215 () Bool)

(assert (=> start!18112 m!134215))

(declare-fun m!134217 () Bool)

(assert (=> b!89326 m!134217))

(declare-fun m!134219 () Bool)

(assert (=> b!89343 m!134219))

(declare-fun m!134221 () Bool)

(assert (=> b!89335 m!134221))

(declare-fun m!134223 () Bool)

(assert (=> b!89335 m!134223))

(declare-fun m!134225 () Bool)

(assert (=> b!89329 m!134225))

(declare-fun m!134227 () Bool)

(assert (=> b!89330 m!134227))

(declare-fun m!134229 () Bool)

(assert (=> b!89330 m!134229))

(declare-fun m!134231 () Bool)

(assert (=> b!89332 m!134231))

(push 1)

(assert (not b!89338))

(assert (not b!89334))

(assert (not b!89326))

(assert (not b!89342))

(assert (not b!89343))

(assert (not b!89344))

(assert (not b!89335))

(assert (not b!89329))

(assert (not start!18112))

(assert (not b!89331))

(assert (not b!89339))

(assert (not b!89336))

(assert (not b!89332))

(assert (not b!89333))

(assert (not b!89330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27932 () Bool)

(assert (=> d!27932 (= (invariant!0 (currentBit!4543 (_2!3981 lt!136480)) (currentByte!4548 (_2!3981 lt!136480)) (size!1904 (buf!2294 (_2!3981 lt!136480)))) (and (bvsge (currentBit!4543 (_2!3981 lt!136480)) #b00000000000000000000000000000000) (bvslt (currentBit!4543 (_2!3981 lt!136480)) #b00000000000000000000000000001000) (bvsge (currentByte!4548 (_2!3981 lt!136480)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4548 (_2!3981 lt!136480)) (size!1904 (buf!2294 (_2!3981 lt!136480)))) (and (= (currentBit!4543 (_2!3981 lt!136480)) #b00000000000000000000000000000000) (= (currentByte!4548 (_2!3981 lt!136480)) (size!1904 (buf!2294 (_2!3981 lt!136480))))))))))

(assert (=> b!89336 d!27932))

(declare-fun d!27934 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27934 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1151))) ((_ sign_extend 32) (currentByte!4548 thiss!1151)) ((_ sign_extend 32) (currentBit!4543 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1151))) ((_ sign_extend 32) (currentByte!4548 thiss!1151)) ((_ sign_extend 32) (currentBit!4543 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6930 () Bool)

(assert (= bs!6930 d!27934))

(declare-fun m!134317 () Bool)

(assert (=> bs!6930 m!134317))

(assert (=> b!89334 d!27934))

(declare-fun d!27936 () Bool)

(declare-fun e!59121 () Bool)

(assert (=> d!27936 e!59121))

(declare-fun res!73716 () Bool)

(assert (=> d!27936 (=> (not res!73716) (not e!59121))))

(declare-fun lt!136590 () (_ BitVec 64))

(declare-fun lt!136586 () (_ BitVec 64))

(declare-fun lt!136588 () (_ BitVec 64))

(assert (=> d!27936 (= res!73716 (= lt!136586 (bvsub lt!136590 lt!136588)))))

(assert (=> d!27936 (or (= (bvand lt!136590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136588 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136590 lt!136588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27936 (= lt!136588 (remainingBits!0 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1152))) ((_ sign_extend 32) (currentByte!4548 thiss!1152)) ((_ sign_extend 32) (currentBit!4543 thiss!1152))))))

(declare-fun lt!136587 () (_ BitVec 64))

(declare-fun lt!136591 () (_ BitVec 64))

(assert (=> d!27936 (= lt!136590 (bvmul lt!136587 lt!136591))))

(assert (=> d!27936 (or (= lt!136587 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136591 (bvsdiv (bvmul lt!136587 lt!136591) lt!136587)))))

(assert (=> d!27936 (= lt!136591 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27936 (= lt!136587 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1152))))))

(assert (=> d!27936 (= lt!136586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4548 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4543 thiss!1152))))))

(assert (=> d!27936 (invariant!0 (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152) (size!1904 (buf!2294 thiss!1152)))))

(assert (=> d!27936 (= (bitIndex!0 (size!1904 (buf!2294 thiss!1152)) (currentByte!4548 thiss!1152) (currentBit!4543 thiss!1152)) lt!136586)))

(declare-fun b!89501 () Bool)

(declare-fun res!73717 () Bool)

(assert (=> b!89501 (=> (not res!73717) (not e!59121))))

(assert (=> b!89501 (= res!73717 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136586))))

(declare-fun b!89502 () Bool)

(declare-fun lt!136589 () (_ BitVec 64))

(assert (=> b!89502 (= e!59121 (bvsle lt!136586 (bvmul lt!136589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89502 (or (= lt!136589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136589)))))

(assert (=> b!89502 (= lt!136589 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1152))))))

(assert (= (and d!27936 res!73716) b!89501))

(assert (= (and b!89501 res!73717) b!89502))

(declare-fun m!134319 () Bool)

(assert (=> d!27936 m!134319))

(assert (=> d!27936 m!134207))

(assert (=> b!89335 d!27936))

(declare-fun d!27938 () Bool)

(declare-fun e!59122 () Bool)

(assert (=> d!27938 e!59122))

(declare-fun res!73720 () Bool)

(assert (=> d!27938 (=> (not res!73720) (not e!59122))))

(declare-fun lt!136592 () (_ BitVec 64))

(declare-fun lt!136596 () (_ BitVec 64))

(declare-fun lt!136594 () (_ BitVec 64))

(assert (=> d!27938 (= res!73720 (= lt!136592 (bvsub lt!136596 lt!136594)))))

(assert (=> d!27938 (or (= (bvand lt!136596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136594 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136596 lt!136594) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27938 (= lt!136594 (remainingBits!0 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1151))) ((_ sign_extend 32) (currentByte!4548 thiss!1151)) ((_ sign_extend 32) (currentBit!4543 thiss!1151))))))

(declare-fun lt!136593 () (_ BitVec 64))

(declare-fun lt!136597 () (_ BitVec 64))

(assert (=> d!27938 (= lt!136596 (bvmul lt!136593 lt!136597))))

(assert (=> d!27938 (or (= lt!136593 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136597 (bvsdiv (bvmul lt!136593 lt!136597) lt!136593)))))

(assert (=> d!27938 (= lt!136597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27938 (= lt!136593 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1151))))))

(assert (=> d!27938 (= lt!136592 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4548 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4543 thiss!1151))))))

(assert (=> d!27938 (invariant!0 (currentBit!4543 thiss!1151) (currentByte!4548 thiss!1151) (size!1904 (buf!2294 thiss!1151)))))

(assert (=> d!27938 (= (bitIndex!0 (size!1904 (buf!2294 thiss!1151)) (currentByte!4548 thiss!1151) (currentBit!4543 thiss!1151)) lt!136592)))

(declare-fun b!89507 () Bool)

(declare-fun res!73721 () Bool)

(assert (=> b!89507 (=> (not res!73721) (not e!59122))))

(assert (=> b!89507 (= res!73721 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136592))))

(declare-fun b!89508 () Bool)

(declare-fun lt!136595 () (_ BitVec 64))

(assert (=> b!89508 (= e!59122 (bvsle lt!136592 (bvmul lt!136595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89508 (or (= lt!136595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136595)))))

(assert (=> b!89508 (= lt!136595 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1151))))))

(assert (= (and d!27938 res!73720) b!89507))

(assert (= (and b!89507 res!73721) b!89508))

(assert (=> d!27938 m!134317))

(assert (=> d!27938 m!134199))

(assert (=> b!89335 d!27938))

(declare-fun b!89606 () Bool)

(declare-fun res!73823 () Bool)

(declare-fun e!59169 () Bool)

(assert (=> b!89606 (=> (not res!73823) (not e!59169))))

(assert (=> b!89606 (= res!73823 (validate_offset_bits!1 ((_ sign_extend 32) (size!1904 (buf!2294 (_2!3979 lt!136483)))) ((_ sign_extend 32) (currentByte!4548 (_2!3979 lt!136483))) ((_ sign_extend 32) (currentBit!4543 (_2!3979 lt!136483))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!89607 () Bool)

(declare-fun res!73813 () Bool)

(declare-fun e!59167 () Bool)

(assert (=> b!89607 (=> (not res!73813) (not e!59167))))

(declare-fun lt!136683 () tuple2!7492)

(assert (=> b!89607 (= res!73813 (isPrefixOf!0 (_2!3979 lt!136483) (_2!3979 lt!136683)))))

(declare-fun b!89609 () Bool)

(declare-fun res!73821 () Bool)

(assert (=> b!89609 (=> (not res!73821) (not e!59167))))

(assert (=> b!89609 (= res!73821 (= (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136683))) (currentByte!4548 (_2!3979 lt!136683)) (currentBit!4543 (_2!3979 lt!136683))) (bvadd (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136483))) (currentByte!4548 (_2!3979 lt!136483)) (currentBit!4543 (_2!3979 lt!136483))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!89610 () Bool)

(declare-fun res!73820 () Bool)

(assert (=> b!89610 (=> (not res!73820) (not e!59169))))

(assert (=> b!89610 (= res!73820 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1904 (buf!2294 (_2!3979 lt!136483))) (size!1904 (buf!2294 thiss!1151)))))))

(declare-fun lt!136679 () (_ BitVec 32))

(declare-fun b!89611 () Bool)

(declare-fun lt!136677 () tuple2!7492)

(declare-fun e!59168 () tuple3!418)

(assert (=> b!89611 (= e!59168 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3979 lt!136677) lt!136679))))

(declare-fun b!89612 () Bool)

(declare-fun e!59166 () Bool)

(declare-fun lt!136680 () tuple2!7494)

(assert (=> b!89612 (= e!59166 (= (bitIndex!0 (size!1904 (buf!2294 (_1!3980 lt!136680))) (currentByte!4548 (_1!3980 lt!136680)) (currentBit!4543 (_1!3980 lt!136680))) (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136683))) (currentByte!4548 (_2!3979 lt!136683)) (currentBit!4543 (_2!3979 lt!136683)))))))

(declare-fun b!89613 () Bool)

(assert (=> b!89613 (= e!59167 e!59166)))

(declare-fun res!73814 () Bool)

(assert (=> b!89613 (=> (not res!73814) (not e!59166))))

(declare-fun lt!136678 () Bool)

(assert (=> b!89613 (= res!73814 (and (= (_2!3980 lt!136680) lt!136678) (= (_1!3980 lt!136680) (_2!3979 lt!136683))))))

(assert (=> b!89613 (= lt!136680 (readBitPure!0 (readerFrom!0 (_2!3979 lt!136683) (currentBit!4543 (_2!3979 lt!136483)) (currentByte!4548 (_2!3979 lt!136483)))))))

(declare-fun b!89614 () Bool)

(declare-fun e!59170 () Bool)

(declare-fun lt!136682 () tuple3!418)

(assert (=> b!89614 (= e!59170 (bvsge (_3!233 lt!136682) nBits!336))))

(declare-fun b!89615 () Bool)

(declare-fun res!73816 () Bool)

(assert (=> b!89615 (=> (not res!73816) (not e!59170))))

(assert (=> b!89615 (= res!73816 (and (bvsle (_3!233 lt!136682) nBits!336) (= (size!1904 (buf!2294 (_2!3981 lt!136682))) (size!1904 (buf!2294 thiss!1151)))))))

(declare-fun b!89616 () Bool)

(declare-fun res!73819 () Bool)

(assert (=> b!89616 (=> (not res!73819) (not e!59170))))

(assert (=> b!89616 (= res!73819 (invariant!0 (currentBit!4543 (_2!3981 lt!136682)) (currentByte!4548 (_2!3981 lt!136682)) (size!1904 (buf!2294 (_2!3981 lt!136682)))))))

(declare-fun b!89617 () Bool)

(declare-fun res!73815 () Bool)

(assert (=> b!89617 (=> (not res!73815) (not e!59170))))

(declare-fun lt!136681 () (_ BitVec 64))

(declare-fun lt!136676 () (_ BitVec 64))

(assert (=> b!89617 (= res!73815 (= (bitIndex!0 (size!1904 (buf!2294 (_2!3981 lt!136682))) (currentByte!4548 (_2!3981 lt!136682)) (currentBit!4543 (_2!3981 lt!136682))) (bvadd lt!136681 lt!136676)))))

(assert (=> b!89617 (or (not (= (bvand lt!136681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136676 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136681 lt!136676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89617 (= lt!136676 ((_ sign_extend 32) (_3!233 lt!136682)))))

(assert (=> b!89617 (= lt!136681 (bitIndex!0 (size!1904 (buf!2294 thiss!1151)) (currentByte!4548 thiss!1151) (currentBit!4543 thiss!1151)))))

(declare-fun b!89618 () Bool)

(declare-fun res!73817 () Bool)

(assert (=> b!89618 (=> (not res!73817) (not e!59169))))

(assert (=> b!89618 (= res!73817 (invariant!0 (currentBit!4543 (_2!3979 lt!136483)) (currentByte!4548 (_2!3979 lt!136483)) (size!1904 (buf!2294 (_2!3979 lt!136483)))))))

(declare-fun d!27940 () Bool)

(assert (=> d!27940 e!59170))

(declare-fun res!73822 () Bool)

(assert (=> d!27940 (=> (not res!73822) (not e!59170))))

(assert (=> d!27940 (= res!73822 (bvsge (_3!233 lt!136682) #b00000000000000000000000000000000))))

(assert (=> d!27940 (= lt!136682 e!59168)))

(declare-fun c!5864 () Bool)

(assert (=> d!27940 (= c!5864 (bvslt lt!136679 nBits!336))))

(assert (=> d!27940 (= lt!136679 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(assert (=> d!27940 (= lt!136677 lt!136683)))

(assert (=> d!27940 e!59167))

(declare-fun res!73825 () Bool)

(assert (=> d!27940 (=> (not res!73825) (not e!59167))))

(assert (=> d!27940 (= res!73825 (= (size!1904 (buf!2294 (_2!3979 lt!136483))) (size!1904 (buf!2294 (_2!3979 lt!136683)))))))

(assert (=> d!27940 (= lt!136683 (appendBit!0 (_2!3979 lt!136483) lt!136678))))

(assert (=> d!27940 (= lt!136678 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27940 e!59169))

(declare-fun res!73818 () Bool)

(assert (=> d!27940 (=> (not res!73818) (not e!59169))))

(assert (=> d!27940 (= res!73818 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!27940 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3979 lt!136483) (bvadd #b00000000000000000000000000000001 i!576)) lt!136682)))

(declare-fun b!89608 () Bool)

(declare-fun res!73824 () Bool)

(assert (=> b!89608 (=> (not res!73824) (not e!59169))))

(assert (=> b!89608 (= res!73824 (= (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136483))) (currentByte!4548 (_2!3979 lt!136483)) (currentBit!4543 (_2!3979 lt!136483))) (bvadd (bitIndex!0 (size!1904 (buf!2294 thiss!1151)) (currentByte!4548 thiss!1151) (currentBit!4543 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!89619 () Bool)

(assert (=> b!89619 (= e!59169 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89620 () Bool)

(declare-fun Unit!5798 () Unit!5791)

(assert (=> b!89620 (= e!59168 (tuple3!419 Unit!5798 (_2!3979 lt!136677) lt!136679))))

(declare-fun b!89621 () Bool)

(declare-fun res!73826 () Bool)

(assert (=> b!89621 (=> (not res!73826) (not e!59170))))

(assert (=> b!89621 (= res!73826 (validate_offset_bits!1 ((_ sign_extend 32) (size!1904 (buf!2294 (_2!3981 lt!136682)))) ((_ sign_extend 32) (currentByte!4548 (_2!3981 lt!136682))) ((_ sign_extend 32) (currentBit!4543 (_2!3981 lt!136682))) ((_ sign_extend 32) (bvsub nBits!336 (_3!233 lt!136682)))))))

(assert (=> b!89621 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!233 lt!136682) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!233 lt!136682)) #b10000000000000000000000000000000)))))

(assert (= (and d!27940 res!73818) b!89618))

(assert (= (and b!89618 res!73817) b!89610))

(assert (= (and b!89610 res!73820) b!89608))

(assert (= (and b!89608 res!73824) b!89606))

(assert (= (and b!89606 res!73823) b!89619))

(assert (= (and d!27940 res!73825) b!89609))

(assert (= (and b!89609 res!73821) b!89607))

(assert (= (and b!89607 res!73813) b!89613))

(assert (= (and b!89613 res!73814) b!89612))

(assert (= (and d!27940 c!5864) b!89611))

(assert (= (and d!27940 (not c!5864)) b!89620))

(assert (= (and d!27940 res!73822) b!89616))

(assert (= (and b!89616 res!73819) b!89615))

(assert (= (and b!89615 res!73816) b!89617))

(assert (= (and b!89617 res!73815) b!89621))

(assert (= (and b!89621 res!73826) b!89614))

(declare-fun m!134389 () Bool)

(assert (=> b!89612 m!134389))

(declare-fun m!134391 () Bool)

(assert (=> b!89612 m!134391))

(declare-fun m!134393 () Bool)

(assert (=> b!89617 m!134393))

(assert (=> b!89617 m!134223))

(assert (=> b!89618 m!134227))

(assert (=> b!89608 m!134225))

(assert (=> b!89608 m!134223))

(declare-fun m!134395 () Bool)

(assert (=> b!89607 m!134395))

(assert (=> b!89609 m!134391))

(assert (=> b!89609 m!134225))

(declare-fun m!134397 () Bool)

(assert (=> b!89613 m!134397))

(assert (=> b!89613 m!134397))

(declare-fun m!134399 () Bool)

(assert (=> b!89613 m!134399))

(declare-fun m!134401 () Bool)

(assert (=> b!89606 m!134401))

(declare-fun m!134403 () Bool)

(assert (=> b!89611 m!134403))

(declare-fun m!134405 () Bool)

(assert (=> d!27940 m!134405))

(declare-fun m!134407 () Bool)

(assert (=> b!89621 m!134407))

(declare-fun m!134409 () Bool)

(assert (=> b!89616 m!134409))

(assert (=> b!89333 d!27940))

(declare-fun d!27976 () Bool)

(assert (=> d!27976 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1152))) ((_ sign_extend 32) (currentByte!4548 thiss!1152)) ((_ sign_extend 32) (currentBit!4543 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1152))) ((_ sign_extend 32) (currentByte!4548 thiss!1152)) ((_ sign_extend 32) (currentBit!4543 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6934 () Bool)

(assert (= bs!6934 d!27976))

(assert (=> bs!6934 m!134319))

(assert (=> b!89344 d!27976))

(declare-fun d!27978 () Bool)

(assert (=> d!27978 (= (invariant!0 (currentBit!4543 thiss!1151) (currentByte!4548 thiss!1151) (size!1904 (buf!2294 thiss!1151))) (and (bvsge (currentBit!4543 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4543 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4548 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4548 thiss!1151) (size!1904 (buf!2294 thiss!1151))) (and (= (currentBit!4543 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4548 thiss!1151) (size!1904 (buf!2294 thiss!1151)))))))))

(assert (=> b!89342 d!27978))

(declare-fun d!27980 () Bool)

(assert (=> d!27980 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152) (size!1904 (buf!2294 thiss!1152))))))

(declare-fun bs!6935 () Bool)

(assert (= bs!6935 d!27980))

(assert (=> bs!6935 m!134207))

(assert (=> start!18112 d!27980))

(declare-fun d!27982 () Bool)

(assert (=> d!27982 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4543 thiss!1151) (currentByte!4548 thiss!1151) (size!1904 (buf!2294 thiss!1151))))))

(declare-fun bs!6936 () Bool)

(assert (= bs!6936 d!27982))

(assert (=> bs!6936 m!134199))

(assert (=> start!18112 d!27982))

(declare-fun d!27984 () Bool)

(declare-fun e!59171 () Bool)

(assert (=> d!27984 e!59171))

(declare-fun res!73827 () Bool)

(assert (=> d!27984 (=> (not res!73827) (not e!59171))))

(declare-fun lt!136686 () (_ BitVec 64))

(declare-fun lt!136684 () (_ BitVec 64))

(declare-fun lt!136688 () (_ BitVec 64))

(assert (=> d!27984 (= res!73827 (= lt!136684 (bvsub lt!136688 lt!136686)))))

(assert (=> d!27984 (or (= (bvand lt!136688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136688 lt!136686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27984 (= lt!136686 (remainingBits!0 ((_ sign_extend 32) (size!1904 (buf!2294 (_1!3980 lt!136484)))) ((_ sign_extend 32) (currentByte!4548 (_1!3980 lt!136484))) ((_ sign_extend 32) (currentBit!4543 (_1!3980 lt!136484)))))))

(declare-fun lt!136685 () (_ BitVec 64))

(declare-fun lt!136689 () (_ BitVec 64))

(assert (=> d!27984 (= lt!136688 (bvmul lt!136685 lt!136689))))

(assert (=> d!27984 (or (= lt!136685 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136689 (bvsdiv (bvmul lt!136685 lt!136689) lt!136685)))))

(assert (=> d!27984 (= lt!136689 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27984 (= lt!136685 ((_ sign_extend 32) (size!1904 (buf!2294 (_1!3980 lt!136484)))))))

(assert (=> d!27984 (= lt!136684 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4548 (_1!3980 lt!136484))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4543 (_1!3980 lt!136484)))))))

(assert (=> d!27984 (invariant!0 (currentBit!4543 (_1!3980 lt!136484)) (currentByte!4548 (_1!3980 lt!136484)) (size!1904 (buf!2294 (_1!3980 lt!136484))))))

(assert (=> d!27984 (= (bitIndex!0 (size!1904 (buf!2294 (_1!3980 lt!136484))) (currentByte!4548 (_1!3980 lt!136484)) (currentBit!4543 (_1!3980 lt!136484))) lt!136684)))

(declare-fun b!89622 () Bool)

(declare-fun res!73828 () Bool)

(assert (=> b!89622 (=> (not res!73828) (not e!59171))))

(assert (=> b!89622 (= res!73828 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136684))))

(declare-fun b!89623 () Bool)

(declare-fun lt!136687 () (_ BitVec 64))

(assert (=> b!89623 (= e!59171 (bvsle lt!136684 (bvmul lt!136687 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89623 (or (= lt!136687 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136687 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136687)))))

(assert (=> b!89623 (= lt!136687 ((_ sign_extend 32) (size!1904 (buf!2294 (_1!3980 lt!136484)))))))

(assert (= (and d!27984 res!73827) b!89622))

(assert (= (and b!89622 res!73828) b!89623))

(declare-fun m!134411 () Bool)

(assert (=> d!27984 m!134411))

(declare-fun m!134413 () Bool)

(assert (=> d!27984 m!134413))

(assert (=> b!89332 d!27984))

(declare-fun d!27986 () Bool)

(assert (=> d!27986 (= (array_inv!1750 (buf!2294 thiss!1152)) (bvsge (size!1904 (buf!2294 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!89343 d!27986))

(declare-fun d!27988 () Bool)

(assert (=> d!27988 (= (invariant!0 (currentBit!4543 (_2!3979 lt!136483)) (currentByte!4548 (_2!3979 lt!136483)) (size!1904 (buf!2294 (_2!3979 lt!136483)))) (and (bvsge (currentBit!4543 (_2!3979 lt!136483)) #b00000000000000000000000000000000) (bvslt (currentBit!4543 (_2!3979 lt!136483)) #b00000000000000000000000000001000) (bvsge (currentByte!4548 (_2!3979 lt!136483)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4548 (_2!3979 lt!136483)) (size!1904 (buf!2294 (_2!3979 lt!136483)))) (and (= (currentBit!4543 (_2!3979 lt!136483)) #b00000000000000000000000000000000) (= (currentByte!4548 (_2!3979 lt!136483)) (size!1904 (buf!2294 (_2!3979 lt!136483))))))))))

(assert (=> b!89330 d!27988))

(declare-fun b!89635 () Bool)

(declare-fun e!59177 () Bool)

(declare-fun e!59176 () Bool)

(assert (=> b!89635 (= e!59177 e!59176)))

(declare-fun res!73838 () Bool)

(assert (=> b!89635 (=> (not res!73838) (not e!59176))))

(declare-fun lt!136701 () tuple2!7492)

(declare-fun lt!136699 () tuple2!7494)

(assert (=> b!89635 (= res!73838 (and (= (_2!3980 lt!136699) lt!136481) (= (_1!3980 lt!136699) (_2!3979 lt!136701))))))

(assert (=> b!89635 (= lt!136699 (readBitPure!0 (readerFrom!0 (_2!3979 lt!136701) (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152))))))

(declare-fun b!89636 () Bool)

(assert (=> b!89636 (= e!59176 (= (bitIndex!0 (size!1904 (buf!2294 (_1!3980 lt!136699))) (currentByte!4548 (_1!3980 lt!136699)) (currentBit!4543 (_1!3980 lt!136699))) (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136701))) (currentByte!4548 (_2!3979 lt!136701)) (currentBit!4543 (_2!3979 lt!136701)))))))

(declare-fun b!89633 () Bool)

(declare-fun res!73837 () Bool)

(assert (=> b!89633 (=> (not res!73837) (not e!59177))))

(declare-fun lt!136698 () (_ BitVec 64))

(declare-fun lt!136700 () (_ BitVec 64))

(assert (=> b!89633 (= res!73837 (= (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136701))) (currentByte!4548 (_2!3979 lt!136701)) (currentBit!4543 (_2!3979 lt!136701))) (bvadd lt!136700 lt!136698)))))

(assert (=> b!89633 (or (not (= (bvand lt!136700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136698 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136700 lt!136698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89633 (= lt!136698 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!89633 (= lt!136700 (bitIndex!0 (size!1904 (buf!2294 thiss!1152)) (currentByte!4548 thiss!1152) (currentBit!4543 thiss!1152)))))

(declare-fun d!27990 () Bool)

(assert (=> d!27990 e!59177))

(declare-fun res!73840 () Bool)

(assert (=> d!27990 (=> (not res!73840) (not e!59177))))

(assert (=> d!27990 (= res!73840 (= (size!1904 (buf!2294 thiss!1152)) (size!1904 (buf!2294 (_2!3979 lt!136701)))))))

(declare-fun choose!16 (BitStream!3370 Bool) tuple2!7492)

(assert (=> d!27990 (= lt!136701 (choose!16 thiss!1152 lt!136481))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27990 (validate_offset_bit!0 ((_ sign_extend 32) (size!1904 (buf!2294 thiss!1152))) ((_ sign_extend 32) (currentByte!4548 thiss!1152)) ((_ sign_extend 32) (currentBit!4543 thiss!1152)))))

(assert (=> d!27990 (= (appendBit!0 thiss!1152 lt!136481) lt!136701)))

(declare-fun b!89634 () Bool)

(declare-fun res!73839 () Bool)

(assert (=> b!89634 (=> (not res!73839) (not e!59177))))

(assert (=> b!89634 (= res!73839 (isPrefixOf!0 thiss!1152 (_2!3979 lt!136701)))))

(assert (= (and d!27990 res!73840) b!89633))

(assert (= (and b!89633 res!73837) b!89634))

(assert (= (and b!89634 res!73839) b!89635))

(assert (= (and b!89635 res!73838) b!89636))

(declare-fun m!134415 () Bool)

(assert (=> b!89635 m!134415))

(assert (=> b!89635 m!134415))

(declare-fun m!134417 () Bool)

(assert (=> b!89635 m!134417))

(declare-fun m!134419 () Bool)

(assert (=> b!89636 m!134419))

(declare-fun m!134421 () Bool)

(assert (=> b!89636 m!134421))

(declare-fun m!134423 () Bool)

(assert (=> d!27990 m!134423))

(declare-fun m!134425 () Bool)

(assert (=> d!27990 m!134425))

(assert (=> b!89633 m!134421))

(assert (=> b!89633 m!134221))

(declare-fun m!134427 () Bool)

(assert (=> b!89634 m!134427))

(assert (=> b!89330 d!27990))

(declare-fun d!27992 () Bool)

(assert (=> d!27992 (= (invariant!0 (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152) (size!1904 (buf!2294 thiss!1152))) (and (bvsge (currentBit!4543 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4543 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4548 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4548 thiss!1152) (size!1904 (buf!2294 thiss!1152))) (and (= (currentBit!4543 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4548 thiss!1152) (size!1904 (buf!2294 thiss!1152)))))))))

(assert (=> b!89331 d!27992))

(declare-fun d!27994 () Bool)

(declare-fun e!59178 () Bool)

(assert (=> d!27994 e!59178))

(declare-fun res!73841 () Bool)

(assert (=> d!27994 (=> (not res!73841) (not e!59178))))

(declare-fun lt!136704 () (_ BitVec 64))

(declare-fun lt!136702 () (_ BitVec 64))

(declare-fun lt!136706 () (_ BitVec 64))

(assert (=> d!27994 (= res!73841 (= lt!136702 (bvsub lt!136706 lt!136704)))))

(assert (=> d!27994 (or (= (bvand lt!136706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136706 lt!136704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27994 (= lt!136704 (remainingBits!0 ((_ sign_extend 32) (size!1904 (buf!2294 (_2!3979 lt!136483)))) ((_ sign_extend 32) (currentByte!4548 (_2!3979 lt!136483))) ((_ sign_extend 32) (currentBit!4543 (_2!3979 lt!136483)))))))

(declare-fun lt!136703 () (_ BitVec 64))

(declare-fun lt!136707 () (_ BitVec 64))

(assert (=> d!27994 (= lt!136706 (bvmul lt!136703 lt!136707))))

(assert (=> d!27994 (or (= lt!136703 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136707 (bvsdiv (bvmul lt!136703 lt!136707) lt!136703)))))

(assert (=> d!27994 (= lt!136707 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27994 (= lt!136703 ((_ sign_extend 32) (size!1904 (buf!2294 (_2!3979 lt!136483)))))))

(assert (=> d!27994 (= lt!136702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4548 (_2!3979 lt!136483))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4543 (_2!3979 lt!136483)))))))

(assert (=> d!27994 (invariant!0 (currentBit!4543 (_2!3979 lt!136483)) (currentByte!4548 (_2!3979 lt!136483)) (size!1904 (buf!2294 (_2!3979 lt!136483))))))

(assert (=> d!27994 (= (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136483))) (currentByte!4548 (_2!3979 lt!136483)) (currentBit!4543 (_2!3979 lt!136483))) lt!136702)))

(declare-fun b!89637 () Bool)

(declare-fun res!73842 () Bool)

(assert (=> b!89637 (=> (not res!73842) (not e!59178))))

(assert (=> b!89637 (= res!73842 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136702))))

(declare-fun b!89638 () Bool)

(declare-fun lt!136705 () (_ BitVec 64))

(assert (=> b!89638 (= e!59178 (bvsle lt!136702 (bvmul lt!136705 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89638 (or (= lt!136705 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136705 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136705)))))

(assert (=> b!89638 (= lt!136705 ((_ sign_extend 32) (size!1904 (buf!2294 (_2!3979 lt!136483)))))))

(assert (= (and d!27994 res!73841) b!89637))

(assert (= (and b!89637 res!73842) b!89638))

(declare-fun m!134429 () Bool)

(assert (=> d!27994 m!134429))

(assert (=> d!27994 m!134227))

(assert (=> b!89329 d!27994))

(declare-fun d!27996 () Bool)

(declare-fun res!73850 () Bool)

(declare-fun e!59184 () Bool)

(assert (=> d!27996 (=> (not res!73850) (not e!59184))))

(assert (=> d!27996 (= res!73850 (= (size!1904 (buf!2294 thiss!1152)) (size!1904 (buf!2294 (_2!3979 lt!136483)))))))

(assert (=> d!27996 (= (isPrefixOf!0 thiss!1152 (_2!3979 lt!136483)) e!59184)))

(declare-fun b!89645 () Bool)

(declare-fun res!73851 () Bool)

(assert (=> b!89645 (=> (not res!73851) (not e!59184))))

(assert (=> b!89645 (= res!73851 (bvsle (bitIndex!0 (size!1904 (buf!2294 thiss!1152)) (currentByte!4548 thiss!1152) (currentBit!4543 thiss!1152)) (bitIndex!0 (size!1904 (buf!2294 (_2!3979 lt!136483))) (currentByte!4548 (_2!3979 lt!136483)) (currentBit!4543 (_2!3979 lt!136483)))))))

(declare-fun b!89646 () Bool)

(declare-fun e!59183 () Bool)

(assert (=> b!89646 (= e!59184 e!59183)))

(declare-fun res!73849 () Bool)

(assert (=> b!89646 (=> res!73849 e!59183)))

(assert (=> b!89646 (= res!73849 (= (size!1904 (buf!2294 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!89647 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4218 array!4218 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89647 (= e!59183 (arrayBitRangesEq!0 (buf!2294 thiss!1152) (buf!2294 (_2!3979 lt!136483)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1904 (buf!2294 thiss!1152)) (currentByte!4548 thiss!1152) (currentBit!4543 thiss!1152))))))

(assert (= (and d!27996 res!73850) b!89645))

(assert (= (and b!89645 res!73851) b!89646))

(assert (= (and b!89646 (not res!73849)) b!89647))

(assert (=> b!89645 m!134221))

(assert (=> b!89645 m!134225))

(assert (=> b!89647 m!134221))

(assert (=> b!89647 m!134221))

(declare-fun m!134431 () Bool)

(assert (=> b!89647 m!134431))

(assert (=> b!89338 d!27996))

(declare-fun d!27998 () Bool)

(declare-datatypes ((tuple2!7508 0))(
  ( (tuple2!7509 (_1!3990 Bool) (_2!3990 BitStream!3370)) )
))
(declare-fun lt!136710 () tuple2!7508)

(declare-fun readBit!0 (BitStream!3370) tuple2!7508)

(assert (=> d!27998 (= lt!136710 (readBit!0 (readerFrom!0 (_2!3979 lt!136483) (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152))))))

(assert (=> d!27998 (= (readBitPure!0 (readerFrom!0 (_2!3979 lt!136483) (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152))) (tuple2!7495 (_2!3990 lt!136710) (_1!3990 lt!136710)))))

(declare-fun bs!6937 () Bool)

(assert (= bs!6937 d!27998))

(assert (=> bs!6937 m!134209))

(declare-fun m!134433 () Bool)

(assert (=> bs!6937 m!134433))

(assert (=> b!89339 d!27998))

(declare-fun d!28000 () Bool)

(declare-fun e!59197 () Bool)

(assert (=> d!28000 e!59197))

(declare-fun res!73883 () Bool)

(assert (=> d!28000 (=> (not res!73883) (not e!59197))))

(assert (=> d!28000 (= res!73883 (invariant!0 (currentBit!4543 (_2!3979 lt!136483)) (currentByte!4548 (_2!3979 lt!136483)) (size!1904 (buf!2294 (_2!3979 lt!136483)))))))

(assert (=> d!28000 (= (readerFrom!0 (_2!3979 lt!136483) (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152)) (BitStream!3371 (buf!2294 (_2!3979 lt!136483)) (currentByte!4548 thiss!1152) (currentBit!4543 thiss!1152)))))

(declare-fun b!89680 () Bool)

(assert (=> b!89680 (= e!59197 (invariant!0 (currentBit!4543 thiss!1152) (currentByte!4548 thiss!1152) (size!1904 (buf!2294 (_2!3979 lt!136483)))))))

(assert (= (and d!28000 res!73883) b!89680))

(assert (=> d!28000 m!134227))

(declare-fun m!134435 () Bool)

(assert (=> b!89680 m!134435))

(assert (=> b!89339 d!28000))

(declare-fun d!28002 () Bool)

(assert (=> d!28002 (= (array_inv!1750 (buf!2294 thiss!1151)) (bvsge (size!1904 (buf!2294 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!89326 d!28002))

(push 1)

(assert (not d!28000))

(assert (not d!27938))

(assert (not b!89608))

(assert (not b!89612))

(assert (not b!89618))

(assert (not b!89636))

(assert (not b!89606))

(assert (not b!89635))

(assert (not d!27990))

(assert (not b!89609))

(assert (not d!27984))

(assert (not d!27934))

(assert (not b!89647))

(assert (not d!27980))

(assert (not d!27936))

(assert (not b!89613))

(assert (not b!89680))

(assert (not b!89611))

(assert (not b!89645))

(assert (not b!89634))

(assert (not d!27940))

(assert (not b!89621))

(assert (not d!27994))

(assert (not d!27982))

(assert (not b!89607))

(assert (not d!27998))

(assert (not b!89633))

(assert (not d!27976))

(assert (not b!89616))

(assert (not b!89617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

