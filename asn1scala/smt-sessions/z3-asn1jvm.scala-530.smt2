; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15470 () Bool)

(assert start!15470)

(declare-fun b!78521 () Bool)

(declare-fun e!51534 () Bool)

(declare-fun e!51528 () Bool)

(assert (=> b!78521 (= e!51534 e!51528)))

(declare-fun res!64920 () Bool)

(assert (=> b!78521 (=> (not res!64920) (not e!51528))))

(declare-fun lt!125443 () (_ BitVec 64))

(declare-fun lt!125445 () (_ BitVec 64))

(assert (=> b!78521 (= res!64920 (= lt!125443 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125445)))))

(declare-datatypes ((array!3345 0))(
  ( (array!3346 (arr!2149 (Array (_ BitVec 32) (_ BitVec 8))) (size!1548 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2658 0))(
  ( (BitStream!2659 (buf!1938 array!3345) (currentByte!3785 (_ BitVec 32)) (currentBit!3780 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5181 0))(
  ( (Unit!5182) )
))
(declare-datatypes ((tuple2!6996 0))(
  ( (tuple2!6997 (_1!3635 Unit!5181) (_2!3635 BitStream!2658)) )
))
(declare-fun lt!125444 () tuple2!6996)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78521 (= lt!125443 (bitIndex!0 (size!1548 (buf!1938 (_2!3635 lt!125444))) (currentByte!3785 (_2!3635 lt!125444)) (currentBit!3780 (_2!3635 lt!125444))))))

(declare-fun thiss!1107 () BitStream!2658)

(assert (=> b!78521 (= lt!125445 (bitIndex!0 (size!1548 (buf!1938 thiss!1107)) (currentByte!3785 thiss!1107) (currentBit!3780 thiss!1107)))))

(declare-fun b!78522 () Bool)

(declare-fun res!64921 () Bool)

(declare-fun e!51529 () Bool)

(assert (=> b!78522 (=> res!64921 e!51529)))

(declare-fun isPrefixOf!0 (BitStream!2658 BitStream!2658) Bool)

(assert (=> b!78522 (= res!64921 (not (isPrefixOf!0 thiss!1107 (_2!3635 lt!125444))))))

(declare-fun b!78523 () Bool)

(declare-fun res!64924 () Bool)

(declare-fun e!51530 () Bool)

(assert (=> b!78523 (=> (not res!64924) (not e!51530))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78523 (= res!64924 (validate_offset_bit!0 ((_ sign_extend 32) (size!1548 (buf!1938 thiss!1107))) ((_ sign_extend 32) (currentByte!3785 thiss!1107)) ((_ sign_extend 32) (currentBit!3780 thiss!1107))))))

(declare-fun b!78524 () Bool)

(declare-fun e!51532 () Bool)

(declare-fun array_inv!1394 (array!3345) Bool)

(assert (=> b!78524 (= e!51532 (array_inv!1394 (buf!1938 thiss!1107)))))

(declare-fun b!78525 () Bool)

(declare-fun res!64915 () Bool)

(assert (=> b!78525 (=> res!64915 e!51529)))

(assert (=> b!78525 (= res!64915 (not (= (bitIndex!0 (size!1548 (buf!1938 (_2!3635 lt!125444))) (currentByte!3785 (_2!3635 lt!125444)) (currentBit!3780 (_2!3635 lt!125444))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1548 (buf!1938 thiss!1107)) (currentByte!3785 thiss!1107) (currentBit!3780 thiss!1107))))))))

(declare-fun res!64916 () Bool)

(assert (=> start!15470 (=> (not res!64916) (not e!51530))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15470 (= res!64916 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15470 e!51530))

(assert (=> start!15470 true))

(declare-fun inv!12 (BitStream!2658) Bool)

(assert (=> start!15470 (and (inv!12 thiss!1107) e!51532)))

(declare-fun b!78526 () Bool)

(declare-fun e!51533 () Bool)

(assert (=> b!78526 (= e!51528 e!51533)))

(declare-fun res!64922 () Bool)

(assert (=> b!78526 (=> (not res!64922) (not e!51533))))

(declare-fun lt!125441 () Bool)

(declare-datatypes ((tuple2!6998 0))(
  ( (tuple2!6999 (_1!3636 BitStream!2658) (_2!3636 Bool)) )
))
(declare-fun lt!125442 () tuple2!6998)

(assert (=> b!78526 (= res!64922 (and (= (_2!3636 lt!125442) lt!125441) (= (_1!3636 lt!125442) (_2!3635 lt!125444))))))

(declare-fun readBitPure!0 (BitStream!2658) tuple2!6998)

(declare-fun readerFrom!0 (BitStream!2658 (_ BitVec 32) (_ BitVec 32)) BitStream!2658)

(assert (=> b!78526 (= lt!125442 (readBitPure!0 (readerFrom!0 (_2!3635 lt!125444) (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107))))))

(declare-fun b!78527 () Bool)

(declare-fun res!64918 () Bool)

(assert (=> b!78527 (=> res!64918 e!51529)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78527 (= res!64918 (not (invariant!0 (currentBit!3780 (_2!3635 lt!125444)) (currentByte!3785 (_2!3635 lt!125444)) (size!1548 (buf!1938 (_2!3635 lt!125444))))))))

(declare-fun b!78528 () Bool)

(assert (=> b!78528 (= e!51530 (not e!51529))))

(declare-fun res!64923 () Bool)

(assert (=> b!78528 (=> res!64923 e!51529)))

(assert (=> b!78528 (= res!64923 (not (= (size!1548 (buf!1938 (_2!3635 lt!125444))) (size!1548 (buf!1938 thiss!1107)))))))

(assert (=> b!78528 e!51534))

(declare-fun res!64919 () Bool)

(assert (=> b!78528 (=> (not res!64919) (not e!51534))))

(assert (=> b!78528 (= res!64919 (= (size!1548 (buf!1938 thiss!1107)) (size!1548 (buf!1938 (_2!3635 lt!125444)))))))

(declare-fun appendBit!0 (BitStream!2658 Bool) tuple2!6996)

(assert (=> b!78528 (= lt!125444 (appendBit!0 thiss!1107 lt!125441))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!78528 (= lt!125441 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78529 () Bool)

(assert (=> b!78529 (= e!51533 (= (bitIndex!0 (size!1548 (buf!1938 (_1!3636 lt!125442))) (currentByte!3785 (_1!3636 lt!125442)) (currentBit!3780 (_1!3636 lt!125442))) lt!125443))))

(declare-fun b!78530 () Bool)

(assert (=> b!78530 (= e!51529 (invariant!0 (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107) (size!1548 (buf!1938 (_2!3635 lt!125444)))))))

(declare-fun b!78531 () Bool)

(declare-fun res!64917 () Bool)

(assert (=> b!78531 (=> (not res!64917) (not e!51528))))

(assert (=> b!78531 (= res!64917 (isPrefixOf!0 thiss!1107 (_2!3635 lt!125444)))))

(assert (= (and start!15470 res!64916) b!78523))

(assert (= (and b!78523 res!64924) b!78528))

(assert (= (and b!78528 res!64919) b!78521))

(assert (= (and b!78521 res!64920) b!78531))

(assert (= (and b!78531 res!64917) b!78526))

(assert (= (and b!78526 res!64922) b!78529))

(assert (= (and b!78528 (not res!64923)) b!78525))

(assert (= (and b!78525 (not res!64915)) b!78522))

(assert (= (and b!78522 (not res!64921)) b!78527))

(assert (= (and b!78527 (not res!64918)) b!78530))

(assert (= start!15470 b!78524))

(declare-fun m!124049 () Bool)

(assert (=> b!78526 m!124049))

(assert (=> b!78526 m!124049))

(declare-fun m!124051 () Bool)

(assert (=> b!78526 m!124051))

(declare-fun m!124053 () Bool)

(assert (=> start!15470 m!124053))

(declare-fun m!124055 () Bool)

(assert (=> b!78531 m!124055))

(declare-fun m!124057 () Bool)

(assert (=> b!78529 m!124057))

(declare-fun m!124059 () Bool)

(assert (=> b!78521 m!124059))

(declare-fun m!124061 () Bool)

(assert (=> b!78521 m!124061))

(declare-fun m!124063 () Bool)

(assert (=> b!78523 m!124063))

(declare-fun m!124065 () Bool)

(assert (=> b!78527 m!124065))

(assert (=> b!78525 m!124059))

(assert (=> b!78525 m!124061))

(declare-fun m!124067 () Bool)

(assert (=> b!78530 m!124067))

(assert (=> b!78522 m!124055))

(declare-fun m!124069 () Bool)

(assert (=> b!78528 m!124069))

(declare-fun m!124071 () Bool)

(assert (=> b!78528 m!124071))

(declare-fun m!124073 () Bool)

(assert (=> b!78524 m!124073))

(check-sat (not b!78526) (not b!78528) (not start!15470) (not b!78523) (not b!78531) (not b!78529) (not b!78524) (not b!78525) (not b!78530) (not b!78522) (not b!78521) (not b!78527))
(check-sat)
(get-model)

(declare-fun d!24784 () Bool)

(declare-fun e!51558 () Bool)

(assert (=> d!24784 e!51558))

(declare-fun res!64959 () Bool)

(assert (=> d!24784 (=> (not res!64959) (not e!51558))))

(declare-fun lt!125474 () (_ BitVec 64))

(declare-fun lt!125475 () (_ BitVec 64))

(declare-fun lt!125477 () (_ BitVec 64))

(assert (=> d!24784 (= res!64959 (= lt!125477 (bvsub lt!125474 lt!125475)))))

(assert (=> d!24784 (or (= (bvand lt!125474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125474 lt!125475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24784 (= lt!125475 (remainingBits!0 ((_ sign_extend 32) (size!1548 (buf!1938 (_2!3635 lt!125444)))) ((_ sign_extend 32) (currentByte!3785 (_2!3635 lt!125444))) ((_ sign_extend 32) (currentBit!3780 (_2!3635 lt!125444)))))))

(declare-fun lt!125476 () (_ BitVec 64))

(declare-fun lt!125473 () (_ BitVec 64))

(assert (=> d!24784 (= lt!125474 (bvmul lt!125476 lt!125473))))

(assert (=> d!24784 (or (= lt!125476 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125473 (bvsdiv (bvmul lt!125476 lt!125473) lt!125476)))))

(assert (=> d!24784 (= lt!125473 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24784 (= lt!125476 ((_ sign_extend 32) (size!1548 (buf!1938 (_2!3635 lt!125444)))))))

(assert (=> d!24784 (= lt!125477 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3785 (_2!3635 lt!125444))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3780 (_2!3635 lt!125444)))))))

(assert (=> d!24784 (invariant!0 (currentBit!3780 (_2!3635 lt!125444)) (currentByte!3785 (_2!3635 lt!125444)) (size!1548 (buf!1938 (_2!3635 lt!125444))))))

(assert (=> d!24784 (= (bitIndex!0 (size!1548 (buf!1938 (_2!3635 lt!125444))) (currentByte!3785 (_2!3635 lt!125444)) (currentBit!3780 (_2!3635 lt!125444))) lt!125477)))

(declare-fun b!78569 () Bool)

(declare-fun res!64960 () Bool)

(assert (=> b!78569 (=> (not res!64960) (not e!51558))))

(assert (=> b!78569 (= res!64960 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125477))))

(declare-fun b!78570 () Bool)

(declare-fun lt!125478 () (_ BitVec 64))

(assert (=> b!78570 (= e!51558 (bvsle lt!125477 (bvmul lt!125478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78570 (or (= lt!125478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125478)))))

(assert (=> b!78570 (= lt!125478 ((_ sign_extend 32) (size!1548 (buf!1938 (_2!3635 lt!125444)))))))

(assert (= (and d!24784 res!64959) b!78569))

(assert (= (and b!78569 res!64960) b!78570))

(declare-fun m!124101 () Bool)

(assert (=> d!24784 m!124101))

(assert (=> d!24784 m!124065))

(assert (=> b!78525 d!24784))

(declare-fun d!24786 () Bool)

(declare-fun e!51559 () Bool)

(assert (=> d!24786 e!51559))

(declare-fun res!64961 () Bool)

(assert (=> d!24786 (=> (not res!64961) (not e!51559))))

(declare-fun lt!125481 () (_ BitVec 64))

(declare-fun lt!125483 () (_ BitVec 64))

(declare-fun lt!125480 () (_ BitVec 64))

(assert (=> d!24786 (= res!64961 (= lt!125483 (bvsub lt!125480 lt!125481)))))

(assert (=> d!24786 (or (= (bvand lt!125480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125480 lt!125481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24786 (= lt!125481 (remainingBits!0 ((_ sign_extend 32) (size!1548 (buf!1938 thiss!1107))) ((_ sign_extend 32) (currentByte!3785 thiss!1107)) ((_ sign_extend 32) (currentBit!3780 thiss!1107))))))

(declare-fun lt!125482 () (_ BitVec 64))

(declare-fun lt!125479 () (_ BitVec 64))

(assert (=> d!24786 (= lt!125480 (bvmul lt!125482 lt!125479))))

(assert (=> d!24786 (or (= lt!125482 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125479 (bvsdiv (bvmul lt!125482 lt!125479) lt!125482)))))

(assert (=> d!24786 (= lt!125479 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24786 (= lt!125482 ((_ sign_extend 32) (size!1548 (buf!1938 thiss!1107))))))

(assert (=> d!24786 (= lt!125483 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3785 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3780 thiss!1107))))))

(assert (=> d!24786 (invariant!0 (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107) (size!1548 (buf!1938 thiss!1107)))))

(assert (=> d!24786 (= (bitIndex!0 (size!1548 (buf!1938 thiss!1107)) (currentByte!3785 thiss!1107) (currentBit!3780 thiss!1107)) lt!125483)))

(declare-fun b!78571 () Bool)

(declare-fun res!64962 () Bool)

(assert (=> b!78571 (=> (not res!64962) (not e!51559))))

(assert (=> b!78571 (= res!64962 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125483))))

(declare-fun b!78572 () Bool)

(declare-fun lt!125484 () (_ BitVec 64))

(assert (=> b!78572 (= e!51559 (bvsle lt!125483 (bvmul lt!125484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78572 (or (= lt!125484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125484)))))

(assert (=> b!78572 (= lt!125484 ((_ sign_extend 32) (size!1548 (buf!1938 thiss!1107))))))

(assert (= (and d!24786 res!64961) b!78571))

(assert (= (and b!78571 res!64962) b!78572))

(declare-fun m!124103 () Bool)

(assert (=> d!24786 m!124103))

(declare-fun m!124105 () Bool)

(assert (=> d!24786 m!124105))

(assert (=> b!78525 d!24786))

(declare-fun d!24788 () Bool)

(assert (=> d!24788 (= (array_inv!1394 (buf!1938 thiss!1107)) (bvsge (size!1548 (buf!1938 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78524 d!24788))

(declare-fun d!24790 () Bool)

(assert (=> d!24790 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1548 (buf!1938 thiss!1107))) ((_ sign_extend 32) (currentByte!3785 thiss!1107)) ((_ sign_extend 32) (currentBit!3780 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1548 (buf!1938 thiss!1107))) ((_ sign_extend 32) (currentByte!3785 thiss!1107)) ((_ sign_extend 32) (currentBit!3780 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6012 () Bool)

(assert (= bs!6012 d!24790))

(assert (=> bs!6012 m!124103))

(assert (=> b!78523 d!24790))

(declare-fun d!24792 () Bool)

(assert (=> d!24792 (= (invariant!0 (currentBit!3780 (_2!3635 lt!125444)) (currentByte!3785 (_2!3635 lt!125444)) (size!1548 (buf!1938 (_2!3635 lt!125444)))) (and (bvsge (currentBit!3780 (_2!3635 lt!125444)) #b00000000000000000000000000000000) (bvslt (currentBit!3780 (_2!3635 lt!125444)) #b00000000000000000000000000001000) (bvsge (currentByte!3785 (_2!3635 lt!125444)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3785 (_2!3635 lt!125444)) (size!1548 (buf!1938 (_2!3635 lt!125444)))) (and (= (currentBit!3780 (_2!3635 lt!125444)) #b00000000000000000000000000000000) (= (currentByte!3785 (_2!3635 lt!125444)) (size!1548 (buf!1938 (_2!3635 lt!125444))))))))))

(assert (=> b!78527 d!24792))

(declare-fun d!24794 () Bool)

(declare-datatypes ((tuple2!7004 0))(
  ( (tuple2!7005 (_1!3639 Bool) (_2!3639 BitStream!2658)) )
))
(declare-fun lt!125487 () tuple2!7004)

(declare-fun readBit!0 (BitStream!2658) tuple2!7004)

(assert (=> d!24794 (= lt!125487 (readBit!0 (readerFrom!0 (_2!3635 lt!125444) (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107))))))

(assert (=> d!24794 (= (readBitPure!0 (readerFrom!0 (_2!3635 lt!125444) (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107))) (tuple2!6999 (_2!3639 lt!125487) (_1!3639 lt!125487)))))

(declare-fun bs!6013 () Bool)

(assert (= bs!6013 d!24794))

(assert (=> bs!6013 m!124049))

(declare-fun m!124107 () Bool)

(assert (=> bs!6013 m!124107))

(assert (=> b!78526 d!24794))

(declare-fun d!24796 () Bool)

(declare-fun e!51562 () Bool)

(assert (=> d!24796 e!51562))

(declare-fun res!64966 () Bool)

(assert (=> d!24796 (=> (not res!64966) (not e!51562))))

(assert (=> d!24796 (= res!64966 (invariant!0 (currentBit!3780 (_2!3635 lt!125444)) (currentByte!3785 (_2!3635 lt!125444)) (size!1548 (buf!1938 (_2!3635 lt!125444)))))))

(assert (=> d!24796 (= (readerFrom!0 (_2!3635 lt!125444) (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107)) (BitStream!2659 (buf!1938 (_2!3635 lt!125444)) (currentByte!3785 thiss!1107) (currentBit!3780 thiss!1107)))))

(declare-fun b!78575 () Bool)

(assert (=> b!78575 (= e!51562 (invariant!0 (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107) (size!1548 (buf!1938 (_2!3635 lt!125444)))))))

(assert (= (and d!24796 res!64966) b!78575))

(assert (=> d!24796 m!124065))

(assert (=> b!78575 m!124067))

(assert (=> b!78526 d!24796))

(declare-fun d!24798 () Bool)

(assert (=> d!24798 (= (invariant!0 (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107) (size!1548 (buf!1938 (_2!3635 lt!125444)))) (and (bvsge (currentBit!3780 thiss!1107) #b00000000000000000000000000000000) (bvslt (currentBit!3780 thiss!1107) #b00000000000000000000000000001000) (bvsge (currentByte!3785 thiss!1107) #b00000000000000000000000000000000) (or (bvslt (currentByte!3785 thiss!1107) (size!1548 (buf!1938 (_2!3635 lt!125444)))) (and (= (currentBit!3780 thiss!1107) #b00000000000000000000000000000000) (= (currentByte!3785 thiss!1107) (size!1548 (buf!1938 (_2!3635 lt!125444))))))))))

(assert (=> b!78530 d!24798))

(declare-fun d!24802 () Bool)

(declare-fun e!51563 () Bool)

(assert (=> d!24802 e!51563))

(declare-fun res!64967 () Bool)

(assert (=> d!24802 (=> (not res!64967) (not e!51563))))

(declare-fun lt!125490 () (_ BitVec 64))

(declare-fun lt!125492 () (_ BitVec 64))

(declare-fun lt!125489 () (_ BitVec 64))

(assert (=> d!24802 (= res!64967 (= lt!125492 (bvsub lt!125489 lt!125490)))))

(assert (=> d!24802 (or (= (bvand lt!125489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125490 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125489 lt!125490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24802 (= lt!125490 (remainingBits!0 ((_ sign_extend 32) (size!1548 (buf!1938 (_1!3636 lt!125442)))) ((_ sign_extend 32) (currentByte!3785 (_1!3636 lt!125442))) ((_ sign_extend 32) (currentBit!3780 (_1!3636 lt!125442)))))))

(declare-fun lt!125491 () (_ BitVec 64))

(declare-fun lt!125488 () (_ BitVec 64))

(assert (=> d!24802 (= lt!125489 (bvmul lt!125491 lt!125488))))

(assert (=> d!24802 (or (= lt!125491 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125488 (bvsdiv (bvmul lt!125491 lt!125488) lt!125491)))))

(assert (=> d!24802 (= lt!125488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24802 (= lt!125491 ((_ sign_extend 32) (size!1548 (buf!1938 (_1!3636 lt!125442)))))))

(assert (=> d!24802 (= lt!125492 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3785 (_1!3636 lt!125442))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3780 (_1!3636 lt!125442)))))))

(assert (=> d!24802 (invariant!0 (currentBit!3780 (_1!3636 lt!125442)) (currentByte!3785 (_1!3636 lt!125442)) (size!1548 (buf!1938 (_1!3636 lt!125442))))))

(assert (=> d!24802 (= (bitIndex!0 (size!1548 (buf!1938 (_1!3636 lt!125442))) (currentByte!3785 (_1!3636 lt!125442)) (currentBit!3780 (_1!3636 lt!125442))) lt!125492)))

(declare-fun b!78576 () Bool)

(declare-fun res!64968 () Bool)

(assert (=> b!78576 (=> (not res!64968) (not e!51563))))

(assert (=> b!78576 (= res!64968 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125492))))

(declare-fun b!78577 () Bool)

(declare-fun lt!125493 () (_ BitVec 64))

(assert (=> b!78577 (= e!51563 (bvsle lt!125492 (bvmul lt!125493 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78577 (or (= lt!125493 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125493 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125493)))))

(assert (=> b!78577 (= lt!125493 ((_ sign_extend 32) (size!1548 (buf!1938 (_1!3636 lt!125442)))))))

(assert (= (and d!24802 res!64967) b!78576))

(assert (= (and b!78576 res!64968) b!78577))

(declare-fun m!124109 () Bool)

(assert (=> d!24802 m!124109))

(declare-fun m!124111 () Bool)

(assert (=> d!24802 m!124111))

(assert (=> b!78529 d!24802))

(declare-fun b!78606 () Bool)

(declare-fun e!51579 () Bool)

(declare-fun lt!125518 () tuple2!6998)

(declare-fun lt!125517 () tuple2!6996)

(assert (=> b!78606 (= e!51579 (= (bitIndex!0 (size!1548 (buf!1938 (_1!3636 lt!125518))) (currentByte!3785 (_1!3636 lt!125518)) (currentBit!3780 (_1!3636 lt!125518))) (bitIndex!0 (size!1548 (buf!1938 (_2!3635 lt!125517))) (currentByte!3785 (_2!3635 lt!125517)) (currentBit!3780 (_2!3635 lt!125517)))))))

(declare-fun b!78603 () Bool)

(declare-fun res!64994 () Bool)

(declare-fun e!51580 () Bool)

(assert (=> b!78603 (=> (not res!64994) (not e!51580))))

(declare-fun lt!125519 () (_ BitVec 64))

(declare-fun lt!125520 () (_ BitVec 64))

(assert (=> b!78603 (= res!64994 (= (bitIndex!0 (size!1548 (buf!1938 (_2!3635 lt!125517))) (currentByte!3785 (_2!3635 lt!125517)) (currentBit!3780 (_2!3635 lt!125517))) (bvadd lt!125520 lt!125519)))))

(assert (=> b!78603 (or (not (= (bvand lt!125520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125519 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125520 lt!125519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78603 (= lt!125519 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78603 (= lt!125520 (bitIndex!0 (size!1548 (buf!1938 thiss!1107)) (currentByte!3785 thiss!1107) (currentBit!3780 thiss!1107)))))

(declare-fun d!24804 () Bool)

(assert (=> d!24804 e!51580))

(declare-fun res!64995 () Bool)

(assert (=> d!24804 (=> (not res!64995) (not e!51580))))

(assert (=> d!24804 (= res!64995 (= (size!1548 (buf!1938 thiss!1107)) (size!1548 (buf!1938 (_2!3635 lt!125517)))))))

(declare-fun choose!16 (BitStream!2658 Bool) tuple2!6996)

(assert (=> d!24804 (= lt!125517 (choose!16 thiss!1107 lt!125441))))

(assert (=> d!24804 (validate_offset_bit!0 ((_ sign_extend 32) (size!1548 (buf!1938 thiss!1107))) ((_ sign_extend 32) (currentByte!3785 thiss!1107)) ((_ sign_extend 32) (currentBit!3780 thiss!1107)))))

(assert (=> d!24804 (= (appendBit!0 thiss!1107 lt!125441) lt!125517)))

(declare-fun b!78605 () Bool)

(assert (=> b!78605 (= e!51580 e!51579)))

(declare-fun res!64997 () Bool)

(assert (=> b!78605 (=> (not res!64997) (not e!51579))))

(assert (=> b!78605 (= res!64997 (and (= (_2!3636 lt!125518) lt!125441) (= (_1!3636 lt!125518) (_2!3635 lt!125517))))))

(assert (=> b!78605 (= lt!125518 (readBitPure!0 (readerFrom!0 (_2!3635 lt!125517) (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107))))))

(declare-fun b!78604 () Bool)

(declare-fun res!64996 () Bool)

(assert (=> b!78604 (=> (not res!64996) (not e!51580))))

(assert (=> b!78604 (= res!64996 (isPrefixOf!0 thiss!1107 (_2!3635 lt!125517)))))

(assert (= (and d!24804 res!64995) b!78603))

(assert (= (and b!78603 res!64994) b!78604))

(assert (= (and b!78604 res!64996) b!78605))

(assert (= (and b!78605 res!64997) b!78606))

(declare-fun m!124119 () Bool)

(assert (=> d!24804 m!124119))

(assert (=> d!24804 m!124063))

(declare-fun m!124121 () Bool)

(assert (=> b!78606 m!124121))

(declare-fun m!124123 () Bool)

(assert (=> b!78606 m!124123))

(declare-fun m!124125 () Bool)

(assert (=> b!78604 m!124125))

(declare-fun m!124127 () Bool)

(assert (=> b!78605 m!124127))

(assert (=> b!78605 m!124127))

(declare-fun m!124129 () Bool)

(assert (=> b!78605 m!124129))

(assert (=> b!78603 m!124123))

(assert (=> b!78603 m!124061))

(assert (=> b!78528 d!24804))

(declare-fun d!24818 () Bool)

(assert (=> d!24818 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3780 thiss!1107) (currentByte!3785 thiss!1107) (size!1548 (buf!1938 thiss!1107))))))

(declare-fun bs!6016 () Bool)

(assert (= bs!6016 d!24818))

(assert (=> bs!6016 m!124105))

(assert (=> start!15470 d!24818))

(declare-fun d!24824 () Bool)

(declare-fun res!65022 () Bool)

(declare-fun e!51593 () Bool)

(assert (=> d!24824 (=> (not res!65022) (not e!51593))))

(assert (=> d!24824 (= res!65022 (= (size!1548 (buf!1938 thiss!1107)) (size!1548 (buf!1938 (_2!3635 lt!125444)))))))

(assert (=> d!24824 (= (isPrefixOf!0 thiss!1107 (_2!3635 lt!125444)) e!51593)))

(declare-fun b!78629 () Bool)

(declare-fun res!65020 () Bool)

(assert (=> b!78629 (=> (not res!65020) (not e!51593))))

(assert (=> b!78629 (= res!65020 (bvsle (bitIndex!0 (size!1548 (buf!1938 thiss!1107)) (currentByte!3785 thiss!1107) (currentBit!3780 thiss!1107)) (bitIndex!0 (size!1548 (buf!1938 (_2!3635 lt!125444))) (currentByte!3785 (_2!3635 lt!125444)) (currentBit!3780 (_2!3635 lt!125444)))))))

(declare-fun b!78630 () Bool)

(declare-fun e!51594 () Bool)

(assert (=> b!78630 (= e!51593 e!51594)))

(declare-fun res!65021 () Bool)

(assert (=> b!78630 (=> res!65021 e!51594)))

(assert (=> b!78630 (= res!65021 (= (size!1548 (buf!1938 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78631 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3345 array!3345 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78631 (= e!51594 (arrayBitRangesEq!0 (buf!1938 thiss!1107) (buf!1938 (_2!3635 lt!125444)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1548 (buf!1938 thiss!1107)) (currentByte!3785 thiss!1107) (currentBit!3780 thiss!1107))))))

(assert (= (and d!24824 res!65022) b!78629))

(assert (= (and b!78629 res!65020) b!78630))

(assert (= (and b!78630 (not res!65021)) b!78631))

(assert (=> b!78629 m!124061))

(assert (=> b!78629 m!124059))

(assert (=> b!78631 m!124061))

(assert (=> b!78631 m!124061))

(declare-fun m!124149 () Bool)

(assert (=> b!78631 m!124149))

(assert (=> b!78522 d!24824))

(assert (=> b!78521 d!24784))

(assert (=> b!78521 d!24786))

(assert (=> b!78531 d!24824))

(check-sat (not b!78604) (not d!24804) (not b!78605) (not b!78631) (not d!24818) (not d!24784) (not b!78629) (not d!24796) (not b!78603) (not d!24794) (not d!24790) (not d!24802) (not d!24786) (not b!78606) (not b!78575))
