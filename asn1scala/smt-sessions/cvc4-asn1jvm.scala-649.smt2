; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18116 () Bool)

(assert start!18116)

(declare-fun b!89440 () Bool)

(declare-fun e!59102 () Bool)

(declare-fun e!59099 () Bool)

(assert (=> b!89440 (= e!59102 e!59099)))

(declare-fun res!73675 () Bool)

(assert (=> b!89440 (=> (not res!73675) (not e!59099))))

(declare-datatypes ((array!4222 0))(
  ( (array!4223 (arr!2543 (Array (_ BitVec 32) (_ BitVec 8))) (size!1906 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3374 0))(
  ( (BitStream!3375 (buf!2296 array!4222) (currentByte!4550 (_ BitVec 32)) (currentBit!4545 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7500 0))(
  ( (tuple2!7501 (_1!3985 BitStream!3374) (_2!3985 Bool)) )
))
(declare-fun lt!136522 () tuple2!7500)

(declare-fun lt!136526 () Bool)

(declare-datatypes ((Unit!5795 0))(
  ( (Unit!5796) )
))
(declare-datatypes ((tuple2!7502 0))(
  ( (tuple2!7503 (_1!3986 Unit!5795) (_2!3986 BitStream!3374)) )
))
(declare-fun lt!136524 () tuple2!7502)

(assert (=> b!89440 (= res!73675 (and (= (_2!3985 lt!136522) lt!136526) (= (_1!3985 lt!136522) (_2!3986 lt!136524))))))

(declare-fun thiss!1152 () BitStream!3374)

(declare-fun readBitPure!0 (BitStream!3374) tuple2!7500)

(declare-fun readerFrom!0 (BitStream!3374 (_ BitVec 32) (_ BitVec 32)) BitStream!3374)

(assert (=> b!89440 (= lt!136522 (readBitPure!0 (readerFrom!0 (_2!3986 lt!136524) (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152))))))

(declare-fun thiss!1151 () BitStream!3374)

(declare-fun e!59094 () Bool)

(declare-fun b!89441 () Bool)

(declare-datatypes ((tuple3!422 0))(
  ( (tuple3!423 (_1!3987 Unit!5795) (_2!3987 BitStream!3374) (_3!235 (_ BitVec 32))) )
))
(declare-fun lt!136521 () tuple3!422)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun lt!136525 () (_ BitVec 64))

(assert (=> b!89441 (= e!59094 (or (bvsgt (_3!235 lt!136521) nBits!336) (not (= (size!1906 (buf!2296 (_2!3987 lt!136521))) (size!1906 (buf!2296 thiss!1151)))) (let ((bdg!4221 (bvand lt!136525 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!4221 (bvand ((_ sign_extend 32) (_3!235 lt!136521)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!4221 (bvand (bvadd lt!136525 ((_ sign_extend 32) (_3!235 lt!136521))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!89442 () Bool)

(declare-fun e!59096 () Bool)

(declare-fun array_inv!1752 (array!4222) Bool)

(assert (=> b!89442 (= e!59096 (array_inv!1752 (buf!2296 thiss!1152)))))

(declare-fun b!89443 () Bool)

(declare-fun res!73665 () Bool)

(declare-fun e!59098 () Bool)

(assert (=> b!89443 (=> (not res!73665) (not e!59098))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!89443 (= res!73665 (and (bvsle i!576 nBits!336) (= (size!1906 (buf!2296 thiss!1152)) (size!1906 (buf!2296 thiss!1151)))))))

(declare-fun b!89444 () Bool)

(declare-fun lt!136523 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89444 (= e!59099 (= (bitIndex!0 (size!1906 (buf!2296 (_1!3985 lt!136522))) (currentByte!4550 (_1!3985 lt!136522)) (currentBit!4545 (_1!3985 lt!136522))) lt!136523))))

(declare-fun b!89445 () Bool)

(declare-fun e!59093 () Bool)

(assert (=> b!89445 (= e!59093 e!59102)))

(declare-fun res!73664 () Bool)

(assert (=> b!89445 (=> (not res!73664) (not e!59102))))

(declare-fun lt!136527 () (_ BitVec 64))

(assert (=> b!89445 (= res!73664 (= lt!136523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136527)))))

(assert (=> b!89445 (= lt!136523 (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136524))) (currentByte!4550 (_2!3986 lt!136524)) (currentBit!4545 (_2!3986 lt!136524))))))

(declare-fun b!89446 () Bool)

(declare-fun res!73668 () Bool)

(declare-fun e!59103 () Bool)

(assert (=> b!89446 (=> (not res!73668) (not e!59103))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89446 (= res!73668 (validate_offset_bits!1 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1152))) ((_ sign_extend 32) (currentByte!4550 thiss!1152)) ((_ sign_extend 32) (currentBit!4545 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89447 () Bool)

(declare-fun res!73674 () Bool)

(assert (=> b!89447 (=> (not res!73674) (not e!59102))))

(declare-fun isPrefixOf!0 (BitStream!3374 BitStream!3374) Bool)

(assert (=> b!89447 (= res!73674 (isPrefixOf!0 thiss!1152 (_2!3986 lt!136524)))))

(declare-fun b!89448 () Bool)

(declare-fun res!73660 () Bool)

(assert (=> b!89448 (=> res!73660 e!59094)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89448 (= res!73660 (not (invariant!0 (currentBit!4545 (_2!3987 lt!136521)) (currentByte!4550 (_2!3987 lt!136521)) (size!1906 (buf!2296 (_2!3987 lt!136521))))))))

(declare-fun b!89449 () Bool)

(declare-fun res!73670 () Bool)

(declare-fun e!59097 () Bool)

(assert (=> b!89449 (=> res!73670 e!59097)))

(assert (=> b!89449 (= res!73670 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89450 () Bool)

(declare-fun res!73671 () Bool)

(assert (=> b!89450 (=> (not res!73671) (not e!59103))))

(assert (=> b!89450 (= res!73671 (bvslt i!576 nBits!336))))

(declare-fun res!73661 () Bool)

(assert (=> start!18116 (=> (not res!73661) (not e!59098))))

(assert (=> start!18116 (= res!73661 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18116 e!59098))

(declare-fun inv!12 (BitStream!3374) Bool)

(assert (=> start!18116 (and (inv!12 thiss!1152) e!59096)))

(declare-fun e!59095 () Bool)

(assert (=> start!18116 (and (inv!12 thiss!1151) e!59095)))

(assert (=> start!18116 true))

(declare-fun b!89451 () Bool)

(assert (=> b!89451 (= e!59097 e!59094)))

(declare-fun res!73666 () Bool)

(assert (=> b!89451 (=> res!73666 e!59094)))

(assert (=> b!89451 (= res!73666 (bvslt (_3!235 lt!136521) #b00000000000000000000000000000000))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3374 (_ BitVec 64) BitStream!3374 (_ BitVec 32)) tuple3!422)

(assert (=> b!89451 (= lt!136521 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3986 lt!136524) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!89452 () Bool)

(declare-fun res!73662 () Bool)

(assert (=> b!89452 (=> (not res!73662) (not e!59098))))

(assert (=> b!89452 (= res!73662 (invariant!0 (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152) (size!1906 (buf!2296 thiss!1152))))))

(declare-fun b!89453 () Bool)

(declare-fun res!73659 () Bool)

(assert (=> b!89453 (=> (not res!73659) (not e!59098))))

(assert (=> b!89453 (= res!73659 (validate_offset_bits!1 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1151))) ((_ sign_extend 32) (currentByte!4550 thiss!1151)) ((_ sign_extend 32) (currentBit!4545 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89454 () Bool)

(assert (=> b!89454 (= e!59095 (array_inv!1752 (buf!2296 thiss!1151)))))

(declare-fun b!89455 () Bool)

(assert (=> b!89455 (= e!59103 (not e!59097))))

(declare-fun res!73667 () Bool)

(assert (=> b!89455 (=> res!73667 e!59097)))

(assert (=> b!89455 (= res!73667 (not (invariant!0 (currentBit!4545 (_2!3986 lt!136524)) (currentByte!4550 (_2!3986 lt!136524)) (size!1906 (buf!2296 (_2!3986 lt!136524))))))))

(assert (=> b!89455 e!59093))

(declare-fun res!73672 () Bool)

(assert (=> b!89455 (=> (not res!73672) (not e!59093))))

(assert (=> b!89455 (= res!73672 (= (size!1906 (buf!2296 thiss!1152)) (size!1906 (buf!2296 (_2!3986 lt!136524)))))))

(declare-fun appendBit!0 (BitStream!3374 Bool) tuple2!7502)

(assert (=> b!89455 (= lt!136524 (appendBit!0 thiss!1152 lt!136526))))

(assert (=> b!89455 (= lt!136526 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89456 () Bool)

(assert (=> b!89456 (= e!59098 e!59103)))

(declare-fun res!73669 () Bool)

(assert (=> b!89456 (=> (not res!73669) (not e!59103))))

(assert (=> b!89456 (= res!73669 (= lt!136527 (bvadd lt!136525 ((_ sign_extend 32) i!576))))))

(assert (=> b!89456 (= lt!136527 (bitIndex!0 (size!1906 (buf!2296 thiss!1152)) (currentByte!4550 thiss!1152) (currentBit!4545 thiss!1152)))))

(assert (=> b!89456 (= lt!136525 (bitIndex!0 (size!1906 (buf!2296 thiss!1151)) (currentByte!4550 thiss!1151) (currentBit!4545 thiss!1151)))))

(declare-fun b!89457 () Bool)

(declare-fun res!73673 () Bool)

(assert (=> b!89457 (=> (not res!73673) (not e!59098))))

(assert (=> b!89457 (= res!73673 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89458 () Bool)

(declare-fun res!73663 () Bool)

(assert (=> b!89458 (=> (not res!73663) (not e!59098))))

(assert (=> b!89458 (= res!73663 (invariant!0 (currentBit!4545 thiss!1151) (currentByte!4550 thiss!1151) (size!1906 (buf!2296 thiss!1151))))))

(assert (= (and start!18116 res!73661) b!89453))

(assert (= (and b!89453 res!73659) b!89458))

(assert (= (and b!89458 res!73663) b!89457))

(assert (= (and b!89457 res!73673) b!89452))

(assert (= (and b!89452 res!73662) b!89443))

(assert (= (and b!89443 res!73665) b!89456))

(assert (= (and b!89456 res!73669) b!89446))

(assert (= (and b!89446 res!73668) b!89450))

(assert (= (and b!89450 res!73671) b!89455))

(assert (= (and b!89455 res!73672) b!89445))

(assert (= (and b!89445 res!73664) b!89447))

(assert (= (and b!89447 res!73674) b!89440))

(assert (= (and b!89440 res!73675) b!89444))

(assert (= (and b!89455 (not res!73667)) b!89449))

(assert (= (and b!89449 (not res!73670)) b!89451))

(assert (= (and b!89451 (not res!73666)) b!89448))

(assert (= (and b!89448 (not res!73660)) b!89441))

(assert (= start!18116 b!89442))

(assert (= start!18116 b!89454))

(declare-fun m!134271 () Bool)

(assert (=> b!89442 m!134271))

(declare-fun m!134273 () Bool)

(assert (=> b!89452 m!134273))

(declare-fun m!134275 () Bool)

(assert (=> b!89456 m!134275))

(declare-fun m!134277 () Bool)

(assert (=> b!89456 m!134277))

(declare-fun m!134279 () Bool)

(assert (=> b!89447 m!134279))

(declare-fun m!134281 () Bool)

(assert (=> start!18116 m!134281))

(declare-fun m!134283 () Bool)

(assert (=> start!18116 m!134283))

(declare-fun m!134285 () Bool)

(assert (=> b!89446 m!134285))

(declare-fun m!134287 () Bool)

(assert (=> b!89448 m!134287))

(declare-fun m!134289 () Bool)

(assert (=> b!89444 m!134289))

(declare-fun m!134291 () Bool)

(assert (=> b!89455 m!134291))

(declare-fun m!134293 () Bool)

(assert (=> b!89455 m!134293))

(declare-fun m!134295 () Bool)

(assert (=> b!89458 m!134295))

(declare-fun m!134297 () Bool)

(assert (=> b!89445 m!134297))

(declare-fun m!134299 () Bool)

(assert (=> b!89453 m!134299))

(declare-fun m!134301 () Bool)

(assert (=> b!89454 m!134301))

(declare-fun m!134303 () Bool)

(assert (=> b!89440 m!134303))

(assert (=> b!89440 m!134303))

(declare-fun m!134305 () Bool)

(assert (=> b!89440 m!134305))

(declare-fun m!134307 () Bool)

(assert (=> b!89451 m!134307))

(push 1)

(assert (not b!89447))

(assert (not b!89446))

(assert (not b!89454))

(assert (not b!89444))

(assert (not b!89448))

(assert (not b!89458))

(assert (not b!89442))

(assert (not start!18116))

(assert (not b!89455))

(assert (not b!89445))

(assert (not b!89452))

(assert (not b!89451))

(assert (not b!89456))

(assert (not b!89453))

(assert (not b!89440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27942 () Bool)

(assert (=> d!27942 (= (array_inv!1752 (buf!2296 thiss!1151)) (bvsge (size!1906 (buf!2296 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!89454 d!27942))

(declare-fun d!27944 () Bool)

(declare-fun e!59134 () Bool)

(assert (=> d!27944 e!59134))

(declare-fun res!73746 () Bool)

(assert (=> d!27944 (=> (not res!73746) (not e!59134))))

(declare-fun lt!136627 () (_ BitVec 64))

(declare-fun lt!136631 () (_ BitVec 64))

(declare-fun lt!136629 () (_ BitVec 64))

(assert (=> d!27944 (= res!73746 (= lt!136629 (bvsub lt!136631 lt!136627)))))

(assert (=> d!27944 (or (= (bvand lt!136631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136631 lt!136627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27944 (= lt!136627 (remainingBits!0 ((_ sign_extend 32) (size!1906 (buf!2296 (_1!3985 lt!136522)))) ((_ sign_extend 32) (currentByte!4550 (_1!3985 lt!136522))) ((_ sign_extend 32) (currentBit!4545 (_1!3985 lt!136522)))))))

(declare-fun lt!136632 () (_ BitVec 64))

(declare-fun lt!136628 () (_ BitVec 64))

(assert (=> d!27944 (= lt!136631 (bvmul lt!136632 lt!136628))))

(assert (=> d!27944 (or (= lt!136632 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136628 (bvsdiv (bvmul lt!136632 lt!136628) lt!136632)))))

(assert (=> d!27944 (= lt!136628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27944 (= lt!136632 ((_ sign_extend 32) (size!1906 (buf!2296 (_1!3985 lt!136522)))))))

(assert (=> d!27944 (= lt!136629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4550 (_1!3985 lt!136522))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4545 (_1!3985 lt!136522)))))))

(assert (=> d!27944 (invariant!0 (currentBit!4545 (_1!3985 lt!136522)) (currentByte!4550 (_1!3985 lt!136522)) (size!1906 (buf!2296 (_1!3985 lt!136522))))))

(assert (=> d!27944 (= (bitIndex!0 (size!1906 (buf!2296 (_1!3985 lt!136522))) (currentByte!4550 (_1!3985 lt!136522)) (currentBit!4545 (_1!3985 lt!136522))) lt!136629)))

(declare-fun b!89534 () Bool)

(declare-fun res!73747 () Bool)

(assert (=> b!89534 (=> (not res!73747) (not e!59134))))

(assert (=> b!89534 (= res!73747 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136629))))

(declare-fun b!89535 () Bool)

(declare-fun lt!136630 () (_ BitVec 64))

(assert (=> b!89535 (= e!59134 (bvsle lt!136629 (bvmul lt!136630 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89535 (or (= lt!136630 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136630 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136630)))))

(assert (=> b!89535 (= lt!136630 ((_ sign_extend 32) (size!1906 (buf!2296 (_1!3985 lt!136522)))))))

(assert (= (and d!27944 res!73746) b!89534))

(assert (= (and b!89534 res!73747) b!89535))

(declare-fun m!134349 () Bool)

(assert (=> d!27944 m!134349))

(declare-fun m!134351 () Bool)

(assert (=> d!27944 m!134351))

(assert (=> b!89444 d!27944))

(declare-fun d!27958 () Bool)

(assert (=> d!27958 (= (invariant!0 (currentBit!4545 (_2!3986 lt!136524)) (currentByte!4550 (_2!3986 lt!136524)) (size!1906 (buf!2296 (_2!3986 lt!136524)))) (and (bvsge (currentBit!4545 (_2!3986 lt!136524)) #b00000000000000000000000000000000) (bvslt (currentBit!4545 (_2!3986 lt!136524)) #b00000000000000000000000000001000) (bvsge (currentByte!4550 (_2!3986 lt!136524)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4550 (_2!3986 lt!136524)) (size!1906 (buf!2296 (_2!3986 lt!136524)))) (and (= (currentBit!4545 (_2!3986 lt!136524)) #b00000000000000000000000000000000) (= (currentByte!4550 (_2!3986 lt!136524)) (size!1906 (buf!2296 (_2!3986 lt!136524))))))))))

(assert (=> b!89455 d!27958))

(declare-fun d!27960 () Bool)

(declare-fun e!59146 () Bool)

(assert (=> d!27960 e!59146))

(declare-fun res!73768 () Bool)

(assert (=> d!27960 (=> (not res!73768) (not e!59146))))

(declare-fun lt!136653 () tuple2!7502)

(assert (=> d!27960 (= res!73768 (= (size!1906 (buf!2296 thiss!1152)) (size!1906 (buf!2296 (_2!3986 lt!136653)))))))

(declare-fun choose!16 (BitStream!3374 Bool) tuple2!7502)

(assert (=> d!27960 (= lt!136653 (choose!16 thiss!1152 lt!136526))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27960 (validate_offset_bit!0 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1152))) ((_ sign_extend 32) (currentByte!4550 thiss!1152)) ((_ sign_extend 32) (currentBit!4545 thiss!1152)))))

(assert (=> d!27960 (= (appendBit!0 thiss!1152 lt!136526) lt!136653)))

(declare-fun b!89559 () Bool)

(declare-fun res!73771 () Bool)

(assert (=> b!89559 (=> (not res!73771) (not e!59146))))

(assert (=> b!89559 (= res!73771 (isPrefixOf!0 thiss!1152 (_2!3986 lt!136653)))))

(declare-fun b!89561 () Bool)

(declare-fun e!59145 () Bool)

(declare-fun lt!136655 () tuple2!7500)

(assert (=> b!89561 (= e!59145 (= (bitIndex!0 (size!1906 (buf!2296 (_1!3985 lt!136655))) (currentByte!4550 (_1!3985 lt!136655)) (currentBit!4545 (_1!3985 lt!136655))) (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136653))) (currentByte!4550 (_2!3986 lt!136653)) (currentBit!4545 (_2!3986 lt!136653)))))))

(declare-fun b!89560 () Bool)

(assert (=> b!89560 (= e!59146 e!59145)))

(declare-fun res!73770 () Bool)

(assert (=> b!89560 (=> (not res!73770) (not e!59145))))

(assert (=> b!89560 (= res!73770 (and (= (_2!3985 lt!136655) lt!136526) (= (_1!3985 lt!136655) (_2!3986 lt!136653))))))

(assert (=> b!89560 (= lt!136655 (readBitPure!0 (readerFrom!0 (_2!3986 lt!136653) (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152))))))

(declare-fun b!89558 () Bool)

(declare-fun res!73769 () Bool)

(assert (=> b!89558 (=> (not res!73769) (not e!59146))))

(declare-fun lt!136656 () (_ BitVec 64))

(declare-fun lt!136654 () (_ BitVec 64))

(assert (=> b!89558 (= res!73769 (= (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136653))) (currentByte!4550 (_2!3986 lt!136653)) (currentBit!4545 (_2!3986 lt!136653))) (bvadd lt!136654 lt!136656)))))

(assert (=> b!89558 (or (not (= (bvand lt!136654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136656 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136654 lt!136656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89558 (= lt!136656 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!89558 (= lt!136654 (bitIndex!0 (size!1906 (buf!2296 thiss!1152)) (currentByte!4550 thiss!1152) (currentBit!4545 thiss!1152)))))

(assert (= (and d!27960 res!73768) b!89558))

(assert (= (and b!89558 res!73769) b!89559))

(assert (= (and b!89559 res!73771) b!89560))

(assert (= (and b!89560 res!73770) b!89561))

(declare-fun m!134367 () Bool)

(assert (=> d!27960 m!134367))

(declare-fun m!134369 () Bool)

(assert (=> d!27960 m!134369))

(declare-fun m!134371 () Bool)

(assert (=> b!89559 m!134371))

(declare-fun m!134373 () Bool)

(assert (=> b!89561 m!134373))

(declare-fun m!134375 () Bool)

(assert (=> b!89561 m!134375))

(declare-fun m!134377 () Bool)

(assert (=> b!89560 m!134377))

(assert (=> b!89560 m!134377))

(declare-fun m!134379 () Bool)

(assert (=> b!89560 m!134379))

(assert (=> b!89558 m!134375))

(assert (=> b!89558 m!134275))

(assert (=> b!89455 d!27960))

(declare-fun d!27964 () Bool)

(assert (=> d!27964 (= (array_inv!1752 (buf!2296 thiss!1152)) (bvsge (size!1906 (buf!2296 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!89442 d!27964))

(declare-fun d!27966 () Bool)

(assert (=> d!27966 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1151))) ((_ sign_extend 32) (currentByte!4550 thiss!1151)) ((_ sign_extend 32) (currentBit!4545 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1151))) ((_ sign_extend 32) (currentByte!4550 thiss!1151)) ((_ sign_extend 32) (currentBit!4545 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6932 () Bool)

(assert (= bs!6932 d!27966))

(declare-fun m!134381 () Bool)

(assert (=> bs!6932 m!134381))

(assert (=> b!89453 d!27966))

(declare-fun d!27968 () Bool)

(assert (=> d!27968 (= (invariant!0 (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152) (size!1906 (buf!2296 thiss!1152))) (and (bvsge (currentBit!4545 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4545 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4550 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4550 thiss!1152) (size!1906 (buf!2296 thiss!1152))) (and (= (currentBit!4545 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4550 thiss!1152) (size!1906 (buf!2296 thiss!1152)))))))))

(assert (=> b!89452 d!27968))

(declare-fun d!27970 () Bool)

(declare-datatypes ((tuple2!7506 0))(
  ( (tuple2!7507 (_1!3989 Bool) (_2!3989 BitStream!3374)) )
))
(declare-fun lt!136675 () tuple2!7506)

(declare-fun readBit!0 (BitStream!3374) tuple2!7506)

(assert (=> d!27970 (= lt!136675 (readBit!0 (readerFrom!0 (_2!3986 lt!136524) (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152))))))

(assert (=> d!27970 (= (readBitPure!0 (readerFrom!0 (_2!3986 lt!136524) (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152))) (tuple2!7501 (_2!3989 lt!136675) (_1!3989 lt!136675)))))

(declare-fun bs!6933 () Bool)

(assert (= bs!6933 d!27970))

(assert (=> bs!6933 m!134303))

(declare-fun m!134385 () Bool)

(assert (=> bs!6933 m!134385))

(assert (=> b!89440 d!27970))

(declare-fun d!27972 () Bool)

(declare-fun e!59165 () Bool)

(assert (=> d!27972 e!59165))

(declare-fun res!73812 () Bool)

(assert (=> d!27972 (=> (not res!73812) (not e!59165))))

(assert (=> d!27972 (= res!73812 (invariant!0 (currentBit!4545 (_2!3986 lt!136524)) (currentByte!4550 (_2!3986 lt!136524)) (size!1906 (buf!2296 (_2!3986 lt!136524)))))))

(assert (=> d!27972 (= (readerFrom!0 (_2!3986 lt!136524) (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152)) (BitStream!3375 (buf!2296 (_2!3986 lt!136524)) (currentByte!4550 thiss!1152) (currentBit!4545 thiss!1152)))))

(declare-fun b!89605 () Bool)

(assert (=> b!89605 (= e!59165 (invariant!0 (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152) (size!1906 (buf!2296 (_2!3986 lt!136524)))))))

(assert (= (and d!27972 res!73812) b!89605))

(assert (=> d!27972 m!134291))

(declare-fun m!134387 () Bool)

(assert (=> b!89605 m!134387))

(assert (=> b!89440 d!27972))

(declare-fun d!27974 () Bool)

(declare-fun e!59199 () Bool)

(assert (=> d!27974 e!59199))

(declare-fun res!73894 () Bool)

(assert (=> d!27974 (=> (not res!73894) (not e!59199))))

(declare-fun lt!136733 () tuple3!422)

(assert (=> d!27974 (= res!73894 (bvsge (_3!235 lt!136733) #b00000000000000000000000000000000))))

(declare-fun e!59202 () tuple3!422)

(assert (=> d!27974 (= lt!136733 e!59202)))

(declare-fun c!5867 () Bool)

(declare-fun lt!136729 () (_ BitVec 32))

(assert (=> d!27974 (= c!5867 (bvslt lt!136729 nBits!336))))

(assert (=> d!27974 (= lt!136729 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(declare-fun lt!136731 () tuple2!7502)

(declare-fun lt!136727 () tuple2!7502)

(assert (=> d!27974 (= lt!136731 lt!136727)))

(declare-fun e!59200 () Bool)

(assert (=> d!27974 e!59200))

(declare-fun res!73886 () Bool)

(assert (=> d!27974 (=> (not res!73886) (not e!59200))))

(assert (=> d!27974 (= res!73886 (= (size!1906 (buf!2296 (_2!3986 lt!136524))) (size!1906 (buf!2296 (_2!3986 lt!136727)))))))

(declare-fun lt!136734 () Bool)

(assert (=> d!27974 (= lt!136727 (appendBit!0 (_2!3986 lt!136524) lt!136734))))

(assert (=> d!27974 (= lt!136734 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!59201 () Bool)

(assert (=> d!27974 e!59201))

(declare-fun res!73895 () Bool)

(assert (=> d!27974 (=> (not res!73895) (not e!59201))))

(assert (=> d!27974 (= res!73895 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!27974 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3986 lt!136524) (bvadd #b00000000000000000000000000000001 i!576)) lt!136733)))

(declare-fun b!89683 () Bool)

(declare-fun res!73890 () Bool)

(assert (=> b!89683 (=> (not res!73890) (not e!59199))))

(assert (=> b!89683 (= res!73890 (and (bvsle (_3!235 lt!136733) nBits!336) (= (size!1906 (buf!2296 (_2!3987 lt!136733))) (size!1906 (buf!2296 thiss!1151)))))))

(declare-fun b!89684 () Bool)

(assert (=> b!89684 (= e!59201 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89685 () Bool)

(declare-fun res!73893 () Bool)

(assert (=> b!89685 (=> (not res!73893) (not e!59199))))

(assert (=> b!89685 (= res!73893 (invariant!0 (currentBit!4545 (_2!3987 lt!136733)) (currentByte!4550 (_2!3987 lt!136733)) (size!1906 (buf!2296 (_2!3987 lt!136733)))))))

(declare-fun b!89686 () Bool)

(declare-fun res!73896 () Bool)

(assert (=> b!89686 (=> (not res!73896) (not e!59201))))

(assert (=> b!89686 (= res!73896 (= (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136524))) (currentByte!4550 (_2!3986 lt!136524)) (currentBit!4545 (_2!3986 lt!136524))) (bvadd (bitIndex!0 (size!1906 (buf!2296 thiss!1151)) (currentByte!4550 thiss!1151) (currentBit!4545 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!89687 () Bool)

(assert (=> b!89687 (= e!59202 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3986 lt!136731) lt!136729))))

(declare-fun b!89688 () Bool)

(declare-fun res!73897 () Bool)

(assert (=> b!89688 (=> (not res!73897) (not e!59201))))

(assert (=> b!89688 (= res!73897 (validate_offset_bits!1 ((_ sign_extend 32) (size!1906 (buf!2296 (_2!3986 lt!136524)))) ((_ sign_extend 32) (currentByte!4550 (_2!3986 lt!136524))) ((_ sign_extend 32) (currentBit!4545 (_2!3986 lt!136524))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!89689 () Bool)

(assert (=> b!89689 (= e!59199 (bvsge (_3!235 lt!136733) nBits!336))))

(declare-fun b!89690 () Bool)

(declare-fun Unit!5799 () Unit!5795)

(assert (=> b!89690 (= e!59202 (tuple3!423 Unit!5799 (_2!3986 lt!136731) lt!136729))))

(declare-fun b!89691 () Bool)

(declare-fun e!59198 () Bool)

(declare-fun lt!136732 () tuple2!7500)

(assert (=> b!89691 (= e!59198 (= (bitIndex!0 (size!1906 (buf!2296 (_1!3985 lt!136732))) (currentByte!4550 (_1!3985 lt!136732)) (currentBit!4545 (_1!3985 lt!136732))) (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136727))) (currentByte!4550 (_2!3986 lt!136727)) (currentBit!4545 (_2!3986 lt!136727)))))))

(declare-fun b!89692 () Bool)

(declare-fun res!73885 () Bool)

(assert (=> b!89692 (=> (not res!73885) (not e!59199))))

(declare-fun lt!136730 () (_ BitVec 64))

(declare-fun lt!136728 () (_ BitVec 64))

(assert (=> b!89692 (= res!73885 (= (bitIndex!0 (size!1906 (buf!2296 (_2!3987 lt!136733))) (currentByte!4550 (_2!3987 lt!136733)) (currentBit!4545 (_2!3987 lt!136733))) (bvadd lt!136730 lt!136728)))))

(assert (=> b!89692 (or (not (= (bvand lt!136730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136728 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136730 lt!136728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89692 (= lt!136728 ((_ sign_extend 32) (_3!235 lt!136733)))))

(assert (=> b!89692 (= lt!136730 (bitIndex!0 (size!1906 (buf!2296 thiss!1151)) (currentByte!4550 thiss!1151) (currentBit!4545 thiss!1151)))))

(declare-fun b!89693 () Bool)

(declare-fun res!73889 () Bool)

(assert (=> b!89693 (=> (not res!73889) (not e!59200))))

(assert (=> b!89693 (= res!73889 (= (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136727))) (currentByte!4550 (_2!3986 lt!136727)) (currentBit!4545 (_2!3986 lt!136727))) (bvadd (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136524))) (currentByte!4550 (_2!3986 lt!136524)) (currentBit!4545 (_2!3986 lt!136524))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!89694 () Bool)

(declare-fun res!73887 () Bool)

(assert (=> b!89694 (=> (not res!73887) (not e!59201))))

(assert (=> b!89694 (= res!73887 (invariant!0 (currentBit!4545 (_2!3986 lt!136524)) (currentByte!4550 (_2!3986 lt!136524)) (size!1906 (buf!2296 (_2!3986 lt!136524)))))))

(declare-fun b!89695 () Bool)

(declare-fun res!73891 () Bool)

(assert (=> b!89695 (=> (not res!73891) (not e!59201))))

(assert (=> b!89695 (= res!73891 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1906 (buf!2296 (_2!3986 lt!136524))) (size!1906 (buf!2296 thiss!1151)))))))

(declare-fun b!89696 () Bool)

(declare-fun res!73884 () Bool)

(assert (=> b!89696 (=> (not res!73884) (not e!59200))))

(assert (=> b!89696 (= res!73884 (isPrefixOf!0 (_2!3986 lt!136524) (_2!3986 lt!136727)))))

(declare-fun b!89697 () Bool)

(declare-fun res!73892 () Bool)

(assert (=> b!89697 (=> (not res!73892) (not e!59199))))

(assert (=> b!89697 (= res!73892 (validate_offset_bits!1 ((_ sign_extend 32) (size!1906 (buf!2296 (_2!3987 lt!136733)))) ((_ sign_extend 32) (currentByte!4550 (_2!3987 lt!136733))) ((_ sign_extend 32) (currentBit!4545 (_2!3987 lt!136733))) ((_ sign_extend 32) (bvsub nBits!336 (_3!235 lt!136733)))))))

(assert (=> b!89697 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!235 lt!136733) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!235 lt!136733)) #b10000000000000000000000000000000)))))

(declare-fun b!89698 () Bool)

(assert (=> b!89698 (= e!59200 e!59198)))

(declare-fun res!73888 () Bool)

(assert (=> b!89698 (=> (not res!73888) (not e!59198))))

(assert (=> b!89698 (= res!73888 (and (= (_2!3985 lt!136732) lt!136734) (= (_1!3985 lt!136732) (_2!3986 lt!136727))))))

(assert (=> b!89698 (= lt!136732 (readBitPure!0 (readerFrom!0 (_2!3986 lt!136727) (currentBit!4545 (_2!3986 lt!136524)) (currentByte!4550 (_2!3986 lt!136524)))))))

(assert (= (and d!27974 res!73895) b!89694))

(assert (= (and b!89694 res!73887) b!89695))

(assert (= (and b!89695 res!73891) b!89686))

(assert (= (and b!89686 res!73896) b!89688))

(assert (= (and b!89688 res!73897) b!89684))

(assert (= (and d!27974 res!73886) b!89693))

(assert (= (and b!89693 res!73889) b!89696))

(assert (= (and b!89696 res!73884) b!89698))

(assert (= (and b!89698 res!73888) b!89691))

(assert (= (and d!27974 c!5867) b!89687))

(assert (= (and d!27974 (not c!5867)) b!89690))

(assert (= (and d!27974 res!73894) b!89685))

(assert (= (and b!89685 res!73893) b!89683))

(assert (= (and b!89683 res!73890) b!89692))

(assert (= (and b!89692 res!73885) b!89697))

(assert (= (and b!89697 res!73892) b!89689))

(assert (=> b!89694 m!134291))

(declare-fun m!134437 () Bool)

(assert (=> b!89693 m!134437))

(assert (=> b!89693 m!134297))

(assert (=> b!89686 m!134297))

(assert (=> b!89686 m!134277))

(declare-fun m!134439 () Bool)

(assert (=> b!89692 m!134439))

(assert (=> b!89692 m!134277))

(declare-fun m!134441 () Bool)

(assert (=> b!89691 m!134441))

(assert (=> b!89691 m!134437))

(declare-fun m!134443 () Bool)

(assert (=> b!89687 m!134443))

(declare-fun m!134445 () Bool)

(assert (=> b!89698 m!134445))

(assert (=> b!89698 m!134445))

(declare-fun m!134447 () Bool)

(assert (=> b!89698 m!134447))

(declare-fun m!134449 () Bool)

(assert (=> b!89688 m!134449))

(declare-fun m!134451 () Bool)

(assert (=> b!89697 m!134451))

(declare-fun m!134453 () Bool)

(assert (=> d!27974 m!134453))

(declare-fun m!134455 () Bool)

(assert (=> b!89696 m!134455))

(declare-fun m!134457 () Bool)

(assert (=> b!89685 m!134457))

(assert (=> b!89451 d!27974))

(declare-fun d!28004 () Bool)

(assert (=> d!28004 (= (invariant!0 (currentBit!4545 thiss!1151) (currentByte!4550 thiss!1151) (size!1906 (buf!2296 thiss!1151))) (and (bvsge (currentBit!4545 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4545 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4550 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4550 thiss!1151) (size!1906 (buf!2296 thiss!1151))) (and (= (currentBit!4545 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4550 thiss!1151) (size!1906 (buf!2296 thiss!1151)))))))))

(assert (=> b!89458 d!28004))

(declare-fun d!28006 () Bool)

(assert (=> d!28006 (= (invariant!0 (currentBit!4545 (_2!3987 lt!136521)) (currentByte!4550 (_2!3987 lt!136521)) (size!1906 (buf!2296 (_2!3987 lt!136521)))) (and (bvsge (currentBit!4545 (_2!3987 lt!136521)) #b00000000000000000000000000000000) (bvslt (currentBit!4545 (_2!3987 lt!136521)) #b00000000000000000000000000001000) (bvsge (currentByte!4550 (_2!3987 lt!136521)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4550 (_2!3987 lt!136521)) (size!1906 (buf!2296 (_2!3987 lt!136521)))) (and (= (currentBit!4545 (_2!3987 lt!136521)) #b00000000000000000000000000000000) (= (currentByte!4550 (_2!3987 lt!136521)) (size!1906 (buf!2296 (_2!3987 lt!136521))))))))))

(assert (=> b!89448 d!28006))

(declare-fun d!28008 () Bool)

(assert (=> d!28008 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1152))) ((_ sign_extend 32) (currentByte!4550 thiss!1152)) ((_ sign_extend 32) (currentBit!4545 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1152))) ((_ sign_extend 32) (currentByte!4550 thiss!1152)) ((_ sign_extend 32) (currentBit!4545 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6938 () Bool)

(assert (= bs!6938 d!28008))

(declare-fun m!134459 () Bool)

(assert (=> bs!6938 m!134459))

(assert (=> b!89446 d!28008))

(declare-fun d!28010 () Bool)

(declare-fun res!73906 () Bool)

(declare-fun e!59207 () Bool)

(assert (=> d!28010 (=> (not res!73906) (not e!59207))))

(assert (=> d!28010 (= res!73906 (= (size!1906 (buf!2296 thiss!1152)) (size!1906 (buf!2296 (_2!3986 lt!136524)))))))

(assert (=> d!28010 (= (isPrefixOf!0 thiss!1152 (_2!3986 lt!136524)) e!59207)))

(declare-fun b!89705 () Bool)

(declare-fun res!73904 () Bool)

(assert (=> b!89705 (=> (not res!73904) (not e!59207))))

(assert (=> b!89705 (= res!73904 (bvsle (bitIndex!0 (size!1906 (buf!2296 thiss!1152)) (currentByte!4550 thiss!1152) (currentBit!4545 thiss!1152)) (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136524))) (currentByte!4550 (_2!3986 lt!136524)) (currentBit!4545 (_2!3986 lt!136524)))))))

(declare-fun b!89706 () Bool)

(declare-fun e!59208 () Bool)

(assert (=> b!89706 (= e!59207 e!59208)))

(declare-fun res!73905 () Bool)

(assert (=> b!89706 (=> res!73905 e!59208)))

(assert (=> b!89706 (= res!73905 (= (size!1906 (buf!2296 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!89707 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4222 array!4222 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89707 (= e!59208 (arrayBitRangesEq!0 (buf!2296 thiss!1152) (buf!2296 (_2!3986 lt!136524)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1906 (buf!2296 thiss!1152)) (currentByte!4550 thiss!1152) (currentBit!4545 thiss!1152))))))

(assert (= (and d!28010 res!73906) b!89705))

(assert (= (and b!89705 res!73904) b!89706))

(assert (= (and b!89706 (not res!73905)) b!89707))

(assert (=> b!89705 m!134275))

(assert (=> b!89705 m!134297))

(assert (=> b!89707 m!134275))

(assert (=> b!89707 m!134275))

(declare-fun m!134461 () Bool)

(assert (=> b!89707 m!134461))

(assert (=> b!89447 d!28010))

(declare-fun d!28012 () Bool)

(declare-fun e!59209 () Bool)

(assert (=> d!28012 e!59209))

(declare-fun res!73907 () Bool)

(assert (=> d!28012 (=> (not res!73907) (not e!59209))))

(declare-fun lt!136735 () (_ BitVec 64))

(declare-fun lt!136739 () (_ BitVec 64))

(declare-fun lt!136737 () (_ BitVec 64))

(assert (=> d!28012 (= res!73907 (= lt!136737 (bvsub lt!136739 lt!136735)))))

(assert (=> d!28012 (or (= (bvand lt!136739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136739 lt!136735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28012 (= lt!136735 (remainingBits!0 ((_ sign_extend 32) (size!1906 (buf!2296 (_2!3986 lt!136524)))) ((_ sign_extend 32) (currentByte!4550 (_2!3986 lt!136524))) ((_ sign_extend 32) (currentBit!4545 (_2!3986 lt!136524)))))))

(declare-fun lt!136740 () (_ BitVec 64))

(declare-fun lt!136736 () (_ BitVec 64))

(assert (=> d!28012 (= lt!136739 (bvmul lt!136740 lt!136736))))

(assert (=> d!28012 (or (= lt!136740 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136736 (bvsdiv (bvmul lt!136740 lt!136736) lt!136740)))))

(assert (=> d!28012 (= lt!136736 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28012 (= lt!136740 ((_ sign_extend 32) (size!1906 (buf!2296 (_2!3986 lt!136524)))))))

(assert (=> d!28012 (= lt!136737 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4550 (_2!3986 lt!136524))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4545 (_2!3986 lt!136524)))))))

(assert (=> d!28012 (invariant!0 (currentBit!4545 (_2!3986 lt!136524)) (currentByte!4550 (_2!3986 lt!136524)) (size!1906 (buf!2296 (_2!3986 lt!136524))))))

(assert (=> d!28012 (= (bitIndex!0 (size!1906 (buf!2296 (_2!3986 lt!136524))) (currentByte!4550 (_2!3986 lt!136524)) (currentBit!4545 (_2!3986 lt!136524))) lt!136737)))

(declare-fun b!89708 () Bool)

(declare-fun res!73908 () Bool)

(assert (=> b!89708 (=> (not res!73908) (not e!59209))))

(assert (=> b!89708 (= res!73908 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136737))))

(declare-fun b!89709 () Bool)

(declare-fun lt!136738 () (_ BitVec 64))

(assert (=> b!89709 (= e!59209 (bvsle lt!136737 (bvmul lt!136738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89709 (or (= lt!136738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136738)))))

(assert (=> b!89709 (= lt!136738 ((_ sign_extend 32) (size!1906 (buf!2296 (_2!3986 lt!136524)))))))

(assert (= (and d!28012 res!73907) b!89708))

(assert (= (and b!89708 res!73908) b!89709))

(declare-fun m!134463 () Bool)

(assert (=> d!28012 m!134463))

(assert (=> d!28012 m!134291))

(assert (=> b!89445 d!28012))

(declare-fun d!28014 () Bool)

(declare-fun e!59210 () Bool)

(assert (=> d!28014 e!59210))

(declare-fun res!73909 () Bool)

(assert (=> d!28014 (=> (not res!73909) (not e!59210))))

(declare-fun lt!136743 () (_ BitVec 64))

(declare-fun lt!136741 () (_ BitVec 64))

(declare-fun lt!136745 () (_ BitVec 64))

(assert (=> d!28014 (= res!73909 (= lt!136743 (bvsub lt!136745 lt!136741)))))

(assert (=> d!28014 (or (= (bvand lt!136745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136745 lt!136741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28014 (= lt!136741 (remainingBits!0 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1152))) ((_ sign_extend 32) (currentByte!4550 thiss!1152)) ((_ sign_extend 32) (currentBit!4545 thiss!1152))))))

(declare-fun lt!136746 () (_ BitVec 64))

(declare-fun lt!136742 () (_ BitVec 64))

(assert (=> d!28014 (= lt!136745 (bvmul lt!136746 lt!136742))))

(assert (=> d!28014 (or (= lt!136746 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136742 (bvsdiv (bvmul lt!136746 lt!136742) lt!136746)))))

(assert (=> d!28014 (= lt!136742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28014 (= lt!136746 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1152))))))

(assert (=> d!28014 (= lt!136743 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4550 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4545 thiss!1152))))))

(assert (=> d!28014 (invariant!0 (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152) (size!1906 (buf!2296 thiss!1152)))))

(assert (=> d!28014 (= (bitIndex!0 (size!1906 (buf!2296 thiss!1152)) (currentByte!4550 thiss!1152) (currentBit!4545 thiss!1152)) lt!136743)))

(declare-fun b!89710 () Bool)

(declare-fun res!73910 () Bool)

(assert (=> b!89710 (=> (not res!73910) (not e!59210))))

(assert (=> b!89710 (= res!73910 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136743))))

(declare-fun b!89711 () Bool)

(declare-fun lt!136744 () (_ BitVec 64))

(assert (=> b!89711 (= e!59210 (bvsle lt!136743 (bvmul lt!136744 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89711 (or (= lt!136744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136744)))))

(assert (=> b!89711 (= lt!136744 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1152))))))

(assert (= (and d!28014 res!73909) b!89710))

(assert (= (and b!89710 res!73910) b!89711))

(assert (=> d!28014 m!134459))

(assert (=> d!28014 m!134273))

(assert (=> b!89456 d!28014))

(declare-fun d!28016 () Bool)

(declare-fun e!59211 () Bool)

(assert (=> d!28016 e!59211))

(declare-fun res!73911 () Bool)

(assert (=> d!28016 (=> (not res!73911) (not e!59211))))

(declare-fun lt!136751 () (_ BitVec 64))

(declare-fun lt!136747 () (_ BitVec 64))

(declare-fun lt!136749 () (_ BitVec 64))

(assert (=> d!28016 (= res!73911 (= lt!136749 (bvsub lt!136751 lt!136747)))))

(assert (=> d!28016 (or (= (bvand lt!136751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136751 lt!136747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28016 (= lt!136747 (remainingBits!0 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1151))) ((_ sign_extend 32) (currentByte!4550 thiss!1151)) ((_ sign_extend 32) (currentBit!4545 thiss!1151))))))

(declare-fun lt!136752 () (_ BitVec 64))

(declare-fun lt!136748 () (_ BitVec 64))

(assert (=> d!28016 (= lt!136751 (bvmul lt!136752 lt!136748))))

(assert (=> d!28016 (or (= lt!136752 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136748 (bvsdiv (bvmul lt!136752 lt!136748) lt!136752)))))

(assert (=> d!28016 (= lt!136748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28016 (= lt!136752 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1151))))))

(assert (=> d!28016 (= lt!136749 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4550 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4545 thiss!1151))))))

(assert (=> d!28016 (invariant!0 (currentBit!4545 thiss!1151) (currentByte!4550 thiss!1151) (size!1906 (buf!2296 thiss!1151)))))

(assert (=> d!28016 (= (bitIndex!0 (size!1906 (buf!2296 thiss!1151)) (currentByte!4550 thiss!1151) (currentBit!4545 thiss!1151)) lt!136749)))

(declare-fun b!89712 () Bool)

(declare-fun res!73912 () Bool)

(assert (=> b!89712 (=> (not res!73912) (not e!59211))))

(assert (=> b!89712 (= res!73912 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136749))))

(declare-fun b!89713 () Bool)

(declare-fun lt!136750 () (_ BitVec 64))

(assert (=> b!89713 (= e!59211 (bvsle lt!136749 (bvmul lt!136750 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89713 (or (= lt!136750 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136750 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136750)))))

(assert (=> b!89713 (= lt!136750 ((_ sign_extend 32) (size!1906 (buf!2296 thiss!1151))))))

(assert (= (and d!28016 res!73911) b!89712))

(assert (= (and b!89712 res!73912) b!89713))

(assert (=> d!28016 m!134381))

(assert (=> d!28016 m!134295))

(assert (=> b!89456 d!28016))

(declare-fun d!28018 () Bool)

(assert (=> d!28018 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4545 thiss!1152) (currentByte!4550 thiss!1152) (size!1906 (buf!2296 thiss!1152))))))

(declare-fun bs!6939 () Bool)

(assert (= bs!6939 d!28018))

(assert (=> bs!6939 m!134273))

(assert (=> start!18116 d!28018))

(declare-fun d!28020 () Bool)

(assert (=> d!28020 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4545 thiss!1151) (currentByte!4550 thiss!1151) (size!1906 (buf!2296 thiss!1151))))))

(declare-fun bs!6940 () Bool)

(assert (= bs!6940 d!28020))

(assert (=> bs!6940 m!134295))

(assert (=> start!18116 d!28020))

(push 1)

(assert (not b!89707))

(assert (not b!89698))

(assert (not d!27944))

(assert (not b!89697))

(assert (not b!89691))

(assert (not d!28008))

(assert (not d!28012))

(assert (not b!89558))

(assert (not d!27970))

(assert (not b!89560))

(assert (not b!89561))

(assert (not b!89705))

(assert (not b!89688))

(assert (not b!89694))

(assert (not b!89692))

(assert (not d!27966))

(assert (not b!89685))

(assert (not b!89693))

(assert (not d!28018))

(assert (not b!89686))

(assert (not d!27972))

(assert (not d!27960))

(assert (not b!89605))

(assert (not b!89696))

(assert (not d!28014))

(assert (not b!89687))

(assert (not d!28016))

(assert (not b!89559))

(assert (not d!28020))

(assert (not d!27974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

