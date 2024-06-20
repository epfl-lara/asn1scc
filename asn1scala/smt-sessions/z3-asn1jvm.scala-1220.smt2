; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34614 () Bool)

(assert start!34614)

(declare-fun b!164117 () Bool)

(declare-fun e!113379 () Bool)

(declare-datatypes ((array!8203 0))(
  ( (array!8204 (arr!4595 (Array (_ BitVec 32) (_ BitVec 8))) (size!3674 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6504 0))(
  ( (BitStream!6505 (buf!4126 array!8203) (currentByte!7688 (_ BitVec 32)) (currentBit!7683 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6504)

(declare-fun array_inv!3415 (array!8203) Bool)

(assert (=> b!164117 (= e!113379 (array_inv!3415 (buf!4126 thiss!1577)))))

(declare-fun res!136745 () Bool)

(declare-fun e!113378 () Bool)

(assert (=> start!34614 (=> (not res!136745) (not e!113378))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34614 (= res!136745 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34614 e!113378))

(assert (=> start!34614 true))

(declare-fun inv!12 (BitStream!6504) Bool)

(assert (=> start!34614 (and (inv!12 thiss!1577) e!113379)))

(declare-fun b!164118 () Bool)

(declare-fun e!113377 () Bool)

(assert (=> b!164118 (= e!113378 (not e!113377))))

(declare-fun res!136747 () Bool)

(assert (=> b!164118 (=> res!136747 e!113377)))

(declare-fun lt!257590 () (_ BitVec 32))

(declare-fun lt!257586 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164118 (= res!136747 (not (byteRangesEq!0 (select (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577)) lt!257586 #b00000000000000000000000000000000 lt!257590)))))

(declare-fun lt!257592 () array!8203)

(declare-fun arrayRangesEq!608 (array!8203 array!8203 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164118 (arrayRangesEq!608 (buf!4126 thiss!1577) lt!257592 #b00000000000000000000000000000000 (currentByte!7688 thiss!1577))))

(declare-fun lt!257589 () array!8203)

(declare-datatypes ((Unit!11425 0))(
  ( (Unit!11426) )
))
(declare-fun lt!257588 () Unit!11425)

(declare-fun arrayRangesEqTransitive!155 (array!8203 array!8203 array!8203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11425)

(assert (=> b!164118 (= lt!257588 (arrayRangesEqTransitive!155 (buf!4126 thiss!1577) lt!257589 lt!257592 #b00000000000000000000000000000000 (currentByte!7688 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (=> b!164118 (arrayRangesEq!608 lt!257589 lt!257592 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)))))

(declare-fun lt!257593 () (_ BitVec 8))

(declare-fun lt!257591 () Unit!11425)

(declare-fun arrayUpdatedAtPrefixLemma!216 (array!8203 (_ BitVec 32) (_ BitVec 8)) Unit!11425)

(assert (=> b!164118 (= lt!257591 (arrayUpdatedAtPrefixLemma!216 lt!257589 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593))))

(assert (=> b!164118 (arrayRangesEq!608 (buf!4126 thiss!1577) (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7688 thiss!1577))))

(declare-fun lt!257594 () Unit!11425)

(assert (=> b!164118 (= lt!257594 (arrayUpdatedAtPrefixLemma!216 (buf!4126 thiss!1577) (currentByte!7688 thiss!1577) lt!257586))))

(declare-fun lt!257585 () (_ BitVec 32))

(assert (=> b!164118 (= lt!257586 (select (store (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7683 thiss!1577)))))))) (bvlshr (bvand lt!257585 #b00000000000000000000000011111111) lt!257590)))) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) (currentByte!7688 thiss!1577)))))

(assert (=> b!164118 (= lt!257592 (array!8204 (store (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7683 thiss!1577)))))))) (bvlshr (bvand lt!257585 #b00000000000000000000000011111111) lt!257590)))) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) (size!3674 (buf!4126 thiss!1577))))))

(declare-fun lt!257587 () (_ BitVec 32))

(assert (=> b!164118 (= lt!257593 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7683 thiss!1577)))))))) (bvlshr (bvand lt!257585 #b00000000000000000000000011111111) lt!257590)))) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257587))) (bvshl lt!257585 lt!257587))))))

(assert (=> b!164118 (= lt!257587 (bvsub #b00000000000000000000000000001000 lt!257590))))

(assert (=> b!164118 (= lt!257589 (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7683 thiss!1577)))))))) (bvlshr (bvand lt!257585 #b00000000000000000000000011111111) lt!257590)))) (size!3674 (buf!4126 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164118 (= lt!257585 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164118 (= lt!257590 (bvsub (bvadd (currentBit!7683 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164119 () Bool)

(declare-fun res!136748 () Bool)

(assert (=> b!164119 (=> (not res!136748) (not e!113378))))

(assert (=> b!164119 (= res!136748 (bvsgt (bvadd (currentBit!7683 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164120 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164120 (= e!113377 (invariant!0 lt!257590 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) (size!3674 (buf!4126 thiss!1577))))))

(declare-fun b!164121 () Bool)

(declare-fun res!136746 () Bool)

(assert (=> b!164121 (=> (not res!136746) (not e!113378))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164121 (= res!136746 (validate_offset_bits!1 ((_ sign_extend 32) (size!3674 (buf!4126 thiss!1577))) ((_ sign_extend 32) (currentByte!7688 thiss!1577)) ((_ sign_extend 32) (currentBit!7683 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34614 res!136745) b!164121))

(assert (= (and b!164121 res!136746) b!164119))

(assert (= (and b!164119 res!136748) b!164118))

(assert (= (and b!164118 (not res!136747)) b!164120))

(assert (= start!34614 b!164117))

(declare-fun m!260749 () Bool)

(assert (=> b!164118 m!260749))

(declare-fun m!260751 () Bool)

(assert (=> b!164118 m!260751))

(declare-fun m!260753 () Bool)

(assert (=> b!164118 m!260753))

(declare-fun m!260755 () Bool)

(assert (=> b!164118 m!260755))

(declare-fun m!260757 () Bool)

(assert (=> b!164118 m!260757))

(declare-fun m!260759 () Bool)

(assert (=> b!164118 m!260759))

(declare-fun m!260761 () Bool)

(assert (=> b!164118 m!260761))

(declare-fun m!260763 () Bool)

(assert (=> b!164118 m!260763))

(declare-fun m!260765 () Bool)

(assert (=> b!164118 m!260765))

(assert (=> b!164118 m!260751))

(declare-fun m!260767 () Bool)

(assert (=> b!164118 m!260767))

(declare-fun m!260769 () Bool)

(assert (=> b!164118 m!260769))

(declare-fun m!260771 () Bool)

(assert (=> b!164118 m!260771))

(declare-fun m!260773 () Bool)

(assert (=> b!164118 m!260773))

(declare-fun m!260775 () Bool)

(assert (=> b!164118 m!260775))

(declare-fun m!260777 () Bool)

(assert (=> b!164118 m!260777))

(declare-fun m!260779 () Bool)

(assert (=> b!164118 m!260779))

(declare-fun m!260781 () Bool)

(assert (=> b!164121 m!260781))

(declare-fun m!260783 () Bool)

(assert (=> start!34614 m!260783))

(declare-fun m!260785 () Bool)

(assert (=> b!164120 m!260785))

(declare-fun m!260787 () Bool)

(assert (=> b!164117 m!260787))

(check-sat (not b!164118) (not b!164120) (not b!164117) (not start!34614) (not b!164121))
(check-sat)
(get-model)

(declare-fun d!56595 () Bool)

(assert (=> d!56595 (= (array_inv!3415 (buf!4126 thiss!1577)) (bvsge (size!3674 (buf!4126 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164117 d!56595))

(declare-fun d!56597 () Bool)

(assert (=> d!56597 (= (byteRangesEq!0 (select (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577)) lt!257586 #b00000000000000000000000000000000 lt!257590) (or (= #b00000000000000000000000000000000 lt!257590) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257590))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!257586) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257590))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14028 () Bool)

(assert (= bs!14028 d!56597))

(declare-fun m!260841 () Bool)

(assert (=> bs!14028 m!260841))

(declare-fun m!260843 () Bool)

(assert (=> bs!14028 m!260843))

(assert (=> b!164118 d!56597))

(declare-fun d!56615 () Bool)

(declare-fun e!113403 () Bool)

(assert (=> d!56615 e!113403))

(declare-fun res!136772 () Bool)

(assert (=> d!56615 (=> (not res!136772) (not e!113403))))

(assert (=> d!56615 (= res!136772 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) (size!3674 lt!257589))))))

(declare-fun lt!257630 () Unit!11425)

(declare-fun choose!199 (array!8203 (_ BitVec 32) (_ BitVec 8)) Unit!11425)

(assert (=> d!56615 (= lt!257630 (choose!199 lt!257589 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593))))

(assert (=> d!56615 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) (size!3674 lt!257589)))))

(assert (=> d!56615 (= (arrayUpdatedAtPrefixLemma!216 lt!257589 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) lt!257630)))

(declare-fun b!164148 () Bool)

(assert (=> b!164148 (= e!113403 (arrayRangesEq!608 lt!257589 (array!8204 (store (arr!4595 lt!257589) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) (size!3674 lt!257589)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (= (and d!56615 res!136772) b!164148))

(declare-fun m!260855 () Bool)

(assert (=> d!56615 m!260855))

(declare-fun m!260857 () Bool)

(assert (=> b!164148 m!260857))

(declare-fun m!260859 () Bool)

(assert (=> b!164148 m!260859))

(assert (=> b!164118 d!56615))

(declare-fun d!56621 () Bool)

(declare-fun e!113408 () Bool)

(assert (=> d!56621 e!113408))

(declare-fun res!136777 () Bool)

(assert (=> d!56621 (=> (not res!136777) (not e!113408))))

(assert (=> d!56621 (= res!136777 (and (bvsge (currentByte!7688 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7688 thiss!1577) (size!3674 (buf!4126 thiss!1577)))))))

(declare-fun lt!257631 () Unit!11425)

(assert (=> d!56621 (= lt!257631 (choose!199 (buf!4126 thiss!1577) (currentByte!7688 thiss!1577) lt!257586))))

(assert (=> d!56621 (and (bvsle #b00000000000000000000000000000000 (currentByte!7688 thiss!1577)) (bvslt (currentByte!7688 thiss!1577) (size!3674 (buf!4126 thiss!1577))))))

(assert (=> d!56621 (= (arrayUpdatedAtPrefixLemma!216 (buf!4126 thiss!1577) (currentByte!7688 thiss!1577) lt!257586) lt!257631)))

(declare-fun b!164153 () Bool)

(assert (=> b!164153 (= e!113408 (arrayRangesEq!608 (buf!4126 thiss!1577) (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7688 thiss!1577)))))

(assert (= (and d!56621 res!136777) b!164153))

(declare-fun m!260861 () Bool)

(assert (=> d!56621 m!260861))

(assert (=> b!164153 m!260769))

(assert (=> b!164153 m!260757))

(assert (=> b!164118 d!56621))

(declare-fun d!56623 () Bool)

(declare-fun res!136787 () Bool)

(declare-fun e!113418 () Bool)

(assert (=> d!56623 (=> res!136787 e!113418)))

(assert (=> d!56623 (= res!136787 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (=> d!56623 (= (arrayRangesEq!608 lt!257589 lt!257592 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))) e!113418)))

(declare-fun b!164163 () Bool)

(declare-fun e!113419 () Bool)

(assert (=> b!164163 (= e!113418 e!113419)))

(declare-fun res!136788 () Bool)

(assert (=> b!164163 (=> (not res!136788) (not e!113419))))

(assert (=> b!164163 (= res!136788 (= (select (arr!4595 lt!257589) #b00000000000000000000000000000000) (select (arr!4595 lt!257592) #b00000000000000000000000000000000)))))

(declare-fun b!164164 () Bool)

(assert (=> b!164164 (= e!113419 (arrayRangesEq!608 lt!257589 lt!257592 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (= (and d!56623 (not res!136787)) b!164163))

(assert (= (and b!164163 res!136788) b!164164))

(declare-fun m!260871 () Bool)

(assert (=> b!164163 m!260871))

(declare-fun m!260873 () Bool)

(assert (=> b!164163 m!260873))

(declare-fun m!260875 () Bool)

(assert (=> b!164164 m!260875))

(assert (=> b!164118 d!56623))

(declare-fun d!56627 () Bool)

(assert (=> d!56627 (arrayRangesEq!608 (buf!4126 thiss!1577) lt!257592 #b00000000000000000000000000000000 (currentByte!7688 thiss!1577))))

(declare-fun lt!257638 () Unit!11425)

(declare-fun choose!201 (array!8203 array!8203 array!8203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11425)

(assert (=> d!56627 (= lt!257638 (choose!201 (buf!4126 thiss!1577) lt!257589 lt!257592 #b00000000000000000000000000000000 (currentByte!7688 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (=> d!56627 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7688 thiss!1577)) (bvsle (currentByte!7688 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (=> d!56627 (= (arrayRangesEqTransitive!155 (buf!4126 thiss!1577) lt!257589 lt!257592 #b00000000000000000000000000000000 (currentByte!7688 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))) lt!257638)))

(declare-fun bs!14030 () Bool)

(assert (= bs!14030 d!56627))

(assert (=> bs!14030 m!260749))

(declare-fun m!260891 () Bool)

(assert (=> bs!14030 m!260891))

(assert (=> b!164118 d!56627))

(declare-fun d!56637 () Bool)

(declare-fun res!136794 () Bool)

(declare-fun e!113425 () Bool)

(assert (=> d!56637 (=> res!136794 e!113425)))

(assert (=> d!56637 (= res!136794 (= #b00000000000000000000000000000000 (currentByte!7688 thiss!1577)))))

(assert (=> d!56637 (= (arrayRangesEq!608 (buf!4126 thiss!1577) (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7688 thiss!1577)) e!113425)))

(declare-fun b!164170 () Bool)

(declare-fun e!113426 () Bool)

(assert (=> b!164170 (= e!113425 e!113426)))

(declare-fun res!136795 () Bool)

(assert (=> b!164170 (=> (not res!136795) (not e!113426))))

(assert (=> b!164170 (= res!136795 (= (select (arr!4595 (buf!4126 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4595 (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164171 () Bool)

(assert (=> b!164171 (= e!113426 (arrayRangesEq!608 (buf!4126 thiss!1577) (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7688 thiss!1577)))))

(assert (= (and d!56637 (not res!136794)) b!164170))

(assert (= (and b!164170 res!136795) b!164171))

(declare-fun m!260893 () Bool)

(assert (=> b!164170 m!260893))

(declare-fun m!260895 () Bool)

(assert (=> b!164170 m!260895))

(declare-fun m!260897 () Bool)

(assert (=> b!164171 m!260897))

(assert (=> b!164118 d!56637))

(declare-fun d!56639 () Bool)

(declare-fun res!136796 () Bool)

(declare-fun e!113427 () Bool)

(assert (=> d!56639 (=> res!136796 e!113427)))

(assert (=> d!56639 (= res!136796 (= #b00000000000000000000000000000000 (currentByte!7688 thiss!1577)))))

(assert (=> d!56639 (= (arrayRangesEq!608 (buf!4126 thiss!1577) lt!257592 #b00000000000000000000000000000000 (currentByte!7688 thiss!1577)) e!113427)))

(declare-fun b!164172 () Bool)

(declare-fun e!113428 () Bool)

(assert (=> b!164172 (= e!113427 e!113428)))

(declare-fun res!136797 () Bool)

(assert (=> b!164172 (=> (not res!136797) (not e!113428))))

(assert (=> b!164172 (= res!136797 (= (select (arr!4595 (buf!4126 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4595 lt!257592) #b00000000000000000000000000000000)))))

(declare-fun b!164173 () Bool)

(assert (=> b!164173 (= e!113428 (arrayRangesEq!608 (buf!4126 thiss!1577) lt!257592 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7688 thiss!1577)))))

(assert (= (and d!56639 (not res!136796)) b!164172))

(assert (= (and b!164172 res!136797) b!164173))

(assert (=> b!164172 m!260893))

(assert (=> b!164172 m!260873))

(declare-fun m!260901 () Bool)

(assert (=> b!164173 m!260901))

(assert (=> b!164118 d!56639))

(declare-fun d!56643 () Bool)

(assert (=> d!56643 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7683 thiss!1577) (currentByte!7688 thiss!1577) (size!3674 (buf!4126 thiss!1577))))))

(declare-fun bs!14033 () Bool)

(assert (= bs!14033 d!56643))

(declare-fun m!260909 () Bool)

(assert (=> bs!14033 m!260909))

(assert (=> start!34614 d!56643))

(declare-fun d!56651 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56651 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3674 (buf!4126 thiss!1577))) ((_ sign_extend 32) (currentByte!7688 thiss!1577)) ((_ sign_extend 32) (currentBit!7683 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3674 (buf!4126 thiss!1577))) ((_ sign_extend 32) (currentByte!7688 thiss!1577)) ((_ sign_extend 32) (currentBit!7683 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14034 () Bool)

(assert (= bs!14034 d!56651))

(declare-fun m!260919 () Bool)

(assert (=> bs!14034 m!260919))

(assert (=> b!164121 d!56651))

(declare-fun d!56659 () Bool)

(assert (=> d!56659 (= (invariant!0 lt!257590 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) (size!3674 (buf!4126 thiss!1577))) (and (bvsge lt!257590 #b00000000000000000000000000000000) (bvslt lt!257590 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) (size!3674 (buf!4126 thiss!1577))) (and (= lt!257590 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) (size!3674 (buf!4126 thiss!1577)))))))))

(assert (=> b!164120 d!56659))

(check-sat (not d!56651) (not b!164171) (not d!56643) (not d!56615) (not b!164148) (not d!56627) (not b!164164) (not b!164173) (not b!164153) (not d!56621))
(check-sat)
(get-model)

(declare-fun d!56661 () Bool)

(declare-fun res!136803 () Bool)

(declare-fun e!113434 () Bool)

(assert (=> d!56661 (=> res!136803 e!113434)))

(assert (=> d!56661 (= res!136803 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7688 thiss!1577)))))

(assert (=> d!56661 (= (arrayRangesEq!608 (buf!4126 thiss!1577) (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7688 thiss!1577)) e!113434)))

(declare-fun b!164179 () Bool)

(declare-fun e!113435 () Bool)

(assert (=> b!164179 (= e!113434 e!113435)))

(declare-fun res!136804 () Bool)

(assert (=> b!164179 (=> (not res!136804) (not e!113435))))

(assert (=> b!164179 (= res!136804 (= (select (arr!4595 (buf!4126 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4595 (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!164180 () Bool)

(assert (=> b!164180 (= e!113435 (arrayRangesEq!608 (buf!4126 thiss!1577) (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7688 thiss!1577)))))

(assert (= (and d!56661 (not res!136803)) b!164179))

(assert (= (and b!164179 res!136804) b!164180))

(declare-fun m!260925 () Bool)

(assert (=> b!164179 m!260925))

(declare-fun m!260927 () Bool)

(assert (=> b!164179 m!260927))

(declare-fun m!260929 () Bool)

(assert (=> b!164180 m!260929))

(assert (=> b!164171 d!56661))

(declare-fun d!56663 () Bool)

(declare-fun res!136805 () Bool)

(declare-fun e!113436 () Bool)

(assert (=> d!56663 (=> res!136805 e!113436)))

(assert (=> d!56663 (= res!136805 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7688 thiss!1577)))))

(assert (=> d!56663 (= (arrayRangesEq!608 (buf!4126 thiss!1577) lt!257592 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7688 thiss!1577)) e!113436)))

(declare-fun b!164181 () Bool)

(declare-fun e!113437 () Bool)

(assert (=> b!164181 (= e!113436 e!113437)))

(declare-fun res!136806 () Bool)

(assert (=> b!164181 (=> (not res!136806) (not e!113437))))

(assert (=> b!164181 (= res!136806 (= (select (arr!4595 (buf!4126 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4595 lt!257592) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!164182 () Bool)

(assert (=> b!164182 (= e!113437 (arrayRangesEq!608 (buf!4126 thiss!1577) lt!257592 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7688 thiss!1577)))))

(assert (= (and d!56663 (not res!136805)) b!164181))

(assert (= (and b!164181 res!136806) b!164182))

(assert (=> b!164181 m!260925))

(declare-fun m!260931 () Bool)

(assert (=> b!164181 m!260931))

(declare-fun m!260933 () Bool)

(assert (=> b!164182 m!260933))

(assert (=> b!164173 d!56663))

(declare-fun d!56665 () Bool)

(assert (=> d!56665 (arrayRangesEq!608 (buf!4126 thiss!1577) (array!8204 (store (arr!4595 (buf!4126 thiss!1577)) (currentByte!7688 thiss!1577) lt!257586) (size!3674 (buf!4126 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7688 thiss!1577))))

(assert (=> d!56665 true))

(declare-fun _$8!173 () Unit!11425)

(assert (=> d!56665 (= (choose!199 (buf!4126 thiss!1577) (currentByte!7688 thiss!1577) lt!257586) _$8!173)))

(declare-fun bs!14037 () Bool)

(assert (= bs!14037 d!56665))

(assert (=> bs!14037 m!260769))

(assert (=> bs!14037 m!260757))

(assert (=> d!56621 d!56665))

(declare-fun d!56667 () Bool)

(assert (=> d!56667 (= (invariant!0 (currentBit!7683 thiss!1577) (currentByte!7688 thiss!1577) (size!3674 (buf!4126 thiss!1577))) (and (bvsge (currentBit!7683 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7683 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7688 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7688 thiss!1577) (size!3674 (buf!4126 thiss!1577))) (and (= (currentBit!7683 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7688 thiss!1577) (size!3674 (buf!4126 thiss!1577)))))))))

(assert (=> d!56643 d!56667))

(declare-fun d!56669 () Bool)

(declare-fun res!136807 () Bool)

(declare-fun e!113438 () Bool)

(assert (=> d!56669 (=> res!136807 e!113438)))

(assert (=> d!56669 (= res!136807 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (=> d!56669 (= (arrayRangesEq!608 lt!257589 (array!8204 (store (arr!4595 lt!257589) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) (size!3674 lt!257589)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))) e!113438)))

(declare-fun b!164183 () Bool)

(declare-fun e!113439 () Bool)

(assert (=> b!164183 (= e!113438 e!113439)))

(declare-fun res!136808 () Bool)

(assert (=> b!164183 (=> (not res!136808) (not e!113439))))

(assert (=> b!164183 (= res!136808 (= (select (arr!4595 lt!257589) #b00000000000000000000000000000000) (select (arr!4595 (array!8204 (store (arr!4595 lt!257589) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) (size!3674 lt!257589))) #b00000000000000000000000000000000)))))

(declare-fun b!164184 () Bool)

(assert (=> b!164184 (= e!113439 (arrayRangesEq!608 lt!257589 (array!8204 (store (arr!4595 lt!257589) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) (size!3674 lt!257589)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (= (and d!56669 (not res!136807)) b!164183))

(assert (= (and b!164183 res!136808) b!164184))

(assert (=> b!164183 m!260871))

(declare-fun m!260935 () Bool)

(assert (=> b!164183 m!260935))

(declare-fun m!260937 () Bool)

(assert (=> b!164184 m!260937))

(assert (=> b!164148 d!56669))

(declare-fun d!56671 () Bool)

(declare-fun res!136809 () Bool)

(declare-fun e!113440 () Bool)

(assert (=> d!56671 (=> res!136809 e!113440)))

(assert (=> d!56671 (= res!136809 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (=> d!56671 (= (arrayRangesEq!608 lt!257589 lt!257592 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))) e!113440)))

(declare-fun b!164185 () Bool)

(declare-fun e!113441 () Bool)

(assert (=> b!164185 (= e!113440 e!113441)))

(declare-fun res!136810 () Bool)

(assert (=> b!164185 (=> (not res!136810) (not e!113441))))

(assert (=> b!164185 (= res!136810 (= (select (arr!4595 lt!257589) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4595 lt!257592) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!164186 () Bool)

(assert (=> b!164186 (= e!113441 (arrayRangesEq!608 lt!257589 lt!257592 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))))))

(assert (= (and d!56671 (not res!136809)) b!164185))

(assert (= (and b!164185 res!136810) b!164186))

(declare-fun m!260939 () Bool)

(assert (=> b!164185 m!260939))

(assert (=> b!164185 m!260931))

(declare-fun m!260941 () Bool)

(assert (=> b!164186 m!260941))

(assert (=> b!164164 d!56671))

(assert (=> b!164153 d!56637))

(declare-fun d!56673 () Bool)

(assert (=> d!56673 (arrayRangesEq!608 lt!257589 (array!8204 (store (arr!4595 lt!257589) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) (size!3674 lt!257589)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)))))

(assert (=> d!56673 true))

(declare-fun _$8!174 () Unit!11425)

(assert (=> d!56673 (= (choose!199 lt!257589 (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577)) lt!257593) _$8!174)))

(declare-fun bs!14038 () Bool)

(assert (= bs!14038 d!56673))

(assert (=> bs!14038 m!260857))

(assert (=> bs!14038 m!260859))

(assert (=> d!56615 d!56673))

(declare-fun d!56675 () Bool)

(assert (=> d!56675 (= (remainingBits!0 ((_ sign_extend 32) (size!3674 (buf!4126 thiss!1577))) ((_ sign_extend 32) (currentByte!7688 thiss!1577)) ((_ sign_extend 32) (currentBit!7683 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3674 (buf!4126 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7688 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7683 thiss!1577)))))))

(assert (=> d!56651 d!56675))

(assert (=> d!56627 d!56639))

(declare-fun d!56677 () Bool)

(assert (=> d!56677 (arrayRangesEq!608 (buf!4126 thiss!1577) lt!257592 #b00000000000000000000000000000000 (currentByte!7688 thiss!1577))))

(assert (=> d!56677 true))

(declare-fun _$16!74 () Unit!11425)

(assert (=> d!56677 (= (choose!201 (buf!4126 thiss!1577) lt!257589 lt!257592 #b00000000000000000000000000000000 (currentByte!7688 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7688 thiss!1577))) _$16!74)))

(declare-fun bs!14039 () Bool)

(assert (= bs!14039 d!56677))

(assert (=> bs!14039 m!260749))

(assert (=> d!56627 d!56677))

(check-sat (not b!164186) (not d!56677) (not b!164182) (not d!56665) (not d!56673) (not b!164184) (not b!164180))
(check-sat)
