; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32462 () Bool)

(assert start!32462)

(declare-fun b!160053 () Bool)

(declare-fun res!133574 () Bool)

(declare-fun e!109491 () Bool)

(assert (=> b!160053 (=> res!133574 e!109491)))

(declare-datatypes ((array!7637 0))(
  ( (array!7638 (arr!4377 (Array (_ BitVec 32) (_ BitVec 8))) (size!3456 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6080 0))(
  ( (BitStream!6081 (buf!3914 array!7637) (currentByte!7163 (_ BitVec 32)) (currentBit!7158 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10937 0))(
  ( (Unit!10938) )
))
(declare-datatypes ((tuple3!814 0))(
  ( (tuple3!815 (_1!7757 Unit!10937) (_2!7757 (_ BitVec 8)) (_3!524 BitStream!6080)) )
))
(declare-fun lt!252549 () tuple3!814)

(declare-fun thiss!1602 () BitStream!6080)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!160053 (= res!133574 (not (= (bitIndex!0 (size!3456 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)) (currentBit!7158 (_3!524 lt!252549))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3456 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) (currentBit!7158 thiss!1602))))))))

(declare-fun b!160054 () Bool)

(declare-fun res!133577 () Bool)

(assert (=> b!160054 (=> res!133577 e!109491)))

(declare-fun isPrefixOf!0 (BitStream!6080 BitStream!6080) Bool)

(assert (=> b!160054 (= res!133577 (not (isPrefixOf!0 thiss!1602 (_3!524 lt!252549))))))

(declare-fun b!160055 () Bool)

(declare-fun e!109489 () Bool)

(declare-fun array_inv!3203 (array!7637) Bool)

(assert (=> b!160055 (= e!109489 (array_inv!3203 (buf!3914 thiss!1602)))))

(declare-fun b!160056 () Bool)

(declare-fun e!109487 () Bool)

(declare-fun e!109493 () Bool)

(assert (=> b!160056 (= e!109487 (not e!109493))))

(declare-fun res!133571 () Bool)

(assert (=> b!160056 (=> res!133571 e!109493)))

(declare-fun lt!252562 () array!7637)

(declare-fun arrayRangesEq!507 (array!7637 array!7637 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160056 (= res!133571 (not (arrayRangesEq!507 (buf!3914 thiss!1602) lt!252562 #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001))))))

(declare-fun lt!252553 () (_ BitVec 8))

(assert (=> b!160056 (arrayRangesEq!507 (buf!3914 thiss!1602) (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) lt!252553) (size!3456 (buf!3914 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001))))

(declare-fun lt!252554 () Unit!10937)

(declare-fun arrayUpdatedAtPrefixLemma!115 (array!7637 (_ BitVec 32) (_ BitVec 8)) Unit!10937)

(assert (=> b!160056 (= lt!252554 (arrayUpdatedAtPrefixLemma!115 (buf!3914 thiss!1602) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) lt!252553))))

(assert (=> b!160056 (= lt!252553 (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(declare-fun lt!252551 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252552 () (_ BitVec 8))

(declare-fun lt!252557 () Bool)

(declare-fun lt!252560 () (_ BitVec 32))

(declare-fun lt!252556 () (_ BitVec 32))

(declare-fun lt!252561 () (_ BitVec 8))

(declare-fun Unit!10939 () Unit!10937)

(declare-fun Unit!10940 () Unit!10937)

(assert (=> b!160056 (= lt!252549 (ite lt!252557 (let ((bdg!9472 ((_ extract 7 0) (bvnot lt!252560)))) (let ((bdg!9473 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) lt!252552) (currentByte!7163 thiss!1602) lt!252561) (bvadd #b00000000000000000000000000000001 (currentByte!7163 thiss!1602)))) ((_ sign_extend 24) bdg!9472))))) (tuple3!815 Unit!10939 bdg!9472 (BitStream!6081 (array!7638 (store (arr!4377 (array!7638 (store (arr!4377 lt!252562) (bvadd #b00000000000000000000000000000001 (currentByte!7163 thiss!1602)) bdg!9473) (size!3456 lt!252562))) (bvadd #b00000000000000000000000000000001 (currentByte!7163 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9473) (bvshl ((_ sign_extend 24) v!222) lt!252556)))) (size!3456 (array!7638 (store (arr!4377 lt!252562) (bvadd #b00000000000000000000000000000001 (currentByte!7163 thiss!1602)) bdg!9473) (size!3456 lt!252562)))) (bvadd #b00000000000000000000000000000001 (currentByte!7163 thiss!1602)) (currentBit!7158 thiss!1602))))) (tuple3!815 Unit!10940 lt!252551 (BitStream!6081 lt!252562 (bvadd #b00000000000000000000000000000001 (currentByte!7163 thiss!1602)) (currentBit!7158 thiss!1602)))))))

(declare-fun lt!252559 () (_ BitVec 32))

(assert (=> b!160056 (= lt!252557 (bvsgt lt!252559 #b00000000000000000000000000000000))))

(declare-fun e!109492 () Bool)

(assert (=> b!160056 e!109492))

(declare-fun res!133576 () Bool)

(assert (=> b!160056 (=> res!133576 e!109492)))

(assert (=> b!160056 (= res!133576 (bvsge (currentByte!7163 thiss!1602) (size!3456 (buf!3914 thiss!1602))))))

(assert (=> b!160056 (= lt!252562 (array!7638 (store (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) lt!252552) (currentByte!7163 thiss!1602) lt!252561) (size!3456 (buf!3914 thiss!1602))))))

(assert (=> b!160056 (= lt!252561 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252552) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252559))))))

(assert (=> b!160056 (= lt!252552 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602))) lt!252560)))))

(assert (=> b!160056 (= lt!252560 ((_ sign_extend 24) lt!252551))))

(assert (=> b!160056 (= lt!252551 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252556)))))))

(assert (=> b!160056 (= lt!252556 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252559))))))

(assert (=> b!160056 (= lt!252559 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7158 thiss!1602))))))

(declare-fun b!160057 () Bool)

(declare-datatypes ((tuple2!14466 0))(
  ( (tuple2!14467 (_1!7758 BitStream!6080) (_2!7758 BitStream!6080)) )
))
(declare-fun lt!252558 () tuple2!14466)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!160057 (= e!109491 (validate_offset_byte!0 ((_ sign_extend 32) (size!3456 (buf!3914 (_1!7758 lt!252558)))) ((_ sign_extend 32) (currentByte!7163 (_1!7758 lt!252558))) ((_ sign_extend 32) (currentBit!7158 (_1!7758 lt!252558)))))))

(declare-fun reader!0 (BitStream!6080 BitStream!6080) tuple2!14466)

(assert (=> b!160057 (= lt!252558 (reader!0 thiss!1602 (_3!524 lt!252549)))))

(declare-fun b!160058 () Bool)

(declare-fun e!109490 () Unit!10937)

(declare-fun Unit!10941 () Unit!10937)

(assert (=> b!160058 (= e!109490 Unit!10941)))

(declare-fun lt!252564 () Unit!10937)

(assert (=> b!160058 (= lt!252564 (arrayUpdatedAtPrefixLemma!115 (buf!3914 thiss!1602) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))))))

(declare-fun call!2723 () Bool)

(assert (=> b!160058 call!2723))

(declare-fun lt!252555 () Unit!10937)

(assert (=> b!160058 (= lt!252555 (arrayUpdatedAtPrefixLemma!115 lt!252562 (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))))))

(assert (=> b!160058 (arrayRangesEq!507 lt!252562 (array!7638 (store (store (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) lt!252552) (currentByte!7163 thiss!1602) lt!252561) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7163 (_3!524 lt!252549)))))

(declare-fun lt!252563 () Unit!10937)

(declare-fun arrayRangesEqTransitive!141 (array!7637 array!7637 array!7637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10937)

(assert (=> b!160058 (= lt!252563 (arrayRangesEqTransitive!141 (buf!3914 thiss!1602) lt!252562 (buf!3914 (_3!524 lt!252549)) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) (currentByte!7163 (_3!524 lt!252549))))))

(declare-fun res!133575 () Bool)

(assert (=> b!160058 (= res!133575 (arrayRangesEq!507 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(declare-fun e!109494 () Bool)

(assert (=> b!160058 (=> (not res!133575) (not e!109494))))

(assert (=> b!160058 e!109494))

(declare-fun c!8453 () Bool)

(declare-fun bm!2720 () Bool)

(assert (=> bm!2720 (= call!2723 (arrayRangesEq!507 (buf!3914 thiss!1602) (ite c!8453 (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602))) (buf!3914 (_3!524 lt!252549))) #b00000000000000000000000000000000 (ite c!8453 (currentByte!7163 (_3!524 lt!252549)) (currentByte!7163 thiss!1602))))))

(declare-fun res!133572 () Bool)

(assert (=> start!32462 (=> (not res!133572) (not e!109487))))

(assert (=> start!32462 (= res!133572 (validate_offset_byte!0 ((_ sign_extend 32) (size!3456 (buf!3914 thiss!1602))) ((_ sign_extend 32) (currentByte!7163 thiss!1602)) ((_ sign_extend 32) (currentBit!7158 thiss!1602))))))

(assert (=> start!32462 e!109487))

(declare-fun inv!12 (BitStream!6080) Bool)

(assert (=> start!32462 (and (inv!12 thiss!1602) e!109489)))

(assert (=> start!32462 true))

(declare-fun b!160059 () Bool)

(assert (=> b!160059 (= e!109494 (arrayRangesEq!507 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) #b00000000000000000000000000000000 (currentByte!7163 thiss!1602)))))

(declare-fun b!160060 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160060 (= e!109492 (byteRangesEq!0 (select (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602)) lt!252561 #b00000000000000000000000000000000 (currentBit!7158 thiss!1602)))))

(declare-fun b!160061 () Bool)

(declare-fun Unit!10942 () Unit!10937)

(assert (=> b!160061 (= e!109490 Unit!10942)))

(assert (=> b!160061 call!2723))

(declare-fun b!160062 () Bool)

(assert (=> b!160062 (= e!109493 e!109491)))

(declare-fun res!133573 () Bool)

(assert (=> b!160062 (=> res!133573 e!109491)))

(assert (=> b!160062 (= res!133573 (not (= (size!3456 (buf!3914 thiss!1602)) (size!3456 (buf!3914 (_3!524 lt!252549))))))))

(declare-fun lt!252550 () Unit!10937)

(assert (=> b!160062 (= lt!252550 e!109490)))

(assert (=> b!160062 (= c!8453 lt!252557)))

(assert (= (and start!32462 res!133572) b!160056))

(assert (= (and b!160056 (not res!133576)) b!160060))

(assert (= (and b!160056 (not res!133571)) b!160062))

(assert (= (and b!160062 c!8453) b!160058))

(assert (= (and b!160062 (not c!8453)) b!160061))

(assert (= (and b!160058 res!133575) b!160059))

(assert (= (or b!160058 b!160061) bm!2720))

(assert (= (and b!160062 (not res!133573)) b!160053))

(assert (= (and b!160053 (not res!133574)) b!160054))

(assert (= (and b!160054 (not res!133577)) b!160057))

(assert (= start!32462 b!160055))

(declare-fun m!252593 () Bool)

(assert (=> b!160058 m!252593))

(declare-fun m!252595 () Bool)

(assert (=> b!160058 m!252595))

(assert (=> b!160058 m!252595))

(declare-fun m!252597 () Bool)

(assert (=> b!160058 m!252597))

(assert (=> b!160058 m!252595))

(declare-fun m!252599 () Bool)

(assert (=> b!160058 m!252599))

(declare-fun m!252601 () Bool)

(assert (=> b!160058 m!252601))

(declare-fun m!252603 () Bool)

(assert (=> b!160058 m!252603))

(declare-fun m!252605 () Bool)

(assert (=> b!160058 m!252605))

(declare-fun m!252607 () Bool)

(assert (=> b!160058 m!252607))

(declare-fun m!252609 () Bool)

(assert (=> b!160058 m!252609))

(declare-fun m!252611 () Bool)

(assert (=> start!32462 m!252611))

(declare-fun m!252613 () Bool)

(assert (=> start!32462 m!252613))

(declare-fun m!252615 () Bool)

(assert (=> b!160055 m!252615))

(declare-fun m!252617 () Bool)

(assert (=> b!160059 m!252617))

(assert (=> bm!2720 m!252595))

(declare-fun m!252619 () Bool)

(assert (=> bm!2720 m!252619))

(declare-fun m!252621 () Bool)

(assert (=> bm!2720 m!252621))

(declare-fun m!252623 () Bool)

(assert (=> b!160060 m!252623))

(assert (=> b!160060 m!252623))

(declare-fun m!252625 () Bool)

(assert (=> b!160060 m!252625))

(declare-fun m!252627 () Bool)

(assert (=> b!160053 m!252627))

(declare-fun m!252629 () Bool)

(assert (=> b!160053 m!252629))

(declare-fun m!252631 () Bool)

(assert (=> b!160054 m!252631))

(declare-fun m!252633 () Bool)

(assert (=> b!160056 m!252633))

(declare-fun m!252635 () Bool)

(assert (=> b!160056 m!252635))

(declare-fun m!252637 () Bool)

(assert (=> b!160056 m!252637))

(declare-fun m!252639 () Bool)

(assert (=> b!160056 m!252639))

(declare-fun m!252641 () Bool)

(assert (=> b!160056 m!252641))

(declare-fun m!252643 () Bool)

(assert (=> b!160056 m!252643))

(declare-fun m!252645 () Bool)

(assert (=> b!160056 m!252645))

(declare-fun m!252647 () Bool)

(assert (=> b!160056 m!252647))

(declare-fun m!252649 () Bool)

(assert (=> b!160056 m!252649))

(assert (=> b!160056 m!252623))

(assert (=> b!160056 m!252603))

(assert (=> b!160056 m!252605))

(declare-fun m!252651 () Bool)

(assert (=> b!160057 m!252651))

(declare-fun m!252653 () Bool)

(assert (=> b!160057 m!252653))

(push 1)

(assert (not b!160053))

(assert (not b!160058))

(assert (not b!160059))

(assert (not b!160054))

(assert (not b!160056))

(assert (not b!160060))

(assert (not bm!2720))

(assert (not b!160057))

(assert (not b!160055))

(assert (not start!32462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53935 () Bool)

(declare-fun res!133604 () Bool)

(declare-fun e!109517 () Bool)

(assert (=> d!53935 (=> res!133604 e!109517)))

(assert (=> d!53935 (= res!133604 (= #b00000000000000000000000000000000 (currentByte!7163 thiss!1602)))))

(assert (=> d!53935 (= (arrayRangesEq!507 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) #b00000000000000000000000000000000 (currentByte!7163 thiss!1602)) e!109517)))

(declare-fun b!160089 () Bool)

(declare-fun e!109518 () Bool)

(assert (=> b!160089 (= e!109517 e!109518)))

(declare-fun res!133605 () Bool)

(assert (=> b!160089 (=> (not res!133605) (not e!109518))))

(assert (=> b!160089 (= res!133605 (= (select (arr!4377 (buf!3914 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) #b00000000000000000000000000000000)))))

(declare-fun b!160090 () Bool)

(assert (=> b!160090 (= e!109518 (arrayRangesEq!507 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7163 thiss!1602)))))

(assert (= (and d!53935 (not res!133604)) b!160089))

(assert (= (and b!160089 res!133605) b!160090))

(declare-fun m!252695 () Bool)

(assert (=> b!160089 m!252695))

(declare-fun m!252697 () Bool)

(assert (=> b!160089 m!252697))

(declare-fun m!252699 () Bool)

(assert (=> b!160090 m!252699))

(assert (=> b!160059 d!53935))

(declare-fun d!53937 () Bool)

(assert (=> d!53937 (= (array_inv!3203 (buf!3914 thiss!1602)) (bvsge (size!3456 (buf!3914 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160055 d!53937))

(declare-fun d!53939 () Bool)

(declare-fun res!133606 () Bool)

(declare-fun e!109519 () Bool)

(assert (=> d!53939 (=> res!133606 e!109519)))

(assert (=> d!53939 (= res!133606 (= #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(assert (=> d!53939 (= (arrayRangesEq!507 (buf!3914 thiss!1602) lt!252562 #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)) e!109519)))

(declare-fun b!160091 () Bool)

(declare-fun e!109520 () Bool)

(assert (=> b!160091 (= e!109519 e!109520)))

(declare-fun res!133607 () Bool)

(assert (=> b!160091 (=> (not res!133607) (not e!109520))))

(assert (=> b!160091 (= res!133607 (= (select (arr!4377 (buf!3914 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4377 lt!252562) #b00000000000000000000000000000000)))))

(declare-fun b!160092 () Bool)

(assert (=> b!160092 (= e!109520 (arrayRangesEq!507 (buf!3914 thiss!1602) lt!252562 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(assert (= (and d!53939 (not res!133606)) b!160091))

(assert (= (and b!160091 res!133607) b!160092))

(assert (=> b!160091 m!252695))

(declare-fun m!252701 () Bool)

(assert (=> b!160091 m!252701))

(declare-fun m!252703 () Bool)

(assert (=> b!160092 m!252703))

(assert (=> b!160056 d!53939))

(declare-fun d!53941 () Bool)

(declare-fun res!133608 () Bool)

(declare-fun e!109521 () Bool)

(assert (=> d!53941 (=> res!133608 e!109521)))

(assert (=> d!53941 (= res!133608 (= #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(assert (=> d!53941 (= (arrayRangesEq!507 (buf!3914 thiss!1602) (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) lt!252553) (size!3456 (buf!3914 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)) e!109521)))

(declare-fun b!160093 () Bool)

(declare-fun e!109522 () Bool)

(assert (=> b!160093 (= e!109521 e!109522)))

(declare-fun res!133609 () Bool)

(assert (=> b!160093 (=> (not res!133609) (not e!109522))))

(assert (=> b!160093 (= res!133609 (= (select (arr!4377 (buf!3914 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4377 (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) lt!252553) (size!3456 (buf!3914 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!160094 () Bool)

(assert (=> b!160094 (= e!109522 (arrayRangesEq!507 (buf!3914 thiss!1602) (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) lt!252553) (size!3456 (buf!3914 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(assert (= (and d!53941 (not res!133608)) b!160093))

(assert (= (and b!160093 res!133609) b!160094))

(assert (=> b!160093 m!252695))

(declare-fun m!252705 () Bool)

(assert (=> b!160093 m!252705))

(declare-fun m!252707 () Bool)

(assert (=> b!160094 m!252707))

(assert (=> b!160056 d!53941))

(declare-fun d!53943 () Bool)

(declare-fun e!109525 () Bool)

(assert (=> d!53943 e!109525))

(declare-fun res!133612 () Bool)

(assert (=> d!53943 (=> (not res!133612) (not e!109525))))

(assert (=> d!53943 (= res!133612 (and (bvsge (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) (size!3456 (buf!3914 thiss!1602)))))))

(declare-fun lt!252598 () Unit!10937)

(declare-fun choose!147 (array!7637 (_ BitVec 32) (_ BitVec 8)) Unit!10937)

(assert (=> d!53943 (= lt!252598 (choose!147 (buf!3914 thiss!1602) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) lt!252553))))

(assert (=> d!53943 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) (size!3456 (buf!3914 thiss!1602))))))

(assert (=> d!53943 (= (arrayUpdatedAtPrefixLemma!115 (buf!3914 thiss!1602) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) lt!252553) lt!252598)))

(declare-fun b!160097 () Bool)

(assert (=> b!160097 (= e!109525 (arrayRangesEq!507 (buf!3914 thiss!1602) (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) lt!252553) (size!3456 (buf!3914 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(assert (= (and d!53943 res!133612) b!160097))

(declare-fun m!252709 () Bool)

(assert (=> d!53943 m!252709))

(assert (=> b!160097 m!252633))

(assert (=> b!160097 m!252641))

(assert (=> b!160056 d!53943))

(declare-fun d!53945 () Bool)

(assert (=> d!53945 (= (byteRangesEq!0 (select (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602)) lt!252561 #b00000000000000000000000000000000 (currentBit!7158 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7158 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7158 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!252561) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7158 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13357 () Bool)

(assert (= bs!13357 d!53945))

(declare-fun m!252711 () Bool)

(assert (=> bs!13357 m!252711))

(declare-fun m!252713 () Bool)

(assert (=> bs!13357 m!252713))

(assert (=> b!160060 d!53945))

(declare-fun d!53947 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53947 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3456 (buf!3914 (_1!7758 lt!252558)))) ((_ sign_extend 32) (currentByte!7163 (_1!7758 lt!252558))) ((_ sign_extend 32) (currentBit!7158 (_1!7758 lt!252558)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3456 (buf!3914 (_1!7758 lt!252558)))) ((_ sign_extend 32) (currentByte!7163 (_1!7758 lt!252558))) ((_ sign_extend 32) (currentBit!7158 (_1!7758 lt!252558)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13358 () Bool)

(assert (= bs!13358 d!53947))

(declare-fun m!252715 () Bool)

(assert (=> bs!13358 m!252715))

(assert (=> b!160057 d!53947))

(declare-fun b!160145 () Bool)

(declare-fun e!109556 () Unit!10937)

(declare-fun Unit!10944 () Unit!10937)

(assert (=> b!160145 (= e!109556 Unit!10944)))

(declare-fun b!160146 () Bool)

(declare-fun lt!252710 () Unit!10937)

(assert (=> b!160146 (= e!109556 lt!252710)))

(declare-fun lt!252706 () (_ BitVec 64))

(assert (=> b!160146 (= lt!252706 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!252719 () (_ BitVec 64))

(assert (=> b!160146 (= lt!252719 (bitIndex!0 (size!3456 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) (currentBit!7158 thiss!1602)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!7637 array!7637 (_ BitVec 64) (_ BitVec 64)) Unit!10937)

(assert (=> b!160146 (= lt!252710 (arrayBitRangesEqSymmetric!0 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) lt!252706 lt!252719))))

(declare-fun arrayBitRangesEq!0 (array!7637 array!7637 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!160146 (arrayBitRangesEq!0 (buf!3914 (_3!524 lt!252549)) (buf!3914 thiss!1602) lt!252706 lt!252719)))

(declare-fun d!53949 () Bool)

(declare-fun e!109555 () Bool)

(assert (=> d!53949 e!109555))

(declare-fun res!133650 () Bool)

(assert (=> d!53949 (=> (not res!133650) (not e!109555))))

(declare-fun lt!252716 () tuple2!14466)

(assert (=> d!53949 (= res!133650 (isPrefixOf!0 (_1!7758 lt!252716) (_2!7758 lt!252716)))))

(declare-fun lt!252709 () BitStream!6080)

(assert (=> d!53949 (= lt!252716 (tuple2!14467 lt!252709 (_3!524 lt!252549)))))

(declare-fun lt!252703 () Unit!10937)

(declare-fun lt!252711 () Unit!10937)

(assert (=> d!53949 (= lt!252703 lt!252711)))

(assert (=> d!53949 (isPrefixOf!0 lt!252709 (_3!524 lt!252549))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6080 BitStream!6080 BitStream!6080) Unit!10937)

(assert (=> d!53949 (= lt!252711 (lemmaIsPrefixTransitive!0 lt!252709 (_3!524 lt!252549) (_3!524 lt!252549)))))

(declare-fun lt!252712 () Unit!10937)

(declare-fun lt!252717 () Unit!10937)

(assert (=> d!53949 (= lt!252712 lt!252717)))

(assert (=> d!53949 (isPrefixOf!0 lt!252709 (_3!524 lt!252549))))

(assert (=> d!53949 (= lt!252717 (lemmaIsPrefixTransitive!0 lt!252709 thiss!1602 (_3!524 lt!252549)))))

(declare-fun lt!252714 () Unit!10937)

(assert (=> d!53949 (= lt!252714 e!109556)))

(declare-fun c!8459 () Bool)

(assert (=> d!53949 (= c!8459 (not (= (size!3456 (buf!3914 thiss!1602)) #b00000000000000000000000000000000)))))

(declare-fun lt!252718 () Unit!10937)

(declare-fun lt!252708 () Unit!10937)

(assert (=> d!53949 (= lt!252718 lt!252708)))

(assert (=> d!53949 (isPrefixOf!0 (_3!524 lt!252549) (_3!524 lt!252549))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6080) Unit!10937)

(assert (=> d!53949 (= lt!252708 (lemmaIsPrefixRefl!0 (_3!524 lt!252549)))))

(declare-fun lt!252705 () Unit!10937)

(declare-fun lt!252700 () Unit!10937)

(assert (=> d!53949 (= lt!252705 lt!252700)))

(assert (=> d!53949 (= lt!252700 (lemmaIsPrefixRefl!0 (_3!524 lt!252549)))))

(declare-fun lt!252702 () Unit!10937)

(declare-fun lt!252715 () Unit!10937)

(assert (=> d!53949 (= lt!252702 lt!252715)))

(assert (=> d!53949 (isPrefixOf!0 lt!252709 lt!252709)))

(assert (=> d!53949 (= lt!252715 (lemmaIsPrefixRefl!0 lt!252709))))

(declare-fun lt!252707 () Unit!10937)

(declare-fun lt!252713 () Unit!10937)

(assert (=> d!53949 (= lt!252707 lt!252713)))

(assert (=> d!53949 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!53949 (= lt!252713 (lemmaIsPrefixRefl!0 thiss!1602))))

(assert (=> d!53949 (= lt!252709 (BitStream!6081 (buf!3914 (_3!524 lt!252549)) (currentByte!7163 thiss!1602) (currentBit!7158 thiss!1602)))))

(assert (=> d!53949 (isPrefixOf!0 thiss!1602 (_3!524 lt!252549))))

(assert (=> d!53949 (= (reader!0 thiss!1602 (_3!524 lt!252549)) lt!252716)))

(declare-fun b!160147 () Bool)

(declare-fun res!133651 () Bool)

(assert (=> b!160147 (=> (not res!133651) (not e!109555))))

(assert (=> b!160147 (= res!133651 (isPrefixOf!0 (_2!7758 lt!252716) (_3!524 lt!252549)))))

(declare-fun b!160148 () Bool)

(declare-fun res!133652 () Bool)

(assert (=> b!160148 (=> (not res!133652) (not e!109555))))

(assert (=> b!160148 (= res!133652 (isPrefixOf!0 (_1!7758 lt!252716) thiss!1602))))

(declare-fun b!160149 () Bool)

(declare-fun lt!252704 () (_ BitVec 64))

(declare-fun lt!252701 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6080 (_ BitVec 64)) BitStream!6080)

(assert (=> b!160149 (= e!109555 (= (_1!7758 lt!252716) (withMovedBitIndex!0 (_2!7758 lt!252716) (bvsub lt!252704 lt!252701))))))

(assert (=> b!160149 (or (= (bvand lt!252704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252704 lt!252701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!160149 (= lt!252701 (bitIndex!0 (size!3456 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)) (currentBit!7158 (_3!524 lt!252549))))))

(assert (=> b!160149 (= lt!252704 (bitIndex!0 (size!3456 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) (currentBit!7158 thiss!1602)))))

(assert (= (and d!53949 c!8459) b!160146))

(assert (= (and d!53949 (not c!8459)) b!160145))

(assert (= (and d!53949 res!133650) b!160148))

(assert (= (and b!160148 res!133652) b!160147))

(assert (= (and b!160147 res!133651) b!160149))

(assert (=> d!53949 m!252631))

(declare-fun m!252771 () Bool)

(assert (=> d!53949 m!252771))

(declare-fun m!252773 () Bool)

(assert (=> d!53949 m!252773))

(declare-fun m!252775 () Bool)

(assert (=> d!53949 m!252775))

(declare-fun m!252777 () Bool)

(assert (=> d!53949 m!252777))

(declare-fun m!252779 () Bool)

(assert (=> d!53949 m!252779))

(declare-fun m!252781 () Bool)

(assert (=> d!53949 m!252781))

(declare-fun m!252783 () Bool)

(assert (=> d!53949 m!252783))

(declare-fun m!252785 () Bool)

(assert (=> d!53949 m!252785))

(declare-fun m!252787 () Bool)

(assert (=> d!53949 m!252787))

(declare-fun m!252789 () Bool)

(assert (=> d!53949 m!252789))

(declare-fun m!252791 () Bool)

(assert (=> b!160149 m!252791))

(assert (=> b!160149 m!252627))

(assert (=> b!160149 m!252629))

(declare-fun m!252793 () Bool)

(assert (=> b!160148 m!252793))

(assert (=> b!160146 m!252629))

(declare-fun m!252795 () Bool)

(assert (=> b!160146 m!252795))

(declare-fun m!252797 () Bool)

(assert (=> b!160146 m!252797))

(declare-fun m!252799 () Bool)

(assert (=> b!160147 m!252799))

(assert (=> b!160057 d!53949))

(declare-fun d!53971 () Bool)

(declare-fun res!133655 () Bool)

(declare-fun e!109559 () Bool)

(assert (=> d!53971 (=> res!133655 e!109559)))

(assert (=> d!53971 (= res!133655 (= #b00000000000000000000000000000000 (currentByte!7163 (_3!524 lt!252549))))))

(assert (=> d!53971 (= (arrayRangesEq!507 lt!252562 (array!7638 (store (store (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) lt!252552) (currentByte!7163 thiss!1602) lt!252561) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7163 (_3!524 lt!252549))) e!109559)))

(declare-fun b!160152 () Bool)

(declare-fun e!109560 () Bool)

(assert (=> b!160152 (= e!109559 e!109560)))

(declare-fun res!133656 () Bool)

(assert (=> b!160152 (=> (not res!133656) (not e!109560))))

(assert (=> b!160152 (= res!133656 (= (select (arr!4377 lt!252562) #b00000000000000000000000000000000) (select (arr!4377 (array!7638 (store (store (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) lt!252552) (currentByte!7163 thiss!1602) lt!252561) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!160153 () Bool)

(assert (=> b!160153 (= e!109560 (arrayRangesEq!507 lt!252562 (array!7638 (store (store (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) lt!252552) (currentByte!7163 thiss!1602) lt!252561) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7163 (_3!524 lt!252549))))))

(assert (= (and d!53971 (not res!133655)) b!160152))

(assert (= (and b!160152 res!133656) b!160153))

(assert (=> b!160152 m!252701))

(declare-fun m!252801 () Bool)

(assert (=> b!160152 m!252801))

(declare-fun m!252803 () Bool)

(assert (=> b!160153 m!252803))

(assert (=> b!160058 d!53971))

(declare-fun d!53973 () Bool)

(declare-fun e!109563 () Bool)

(assert (=> d!53973 e!109563))

(declare-fun res!133661 () Bool)

(assert (=> d!53973 (=> (not res!133661) (not e!109563))))

(assert (=> d!53973 (= res!133661 (and (bvsge (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000000) (bvslt (currentByte!7163 (_3!524 lt!252549)) (size!3456 (buf!3914 thiss!1602)))))))

(declare-fun lt!252720 () Unit!10937)

(assert (=> d!53973 (= lt!252720 (choose!147 (buf!3914 thiss!1602) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))))))

(assert (=> d!53973 (and (bvsle #b00000000000000000000000000000000 (currentByte!7163 (_3!524 lt!252549))) (bvslt (currentByte!7163 (_3!524 lt!252549)) (size!3456 (buf!3914 thiss!1602))))))

(assert (=> d!53973 (= (arrayUpdatedAtPrefixLemma!115 (buf!3914 thiss!1602) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) lt!252720)))

(declare-fun b!160158 () Bool)

(assert (=> b!160158 (= e!109563 (arrayRangesEq!507 (buf!3914 thiss!1602) (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7163 (_3!524 lt!252549))))))

(assert (= (and d!53973 res!133661) b!160158))

(assert (=> d!53973 m!252595))

(declare-fun m!252805 () Bool)

(assert (=> d!53973 m!252805))

(assert (=> b!160158 m!252619))

(declare-fun m!252807 () Bool)

(assert (=> b!160158 m!252807))

(assert (=> b!160058 d!53973))

(declare-fun d!53975 () Bool)

(assert (=> d!53975 (arrayRangesEq!507 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001))))

(declare-fun lt!252723 () Unit!10937)

(declare-fun choose!148 (array!7637 array!7637 array!7637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10937)

(assert (=> d!53975 (= lt!252723 (choose!148 (buf!3914 thiss!1602) lt!252562 (buf!3914 (_3!524 lt!252549)) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) (currentByte!7163 (_3!524 lt!252549))))))

(assert (=> d!53975 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) (currentByte!7163 (_3!524 lt!252549))))))

(assert (=> d!53975 (= (arrayRangesEqTransitive!141 (buf!3914 thiss!1602) lt!252562 (buf!3914 (_3!524 lt!252549)) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001) (currentByte!7163 (_3!524 lt!252549))) lt!252723)))

(declare-fun bs!13362 () Bool)

(assert (= bs!13362 d!53975))

(assert (=> bs!13362 m!252593))

(declare-fun m!252815 () Bool)

(assert (=> bs!13362 m!252815))

(assert (=> b!160058 d!53975))

(declare-fun d!53981 () Bool)

(declare-fun e!109568 () Bool)

(assert (=> d!53981 e!109568))

(declare-fun res!133667 () Bool)

(assert (=> d!53981 (=> (not res!133667) (not e!109568))))

(assert (=> d!53981 (= res!133667 (and (bvsge (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000000) (bvslt (currentByte!7163 (_3!524 lt!252549)) (size!3456 lt!252562))))))

(declare-fun lt!252724 () Unit!10937)

(assert (=> d!53981 (= lt!252724 (choose!147 lt!252562 (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))))))

(assert (=> d!53981 (and (bvsle #b00000000000000000000000000000000 (currentByte!7163 (_3!524 lt!252549))) (bvslt (currentByte!7163 (_3!524 lt!252549)) (size!3456 lt!252562)))))

(assert (=> d!53981 (= (arrayUpdatedAtPrefixLemma!115 lt!252562 (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) lt!252724)))

(declare-fun b!160164 () Bool)

(assert (=> b!160164 (= e!109568 (arrayRangesEq!507 lt!252562 (array!7638 (store (arr!4377 lt!252562) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 lt!252562)) #b00000000000000000000000000000000 (currentByte!7163 (_3!524 lt!252549))))))

(assert (= (and d!53981 res!133667) b!160164))

(assert (=> d!53981 m!252595))

(declare-fun m!252817 () Bool)

(assert (=> d!53981 m!252817))

(declare-fun m!252819 () Bool)

(assert (=> b!160164 m!252819))

(declare-fun m!252821 () Bool)

(assert (=> b!160164 m!252821))

(assert (=> b!160058 d!53981))

(declare-fun d!53983 () Bool)

(declare-fun res!133668 () Bool)

(declare-fun e!109569 () Bool)

(assert (=> d!53983 (=> res!133668 e!109569)))

(assert (=> d!53983 (= res!133668 (= #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(assert (=> d!53983 (= (arrayRangesEq!507 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) #b00000000000000000000000000000000 (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)) e!109569)))

(declare-fun b!160165 () Bool)

(declare-fun e!109570 () Bool)

(assert (=> b!160165 (= e!109569 e!109570)))

(declare-fun res!133669 () Bool)

(assert (=> b!160165 (=> (not res!133669) (not e!109570))))

(assert (=> b!160165 (= res!133669 (= (select (arr!4377 (buf!3914 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) #b00000000000000000000000000000000)))))

(declare-fun b!160166 () Bool)

(assert (=> b!160166 (= e!109570 (arrayRangesEq!507 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7163 (_3!524 lt!252549)) #b00000000000000000000000000000001)))))

(assert (= (and d!53983 (not res!133668)) b!160165))

(assert (= (and b!160165 res!133669) b!160166))

(assert (=> b!160165 m!252695))

(assert (=> b!160165 m!252697))

(declare-fun m!252823 () Bool)

(assert (=> b!160166 m!252823))

(assert (=> b!160058 d!53983))

(declare-fun d!53985 () Bool)

(declare-fun e!109581 () Bool)

(assert (=> d!53985 e!109581))

(declare-fun res!133682 () Bool)

(assert (=> d!53985 (=> (not res!133682) (not e!109581))))

(declare-fun lt!252745 () (_ BitVec 64))

(declare-fun lt!252747 () (_ BitVec 64))

(declare-fun lt!252746 () (_ BitVec 64))

(assert (=> d!53985 (= res!133682 (= lt!252747 (bvsub lt!252746 lt!252745)))))

(assert (=> d!53985 (or (= (bvand lt!252746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252746 lt!252745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53985 (= lt!252745 (remainingBits!0 ((_ sign_extend 32) (size!3456 (buf!3914 (_3!524 lt!252549)))) ((_ sign_extend 32) (currentByte!7163 (_3!524 lt!252549))) ((_ sign_extend 32) (currentBit!7158 (_3!524 lt!252549)))))))

(declare-fun lt!252749 () (_ BitVec 64))

(declare-fun lt!252748 () (_ BitVec 64))

(assert (=> d!53985 (= lt!252746 (bvmul lt!252749 lt!252748))))

(assert (=> d!53985 (or (= lt!252749 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!252748 (bvsdiv (bvmul lt!252749 lt!252748) lt!252749)))))

(assert (=> d!53985 (= lt!252748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!53985 (= lt!252749 ((_ sign_extend 32) (size!3456 (buf!3914 (_3!524 lt!252549)))))))

(assert (=> d!53985 (= lt!252747 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7163 (_3!524 lt!252549))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7158 (_3!524 lt!252549)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53985 (invariant!0 (currentBit!7158 (_3!524 lt!252549)) (currentByte!7163 (_3!524 lt!252549)) (size!3456 (buf!3914 (_3!524 lt!252549))))))

(assert (=> d!53985 (= (bitIndex!0 (size!3456 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)) (currentBit!7158 (_3!524 lt!252549))) lt!252747)))

(declare-fun b!160179 () Bool)

(declare-fun res!133683 () Bool)

(assert (=> b!160179 (=> (not res!133683) (not e!109581))))

(assert (=> b!160179 (= res!133683 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!252747))))

(declare-fun b!160180 () Bool)

(declare-fun lt!252744 () (_ BitVec 64))

(assert (=> b!160180 (= e!109581 (bvsle lt!252747 (bvmul lt!252744 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!160180 (or (= lt!252744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!252744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!252744)))))

(assert (=> b!160180 (= lt!252744 ((_ sign_extend 32) (size!3456 (buf!3914 (_3!524 lt!252549)))))))

(assert (= (and d!53985 res!133682) b!160179))

(assert (= (and b!160179 res!133683) b!160180))

(declare-fun m!252847 () Bool)

(assert (=> d!53985 m!252847))

(declare-fun m!252849 () Bool)

(assert (=> d!53985 m!252849))

(assert (=> b!160053 d!53985))

(declare-fun d!54001 () Bool)

(declare-fun e!109582 () Bool)

(assert (=> d!54001 e!109582))

(declare-fun res!133684 () Bool)

(assert (=> d!54001 (=> (not res!133684) (not e!109582))))

(declare-fun lt!252753 () (_ BitVec 64))

(declare-fun lt!252752 () (_ BitVec 64))

(declare-fun lt!252751 () (_ BitVec 64))

(assert (=> d!54001 (= res!133684 (= lt!252753 (bvsub lt!252752 lt!252751)))))

(assert (=> d!54001 (or (= (bvand lt!252752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252751 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252752 lt!252751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54001 (= lt!252751 (remainingBits!0 ((_ sign_extend 32) (size!3456 (buf!3914 thiss!1602))) ((_ sign_extend 32) (currentByte!7163 thiss!1602)) ((_ sign_extend 32) (currentBit!7158 thiss!1602))))))

(declare-fun lt!252755 () (_ BitVec 64))

(declare-fun lt!252754 () (_ BitVec 64))

(assert (=> d!54001 (= lt!252752 (bvmul lt!252755 lt!252754))))

(assert (=> d!54001 (or (= lt!252755 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!252754 (bvsdiv (bvmul lt!252755 lt!252754) lt!252755)))))

(assert (=> d!54001 (= lt!252754 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!54001 (= lt!252755 ((_ sign_extend 32) (size!3456 (buf!3914 thiss!1602))))))

(assert (=> d!54001 (= lt!252753 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7163 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7158 thiss!1602))))))

(assert (=> d!54001 (invariant!0 (currentBit!7158 thiss!1602) (currentByte!7163 thiss!1602) (size!3456 (buf!3914 thiss!1602)))))

(assert (=> d!54001 (= (bitIndex!0 (size!3456 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) (currentBit!7158 thiss!1602)) lt!252753)))

(declare-fun b!160181 () Bool)

(declare-fun res!133685 () Bool)

(assert (=> b!160181 (=> (not res!133685) (not e!109582))))

(assert (=> b!160181 (= res!133685 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!252753))))

(declare-fun b!160182 () Bool)

(declare-fun lt!252750 () (_ BitVec 64))

(assert (=> b!160182 (= e!109582 (bvsle lt!252753 (bvmul lt!252750 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!160182 (or (= lt!252750 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!252750 #b0000000000000000000000000000000000000000000000000000000000001000) lt!252750)))))

(assert (=> b!160182 (= lt!252750 ((_ sign_extend 32) (size!3456 (buf!3914 thiss!1602))))))

(assert (= (and d!54001 res!133684) b!160181))

(assert (= (and b!160181 res!133685) b!160182))

(declare-fun m!252851 () Bool)

(assert (=> d!54001 m!252851))

(declare-fun m!252853 () Bool)

(assert (=> d!54001 m!252853))

(assert (=> b!160053 d!54001))

(declare-fun d!54003 () Bool)

(declare-fun res!133692 () Bool)

(declare-fun e!109588 () Bool)

(assert (=> d!54003 (=> (not res!133692) (not e!109588))))

(assert (=> d!54003 (= res!133692 (= (size!3456 (buf!3914 thiss!1602)) (size!3456 (buf!3914 (_3!524 lt!252549)))))))

(assert (=> d!54003 (= (isPrefixOf!0 thiss!1602 (_3!524 lt!252549)) e!109588)))

(declare-fun b!160189 () Bool)

(declare-fun res!133693 () Bool)

(assert (=> b!160189 (=> (not res!133693) (not e!109588))))

(assert (=> b!160189 (= res!133693 (bvsle (bitIndex!0 (size!3456 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) (currentBit!7158 thiss!1602)) (bitIndex!0 (size!3456 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)) (currentBit!7158 (_3!524 lt!252549)))))))

(declare-fun b!160190 () Bool)

(declare-fun e!109587 () Bool)

(assert (=> b!160190 (= e!109588 e!109587)))

(declare-fun res!133694 () Bool)

(assert (=> b!160190 (=> res!133694 e!109587)))

(assert (=> b!160190 (= res!133694 (= (size!3456 (buf!3914 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!160191 () Bool)

(assert (=> b!160191 (= e!109587 (arrayBitRangesEq!0 (buf!3914 thiss!1602) (buf!3914 (_3!524 lt!252549)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3456 (buf!3914 thiss!1602)) (currentByte!7163 thiss!1602) (currentBit!7158 thiss!1602))))))

(assert (= (and d!54003 res!133692) b!160189))

(assert (= (and b!160189 res!133693) b!160190))

(assert (= (and b!160190 (not res!133694)) b!160191))

(assert (=> b!160189 m!252629))

(assert (=> b!160189 m!252627))

(assert (=> b!160191 m!252629))

(assert (=> b!160191 m!252629))

(declare-fun m!252855 () Bool)

(assert (=> b!160191 m!252855))

(assert (=> b!160054 d!54003))

(declare-fun d!54005 () Bool)

(declare-fun res!133695 () Bool)

(declare-fun e!109589 () Bool)

(assert (=> d!54005 (=> res!133695 e!109589)))

(assert (=> d!54005 (= res!133695 (= #b00000000000000000000000000000000 (ite c!8453 (currentByte!7163 (_3!524 lt!252549)) (currentByte!7163 thiss!1602))))))

(assert (=> d!54005 (= (arrayRangesEq!507 (buf!3914 thiss!1602) (ite c!8453 (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602))) (buf!3914 (_3!524 lt!252549))) #b00000000000000000000000000000000 (ite c!8453 (currentByte!7163 (_3!524 lt!252549)) (currentByte!7163 thiss!1602))) e!109589)))

(declare-fun b!160192 () Bool)

(declare-fun e!109590 () Bool)

(assert (=> b!160192 (= e!109589 e!109590)))

(declare-fun res!133696 () Bool)

(assert (=> b!160192 (=> (not res!133696) (not e!109590))))

(assert (=> b!160192 (= res!133696 (= (select (arr!4377 (buf!3914 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4377 (ite c!8453 (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602))) (buf!3914 (_3!524 lt!252549)))) #b00000000000000000000000000000000)))))

(declare-fun b!160193 () Bool)

(assert (=> b!160193 (= e!109590 (arrayRangesEq!507 (buf!3914 thiss!1602) (ite c!8453 (array!7638 (store (arr!4377 (buf!3914 thiss!1602)) (currentByte!7163 (_3!524 lt!252549)) (select (arr!4377 (buf!3914 (_3!524 lt!252549))) (currentByte!7163 (_3!524 lt!252549)))) (size!3456 (buf!3914 thiss!1602))) (buf!3914 (_3!524 lt!252549))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8453 (currentByte!7163 (_3!524 lt!252549)) (currentByte!7163 thiss!1602))))))

(assert (= (and d!54005 (not res!133695)) b!160192))

(assert (= (and b!160192 res!133696) b!160193))

(assert (=> b!160192 m!252695))

(declare-fun m!252857 () Bool)

(assert (=> b!160192 m!252857))

(declare-fun m!252859 () Bool)

(assert (=> b!160193 m!252859))

(assert (=> bm!2720 d!54005))

(declare-fun d!54007 () Bool)

(assert (=> d!54007 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3456 (buf!3914 thiss!1602))) ((_ sign_extend 32) (currentByte!7163 thiss!1602)) ((_ sign_extend 32) (currentBit!7158 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3456 (buf!3914 thiss!1602))) ((_ sign_extend 32) (currentByte!7163 thiss!1602)) ((_ sign_extend 32) (currentBit!7158 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13365 () Bool)

(assert (= bs!13365 d!54007))

(assert (=> bs!13365 m!252851))

(assert (=> start!32462 d!54007))

(declare-fun d!54009 () Bool)

(assert (=> d!54009 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7158 thiss!1602) (currentByte!7163 thiss!1602) (size!3456 (buf!3914 thiss!1602))))))

(declare-fun bs!13366 () Bool)

(assert (= bs!13366 d!54009))

(assert (=> bs!13366 m!252853))

(assert (=> start!32462 d!54009))

(push 1)

(assert (not b!160148))

(assert (not d!54001))

(assert (not b!160146))

(assert (not b!160092))

(assert (not b!160149))

(assert (not b!160164))

(assert (not d!53975))

(assert (not b!160153))

(assert (not b!160189))

(assert (not b!160090))

(assert (not d!54007))

(assert (not d!53985))

(assert (not d!53949))

(assert (not d!53981))

(assert (not b!160166))

(assert (not b!160158))

(assert (not b!160147))

(assert (not b!160193))

(assert (not b!160191))

(assert (not d!53947))

(assert (not d!53943))

(assert (not d!54009))

(assert (not b!160097))

(assert (not d!53973))

(assert (not b!160094))

(check-sat)

(pop 1)

(push 1)

(check-sat)

