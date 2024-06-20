; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65646 () Bool)

(assert start!65646)

(declare-fun b!294384 () Bool)

(declare-fun res!243088 () Bool)

(declare-fun e!210403 () Bool)

(assert (=> b!294384 (=> (not res!243088) (not e!210403))))

(declare-datatypes ((array!17629 0))(
  ( (array!17630 (arr!8675 (Array (_ BitVec 32) (_ BitVec 8))) (size!7640 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13284 0))(
  ( (BitStream!13285 (buf!7703 array!17629) (currentByte!14194 (_ BitVec 32)) (currentBit!14189 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13284)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294384 (= res!243088 (validate_offset_bits!1 ((_ sign_extend 32) (size!7640 (buf!7703 thiss!1728))) ((_ sign_extend 32) (currentByte!14194 thiss!1728)) ((_ sign_extend 32) (currentBit!14189 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294385 () Bool)

(declare-fun e!210408 () Bool)

(declare-fun e!210405 () Bool)

(assert (=> b!294385 (= e!210408 e!210405)))

(declare-fun res!243085 () Bool)

(assert (=> b!294385 (=> res!243085 e!210405)))

(declare-fun lt!427475 () (_ BitVec 64))

(assert (=> b!294385 (= res!243085 (or (bvsgt from!505 lt!427475) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!427475)))))

(declare-fun arr!273 () array!17629)

(assert (=> b!294385 (= lt!427475 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7640 arr!273))))))

(declare-fun b!294386 () Bool)

(declare-fun e!210407 () Bool)

(declare-fun array_inv!7252 (array!17629) Bool)

(assert (=> b!294386 (= e!210407 (array_inv!7252 (buf!7703 thiss!1728)))))

(declare-fun res!243086 () Bool)

(assert (=> start!65646 (=> (not res!243086) (not e!210403))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65646 (= res!243086 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7640 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65646 e!210403))

(declare-fun inv!12 (BitStream!13284) Bool)

(assert (=> start!65646 (and (inv!12 thiss!1728) e!210407)))

(assert (=> start!65646 true))

(assert (=> start!65646 (array_inv!7252 arr!273)))

(declare-datatypes ((Unit!20505 0))(
  ( (Unit!20506) )
))
(declare-datatypes ((tuple3!1796 0))(
  ( (tuple3!1797 (_1!12910 Unit!20505) (_2!12910 BitStream!13284) (_3!1333 array!17629)) )
))
(declare-fun lt!427481 () tuple3!1796)

(declare-fun e!210406 () Bool)

(declare-fun b!294387 () Bool)

(assert (=> b!294387 (= e!210406 (and (= (buf!7703 thiss!1728) (buf!7703 (_2!12910 lt!427481))) (= (size!7640 arr!273) (size!7640 (_3!1333 lt!427481)))))))

(declare-fun b!294388 () Bool)

(declare-fun res!243084 () Bool)

(assert (=> b!294388 (=> (not res!243084) (not e!210403))))

(assert (=> b!294388 (= res!243084 (bvslt from!505 to!474))))

(declare-fun lt!427476 () array!17629)

(declare-fun b!294389 () Bool)

(declare-fun arrayBitRangesEq!0 (array!17629 array!17629 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294389 (= e!210405 (arrayBitRangesEq!0 lt!427476 (_3!1333 lt!427481) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294390 () Bool)

(assert (=> b!294390 (= e!210403 (not e!210408))))

(declare-fun res!243089 () Bool)

(assert (=> b!294390 (=> res!243089 e!210408)))

(assert (=> b!294390 (= res!243089 (bvsgt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294390 (arrayBitRangesEq!0 arr!273 lt!427476 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!427480 () Unit!20505)

(declare-datatypes ((tuple2!23154 0))(
  ( (tuple2!23155 (_1!12911 Bool) (_2!12911 BitStream!13284)) )
))
(declare-fun lt!427478 () tuple2!23154)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17629 (_ BitVec 64) Bool) Unit!20505)

(assert (=> b!294390 (= lt!427480 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12911 lt!427478)))))

(assert (=> b!294390 e!210406))

(declare-fun res!243087 () Bool)

(assert (=> b!294390 (=> (not res!243087) (not e!210406))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294390 (= res!243087 (= (bvsub (bvadd (bitIndex!0 (size!7640 (buf!7703 thiss!1728)) (currentByte!14194 thiss!1728) (currentBit!14189 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7640 (buf!7703 (_2!12910 lt!427481))) (currentByte!14194 (_2!12910 lt!427481)) (currentBit!14189 (_2!12910 lt!427481)))))))

(declare-fun readBitsLoop!0 (BitStream!13284 (_ BitVec 64) array!17629 (_ BitVec 64) (_ BitVec 64)) tuple3!1796)

(assert (=> b!294390 (= lt!427481 (readBitsLoop!0 (_2!12911 lt!427478) nBits!523 lt!427476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294390 (validate_offset_bits!1 ((_ sign_extend 32) (size!7640 (buf!7703 (_2!12911 lt!427478)))) ((_ sign_extend 32) (currentByte!14194 (_2!12911 lt!427478))) ((_ sign_extend 32) (currentBit!14189 (_2!12911 lt!427478))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427479 () Unit!20505)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13284 BitStream!13284 (_ BitVec 64) (_ BitVec 64)) Unit!20505)

(assert (=> b!294390 (= lt!427479 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12911 lt!427478) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427482 () (_ BitVec 32))

(declare-fun lt!427477 () (_ BitVec 32))

(assert (=> b!294390 (= lt!427476 (array!17630 (store (arr!8675 arr!273) lt!427477 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8675 arr!273) lt!427477)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427482)))) ((_ sign_extend 24) (ite (_1!12911 lt!427478) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427482) #b00000000))))) (size!7640 arr!273)))))

(assert (=> b!294390 (= lt!427482 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294390 (= lt!427477 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13284) tuple2!23154)

(assert (=> b!294390 (= lt!427478 (readBit!0 thiss!1728))))

(assert (= (and start!65646 res!243086) b!294384))

(assert (= (and b!294384 res!243088) b!294388))

(assert (= (and b!294388 res!243084) b!294390))

(assert (= (and b!294390 res!243087) b!294387))

(assert (= (and b!294390 (not res!243089)) b!294385))

(assert (= (and b!294385 (not res!243085)) b!294389))

(assert (= start!65646 b!294386))

(declare-fun m!430647 () Bool)

(assert (=> b!294390 m!430647))

(declare-fun m!430649 () Bool)

(assert (=> b!294390 m!430649))

(declare-fun m!430651 () Bool)

(assert (=> b!294390 m!430651))

(declare-fun m!430653 () Bool)

(assert (=> b!294390 m!430653))

(declare-fun m!430655 () Bool)

(assert (=> b!294390 m!430655))

(declare-fun m!430657 () Bool)

(assert (=> b!294390 m!430657))

(declare-fun m!430659 () Bool)

(assert (=> b!294390 m!430659))

(declare-fun m!430661 () Bool)

(assert (=> b!294390 m!430661))

(declare-fun m!430663 () Bool)

(assert (=> b!294390 m!430663))

(declare-fun m!430665 () Bool)

(assert (=> b!294390 m!430665))

(declare-fun m!430667 () Bool)

(assert (=> b!294390 m!430667))

(declare-fun m!430669 () Bool)

(assert (=> b!294386 m!430669))

(declare-fun m!430671 () Bool)

(assert (=> b!294389 m!430671))

(declare-fun m!430673 () Bool)

(assert (=> start!65646 m!430673))

(declare-fun m!430675 () Bool)

(assert (=> start!65646 m!430675))

(declare-fun m!430677 () Bool)

(assert (=> b!294384 m!430677))

(check-sat (not b!294390) (not b!294384) (not b!294389) (not start!65646) (not b!294386))
(check-sat)
(get-model)

(declare-fun c!13410 () Bool)

(declare-fun lt!427513 () (_ BitVec 32))

(declare-fun lt!427515 () (_ BitVec 32))

(declare-fun call!5003 () Bool)

(declare-datatypes ((tuple4!870 0))(
  ( (tuple4!871 (_1!12914 (_ BitVec 32)) (_2!12914 (_ BitVec 32)) (_3!1335 (_ BitVec 32)) (_4!435 (_ BitVec 32))) )
))
(declare-fun lt!427514 () tuple4!870)

(declare-fun bm!5000 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5000 (= call!5003 (byteRangesEq!0 (select (arr!8675 arr!273) (_3!1335 lt!427514)) (select (arr!8675 lt!427476) (_3!1335 lt!427514)) lt!427515 (ite c!13410 lt!427513 #b00000000000000000000000000001000)))))

(declare-fun b!294427 () Bool)

(declare-fun res!243122 () Bool)

(assert (=> b!294427 (= res!243122 (= lt!427513 #b00000000000000000000000000000000))))

(declare-fun e!210447 () Bool)

(assert (=> b!294427 (=> res!243122 e!210447)))

(declare-fun e!210445 () Bool)

(assert (=> b!294427 (= e!210445 e!210447)))

(declare-fun b!294428 () Bool)

(declare-fun e!210444 () Bool)

(declare-fun e!210443 () Bool)

(assert (=> b!294428 (= e!210444 e!210443)))

(declare-fun res!243119 () Bool)

(assert (=> b!294428 (=> (not res!243119) (not e!210443))))

(declare-fun e!210442 () Bool)

(assert (=> b!294428 (= res!243119 e!210442)))

(declare-fun res!243121 () Bool)

(assert (=> b!294428 (=> res!243121 e!210442)))

(assert (=> b!294428 (= res!243121 (bvsge (_1!12914 lt!427514) (_2!12914 lt!427514)))))

(assert (=> b!294428 (= lt!427513 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294428 (= lt!427515 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!870)

(assert (=> b!294428 (= lt!427514 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!294429 () Bool)

(declare-fun e!210446 () Bool)

(assert (=> b!294429 (= e!210446 call!5003)))

(declare-fun b!294430 () Bool)

(assert (=> b!294430 (= e!210443 e!210446)))

(assert (=> b!294430 (= c!13410 (= (_3!1335 lt!427514) (_4!435 lt!427514)))))

(declare-fun b!294431 () Bool)

(assert (=> b!294431 (= e!210446 e!210445)))

(declare-fun res!243118 () Bool)

(assert (=> b!294431 (= res!243118 call!5003)))

(assert (=> b!294431 (=> (not res!243118) (not e!210445))))

(declare-fun b!294432 () Bool)

(assert (=> b!294432 (= e!210447 (byteRangesEq!0 (select (arr!8675 arr!273) (_4!435 lt!427514)) (select (arr!8675 lt!427476) (_4!435 lt!427514)) #b00000000000000000000000000000000 lt!427513))))

(declare-fun d!99322 () Bool)

(declare-fun res!243120 () Bool)

(assert (=> d!99322 (=> res!243120 e!210444)))

(assert (=> d!99322 (= res!243120 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99322 (= (arrayBitRangesEq!0 arr!273 lt!427476 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!210444)))

(declare-fun b!294426 () Bool)

(declare-fun arrayRangesEq!1493 (array!17629 array!17629 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!294426 (= e!210442 (arrayRangesEq!1493 arr!273 lt!427476 (_1!12914 lt!427514) (_2!12914 lt!427514)))))

(assert (= (and d!99322 (not res!243120)) b!294428))

(assert (= (and b!294428 (not res!243121)) b!294426))

(assert (= (and b!294428 res!243119) b!294430))

(assert (= (and b!294430 c!13410) b!294429))

(assert (= (and b!294430 (not c!13410)) b!294431))

(assert (= (and b!294431 res!243118) b!294427))

(assert (= (and b!294427 (not res!243122)) b!294432))

(assert (= (or b!294429 b!294431) bm!5000))

(declare-fun m!430711 () Bool)

(assert (=> bm!5000 m!430711))

(declare-fun m!430713 () Bool)

(assert (=> bm!5000 m!430713))

(assert (=> bm!5000 m!430711))

(assert (=> bm!5000 m!430713))

(declare-fun m!430715 () Bool)

(assert (=> bm!5000 m!430715))

(declare-fun m!430717 () Bool)

(assert (=> b!294428 m!430717))

(declare-fun m!430719 () Bool)

(assert (=> b!294432 m!430719))

(declare-fun m!430721 () Bool)

(assert (=> b!294432 m!430721))

(assert (=> b!294432 m!430719))

(assert (=> b!294432 m!430721))

(declare-fun m!430723 () Bool)

(assert (=> b!294432 m!430723))

(declare-fun m!430725 () Bool)

(assert (=> b!294426 m!430725))

(assert (=> b!294390 d!99322))

(declare-fun d!99324 () Bool)

(declare-fun e!210450 () Bool)

(assert (=> d!99324 e!210450))

(declare-fun res!243128 () Bool)

(assert (=> d!99324 (=> (not res!243128) (not e!210450))))

(declare-fun lt!427532 () (_ BitVec 64))

(declare-fun lt!427528 () (_ BitVec 64))

(declare-fun lt!427530 () (_ BitVec 64))

(assert (=> d!99324 (= res!243128 (= lt!427528 (bvsub lt!427532 lt!427530)))))

(assert (=> d!99324 (or (= (bvand lt!427532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!427530 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!427532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!427532 lt!427530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99324 (= lt!427530 (remainingBits!0 ((_ sign_extend 32) (size!7640 (buf!7703 (_2!12910 lt!427481)))) ((_ sign_extend 32) (currentByte!14194 (_2!12910 lt!427481))) ((_ sign_extend 32) (currentBit!14189 (_2!12910 lt!427481)))))))

(declare-fun lt!427531 () (_ BitVec 64))

(declare-fun lt!427529 () (_ BitVec 64))

(assert (=> d!99324 (= lt!427532 (bvmul lt!427531 lt!427529))))

(assert (=> d!99324 (or (= lt!427531 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!427529 (bvsdiv (bvmul lt!427531 lt!427529) lt!427531)))))

(assert (=> d!99324 (= lt!427529 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99324 (= lt!427531 ((_ sign_extend 32) (size!7640 (buf!7703 (_2!12910 lt!427481)))))))

(assert (=> d!99324 (= lt!427528 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14194 (_2!12910 lt!427481))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14189 (_2!12910 lt!427481)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99324 (invariant!0 (currentBit!14189 (_2!12910 lt!427481)) (currentByte!14194 (_2!12910 lt!427481)) (size!7640 (buf!7703 (_2!12910 lt!427481))))))

(assert (=> d!99324 (= (bitIndex!0 (size!7640 (buf!7703 (_2!12910 lt!427481))) (currentByte!14194 (_2!12910 lt!427481)) (currentBit!14189 (_2!12910 lt!427481))) lt!427528)))

(declare-fun b!294437 () Bool)

(declare-fun res!243127 () Bool)

(assert (=> b!294437 (=> (not res!243127) (not e!210450))))

(assert (=> b!294437 (= res!243127 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!427528))))

(declare-fun b!294438 () Bool)

(declare-fun lt!427533 () (_ BitVec 64))

(assert (=> b!294438 (= e!210450 (bvsle lt!427528 (bvmul lt!427533 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294438 (or (= lt!427533 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!427533 #b0000000000000000000000000000000000000000000000000000000000001000) lt!427533)))))

(assert (=> b!294438 (= lt!427533 ((_ sign_extend 32) (size!7640 (buf!7703 (_2!12910 lt!427481)))))))

(assert (= (and d!99324 res!243128) b!294437))

(assert (= (and b!294437 res!243127) b!294438))

(declare-fun m!430727 () Bool)

(assert (=> d!99324 m!430727))

(declare-fun m!430729 () Bool)

(assert (=> d!99324 m!430729))

(assert (=> b!294390 d!99324))

(declare-fun d!99326 () Bool)

(declare-fun e!210451 () Bool)

(assert (=> d!99326 e!210451))

(declare-fun res!243130 () Bool)

(assert (=> d!99326 (=> (not res!243130) (not e!210451))))

(declare-fun lt!427536 () (_ BitVec 64))

(declare-fun lt!427534 () (_ BitVec 64))

(declare-fun lt!427538 () (_ BitVec 64))

(assert (=> d!99326 (= res!243130 (= lt!427534 (bvsub lt!427538 lt!427536)))))

(assert (=> d!99326 (or (= (bvand lt!427538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!427536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!427538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!427538 lt!427536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99326 (= lt!427536 (remainingBits!0 ((_ sign_extend 32) (size!7640 (buf!7703 thiss!1728))) ((_ sign_extend 32) (currentByte!14194 thiss!1728)) ((_ sign_extend 32) (currentBit!14189 thiss!1728))))))

(declare-fun lt!427537 () (_ BitVec 64))

(declare-fun lt!427535 () (_ BitVec 64))

(assert (=> d!99326 (= lt!427538 (bvmul lt!427537 lt!427535))))

(assert (=> d!99326 (or (= lt!427537 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!427535 (bvsdiv (bvmul lt!427537 lt!427535) lt!427537)))))

(assert (=> d!99326 (= lt!427535 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99326 (= lt!427537 ((_ sign_extend 32) (size!7640 (buf!7703 thiss!1728))))))

(assert (=> d!99326 (= lt!427534 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14194 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14189 thiss!1728))))))

(assert (=> d!99326 (invariant!0 (currentBit!14189 thiss!1728) (currentByte!14194 thiss!1728) (size!7640 (buf!7703 thiss!1728)))))

(assert (=> d!99326 (= (bitIndex!0 (size!7640 (buf!7703 thiss!1728)) (currentByte!14194 thiss!1728) (currentBit!14189 thiss!1728)) lt!427534)))

(declare-fun b!294439 () Bool)

(declare-fun res!243129 () Bool)

(assert (=> b!294439 (=> (not res!243129) (not e!210451))))

(assert (=> b!294439 (= res!243129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!427534))))

(declare-fun b!294440 () Bool)

(declare-fun lt!427539 () (_ BitVec 64))

(assert (=> b!294440 (= e!210451 (bvsle lt!427534 (bvmul lt!427539 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294440 (or (= lt!427539 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!427539 #b0000000000000000000000000000000000000000000000000000000000001000) lt!427539)))))

(assert (=> b!294440 (= lt!427539 ((_ sign_extend 32) (size!7640 (buf!7703 thiss!1728))))))

(assert (= (and d!99326 res!243130) b!294439))

(assert (= (and b!294439 res!243129) b!294440))

(declare-fun m!430731 () Bool)

(assert (=> d!99326 m!430731))

(declare-fun m!430733 () Bool)

(assert (=> d!99326 m!430733))

(assert (=> b!294390 d!99326))

(declare-fun d!99328 () Bool)

(declare-fun e!210454 () Bool)

(assert (=> d!99328 e!210454))

(declare-fun res!243133 () Bool)

(assert (=> d!99328 (=> (not res!243133) (not e!210454))))

(declare-fun lt!427549 () (_ BitVec 32))

(assert (=> d!99328 (= res!243133 (and (bvsge lt!427549 #b00000000000000000000000000000000) (bvslt lt!427549 (size!7640 arr!273))))))

(declare-fun lt!427551 () (_ BitVec 8))

(declare-fun lt!427548 () (_ BitVec 32))

(declare-fun lt!427550 () Unit!20505)

(declare-fun choose!53 (array!17629 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20505)

(assert (=> d!99328 (= lt!427550 (choose!53 arr!273 from!505 (_1!12911 lt!427478) lt!427549 lt!427548 lt!427551))))

(assert (=> d!99328 (= lt!427551 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8675 arr!273) lt!427549)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427548)))) ((_ sign_extend 24) (ite (_1!12911 lt!427478) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427548) #b00000000)))))))

(assert (=> d!99328 (= lt!427548 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99328 (= lt!427549 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99328 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12911 lt!427478)) lt!427550)))

(declare-fun b!294444 () Bool)

(assert (=> b!294444 (= e!210454 (arrayBitRangesEq!0 arr!273 (array!17630 (store (arr!8675 arr!273) lt!427549 lt!427551) (size!7640 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99328 res!243133) b!294444))

(declare-fun m!430735 () Bool)

(assert (=> d!99328 m!430735))

(declare-fun m!430737 () Bool)

(assert (=> d!99328 m!430737))

(declare-fun m!430739 () Bool)

(assert (=> d!99328 m!430739))

(declare-fun m!430741 () Bool)

(assert (=> b!294444 m!430741))

(declare-fun m!430743 () Bool)

(assert (=> b!294444 m!430743))

(assert (=> b!294390 d!99328))

(declare-fun d!99330 () Bool)

(assert (=> d!99330 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7640 (buf!7703 (_2!12911 lt!427478)))) ((_ sign_extend 32) (currentByte!14194 (_2!12911 lt!427478))) ((_ sign_extend 32) (currentBit!14189 (_2!12911 lt!427478))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7640 (buf!7703 (_2!12911 lt!427478)))) ((_ sign_extend 32) (currentByte!14194 (_2!12911 lt!427478))) ((_ sign_extend 32) (currentBit!14189 (_2!12911 lt!427478)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25404 () Bool)

(assert (= bs!25404 d!99330))

(declare-fun m!430745 () Bool)

(assert (=> bs!25404 m!430745))

(assert (=> b!294390 d!99330))

(declare-fun d!99332 () Bool)

(declare-fun e!210457 () Bool)

(assert (=> d!99332 e!210457))

(declare-fun res!243136 () Bool)

(assert (=> d!99332 (=> (not res!243136) (not e!210457))))

(assert (=> d!99332 (= res!243136 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!427554 () Unit!20505)

(declare-fun choose!27 (BitStream!13284 BitStream!13284 (_ BitVec 64) (_ BitVec 64)) Unit!20505)

(assert (=> d!99332 (= lt!427554 (choose!27 thiss!1728 (_2!12911 lt!427478) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99332 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99332 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12911 lt!427478) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!427554)))

(declare-fun b!294447 () Bool)

(assert (=> b!294447 (= e!210457 (validate_offset_bits!1 ((_ sign_extend 32) (size!7640 (buf!7703 (_2!12911 lt!427478)))) ((_ sign_extend 32) (currentByte!14194 (_2!12911 lt!427478))) ((_ sign_extend 32) (currentBit!14189 (_2!12911 lt!427478))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99332 res!243136) b!294447))

(declare-fun m!430747 () Bool)

(assert (=> d!99332 m!430747))

(assert (=> b!294447 m!430647))

(assert (=> b!294390 d!99332))

(declare-fun d!99334 () Bool)

(declare-fun e!210476 () Bool)

(assert (=> d!99334 e!210476))

(declare-fun res!243149 () Bool)

(assert (=> d!99334 (=> (not res!243149) (not e!210476))))

(declare-datatypes ((tuple2!23158 0))(
  ( (tuple2!23159 (_1!12915 Unit!20505) (_2!12915 BitStream!13284)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13284) tuple2!23158)

(assert (=> d!99334 (= res!243149 (= (buf!7703 (_2!12915 (increaseBitIndex!0 thiss!1728))) (buf!7703 thiss!1728)))))

(declare-fun lt!427579 () Bool)

(assert (=> d!99334 (= lt!427579 (not (= (bvand ((_ sign_extend 24) (select (arr!8675 (buf!7703 thiss!1728)) (currentByte!14194 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14189 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!427576 () tuple2!23154)

(assert (=> d!99334 (= lt!427576 (tuple2!23155 (not (= (bvand ((_ sign_extend 24) (select (arr!8675 (buf!7703 thiss!1728)) (currentByte!14194 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14189 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12915 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99334 (validate_offset_bit!0 ((_ sign_extend 32) (size!7640 (buf!7703 thiss!1728))) ((_ sign_extend 32) (currentByte!14194 thiss!1728)) ((_ sign_extend 32) (currentBit!14189 thiss!1728)))))

(assert (=> d!99334 (= (readBit!0 thiss!1728) lt!427576)))

(declare-fun b!294464 () Bool)

(declare-fun lt!427575 () (_ BitVec 64))

(declare-fun lt!427578 () (_ BitVec 64))

(assert (=> b!294464 (= e!210476 (= (bitIndex!0 (size!7640 (buf!7703 (_2!12915 (increaseBitIndex!0 thiss!1728)))) (currentByte!14194 (_2!12915 (increaseBitIndex!0 thiss!1728))) (currentBit!14189 (_2!12915 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!427575 lt!427578)))))

(assert (=> b!294464 (or (not (= (bvand lt!427575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!427578 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!427575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!427575 lt!427578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!294464 (= lt!427578 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!294464 (= lt!427575 (bitIndex!0 (size!7640 (buf!7703 thiss!1728)) (currentByte!14194 thiss!1728) (currentBit!14189 thiss!1728)))))

(declare-fun lt!427580 () Bool)

(assert (=> b!294464 (= lt!427580 (not (= (bvand ((_ sign_extend 24) (select (arr!8675 (buf!7703 thiss!1728)) (currentByte!14194 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14189 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!427581 () Bool)

(assert (=> b!294464 (= lt!427581 (not (= (bvand ((_ sign_extend 24) (select (arr!8675 (buf!7703 thiss!1728)) (currentByte!14194 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14189 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!427577 () Bool)

(assert (=> b!294464 (= lt!427577 (not (= (bvand ((_ sign_extend 24) (select (arr!8675 (buf!7703 thiss!1728)) (currentByte!14194 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14189 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99334 res!243149) b!294464))

(declare-fun m!430753 () Bool)

(assert (=> d!99334 m!430753))

(declare-fun m!430755 () Bool)

(assert (=> d!99334 m!430755))

(declare-fun m!430757 () Bool)

(assert (=> d!99334 m!430757))

(declare-fun m!430759 () Bool)

(assert (=> d!99334 m!430759))

(assert (=> b!294464 m!430651))

(assert (=> b!294464 m!430753))

(assert (=> b!294464 m!430757))

(assert (=> b!294464 m!430755))

(declare-fun m!430761 () Bool)

(assert (=> b!294464 m!430761))

(assert (=> b!294390 d!99334))

(declare-fun lt!427734 () Unit!20505)

(declare-fun e!210504 () tuple3!1796)

(declare-fun b!294508 () Bool)

(assert (=> b!294508 (= e!210504 (tuple3!1797 lt!427734 (_2!12911 lt!427478) lt!427476))))

(declare-fun lt!427785 () Unit!20505)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17629) Unit!20505)

(assert (=> b!294508 (= lt!427785 (arrayBitRangesEqReflexiveLemma!0 lt!427476))))

(declare-fun call!5016 () Bool)

(assert (=> b!294508 call!5016))

(declare-fun lt!427744 () Unit!20505)

(assert (=> b!294508 (= lt!427744 lt!427785)))

(declare-fun lt!427768 () array!17629)

(assert (=> b!294508 (= lt!427768 lt!427476)))

(declare-fun lt!427737 () array!17629)

(assert (=> b!294508 (= lt!427737 lt!427476)))

(declare-fun lt!427795 () (_ BitVec 64))

(assert (=> b!294508 (= lt!427795 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427756 () (_ BitVec 64))

(assert (=> b!294508 (= lt!427756 ((_ sign_extend 32) (size!7640 lt!427476)))))

(declare-fun lt!427773 () (_ BitVec 64))

(assert (=> b!294508 (= lt!427773 (bvmul lt!427756 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!427782 () (_ BitVec 64))

(assert (=> b!294508 (= lt!427782 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427732 () (_ BitVec 64))

(assert (=> b!294508 (= lt!427732 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17629 array!17629 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20505)

(assert (=> b!294508 (= lt!427734 (arrayBitRangesEqSlicedLemma!0 lt!427768 lt!427737 lt!427795 lt!427773 lt!427782 lt!427732))))

(declare-fun call!5017 () Bool)

(assert (=> b!294508 call!5017))

(declare-fun b!294510 () Bool)

(declare-fun res!243188 () Bool)

(declare-fun e!210501 () Bool)

(assert (=> b!294510 (=> (not res!243188) (not e!210501))))

(declare-fun e!210505 () Bool)

(assert (=> b!294510 (= res!243188 e!210505)))

(declare-fun res!243183 () Bool)

(assert (=> b!294510 (=> res!243183 e!210505)))

(assert (=> b!294510 (= res!243183 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!294511 () Bool)

(declare-fun lt!427777 () tuple3!1796)

(declare-datatypes ((List!975 0))(
  ( (Nil!972) (Cons!971 (h!1090 Bool) (t!1860 List!975)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13284 array!17629 (_ BitVec 64) (_ BitVec 64)) List!975)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13284 BitStream!13284 (_ BitVec 64)) List!975)

(assert (=> b!294511 (= e!210501 (= (byteArrayBitContentToList!0 (_2!12910 lt!427777) (_3!1333 lt!427777) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12910 lt!427777) (_2!12911 lt!427478) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!294511 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!294511 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99346 () Bool)

(assert (=> d!99346 e!210501))

(declare-fun res!243192 () Bool)

(assert (=> d!99346 (=> (not res!243192) (not e!210501))))

(declare-fun lt!427746 () (_ BitVec 64))

(assert (=> d!99346 (= res!243192 (= (bvsub lt!427746 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7640 (buf!7703 (_2!12910 lt!427777))) (currentByte!14194 (_2!12910 lt!427777)) (currentBit!14189 (_2!12910 lt!427777)))))))

(assert (=> d!99346 (or (= (bvand lt!427746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!427746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!427746 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!427770 () (_ BitVec 64))

(assert (=> d!99346 (= lt!427746 (bvadd lt!427770 to!474))))

(assert (=> d!99346 (or (not (= (bvand lt!427770 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!427770 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!427770 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99346 (= lt!427770 (bitIndex!0 (size!7640 (buf!7703 (_2!12911 lt!427478))) (currentByte!14194 (_2!12911 lt!427478)) (currentBit!14189 (_2!12911 lt!427478))))))

(assert (=> d!99346 (= lt!427777 e!210504)))

(declare-fun c!13419 () Bool)

(assert (=> d!99346 (= c!13419 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99346 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99346 (= (readBitsLoop!0 (_2!12911 lt!427478) nBits!523 lt!427476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!427777)))

(declare-fun e!210503 () Bool)

(declare-fun b!294513 () Bool)

(declare-fun lt!427761 () tuple3!1796)

(assert (=> b!294513 (= e!210503 (and (= (buf!7703 (_2!12911 lt!427478)) (buf!7703 (_2!12910 lt!427761))) (= (size!7640 lt!427476) (size!7640 (_3!1333 lt!427761)))))))

(declare-fun bm!5013 () Bool)

(declare-fun lt!427789 () (_ BitVec 32))

(declare-fun lt!427790 () tuple2!23154)

(declare-fun lt!427779 () (_ BitVec 32))

(assert (=> bm!5013 (= call!5017 (arrayBitRangesEq!0 (ite c!13419 lt!427476 lt!427768) (ite c!13419 (array!17630 (store (arr!8675 lt!427476) lt!427779 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8675 lt!427476) lt!427779)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427789)))) ((_ sign_extend 24) (ite (_1!12911 lt!427790) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427789) #b00000000))))) (size!7640 lt!427476)) lt!427737) (ite c!13419 #b0000000000000000000000000000000000000000000000000000000000000000 lt!427782) (ite c!13419 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!427732)))))

(declare-fun lt!427751 () (_ BitVec 64))

(declare-fun bm!5014 () Bool)

(assert (=> bm!5014 (= call!5016 (arrayBitRangesEq!0 lt!427476 (ite c!13419 (_3!1333 lt!427761) lt!427476) (ite c!13419 lt!427751 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13419 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7640 lt!427476)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!294517 () Bool)

(declare-fun lt!427754 () Unit!20505)

(assert (=> b!294517 (= e!210504 (tuple3!1797 lt!427754 (_2!12910 lt!427761) (_3!1333 lt!427761)))))

(assert (=> b!294517 (= lt!427790 (readBit!0 (_2!12911 lt!427478)))))

(declare-fun lt!427742 () (_ BitVec 32))

(assert (=> b!294517 (= lt!427742 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427797 () (_ BitVec 32))

(assert (=> b!294517 (= lt!427797 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427738 () array!17629)

(assert (=> b!294517 (= lt!427738 (array!17630 (store (arr!8675 lt!427476) lt!427742 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8675 lt!427476) lt!427742)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427797)))) ((_ sign_extend 24) (ite (_1!12911 lt!427790) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427797) #b00000000))))) (size!7640 lt!427476)))))

(declare-fun lt!427763 () (_ BitVec 64))

(assert (=> b!294517 (= lt!427763 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!427792 () (_ BitVec 64))

(assert (=> b!294517 (= lt!427792 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!427730 () Unit!20505)

(assert (=> b!294517 (= lt!427730 (validateOffsetBitsIneqLemma!0 (_2!12911 lt!427478) (_2!12911 lt!427790) lt!427763 lt!427792))))

(assert (=> b!294517 (validate_offset_bits!1 ((_ sign_extend 32) (size!7640 (buf!7703 (_2!12911 lt!427790)))) ((_ sign_extend 32) (currentByte!14194 (_2!12911 lt!427790))) ((_ sign_extend 32) (currentBit!14189 (_2!12911 lt!427790))) (bvsub lt!427763 lt!427792))))

(declare-fun lt!427766 () Unit!20505)

(assert (=> b!294517 (= lt!427766 lt!427730)))

(assert (=> b!294517 (= lt!427761 (readBitsLoop!0 (_2!12911 lt!427790) nBits!523 lt!427738 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!243185 () Bool)

(assert (=> b!294517 (= res!243185 (= (bvsub (bvadd (bitIndex!0 (size!7640 (buf!7703 (_2!12911 lt!427478))) (currentByte!14194 (_2!12911 lt!427478)) (currentBit!14189 (_2!12911 lt!427478))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7640 (buf!7703 (_2!12910 lt!427761))) (currentByte!14194 (_2!12910 lt!427761)) (currentBit!14189 (_2!12910 lt!427761)))))))

(assert (=> b!294517 (=> (not res!243185) (not e!210503))))

(assert (=> b!294517 e!210503))

(declare-fun lt!427775 () Unit!20505)

(declare-fun Unit!20509 () Unit!20505)

(assert (=> b!294517 (= lt!427775 Unit!20509)))

(assert (=> b!294517 (= lt!427779 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294517 (= lt!427789 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!427740 () Unit!20505)

(assert (=> b!294517 (= lt!427740 (arrayBitRangesUpdatedAtLemma!0 lt!427476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12911 lt!427790)))))

(assert (=> b!294517 call!5017))

(declare-fun lt!427758 () Unit!20505)

(assert (=> b!294517 (= lt!427758 lt!427740)))

(assert (=> b!294517 (= lt!427751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427759 () Unit!20505)

(declare-fun arrayBitRangesEqTransitive!0 (array!17629 array!17629 array!17629 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20505)

(assert (=> b!294517 (= lt!427759 (arrayBitRangesEqTransitive!0 lt!427476 lt!427738 (_3!1333 lt!427761) lt!427751 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!294517 call!5016))

(declare-fun lt!427772 () Unit!20505)

(assert (=> b!294517 (= lt!427772 lt!427759)))

(assert (=> b!294517 (arrayBitRangesEq!0 lt!427476 (_3!1333 lt!427761) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!427783 () Unit!20505)

(declare-fun Unit!20510 () Unit!20505)

(assert (=> b!294517 (= lt!427783 Unit!20510)))

(declare-fun lt!427788 () Unit!20505)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17629 array!17629 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20505)

(assert (=> b!294517 (= lt!427788 (arrayBitRangesEqImpliesEq!0 lt!427738 (_3!1333 lt!427761) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!17629 (_ BitVec 64)) Bool)

(assert (=> b!294517 (= (bitAt!0 lt!427738 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1333 lt!427761) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!427752 () Unit!20505)

(assert (=> b!294517 (= lt!427752 lt!427788)))

(declare-fun lt!427731 () Unit!20505)

(declare-fun Unit!20511 () Unit!20505)

(assert (=> b!294517 (= lt!427731 Unit!20511)))

(declare-fun lt!427748 () Bool)

(assert (=> b!294517 (= lt!427748 (= (bitAt!0 (_3!1333 lt!427761) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12911 lt!427790)))))

(declare-fun Unit!20512 () Unit!20505)

(assert (=> b!294517 (= lt!427754 Unit!20512)))

(assert (=> b!294517 lt!427748))

(declare-fun b!294519 () Bool)

(declare-datatypes ((tuple2!23160 0))(
  ( (tuple2!23161 (_1!12917 BitStream!13284) (_2!12917 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13284) tuple2!23160)

(assert (=> b!294519 (= e!210505 (= (bitAt!0 (_3!1333 lt!427777) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12917 (readBitPure!0 (_2!12911 lt!427478)))))))

(declare-fun b!294521 () Bool)

(declare-fun res!243187 () Bool)

(assert (=> b!294521 (=> (not res!243187) (not e!210501))))

(assert (=> b!294521 (= res!243187 (arrayBitRangesEq!0 lt!427476 (_3!1333 lt!427777) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294523 () Bool)

(declare-fun res!243193 () Bool)

(assert (=> b!294523 (=> (not res!243193) (not e!210501))))

(assert (=> b!294523 (= res!243193 (invariant!0 (currentBit!14189 (_2!12910 lt!427777)) (currentByte!14194 (_2!12910 lt!427777)) (size!7640 (buf!7703 (_2!12910 lt!427777)))))))

(declare-fun b!294525 () Bool)

(declare-fun res!243196 () Bool)

(assert (=> b!294525 (=> (not res!243196) (not e!210501))))

(assert (=> b!294525 (= res!243196 (and (= (buf!7703 (_2!12911 lt!427478)) (buf!7703 (_2!12910 lt!427777))) (= (size!7640 lt!427476) (size!7640 (_3!1333 lt!427777)))))))

(assert (= (and d!99346 c!13419) b!294517))

(assert (= (and d!99346 (not c!13419)) b!294508))

(assert (= (and b!294517 res!243185) b!294513))

(assert (= (or b!294517 b!294508) bm!5013))

(assert (= (or b!294517 b!294508) bm!5014))

(assert (= (and d!99346 res!243192) b!294525))

(assert (= (and b!294525 res!243196) b!294521))

(assert (= (and b!294521 res!243187) b!294510))

(assert (= (and b!294510 (not res!243183)) b!294519))

(assert (= (and b!294510 res!243188) b!294523))

(assert (= (and b!294523 res!243193) b!294511))

(declare-fun m!430781 () Bool)

(assert (=> b!294511 m!430781))

(declare-fun m!430785 () Bool)

(assert (=> b!294511 m!430785))

(declare-fun m!430789 () Bool)

(assert (=> bm!5014 m!430789))

(declare-fun m!430793 () Bool)

(assert (=> b!294519 m!430793))

(declare-fun m!430795 () Bool)

(assert (=> b!294519 m!430795))

(declare-fun m!430797 () Bool)

(assert (=> bm!5013 m!430797))

(declare-fun m!430801 () Bool)

(assert (=> bm!5013 m!430801))

(declare-fun m!430803 () Bool)

(assert (=> bm!5013 m!430803))

(declare-fun m!430813 () Bool)

(assert (=> bm!5013 m!430813))

(declare-fun m!430817 () Bool)

(assert (=> b!294517 m!430817))

(declare-fun m!430827 () Bool)

(assert (=> b!294517 m!430827))

(declare-fun m!430831 () Bool)

(assert (=> b!294517 m!430831))

(declare-fun m!430833 () Bool)

(assert (=> b!294517 m!430833))

(declare-fun m!430837 () Bool)

(assert (=> b!294517 m!430837))

(declare-fun m!430843 () Bool)

(assert (=> b!294517 m!430843))

(declare-fun m!430845 () Bool)

(assert (=> b!294517 m!430845))

(declare-fun m!430849 () Bool)

(assert (=> b!294517 m!430849))

(declare-fun m!430851 () Bool)

(assert (=> b!294517 m!430851))

(declare-fun m!430855 () Bool)

(assert (=> b!294517 m!430855))

(declare-fun m!430859 () Bool)

(assert (=> b!294517 m!430859))

(declare-fun m!430861 () Bool)

(assert (=> b!294517 m!430861))

(declare-fun m!430865 () Bool)

(assert (=> b!294517 m!430865))

(declare-fun m!430867 () Bool)

(assert (=> b!294517 m!430867))

(declare-fun m!430871 () Bool)

(assert (=> b!294517 m!430871))

(declare-fun m!430875 () Bool)

(assert (=> b!294521 m!430875))

(declare-fun m!430883 () Bool)

(assert (=> d!99346 m!430883))

(assert (=> d!99346 m!430865))

(declare-fun m!430889 () Bool)

(assert (=> b!294523 m!430889))

(declare-fun m!430891 () Bool)

(assert (=> b!294508 m!430891))

(declare-fun m!430893 () Bool)

(assert (=> b!294508 m!430893))

(assert (=> b!294390 d!99346))

(declare-fun d!99356 () Bool)

(assert (=> d!99356 (= (array_inv!7252 (buf!7703 thiss!1728)) (bvsge (size!7640 (buf!7703 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!294386 d!99356))

(declare-fun d!99358 () Bool)

(assert (=> d!99358 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14189 thiss!1728) (currentByte!14194 thiss!1728) (size!7640 (buf!7703 thiss!1728))))))

(declare-fun bs!25407 () Bool)

(assert (= bs!25407 d!99358))

(assert (=> bs!25407 m!430733))

(assert (=> start!65646 d!99358))

(declare-fun d!99360 () Bool)

(assert (=> d!99360 (= (array_inv!7252 arr!273) (bvsge (size!7640 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65646 d!99360))

(declare-fun d!99362 () Bool)

(assert (=> d!99362 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7640 (buf!7703 thiss!1728))) ((_ sign_extend 32) (currentByte!14194 thiss!1728)) ((_ sign_extend 32) (currentBit!14189 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7640 (buf!7703 thiss!1728))) ((_ sign_extend 32) (currentByte!14194 thiss!1728)) ((_ sign_extend 32) (currentBit!14189 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25408 () Bool)

(assert (= bs!25408 d!99362))

(assert (=> bs!25408 m!430731))

(assert (=> b!294384 d!99362))

(declare-fun call!5019 () Bool)

(declare-fun c!13422 () Bool)

(declare-fun bm!5016 () Bool)

(declare-fun lt!427831 () (_ BitVec 32))

(declare-fun lt!427830 () tuple4!870)

(declare-fun lt!427829 () (_ BitVec 32))

(assert (=> bm!5016 (= call!5019 (byteRangesEq!0 (select (arr!8675 lt!427476) (_3!1335 lt!427830)) (select (arr!8675 (_3!1333 lt!427481)) (_3!1335 lt!427830)) lt!427831 (ite c!13422 lt!427829 #b00000000000000000000000000001000)))))

(declare-fun b!294533 () Bool)

(declare-fun res!243203 () Bool)

(assert (=> b!294533 (= res!243203 (= lt!427829 #b00000000000000000000000000000000))))

(declare-fun e!210516 () Bool)

(assert (=> b!294533 (=> res!243203 e!210516)))

(declare-fun e!210514 () Bool)

(assert (=> b!294533 (= e!210514 e!210516)))

(declare-fun b!294534 () Bool)

(declare-fun e!210513 () Bool)

(declare-fun e!210512 () Bool)

(assert (=> b!294534 (= e!210513 e!210512)))

(declare-fun res!243200 () Bool)

(assert (=> b!294534 (=> (not res!243200) (not e!210512))))

(declare-fun e!210511 () Bool)

(assert (=> b!294534 (= res!243200 e!210511)))

(declare-fun res!243202 () Bool)

(assert (=> b!294534 (=> res!243202 e!210511)))

(assert (=> b!294534 (= res!243202 (bvsge (_1!12914 lt!427830) (_2!12914 lt!427830)))))

(assert (=> b!294534 (= lt!427829 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294534 (= lt!427831 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294534 (= lt!427830 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!294535 () Bool)

(declare-fun e!210515 () Bool)

(assert (=> b!294535 (= e!210515 call!5019)))

(declare-fun b!294536 () Bool)

(assert (=> b!294536 (= e!210512 e!210515)))

(assert (=> b!294536 (= c!13422 (= (_3!1335 lt!427830) (_4!435 lt!427830)))))

(declare-fun b!294537 () Bool)

(assert (=> b!294537 (= e!210515 e!210514)))

(declare-fun res!243199 () Bool)

(assert (=> b!294537 (= res!243199 call!5019)))

(assert (=> b!294537 (=> (not res!243199) (not e!210514))))

(declare-fun b!294538 () Bool)

(assert (=> b!294538 (= e!210516 (byteRangesEq!0 (select (arr!8675 lt!427476) (_4!435 lt!427830)) (select (arr!8675 (_3!1333 lt!427481)) (_4!435 lt!427830)) #b00000000000000000000000000000000 lt!427829))))

(declare-fun d!99364 () Bool)

(declare-fun res!243201 () Bool)

(assert (=> d!99364 (=> res!243201 e!210513)))

(assert (=> d!99364 (= res!243201 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99364 (= (arrayBitRangesEq!0 lt!427476 (_3!1333 lt!427481) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) e!210513)))

(declare-fun b!294532 () Bool)

(assert (=> b!294532 (= e!210511 (arrayRangesEq!1493 lt!427476 (_3!1333 lt!427481) (_1!12914 lt!427830) (_2!12914 lt!427830)))))

(assert (= (and d!99364 (not res!243201)) b!294534))

(assert (= (and b!294534 (not res!243202)) b!294532))

(assert (= (and b!294534 res!243200) b!294536))

(assert (= (and b!294536 c!13422) b!294535))

(assert (= (and b!294536 (not c!13422)) b!294537))

(assert (= (and b!294537 res!243199) b!294533))

(assert (= (and b!294533 (not res!243203)) b!294538))

(assert (= (or b!294535 b!294537) bm!5016))

(declare-fun m!430895 () Bool)

(assert (=> bm!5016 m!430895))

(declare-fun m!430897 () Bool)

(assert (=> bm!5016 m!430897))

(assert (=> bm!5016 m!430895))

(assert (=> bm!5016 m!430897))

(declare-fun m!430899 () Bool)

(assert (=> bm!5016 m!430899))

(declare-fun m!430901 () Bool)

(assert (=> b!294534 m!430901))

(declare-fun m!430903 () Bool)

(assert (=> b!294538 m!430903))

(declare-fun m!430905 () Bool)

(assert (=> b!294538 m!430905))

(assert (=> b!294538 m!430903))

(assert (=> b!294538 m!430905))

(declare-fun m!430907 () Bool)

(assert (=> b!294538 m!430907))

(declare-fun m!430909 () Bool)

(assert (=> b!294532 m!430909))

(assert (=> b!294389 d!99364))

(check-sat (not d!99328) (not b!294521) (not d!99330) (not bm!5016) (not b!294532) (not d!99326) (not b!294538) (not d!99334) (not b!294519) (not d!99346) (not b!294428) (not bm!5000) (not bm!5014) (not b!294426) (not b!294447) (not d!99332) (not d!99324) (not b!294517) (not b!294432) (not d!99362) (not d!99358) (not b!294508) (not b!294464) (not bm!5013) (not b!294444) (not b!294523) (not b!294534) (not b!294511))
