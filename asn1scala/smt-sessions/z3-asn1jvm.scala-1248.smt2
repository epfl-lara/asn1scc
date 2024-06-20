; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35322 () Bool)

(assert start!35322)

(declare-fun b!165358 () Bool)

(declare-fun res!137716 () Bool)

(declare-fun e!114438 () Bool)

(assert (=> b!165358 (=> (not res!137716) (not e!114438))))

(declare-datatypes ((array!8417 0))(
  ( (array!8418 (arr!4679 (Array (_ BitVec 32) (_ BitVec 8))) (size!3758 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6672 0))(
  ( (BitStream!6673 (buf!4210 array!8417) (currentByte!7886 (_ BitVec 32)) (currentBit!7881 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6672)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165358 (= res!137716 (validate_offset_bits!1 ((_ sign_extend 32) (size!3758 (buf!4210 thiss!1577))) ((_ sign_extend 32) (currentByte!7886 thiss!1577)) ((_ sign_extend 32) (currentBit!7881 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165359 () Bool)

(declare-fun e!114439 () Bool)

(declare-fun lt!258630 () (_ BitVec 64))

(declare-fun lt!258625 () (_ BitVec 64))

(assert (=> b!165359 (= e!114439 (or (not (= lt!258625 (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!258625 (bvand (bvadd lt!258630 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!165359 (= lt!258625 (bvand lt!258630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165359 (= lt!258630 (bitIndex!0 (size!3758 (buf!4210 thiss!1577)) (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)))))

(declare-fun res!137720 () Bool)

(assert (=> start!35322 (=> (not res!137720) (not e!114438))))

(assert (=> start!35322 (= res!137720 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35322 e!114438))

(assert (=> start!35322 true))

(declare-fun e!114441 () Bool)

(declare-fun inv!12 (BitStream!6672) Bool)

(assert (=> start!35322 (and (inv!12 thiss!1577) e!114441)))

(declare-fun b!165360 () Bool)

(assert (=> b!165360 (= e!114438 (not e!114439))))

(declare-fun res!137718 () Bool)

(assert (=> b!165360 (=> res!137718 e!114439)))

(declare-fun lt!258628 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165360 (= res!137718 (not (byteRangesEq!0 (select (arr!4679 (buf!4210 thiss!1577)) (currentByte!7886 thiss!1577)) lt!258628 #b00000000000000000000000000000000 (currentBit!7881 thiss!1577))))))

(declare-fun lt!258626 () array!8417)

(declare-fun arrayRangesEq!638 (array!8417 array!8417 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165360 (arrayRangesEq!638 (buf!4210 thiss!1577) lt!258626 #b00000000000000000000000000000000 (currentByte!7886 thiss!1577))))

(declare-datatypes ((Unit!11488 0))(
  ( (Unit!11489) )
))
(declare-fun lt!258627 () Unit!11488)

(declare-fun arrayUpdatedAtPrefixLemma!246 (array!8417 (_ BitVec 32) (_ BitVec 8)) Unit!11488)

(assert (=> b!165360 (= lt!258627 (arrayUpdatedAtPrefixLemma!246 (buf!4210 thiss!1577) (currentByte!7886 thiss!1577) lt!258628))))

(assert (=> b!165360 (= lt!258626 (array!8418 (store (arr!4679 (buf!4210 thiss!1577)) (currentByte!7886 thiss!1577) lt!258628) (size!3758 (buf!4210 thiss!1577))))))

(declare-fun lt!258629 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165360 (= lt!258628 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4679 (buf!4210 thiss!1577)) (currentByte!7886 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7881 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258629)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258629))))))

(assert (=> b!165360 (= lt!258629 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7881 thiss!1577) nBits!511)))))

(declare-fun b!165361 () Bool)

(declare-fun res!137719 () Bool)

(assert (=> b!165361 (=> res!137719 e!114439)))

(declare-datatypes ((tuple2!14554 0))(
  ( (tuple2!14555 (_1!7868 Unit!11488) (_2!7868 BitStream!6672)) )
))
(declare-fun moveBitIndex!0 (BitStream!6672 (_ BitVec 64)) tuple2!14554)

(assert (=> b!165361 (= res!137719 (not (= (size!3758 (buf!4210 thiss!1577)) (size!3758 (buf!4210 (_2!7868 (moveBitIndex!0 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)) ((_ sign_extend 32) nBits!511))))))))))

(declare-fun b!165362 () Bool)

(declare-fun res!137717 () Bool)

(assert (=> b!165362 (=> (not res!137717) (not e!114438))))

(assert (=> b!165362 (= res!137717 (bvsle (bvadd (currentBit!7881 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!165363 () Bool)

(declare-fun array_inv!3499 (array!8417) Bool)

(assert (=> b!165363 (= e!114441 (array_inv!3499 (buf!4210 thiss!1577)))))

(assert (= (and start!35322 res!137720) b!165358))

(assert (= (and b!165358 res!137716) b!165362))

(assert (= (and b!165362 res!137717) b!165360))

(assert (= (and b!165360 (not res!137718)) b!165361))

(assert (= (and b!165361 (not res!137719)) b!165359))

(assert (= start!35322 b!165363))

(declare-fun m!262809 () Bool)

(assert (=> b!165359 m!262809))

(declare-fun m!262811 () Bool)

(assert (=> b!165361 m!262811))

(declare-fun m!262813 () Bool)

(assert (=> b!165358 m!262813))

(declare-fun m!262815 () Bool)

(assert (=> b!165360 m!262815))

(declare-fun m!262817 () Bool)

(assert (=> b!165360 m!262817))

(assert (=> b!165360 m!262815))

(declare-fun m!262819 () Bool)

(assert (=> b!165360 m!262819))

(declare-fun m!262821 () Bool)

(assert (=> b!165360 m!262821))

(declare-fun m!262823 () Bool)

(assert (=> b!165360 m!262823))

(declare-fun m!262825 () Bool)

(assert (=> b!165360 m!262825))

(declare-fun m!262827 () Bool)

(assert (=> b!165360 m!262827))

(declare-fun m!262829 () Bool)

(assert (=> b!165360 m!262829))

(declare-fun m!262831 () Bool)

(assert (=> start!35322 m!262831))

(declare-fun m!262833 () Bool)

(assert (=> b!165363 m!262833))

(check-sat (not b!165360) (not b!165361) (not b!165359) (not start!35322) (not b!165358) (not b!165363))
(check-sat)
(get-model)

(declare-fun d!57279 () Bool)

(assert (=> d!57279 (= (byteRangesEq!0 (select (arr!4679 (buf!4210 thiss!1577)) (currentByte!7886 thiss!1577)) lt!258628 #b00000000000000000000000000000000 (currentBit!7881 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7881 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4679 (buf!4210 thiss!1577)) (currentByte!7886 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7881 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258628) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7881 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14233 () Bool)

(assert (= bs!14233 d!57279))

(declare-fun m!262861 () Bool)

(assert (=> bs!14233 m!262861))

(declare-fun m!262863 () Bool)

(assert (=> bs!14233 m!262863))

(assert (=> b!165360 d!57279))

(declare-fun d!57281 () Bool)

(declare-fun res!137740 () Bool)

(declare-fun e!114458 () Bool)

(assert (=> d!57281 (=> res!137740 e!114458)))

(assert (=> d!57281 (= res!137740 (= #b00000000000000000000000000000000 (currentByte!7886 thiss!1577)))))

(assert (=> d!57281 (= (arrayRangesEq!638 (buf!4210 thiss!1577) lt!258626 #b00000000000000000000000000000000 (currentByte!7886 thiss!1577)) e!114458)))

(declare-fun b!165386 () Bool)

(declare-fun e!114459 () Bool)

(assert (=> b!165386 (= e!114458 e!114459)))

(declare-fun res!137741 () Bool)

(assert (=> b!165386 (=> (not res!137741) (not e!114459))))

(assert (=> b!165386 (= res!137741 (= (select (arr!4679 (buf!4210 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4679 lt!258626) #b00000000000000000000000000000000)))))

(declare-fun b!165387 () Bool)

(assert (=> b!165387 (= e!114459 (arrayRangesEq!638 (buf!4210 thiss!1577) lt!258626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7886 thiss!1577)))))

(assert (= (and d!57281 (not res!137740)) b!165386))

(assert (= (and b!165386 res!137741) b!165387))

(declare-fun m!262865 () Bool)

(assert (=> b!165386 m!262865))

(declare-fun m!262867 () Bool)

(assert (=> b!165386 m!262867))

(declare-fun m!262869 () Bool)

(assert (=> b!165387 m!262869))

(assert (=> b!165360 d!57281))

(declare-fun d!57283 () Bool)

(declare-fun e!114462 () Bool)

(assert (=> d!57283 e!114462))

(declare-fun res!137744 () Bool)

(assert (=> d!57283 (=> (not res!137744) (not e!114462))))

(assert (=> d!57283 (= res!137744 (and (bvsge (currentByte!7886 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7886 thiss!1577) (size!3758 (buf!4210 thiss!1577)))))))

(declare-fun lt!258651 () Unit!11488)

(declare-fun choose!220 (array!8417 (_ BitVec 32) (_ BitVec 8)) Unit!11488)

(assert (=> d!57283 (= lt!258651 (choose!220 (buf!4210 thiss!1577) (currentByte!7886 thiss!1577) lt!258628))))

(assert (=> d!57283 (and (bvsle #b00000000000000000000000000000000 (currentByte!7886 thiss!1577)) (bvslt (currentByte!7886 thiss!1577) (size!3758 (buf!4210 thiss!1577))))))

(assert (=> d!57283 (= (arrayUpdatedAtPrefixLemma!246 (buf!4210 thiss!1577) (currentByte!7886 thiss!1577) lt!258628) lt!258651)))

(declare-fun b!165390 () Bool)

(assert (=> b!165390 (= e!114462 (arrayRangesEq!638 (buf!4210 thiss!1577) (array!8418 (store (arr!4679 (buf!4210 thiss!1577)) (currentByte!7886 thiss!1577) lt!258628) (size!3758 (buf!4210 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7886 thiss!1577)))))

(assert (= (and d!57283 res!137744) b!165390))

(declare-fun m!262871 () Bool)

(assert (=> d!57283 m!262871))

(assert (=> b!165390 m!262817))

(declare-fun m!262873 () Bool)

(assert (=> b!165390 m!262873))

(assert (=> b!165360 d!57283))

(declare-fun d!57285 () Bool)

(declare-fun lt!258669 () (_ BitVec 32))

(assert (=> d!57285 (= lt!258669 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!258666 () (_ BitVec 32))

(assert (=> d!57285 (= lt!258666 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114467 () Bool)

(assert (=> d!57285 e!114467))

(declare-fun res!137749 () Bool)

(assert (=> d!57285 (=> (not res!137749) (not e!114467))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6672 (_ BitVec 64)) Bool)

(assert (=> d!57285 (= res!137749 (moveBitIndexPrecond!0 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11492 () Unit!11488)

(declare-fun Unit!11493 () Unit!11488)

(declare-fun Unit!11494 () Unit!11488)

(assert (=> d!57285 (= (moveBitIndex!0 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258669) #b00000000000000000000000000000000) (tuple2!14555 Unit!11492 (BitStream!6673 (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) (bvsub (bvadd (currentByte!7886 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258666) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!258669 (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258669) #b00000000000000000000000000001000) (tuple2!14555 Unit!11493 (BitStream!6673 (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) (bvadd (currentByte!7886 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258666 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258669) #b00000000000000000000000000001000))) (tuple2!14555 Unit!11494 (BitStream!6673 (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) (bvadd (currentByte!7886 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258666) (bvadd (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258669))))))))

(declare-fun b!165395 () Bool)

(declare-fun e!114468 () Bool)

(assert (=> b!165395 (= e!114467 e!114468)))

(declare-fun res!137750 () Bool)

(assert (=> b!165395 (=> (not res!137750) (not e!114468))))

(declare-fun lt!258664 () (_ BitVec 64))

(declare-fun lt!258665 () tuple2!14554)

(assert (=> b!165395 (= res!137750 (= (bvadd lt!258664 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3758 (buf!4210 (_2!7868 lt!258665))) (currentByte!7886 (_2!7868 lt!258665)) (currentBit!7881 (_2!7868 lt!258665)))))))

(assert (=> b!165395 (or (not (= (bvand lt!258664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!258664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!258664 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165395 (= lt!258664 (bitIndex!0 (size!3758 (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)))) (currentByte!7886 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)))))))

(declare-fun lt!258668 () (_ BitVec 32))

(declare-fun lt!258667 () (_ BitVec 32))

(declare-fun Unit!11495 () Unit!11488)

(declare-fun Unit!11496 () Unit!11488)

(declare-fun Unit!11497 () Unit!11488)

(assert (=> b!165395 (= lt!258665 (ite (bvslt (bvadd (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258667) #b00000000000000000000000000000000) (tuple2!14555 Unit!11495 (BitStream!6673 (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) (bvsub (bvadd (currentByte!7886 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258668) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!258667 (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258667) #b00000000000000000000000000001000) (tuple2!14555 Unit!11496 (BitStream!6673 (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) (bvadd (currentByte!7886 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258668 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258667) #b00000000000000000000000000001000))) (tuple2!14555 Unit!11497 (BitStream!6673 (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) (bvadd (currentByte!7886 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258668) (bvadd (currentBit!7881 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) lt!258667))))))))

(assert (=> b!165395 (= lt!258667 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165395 (= lt!258668 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!165396 () Bool)

(assert (=> b!165396 (= e!114468 (and (= (size!3758 (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)))) (size!3758 (buf!4210 (_2!7868 lt!258665)))) (= (buf!4210 (BitStream!6673 lt!258626 (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577))) (buf!4210 (_2!7868 lt!258665)))))))

(assert (= (and d!57285 res!137749) b!165395))

(assert (= (and b!165395 res!137750) b!165396))

(declare-fun m!262875 () Bool)

(assert (=> d!57285 m!262875))

(declare-fun m!262877 () Bool)

(assert (=> b!165395 m!262877))

(declare-fun m!262879 () Bool)

(assert (=> b!165395 m!262879))

(assert (=> b!165361 d!57285))

(declare-fun d!57293 () Bool)

(assert (=> d!57293 (= (array_inv!3499 (buf!4210 thiss!1577)) (bvsge (size!3758 (buf!4210 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165363 d!57293))

(declare-fun d!57295 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57295 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3758 (buf!4210 thiss!1577))) ((_ sign_extend 32) (currentByte!7886 thiss!1577)) ((_ sign_extend 32) (currentBit!7881 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3758 (buf!4210 thiss!1577))) ((_ sign_extend 32) (currentByte!7886 thiss!1577)) ((_ sign_extend 32) (currentBit!7881 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14234 () Bool)

(assert (= bs!14234 d!57295))

(declare-fun m!262881 () Bool)

(assert (=> bs!14234 m!262881))

(assert (=> b!165358 d!57295))

(declare-fun d!57299 () Bool)

(declare-fun e!114477 () Bool)

(assert (=> d!57299 e!114477))

(declare-fun res!137762 () Bool)

(assert (=> d!57299 (=> (not res!137762) (not e!114477))))

(declare-fun lt!258687 () (_ BitVec 64))

(declare-fun lt!258686 () (_ BitVec 64))

(declare-fun lt!258682 () (_ BitVec 64))

(assert (=> d!57299 (= res!137762 (= lt!258687 (bvsub lt!258686 lt!258682)))))

(assert (=> d!57299 (or (= (bvand lt!258686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258686 lt!258682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57299 (= lt!258682 (remainingBits!0 ((_ sign_extend 32) (size!3758 (buf!4210 thiss!1577))) ((_ sign_extend 32) (currentByte!7886 thiss!1577)) ((_ sign_extend 32) (currentBit!7881 thiss!1577))))))

(declare-fun lt!258684 () (_ BitVec 64))

(declare-fun lt!258683 () (_ BitVec 64))

(assert (=> d!57299 (= lt!258686 (bvmul lt!258684 lt!258683))))

(assert (=> d!57299 (or (= lt!258684 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258683 (bvsdiv (bvmul lt!258684 lt!258683) lt!258684)))))

(assert (=> d!57299 (= lt!258683 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57299 (= lt!258684 ((_ sign_extend 32) (size!3758 (buf!4210 thiss!1577))))))

(assert (=> d!57299 (= lt!258687 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7886 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7881 thiss!1577))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57299 (invariant!0 (currentBit!7881 thiss!1577) (currentByte!7886 thiss!1577) (size!3758 (buf!4210 thiss!1577)))))

(assert (=> d!57299 (= (bitIndex!0 (size!3758 (buf!4210 thiss!1577)) (currentByte!7886 thiss!1577) (currentBit!7881 thiss!1577)) lt!258687)))

(declare-fun b!165407 () Bool)

(declare-fun res!137761 () Bool)

(assert (=> b!165407 (=> (not res!137761) (not e!114477))))

(assert (=> b!165407 (= res!137761 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258687))))

(declare-fun b!165408 () Bool)

(declare-fun lt!258685 () (_ BitVec 64))

(assert (=> b!165408 (= e!114477 (bvsle lt!258687 (bvmul lt!258685 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165408 (or (= lt!258685 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258685 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258685)))))

(assert (=> b!165408 (= lt!258685 ((_ sign_extend 32) (size!3758 (buf!4210 thiss!1577))))))

(assert (= (and d!57299 res!137762) b!165407))

(assert (= (and b!165407 res!137761) b!165408))

(assert (=> d!57299 m!262881))

(declare-fun m!262895 () Bool)

(assert (=> d!57299 m!262895))

(assert (=> b!165359 d!57299))

(declare-fun d!57307 () Bool)

(assert (=> d!57307 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7881 thiss!1577) (currentByte!7886 thiss!1577) (size!3758 (buf!4210 thiss!1577))))))

(declare-fun bs!14237 () Bool)

(assert (= bs!14237 d!57307))

(assert (=> bs!14237 m!262895))

(assert (=> start!35322 d!57307))

(check-sat (not d!57307) (not b!165395) (not b!165390) (not d!57283) (not b!165387) (not d!57285) (not d!57299) (not d!57295))
