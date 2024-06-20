; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30672 () Bool)

(assert start!30672)

(declare-fun res!130399 () Bool)

(declare-fun e!105277 () Bool)

(assert (=> start!30672 (=> (not res!130399) (not e!105277))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7133 0))(
  ( (array!7134 (arr!4041 (Array (_ BitVec 32) (_ BitVec 8))) (size!3203 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7133)

(assert (=> start!30672 (= res!130399 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3203 arr!153))))))

(assert (=> start!30672 e!105277))

(assert (=> start!30672 true))

(declare-fun array_inv!2992 (array!7133) Bool)

(assert (=> start!30672 (array_inv!2992 arr!153)))

(declare-datatypes ((BitStream!5664 0))(
  ( (BitStream!5665 (buf!3706 array!7133) (currentByte!6788 (_ BitVec 32)) (currentBit!6783 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5664)

(declare-fun e!105276 () Bool)

(declare-fun inv!12 (BitStream!5664) Bool)

(assert (=> start!30672 (and (inv!12 bs!65) e!105276)))

(declare-fun b!155969 () Bool)

(declare-fun res!130400 () Bool)

(assert (=> b!155969 (=> (not res!130400) (not e!105277))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155969 (= res!130400 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3203 (buf!3706 bs!65))) ((_ sign_extend 32) (currentByte!6788 bs!65)) ((_ sign_extend 32) (currentBit!6783 bs!65)) (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!13868 0))(
  ( (tuple2!13869 (_1!7363 BitStream!5664) (_2!7363 array!7133)) )
))
(declare-fun lt!242943 () tuple2!13868)

(declare-fun b!155970 () Bool)

(declare-fun lt!242944 () tuple2!13868)

(assert (=> b!155970 (= e!105277 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsle #b00000000000000000000000000000000 to!236) (bvsgt (size!3203 (_2!7363 lt!242943)) (size!3203 (_2!7363 lt!242944)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5664 array!7133 (_ BitVec 32) (_ BitVec 32)) tuple2!13868)

(declare-fun withMovedByteIndex!0 (BitStream!5664 (_ BitVec 32)) BitStream!5664)

(declare-datatypes ((tuple2!13870 0))(
  ( (tuple2!13871 (_1!7364 BitStream!5664) (_2!7364 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5664) tuple2!13870)

(assert (=> b!155970 (= lt!242944 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!155970 (= lt!242943 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155971 () Bool)

(assert (=> b!155971 (= e!105276 (array_inv!2992 (buf!3706 bs!65)))))

(assert (= (and start!30672 res!130399) b!155969))

(assert (= (and b!155969 res!130400) b!155970))

(assert (= start!30672 b!155971))

(declare-fun m!242439 () Bool)

(assert (=> start!30672 m!242439))

(declare-fun m!242441 () Bool)

(assert (=> start!30672 m!242441))

(declare-fun m!242443 () Bool)

(assert (=> b!155969 m!242443))

(declare-fun m!242445 () Bool)

(assert (=> b!155970 m!242445))

(declare-fun m!242447 () Bool)

(assert (=> b!155970 m!242447))

(assert (=> b!155970 m!242447))

(declare-fun m!242449 () Bool)

(assert (=> b!155970 m!242449))

(declare-fun m!242451 () Bool)

(assert (=> b!155970 m!242451))

(declare-fun m!242453 () Bool)

(assert (=> b!155970 m!242453))

(declare-fun m!242455 () Bool)

(assert (=> b!155971 m!242455))

(check-sat (not b!155970) (not start!30672) (not b!155971) (not b!155969))
(check-sat)
(get-model)

(declare-fun d!51732 () Bool)

(declare-datatypes ((Unit!9890 0))(
  ( (Unit!9891) )
))
(declare-datatypes ((tuple3!628 0))(
  ( (tuple3!629 (_1!7373 Unit!9890) (_2!7373 BitStream!5664) (_3!431 array!7133)) )
))
(declare-fun lt!242967 () tuple3!628)

(declare-fun readByteArrayLoop!0 (BitStream!5664 array!7133 (_ BitVec 32) (_ BitVec 32)) tuple3!628)

(assert (=> d!51732 (= lt!242967 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51732 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13869 (_2!7373 lt!242967) (_3!431 lt!242967)))))

(declare-fun bs!12666 () Bool)

(assert (= bs!12666 d!51732))

(assert (=> bs!12666 m!242447))

(declare-fun m!242499 () Bool)

(assert (=> bs!12666 m!242499))

(assert (=> b!155970 d!51732))

(declare-fun d!51738 () Bool)

(declare-datatypes ((tuple2!13884 0))(
  ( (tuple2!13885 (_1!7374 Unit!9890) (_2!7374 BitStream!5664)) )
))
(declare-fun moveByteIndex!0 (BitStream!5664 (_ BitVec 32)) tuple2!13884)

(assert (=> d!51738 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7374 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12667 () Bool)

(assert (= bs!12667 d!51738))

(declare-fun m!242501 () Bool)

(assert (=> bs!12667 m!242501))

(assert (=> b!155970 d!51738))

(declare-fun d!51740 () Bool)

(declare-datatypes ((tuple2!13886 0))(
  ( (tuple2!13887 (_1!7375 (_ BitVec 8)) (_2!7375 BitStream!5664)) )
))
(declare-fun lt!242970 () tuple2!13886)

(declare-fun readByte!0 (BitStream!5664) tuple2!13886)

(assert (=> d!51740 (= lt!242970 (readByte!0 bs!65))))

(assert (=> d!51740 (= (readBytePure!0 bs!65) (tuple2!13871 (_2!7375 lt!242970) (_1!7375 lt!242970)))))

(declare-fun bs!12668 () Bool)

(assert (= bs!12668 d!51740))

(declare-fun m!242503 () Bool)

(assert (=> bs!12668 m!242503))

(assert (=> b!155970 d!51740))

(declare-fun d!51742 () Bool)

(declare-fun lt!242971 () tuple3!628)

(assert (=> d!51742 (= lt!242971 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51742 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13869 (_2!7373 lt!242971) (_3!431 lt!242971)))))

(declare-fun bs!12669 () Bool)

(assert (= bs!12669 d!51742))

(declare-fun m!242505 () Bool)

(assert (=> bs!12669 m!242505))

(assert (=> b!155970 d!51742))

(declare-fun d!51744 () Bool)

(assert (=> d!51744 (= (array_inv!2992 arr!153) (bvsge (size!3203 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30672 d!51744))

(declare-fun d!51746 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51746 (= (inv!12 bs!65) (invariant!0 (currentBit!6783 bs!65) (currentByte!6788 bs!65) (size!3203 (buf!3706 bs!65))))))

(declare-fun bs!12670 () Bool)

(assert (= bs!12670 d!51746))

(declare-fun m!242507 () Bool)

(assert (=> bs!12670 m!242507))

(assert (=> start!30672 d!51746))

(declare-fun d!51748 () Bool)

(assert (=> d!51748 (= (array_inv!2992 (buf!3706 bs!65)) (bvsge (size!3203 (buf!3706 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155971 d!51748))

(declare-fun d!51750 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51750 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3203 (buf!3706 bs!65))) ((_ sign_extend 32) (currentByte!6788 bs!65)) ((_ sign_extend 32) (currentBit!6783 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3203 (buf!3706 bs!65))) ((_ sign_extend 32) (currentByte!6788 bs!65)) ((_ sign_extend 32) (currentBit!6783 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12671 () Bool)

(assert (= bs!12671 d!51750))

(declare-fun m!242509 () Bool)

(assert (=> bs!12671 m!242509))

(assert (=> b!155969 d!51750))

(check-sat (not d!51732) (not d!51750) (not d!51742) (not d!51740) (not d!51746) (not d!51738))
(check-sat)
(get-model)

(declare-fun d!51758 () Bool)

(assert (=> d!51758 (= (remainingBits!0 ((_ sign_extend 32) (size!3203 (buf!3706 bs!65))) ((_ sign_extend 32) (currentByte!6788 bs!65)) ((_ sign_extend 32) (currentBit!6783 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3203 (buf!3706 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6788 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6783 bs!65)))))))

(assert (=> d!51750 d!51758))

(declare-fun d!51760 () Bool)

(assert (=> d!51760 (= (invariant!0 (currentBit!6783 bs!65) (currentByte!6788 bs!65) (size!3203 (buf!3706 bs!65))) (and (bvsge (currentBit!6783 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6783 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6788 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6788 bs!65) (size!3203 (buf!3706 bs!65))) (and (= (currentBit!6783 bs!65) #b00000000000000000000000000000000) (= (currentByte!6788 bs!65) (size!3203 (buf!3706 bs!65)))))))))

(assert (=> d!51746 d!51760))

(declare-fun d!51762 () Bool)

(declare-fun e!105296 () Bool)

(assert (=> d!51762 e!105296))

(declare-fun res!130412 () Bool)

(assert (=> d!51762 (=> (not res!130412) (not e!105296))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5664 (_ BitVec 32)) Bool)

(assert (=> d!51762 (= res!130412 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9913 () Unit!9890)

(assert (=> d!51762 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13885 Unit!9913 (BitStream!5665 (buf!3706 bs!65) (bvadd (currentByte!6788 bs!65) #b00000000000000000000000000000001) (currentBit!6783 bs!65))))))

(declare-fun b!155986 () Bool)

(assert (=> b!155986 (= e!105296 (and (or (not (= (bvand (currentByte!6788 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6788 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6788 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6788 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6788 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51762 res!130412) b!155986))

(declare-fun m!242513 () Bool)

(assert (=> d!51762 m!242513))

(assert (=> d!51738 d!51762))

(declare-fun d!51764 () Bool)

(declare-fun lt!242986 () (_ BitVec 8))

(declare-fun lt!242990 () (_ BitVec 8))

(assert (=> d!51764 (= lt!242986 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4041 (buf!3706 bs!65)) (currentByte!6788 bs!65))) ((_ sign_extend 24) lt!242990))))))

(assert (=> d!51764 (= lt!242990 ((_ extract 7 0) (currentBit!6783 bs!65)))))

(declare-fun e!105302 () Bool)

(assert (=> d!51764 e!105302))

(declare-fun res!130418 () Bool)

(assert (=> d!51764 (=> (not res!130418) (not e!105302))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51764 (= res!130418 (validate_offset_bits!1 ((_ sign_extend 32) (size!3203 (buf!3706 bs!65))) ((_ sign_extend 32) (currentByte!6788 bs!65)) ((_ sign_extend 32) (currentBit!6783 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13890 0))(
  ( (tuple2!13891 (_1!7377 Unit!9890) (_2!7377 (_ BitVec 8))) )
))
(declare-fun Unit!9919 () Unit!9890)

(declare-fun Unit!9920 () Unit!9890)

(assert (=> d!51764 (= (readByte!0 bs!65) (tuple2!13887 (_2!7377 (ite (bvsgt ((_ sign_extend 24) lt!242990) #b00000000000000000000000000000000) (tuple2!13891 Unit!9919 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242986) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4041 (buf!3706 bs!65)) (bvadd (currentByte!6788 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242990)))))))) (tuple2!13891 Unit!9920 lt!242986))) (BitStream!5665 (buf!3706 bs!65) (bvadd (currentByte!6788 bs!65) #b00000000000000000000000000000001) (currentBit!6783 bs!65))))))

(declare-fun b!155991 () Bool)

(declare-fun e!105301 () Bool)

(assert (=> b!155991 (= e!105302 e!105301)))

(declare-fun res!130419 () Bool)

(assert (=> b!155991 (=> (not res!130419) (not e!105301))))

(declare-fun lt!242992 () tuple2!13886)

(assert (=> b!155991 (= res!130419 (= (buf!3706 (_2!7375 lt!242992)) (buf!3706 bs!65)))))

(declare-fun lt!242989 () (_ BitVec 8))

(declare-fun lt!242988 () (_ BitVec 8))

(declare-fun Unit!9923 () Unit!9890)

(declare-fun Unit!9925 () Unit!9890)

(assert (=> b!155991 (= lt!242992 (tuple2!13887 (_2!7377 (ite (bvsgt ((_ sign_extend 24) lt!242989) #b00000000000000000000000000000000) (tuple2!13891 Unit!9923 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242988) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4041 (buf!3706 bs!65)) (bvadd (currentByte!6788 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242989)))))))) (tuple2!13891 Unit!9925 lt!242988))) (BitStream!5665 (buf!3706 bs!65) (bvadd (currentByte!6788 bs!65) #b00000000000000000000000000000001) (currentBit!6783 bs!65))))))

(assert (=> b!155991 (= lt!242988 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4041 (buf!3706 bs!65)) (currentByte!6788 bs!65))) ((_ sign_extend 24) lt!242989))))))

(assert (=> b!155991 (= lt!242989 ((_ extract 7 0) (currentBit!6783 bs!65)))))

(declare-fun lt!242991 () (_ BitVec 64))

(declare-fun b!155992 () Bool)

(declare-fun lt!242987 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155992 (= e!105301 (= (bitIndex!0 (size!3203 (buf!3706 (_2!7375 lt!242992))) (currentByte!6788 (_2!7375 lt!242992)) (currentBit!6783 (_2!7375 lt!242992))) (bvadd lt!242987 lt!242991)))))

(assert (=> b!155992 (or (not (= (bvand lt!242987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242991 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242987 lt!242991) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155992 (= lt!242991 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155992 (= lt!242987 (bitIndex!0 (size!3203 (buf!3706 bs!65)) (currentByte!6788 bs!65) (currentBit!6783 bs!65)))))

(assert (= (and d!51764 res!130418) b!155991))

(assert (= (and b!155991 res!130419) b!155992))

(declare-fun m!242515 () Bool)

(assert (=> d!51764 m!242515))

(declare-fun m!242517 () Bool)

(assert (=> d!51764 m!242517))

(declare-fun m!242519 () Bool)

(assert (=> d!51764 m!242519))

(assert (=> b!155991 m!242519))

(assert (=> b!155991 m!242515))

(declare-fun m!242521 () Bool)

(assert (=> b!155992 m!242521))

(declare-fun m!242523 () Bool)

(assert (=> b!155992 m!242523))

(assert (=> d!51740 d!51764))

(declare-fun lt!243407 () array!7133)

(declare-fun c!8303 () Bool)

(declare-fun bm!2340 () Bool)

(declare-fun call!2344 () Bool)

(declare-fun lt!243429 () tuple3!628)

(declare-fun lt!243413 () (_ BitVec 32))

(declare-fun lt!243403 () (_ BitVec 32))

(declare-fun lt!243397 () array!7133)

(declare-fun arrayRangesEq!418 (array!7133 array!7133 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2340 (= call!2344 (arrayRangesEq!418 (ite c!8303 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) lt!243397) (ite c!8303 (_3!431 lt!243429) lt!243407) (ite c!8303 #b00000000000000000000000000000000 lt!243403) (ite c!8303 (bvadd #b00000000000000000000000000000001 from!240) lt!243413)))))

(declare-fun d!51766 () Bool)

(declare-fun e!105348 () Bool)

(assert (=> d!51766 e!105348))

(declare-fun res!130468 () Bool)

(assert (=> d!51766 (=> res!130468 e!105348)))

(assert (=> d!51766 (= res!130468 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!243421 () Bool)

(declare-fun e!105349 () Bool)

(assert (=> d!51766 (= lt!243421 e!105349)))

(declare-fun res!130467 () Bool)

(assert (=> d!51766 (=> (not res!130467) (not e!105349))))

(declare-fun lt!243430 () (_ BitVec 64))

(declare-fun lt!243415 () (_ BitVec 64))

(declare-fun lt!243426 () tuple3!628)

(assert (=> d!51766 (= res!130467 (= (bvadd lt!243415 lt!243430) (bitIndex!0 (size!3203 (buf!3706 (_2!7373 lt!243426))) (currentByte!6788 (_2!7373 lt!243426)) (currentBit!6783 (_2!7373 lt!243426)))))))

(assert (=> d!51766 (or (not (= (bvand lt!243415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243430 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243415 lt!243430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243404 () (_ BitVec 64))

(assert (=> d!51766 (= lt!243430 (bvmul lt!243404 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51766 (or (= lt!243404 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243404 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243404)))))

(assert (=> d!51766 (= lt!243404 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51766 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51766 (= lt!243415 (bitIndex!0 (size!3203 (buf!3706 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6788 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6783 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun e!105350 () tuple3!628)

(assert (=> d!51766 (= lt!243426 e!105350)))

(assert (=> d!51766 (= c!8303 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51766 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3203 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)))))))

(assert (=> d!51766 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!243426)))

(declare-fun b!156058 () Bool)

(assert (=> b!156058 (= e!105349 (arrayRangesEq!418 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) (_3!431 lt!243426) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun call!2343 () Bool)

(declare-fun bm!2341 () Bool)

(declare-fun lt!243422 () tuple2!13886)

(assert (=> bm!2341 (= call!2343 (arrayRangesEq!418 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) (ite c!8303 (array!7134 (store (arr!4041 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7375 lt!243422)) (size!3203 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)))) (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))) #b00000000000000000000000000000000 (ite c!8303 (bvadd #b00000000000000000000000000000001 from!240) (size!3203 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))))))))

(declare-fun lt!243428 () Unit!9890)

(declare-fun b!156059 () Bool)

(assert (=> b!156059 (= e!105350 (tuple3!629 lt!243428 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))))))

(declare-fun call!2345 () (_ BitVec 64))

(assert (=> b!156059 (= call!2345 call!2345)))

(declare-fun lt!243400 () Unit!9890)

(declare-fun Unit!9934 () Unit!9890)

(assert (=> b!156059 (= lt!243400 Unit!9934)))

(declare-fun lt!243419 () Unit!9890)

(declare-fun arrayRangesEqReflexiveLemma!29 (array!7133) Unit!9890)

(assert (=> b!156059 (= lt!243419 (arrayRangesEqReflexiveLemma!29 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))))))

(assert (=> b!156059 call!2343))

(declare-fun lt!243417 () Unit!9890)

(assert (=> b!156059 (= lt!243417 lt!243419)))

(assert (=> b!156059 (= lt!243397 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)))))

(assert (=> b!156059 (= lt!243407 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)))))

(declare-fun lt!243406 () (_ BitVec 32))

(assert (=> b!156059 (= lt!243406 #b00000000000000000000000000000000)))

(declare-fun lt!243425 () (_ BitVec 32))

(assert (=> b!156059 (= lt!243425 (size!3203 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))))))

(assert (=> b!156059 (= lt!243403 #b00000000000000000000000000000000)))

(assert (=> b!156059 (= lt!243413 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!29 (array!7133 array!7133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9890)

(assert (=> b!156059 (= lt!243428 (arrayRangesEqSlicedLemma!29 lt!243397 lt!243407 lt!243406 lt!243425 lt!243403 lt!243413))))

(assert (=> b!156059 call!2344))

(declare-fun b!156060 () Bool)

(declare-fun lt!243424 () Unit!9890)

(assert (=> b!156060 (= e!105350 (tuple3!629 lt!243424 (_2!7373 lt!243429) (_3!431 lt!243429)))))

(assert (=> b!156060 (= lt!243422 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!243423 () array!7133)

(assert (=> b!156060 (= lt!243423 (array!7134 (store (arr!4041 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7375 lt!243422)) (size!3203 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)))))))

(declare-fun lt!243399 () (_ BitVec 64))

(assert (=> b!156060 (= lt!243399 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243405 () (_ BitVec 32))

(assert (=> b!156060 (= lt!243405 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243427 () Unit!9890)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5664 BitStream!5664 (_ BitVec 64) (_ BitVec 32)) Unit!9890)

(assert (=> b!156060 (= lt!243427 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7375 lt!243422) lt!243399 lt!243405))))

(assert (=> b!156060 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3203 (buf!3706 (_2!7375 lt!243422)))) ((_ sign_extend 32) (currentByte!6788 (_2!7375 lt!243422))) ((_ sign_extend 32) (currentBit!6783 (_2!7375 lt!243422))) (bvsub lt!243405 ((_ extract 31 0) (bvsdiv (bvadd lt!243399 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243395 () Unit!9890)

(assert (=> b!156060 (= lt!243395 lt!243427)))

(assert (=> b!156060 (= lt!243429 (readByteArrayLoop!0 (_2!7375 lt!243422) lt!243423 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156060 (= call!2345 (bvadd (bitIndex!0 (size!3203 (buf!3706 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6788 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6783 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243414 () Unit!9890)

(declare-fun Unit!9936 () Unit!9890)

(assert (=> b!156060 (= lt!243414 Unit!9936)))

(assert (=> b!156060 (= (bvadd call!2345 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3203 (buf!3706 (_2!7373 lt!243429))) (currentByte!6788 (_2!7373 lt!243429)) (currentBit!6783 (_2!7373 lt!243429))))))

(declare-fun lt!243401 () Unit!9890)

(declare-fun Unit!9937 () Unit!9890)

(assert (=> b!156060 (= lt!243401 Unit!9937)))

(assert (=> b!156060 (= (bvadd (bitIndex!0 (size!3203 (buf!3706 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6788 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6783 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3203 (buf!3706 (_2!7373 lt!243429))) (currentByte!6788 (_2!7373 lt!243429)) (currentBit!6783 (_2!7373 lt!243429))))))

(declare-fun lt!243408 () Unit!9890)

(declare-fun Unit!9938 () Unit!9890)

(assert (=> b!156060 (= lt!243408 Unit!9938)))

(assert (=> b!156060 (and (= (buf!3706 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3706 (_2!7373 lt!243429))) (= (size!3203 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))) (size!3203 (_3!431 lt!243429))))))

(declare-fun lt!243410 () Unit!9890)

(declare-fun Unit!9939 () Unit!9890)

(assert (=> b!156060 (= lt!243410 Unit!9939)))

(declare-fun lt!243418 () Unit!9890)

(declare-fun arrayUpdatedAtPrefixLemma!29 (array!7133 (_ BitVec 32) (_ BitVec 8)) Unit!9890)

(assert (=> b!156060 (= lt!243418 (arrayUpdatedAtPrefixLemma!29 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7375 lt!243422)))))

(assert (=> b!156060 call!2343))

(declare-fun lt!243412 () Unit!9890)

(assert (=> b!156060 (= lt!243412 lt!243418)))

(declare-fun lt!243411 () (_ BitVec 32))

(assert (=> b!156060 (= lt!243411 #b00000000000000000000000000000000)))

(declare-fun lt!243416 () Unit!9890)

(declare-fun arrayRangesEqTransitive!94 (array!7133 array!7133 array!7133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9890)

(assert (=> b!156060 (= lt!243416 (arrayRangesEqTransitive!94 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) lt!243423 (_3!431 lt!243429) lt!243411 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156060 (arrayRangesEq!418 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153)) (_3!431 lt!243429) lt!243411 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!243420 () Unit!9890)

(assert (=> b!156060 (= lt!243420 lt!243416)))

(assert (=> b!156060 call!2344))

(declare-fun lt!243402 () Unit!9890)

(declare-fun Unit!9940 () Unit!9890)

(assert (=> b!156060 (= lt!243402 Unit!9940)))

(declare-fun lt!243396 () Unit!9890)

(declare-fun arrayRangesEqImpliesEq!38 (array!7133 array!7133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9890)

(assert (=> b!156060 (= lt!243396 (arrayRangesEqImpliesEq!38 lt!243423 (_3!431 lt!243429) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156060 (= (select (store (arr!4041 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7375 lt!243422)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4041 (_3!431 lt!243429)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243398 () Unit!9890)

(assert (=> b!156060 (= lt!243398 lt!243396)))

(declare-fun lt!243409 () Bool)

(assert (=> b!156060 (= lt!243409 (= (select (arr!4041 (_3!431 lt!243429)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7375 lt!243422)))))

(declare-fun Unit!9941 () Unit!9890)

(assert (=> b!156060 (= lt!243424 Unit!9941)))

(assert (=> b!156060 lt!243409))

(declare-fun b!156061 () Bool)

(declare-fun res!130469 () Bool)

(assert (=> b!156061 (=> (not res!130469) (not e!105349))))

(assert (=> b!156061 (= res!130469 (and (= (buf!3706 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3706 (_2!7373 lt!243426))) (= (size!3203 (array!7134 (store (arr!4041 arr!153) from!240 (_2!7364 (readBytePure!0 bs!65))) (size!3203 arr!153))) (size!3203 (_3!431 lt!243426)))))))

(declare-fun b!156062 () Bool)

(assert (=> b!156062 (= e!105348 (= (select (arr!4041 (_3!431 lt!243426)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7364 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156062 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3203 (_3!431 lt!243426))))))

(declare-fun bm!2342 () Bool)

(assert (=> bm!2342 (= call!2345 (bitIndex!0 (ite c!8303 (size!3203 (buf!3706 (_2!7375 lt!243422))) (size!3203 (buf!3706 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))) (ite c!8303 (currentByte!6788 (_2!7375 lt!243422)) (currentByte!6788 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (ite c!8303 (currentBit!6783 (_2!7375 lt!243422)) (currentBit!6783 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (= (and d!51766 c!8303) b!156060))

(assert (= (and d!51766 (not c!8303)) b!156059))

(assert (= (or b!156060 b!156059) bm!2340))

(assert (= (or b!156060 b!156059) bm!2341))

(assert (= (or b!156060 b!156059) bm!2342))

(assert (= (and d!51766 res!130467) b!156061))

(assert (= (and b!156061 res!130469) b!156058))

(assert (= (and d!51766 (not res!130468)) b!156062))

(declare-fun m!242711 () Bool)

(assert (=> bm!2340 m!242711))

(declare-fun m!242713 () Bool)

(assert (=> d!51766 m!242713))

(declare-fun m!242715 () Bool)

(assert (=> d!51766 m!242715))

(declare-fun m!242717 () Bool)

(assert (=> bm!2341 m!242717))

(declare-fun m!242719 () Bool)

(assert (=> bm!2341 m!242719))

(declare-fun m!242721 () Bool)

(assert (=> b!156059 m!242721))

(declare-fun m!242723 () Bool)

(assert (=> b!156059 m!242723))

(declare-fun m!242725 () Bool)

(assert (=> b!156060 m!242725))

(declare-fun m!242727 () Bool)

(assert (=> b!156060 m!242727))

(assert (=> b!156060 m!242717))

(assert (=> b!156060 m!242715))

(declare-fun m!242729 () Bool)

(assert (=> b!156060 m!242729))

(declare-fun m!242731 () Bool)

(assert (=> b!156060 m!242731))

(assert (=> b!156060 m!242447))

(declare-fun m!242733 () Bool)

(assert (=> b!156060 m!242733))

(declare-fun m!242735 () Bool)

(assert (=> b!156060 m!242735))

(declare-fun m!242737 () Bool)

(assert (=> b!156060 m!242737))

(assert (=> b!156060 m!242447))

(declare-fun m!242739 () Bool)

(assert (=> b!156060 m!242739))

(declare-fun m!242741 () Bool)

(assert (=> b!156060 m!242741))

(declare-fun m!242743 () Bool)

(assert (=> b!156060 m!242743))

(declare-fun m!242745 () Bool)

(assert (=> b!156060 m!242745))

(declare-fun m!242747 () Bool)

(assert (=> b!156062 m!242747))

(assert (=> b!156062 m!242447))

(declare-fun m!242749 () Bool)

(assert (=> b!156062 m!242749))

(declare-fun m!242751 () Bool)

(assert (=> bm!2342 m!242751))

(declare-fun m!242753 () Bool)

(assert (=> b!156058 m!242753))

(assert (=> d!51732 d!51766))

(declare-fun bm!2343 () Bool)

(declare-fun lt!243433 () array!7133)

(declare-fun lt!243465 () tuple3!628)

(declare-fun lt!243439 () (_ BitVec 32))

(declare-fun lt!243443 () array!7133)

(declare-fun lt!243449 () (_ BitVec 32))

(declare-fun c!8304 () Bool)

(declare-fun call!2347 () Bool)

(assert (=> bm!2343 (= call!2347 (arrayRangesEq!418 (ite c!8304 arr!153 lt!243433) (ite c!8304 (_3!431 lt!243465) lt!243443) (ite c!8304 #b00000000000000000000000000000000 lt!243439) (ite c!8304 from!240 lt!243449)))))

(declare-fun d!51786 () Bool)

(declare-fun e!105351 () Bool)

(assert (=> d!51786 e!105351))

(declare-fun res!130471 () Bool)

(assert (=> d!51786 (=> res!130471 e!105351)))

(assert (=> d!51786 (= res!130471 (bvsge from!240 to!236))))

(declare-fun lt!243457 () Bool)

(declare-fun e!105352 () Bool)

(assert (=> d!51786 (= lt!243457 e!105352)))

(declare-fun res!130470 () Bool)

(assert (=> d!51786 (=> (not res!130470) (not e!105352))))

(declare-fun lt!243451 () (_ BitVec 64))

(declare-fun lt!243466 () (_ BitVec 64))

(declare-fun lt!243462 () tuple3!628)

(assert (=> d!51786 (= res!130470 (= (bvadd lt!243451 lt!243466) (bitIndex!0 (size!3203 (buf!3706 (_2!7373 lt!243462))) (currentByte!6788 (_2!7373 lt!243462)) (currentBit!6783 (_2!7373 lt!243462)))))))

(assert (=> d!51786 (or (not (= (bvand lt!243451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243466 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243451 lt!243466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243440 () (_ BitVec 64))

(assert (=> d!51786 (= lt!243466 (bvmul lt!243440 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51786 (or (= lt!243440 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243440 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243440)))))

(assert (=> d!51786 (= lt!243440 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51786 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51786 (= lt!243451 (bitIndex!0 (size!3203 (buf!3706 bs!65)) (currentByte!6788 bs!65) (currentBit!6783 bs!65)))))

(declare-fun e!105353 () tuple3!628)

(assert (=> d!51786 (= lt!243462 e!105353)))

(assert (=> d!51786 (= c!8304 (bvslt from!240 to!236))))

(assert (=> d!51786 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3203 arr!153)))))

(assert (=> d!51786 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!243462)))

(declare-fun b!156063 () Bool)

(assert (=> b!156063 (= e!105352 (arrayRangesEq!418 arr!153 (_3!431 lt!243462) #b00000000000000000000000000000000 from!240))))

(declare-fun bm!2344 () Bool)

(declare-fun call!2346 () Bool)

(declare-fun lt!243458 () tuple2!13886)

(assert (=> bm!2344 (= call!2346 (arrayRangesEq!418 arr!153 (ite c!8304 (array!7134 (store (arr!4041 arr!153) from!240 (_1!7375 lt!243458)) (size!3203 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8304 from!240 (size!3203 arr!153))))))

(declare-fun b!156064 () Bool)

(declare-fun lt!243464 () Unit!9890)

(assert (=> b!156064 (= e!105353 (tuple3!629 lt!243464 bs!65 arr!153))))

(declare-fun call!2348 () (_ BitVec 64))

(assert (=> b!156064 (= call!2348 call!2348)))

(declare-fun lt!243436 () Unit!9890)

(declare-fun Unit!9942 () Unit!9890)

(assert (=> b!156064 (= lt!243436 Unit!9942)))

(declare-fun lt!243455 () Unit!9890)

(assert (=> b!156064 (= lt!243455 (arrayRangesEqReflexiveLemma!29 arr!153))))

(assert (=> b!156064 call!2346))

(declare-fun lt!243453 () Unit!9890)

(assert (=> b!156064 (= lt!243453 lt!243455)))

(assert (=> b!156064 (= lt!243433 arr!153)))

(assert (=> b!156064 (= lt!243443 arr!153)))

(declare-fun lt!243442 () (_ BitVec 32))

(assert (=> b!156064 (= lt!243442 #b00000000000000000000000000000000)))

(declare-fun lt!243461 () (_ BitVec 32))

(assert (=> b!156064 (= lt!243461 (size!3203 arr!153))))

(assert (=> b!156064 (= lt!243439 #b00000000000000000000000000000000)))

(assert (=> b!156064 (= lt!243449 from!240)))

(assert (=> b!156064 (= lt!243464 (arrayRangesEqSlicedLemma!29 lt!243433 lt!243443 lt!243442 lt!243461 lt!243439 lt!243449))))

(assert (=> b!156064 call!2347))

(declare-fun b!156065 () Bool)

(declare-fun lt!243460 () Unit!9890)

(assert (=> b!156065 (= e!105353 (tuple3!629 lt!243460 (_2!7373 lt!243465) (_3!431 lt!243465)))))

(assert (=> b!156065 (= lt!243458 (readByte!0 bs!65))))

(declare-fun lt!243459 () array!7133)

(assert (=> b!156065 (= lt!243459 (array!7134 (store (arr!4041 arr!153) from!240 (_1!7375 lt!243458)) (size!3203 arr!153)))))

(declare-fun lt!243435 () (_ BitVec 64))

(assert (=> b!156065 (= lt!243435 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243441 () (_ BitVec 32))

(assert (=> b!156065 (= lt!243441 (bvsub to!236 from!240))))

(declare-fun lt!243463 () Unit!9890)

(assert (=> b!156065 (= lt!243463 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7375 lt!243458) lt!243435 lt!243441))))

(assert (=> b!156065 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3203 (buf!3706 (_2!7375 lt!243458)))) ((_ sign_extend 32) (currentByte!6788 (_2!7375 lt!243458))) ((_ sign_extend 32) (currentBit!6783 (_2!7375 lt!243458))) (bvsub lt!243441 ((_ extract 31 0) (bvsdiv (bvadd lt!243435 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243431 () Unit!9890)

(assert (=> b!156065 (= lt!243431 lt!243463)))

(assert (=> b!156065 (= lt!243465 (readByteArrayLoop!0 (_2!7375 lt!243458) lt!243459 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156065 (= call!2348 (bvadd (bitIndex!0 (size!3203 (buf!3706 bs!65)) (currentByte!6788 bs!65) (currentBit!6783 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243450 () Unit!9890)

(declare-fun Unit!9943 () Unit!9890)

(assert (=> b!156065 (= lt!243450 Unit!9943)))

(assert (=> b!156065 (= (bvadd call!2348 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3203 (buf!3706 (_2!7373 lt!243465))) (currentByte!6788 (_2!7373 lt!243465)) (currentBit!6783 (_2!7373 lt!243465))))))

(declare-fun lt!243437 () Unit!9890)

(declare-fun Unit!9944 () Unit!9890)

(assert (=> b!156065 (= lt!243437 Unit!9944)))

(assert (=> b!156065 (= (bvadd (bitIndex!0 (size!3203 (buf!3706 bs!65)) (currentByte!6788 bs!65) (currentBit!6783 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3203 (buf!3706 (_2!7373 lt!243465))) (currentByte!6788 (_2!7373 lt!243465)) (currentBit!6783 (_2!7373 lt!243465))))))

(declare-fun lt!243444 () Unit!9890)

(declare-fun Unit!9945 () Unit!9890)

(assert (=> b!156065 (= lt!243444 Unit!9945)))

(assert (=> b!156065 (and (= (buf!3706 bs!65) (buf!3706 (_2!7373 lt!243465))) (= (size!3203 arr!153) (size!3203 (_3!431 lt!243465))))))

(declare-fun lt!243446 () Unit!9890)

(declare-fun Unit!9946 () Unit!9890)

(assert (=> b!156065 (= lt!243446 Unit!9946)))

(declare-fun lt!243454 () Unit!9890)

(assert (=> b!156065 (= lt!243454 (arrayUpdatedAtPrefixLemma!29 arr!153 from!240 (_1!7375 lt!243458)))))

(assert (=> b!156065 call!2346))

(declare-fun lt!243448 () Unit!9890)

(assert (=> b!156065 (= lt!243448 lt!243454)))

(declare-fun lt!243447 () (_ BitVec 32))

(assert (=> b!156065 (= lt!243447 #b00000000000000000000000000000000)))

(declare-fun lt!243452 () Unit!9890)

(assert (=> b!156065 (= lt!243452 (arrayRangesEqTransitive!94 arr!153 lt!243459 (_3!431 lt!243465) lt!243447 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156065 (arrayRangesEq!418 arr!153 (_3!431 lt!243465) lt!243447 from!240)))

(declare-fun lt!243456 () Unit!9890)

(assert (=> b!156065 (= lt!243456 lt!243452)))

(assert (=> b!156065 call!2347))

(declare-fun lt!243438 () Unit!9890)

(declare-fun Unit!9947 () Unit!9890)

(assert (=> b!156065 (= lt!243438 Unit!9947)))

(declare-fun lt!243432 () Unit!9890)

(assert (=> b!156065 (= lt!243432 (arrayRangesEqImpliesEq!38 lt!243459 (_3!431 lt!243465) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156065 (= (select (store (arr!4041 arr!153) from!240 (_1!7375 lt!243458)) from!240) (select (arr!4041 (_3!431 lt!243465)) from!240))))

(declare-fun lt!243434 () Unit!9890)

(assert (=> b!156065 (= lt!243434 lt!243432)))

(declare-fun lt!243445 () Bool)

(assert (=> b!156065 (= lt!243445 (= (select (arr!4041 (_3!431 lt!243465)) from!240) (_1!7375 lt!243458)))))

(declare-fun Unit!9948 () Unit!9890)

(assert (=> b!156065 (= lt!243460 Unit!9948)))

(assert (=> b!156065 lt!243445))

(declare-fun b!156066 () Bool)

(declare-fun res!130472 () Bool)

(assert (=> b!156066 (=> (not res!130472) (not e!105352))))

(assert (=> b!156066 (= res!130472 (and (= (buf!3706 bs!65) (buf!3706 (_2!7373 lt!243462))) (= (size!3203 arr!153) (size!3203 (_3!431 lt!243462)))))))

(declare-fun b!156067 () Bool)

(assert (=> b!156067 (= e!105351 (= (select (arr!4041 (_3!431 lt!243462)) from!240) (_2!7364 (readBytePure!0 bs!65))))))

(assert (=> b!156067 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3203 (_3!431 lt!243462))))))

(declare-fun bm!2345 () Bool)

(assert (=> bm!2345 (= call!2348 (bitIndex!0 (ite c!8304 (size!3203 (buf!3706 (_2!7375 lt!243458))) (size!3203 (buf!3706 bs!65))) (ite c!8304 (currentByte!6788 (_2!7375 lt!243458)) (currentByte!6788 bs!65)) (ite c!8304 (currentBit!6783 (_2!7375 lt!243458)) (currentBit!6783 bs!65))))))

(assert (= (and d!51786 c!8304) b!156065))

(assert (= (and d!51786 (not c!8304)) b!156064))

(assert (= (or b!156065 b!156064) bm!2343))

(assert (= (or b!156065 b!156064) bm!2344))

(assert (= (or b!156065 b!156064) bm!2345))

(assert (= (and d!51786 res!130470) b!156066))

(assert (= (and b!156066 res!130472) b!156063))

(assert (= (and d!51786 (not res!130471)) b!156067))

(declare-fun m!242755 () Bool)

(assert (=> bm!2343 m!242755))

(declare-fun m!242757 () Bool)

(assert (=> d!51786 m!242757))

(assert (=> d!51786 m!242523))

(declare-fun m!242759 () Bool)

(assert (=> bm!2344 m!242759))

(declare-fun m!242761 () Bool)

(assert (=> bm!2344 m!242761))

(declare-fun m!242763 () Bool)

(assert (=> b!156064 m!242763))

(declare-fun m!242765 () Bool)

(assert (=> b!156064 m!242765))

(declare-fun m!242767 () Bool)

(assert (=> b!156065 m!242767))

(declare-fun m!242769 () Bool)

(assert (=> b!156065 m!242769))

(assert (=> b!156065 m!242759))

(assert (=> b!156065 m!242523))

(declare-fun m!242771 () Bool)

(assert (=> b!156065 m!242771))

(declare-fun m!242773 () Bool)

(assert (=> b!156065 m!242773))

(assert (=> b!156065 m!242503))

(declare-fun m!242775 () Bool)

(assert (=> b!156065 m!242775))

(declare-fun m!242777 () Bool)

(assert (=> b!156065 m!242777))

(declare-fun m!242779 () Bool)

(assert (=> b!156065 m!242779))

(declare-fun m!242781 () Bool)

(assert (=> b!156065 m!242781))

(declare-fun m!242783 () Bool)

(assert (=> b!156065 m!242783))

(declare-fun m!242785 () Bool)

(assert (=> b!156065 m!242785))

(declare-fun m!242787 () Bool)

(assert (=> b!156067 m!242787))

(assert (=> b!156067 m!242445))

(declare-fun m!242789 () Bool)

(assert (=> bm!2345 m!242789))

(declare-fun m!242791 () Bool)

(assert (=> b!156063 m!242791))

(assert (=> d!51742 d!51786))

(check-sat (not bm!2342) (not bm!2340) (not d!51786) (not b!156058) (not b!156064) (not bm!2341) (not b!156059) (not b!156067) (not d!51764) (not bm!2344) (not d!51766) (not b!156065) (not b!156060) (not bm!2345) (not b!155992) (not b!156063) (not d!51762) (not bm!2343) (not b!156062))
