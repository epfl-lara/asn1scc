; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36416 () Bool)

(assert start!36416)

(declare-fun e!116246 () Bool)

(declare-fun lt!260840 () (_ BitVec 8))

(declare-fun b!167532 () Bool)

(declare-datatypes ((array!8686 0))(
  ( (array!8687 (arr!4778 (Array (_ BitVec 32) (_ BitVec 8))) (size!3857 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6870 0))(
  ( (BitStream!6871 (buf!4309 array!8686) (currentByte!8154 (_ BitVec 32)) (currentBit!8149 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14616 0))(
  ( (tuple2!14617 (_1!7905 BitStream!6870) (_2!7905 (_ BitVec 8))) )
))
(declare-fun lt!260837 () tuple2!14616)

(declare-datatypes ((tuple2!14618 0))(
  ( (tuple2!14619 (_1!7906 BitStream!6870) (_2!7906 BitStream!6870)) )
))
(declare-fun lt!260830 () tuple2!14618)

(assert (=> b!167532 (= e!116246 (and (= ((_ sign_extend 24) (_2!7905 lt!260837)) ((_ sign_extend 24) lt!260840)) (= (_1!7905 lt!260837) (_2!7906 lt!260830))))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun readPartialBytePure!0 (BitStream!6870 (_ BitVec 32)) tuple2!14616)

(assert (=> b!167532 (= lt!260837 (readPartialBytePure!0 (_1!7906 lt!260830) nBits!511))))

(declare-fun thiss!1577 () BitStream!6870)

(declare-fun lt!260836 () BitStream!6870)

(declare-fun reader!0 (BitStream!6870 BitStream!6870) tuple2!14618)

(assert (=> b!167532 (= lt!260830 (reader!0 thiss!1577 lt!260836))))

(declare-fun b!167533 () Bool)

(declare-fun e!116247 () Bool)

(declare-fun array_inv!3598 (array!8686) Bool)

(assert (=> b!167533 (= e!116247 (array_inv!3598 (buf!4309 thiss!1577)))))

(declare-fun b!167534 () Bool)

(declare-fun e!116243 () Bool)

(declare-fun e!116245 () Bool)

(assert (=> b!167534 (= e!116243 e!116245)))

(declare-fun res!139489 () Bool)

(assert (=> b!167534 (=> (not res!139489) (not e!116245))))

(assert (=> b!167534 (= res!139489 (bvsgt (bvadd (currentBit!8149 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167534 (= lt!260840 ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))))))

(declare-fun res!139490 () Bool)

(assert (=> start!36416 (=> (not res!139490) (not e!116243))))

(assert (=> start!36416 (= res!139490 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36416 e!116243))

(assert (=> start!36416 true))

(declare-fun inv!12 (BitStream!6870) Bool)

(assert (=> start!36416 (and (inv!12 thiss!1577) e!116247)))

(declare-fun b!167535 () Bool)

(declare-fun e!116244 () Bool)

(assert (=> b!167535 (= e!116244 e!116246)))

(declare-fun res!139493 () Bool)

(assert (=> b!167535 (=> (not res!139493) (not e!116246))))

(declare-fun lt!260833 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167535 (= res!139493 (= (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260833) (bvadd (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)) ((_ sign_extend 32) nBits!511))))))

(declare-fun lt!260839 () array!8686)

(assert (=> b!167535 (= lt!260836 (BitStream!6871 lt!260839 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260833))))

(declare-fun b!167536 () Bool)

(declare-fun res!139491 () Bool)

(assert (=> b!167536 (=> (not res!139491) (not e!116246))))

(declare-fun isPrefixOf!0 (BitStream!6870 BitStream!6870) Bool)

(assert (=> b!167536 (= res!139491 (isPrefixOf!0 thiss!1577 lt!260836))))

(declare-fun b!167537 () Bool)

(assert (=> b!167537 (= e!116245 (not e!116244))))

(declare-fun res!139488 () Bool)

(assert (=> b!167537 (=> res!139488 e!116244)))

(declare-fun lt!260831 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167537 (= res!139488 (not (byteRangesEq!0 (select (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577)) lt!260831 #b00000000000000000000000000000000 lt!260833)))))

(declare-fun arrayRangesEq!686 (array!8686 array!8686 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167537 (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 #b00000000000000000000000000000000 (currentByte!8154 thiss!1577))))

(declare-fun lt!260829 () array!8686)

(declare-datatypes ((Unit!11662 0))(
  ( (Unit!11663) )
))
(declare-fun lt!260832 () Unit!11662)

(declare-fun arrayRangesEqTransitive!188 (array!8686 array!8686 array!8686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11662)

(assert (=> b!167537 (= lt!260832 (arrayRangesEqTransitive!188 (buf!4309 thiss!1577) lt!260829 lt!260839 #b00000000000000000000000000000000 (currentByte!8154 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (=> b!167537 (arrayRangesEq!686 lt!260829 lt!260839 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)))))

(declare-fun lt!260835 () Unit!11662)

(declare-fun lt!260834 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!294 (array!8686 (_ BitVec 32) (_ BitVec 8)) Unit!11662)

(assert (=> b!167537 (= lt!260835 (arrayUpdatedAtPrefixLemma!294 lt!260829 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834))))

(assert (=> b!167537 (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8154 thiss!1577))))

(declare-fun lt!260842 () Unit!11662)

(assert (=> b!167537 (= lt!260842 (arrayUpdatedAtPrefixLemma!294 (buf!4309 thiss!1577) (currentByte!8154 thiss!1577) lt!260831))))

(declare-fun lt!260841 () (_ BitVec 32))

(assert (=> b!167537 (= lt!260831 (select (store (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8149 thiss!1577)))))))) (bvlshr (bvand lt!260841 #b00000000000000000000000011111111) lt!260833)))) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (currentByte!8154 thiss!1577)))))

(assert (=> b!167537 (= lt!260839 (array!8687 (store (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8149 thiss!1577)))))))) (bvlshr (bvand lt!260841 #b00000000000000000000000011111111) lt!260833)))) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 (buf!4309 thiss!1577))))))

(declare-fun lt!260838 () (_ BitVec 32))

(assert (=> b!167537 (= lt!260834 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8149 thiss!1577)))))))) (bvlshr (bvand lt!260841 #b00000000000000000000000011111111) lt!260833)))) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260838))) (bvshl lt!260841 lt!260838))))))

(assert (=> b!167537 (= lt!260838 (bvsub #b00000000000000000000000000001000 lt!260833))))

(assert (=> b!167537 (= lt!260829 (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8149 thiss!1577)))))))) (bvlshr (bvand lt!260841 #b00000000000000000000000011111111) lt!260833)))) (size!3857 (buf!4309 thiss!1577))))))

(assert (=> b!167537 (= lt!260841 ((_ sign_extend 24) lt!260840))))

(assert (=> b!167537 (= lt!260833 (bvsub (bvadd (currentBit!8149 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167538 () Bool)

(declare-fun res!139492 () Bool)

(assert (=> b!167538 (=> (not res!139492) (not e!116243))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167538 (= res!139492 (validate_offset_bits!1 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) ((_ sign_extend 32) (currentByte!8154 thiss!1577)) ((_ sign_extend 32) (currentBit!8149 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!36416 res!139490) b!167538))

(assert (= (and b!167538 res!139492) b!167534))

(assert (= (and b!167534 res!139489) b!167537))

(assert (= (and b!167537 (not res!139488)) b!167535))

(assert (= (and b!167535 res!139493) b!167536))

(assert (= (and b!167536 res!139491) b!167532))

(assert (= start!36416 b!167533))

(declare-fun m!266679 () Bool)

(assert (=> start!36416 m!266679))

(declare-fun m!266681 () Bool)

(assert (=> b!167537 m!266681))

(declare-fun m!266683 () Bool)

(assert (=> b!167537 m!266683))

(declare-fun m!266685 () Bool)

(assert (=> b!167537 m!266685))

(declare-fun m!266687 () Bool)

(assert (=> b!167537 m!266687))

(declare-fun m!266689 () Bool)

(assert (=> b!167537 m!266689))

(declare-fun m!266691 () Bool)

(assert (=> b!167537 m!266691))

(assert (=> b!167537 m!266681))

(declare-fun m!266693 () Bool)

(assert (=> b!167537 m!266693))

(declare-fun m!266695 () Bool)

(assert (=> b!167537 m!266695))

(declare-fun m!266697 () Bool)

(assert (=> b!167537 m!266697))

(declare-fun m!266699 () Bool)

(assert (=> b!167537 m!266699))

(declare-fun m!266701 () Bool)

(assert (=> b!167537 m!266701))

(declare-fun m!266703 () Bool)

(assert (=> b!167537 m!266703))

(declare-fun m!266705 () Bool)

(assert (=> b!167537 m!266705))

(declare-fun m!266707 () Bool)

(assert (=> b!167537 m!266707))

(declare-fun m!266709 () Bool)

(assert (=> b!167537 m!266709))

(declare-fun m!266711 () Bool)

(assert (=> b!167532 m!266711))

(declare-fun m!266713 () Bool)

(assert (=> b!167532 m!266713))

(declare-fun m!266715 () Bool)

(assert (=> b!167534 m!266715))

(declare-fun m!266717 () Bool)

(assert (=> b!167535 m!266717))

(declare-fun m!266719 () Bool)

(assert (=> b!167535 m!266719))

(declare-fun m!266721 () Bool)

(assert (=> b!167536 m!266721))

(declare-fun m!266723 () Bool)

(assert (=> b!167538 m!266723))

(declare-fun m!266725 () Bool)

(assert (=> b!167533 m!266725))

(check-sat (not b!167536) (not start!36416) (not b!167538) (not b!167532) (not b!167533) (not b!167535) (not b!167537))
(check-sat)
(get-model)

(declare-fun d!58705 () Bool)

(declare-fun res!139525 () Bool)

(declare-fun e!116276 () Bool)

(assert (=> d!58705 (=> res!139525 e!116276)))

(assert (=> d!58705 (= res!139525 (= #b00000000000000000000000000000000 (currentByte!8154 thiss!1577)))))

(assert (=> d!58705 (= (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 #b00000000000000000000000000000000 (currentByte!8154 thiss!1577)) e!116276)))

(declare-fun b!167573 () Bool)

(declare-fun e!116277 () Bool)

(assert (=> b!167573 (= e!116276 e!116277)))

(declare-fun res!139526 () Bool)

(assert (=> b!167573 (=> (not res!139526) (not e!116277))))

(assert (=> b!167573 (= res!139526 (= (select (arr!4778 (buf!4309 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4778 lt!260839) #b00000000000000000000000000000000)))))

(declare-fun b!167574 () Bool)

(assert (=> b!167574 (= e!116277 (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (= (and d!58705 (not res!139525)) b!167573))

(assert (= (and b!167573 res!139526) b!167574))

(declare-fun m!266781 () Bool)

(assert (=> b!167573 m!266781))

(declare-fun m!266783 () Bool)

(assert (=> b!167573 m!266783))

(declare-fun m!266785 () Bool)

(assert (=> b!167574 m!266785))

(assert (=> b!167537 d!58705))

(declare-fun d!58707 () Bool)

(declare-fun e!116283 () Bool)

(assert (=> d!58707 e!116283))

(declare-fun res!139535 () Bool)

(assert (=> d!58707 (=> (not res!139535) (not e!116283))))

(assert (=> d!58707 (= res!139535 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) (size!3857 lt!260829))))))

(declare-fun lt!260905 () Unit!11662)

(declare-fun choose!257 (array!8686 (_ BitVec 32) (_ BitVec 8)) Unit!11662)

(assert (=> d!58707 (= lt!260905 (choose!257 lt!260829 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834))))

(assert (=> d!58707 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) (size!3857 lt!260829)))))

(assert (=> d!58707 (= (arrayUpdatedAtPrefixLemma!294 lt!260829 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) lt!260905)))

(declare-fun b!167583 () Bool)

(assert (=> b!167583 (= e!116283 (arrayRangesEq!686 lt!260829 (array!8687 (store (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 lt!260829)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (= (and d!58707 res!139535) b!167583))

(declare-fun m!266791 () Bool)

(assert (=> d!58707 m!266791))

(declare-fun m!266793 () Bool)

(assert (=> b!167583 m!266793))

(declare-fun m!266795 () Bool)

(assert (=> b!167583 m!266795))

(assert (=> b!167537 d!58707))

(declare-fun d!58711 () Bool)

(assert (=> d!58711 (= (byteRangesEq!0 (select (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577)) lt!260831 #b00000000000000000000000000000000 lt!260833) (or (= #b00000000000000000000000000000000 lt!260833) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260833))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260831) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260833))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14576 () Bool)

(assert (= bs!14576 d!58711))

(declare-fun m!266803 () Bool)

(assert (=> bs!14576 m!266803))

(declare-fun m!266805 () Bool)

(assert (=> bs!14576 m!266805))

(assert (=> b!167537 d!58711))

(declare-fun d!58717 () Bool)

(assert (=> d!58717 (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 #b00000000000000000000000000000000 (currentByte!8154 thiss!1577))))

(declare-fun lt!260914 () Unit!11662)

(declare-fun choose!258 (array!8686 array!8686 array!8686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11662)

(assert (=> d!58717 (= lt!260914 (choose!258 (buf!4309 thiss!1577) lt!260829 lt!260839 #b00000000000000000000000000000000 (currentByte!8154 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (=> d!58717 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8154 thiss!1577)) (bvsle (currentByte!8154 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (=> d!58717 (= (arrayRangesEqTransitive!188 (buf!4309 thiss!1577) lt!260829 lt!260839 #b00000000000000000000000000000000 (currentByte!8154 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) lt!260914)))

(declare-fun bs!14577 () Bool)

(assert (= bs!14577 d!58717))

(assert (=> bs!14577 m!266703))

(declare-fun m!266813 () Bool)

(assert (=> bs!14577 m!266813))

(assert (=> b!167537 d!58717))

(declare-fun d!58721 () Bool)

(declare-fun res!139544 () Bool)

(declare-fun e!116291 () Bool)

(assert (=> d!58721 (=> res!139544 e!116291)))

(assert (=> d!58721 (= res!139544 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (=> d!58721 (= (arrayRangesEq!686 lt!260829 lt!260839 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) e!116291)))

(declare-fun b!167592 () Bool)

(declare-fun e!116292 () Bool)

(assert (=> b!167592 (= e!116291 e!116292)))

(declare-fun res!139545 () Bool)

(assert (=> b!167592 (=> (not res!139545) (not e!116292))))

(assert (=> b!167592 (= res!139545 (= (select (arr!4778 lt!260829) #b00000000000000000000000000000000) (select (arr!4778 lt!260839) #b00000000000000000000000000000000)))))

(declare-fun b!167593 () Bool)

(assert (=> b!167593 (= e!116292 (arrayRangesEq!686 lt!260829 lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (= (and d!58721 (not res!139544)) b!167592))

(assert (= (and b!167592 res!139545) b!167593))

(declare-fun m!266815 () Bool)

(assert (=> b!167592 m!266815))

(assert (=> b!167592 m!266783))

(declare-fun m!266817 () Bool)

(assert (=> b!167593 m!266817))

(assert (=> b!167537 d!58721))

(declare-fun d!58723 () Bool)

(declare-fun res!139546 () Bool)

(declare-fun e!116293 () Bool)

(assert (=> d!58723 (=> res!139546 e!116293)))

(assert (=> d!58723 (= res!139546 (= #b00000000000000000000000000000000 (currentByte!8154 thiss!1577)))))

(assert (=> d!58723 (= (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8154 thiss!1577)) e!116293)))

(declare-fun b!167594 () Bool)

(declare-fun e!116294 () Bool)

(assert (=> b!167594 (= e!116293 e!116294)))

(declare-fun res!139547 () Bool)

(assert (=> b!167594 (=> (not res!139547) (not e!116294))))

(assert (=> b!167594 (= res!139547 (= (select (arr!4778 (buf!4309 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4778 (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167595 () Bool)

(assert (=> b!167595 (= e!116294 (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (= (and d!58723 (not res!139546)) b!167594))

(assert (= (and b!167594 res!139547) b!167595))

(assert (=> b!167594 m!266781))

(declare-fun m!266819 () Bool)

(assert (=> b!167594 m!266819))

(declare-fun m!266821 () Bool)

(assert (=> b!167595 m!266821))

(assert (=> b!167537 d!58723))

(declare-fun d!58725 () Bool)

(declare-fun e!116295 () Bool)

(assert (=> d!58725 e!116295))

(declare-fun res!139548 () Bool)

(assert (=> d!58725 (=> (not res!139548) (not e!116295))))

(assert (=> d!58725 (= res!139548 (and (bvsge (currentByte!8154 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8154 thiss!1577) (size!3857 (buf!4309 thiss!1577)))))))

(declare-fun lt!260915 () Unit!11662)

(assert (=> d!58725 (= lt!260915 (choose!257 (buf!4309 thiss!1577) (currentByte!8154 thiss!1577) lt!260831))))

(assert (=> d!58725 (and (bvsle #b00000000000000000000000000000000 (currentByte!8154 thiss!1577)) (bvslt (currentByte!8154 thiss!1577) (size!3857 (buf!4309 thiss!1577))))))

(assert (=> d!58725 (= (arrayUpdatedAtPrefixLemma!294 (buf!4309 thiss!1577) (currentByte!8154 thiss!1577) lt!260831) lt!260915)))

(declare-fun b!167596 () Bool)

(assert (=> b!167596 (= e!116295 (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8154 thiss!1577)))))

(assert (= (and d!58725 res!139548) b!167596))

(declare-fun m!266823 () Bool)

(assert (=> d!58725 m!266823))

(assert (=> b!167596 m!266687))

(assert (=> b!167596 m!266707))

(assert (=> b!167537 d!58725))

(declare-fun d!58727 () Bool)

(declare-datatypes ((tuple2!14626 0))(
  ( (tuple2!14627 (_1!7910 (_ BitVec 8)) (_2!7910 BitStream!6870)) )
))
(declare-fun lt!260924 () tuple2!14626)

(declare-fun readPartialByte!0 (BitStream!6870 (_ BitVec 32)) tuple2!14626)

(assert (=> d!58727 (= lt!260924 (readPartialByte!0 (_1!7906 lt!260830) nBits!511))))

(assert (=> d!58727 (= (readPartialBytePure!0 (_1!7906 lt!260830) nBits!511) (tuple2!14617 (_2!7910 lt!260924) (_1!7910 lt!260924)))))

(declare-fun bs!14579 () Bool)

(assert (= bs!14579 d!58727))

(declare-fun m!266833 () Bool)

(assert (=> bs!14579 m!266833))

(assert (=> b!167532 d!58727))

(declare-fun b!167661 () Bool)

(declare-fun res!139603 () Bool)

(declare-fun e!116339 () Bool)

(assert (=> b!167661 (=> (not res!139603) (not e!116339))))

(declare-fun lt!261068 () tuple2!14618)

(assert (=> b!167661 (= res!139603 (isPrefixOf!0 (_1!7906 lt!261068) thiss!1577))))

(declare-fun b!167662 () Bool)

(declare-fun res!139604 () Bool)

(assert (=> b!167662 (=> (not res!139604) (not e!116339))))

(assert (=> b!167662 (= res!139604 (isPrefixOf!0 (_2!7906 lt!261068) lt!260836))))

(declare-fun b!167663 () Bool)

(declare-fun e!116338 () Unit!11662)

(declare-fun lt!261073 () Unit!11662)

(assert (=> b!167663 (= e!116338 lt!261073)))

(declare-fun lt!261062 () (_ BitVec 64))

(assert (=> b!167663 (= lt!261062 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!261064 () (_ BitVec 64))

(assert (=> b!167663 (= lt!261064 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8686 array!8686 (_ BitVec 64) (_ BitVec 64)) Unit!11662)

(assert (=> b!167663 (= lt!261073 (arrayBitRangesEqSymmetric!0 (buf!4309 thiss!1577) (buf!4309 lt!260836) lt!261062 lt!261064))))

(declare-fun arrayBitRangesEq!0 (array!8686 array!8686 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167663 (arrayBitRangesEq!0 (buf!4309 lt!260836) (buf!4309 thiss!1577) lt!261062 lt!261064)))

(declare-fun b!167664 () Bool)

(declare-fun Unit!11667 () Unit!11662)

(assert (=> b!167664 (= e!116338 Unit!11667)))

(declare-fun lt!261067 () (_ BitVec 64))

(declare-fun lt!261079 () (_ BitVec 64))

(declare-fun b!167665 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!6870 (_ BitVec 64)) BitStream!6870)

(assert (=> b!167665 (= e!116339 (= (_1!7906 lt!261068) (withMovedBitIndex!0 (_2!7906 lt!261068) (bvsub lt!261067 lt!261079))))))

(assert (=> b!167665 (or (= (bvand lt!261067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261067 lt!261079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!167665 (= lt!261079 (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836)))))

(assert (=> b!167665 (= lt!261067 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)))))

(declare-fun d!58733 () Bool)

(assert (=> d!58733 e!116339))

(declare-fun res!139605 () Bool)

(assert (=> d!58733 (=> (not res!139605) (not e!116339))))

(assert (=> d!58733 (= res!139605 (isPrefixOf!0 (_1!7906 lt!261068) (_2!7906 lt!261068)))))

(declare-fun lt!261063 () BitStream!6870)

(assert (=> d!58733 (= lt!261068 (tuple2!14619 lt!261063 lt!260836))))

(declare-fun lt!261076 () Unit!11662)

(declare-fun lt!261070 () Unit!11662)

(assert (=> d!58733 (= lt!261076 lt!261070)))

(assert (=> d!58733 (isPrefixOf!0 lt!261063 lt!260836)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6870 BitStream!6870 BitStream!6870) Unit!11662)

(assert (=> d!58733 (= lt!261070 (lemmaIsPrefixTransitive!0 lt!261063 lt!260836 lt!260836))))

(declare-fun lt!261077 () Unit!11662)

(declare-fun lt!261071 () Unit!11662)

(assert (=> d!58733 (= lt!261077 lt!261071)))

(assert (=> d!58733 (isPrefixOf!0 lt!261063 lt!260836)))

(assert (=> d!58733 (= lt!261071 (lemmaIsPrefixTransitive!0 lt!261063 thiss!1577 lt!260836))))

(declare-fun lt!261060 () Unit!11662)

(assert (=> d!58733 (= lt!261060 e!116338)))

(declare-fun c!8642 () Bool)

(assert (=> d!58733 (= c!8642 (not (= (size!3857 (buf!4309 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!261074 () Unit!11662)

(declare-fun lt!261066 () Unit!11662)

(assert (=> d!58733 (= lt!261074 lt!261066)))

(assert (=> d!58733 (isPrefixOf!0 lt!260836 lt!260836)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6870) Unit!11662)

(assert (=> d!58733 (= lt!261066 (lemmaIsPrefixRefl!0 lt!260836))))

(declare-fun lt!261072 () Unit!11662)

(declare-fun lt!261069 () Unit!11662)

(assert (=> d!58733 (= lt!261072 lt!261069)))

(assert (=> d!58733 (= lt!261069 (lemmaIsPrefixRefl!0 lt!260836))))

(declare-fun lt!261078 () Unit!11662)

(declare-fun lt!261061 () Unit!11662)

(assert (=> d!58733 (= lt!261078 lt!261061)))

(assert (=> d!58733 (isPrefixOf!0 lt!261063 lt!261063)))

(assert (=> d!58733 (= lt!261061 (lemmaIsPrefixRefl!0 lt!261063))))

(declare-fun lt!261065 () Unit!11662)

(declare-fun lt!261075 () Unit!11662)

(assert (=> d!58733 (= lt!261065 lt!261075)))

(assert (=> d!58733 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!58733 (= lt!261075 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!58733 (= lt!261063 (BitStream!6871 (buf!4309 lt!260836) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)))))

(assert (=> d!58733 (isPrefixOf!0 thiss!1577 lt!260836)))

(assert (=> d!58733 (= (reader!0 thiss!1577 lt!260836) lt!261068)))

(assert (= (and d!58733 c!8642) b!167663))

(assert (= (and d!58733 (not c!8642)) b!167664))

(assert (= (and d!58733 res!139605) b!167661))

(assert (= (and b!167661 res!139603) b!167662))

(assert (= (and b!167662 res!139604) b!167665))

(declare-fun m!266917 () Bool)

(assert (=> b!167661 m!266917))

(declare-fun m!266919 () Bool)

(assert (=> d!58733 m!266919))

(declare-fun m!266921 () Bool)

(assert (=> d!58733 m!266921))

(declare-fun m!266923 () Bool)

(assert (=> d!58733 m!266923))

(assert (=> d!58733 m!266721))

(declare-fun m!266925 () Bool)

(assert (=> d!58733 m!266925))

(declare-fun m!266927 () Bool)

(assert (=> d!58733 m!266927))

(declare-fun m!266929 () Bool)

(assert (=> d!58733 m!266929))

(declare-fun m!266931 () Bool)

(assert (=> d!58733 m!266931))

(declare-fun m!266933 () Bool)

(assert (=> d!58733 m!266933))

(declare-fun m!266935 () Bool)

(assert (=> d!58733 m!266935))

(declare-fun m!266937 () Bool)

(assert (=> d!58733 m!266937))

(declare-fun m!266939 () Bool)

(assert (=> b!167665 m!266939))

(declare-fun m!266941 () Bool)

(assert (=> b!167665 m!266941))

(assert (=> b!167665 m!266719))

(assert (=> b!167663 m!266719))

(declare-fun m!266943 () Bool)

(assert (=> b!167663 m!266943))

(declare-fun m!266945 () Bool)

(assert (=> b!167663 m!266945))

(declare-fun m!266947 () Bool)

(assert (=> b!167662 m!266947))

(assert (=> b!167532 d!58733))

(declare-fun d!58775 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58775 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8149 thiss!1577) (currentByte!8154 thiss!1577) (size!3857 (buf!4309 thiss!1577))))))

(declare-fun bs!14586 () Bool)

(assert (= bs!14586 d!58775))

(declare-fun m!266949 () Bool)

(assert (=> bs!14586 m!266949))

(assert (=> start!36416 d!58775))

(declare-fun d!58777 () Bool)

(declare-fun e!116342 () Bool)

(assert (=> d!58777 e!116342))

(declare-fun res!139610 () Bool)

(assert (=> d!58777 (=> (not res!139610) (not e!116342))))

(declare-fun lt!261099 () (_ BitVec 64))

(declare-fun lt!261096 () (_ BitVec 64))

(declare-fun lt!261097 () (_ BitVec 64))

(assert (=> d!58777 (= res!139610 (= lt!261096 (bvsub lt!261099 lt!261097)))))

(assert (=> d!58777 (or (= (bvand lt!261099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261097 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261099 lt!261097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58777 (= lt!261097 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) ((_ sign_extend 32) lt!260833)))))

(declare-fun lt!261095 () (_ BitVec 64))

(declare-fun lt!261098 () (_ BitVec 64))

(assert (=> d!58777 (= lt!261099 (bvmul lt!261095 lt!261098))))

(assert (=> d!58777 (or (= lt!261095 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261098 (bvsdiv (bvmul lt!261095 lt!261098) lt!261095)))))

(assert (=> d!58777 (= lt!261098 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58777 (= lt!261095 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))))))

(assert (=> d!58777 (= lt!261096 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!260833)))))

(assert (=> d!58777 (invariant!0 lt!260833 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) (size!3857 (buf!4309 thiss!1577)))))

(assert (=> d!58777 (= (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260833) lt!261096)))

(declare-fun b!167670 () Bool)

(declare-fun res!139611 () Bool)

(assert (=> b!167670 (=> (not res!139611) (not e!116342))))

(assert (=> b!167670 (= res!139611 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261096))))

(declare-fun b!167671 () Bool)

(declare-fun lt!261100 () (_ BitVec 64))

(assert (=> b!167671 (= e!116342 (bvsle lt!261096 (bvmul lt!261100 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167671 (or (= lt!261100 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261100 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261100)))))

(assert (=> b!167671 (= lt!261100 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))))))

(assert (= (and d!58777 res!139610) b!167670))

(assert (= (and b!167670 res!139611) b!167671))

(declare-fun m!266953 () Bool)

(assert (=> d!58777 m!266953))

(declare-fun m!266955 () Bool)

(assert (=> d!58777 m!266955))

(assert (=> b!167535 d!58777))

(declare-fun d!58781 () Bool)

(declare-fun e!116343 () Bool)

(assert (=> d!58781 e!116343))

(declare-fun res!139612 () Bool)

(assert (=> d!58781 (=> (not res!139612) (not e!116343))))

(declare-fun lt!261105 () (_ BitVec 64))

(declare-fun lt!261102 () (_ BitVec 64))

(declare-fun lt!261103 () (_ BitVec 64))

(assert (=> d!58781 (= res!139612 (= lt!261102 (bvsub lt!261105 lt!261103)))))

(assert (=> d!58781 (or (= (bvand lt!261105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261105 lt!261103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58781 (= lt!261103 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) ((_ sign_extend 32) (currentByte!8154 thiss!1577)) ((_ sign_extend 32) (currentBit!8149 thiss!1577))))))

(declare-fun lt!261101 () (_ BitVec 64))

(declare-fun lt!261104 () (_ BitVec 64))

(assert (=> d!58781 (= lt!261105 (bvmul lt!261101 lt!261104))))

(assert (=> d!58781 (or (= lt!261101 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261104 (bvsdiv (bvmul lt!261101 lt!261104) lt!261101)))))

(assert (=> d!58781 (= lt!261104 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58781 (= lt!261101 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))))))

(assert (=> d!58781 (= lt!261102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 thiss!1577))))))

(assert (=> d!58781 (invariant!0 (currentBit!8149 thiss!1577) (currentByte!8154 thiss!1577) (size!3857 (buf!4309 thiss!1577)))))

(assert (=> d!58781 (= (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)) lt!261102)))

(declare-fun b!167672 () Bool)

(declare-fun res!139613 () Bool)

(assert (=> b!167672 (=> (not res!139613) (not e!116343))))

(assert (=> b!167672 (= res!139613 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261102))))

(declare-fun b!167673 () Bool)

(declare-fun lt!261106 () (_ BitVec 64))

(assert (=> b!167673 (= e!116343 (bvsle lt!261102 (bvmul lt!261106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167673 (or (= lt!261106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261106)))))

(assert (=> b!167673 (= lt!261106 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))))))

(assert (= (and d!58781 res!139612) b!167672))

(assert (= (and b!167672 res!139613) b!167673))

(declare-fun m!266957 () Bool)

(assert (=> d!58781 m!266957))

(assert (=> d!58781 m!266949))

(assert (=> b!167535 d!58781))

(declare-fun d!58783 () Bool)

(declare-fun res!139622 () Bool)

(declare-fun e!116348 () Bool)

(assert (=> d!58783 (=> (not res!139622) (not e!116348))))

(assert (=> d!58783 (= res!139622 (= (size!3857 (buf!4309 thiss!1577)) (size!3857 (buf!4309 lt!260836))))))

(assert (=> d!58783 (= (isPrefixOf!0 thiss!1577 lt!260836) e!116348)))

(declare-fun b!167680 () Bool)

(declare-fun res!139621 () Bool)

(assert (=> b!167680 (=> (not res!139621) (not e!116348))))

(assert (=> b!167680 (= res!139621 (bvsle (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)) (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836))))))

(declare-fun b!167681 () Bool)

(declare-fun e!116349 () Bool)

(assert (=> b!167681 (= e!116348 e!116349)))

(declare-fun res!139620 () Bool)

(assert (=> b!167681 (=> res!139620 e!116349)))

(assert (=> b!167681 (= res!139620 (= (size!3857 (buf!4309 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!167682 () Bool)

(assert (=> b!167682 (= e!116349 (arrayBitRangesEq!0 (buf!4309 thiss!1577) (buf!4309 lt!260836) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(assert (= (and d!58783 res!139622) b!167680))

(assert (= (and b!167680 res!139621) b!167681))

(assert (= (and b!167681 (not res!139620)) b!167682))

(assert (=> b!167680 m!266719))

(assert (=> b!167680 m!266941))

(assert (=> b!167682 m!266719))

(assert (=> b!167682 m!266719))

(declare-fun m!266959 () Bool)

(assert (=> b!167682 m!266959))

(assert (=> b!167536 d!58783))

(declare-fun d!58785 () Bool)

(assert (=> d!58785 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) ((_ sign_extend 32) (currentByte!8154 thiss!1577)) ((_ sign_extend 32) (currentBit!8149 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) ((_ sign_extend 32) (currentByte!8154 thiss!1577)) ((_ sign_extend 32) (currentBit!8149 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14588 () Bool)

(assert (= bs!14588 d!58785))

(assert (=> bs!14588 m!266957))

(assert (=> b!167538 d!58785))

(declare-fun d!58787 () Bool)

(assert (=> d!58787 (= (array_inv!3598 (buf!4309 thiss!1577)) (bvsge (size!3857 (buf!4309 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167533 d!58787))

(check-sat (not b!167583) (not b!167665) (not d!58777) (not d!58781) (not d!58785) (not b!167680) (not d!58727) (not b!167593) (not d!58707) (not b!167596) (not b!167663) (not b!167662) (not b!167682) (not d!58733) (not b!167661) (not d!58717) (not d!58725) (not d!58775) (not b!167574) (not b!167595))
(check-sat)
(get-model)

(declare-fun d!58789 () Bool)

(declare-fun res!139632 () Bool)

(declare-fun e!116356 () Bool)

(assert (=> d!58789 (=> res!139632 e!116356)))

(assert (=> d!58789 (= res!139632 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (=> d!58789 (= (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)) e!116356)))

(declare-fun b!167698 () Bool)

(declare-fun e!116357 () Bool)

(assert (=> b!167698 (= e!116356 e!116357)))

(declare-fun res!139633 () Bool)

(assert (=> b!167698 (=> (not res!139633) (not e!116357))))

(assert (=> b!167698 (= res!139633 (= (select (arr!4778 (buf!4309 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4778 (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167699 () Bool)

(assert (=> b!167699 (= e!116357 (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (= (and d!58789 (not res!139632)) b!167698))

(assert (= (and b!167698 res!139633) b!167699))

(declare-fun m!266991 () Bool)

(assert (=> b!167698 m!266991))

(declare-fun m!266993 () Bool)

(assert (=> b!167698 m!266993))

(declare-fun m!266995 () Bool)

(assert (=> b!167699 m!266995))

(assert (=> b!167595 d!58789))

(assert (=> b!167680 d!58781))

(declare-fun d!58791 () Bool)

(declare-fun e!116358 () Bool)

(assert (=> d!58791 e!116358))

(declare-fun res!139634 () Bool)

(assert (=> d!58791 (=> (not res!139634) (not e!116358))))

(declare-fun lt!261169 () (_ BitVec 64))

(declare-fun lt!261168 () (_ BitVec 64))

(declare-fun lt!261171 () (_ BitVec 64))

(assert (=> d!58791 (= res!139634 (= lt!261168 (bvsub lt!261171 lt!261169)))))

(assert (=> d!58791 (or (= (bvand lt!261171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261169 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261171 lt!261169) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58791 (= lt!261169 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 lt!260836))) ((_ sign_extend 32) (currentByte!8154 lt!260836)) ((_ sign_extend 32) (currentBit!8149 lt!260836))))))

(declare-fun lt!261167 () (_ BitVec 64))

(declare-fun lt!261170 () (_ BitVec 64))

(assert (=> d!58791 (= lt!261171 (bvmul lt!261167 lt!261170))))

(assert (=> d!58791 (or (= lt!261167 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261170 (bvsdiv (bvmul lt!261167 lt!261170) lt!261167)))))

(assert (=> d!58791 (= lt!261170 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58791 (= lt!261167 ((_ sign_extend 32) (size!3857 (buf!4309 lt!260836))))))

(assert (=> d!58791 (= lt!261168 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 lt!260836)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 lt!260836))))))

(assert (=> d!58791 (invariant!0 (currentBit!8149 lt!260836) (currentByte!8154 lt!260836) (size!3857 (buf!4309 lt!260836)))))

(assert (=> d!58791 (= (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836)) lt!261168)))

(declare-fun b!167700 () Bool)

(declare-fun res!139635 () Bool)

(assert (=> b!167700 (=> (not res!139635) (not e!116358))))

(assert (=> b!167700 (= res!139635 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261168))))

(declare-fun b!167701 () Bool)

(declare-fun lt!261172 () (_ BitVec 64))

(assert (=> b!167701 (= e!116358 (bvsle lt!261168 (bvmul lt!261172 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167701 (or (= lt!261172 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261172 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261172)))))

(assert (=> b!167701 (= lt!261172 ((_ sign_extend 32) (size!3857 (buf!4309 lt!260836))))))

(assert (= (and d!58791 res!139634) b!167700))

(assert (= (and b!167700 res!139635) b!167701))

(declare-fun m!266997 () Bool)

(assert (=> d!58791 m!266997))

(declare-fun m!266999 () Bool)

(assert (=> d!58791 m!266999))

(assert (=> b!167680 d!58791))

(assert (=> b!167596 d!58723))

(declare-fun d!58793 () Bool)

(assert (=> d!58793 (= (invariant!0 (currentBit!8149 thiss!1577) (currentByte!8154 thiss!1577) (size!3857 (buf!4309 thiss!1577))) (and (bvsge (currentBit!8149 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8149 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8154 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8154 thiss!1577) (size!3857 (buf!4309 thiss!1577))) (and (= (currentBit!8149 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8154 thiss!1577) (size!3857 (buf!4309 thiss!1577)))))))))

(assert (=> d!58775 d!58793))

(declare-fun d!58795 () Bool)

(assert (=> d!58795 (= (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) ((_ sign_extend 32) (currentByte!8154 thiss!1577)) ((_ sign_extend 32) (currentBit!8149 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 thiss!1577)))))))

(assert (=> d!58781 d!58795))

(assert (=> d!58781 d!58793))

(declare-fun d!58797 () Bool)

(declare-fun res!139638 () Bool)

(declare-fun e!116359 () Bool)

(assert (=> d!58797 (=> (not res!139638) (not e!116359))))

(assert (=> d!58797 (= res!139638 (= (size!3857 (buf!4309 (_1!7906 lt!261068))) (size!3857 (buf!4309 thiss!1577))))))

(assert (=> d!58797 (= (isPrefixOf!0 (_1!7906 lt!261068) thiss!1577) e!116359)))

(declare-fun b!167702 () Bool)

(declare-fun res!139637 () Bool)

(assert (=> b!167702 (=> (not res!139637) (not e!116359))))

(assert (=> b!167702 (= res!139637 (bvsle (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068))) (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(declare-fun b!167703 () Bool)

(declare-fun e!116360 () Bool)

(assert (=> b!167703 (= e!116359 e!116360)))

(declare-fun res!139636 () Bool)

(assert (=> b!167703 (=> res!139636 e!116360)))

(assert (=> b!167703 (= res!139636 (= (size!3857 (buf!4309 (_1!7906 lt!261068))) #b00000000000000000000000000000000))))

(declare-fun b!167704 () Bool)

(assert (=> b!167704 (= e!116360 (arrayBitRangesEq!0 (buf!4309 (_1!7906 lt!261068)) (buf!4309 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068)))))))

(assert (= (and d!58797 res!139638) b!167702))

(assert (= (and b!167702 res!139637) b!167703))

(assert (= (and b!167703 (not res!139636)) b!167704))

(declare-fun m!267001 () Bool)

(assert (=> b!167702 m!267001))

(assert (=> b!167702 m!266719))

(assert (=> b!167704 m!267001))

(assert (=> b!167704 m!267001))

(declare-fun m!267003 () Bool)

(assert (=> b!167704 m!267003))

(assert (=> b!167661 d!58797))

(declare-fun b!167719 () Bool)

(declare-fun res!139652 () Bool)

(declare-fun lt!261180 () (_ BitVec 32))

(assert (=> b!167719 (= res!139652 (= lt!261180 #b00000000000000000000000000000000))))

(declare-fun e!116376 () Bool)

(assert (=> b!167719 (=> res!139652 e!116376)))

(declare-fun e!116373 () Bool)

(assert (=> b!167719 (= e!116373 e!116376)))

(declare-fun bm!2807 () Bool)

(declare-fun c!8648 () Bool)

(declare-fun lt!261179 () (_ BitVec 32))

(declare-datatypes ((tuple4!246 0))(
  ( (tuple4!247 (_1!7912 (_ BitVec 32)) (_2!7912 (_ BitVec 32)) (_3!597 (_ BitVec 32)) (_4!123 (_ BitVec 32))) )
))
(declare-fun lt!261181 () tuple4!246)

(declare-fun call!2810 () Bool)

(assert (=> bm!2807 (= call!2810 (byteRangesEq!0 (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261181)) (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261181)) lt!261179 (ite c!8648 lt!261180 #b00000000000000000000000000001000)))))

(declare-fun b!167720 () Bool)

(declare-fun e!116378 () Bool)

(assert (=> b!167720 (= e!116378 call!2810)))

(declare-fun e!116375 () Bool)

(declare-fun b!167721 () Bool)

(assert (=> b!167721 (= e!116375 (arrayRangesEq!686 (buf!4309 thiss!1577) (buf!4309 lt!260836) (_1!7912 lt!261181) (_2!7912 lt!261181)))))

(declare-fun d!58799 () Bool)

(declare-fun res!139650 () Bool)

(declare-fun e!116377 () Bool)

(assert (=> d!58799 (=> res!139650 e!116377)))

(assert (=> d!58799 (= res!139650 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(assert (=> d!58799 (= (arrayBitRangesEq!0 (buf!4309 thiss!1577) (buf!4309 lt!260836) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))) e!116377)))

(declare-fun b!167722 () Bool)

(declare-fun e!116374 () Bool)

(assert (=> b!167722 (= e!116374 e!116378)))

(assert (=> b!167722 (= c!8648 (= (_3!597 lt!261181) (_4!123 lt!261181)))))

(declare-fun b!167723 () Bool)

(assert (=> b!167723 (= e!116377 e!116374)))

(declare-fun res!139653 () Bool)

(assert (=> b!167723 (=> (not res!139653) (not e!116374))))

(assert (=> b!167723 (= res!139653 e!116375)))

(declare-fun res!139649 () Bool)

(assert (=> b!167723 (=> res!139649 e!116375)))

(assert (=> b!167723 (= res!139649 (bvsge (_1!7912 lt!261181) (_2!7912 lt!261181)))))

(assert (=> b!167723 (= lt!261180 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167723 (= lt!261179 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!246)

(assert (=> b!167723 (= lt!261181 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(declare-fun b!167724 () Bool)

(assert (=> b!167724 (= e!116378 e!116373)))

(declare-fun res!139651 () Bool)

(assert (=> b!167724 (= res!139651 call!2810)))

(assert (=> b!167724 (=> (not res!139651) (not e!116373))))

(declare-fun b!167725 () Bool)

(assert (=> b!167725 (= e!116376 (byteRangesEq!0 (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261181)) (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261181)) #b00000000000000000000000000000000 lt!261180))))

(assert (= (and d!58799 (not res!139650)) b!167723))

(assert (= (and b!167723 (not res!139649)) b!167721))

(assert (= (and b!167723 res!139653) b!167722))

(assert (= (and b!167722 c!8648) b!167720))

(assert (= (and b!167722 (not c!8648)) b!167724))

(assert (= (and b!167724 res!139651) b!167719))

(assert (= (and b!167719 (not res!139652)) b!167725))

(assert (= (or b!167720 b!167724) bm!2807))

(declare-fun m!267005 () Bool)

(assert (=> bm!2807 m!267005))

(declare-fun m!267007 () Bool)

(assert (=> bm!2807 m!267007))

(assert (=> bm!2807 m!267005))

(assert (=> bm!2807 m!267007))

(declare-fun m!267009 () Bool)

(assert (=> bm!2807 m!267009))

(declare-fun m!267011 () Bool)

(assert (=> b!167721 m!267011))

(assert (=> b!167723 m!266719))

(declare-fun m!267013 () Bool)

(assert (=> b!167723 m!267013))

(declare-fun m!267015 () Bool)

(assert (=> b!167725 m!267015))

(declare-fun m!267017 () Bool)

(assert (=> b!167725 m!267017))

(assert (=> b!167725 m!267015))

(assert (=> b!167725 m!267017))

(declare-fun m!267019 () Bool)

(assert (=> b!167725 m!267019))

(assert (=> b!167682 d!58799))

(assert (=> b!167682 d!58781))

(declare-fun d!58801 () Bool)

(declare-fun res!139656 () Bool)

(declare-fun e!116379 () Bool)

(assert (=> d!58801 (=> (not res!139656) (not e!116379))))

(assert (=> d!58801 (= res!139656 (= (size!3857 (buf!4309 (_2!7906 lt!261068))) (size!3857 (buf!4309 lt!260836))))))

(assert (=> d!58801 (= (isPrefixOf!0 (_2!7906 lt!261068) lt!260836) e!116379)))

(declare-fun b!167726 () Bool)

(declare-fun res!139655 () Bool)

(assert (=> b!167726 (=> (not res!139655) (not e!116379))))

(assert (=> b!167726 (= res!139655 (bvsle (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068))) (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836))))))

(declare-fun b!167727 () Bool)

(declare-fun e!116380 () Bool)

(assert (=> b!167727 (= e!116379 e!116380)))

(declare-fun res!139654 () Bool)

(assert (=> b!167727 (=> res!139654 e!116380)))

(assert (=> b!167727 (= res!139654 (= (size!3857 (buf!4309 (_2!7906 lt!261068))) #b00000000000000000000000000000000))))

(declare-fun b!167728 () Bool)

(assert (=> b!167728 (= e!116380 (arrayBitRangesEq!0 (buf!4309 (_2!7906 lt!261068)) (buf!4309 lt!260836) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068)))))))

(assert (= (and d!58801 res!139656) b!167726))

(assert (= (and b!167726 res!139655) b!167727))

(assert (= (and b!167727 (not res!139654)) b!167728))

(declare-fun m!267021 () Bool)

(assert (=> b!167726 m!267021))

(assert (=> b!167726 m!266941))

(assert (=> b!167728 m!267021))

(assert (=> b!167728 m!267021))

(declare-fun m!267023 () Bool)

(assert (=> b!167728 m!267023))

(assert (=> b!167662 d!58801))

(assert (=> b!167663 d!58781))

(declare-fun d!58803 () Bool)

(assert (=> d!58803 (arrayBitRangesEq!0 (buf!4309 lt!260836) (buf!4309 thiss!1577) lt!261062 lt!261064)))

(declare-fun lt!261184 () Unit!11662)

(declare-fun choose!8 (array!8686 array!8686 (_ BitVec 64) (_ BitVec 64)) Unit!11662)

(assert (=> d!58803 (= lt!261184 (choose!8 (buf!4309 thiss!1577) (buf!4309 lt!260836) lt!261062 lt!261064))))

(assert (=> d!58803 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261062) (bvsle lt!261062 lt!261064))))

(assert (=> d!58803 (= (arrayBitRangesEqSymmetric!0 (buf!4309 thiss!1577) (buf!4309 lt!260836) lt!261062 lt!261064) lt!261184)))

(declare-fun bs!14589 () Bool)

(assert (= bs!14589 d!58803))

(assert (=> bs!14589 m!266945))

(declare-fun m!267025 () Bool)

(assert (=> bs!14589 m!267025))

(assert (=> b!167663 d!58803))

(declare-fun b!167729 () Bool)

(declare-fun res!139660 () Bool)

(declare-fun lt!261186 () (_ BitVec 32))

(assert (=> b!167729 (= res!139660 (= lt!261186 #b00000000000000000000000000000000))))

(declare-fun e!116384 () Bool)

(assert (=> b!167729 (=> res!139660 e!116384)))

(declare-fun e!116381 () Bool)

(assert (=> b!167729 (= e!116381 e!116384)))

(declare-fun bm!2808 () Bool)

(declare-fun c!8649 () Bool)

(declare-fun lt!261185 () (_ BitVec 32))

(declare-fun lt!261187 () tuple4!246)

(declare-fun call!2811 () Bool)

(assert (=> bm!2808 (= call!2811 (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261187)) (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261187)) lt!261185 (ite c!8649 lt!261186 #b00000000000000000000000000001000)))))

(declare-fun b!167730 () Bool)

(declare-fun e!116386 () Bool)

(assert (=> b!167730 (= e!116386 call!2811)))

(declare-fun b!167731 () Bool)

(declare-fun e!116383 () Bool)

(assert (=> b!167731 (= e!116383 (arrayRangesEq!686 (buf!4309 lt!260836) (buf!4309 thiss!1577) (_1!7912 lt!261187) (_2!7912 lt!261187)))))

(declare-fun d!58805 () Bool)

(declare-fun res!139658 () Bool)

(declare-fun e!116385 () Bool)

(assert (=> d!58805 (=> res!139658 e!116385)))

(assert (=> d!58805 (= res!139658 (bvsge lt!261062 lt!261064))))

(assert (=> d!58805 (= (arrayBitRangesEq!0 (buf!4309 lt!260836) (buf!4309 thiss!1577) lt!261062 lt!261064) e!116385)))

(declare-fun b!167732 () Bool)

(declare-fun e!116382 () Bool)

(assert (=> b!167732 (= e!116382 e!116386)))

(assert (=> b!167732 (= c!8649 (= (_3!597 lt!261187) (_4!123 lt!261187)))))

(declare-fun b!167733 () Bool)

(assert (=> b!167733 (= e!116385 e!116382)))

(declare-fun res!139661 () Bool)

(assert (=> b!167733 (=> (not res!139661) (not e!116382))))

(assert (=> b!167733 (= res!139661 e!116383)))

(declare-fun res!139657 () Bool)

(assert (=> b!167733 (=> res!139657 e!116383)))

(assert (=> b!167733 (= res!139657 (bvsge (_1!7912 lt!261187) (_2!7912 lt!261187)))))

(assert (=> b!167733 (= lt!261186 ((_ extract 31 0) (bvsrem lt!261064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167733 (= lt!261185 ((_ extract 31 0) (bvsrem lt!261062 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167733 (= lt!261187 (arrayBitIndices!0 lt!261062 lt!261064))))

(declare-fun b!167734 () Bool)

(assert (=> b!167734 (= e!116386 e!116381)))

(declare-fun res!139659 () Bool)

(assert (=> b!167734 (= res!139659 call!2811)))

(assert (=> b!167734 (=> (not res!139659) (not e!116381))))

(declare-fun b!167735 () Bool)

(assert (=> b!167735 (= e!116384 (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261187)) (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261187)) #b00000000000000000000000000000000 lt!261186))))

(assert (= (and d!58805 (not res!139658)) b!167733))

(assert (= (and b!167733 (not res!139657)) b!167731))

(assert (= (and b!167733 res!139661) b!167732))

(assert (= (and b!167732 c!8649) b!167730))

(assert (= (and b!167732 (not c!8649)) b!167734))

(assert (= (and b!167734 res!139659) b!167729))

(assert (= (and b!167729 (not res!139660)) b!167735))

(assert (= (or b!167730 b!167734) bm!2808))

(declare-fun m!267027 () Bool)

(assert (=> bm!2808 m!267027))

(declare-fun m!267029 () Bool)

(assert (=> bm!2808 m!267029))

(assert (=> bm!2808 m!267027))

(assert (=> bm!2808 m!267029))

(declare-fun m!267031 () Bool)

(assert (=> bm!2808 m!267031))

(declare-fun m!267033 () Bool)

(assert (=> b!167731 m!267033))

(declare-fun m!267035 () Bool)

(assert (=> b!167733 m!267035))

(declare-fun m!267037 () Bool)

(assert (=> b!167735 m!267037))

(declare-fun m!267039 () Bool)

(assert (=> b!167735 m!267039))

(assert (=> b!167735 m!267037))

(assert (=> b!167735 m!267039))

(declare-fun m!267041 () Bool)

(assert (=> b!167735 m!267041))

(assert (=> b!167663 d!58805))

(declare-fun d!58807 () Bool)

(assert (=> d!58807 (= (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) ((_ sign_extend 32) lt!260833)) (bvsub (bvmul ((_ sign_extend 32) (size!3857 (buf!4309 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!260833))))))

(assert (=> d!58777 d!58807))

(declare-fun d!58809 () Bool)

(assert (=> d!58809 (= (invariant!0 lt!260833 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) (size!3857 (buf!4309 thiss!1577))) (and (bvsge lt!260833 #b00000000000000000000000000000000) (bvslt lt!260833 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) (size!3857 (buf!4309 thiss!1577))) (and (= lt!260833 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) (size!3857 (buf!4309 thiss!1577)))))))))

(assert (=> d!58777 d!58809))

(declare-fun d!58811 () Bool)

(assert (=> d!58811 (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8154 thiss!1577))))

(assert (=> d!58811 true))

(declare-fun _$8!208 () Unit!11662)

(assert (=> d!58811 (= (choose!257 (buf!4309 thiss!1577) (currentByte!8154 thiss!1577) lt!260831) _$8!208)))

(declare-fun bs!14590 () Bool)

(assert (= bs!14590 d!58811))

(assert (=> bs!14590 m!266687))

(assert (=> bs!14590 m!266707))

(assert (=> d!58725 d!58811))

(declare-fun d!58813 () Bool)

(assert (=> d!58813 (arrayRangesEq!686 lt!260829 (array!8687 (store (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 lt!260829)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)))))

(assert (=> d!58813 true))

(declare-fun _$8!209 () Unit!11662)

(assert (=> d!58813 (= (choose!257 lt!260829 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) _$8!209)))

(declare-fun bs!14591 () Bool)

(assert (= bs!14591 d!58813))

(assert (=> bs!14591 m!266793))

(assert (=> bs!14591 m!266795))

(assert (=> d!58707 d!58813))

(assert (=> d!58785 d!58795))

(declare-fun d!58815 () Bool)

(declare-fun e!116391 () Bool)

(assert (=> d!58815 e!116391))

(declare-fun res!139664 () Bool)

(assert (=> d!58815 (=> (not res!139664) (not e!116391))))

(declare-fun lt!261205 () tuple2!14626)

(assert (=> d!58815 (= res!139664 (= (buf!4309 (_2!7910 lt!261205)) (buf!4309 (_1!7906 lt!260830))))))

(declare-datatypes ((tuple3!948 0))(
  ( (tuple3!949 (_1!7913 Unit!11662) (_2!7913 (_ BitVec 8)) (_3!598 BitStream!6870)) )
))
(declare-fun lt!261202 () tuple3!948)

(assert (=> d!58815 (= lt!261205 (tuple2!14627 (_2!7913 lt!261202) (_3!598 lt!261202)))))

(declare-fun e!116392 () tuple3!948)

(assert (=> d!58815 (= lt!261202 e!116392)))

(declare-fun c!8652 () Bool)

(declare-fun lt!261206 () (_ BitVec 32))

(assert (=> d!58815 (= c!8652 (bvsle lt!261206 #b00000000000000000000000000001000))))

(assert (=> d!58815 (= lt!261206 (bvadd (currentBit!8149 (_1!7906 lt!260830)) nBits!511))))

(assert (=> d!58815 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000))))

(assert (=> d!58815 (= (readPartialByte!0 (_1!7906 lt!260830) nBits!511) lt!261205)))

(declare-fun b!167742 () Bool)

(declare-datatypes ((tuple2!14630 0))(
  ( (tuple2!14631 (_1!7914 Unit!11662) (_2!7914 BitStream!6870)) )
))
(declare-fun lt!261207 () tuple2!14630)

(assert (=> b!167742 (= e!116392 (tuple3!949 (_1!7914 lt!261207) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4778 (buf!4309 (_1!7906 lt!260830))) (currentByte!8154 (_1!7906 lt!260830)))) (bvsub #b00000000000000000000000000001000 lt!261206)) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (_2!7914 lt!261207)))))

(declare-fun moveBitIndex!0 (BitStream!6870 (_ BitVec 64)) tuple2!14630)

(assert (=> b!167742 (= lt!261207 (moveBitIndex!0 (_1!7906 lt!260830) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!261204 () (_ BitVec 32))

(declare-fun b!167743 () Bool)

(declare-fun Unit!11669 () Unit!11662)

(assert (=> b!167743 (= e!116392 (tuple3!949 Unit!11669 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4778 (buf!4309 (_1!7906 lt!260830))) (currentByte!8154 (_1!7906 lt!260830)))) lt!261204))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 (_1!7906 lt!260830))) (bvadd (currentByte!8154 (_1!7906 lt!260830)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (BitStream!6871 (buf!4309 (_1!7906 lt!260830)) (bvadd (currentByte!8154 (_1!7906 lt!260830)) #b00000000000000000000000000000001) lt!261204)))))

(assert (=> b!167743 (= lt!261204 (bvsub lt!261206 #b00000000000000000000000000001000))))

(declare-fun b!167744 () Bool)

(declare-fun lt!261208 () (_ BitVec 64))

(declare-fun lt!261203 () (_ BitVec 64))

(assert (=> b!167744 (= e!116391 (= (bitIndex!0 (size!3857 (buf!4309 (_2!7910 lt!261205))) (currentByte!8154 (_2!7910 lt!261205)) (currentBit!8149 (_2!7910 lt!261205))) (bvadd lt!261203 lt!261208)))))

(assert (=> b!167744 (or (not (= (bvand lt!261203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261208 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261203 lt!261208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!167744 (= lt!261208 ((_ sign_extend 32) nBits!511))))

(assert (=> b!167744 (= lt!261203 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!260830))) (currentByte!8154 (_1!7906 lt!260830)) (currentBit!8149 (_1!7906 lt!260830))))))

(assert (= (and d!58815 c!8652) b!167742))

(assert (= (and d!58815 (not c!8652)) b!167743))

(assert (= (and d!58815 res!139664) b!167744))

(declare-fun m!267043 () Bool)

(assert (=> b!167742 m!267043))

(assert (=> b!167742 m!266715))

(declare-fun m!267045 () Bool)

(assert (=> b!167742 m!267045))

(assert (=> b!167743 m!267043))

(declare-fun m!267047 () Bool)

(assert (=> b!167743 m!267047))

(assert (=> b!167743 m!266715))

(declare-fun m!267049 () Bool)

(assert (=> b!167744 m!267049))

(declare-fun m!267051 () Bool)

(assert (=> b!167744 m!267051))

(assert (=> d!58727 d!58815))

(assert (=> d!58717 d!58705))

(declare-fun d!58817 () Bool)

(assert (=> d!58817 (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 #b00000000000000000000000000000000 (currentByte!8154 thiss!1577))))

(assert (=> d!58817 true))

(declare-fun _$16!80 () Unit!11662)

(assert (=> d!58817 (= (choose!258 (buf!4309 thiss!1577) lt!260829 lt!260839 #b00000000000000000000000000000000 (currentByte!8154 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) _$16!80)))

(declare-fun bs!14592 () Bool)

(assert (= bs!14592 d!58817))

(assert (=> bs!14592 m!266703))

(assert (=> d!58717 d!58817))

(declare-fun d!58819 () Bool)

(declare-fun e!116395 () Bool)

(assert (=> d!58819 e!116395))

(declare-fun res!139667 () Bool)

(assert (=> d!58819 (=> (not res!139667) (not e!116395))))

(declare-fun lt!261214 () (_ BitVec 64))

(declare-fun lt!261213 () BitStream!6870)

(assert (=> d!58819 (= res!139667 (= (bvadd lt!261214 (bvsub lt!261067 lt!261079)) (bitIndex!0 (size!3857 (buf!4309 lt!261213)) (currentByte!8154 lt!261213) (currentBit!8149 lt!261213))))))

(assert (=> d!58819 (or (not (= (bvand lt!261214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261067 lt!261079) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261214 (bvsub lt!261067 lt!261079)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58819 (= lt!261214 (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068))))))

(assert (=> d!58819 (= lt!261213 (_2!7914 (moveBitIndex!0 (_2!7906 lt!261068) (bvsub lt!261067 lt!261079))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6870 (_ BitVec 64)) Bool)

(assert (=> d!58819 (moveBitIndexPrecond!0 (_2!7906 lt!261068) (bvsub lt!261067 lt!261079))))

(assert (=> d!58819 (= (withMovedBitIndex!0 (_2!7906 lt!261068) (bvsub lt!261067 lt!261079)) lt!261213)))

(declare-fun b!167747 () Bool)

(assert (=> b!167747 (= e!116395 (= (size!3857 (buf!4309 (_2!7906 lt!261068))) (size!3857 (buf!4309 lt!261213))))))

(assert (= (and d!58819 res!139667) b!167747))

(declare-fun m!267053 () Bool)

(assert (=> d!58819 m!267053))

(assert (=> d!58819 m!267021))

(declare-fun m!267055 () Bool)

(assert (=> d!58819 m!267055))

(declare-fun m!267057 () Bool)

(assert (=> d!58819 m!267057))

(assert (=> b!167665 d!58819))

(assert (=> b!167665 d!58791))

(assert (=> b!167665 d!58781))

(declare-fun d!58821 () Bool)

(declare-fun res!139670 () Bool)

(declare-fun e!116396 () Bool)

(assert (=> d!58821 (=> (not res!139670) (not e!116396))))

(assert (=> d!58821 (= res!139670 (= (size!3857 (buf!4309 (_1!7906 lt!261068))) (size!3857 (buf!4309 (_2!7906 lt!261068)))))))

(assert (=> d!58821 (= (isPrefixOf!0 (_1!7906 lt!261068) (_2!7906 lt!261068)) e!116396)))

(declare-fun b!167748 () Bool)

(declare-fun res!139669 () Bool)

(assert (=> b!167748 (=> (not res!139669) (not e!116396))))

(assert (=> b!167748 (= res!139669 (bvsle (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068))) (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068)))))))

(declare-fun b!167749 () Bool)

(declare-fun e!116397 () Bool)

(assert (=> b!167749 (= e!116396 e!116397)))

(declare-fun res!139668 () Bool)

(assert (=> b!167749 (=> res!139668 e!116397)))

(assert (=> b!167749 (= res!139668 (= (size!3857 (buf!4309 (_1!7906 lt!261068))) #b00000000000000000000000000000000))))

(declare-fun b!167750 () Bool)

(assert (=> b!167750 (= e!116397 (arrayBitRangesEq!0 (buf!4309 (_1!7906 lt!261068)) (buf!4309 (_2!7906 lt!261068)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068)))))))

(assert (= (and d!58821 res!139670) b!167748))

(assert (= (and b!167748 res!139669) b!167749))

(assert (= (and b!167749 (not res!139668)) b!167750))

(assert (=> b!167748 m!267001))

(assert (=> b!167748 m!267021))

(assert (=> b!167750 m!267001))

(assert (=> b!167750 m!267001))

(declare-fun m!267059 () Bool)

(assert (=> b!167750 m!267059))

(assert (=> d!58733 d!58821))

(declare-fun d!58823 () Bool)

(declare-fun res!139673 () Bool)

(declare-fun e!116398 () Bool)

(assert (=> d!58823 (=> (not res!139673) (not e!116398))))

(assert (=> d!58823 (= res!139673 (= (size!3857 (buf!4309 lt!261063)) (size!3857 (buf!4309 lt!260836))))))

(assert (=> d!58823 (= (isPrefixOf!0 lt!261063 lt!260836) e!116398)))

(declare-fun b!167751 () Bool)

(declare-fun res!139672 () Bool)

(assert (=> b!167751 (=> (not res!139672) (not e!116398))))

(assert (=> b!167751 (= res!139672 (bvsle (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063)) (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836))))))

(declare-fun b!167752 () Bool)

(declare-fun e!116399 () Bool)

(assert (=> b!167752 (= e!116398 e!116399)))

(declare-fun res!139671 () Bool)

(assert (=> b!167752 (=> res!139671 e!116399)))

(assert (=> b!167752 (= res!139671 (= (size!3857 (buf!4309 lt!261063)) #b00000000000000000000000000000000))))

(declare-fun b!167753 () Bool)

(assert (=> b!167753 (= e!116399 (arrayBitRangesEq!0 (buf!4309 lt!261063) (buf!4309 lt!260836) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))))))

(assert (= (and d!58823 res!139673) b!167751))

(assert (= (and b!167751 res!139672) b!167752))

(assert (= (and b!167752 (not res!139671)) b!167753))

(declare-fun m!267061 () Bool)

(assert (=> b!167751 m!267061))

(assert (=> b!167751 m!266941))

(assert (=> b!167753 m!267061))

(assert (=> b!167753 m!267061))

(declare-fun m!267063 () Bool)

(assert (=> b!167753 m!267063))

(assert (=> d!58733 d!58823))

(declare-fun d!58825 () Bool)

(assert (=> d!58825 (isPrefixOf!0 thiss!1577 thiss!1577)))

(declare-fun lt!261217 () Unit!11662)

(declare-fun choose!11 (BitStream!6870) Unit!11662)

(assert (=> d!58825 (= lt!261217 (choose!11 thiss!1577))))

(assert (=> d!58825 (= (lemmaIsPrefixRefl!0 thiss!1577) lt!261217)))

(declare-fun bs!14594 () Bool)

(assert (= bs!14594 d!58825))

(assert (=> bs!14594 m!266919))

(declare-fun m!267065 () Bool)

(assert (=> bs!14594 m!267065))

(assert (=> d!58733 d!58825))

(declare-fun d!58827 () Bool)

(declare-fun res!139676 () Bool)

(declare-fun e!116400 () Bool)

(assert (=> d!58827 (=> (not res!139676) (not e!116400))))

(assert (=> d!58827 (= res!139676 (= (size!3857 (buf!4309 lt!261063)) (size!3857 (buf!4309 lt!261063))))))

(assert (=> d!58827 (= (isPrefixOf!0 lt!261063 lt!261063) e!116400)))

(declare-fun b!167754 () Bool)

(declare-fun res!139675 () Bool)

(assert (=> b!167754 (=> (not res!139675) (not e!116400))))

(assert (=> b!167754 (= res!139675 (bvsle (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063)) (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))))))

(declare-fun b!167755 () Bool)

(declare-fun e!116401 () Bool)

(assert (=> b!167755 (= e!116400 e!116401)))

(declare-fun res!139674 () Bool)

(assert (=> b!167755 (=> res!139674 e!116401)))

(assert (=> b!167755 (= res!139674 (= (size!3857 (buf!4309 lt!261063)) #b00000000000000000000000000000000))))

(declare-fun b!167756 () Bool)

(assert (=> b!167756 (= e!116401 (arrayBitRangesEq!0 (buf!4309 lt!261063) (buf!4309 lt!261063) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))))))

(assert (= (and d!58827 res!139676) b!167754))

(assert (= (and b!167754 res!139675) b!167755))

(assert (= (and b!167755 (not res!139674)) b!167756))

(assert (=> b!167754 m!267061))

(assert (=> b!167754 m!267061))

(assert (=> b!167756 m!267061))

(assert (=> b!167756 m!267061))

(declare-fun m!267067 () Bool)

(assert (=> b!167756 m!267067))

(assert (=> d!58733 d!58827))

(declare-fun d!58829 () Bool)

(assert (=> d!58829 (isPrefixOf!0 lt!261063 lt!260836)))

(declare-fun lt!261220 () Unit!11662)

(declare-fun choose!30 (BitStream!6870 BitStream!6870 BitStream!6870) Unit!11662)

(assert (=> d!58829 (= lt!261220 (choose!30 lt!261063 thiss!1577 lt!260836))))

(assert (=> d!58829 (isPrefixOf!0 lt!261063 thiss!1577)))

(assert (=> d!58829 (= (lemmaIsPrefixTransitive!0 lt!261063 thiss!1577 lt!260836) lt!261220)))

(declare-fun bs!14595 () Bool)

(assert (= bs!14595 d!58829))

(assert (=> bs!14595 m!266925))

(declare-fun m!267069 () Bool)

(assert (=> bs!14595 m!267069))

(declare-fun m!267071 () Bool)

(assert (=> bs!14595 m!267071))

(assert (=> d!58733 d!58829))

(declare-fun d!58831 () Bool)

(assert (=> d!58831 (isPrefixOf!0 lt!261063 lt!261063)))

(declare-fun lt!261221 () Unit!11662)

(assert (=> d!58831 (= lt!261221 (choose!11 lt!261063))))

(assert (=> d!58831 (= (lemmaIsPrefixRefl!0 lt!261063) lt!261221)))

(declare-fun bs!14596 () Bool)

(assert (= bs!14596 d!58831))

(assert (=> bs!14596 m!266937))

(declare-fun m!267073 () Bool)

(assert (=> bs!14596 m!267073))

(assert (=> d!58733 d!58831))

(declare-fun d!58833 () Bool)

(declare-fun res!139679 () Bool)

(declare-fun e!116402 () Bool)

(assert (=> d!58833 (=> (not res!139679) (not e!116402))))

(assert (=> d!58833 (= res!139679 (= (size!3857 (buf!4309 lt!260836)) (size!3857 (buf!4309 lt!260836))))))

(assert (=> d!58833 (= (isPrefixOf!0 lt!260836 lt!260836) e!116402)))

(declare-fun b!167757 () Bool)

(declare-fun res!139678 () Bool)

(assert (=> b!167757 (=> (not res!139678) (not e!116402))))

(assert (=> b!167757 (= res!139678 (bvsle (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836)) (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836))))))

(declare-fun b!167758 () Bool)

(declare-fun e!116403 () Bool)

(assert (=> b!167758 (= e!116402 e!116403)))

(declare-fun res!139677 () Bool)

(assert (=> b!167758 (=> res!139677 e!116403)))

(assert (=> b!167758 (= res!139677 (= (size!3857 (buf!4309 lt!260836)) #b00000000000000000000000000000000))))

(declare-fun b!167759 () Bool)

(assert (=> b!167759 (= e!116403 (arrayBitRangesEq!0 (buf!4309 lt!260836) (buf!4309 lt!260836) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836))))))

(assert (= (and d!58833 res!139679) b!167757))

(assert (= (and b!167757 res!139678) b!167758))

(assert (= (and b!167758 (not res!139677)) b!167759))

(assert (=> b!167757 m!266941))

(assert (=> b!167757 m!266941))

(assert (=> b!167759 m!266941))

(assert (=> b!167759 m!266941))

(declare-fun m!267075 () Bool)

(assert (=> b!167759 m!267075))

(assert (=> d!58733 d!58833))

(assert (=> d!58733 d!58783))

(declare-fun d!58835 () Bool)

(assert (=> d!58835 (isPrefixOf!0 lt!260836 lt!260836)))

(declare-fun lt!261222 () Unit!11662)

(assert (=> d!58835 (= lt!261222 (choose!11 lt!260836))))

(assert (=> d!58835 (= (lemmaIsPrefixRefl!0 lt!260836) lt!261222)))

(declare-fun bs!14597 () Bool)

(assert (= bs!14597 d!58835))

(assert (=> bs!14597 m!266935))

(declare-fun m!267077 () Bool)

(assert (=> bs!14597 m!267077))

(assert (=> d!58733 d!58835))

(declare-fun d!58837 () Bool)

(declare-fun res!139682 () Bool)

(declare-fun e!116404 () Bool)

(assert (=> d!58837 (=> (not res!139682) (not e!116404))))

(assert (=> d!58837 (= res!139682 (= (size!3857 (buf!4309 thiss!1577)) (size!3857 (buf!4309 thiss!1577))))))

(assert (=> d!58837 (= (isPrefixOf!0 thiss!1577 thiss!1577) e!116404)))

(declare-fun b!167760 () Bool)

(declare-fun res!139681 () Bool)

(assert (=> b!167760 (=> (not res!139681) (not e!116404))))

(assert (=> b!167760 (= res!139681 (bvsle (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)) (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(declare-fun b!167761 () Bool)

(declare-fun e!116405 () Bool)

(assert (=> b!167761 (= e!116404 e!116405)))

(declare-fun res!139680 () Bool)

(assert (=> b!167761 (=> res!139680 e!116405)))

(assert (=> b!167761 (= res!139680 (= (size!3857 (buf!4309 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!167762 () Bool)

(assert (=> b!167762 (= e!116405 (arrayBitRangesEq!0 (buf!4309 thiss!1577) (buf!4309 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(assert (= (and d!58837 res!139682) b!167760))

(assert (= (and b!167760 res!139681) b!167761))

(assert (= (and b!167761 (not res!139680)) b!167762))

(assert (=> b!167760 m!266719))

(assert (=> b!167760 m!266719))

(assert (=> b!167762 m!266719))

(assert (=> b!167762 m!266719))

(declare-fun m!267079 () Bool)

(assert (=> b!167762 m!267079))

(assert (=> d!58733 d!58837))

(declare-fun d!58839 () Bool)

(assert (=> d!58839 (isPrefixOf!0 lt!261063 lt!260836)))

(declare-fun lt!261223 () Unit!11662)

(assert (=> d!58839 (= lt!261223 (choose!30 lt!261063 lt!260836 lt!260836))))

(assert (=> d!58839 (isPrefixOf!0 lt!261063 lt!260836)))

(assert (=> d!58839 (= (lemmaIsPrefixTransitive!0 lt!261063 lt!260836 lt!260836) lt!261223)))

(declare-fun bs!14598 () Bool)

(assert (= bs!14598 d!58839))

(assert (=> bs!14598 m!266925))

(declare-fun m!267081 () Bool)

(assert (=> bs!14598 m!267081))

(assert (=> bs!14598 m!266925))

(assert (=> d!58733 d!58839))

(declare-fun d!58841 () Bool)

(declare-fun res!139683 () Bool)

(declare-fun e!116406 () Bool)

(assert (=> d!58841 (=> res!139683 e!116406)))

(assert (=> d!58841 (= res!139683 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (=> d!58841 (= (arrayRangesEq!686 lt!260829 lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) e!116406)))

(declare-fun b!167763 () Bool)

(declare-fun e!116407 () Bool)

(assert (=> b!167763 (= e!116406 e!116407)))

(declare-fun res!139684 () Bool)

(assert (=> b!167763 (=> (not res!139684) (not e!116407))))

(assert (=> b!167763 (= res!139684 (= (select (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4778 lt!260839) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167764 () Bool)

(assert (=> b!167764 (= e!116407 (arrayRangesEq!686 lt!260829 lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (= (and d!58841 (not res!139683)) b!167763))

(assert (= (and b!167763 res!139684) b!167764))

(declare-fun m!267083 () Bool)

(assert (=> b!167763 m!267083))

(declare-fun m!267085 () Bool)

(assert (=> b!167763 m!267085))

(declare-fun m!267087 () Bool)

(assert (=> b!167764 m!267087))

(assert (=> b!167593 d!58841))

(declare-fun d!58843 () Bool)

(declare-fun res!139685 () Bool)

(declare-fun e!116408 () Bool)

(assert (=> d!58843 (=> res!139685 e!116408)))

(assert (=> d!58843 (= res!139685 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (=> d!58843 (= (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)) e!116408)))

(declare-fun b!167765 () Bool)

(declare-fun e!116409 () Bool)

(assert (=> b!167765 (= e!116408 e!116409)))

(declare-fun res!139686 () Bool)

(assert (=> b!167765 (=> (not res!139686) (not e!116409))))

(assert (=> b!167765 (= res!139686 (= (select (arr!4778 (buf!4309 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4778 lt!260839) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167766 () Bool)

(assert (=> b!167766 (= e!116409 (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (= (and d!58843 (not res!139685)) b!167765))

(assert (= (and b!167765 res!139686) b!167766))

(assert (=> b!167765 m!266991))

(assert (=> b!167765 m!267085))

(declare-fun m!267089 () Bool)

(assert (=> b!167766 m!267089))

(assert (=> b!167574 d!58843))

(declare-fun d!58845 () Bool)

(declare-fun res!139687 () Bool)

(declare-fun e!116410 () Bool)

(assert (=> d!58845 (=> res!139687 e!116410)))

(assert (=> d!58845 (= res!139687 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (=> d!58845 (= (arrayRangesEq!686 lt!260829 (array!8687 (store (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 lt!260829)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) e!116410)))

(declare-fun b!167767 () Bool)

(declare-fun e!116411 () Bool)

(assert (=> b!167767 (= e!116410 e!116411)))

(declare-fun res!139688 () Bool)

(assert (=> b!167767 (=> (not res!139688) (not e!116411))))

(assert (=> b!167767 (= res!139688 (= (select (arr!4778 lt!260829) #b00000000000000000000000000000000) (select (arr!4778 (array!8687 (store (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 lt!260829))) #b00000000000000000000000000000000)))))

(declare-fun b!167768 () Bool)

(assert (=> b!167768 (= e!116411 (arrayRangesEq!686 lt!260829 (array!8687 (store (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 lt!260829)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (= (and d!58845 (not res!139687)) b!167767))

(assert (= (and b!167767 res!139688) b!167768))

(assert (=> b!167767 m!266815))

(declare-fun m!267091 () Bool)

(assert (=> b!167767 m!267091))

(declare-fun m!267093 () Bool)

(assert (=> b!167768 m!267093))

(assert (=> b!167583 d!58845))

(check-sat (not bm!2808) (not b!167762) (not b!167742) (not b!167728) (not d!58813) (not d!58835) (not d!58817) (not d!58791) (not d!58831) (not d!58829) (not b!167723) (not b!167731) (not b!167750) (not b!167751) (not d!58825) (not d!58803) (not b!167725) (not b!167757) (not b!167748) (not b!167699) (not b!167754) (not b!167733) (not b!167759) (not b!167702) (not bm!2807) (not b!167768) (not b!167735) (not b!167766) (not b!167721) (not b!167704) (not b!167744) (not b!167760) (not d!58819) (not d!58811) (not b!167726) (not d!58839) (not b!167764) (not b!167756) (not b!167753))
(check-sat)
(get-model)

(declare-fun b!167769 () Bool)

(declare-fun res!139692 () Bool)

(declare-fun lt!261225 () (_ BitVec 32))

(assert (=> b!167769 (= res!139692 (= lt!261225 #b00000000000000000000000000000000))))

(declare-fun e!116415 () Bool)

(assert (=> b!167769 (=> res!139692 e!116415)))

(declare-fun e!116412 () Bool)

(assert (=> b!167769 (= e!116412 e!116415)))

(declare-fun call!2812 () Bool)

(declare-fun bm!2809 () Bool)

(declare-fun c!8653 () Bool)

(declare-fun lt!261224 () (_ BitVec 32))

(declare-fun lt!261226 () tuple4!246)

(assert (=> bm!2809 (= call!2812 (byteRangesEq!0 (select (arr!4778 (buf!4309 (_2!7906 lt!261068))) (_3!597 lt!261226)) (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261226)) lt!261224 (ite c!8653 lt!261225 #b00000000000000000000000000001000)))))

(declare-fun b!167770 () Bool)

(declare-fun e!116417 () Bool)

(assert (=> b!167770 (= e!116417 call!2812)))

(declare-fun e!116414 () Bool)

(declare-fun b!167771 () Bool)

(assert (=> b!167771 (= e!116414 (arrayRangesEq!686 (buf!4309 (_2!7906 lt!261068)) (buf!4309 lt!260836) (_1!7912 lt!261226) (_2!7912 lt!261226)))))

(declare-fun d!58847 () Bool)

(declare-fun res!139690 () Bool)

(declare-fun e!116416 () Bool)

(assert (=> d!58847 (=> res!139690 e!116416)))

(assert (=> d!58847 (= res!139690 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068)))))))

(assert (=> d!58847 (= (arrayBitRangesEq!0 (buf!4309 (_2!7906 lt!261068)) (buf!4309 lt!260836) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068)))) e!116416)))

(declare-fun b!167772 () Bool)

(declare-fun e!116413 () Bool)

(assert (=> b!167772 (= e!116413 e!116417)))

(assert (=> b!167772 (= c!8653 (= (_3!597 lt!261226) (_4!123 lt!261226)))))

(declare-fun b!167773 () Bool)

(assert (=> b!167773 (= e!116416 e!116413)))

(declare-fun res!139693 () Bool)

(assert (=> b!167773 (=> (not res!139693) (not e!116413))))

(assert (=> b!167773 (= res!139693 e!116414)))

(declare-fun res!139689 () Bool)

(assert (=> b!167773 (=> res!139689 e!116414)))

(assert (=> b!167773 (= res!139689 (bvsge (_1!7912 lt!261226) (_2!7912 lt!261226)))))

(assert (=> b!167773 (= lt!261225 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167773 (= lt!261224 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167773 (= lt!261226 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068)))))))

(declare-fun b!167774 () Bool)

(assert (=> b!167774 (= e!116417 e!116412)))

(declare-fun res!139691 () Bool)

(assert (=> b!167774 (= res!139691 call!2812)))

(assert (=> b!167774 (=> (not res!139691) (not e!116412))))

(declare-fun b!167775 () Bool)

(assert (=> b!167775 (= e!116415 (byteRangesEq!0 (select (arr!4778 (buf!4309 (_2!7906 lt!261068))) (_4!123 lt!261226)) (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261226)) #b00000000000000000000000000000000 lt!261225))))

(assert (= (and d!58847 (not res!139690)) b!167773))

(assert (= (and b!167773 (not res!139689)) b!167771))

(assert (= (and b!167773 res!139693) b!167772))

(assert (= (and b!167772 c!8653) b!167770))

(assert (= (and b!167772 (not c!8653)) b!167774))

(assert (= (and b!167774 res!139691) b!167769))

(assert (= (and b!167769 (not res!139692)) b!167775))

(assert (= (or b!167770 b!167774) bm!2809))

(declare-fun m!267095 () Bool)

(assert (=> bm!2809 m!267095))

(declare-fun m!267097 () Bool)

(assert (=> bm!2809 m!267097))

(assert (=> bm!2809 m!267095))

(assert (=> bm!2809 m!267097))

(declare-fun m!267099 () Bool)

(assert (=> bm!2809 m!267099))

(declare-fun m!267101 () Bool)

(assert (=> b!167771 m!267101))

(assert (=> b!167773 m!267021))

(declare-fun m!267103 () Bool)

(assert (=> b!167773 m!267103))

(declare-fun m!267105 () Bool)

(assert (=> b!167775 m!267105))

(declare-fun m!267107 () Bool)

(assert (=> b!167775 m!267107))

(assert (=> b!167775 m!267105))

(assert (=> b!167775 m!267107))

(declare-fun m!267109 () Bool)

(assert (=> b!167775 m!267109))

(assert (=> b!167728 d!58847))

(declare-fun d!58849 () Bool)

(declare-fun e!116418 () Bool)

(assert (=> d!58849 e!116418))

(declare-fun res!139694 () Bool)

(assert (=> d!58849 (=> (not res!139694) (not e!116418))))

(declare-fun lt!261228 () (_ BitVec 64))

(declare-fun lt!261231 () (_ BitVec 64))

(declare-fun lt!261229 () (_ BitVec 64))

(assert (=> d!58849 (= res!139694 (= lt!261228 (bvsub lt!261231 lt!261229)))))

(assert (=> d!58849 (or (= (bvand lt!261231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261229 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261231 lt!261229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58849 (= lt!261229 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7906 lt!261068)))) ((_ sign_extend 32) (currentByte!8154 (_2!7906 lt!261068))) ((_ sign_extend 32) (currentBit!8149 (_2!7906 lt!261068)))))))

(declare-fun lt!261227 () (_ BitVec 64))

(declare-fun lt!261230 () (_ BitVec 64))

(assert (=> d!58849 (= lt!261231 (bvmul lt!261227 lt!261230))))

(assert (=> d!58849 (or (= lt!261227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261230 (bvsdiv (bvmul lt!261227 lt!261230) lt!261227)))))

(assert (=> d!58849 (= lt!261230 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58849 (= lt!261227 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7906 lt!261068)))))))

(assert (=> d!58849 (= lt!261228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 (_2!7906 lt!261068))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 (_2!7906 lt!261068)))))))

(assert (=> d!58849 (invariant!0 (currentBit!8149 (_2!7906 lt!261068)) (currentByte!8154 (_2!7906 lt!261068)) (size!3857 (buf!4309 (_2!7906 lt!261068))))))

(assert (=> d!58849 (= (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068))) lt!261228)))

(declare-fun b!167776 () Bool)

(declare-fun res!139695 () Bool)

(assert (=> b!167776 (=> (not res!139695) (not e!116418))))

(assert (=> b!167776 (= res!139695 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261228))))

(declare-fun b!167777 () Bool)

(declare-fun lt!261232 () (_ BitVec 64))

(assert (=> b!167777 (= e!116418 (bvsle lt!261228 (bvmul lt!261232 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167777 (or (= lt!261232 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261232 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261232)))))

(assert (=> b!167777 (= lt!261232 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7906 lt!261068)))))))

(assert (= (and d!58849 res!139694) b!167776))

(assert (= (and b!167776 res!139695) b!167777))

(declare-fun m!267111 () Bool)

(assert (=> d!58849 m!267111))

(declare-fun m!267113 () Bool)

(assert (=> d!58849 m!267113))

(assert (=> b!167728 d!58849))

(declare-fun d!58851 () Bool)

(declare-fun lt!261246 () (_ BitVec 32))

(assert (=> d!58851 (= lt!261246 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261249 () (_ BitVec 32))

(assert (=> d!58851 (= lt!261249 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!116423 () Bool)

(assert (=> d!58851 e!116423))

(declare-fun res!139700 () Bool)

(assert (=> d!58851 (=> (not res!139700) (not e!116423))))

(assert (=> d!58851 (= res!139700 (moveBitIndexPrecond!0 (_1!7906 lt!260830) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11670 () Unit!11662)

(declare-fun Unit!11671 () Unit!11662)

(declare-fun Unit!11672 () Unit!11662)

(assert (=> d!58851 (= (moveBitIndex!0 (_1!7906 lt!260830) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!8149 (_1!7906 lt!260830)) lt!261246) #b00000000000000000000000000000000) (tuple2!14631 Unit!11670 (BitStream!6871 (buf!4309 (_1!7906 lt!260830)) (bvsub (bvadd (currentByte!8154 (_1!7906 lt!260830)) lt!261249) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261246 (currentBit!8149 (_1!7906 lt!260830))))) (ite (bvsge (bvadd (currentBit!8149 (_1!7906 lt!260830)) lt!261246) #b00000000000000000000000000001000) (tuple2!14631 Unit!11671 (BitStream!6871 (buf!4309 (_1!7906 lt!260830)) (bvadd (currentByte!8154 (_1!7906 lt!260830)) lt!261249 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8149 (_1!7906 lt!260830)) lt!261246) #b00000000000000000000000000001000))) (tuple2!14631 Unit!11672 (BitStream!6871 (buf!4309 (_1!7906 lt!260830)) (bvadd (currentByte!8154 (_1!7906 lt!260830)) lt!261249) (bvadd (currentBit!8149 (_1!7906 lt!260830)) lt!261246))))))))

(declare-fun b!167782 () Bool)

(declare-fun e!116424 () Bool)

(assert (=> b!167782 (= e!116423 e!116424)))

(declare-fun res!139701 () Bool)

(assert (=> b!167782 (=> (not res!139701) (not e!116424))))

(declare-fun lt!261245 () tuple2!14630)

(declare-fun lt!261250 () (_ BitVec 64))

(assert (=> b!167782 (= res!139701 (= (bvadd lt!261250 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3857 (buf!4309 (_2!7914 lt!261245))) (currentByte!8154 (_2!7914 lt!261245)) (currentBit!8149 (_2!7914 lt!261245)))))))

(assert (=> b!167782 (or (not (= (bvand lt!261250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261250 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!167782 (= lt!261250 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!260830))) (currentByte!8154 (_1!7906 lt!260830)) (currentBit!8149 (_1!7906 lt!260830))))))

(declare-fun lt!261247 () (_ BitVec 32))

(declare-fun lt!261248 () (_ BitVec 32))

(declare-fun Unit!11673 () Unit!11662)

(declare-fun Unit!11674 () Unit!11662)

(declare-fun Unit!11675 () Unit!11662)

(assert (=> b!167782 (= lt!261245 (ite (bvslt (bvadd (currentBit!8149 (_1!7906 lt!260830)) lt!261248) #b00000000000000000000000000000000) (tuple2!14631 Unit!11673 (BitStream!6871 (buf!4309 (_1!7906 lt!260830)) (bvsub (bvadd (currentByte!8154 (_1!7906 lt!260830)) lt!261247) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261248 (currentBit!8149 (_1!7906 lt!260830))))) (ite (bvsge (bvadd (currentBit!8149 (_1!7906 lt!260830)) lt!261248) #b00000000000000000000000000001000) (tuple2!14631 Unit!11674 (BitStream!6871 (buf!4309 (_1!7906 lt!260830)) (bvadd (currentByte!8154 (_1!7906 lt!260830)) lt!261247 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8149 (_1!7906 lt!260830)) lt!261248) #b00000000000000000000000000001000))) (tuple2!14631 Unit!11675 (BitStream!6871 (buf!4309 (_1!7906 lt!260830)) (bvadd (currentByte!8154 (_1!7906 lt!260830)) lt!261247) (bvadd (currentBit!8149 (_1!7906 lt!260830)) lt!261248))))))))

(assert (=> b!167782 (= lt!261248 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167782 (= lt!261247 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!167783 () Bool)

(assert (=> b!167783 (= e!116424 (and (= (size!3857 (buf!4309 (_1!7906 lt!260830))) (size!3857 (buf!4309 (_2!7914 lt!261245)))) (= (buf!4309 (_1!7906 lt!260830)) (buf!4309 (_2!7914 lt!261245)))))))

(assert (= (and d!58851 res!139700) b!167782))

(assert (= (and b!167782 res!139701) b!167783))

(declare-fun m!267115 () Bool)

(assert (=> d!58851 m!267115))

(declare-fun m!267117 () Bool)

(assert (=> b!167782 m!267117))

(assert (=> b!167782 m!267051))

(assert (=> b!167742 d!58851))

(declare-fun d!58855 () Bool)

(assert (=> d!58855 (= (arrayBitIndices!0 lt!261062 lt!261064) (tuple4!247 ((_ extract 31 0) (bvadd (bvsdiv lt!261062 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!261062 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!261064 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!261062 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!261064 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!167733 d!58855))

(declare-fun d!58857 () Bool)

(declare-fun e!116425 () Bool)

(assert (=> d!58857 e!116425))

(declare-fun res!139702 () Bool)

(assert (=> d!58857 (=> (not res!139702) (not e!116425))))

(declare-fun lt!261252 () (_ BitVec 64))

(declare-fun lt!261255 () (_ BitVec 64))

(declare-fun lt!261253 () (_ BitVec 64))

(assert (=> d!58857 (= res!139702 (= lt!261252 (bvsub lt!261255 lt!261253)))))

(assert (=> d!58857 (or (= (bvand lt!261255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261255 lt!261253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58857 (= lt!261253 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7910 lt!261205)))) ((_ sign_extend 32) (currentByte!8154 (_2!7910 lt!261205))) ((_ sign_extend 32) (currentBit!8149 (_2!7910 lt!261205)))))))

(declare-fun lt!261251 () (_ BitVec 64))

(declare-fun lt!261254 () (_ BitVec 64))

(assert (=> d!58857 (= lt!261255 (bvmul lt!261251 lt!261254))))

(assert (=> d!58857 (or (= lt!261251 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261254 (bvsdiv (bvmul lt!261251 lt!261254) lt!261251)))))

(assert (=> d!58857 (= lt!261254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58857 (= lt!261251 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7910 lt!261205)))))))

(assert (=> d!58857 (= lt!261252 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 (_2!7910 lt!261205))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 (_2!7910 lt!261205)))))))

(assert (=> d!58857 (invariant!0 (currentBit!8149 (_2!7910 lt!261205)) (currentByte!8154 (_2!7910 lt!261205)) (size!3857 (buf!4309 (_2!7910 lt!261205))))))

(assert (=> d!58857 (= (bitIndex!0 (size!3857 (buf!4309 (_2!7910 lt!261205))) (currentByte!8154 (_2!7910 lt!261205)) (currentBit!8149 (_2!7910 lt!261205))) lt!261252)))

(declare-fun b!167784 () Bool)

(declare-fun res!139703 () Bool)

(assert (=> b!167784 (=> (not res!139703) (not e!116425))))

(assert (=> b!167784 (= res!139703 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261252))))

(declare-fun b!167785 () Bool)

(declare-fun lt!261256 () (_ BitVec 64))

(assert (=> b!167785 (= e!116425 (bvsle lt!261252 (bvmul lt!261256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167785 (or (= lt!261256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261256)))))

(assert (=> b!167785 (= lt!261256 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7910 lt!261205)))))))

(assert (= (and d!58857 res!139702) b!167784))

(assert (= (and b!167784 res!139703) b!167785))

(declare-fun m!267119 () Bool)

(assert (=> d!58857 m!267119))

(declare-fun m!267121 () Bool)

(assert (=> d!58857 m!267121))

(assert (=> b!167744 d!58857))

(declare-fun d!58859 () Bool)

(declare-fun e!116426 () Bool)

(assert (=> d!58859 e!116426))

(declare-fun res!139704 () Bool)

(assert (=> d!58859 (=> (not res!139704) (not e!116426))))

(declare-fun lt!261258 () (_ BitVec 64))

(declare-fun lt!261259 () (_ BitVec 64))

(declare-fun lt!261261 () (_ BitVec 64))

(assert (=> d!58859 (= res!139704 (= lt!261258 (bvsub lt!261261 lt!261259)))))

(assert (=> d!58859 (or (= (bvand lt!261261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261261 lt!261259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58859 (= lt!261259 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 (_1!7906 lt!260830)))) ((_ sign_extend 32) (currentByte!8154 (_1!7906 lt!260830))) ((_ sign_extend 32) (currentBit!8149 (_1!7906 lt!260830)))))))

(declare-fun lt!261257 () (_ BitVec 64))

(declare-fun lt!261260 () (_ BitVec 64))

(assert (=> d!58859 (= lt!261261 (bvmul lt!261257 lt!261260))))

(assert (=> d!58859 (or (= lt!261257 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261260 (bvsdiv (bvmul lt!261257 lt!261260) lt!261257)))))

(assert (=> d!58859 (= lt!261260 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58859 (= lt!261257 ((_ sign_extend 32) (size!3857 (buf!4309 (_1!7906 lt!260830)))))))

(assert (=> d!58859 (= lt!261258 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 (_1!7906 lt!260830))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 (_1!7906 lt!260830)))))))

(assert (=> d!58859 (invariant!0 (currentBit!8149 (_1!7906 lt!260830)) (currentByte!8154 (_1!7906 lt!260830)) (size!3857 (buf!4309 (_1!7906 lt!260830))))))

(assert (=> d!58859 (= (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!260830))) (currentByte!8154 (_1!7906 lt!260830)) (currentBit!8149 (_1!7906 lt!260830))) lt!261258)))

(declare-fun b!167786 () Bool)

(declare-fun res!139705 () Bool)

(assert (=> b!167786 (=> (not res!139705) (not e!116426))))

(assert (=> b!167786 (= res!139705 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261258))))

(declare-fun b!167787 () Bool)

(declare-fun lt!261262 () (_ BitVec 64))

(assert (=> b!167787 (= e!116426 (bvsle lt!261258 (bvmul lt!261262 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167787 (or (= lt!261262 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261262 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261262)))))

(assert (=> b!167787 (= lt!261262 ((_ sign_extend 32) (size!3857 (buf!4309 (_1!7906 lt!260830)))))))

(assert (= (and d!58859 res!139704) b!167786))

(assert (= (and b!167786 res!139705) b!167787))

(declare-fun m!267123 () Bool)

(assert (=> d!58859 m!267123))

(declare-fun m!267125 () Bool)

(assert (=> d!58859 m!267125))

(assert (=> b!167744 d!58859))

(declare-fun d!58861 () Bool)

(assert (=> d!58861 (= (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261187)) (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261187)) #b00000000000000000000000000000000 lt!261186) (or (= #b00000000000000000000000000000000 lt!261186) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261187))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261186))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261187))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261186))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14599 () Bool)

(assert (= bs!14599 d!58861))

(declare-fun m!267127 () Bool)

(assert (=> bs!14599 m!267127))

(assert (=> bs!14599 m!266805))

(assert (=> b!167735 d!58861))

(declare-fun d!58863 () Bool)

(assert (=> d!58863 (= (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 lt!260836))) ((_ sign_extend 32) (currentByte!8154 lt!260836)) ((_ sign_extend 32) (currentBit!8149 lt!260836))) (bvsub (bvmul ((_ sign_extend 32) (size!3857 (buf!4309 lt!260836))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 lt!260836)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 lt!260836)))))))

(assert (=> d!58791 d!58863))

(declare-fun d!58865 () Bool)

(assert (=> d!58865 (= (invariant!0 (currentBit!8149 lt!260836) (currentByte!8154 lt!260836) (size!3857 (buf!4309 lt!260836))) (and (bvsge (currentBit!8149 lt!260836) #b00000000000000000000000000000000) (bvslt (currentBit!8149 lt!260836) #b00000000000000000000000000001000) (bvsge (currentByte!8154 lt!260836) #b00000000000000000000000000000000) (or (bvslt (currentByte!8154 lt!260836) (size!3857 (buf!4309 lt!260836))) (and (= (currentBit!8149 lt!260836) #b00000000000000000000000000000000) (= (currentByte!8154 lt!260836) (size!3857 (buf!4309 lt!260836)))))))))

(assert (=> d!58791 d!58865))

(declare-fun b!167788 () Bool)

(declare-fun res!139709 () Bool)

(declare-fun lt!261264 () (_ BitVec 32))

(assert (=> b!167788 (= res!139709 (= lt!261264 #b00000000000000000000000000000000))))

(declare-fun e!116430 () Bool)

(assert (=> b!167788 (=> res!139709 e!116430)))

(declare-fun e!116427 () Bool)

(assert (=> b!167788 (= e!116427 e!116430)))

(declare-fun lt!261265 () tuple4!246)

(declare-fun call!2813 () Bool)

(declare-fun lt!261263 () (_ BitVec 32))

(declare-fun c!8654 () Bool)

(declare-fun bm!2810 () Bool)

(assert (=> bm!2810 (= call!2813 (byteRangesEq!0 (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261265)) (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261265)) lt!261263 (ite c!8654 lt!261264 #b00000000000000000000000000001000)))))

(declare-fun b!167789 () Bool)

(declare-fun e!116432 () Bool)

(assert (=> b!167789 (= e!116432 call!2813)))

(declare-fun b!167790 () Bool)

(declare-fun e!116429 () Bool)

(assert (=> b!167790 (= e!116429 (arrayRangesEq!686 (buf!4309 thiss!1577) (buf!4309 thiss!1577) (_1!7912 lt!261265) (_2!7912 lt!261265)))))

(declare-fun d!58867 () Bool)

(declare-fun res!139707 () Bool)

(declare-fun e!116431 () Bool)

(assert (=> d!58867 (=> res!139707 e!116431)))

(assert (=> d!58867 (= res!139707 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(assert (=> d!58867 (= (arrayBitRangesEq!0 (buf!4309 thiss!1577) (buf!4309 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))) e!116431)))

(declare-fun b!167791 () Bool)

(declare-fun e!116428 () Bool)

(assert (=> b!167791 (= e!116428 e!116432)))

(assert (=> b!167791 (= c!8654 (= (_3!597 lt!261265) (_4!123 lt!261265)))))

(declare-fun b!167792 () Bool)

(assert (=> b!167792 (= e!116431 e!116428)))

(declare-fun res!139710 () Bool)

(assert (=> b!167792 (=> (not res!139710) (not e!116428))))

(assert (=> b!167792 (= res!139710 e!116429)))

(declare-fun res!139706 () Bool)

(assert (=> b!167792 (=> res!139706 e!116429)))

(assert (=> b!167792 (= res!139706 (bvsge (_1!7912 lt!261265) (_2!7912 lt!261265)))))

(assert (=> b!167792 (= lt!261264 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167792 (= lt!261263 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167792 (= lt!261265 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(declare-fun b!167793 () Bool)

(assert (=> b!167793 (= e!116432 e!116427)))

(declare-fun res!139708 () Bool)

(assert (=> b!167793 (= res!139708 call!2813)))

(assert (=> b!167793 (=> (not res!139708) (not e!116427))))

(declare-fun b!167794 () Bool)

(assert (=> b!167794 (= e!116430 (byteRangesEq!0 (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261265)) (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261265)) #b00000000000000000000000000000000 lt!261264))))

(assert (= (and d!58867 (not res!139707)) b!167792))

(assert (= (and b!167792 (not res!139706)) b!167790))

(assert (= (and b!167792 res!139710) b!167791))

(assert (= (and b!167791 c!8654) b!167789))

(assert (= (and b!167791 (not c!8654)) b!167793))

(assert (= (and b!167793 res!139708) b!167788))

(assert (= (and b!167788 (not res!139709)) b!167794))

(assert (= (or b!167789 b!167793) bm!2810))

(declare-fun m!267129 () Bool)

(assert (=> bm!2810 m!267129))

(assert (=> bm!2810 m!267129))

(assert (=> bm!2810 m!267129))

(assert (=> bm!2810 m!267129))

(declare-fun m!267131 () Bool)

(assert (=> bm!2810 m!267131))

(declare-fun m!267133 () Bool)

(assert (=> b!167790 m!267133))

(assert (=> b!167792 m!266719))

(assert (=> b!167792 m!267013))

(declare-fun m!267135 () Bool)

(assert (=> b!167794 m!267135))

(assert (=> b!167794 m!267135))

(assert (=> b!167794 m!267135))

(assert (=> b!167794 m!267135))

(declare-fun m!267137 () Bool)

(assert (=> b!167794 m!267137))

(assert (=> b!167762 d!58867))

(assert (=> b!167762 d!58781))

(assert (=> b!167757 d!58791))

(assert (=> d!58811 d!58723))

(declare-fun b!167795 () Bool)

(declare-fun res!139714 () Bool)

(declare-fun lt!261267 () (_ BitVec 32))

(assert (=> b!167795 (= res!139714 (= lt!261267 #b00000000000000000000000000000000))))

(declare-fun e!116436 () Bool)

(assert (=> b!167795 (=> res!139714 e!116436)))

(declare-fun e!116433 () Bool)

(assert (=> b!167795 (= e!116433 e!116436)))

(declare-fun call!2814 () Bool)

(declare-fun lt!261266 () (_ BitVec 32))

(declare-fun bm!2811 () Bool)

(declare-fun lt!261268 () tuple4!246)

(declare-fun c!8655 () Bool)

(assert (=> bm!2811 (= call!2814 (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261268)) (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261268)) lt!261266 (ite c!8655 lt!261267 #b00000000000000000000000000001000)))))

(declare-fun b!167796 () Bool)

(declare-fun e!116438 () Bool)

(assert (=> b!167796 (= e!116438 call!2814)))

(declare-fun b!167797 () Bool)

(declare-fun e!116435 () Bool)

(assert (=> b!167797 (= e!116435 (arrayRangesEq!686 (buf!4309 lt!260836) (buf!4309 lt!260836) (_1!7912 lt!261268) (_2!7912 lt!261268)))))

(declare-fun d!58869 () Bool)

(declare-fun res!139712 () Bool)

(declare-fun e!116437 () Bool)

(assert (=> d!58869 (=> res!139712 e!116437)))

(assert (=> d!58869 (= res!139712 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836))))))

(assert (=> d!58869 (= (arrayBitRangesEq!0 (buf!4309 lt!260836) (buf!4309 lt!260836) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836))) e!116437)))

(declare-fun b!167798 () Bool)

(declare-fun e!116434 () Bool)

(assert (=> b!167798 (= e!116434 e!116438)))

(assert (=> b!167798 (= c!8655 (= (_3!597 lt!261268) (_4!123 lt!261268)))))

(declare-fun b!167799 () Bool)

(assert (=> b!167799 (= e!116437 e!116434)))

(declare-fun res!139715 () Bool)

(assert (=> b!167799 (=> (not res!139715) (not e!116434))))

(assert (=> b!167799 (= res!139715 e!116435)))

(declare-fun res!139711 () Bool)

(assert (=> b!167799 (=> res!139711 e!116435)))

(assert (=> b!167799 (= res!139711 (bvsge (_1!7912 lt!261268) (_2!7912 lt!261268)))))

(assert (=> b!167799 (= lt!261267 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167799 (= lt!261266 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167799 (= lt!261268 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!260836)) (currentByte!8154 lt!260836) (currentBit!8149 lt!260836))))))

(declare-fun b!167800 () Bool)

(assert (=> b!167800 (= e!116438 e!116433)))

(declare-fun res!139713 () Bool)

(assert (=> b!167800 (= res!139713 call!2814)))

(assert (=> b!167800 (=> (not res!139713) (not e!116433))))

(declare-fun b!167801 () Bool)

(assert (=> b!167801 (= e!116436 (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261268)) (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261268)) #b00000000000000000000000000000000 lt!261267))))

(assert (= (and d!58869 (not res!139712)) b!167799))

(assert (= (and b!167799 (not res!139711)) b!167797))

(assert (= (and b!167799 res!139715) b!167798))

(assert (= (and b!167798 c!8655) b!167796))

(assert (= (and b!167798 (not c!8655)) b!167800))

(assert (= (and b!167800 res!139713) b!167795))

(assert (= (and b!167795 (not res!139714)) b!167801))

(assert (= (or b!167796 b!167800) bm!2811))

(declare-fun m!267139 () Bool)

(assert (=> bm!2811 m!267139))

(assert (=> bm!2811 m!267139))

(assert (=> bm!2811 m!267139))

(assert (=> bm!2811 m!267139))

(declare-fun m!267141 () Bool)

(assert (=> bm!2811 m!267141))

(declare-fun m!267143 () Bool)

(assert (=> b!167797 m!267143))

(assert (=> b!167799 m!266941))

(declare-fun m!267145 () Bool)

(assert (=> b!167799 m!267145))

(declare-fun m!267147 () Bool)

(assert (=> b!167801 m!267147))

(assert (=> b!167801 m!267147))

(assert (=> b!167801 m!267147))

(assert (=> b!167801 m!267147))

(declare-fun m!267149 () Bool)

(assert (=> b!167801 m!267149))

(assert (=> b!167759 d!58869))

(assert (=> b!167759 d!58791))

(assert (=> d!58825 d!58837))

(declare-fun d!58871 () Bool)

(assert (=> d!58871 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!58871 true))

(declare-fun _$14!307 () Unit!11662)

(assert (=> d!58871 (= (choose!11 thiss!1577) _$14!307)))

(declare-fun bs!14601 () Bool)

(assert (= bs!14601 d!58871))

(assert (=> bs!14601 m!266919))

(assert (=> d!58825 d!58871))

(declare-fun d!58873 () Bool)

(declare-fun e!116439 () Bool)

(assert (=> d!58873 e!116439))

(declare-fun res!139716 () Bool)

(assert (=> d!58873 (=> (not res!139716) (not e!116439))))

(declare-fun lt!261270 () (_ BitVec 64))

(declare-fun lt!261271 () (_ BitVec 64))

(declare-fun lt!261273 () (_ BitVec 64))

(assert (=> d!58873 (= res!139716 (= lt!261270 (bvsub lt!261273 lt!261271)))))

(assert (=> d!58873 (or (= (bvand lt!261273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261271 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261273 lt!261271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58873 (= lt!261271 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 (_1!7906 lt!261068)))) ((_ sign_extend 32) (currentByte!8154 (_1!7906 lt!261068))) ((_ sign_extend 32) (currentBit!8149 (_1!7906 lt!261068)))))))

(declare-fun lt!261269 () (_ BitVec 64))

(declare-fun lt!261272 () (_ BitVec 64))

(assert (=> d!58873 (= lt!261273 (bvmul lt!261269 lt!261272))))

(assert (=> d!58873 (or (= lt!261269 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261272 (bvsdiv (bvmul lt!261269 lt!261272) lt!261269)))))

(assert (=> d!58873 (= lt!261272 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58873 (= lt!261269 ((_ sign_extend 32) (size!3857 (buf!4309 (_1!7906 lt!261068)))))))

(assert (=> d!58873 (= lt!261270 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 (_1!7906 lt!261068))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 (_1!7906 lt!261068)))))))

(assert (=> d!58873 (invariant!0 (currentBit!8149 (_1!7906 lt!261068)) (currentByte!8154 (_1!7906 lt!261068)) (size!3857 (buf!4309 (_1!7906 lt!261068))))))

(assert (=> d!58873 (= (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068))) lt!261270)))

(declare-fun b!167802 () Bool)

(declare-fun res!139717 () Bool)

(assert (=> b!167802 (=> (not res!139717) (not e!116439))))

(assert (=> b!167802 (= res!139717 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261270))))

(declare-fun b!167803 () Bool)

(declare-fun lt!261274 () (_ BitVec 64))

(assert (=> b!167803 (= e!116439 (bvsle lt!261270 (bvmul lt!261274 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167803 (or (= lt!261274 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261274 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261274)))))

(assert (=> b!167803 (= lt!261274 ((_ sign_extend 32) (size!3857 (buf!4309 (_1!7906 lt!261068)))))))

(assert (= (and d!58873 res!139716) b!167802))

(assert (= (and b!167802 res!139717) b!167803))

(declare-fun m!267151 () Bool)

(assert (=> d!58873 m!267151))

(declare-fun m!267153 () Bool)

(assert (=> d!58873 m!267153))

(assert (=> b!167702 d!58873))

(assert (=> b!167702 d!58781))

(assert (=> b!167748 d!58873))

(assert (=> b!167748 d!58849))

(declare-fun d!58875 () Bool)

(declare-fun res!139718 () Bool)

(declare-fun e!116440 () Bool)

(assert (=> d!58875 (=> res!139718 e!116440)))

(assert (=> d!58875 (= res!139718 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (=> d!58875 (= (arrayRangesEq!686 lt!260829 lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) e!116440)))

(declare-fun b!167804 () Bool)

(declare-fun e!116441 () Bool)

(assert (=> b!167804 (= e!116440 e!116441)))

(declare-fun res!139719 () Bool)

(assert (=> b!167804 (=> (not res!139719) (not e!116441))))

(assert (=> b!167804 (= res!139719 (= (select (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4778 lt!260839) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!167805 () Bool)

(assert (=> b!167805 (= e!116441 (arrayRangesEq!686 lt!260829 lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (= (and d!58875 (not res!139718)) b!167804))

(assert (= (and b!167804 res!139719) b!167805))

(declare-fun m!267155 () Bool)

(assert (=> b!167804 m!267155))

(declare-fun m!267157 () Bool)

(assert (=> b!167804 m!267157))

(declare-fun m!267159 () Bool)

(assert (=> b!167805 m!267159))

(assert (=> b!167764 d!58875))

(declare-fun d!58877 () Bool)

(assert (=> d!58877 (= (byteRangesEq!0 (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261181)) (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261181)) #b00000000000000000000000000000000 lt!261180) (or (= #b00000000000000000000000000000000 lt!261180) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261181))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261180))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261181))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261180))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14602 () Bool)

(assert (= bs!14602 d!58877))

(declare-fun m!267161 () Bool)

(assert (=> bs!14602 m!267161))

(assert (=> bs!14602 m!266805))

(assert (=> b!167725 d!58877))

(declare-fun d!58879 () Bool)

(assert (=> d!58879 (= (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261187)) (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261187)) lt!261185 (ite c!8649 lt!261186 #b00000000000000000000000000001000)) (or (= lt!261185 (ite c!8649 lt!261186 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261187))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8649 lt!261186 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261185)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261187))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8649 lt!261186 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261185)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14603 () Bool)

(assert (= bs!14603 d!58879))

(declare-fun m!267163 () Bool)

(assert (=> bs!14603 m!267163))

(declare-fun m!267165 () Bool)

(assert (=> bs!14603 m!267165))

(assert (=> bm!2808 d!58879))

(declare-fun d!58881 () Bool)

(declare-fun res!139720 () Bool)

(declare-fun e!116442 () Bool)

(assert (=> d!58881 (=> res!139720 e!116442)))

(assert (=> d!58881 (= res!139720 (= (_1!7912 lt!261187) (_2!7912 lt!261187)))))

(assert (=> d!58881 (= (arrayRangesEq!686 (buf!4309 lt!260836) (buf!4309 thiss!1577) (_1!7912 lt!261187) (_2!7912 lt!261187)) e!116442)))

(declare-fun b!167806 () Bool)

(declare-fun e!116443 () Bool)

(assert (=> b!167806 (= e!116442 e!116443)))

(declare-fun res!139721 () Bool)

(assert (=> b!167806 (=> (not res!139721) (not e!116443))))

(assert (=> b!167806 (= res!139721 (= (select (arr!4778 (buf!4309 lt!260836)) (_1!7912 lt!261187)) (select (arr!4778 (buf!4309 thiss!1577)) (_1!7912 lt!261187))))))

(declare-fun b!167807 () Bool)

(assert (=> b!167807 (= e!116443 (arrayRangesEq!686 (buf!4309 lt!260836) (buf!4309 thiss!1577) (bvadd (_1!7912 lt!261187) #b00000000000000000000000000000001) (_2!7912 lt!261187)))))

(assert (= (and d!58881 (not res!139720)) b!167806))

(assert (= (and b!167806 res!139721) b!167807))

(declare-fun m!267167 () Bool)

(assert (=> b!167806 m!267167))

(declare-fun m!267169 () Bool)

(assert (=> b!167806 m!267169))

(declare-fun m!267171 () Bool)

(assert (=> b!167807 m!267171))

(assert (=> b!167731 d!58881))

(assert (=> d!58829 d!58823))

(declare-fun d!58883 () Bool)

(assert (=> d!58883 (isPrefixOf!0 lt!261063 lt!260836)))

(assert (=> d!58883 true))

(declare-fun _$15!276 () Unit!11662)

(assert (=> d!58883 (= (choose!30 lt!261063 thiss!1577 lt!260836) _$15!276)))

(declare-fun bs!14604 () Bool)

(assert (= bs!14604 d!58883))

(assert (=> bs!14604 m!266925))

(assert (=> d!58829 d!58883))

(declare-fun d!58885 () Bool)

(declare-fun res!139724 () Bool)

(declare-fun e!116444 () Bool)

(assert (=> d!58885 (=> (not res!139724) (not e!116444))))

(assert (=> d!58885 (= res!139724 (= (size!3857 (buf!4309 lt!261063)) (size!3857 (buf!4309 thiss!1577))))))

(assert (=> d!58885 (= (isPrefixOf!0 lt!261063 thiss!1577) e!116444)))

(declare-fun b!167808 () Bool)

(declare-fun res!139723 () Bool)

(assert (=> b!167808 (=> (not res!139723) (not e!116444))))

(assert (=> b!167808 (= res!139723 (bvsle (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063)) (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))))))

(declare-fun b!167809 () Bool)

(declare-fun e!116445 () Bool)

(assert (=> b!167809 (= e!116444 e!116445)))

(declare-fun res!139722 () Bool)

(assert (=> b!167809 (=> res!139722 e!116445)))

(assert (=> b!167809 (= res!139722 (= (size!3857 (buf!4309 lt!261063)) #b00000000000000000000000000000000))))

(declare-fun b!167810 () Bool)

(assert (=> b!167810 (= e!116445 (arrayBitRangesEq!0 (buf!4309 lt!261063) (buf!4309 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))))))

(assert (= (and d!58885 res!139724) b!167808))

(assert (= (and b!167808 res!139723) b!167809))

(assert (= (and b!167809 (not res!139722)) b!167810))

(assert (=> b!167808 m!267061))

(assert (=> b!167808 m!266719))

(assert (=> b!167810 m!267061))

(assert (=> b!167810 m!267061))

(declare-fun m!267173 () Bool)

(assert (=> b!167810 m!267173))

(assert (=> d!58829 d!58885))

(declare-fun b!167811 () Bool)

(declare-fun res!139728 () Bool)

(declare-fun lt!261276 () (_ BitVec 32))

(assert (=> b!167811 (= res!139728 (= lt!261276 #b00000000000000000000000000000000))))

(declare-fun e!116449 () Bool)

(assert (=> b!167811 (=> res!139728 e!116449)))

(declare-fun e!116446 () Bool)

(assert (=> b!167811 (= e!116446 e!116449)))

(declare-fun lt!261277 () tuple4!246)

(declare-fun lt!261275 () (_ BitVec 32))

(declare-fun call!2815 () Bool)

(declare-fun bm!2812 () Bool)

(declare-fun c!8656 () Bool)

(assert (=> bm!2812 (= call!2815 (byteRangesEq!0 (select (arr!4778 (buf!4309 (_1!7906 lt!261068))) (_3!597 lt!261277)) (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261277)) lt!261275 (ite c!8656 lt!261276 #b00000000000000000000000000001000)))))

(declare-fun b!167812 () Bool)

(declare-fun e!116451 () Bool)

(assert (=> b!167812 (= e!116451 call!2815)))

(declare-fun b!167813 () Bool)

(declare-fun e!116448 () Bool)

(assert (=> b!167813 (= e!116448 (arrayRangesEq!686 (buf!4309 (_1!7906 lt!261068)) (buf!4309 thiss!1577) (_1!7912 lt!261277) (_2!7912 lt!261277)))))

(declare-fun d!58887 () Bool)

(declare-fun res!139726 () Bool)

(declare-fun e!116450 () Bool)

(assert (=> d!58887 (=> res!139726 e!116450)))

(assert (=> d!58887 (= res!139726 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068)))))))

(assert (=> d!58887 (= (arrayBitRangesEq!0 (buf!4309 (_1!7906 lt!261068)) (buf!4309 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068)))) e!116450)))

(declare-fun b!167814 () Bool)

(declare-fun e!116447 () Bool)

(assert (=> b!167814 (= e!116447 e!116451)))

(assert (=> b!167814 (= c!8656 (= (_3!597 lt!261277) (_4!123 lt!261277)))))

(declare-fun b!167815 () Bool)

(assert (=> b!167815 (= e!116450 e!116447)))

(declare-fun res!139729 () Bool)

(assert (=> b!167815 (=> (not res!139729) (not e!116447))))

(assert (=> b!167815 (= res!139729 e!116448)))

(declare-fun res!139725 () Bool)

(assert (=> b!167815 (=> res!139725 e!116448)))

(assert (=> b!167815 (= res!139725 (bvsge (_1!7912 lt!261277) (_2!7912 lt!261277)))))

(assert (=> b!167815 (= lt!261276 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167815 (= lt!261275 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167815 (= lt!261277 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068)))))))

(declare-fun b!167816 () Bool)

(assert (=> b!167816 (= e!116451 e!116446)))

(declare-fun res!139727 () Bool)

(assert (=> b!167816 (= res!139727 call!2815)))

(assert (=> b!167816 (=> (not res!139727) (not e!116446))))

(declare-fun b!167817 () Bool)

(assert (=> b!167817 (= e!116449 (byteRangesEq!0 (select (arr!4778 (buf!4309 (_1!7906 lt!261068))) (_4!123 lt!261277)) (select (arr!4778 (buf!4309 thiss!1577)) (_4!123 lt!261277)) #b00000000000000000000000000000000 lt!261276))))

(assert (= (and d!58887 (not res!139726)) b!167815))

(assert (= (and b!167815 (not res!139725)) b!167813))

(assert (= (and b!167815 res!139729) b!167814))

(assert (= (and b!167814 c!8656) b!167812))

(assert (= (and b!167814 (not c!8656)) b!167816))

(assert (= (and b!167816 res!139727) b!167811))

(assert (= (and b!167811 (not res!139728)) b!167817))

(assert (= (or b!167812 b!167816) bm!2812))

(declare-fun m!267175 () Bool)

(assert (=> bm!2812 m!267175))

(declare-fun m!267177 () Bool)

(assert (=> bm!2812 m!267177))

(assert (=> bm!2812 m!267175))

(assert (=> bm!2812 m!267177))

(declare-fun m!267179 () Bool)

(assert (=> bm!2812 m!267179))

(declare-fun m!267181 () Bool)

(assert (=> b!167813 m!267181))

(assert (=> b!167815 m!267001))

(declare-fun m!267183 () Bool)

(assert (=> b!167815 m!267183))

(declare-fun m!267185 () Bool)

(assert (=> b!167817 m!267185))

(declare-fun m!267187 () Bool)

(assert (=> b!167817 m!267187))

(assert (=> b!167817 m!267185))

(assert (=> b!167817 m!267187))

(declare-fun m!267189 () Bool)

(assert (=> b!167817 m!267189))

(assert (=> b!167704 d!58887))

(assert (=> b!167704 d!58873))

(assert (=> b!167760 d!58781))

(declare-fun d!58889 () Bool)

(declare-fun res!139730 () Bool)

(declare-fun e!116452 () Bool)

(assert (=> d!58889 (=> res!139730 e!116452)))

(assert (=> d!58889 (= res!139730 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (=> d!58889 (= (arrayRangesEq!686 lt!260829 (array!8687 (store (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 lt!260829)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))) e!116452)))

(declare-fun b!167818 () Bool)

(declare-fun e!116453 () Bool)

(assert (=> b!167818 (= e!116452 e!116453)))

(declare-fun res!139731 () Bool)

(assert (=> b!167818 (=> (not res!139731) (not e!116453))))

(assert (=> b!167818 (= res!139731 (= (select (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4778 (array!8687 (store (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 lt!260829))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167819 () Bool)

(assert (=> b!167819 (= e!116453 (arrayRangesEq!686 lt!260829 (array!8687 (store (arr!4778 lt!260829) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577)) lt!260834) (size!3857 lt!260829)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8154 thiss!1577))))))

(assert (= (and d!58889 (not res!139730)) b!167818))

(assert (= (and b!167818 res!139731) b!167819))

(assert (=> b!167818 m!267083))

(declare-fun m!267191 () Bool)

(assert (=> b!167818 m!267191))

(declare-fun m!267193 () Bool)

(assert (=> b!167819 m!267193))

(assert (=> b!167768 d!58889))

(declare-fun b!167820 () Bool)

(declare-fun res!139735 () Bool)

(declare-fun lt!261279 () (_ BitVec 32))

(assert (=> b!167820 (= res!139735 (= lt!261279 #b00000000000000000000000000000000))))

(declare-fun e!116457 () Bool)

(assert (=> b!167820 (=> res!139735 e!116457)))

(declare-fun e!116454 () Bool)

(assert (=> b!167820 (= e!116454 e!116457)))

(declare-fun lt!261278 () (_ BitVec 32))

(declare-fun bm!2813 () Bool)

(declare-fun call!2816 () Bool)

(declare-fun lt!261280 () tuple4!246)

(declare-fun c!8657 () Bool)

(assert (=> bm!2813 (= call!2816 (byteRangesEq!0 (select (arr!4778 (buf!4309 (_1!7906 lt!261068))) (_3!597 lt!261280)) (select (arr!4778 (buf!4309 (_2!7906 lt!261068))) (_3!597 lt!261280)) lt!261278 (ite c!8657 lt!261279 #b00000000000000000000000000001000)))))

(declare-fun b!167821 () Bool)

(declare-fun e!116459 () Bool)

(assert (=> b!167821 (= e!116459 call!2816)))

(declare-fun b!167822 () Bool)

(declare-fun e!116456 () Bool)

(assert (=> b!167822 (= e!116456 (arrayRangesEq!686 (buf!4309 (_1!7906 lt!261068)) (buf!4309 (_2!7906 lt!261068)) (_1!7912 lt!261280) (_2!7912 lt!261280)))))

(declare-fun d!58891 () Bool)

(declare-fun res!139733 () Bool)

(declare-fun e!116458 () Bool)

(assert (=> d!58891 (=> res!139733 e!116458)))

(assert (=> d!58891 (= res!139733 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068)))))))

(assert (=> d!58891 (= (arrayBitRangesEq!0 (buf!4309 (_1!7906 lt!261068)) (buf!4309 (_2!7906 lt!261068)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068)))) e!116458)))

(declare-fun b!167823 () Bool)

(declare-fun e!116455 () Bool)

(assert (=> b!167823 (= e!116455 e!116459)))

(assert (=> b!167823 (= c!8657 (= (_3!597 lt!261280) (_4!123 lt!261280)))))

(declare-fun b!167824 () Bool)

(assert (=> b!167824 (= e!116458 e!116455)))

(declare-fun res!139736 () Bool)

(assert (=> b!167824 (=> (not res!139736) (not e!116455))))

(assert (=> b!167824 (= res!139736 e!116456)))

(declare-fun res!139732 () Bool)

(assert (=> b!167824 (=> res!139732 e!116456)))

(assert (=> b!167824 (= res!139732 (bvsge (_1!7912 lt!261280) (_2!7912 lt!261280)))))

(assert (=> b!167824 (= lt!261279 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167824 (= lt!261278 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167824 (= lt!261280 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 (_1!7906 lt!261068))) (currentByte!8154 (_1!7906 lt!261068)) (currentBit!8149 (_1!7906 lt!261068)))))))

(declare-fun b!167825 () Bool)

(assert (=> b!167825 (= e!116459 e!116454)))

(declare-fun res!139734 () Bool)

(assert (=> b!167825 (= res!139734 call!2816)))

(assert (=> b!167825 (=> (not res!139734) (not e!116454))))

(declare-fun b!167826 () Bool)

(assert (=> b!167826 (= e!116457 (byteRangesEq!0 (select (arr!4778 (buf!4309 (_1!7906 lt!261068))) (_4!123 lt!261280)) (select (arr!4778 (buf!4309 (_2!7906 lt!261068))) (_4!123 lt!261280)) #b00000000000000000000000000000000 lt!261279))))

(assert (= (and d!58891 (not res!139733)) b!167824))

(assert (= (and b!167824 (not res!139732)) b!167822))

(assert (= (and b!167824 res!139736) b!167823))

(assert (= (and b!167823 c!8657) b!167821))

(assert (= (and b!167823 (not c!8657)) b!167825))

(assert (= (and b!167825 res!139734) b!167820))

(assert (= (and b!167820 (not res!139735)) b!167826))

(assert (= (or b!167821 b!167825) bm!2813))

(declare-fun m!267195 () Bool)

(assert (=> bm!2813 m!267195))

(declare-fun m!267197 () Bool)

(assert (=> bm!2813 m!267197))

(assert (=> bm!2813 m!267195))

(assert (=> bm!2813 m!267197))

(declare-fun m!267199 () Bool)

(assert (=> bm!2813 m!267199))

(declare-fun m!267201 () Bool)

(assert (=> b!167822 m!267201))

(assert (=> b!167824 m!267001))

(assert (=> b!167824 m!267183))

(declare-fun m!267203 () Bool)

(assert (=> b!167826 m!267203))

(declare-fun m!267205 () Bool)

(assert (=> b!167826 m!267205))

(assert (=> b!167826 m!267203))

(assert (=> b!167826 m!267205))

(declare-fun m!267207 () Bool)

(assert (=> b!167826 m!267207))

(assert (=> b!167750 d!58891))

(assert (=> b!167750 d!58873))

(assert (=> b!167726 d!58849))

(assert (=> b!167726 d!58791))

(declare-fun d!58893 () Bool)

(assert (=> d!58893 (= (byteRangesEq!0 (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261181)) (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261181)) lt!261179 (ite c!8648 lt!261180 #b00000000000000000000000000001000)) (or (= lt!261179 (ite c!8648 lt!261180 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 thiss!1577)) (_3!597 lt!261181))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8648 lt!261180 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261179)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261181))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8648 lt!261180 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261179)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14605 () Bool)

(assert (= bs!14605 d!58893))

(declare-fun m!267209 () Bool)

(assert (=> bs!14605 m!267209))

(declare-fun m!267211 () Bool)

(assert (=> bs!14605 m!267211))

(assert (=> bm!2807 d!58893))

(declare-fun b!167827 () Bool)

(declare-fun res!139740 () Bool)

(declare-fun lt!261282 () (_ BitVec 32))

(assert (=> b!167827 (= res!139740 (= lt!261282 #b00000000000000000000000000000000))))

(declare-fun e!116463 () Bool)

(assert (=> b!167827 (=> res!139740 e!116463)))

(declare-fun e!116460 () Bool)

(assert (=> b!167827 (= e!116460 e!116463)))

(declare-fun lt!261281 () (_ BitVec 32))

(declare-fun call!2817 () Bool)

(declare-fun c!8658 () Bool)

(declare-fun bm!2814 () Bool)

(declare-fun lt!261283 () tuple4!246)

(assert (=> bm!2814 (= call!2817 (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!261063)) (_3!597 lt!261283)) (select (arr!4778 (buf!4309 lt!260836)) (_3!597 lt!261283)) lt!261281 (ite c!8658 lt!261282 #b00000000000000000000000000001000)))))

(declare-fun b!167828 () Bool)

(declare-fun e!116465 () Bool)

(assert (=> b!167828 (= e!116465 call!2817)))

(declare-fun b!167829 () Bool)

(declare-fun e!116462 () Bool)

(assert (=> b!167829 (= e!116462 (arrayRangesEq!686 (buf!4309 lt!261063) (buf!4309 lt!260836) (_1!7912 lt!261283) (_2!7912 lt!261283)))))

(declare-fun d!58895 () Bool)

(declare-fun res!139738 () Bool)

(declare-fun e!116464 () Bool)

(assert (=> d!58895 (=> res!139738 e!116464)))

(assert (=> d!58895 (= res!139738 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))))))

(assert (=> d!58895 (= (arrayBitRangesEq!0 (buf!4309 lt!261063) (buf!4309 lt!260836) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))) e!116464)))

(declare-fun b!167830 () Bool)

(declare-fun e!116461 () Bool)

(assert (=> b!167830 (= e!116461 e!116465)))

(assert (=> b!167830 (= c!8658 (= (_3!597 lt!261283) (_4!123 lt!261283)))))

(declare-fun b!167831 () Bool)

(assert (=> b!167831 (= e!116464 e!116461)))

(declare-fun res!139741 () Bool)

(assert (=> b!167831 (=> (not res!139741) (not e!116461))))

(assert (=> b!167831 (= res!139741 e!116462)))

(declare-fun res!139737 () Bool)

(assert (=> b!167831 (=> res!139737 e!116462)))

(assert (=> b!167831 (= res!139737 (bvsge (_1!7912 lt!261283) (_2!7912 lt!261283)))))

(assert (=> b!167831 (= lt!261282 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167831 (= lt!261281 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167831 (= lt!261283 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))))))

(declare-fun b!167832 () Bool)

(assert (=> b!167832 (= e!116465 e!116460)))

(declare-fun res!139739 () Bool)

(assert (=> b!167832 (= res!139739 call!2817)))

(assert (=> b!167832 (=> (not res!139739) (not e!116460))))

(declare-fun b!167833 () Bool)

(assert (=> b!167833 (= e!116463 (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!261063)) (_4!123 lt!261283)) (select (arr!4778 (buf!4309 lt!260836)) (_4!123 lt!261283)) #b00000000000000000000000000000000 lt!261282))))

(assert (= (and d!58895 (not res!139738)) b!167831))

(assert (= (and b!167831 (not res!139737)) b!167829))

(assert (= (and b!167831 res!139741) b!167830))

(assert (= (and b!167830 c!8658) b!167828))

(assert (= (and b!167830 (not c!8658)) b!167832))

(assert (= (and b!167832 res!139739) b!167827))

(assert (= (and b!167827 (not res!139740)) b!167833))

(assert (= (or b!167828 b!167832) bm!2814))

(declare-fun m!267213 () Bool)

(assert (=> bm!2814 m!267213))

(declare-fun m!267215 () Bool)

(assert (=> bm!2814 m!267215))

(assert (=> bm!2814 m!267213))

(assert (=> bm!2814 m!267215))

(declare-fun m!267217 () Bool)

(assert (=> bm!2814 m!267217))

(declare-fun m!267219 () Bool)

(assert (=> b!167829 m!267219))

(assert (=> b!167831 m!267061))

(declare-fun m!267221 () Bool)

(assert (=> b!167831 m!267221))

(declare-fun m!267223 () Bool)

(assert (=> b!167833 m!267223))

(declare-fun m!267225 () Bool)

(assert (=> b!167833 m!267225))

(assert (=> b!167833 m!267223))

(assert (=> b!167833 m!267225))

(declare-fun m!267227 () Bool)

(assert (=> b!167833 m!267227))

(assert (=> b!167753 d!58895))

(declare-fun d!58897 () Bool)

(declare-fun e!116466 () Bool)

(assert (=> d!58897 e!116466))

(declare-fun res!139742 () Bool)

(assert (=> d!58897 (=> (not res!139742) (not e!116466))))

(declare-fun lt!261285 () (_ BitVec 64))

(declare-fun lt!261288 () (_ BitVec 64))

(declare-fun lt!261286 () (_ BitVec 64))

(assert (=> d!58897 (= res!139742 (= lt!261285 (bvsub lt!261288 lt!261286)))))

(assert (=> d!58897 (or (= (bvand lt!261288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261288 lt!261286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58897 (= lt!261286 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 lt!261063))) ((_ sign_extend 32) (currentByte!8154 lt!261063)) ((_ sign_extend 32) (currentBit!8149 lt!261063))))))

(declare-fun lt!261284 () (_ BitVec 64))

(declare-fun lt!261287 () (_ BitVec 64))

(assert (=> d!58897 (= lt!261288 (bvmul lt!261284 lt!261287))))

(assert (=> d!58897 (or (= lt!261284 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261287 (bvsdiv (bvmul lt!261284 lt!261287) lt!261284)))))

(assert (=> d!58897 (= lt!261287 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58897 (= lt!261284 ((_ sign_extend 32) (size!3857 (buf!4309 lt!261063))))))

(assert (=> d!58897 (= lt!261285 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 lt!261063)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 lt!261063))))))

(assert (=> d!58897 (invariant!0 (currentBit!8149 lt!261063) (currentByte!8154 lt!261063) (size!3857 (buf!4309 lt!261063)))))

(assert (=> d!58897 (= (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063)) lt!261285)))

(declare-fun b!167834 () Bool)

(declare-fun res!139743 () Bool)

(assert (=> b!167834 (=> (not res!139743) (not e!116466))))

(assert (=> b!167834 (= res!139743 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261285))))

(declare-fun b!167835 () Bool)

(declare-fun lt!261289 () (_ BitVec 64))

(assert (=> b!167835 (= e!116466 (bvsle lt!261285 (bvmul lt!261289 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167835 (or (= lt!261289 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261289 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261289)))))

(assert (=> b!167835 (= lt!261289 ((_ sign_extend 32) (size!3857 (buf!4309 lt!261063))))))

(assert (= (and d!58897 res!139742) b!167834))

(assert (= (and b!167834 res!139743) b!167835))

(declare-fun m!267229 () Bool)

(assert (=> d!58897 m!267229))

(declare-fun m!267231 () Bool)

(assert (=> d!58897 m!267231))

(assert (=> b!167753 d!58897))

(assert (=> b!167754 d!58897))

(assert (=> d!58831 d!58827))

(declare-fun d!58899 () Bool)

(assert (=> d!58899 (isPrefixOf!0 lt!261063 lt!261063)))

(assert (=> d!58899 true))

(declare-fun _$14!308 () Unit!11662)

(assert (=> d!58899 (= (choose!11 lt!261063) _$14!308)))

(declare-fun bs!14606 () Bool)

(assert (= bs!14606 d!58899))

(assert (=> bs!14606 m!266937))

(assert (=> d!58831 d!58899))

(assert (=> d!58813 d!58845))

(assert (=> d!58817 d!58705))

(declare-fun d!58901 () Bool)

(declare-fun res!139744 () Bool)

(declare-fun e!116467 () Bool)

(assert (=> d!58901 (=> res!139744 e!116467)))

(assert (=> d!58901 (= res!139744 (= (_1!7912 lt!261181) (_2!7912 lt!261181)))))

(assert (=> d!58901 (= (arrayRangesEq!686 (buf!4309 thiss!1577) (buf!4309 lt!260836) (_1!7912 lt!261181) (_2!7912 lt!261181)) e!116467)))

(declare-fun b!167836 () Bool)

(declare-fun e!116468 () Bool)

(assert (=> b!167836 (= e!116467 e!116468)))

(declare-fun res!139745 () Bool)

(assert (=> b!167836 (=> (not res!139745) (not e!116468))))

(assert (=> b!167836 (= res!139745 (= (select (arr!4778 (buf!4309 thiss!1577)) (_1!7912 lt!261181)) (select (arr!4778 (buf!4309 lt!260836)) (_1!7912 lt!261181))))))

(declare-fun b!167837 () Bool)

(assert (=> b!167837 (= e!116468 (arrayRangesEq!686 (buf!4309 thiss!1577) (buf!4309 lt!260836) (bvadd (_1!7912 lt!261181) #b00000000000000000000000000000001) (_2!7912 lt!261181)))))

(assert (= (and d!58901 (not res!139744)) b!167836))

(assert (= (and b!167836 res!139745) b!167837))

(declare-fun m!267233 () Bool)

(assert (=> b!167836 m!267233))

(declare-fun m!267235 () Bool)

(assert (=> b!167836 m!267235))

(declare-fun m!267237 () Bool)

(assert (=> b!167837 m!267237))

(assert (=> b!167721 d!58901))

(declare-fun d!58903 () Bool)

(assert (=> d!58903 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577))) (tuple4!247 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3857 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) (currentBit!8149 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!167723 d!58903))

(declare-fun b!167838 () Bool)

(declare-fun res!139749 () Bool)

(declare-fun lt!261291 () (_ BitVec 32))

(assert (=> b!167838 (= res!139749 (= lt!261291 #b00000000000000000000000000000000))))

(declare-fun e!116472 () Bool)

(assert (=> b!167838 (=> res!139749 e!116472)))

(declare-fun e!116469 () Bool)

(assert (=> b!167838 (= e!116469 e!116472)))

(declare-fun lt!261290 () (_ BitVec 32))

(declare-fun c!8659 () Bool)

(declare-fun lt!261292 () tuple4!246)

(declare-fun call!2818 () Bool)

(declare-fun bm!2815 () Bool)

(assert (=> bm!2815 (= call!2818 (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!261063)) (_3!597 lt!261292)) (select (arr!4778 (buf!4309 lt!261063)) (_3!597 lt!261292)) lt!261290 (ite c!8659 lt!261291 #b00000000000000000000000000001000)))))

(declare-fun b!167839 () Bool)

(declare-fun e!116474 () Bool)

(assert (=> b!167839 (= e!116474 call!2818)))

(declare-fun b!167840 () Bool)

(declare-fun e!116471 () Bool)

(assert (=> b!167840 (= e!116471 (arrayRangesEq!686 (buf!4309 lt!261063) (buf!4309 lt!261063) (_1!7912 lt!261292) (_2!7912 lt!261292)))))

(declare-fun d!58905 () Bool)

(declare-fun res!139747 () Bool)

(declare-fun e!116473 () Bool)

(assert (=> d!58905 (=> res!139747 e!116473)))

(assert (=> d!58905 (= res!139747 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))))))

(assert (=> d!58905 (= (arrayBitRangesEq!0 (buf!4309 lt!261063) (buf!4309 lt!261063) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))) e!116473)))

(declare-fun b!167841 () Bool)

(declare-fun e!116470 () Bool)

(assert (=> b!167841 (= e!116470 e!116474)))

(assert (=> b!167841 (= c!8659 (= (_3!597 lt!261292) (_4!123 lt!261292)))))

(declare-fun b!167842 () Bool)

(assert (=> b!167842 (= e!116473 e!116470)))

(declare-fun res!139750 () Bool)

(assert (=> b!167842 (=> (not res!139750) (not e!116470))))

(assert (=> b!167842 (= res!139750 e!116471)))

(declare-fun res!139746 () Bool)

(assert (=> b!167842 (=> res!139746 e!116471)))

(assert (=> b!167842 (= res!139746 (bvsge (_1!7912 lt!261292) (_2!7912 lt!261292)))))

(assert (=> b!167842 (= lt!261291 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167842 (= lt!261290 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167842 (= lt!261292 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3857 (buf!4309 lt!261063)) (currentByte!8154 lt!261063) (currentBit!8149 lt!261063))))))

(declare-fun b!167843 () Bool)

(assert (=> b!167843 (= e!116474 e!116469)))

(declare-fun res!139748 () Bool)

(assert (=> b!167843 (= res!139748 call!2818)))

(assert (=> b!167843 (=> (not res!139748) (not e!116469))))

(declare-fun b!167844 () Bool)

(assert (=> b!167844 (= e!116472 (byteRangesEq!0 (select (arr!4778 (buf!4309 lt!261063)) (_4!123 lt!261292)) (select (arr!4778 (buf!4309 lt!261063)) (_4!123 lt!261292)) #b00000000000000000000000000000000 lt!261291))))

(assert (= (and d!58905 (not res!139747)) b!167842))

(assert (= (and b!167842 (not res!139746)) b!167840))

(assert (= (and b!167842 res!139750) b!167841))

(assert (= (and b!167841 c!8659) b!167839))

(assert (= (and b!167841 (not c!8659)) b!167843))

(assert (= (and b!167843 res!139748) b!167838))

(assert (= (and b!167838 (not res!139749)) b!167844))

(assert (= (or b!167839 b!167843) bm!2815))

(declare-fun m!267239 () Bool)

(assert (=> bm!2815 m!267239))

(assert (=> bm!2815 m!267239))

(assert (=> bm!2815 m!267239))

(assert (=> bm!2815 m!267239))

(declare-fun m!267241 () Bool)

(assert (=> bm!2815 m!267241))

(declare-fun m!267243 () Bool)

(assert (=> b!167840 m!267243))

(assert (=> b!167842 m!267061))

(assert (=> b!167842 m!267221))

(declare-fun m!267245 () Bool)

(assert (=> b!167844 m!267245))

(assert (=> b!167844 m!267245))

(assert (=> b!167844 m!267245))

(assert (=> b!167844 m!267245))

(declare-fun m!267247 () Bool)

(assert (=> b!167844 m!267247))

(assert (=> b!167756 d!58905))

(assert (=> b!167756 d!58897))

(declare-fun d!58907 () Bool)

(declare-fun res!139751 () Bool)

(declare-fun e!116475 () Bool)

(assert (=> d!58907 (=> res!139751 e!116475)))

(assert (=> d!58907 (= res!139751 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (=> d!58907 (= (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)) e!116475)))

(declare-fun b!167845 () Bool)

(declare-fun e!116476 () Bool)

(assert (=> b!167845 (= e!116475 e!116476)))

(declare-fun res!139752 () Bool)

(assert (=> b!167845 (=> (not res!139752) (not e!116476))))

(assert (=> b!167845 (= res!139752 (= (select (arr!4778 (buf!4309 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4778 (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!167846 () Bool)

(assert (=> b!167846 (= e!116476 (arrayRangesEq!686 (buf!4309 thiss!1577) (array!8687 (store (arr!4778 (buf!4309 thiss!1577)) (currentByte!8154 thiss!1577) lt!260831) (size!3857 (buf!4309 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (= (and d!58907 (not res!139751)) b!167845))

(assert (= (and b!167845 res!139752) b!167846))

(declare-fun m!267249 () Bool)

(assert (=> b!167845 m!267249))

(declare-fun m!267251 () Bool)

(assert (=> b!167845 m!267251))

(declare-fun m!267253 () Bool)

(assert (=> b!167846 m!267253))

(assert (=> b!167699 d!58907))

(assert (=> d!58839 d!58823))

(declare-fun d!58909 () Bool)

(assert (=> d!58909 (isPrefixOf!0 lt!261063 lt!260836)))

(assert (=> d!58909 true))

(declare-fun _$15!277 () Unit!11662)

(assert (=> d!58909 (= (choose!30 lt!261063 lt!260836 lt!260836) _$15!277)))

(declare-fun bs!14607 () Bool)

(assert (= bs!14607 d!58909))

(assert (=> bs!14607 m!266925))

(assert (=> d!58839 d!58909))

(declare-fun d!58911 () Bool)

(declare-fun e!116477 () Bool)

(assert (=> d!58911 e!116477))

(declare-fun res!139753 () Bool)

(assert (=> d!58911 (=> (not res!139753) (not e!116477))))

(declare-fun lt!261295 () (_ BitVec 64))

(declare-fun lt!261297 () (_ BitVec 64))

(declare-fun lt!261294 () (_ BitVec 64))

(assert (=> d!58911 (= res!139753 (= lt!261294 (bvsub lt!261297 lt!261295)))))

(assert (=> d!58911 (or (= (bvand lt!261297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261297 lt!261295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58911 (= lt!261295 (remainingBits!0 ((_ sign_extend 32) (size!3857 (buf!4309 lt!261213))) ((_ sign_extend 32) (currentByte!8154 lt!261213)) ((_ sign_extend 32) (currentBit!8149 lt!261213))))))

(declare-fun lt!261293 () (_ BitVec 64))

(declare-fun lt!261296 () (_ BitVec 64))

(assert (=> d!58911 (= lt!261297 (bvmul lt!261293 lt!261296))))

(assert (=> d!58911 (or (= lt!261293 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261296 (bvsdiv (bvmul lt!261293 lt!261296) lt!261293)))))

(assert (=> d!58911 (= lt!261296 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58911 (= lt!261293 ((_ sign_extend 32) (size!3857 (buf!4309 lt!261213))))))

(assert (=> d!58911 (= lt!261294 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8154 lt!261213)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8149 lt!261213))))))

(assert (=> d!58911 (invariant!0 (currentBit!8149 lt!261213) (currentByte!8154 lt!261213) (size!3857 (buf!4309 lt!261213)))))

(assert (=> d!58911 (= (bitIndex!0 (size!3857 (buf!4309 lt!261213)) (currentByte!8154 lt!261213) (currentBit!8149 lt!261213)) lt!261294)))

(declare-fun b!167847 () Bool)

(declare-fun res!139754 () Bool)

(assert (=> b!167847 (=> (not res!139754) (not e!116477))))

(assert (=> b!167847 (= res!139754 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261294))))

(declare-fun b!167848 () Bool)

(declare-fun lt!261298 () (_ BitVec 64))

(assert (=> b!167848 (= e!116477 (bvsle lt!261294 (bvmul lt!261298 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167848 (or (= lt!261298 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261298 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261298)))))

(assert (=> b!167848 (= lt!261298 ((_ sign_extend 32) (size!3857 (buf!4309 lt!261213))))))

(assert (= (and d!58911 res!139753) b!167847))

(assert (= (and b!167847 res!139754) b!167848))

(declare-fun m!267255 () Bool)

(assert (=> d!58911 m!267255))

(declare-fun m!267257 () Bool)

(assert (=> d!58911 m!267257))

(assert (=> d!58819 d!58911))

(assert (=> d!58819 d!58849))

(declare-fun d!58913 () Bool)

(declare-fun lt!261300 () (_ BitVec 32))

(assert (=> d!58913 (= lt!261300 ((_ extract 31 0) (bvsrem (bvsub lt!261067 lt!261079) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261303 () (_ BitVec 32))

(assert (=> d!58913 (= lt!261303 ((_ extract 31 0) (bvsdiv (bvsub lt!261067 lt!261079) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!116478 () Bool)

(assert (=> d!58913 e!116478))

(declare-fun res!139755 () Bool)

(assert (=> d!58913 (=> (not res!139755) (not e!116478))))

(assert (=> d!58913 (= res!139755 (moveBitIndexPrecond!0 (_2!7906 lt!261068) (bvsub lt!261067 lt!261079)))))

(declare-fun Unit!11676 () Unit!11662)

(declare-fun Unit!11677 () Unit!11662)

(declare-fun Unit!11678 () Unit!11662)

(assert (=> d!58913 (= (moveBitIndex!0 (_2!7906 lt!261068) (bvsub lt!261067 lt!261079)) (ite (bvslt (bvadd (currentBit!8149 (_2!7906 lt!261068)) lt!261300) #b00000000000000000000000000000000) (tuple2!14631 Unit!11676 (BitStream!6871 (buf!4309 (_2!7906 lt!261068)) (bvsub (bvadd (currentByte!8154 (_2!7906 lt!261068)) lt!261303) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261300 (currentBit!8149 (_2!7906 lt!261068))))) (ite (bvsge (bvadd (currentBit!8149 (_2!7906 lt!261068)) lt!261300) #b00000000000000000000000000001000) (tuple2!14631 Unit!11677 (BitStream!6871 (buf!4309 (_2!7906 lt!261068)) (bvadd (currentByte!8154 (_2!7906 lt!261068)) lt!261303 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8149 (_2!7906 lt!261068)) lt!261300) #b00000000000000000000000000001000))) (tuple2!14631 Unit!11678 (BitStream!6871 (buf!4309 (_2!7906 lt!261068)) (bvadd (currentByte!8154 (_2!7906 lt!261068)) lt!261303) (bvadd (currentBit!8149 (_2!7906 lt!261068)) lt!261300))))))))

(declare-fun b!167849 () Bool)

(declare-fun e!116479 () Bool)

(assert (=> b!167849 (= e!116478 e!116479)))

(declare-fun res!139756 () Bool)

(assert (=> b!167849 (=> (not res!139756) (not e!116479))))

(declare-fun lt!261304 () (_ BitVec 64))

(declare-fun lt!261299 () tuple2!14630)

(assert (=> b!167849 (= res!139756 (= (bvadd lt!261304 (bvsub lt!261067 lt!261079)) (bitIndex!0 (size!3857 (buf!4309 (_2!7914 lt!261299))) (currentByte!8154 (_2!7914 lt!261299)) (currentBit!8149 (_2!7914 lt!261299)))))))

(assert (=> b!167849 (or (not (= (bvand lt!261304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261067 lt!261079) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261304 (bvsub lt!261067 lt!261079)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!167849 (= lt!261304 (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068))))))

(declare-fun lt!261302 () (_ BitVec 32))

(declare-fun lt!261301 () (_ BitVec 32))

(declare-fun Unit!11679 () Unit!11662)

(declare-fun Unit!11680 () Unit!11662)

(declare-fun Unit!11681 () Unit!11662)

(assert (=> b!167849 (= lt!261299 (ite (bvslt (bvadd (currentBit!8149 (_2!7906 lt!261068)) lt!261302) #b00000000000000000000000000000000) (tuple2!14631 Unit!11679 (BitStream!6871 (buf!4309 (_2!7906 lt!261068)) (bvsub (bvadd (currentByte!8154 (_2!7906 lt!261068)) lt!261301) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261302 (currentBit!8149 (_2!7906 lt!261068))))) (ite (bvsge (bvadd (currentBit!8149 (_2!7906 lt!261068)) lt!261302) #b00000000000000000000000000001000) (tuple2!14631 Unit!11680 (BitStream!6871 (buf!4309 (_2!7906 lt!261068)) (bvadd (currentByte!8154 (_2!7906 lt!261068)) lt!261301 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8149 (_2!7906 lt!261068)) lt!261302) #b00000000000000000000000000001000))) (tuple2!14631 Unit!11681 (BitStream!6871 (buf!4309 (_2!7906 lt!261068)) (bvadd (currentByte!8154 (_2!7906 lt!261068)) lt!261301) (bvadd (currentBit!8149 (_2!7906 lt!261068)) lt!261302))))))))

(assert (=> b!167849 (= lt!261302 ((_ extract 31 0) (bvsrem (bvsub lt!261067 lt!261079) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167849 (= lt!261301 ((_ extract 31 0) (bvsdiv (bvsub lt!261067 lt!261079) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!167850 () Bool)

(assert (=> b!167850 (= e!116479 (and (= (size!3857 (buf!4309 (_2!7906 lt!261068))) (size!3857 (buf!4309 (_2!7914 lt!261299)))) (= (buf!4309 (_2!7906 lt!261068)) (buf!4309 (_2!7914 lt!261299)))))))

(assert (= (and d!58913 res!139755) b!167849))

(assert (= (and b!167849 res!139756) b!167850))

(assert (=> d!58913 m!267057))

(declare-fun m!267259 () Bool)

(assert (=> b!167849 m!267259))

(assert (=> b!167849 m!267021))

(assert (=> d!58819 d!58913))

(declare-fun d!58915 () Bool)

(declare-fun res!139759 () Bool)

(declare-fun e!116482 () Bool)

(assert (=> d!58915 (=> (not res!139759) (not e!116482))))

(assert (=> d!58915 (= res!139759 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7906 lt!261068))))) (bvsub lt!261067 lt!261079)) (bvsle (bvsub lt!261067 lt!261079) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7906 lt!261068))))))))))

(assert (=> d!58915 (= (moveBitIndexPrecond!0 (_2!7906 lt!261068) (bvsub lt!261067 lt!261079)) e!116482)))

(declare-fun b!167854 () Bool)

(declare-fun lt!261307 () (_ BitVec 64))

(assert (=> b!167854 (= e!116482 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261307) (bvsle lt!261307 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3857 (buf!4309 (_2!7906 lt!261068))))))))))

(assert (=> b!167854 (= lt!261307 (bvadd (bitIndex!0 (size!3857 (buf!4309 (_2!7906 lt!261068))) (currentByte!8154 (_2!7906 lt!261068)) (currentBit!8149 (_2!7906 lt!261068))) (bvsub lt!261067 lt!261079)))))

(assert (= (and d!58915 res!139759) b!167854))

(assert (=> b!167854 m!267021))

(assert (=> d!58819 d!58915))

(assert (=> d!58803 d!58805))

(declare-fun d!58917 () Bool)

(assert (=> d!58917 (arrayBitRangesEq!0 (buf!4309 lt!260836) (buf!4309 thiss!1577) lt!261062 lt!261064)))

(assert (=> d!58917 true))

(declare-fun _$19!144 () Unit!11662)

(assert (=> d!58917 (= (choose!8 (buf!4309 thiss!1577) (buf!4309 lt!260836) lt!261062 lt!261064) _$19!144)))

(declare-fun bs!14608 () Bool)

(assert (= bs!14608 d!58917))

(assert (=> bs!14608 m!266945))

(assert (=> d!58803 d!58917))

(assert (=> d!58835 d!58833))

(declare-fun d!58919 () Bool)

(assert (=> d!58919 (isPrefixOf!0 lt!260836 lt!260836)))

(assert (=> d!58919 true))

(declare-fun _$14!309 () Unit!11662)

(assert (=> d!58919 (= (choose!11 lt!260836) _$14!309)))

(declare-fun bs!14609 () Bool)

(assert (= bs!14609 d!58919))

(assert (=> bs!14609 m!266935))

(assert (=> d!58835 d!58919))

(assert (=> b!167751 d!58897))

(assert (=> b!167751 d!58791))

(declare-fun d!58921 () Bool)

(declare-fun res!139760 () Bool)

(declare-fun e!116483 () Bool)

(assert (=> d!58921 (=> res!139760 e!116483)))

(assert (=> d!58921 (= res!139760 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (=> d!58921 (= (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)) e!116483)))

(declare-fun b!167855 () Bool)

(declare-fun e!116484 () Bool)

(assert (=> b!167855 (= e!116483 e!116484)))

(declare-fun res!139761 () Bool)

(assert (=> b!167855 (=> (not res!139761) (not e!116484))))

(assert (=> b!167855 (= res!139761 (= (select (arr!4778 (buf!4309 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4778 lt!260839) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!167856 () Bool)

(assert (=> b!167856 (= e!116484 (arrayRangesEq!686 (buf!4309 thiss!1577) lt!260839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8154 thiss!1577)))))

(assert (= (and d!58921 (not res!139760)) b!167855))

(assert (= (and b!167855 res!139761) b!167856))

(assert (=> b!167855 m!267249))

(assert (=> b!167855 m!267157))

(declare-fun m!267261 () Bool)

(assert (=> b!167856 m!267261))

(assert (=> b!167766 d!58921))

(check-sat (not b!167797) (not d!58859) (not b!167813) (not d!58899) (not b!167819) (not b!167810) (not b!167807) (not b!167837) (not b!167849) (not d!58851) (not b!167805) (not d!58883) (not b!167771) (not b!167831) (not bm!2813) (not d!58919) (not d!58911) (not bm!2810) (not b!167799) (not b!167856) (not b!167792) (not bm!2811) (not b!167826) (not d!58913) (not bm!2809) (not b!167833) (not d!58873) (not d!58897) (not b!167801) (not d!58917) (not b!167775) (not b!167854) (not b!167794) (not b!167817) (not d!58909) (not d!58857) (not b!167822) (not b!167829) (not d!58849) (not d!58871) (not b!167824) (not bm!2814) (not b!167840) (not b!167842) (not b!167844) (not b!167808) (not bm!2815) (not b!167782) (not b!167846) (not b!167790) (not b!167815) (not bm!2812) (not b!167773))
(check-sat)
