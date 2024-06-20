; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32350 () Bool)

(assert start!32350)

(declare-fun b!159638 () Bool)

(declare-fun e!109103 () Bool)

(declare-datatypes ((array!7611 0))(
  ( (array!7612 (arr!4366 (Array (_ BitVec 32) (_ BitVec 8))) (size!3445 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6058 0))(
  ( (BitStream!6059 (buf!3903 array!7611) (currentByte!7140 (_ BitVec 32)) (currentBit!7135 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6058)

(declare-datatypes ((Unit!10871 0))(
  ( (Unit!10872) )
))
(declare-datatypes ((tuple3!792 0))(
  ( (tuple3!793 (_1!7744 Unit!10871) (_2!7744 (_ BitVec 8)) (_3!513 BitStream!6058)) )
))
(declare-fun lt!252012 () tuple3!792)

(declare-fun arrayRangesEq!496 (array!7611 array!7611 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159638 (= e!109103 (arrayRangesEq!496 (buf!3903 thiss!1602) (buf!3903 (_3!513 lt!252012)) #b00000000000000000000000000000000 (currentByte!7140 thiss!1602)))))

(declare-fun c!8420 () Bool)

(declare-fun call!2690 () Bool)

(declare-fun bm!2687 () Bool)

(assert (=> bm!2687 (= call!2690 (arrayRangesEq!496 (buf!3903 thiss!1602) (ite c!8420 (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602))) (buf!3903 (_3!513 lt!252012))) #b00000000000000000000000000000000 (ite c!8420 (currentByte!7140 (_3!513 lt!252012)) (currentByte!7140 thiss!1602))))))

(declare-fun res!133258 () Bool)

(declare-fun e!109101 () Bool)

(assert (=> start!32350 (=> (not res!133258) (not e!109101))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32350 (= res!133258 (validate_offset_byte!0 ((_ sign_extend 32) (size!3445 (buf!3903 thiss!1602))) ((_ sign_extend 32) (currentByte!7140 thiss!1602)) ((_ sign_extend 32) (currentBit!7135 thiss!1602))))))

(assert (=> start!32350 e!109101))

(declare-fun e!109097 () Bool)

(declare-fun inv!12 (BitStream!6058) Bool)

(assert (=> start!32350 (and (inv!12 thiss!1602) e!109097)))

(assert (=> start!32350 true))

(declare-fun b!159639 () Bool)

(declare-fun e!109102 () Bool)

(assert (=> b!159639 (= e!109101 (not e!109102))))

(declare-fun res!133259 () Bool)

(assert (=> b!159639 (=> res!133259 e!109102)))

(declare-fun lt!252005 () array!7611)

(assert (=> b!159639 (= res!133259 (not (arrayRangesEq!496 (buf!3903 thiss!1602) lt!252005 #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001))))))

(declare-fun lt!252001 () (_ BitVec 8))

(assert (=> b!159639 (arrayRangesEq!496 (buf!3903 thiss!1602) (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) lt!252001) (size!3445 (buf!3903 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001))))

(declare-fun lt!252008 () Unit!10871)

(declare-fun arrayUpdatedAtPrefixLemma!104 (array!7611 (_ BitVec 32) (_ BitVec 8)) Unit!10871)

(assert (=> b!159639 (= lt!252008 (arrayUpdatedAtPrefixLemma!104 (buf!3903 thiss!1602) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) lt!252001))))

(assert (=> b!159639 (= lt!252001 (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(declare-fun lt!252004 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252007 () (_ BitVec 32))

(declare-fun lt!252010 () (_ BitVec 8))

(declare-fun lt!252006 () (_ BitVec 32))

(declare-fun lt!252002 () Bool)

(declare-fun lt!252011 () (_ BitVec 8))

(declare-fun Unit!10873 () Unit!10871)

(declare-fun Unit!10874 () Unit!10871)

(assert (=> b!159639 (= lt!252012 (ite lt!252002 (let ((bdg!9420 ((_ extract 7 0) (bvnot lt!252007)))) (let ((bdg!9421 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602) lt!252004) (currentByte!7140 thiss!1602) lt!252010) (bvadd #b00000000000000000000000000000001 (currentByte!7140 thiss!1602)))) ((_ sign_extend 24) bdg!9420))))) (tuple3!793 Unit!10873 bdg!9420 (BitStream!6059 (array!7612 (store (arr!4366 (array!7612 (store (arr!4366 lt!252005) (bvadd #b00000000000000000000000000000001 (currentByte!7140 thiss!1602)) bdg!9421) (size!3445 lt!252005))) (bvadd #b00000000000000000000000000000001 (currentByte!7140 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9421) (bvshl ((_ sign_extend 24) v!222) lt!252006)))) (size!3445 (array!7612 (store (arr!4366 lt!252005) (bvadd #b00000000000000000000000000000001 (currentByte!7140 thiss!1602)) bdg!9421) (size!3445 lt!252005)))) (bvadd #b00000000000000000000000000000001 (currentByte!7140 thiss!1602)) (currentBit!7135 thiss!1602))))) (tuple3!793 Unit!10874 lt!252011 (BitStream!6059 lt!252005 (bvadd #b00000000000000000000000000000001 (currentByte!7140 thiss!1602)) (currentBit!7135 thiss!1602)))))))

(declare-fun lt!252000 () (_ BitVec 32))

(assert (=> b!159639 (= lt!252002 (bvsgt lt!252000 #b00000000000000000000000000000000))))

(declare-fun e!109099 () Bool)

(assert (=> b!159639 e!109099))

(declare-fun res!133255 () Bool)

(assert (=> b!159639 (=> res!133255 e!109099)))

(assert (=> b!159639 (= res!133255 (bvsge (currentByte!7140 thiss!1602) (size!3445 (buf!3903 thiss!1602))))))

(assert (=> b!159639 (= lt!252005 (array!7612 (store (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602) lt!252004) (currentByte!7140 thiss!1602) lt!252010) (size!3445 (buf!3903 thiss!1602))))))

(assert (=> b!159639 (= lt!252010 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252004) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252000))))))

(assert (=> b!159639 (= lt!252004 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602))) lt!252007)))))

(assert (=> b!159639 (= lt!252007 ((_ sign_extend 24) lt!252011))))

(assert (=> b!159639 (= lt!252011 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252006)))))))

(assert (=> b!159639 (= lt!252006 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252000))))))

(assert (=> b!159639 (= lt!252000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7135 thiss!1602))))))

(declare-fun b!159640 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159640 (= e!109099 (byteRangesEq!0 (select (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602)) lt!252010 #b00000000000000000000000000000000 (currentBit!7135 thiss!1602)))))

(declare-fun b!159641 () Bool)

(declare-fun e!109104 () Unit!10871)

(declare-fun Unit!10875 () Unit!10871)

(assert (=> b!159641 (= e!109104 Unit!10875)))

(declare-fun lt!251998 () Unit!10871)

(assert (=> b!159641 (= lt!251998 (arrayUpdatedAtPrefixLemma!104 (buf!3903 thiss!1602) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))))))

(assert (=> b!159641 call!2690))

(declare-fun lt!252009 () Unit!10871)

(assert (=> b!159641 (= lt!252009 (arrayUpdatedAtPrefixLemma!104 lt!252005 (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))))))

(assert (=> b!159641 (arrayRangesEq!496 lt!252005 (array!7612 (store (store (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602) lt!252004) (currentByte!7140 thiss!1602) lt!252010) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7140 (_3!513 lt!252012)))))

(declare-fun lt!251999 () Unit!10871)

(declare-fun arrayRangesEqTransitive!130 (array!7611 array!7611 array!7611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10871)

(assert (=> b!159641 (= lt!251999 (arrayRangesEqTransitive!130 (buf!3903 thiss!1602) lt!252005 (buf!3903 (_3!513 lt!252012)) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) (currentByte!7140 (_3!513 lt!252012))))))

(declare-fun res!133257 () Bool)

(assert (=> b!159641 (= res!133257 (arrayRangesEq!496 (buf!3903 thiss!1602) (buf!3903 (_3!513 lt!252012)) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(assert (=> b!159641 (=> (not res!133257) (not e!109103))))

(assert (=> b!159641 e!109103))

(declare-fun b!159642 () Bool)

(declare-fun array_inv!3192 (array!7611) Bool)

(assert (=> b!159642 (= e!109097 (array_inv!3192 (buf!3903 thiss!1602)))))

(declare-fun b!159643 () Bool)

(declare-fun Unit!10876 () Unit!10871)

(assert (=> b!159643 (= e!109104 Unit!10876)))

(assert (=> b!159643 call!2690))

(declare-fun b!159644 () Bool)

(declare-fun e!109100 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159644 (= e!109100 (invariant!0 (currentBit!7135 (_3!513 lt!252012)) (currentByte!7140 (_3!513 lt!252012)) (size!3445 (buf!3903 (_3!513 lt!252012)))))))

(declare-fun b!159645 () Bool)

(assert (=> b!159645 (= e!109102 e!109100)))

(declare-fun res!133256 () Bool)

(assert (=> b!159645 (=> res!133256 e!109100)))

(assert (=> b!159645 (= res!133256 (not (= (size!3445 (buf!3903 thiss!1602)) (size!3445 (buf!3903 (_3!513 lt!252012))))))))

(declare-fun lt!252003 () Unit!10871)

(assert (=> b!159645 (= lt!252003 e!109104)))

(assert (=> b!159645 (= c!8420 lt!252002)))

(assert (= (and start!32350 res!133258) b!159639))

(assert (= (and b!159639 (not res!133255)) b!159640))

(assert (= (and b!159639 (not res!133259)) b!159645))

(assert (= (and b!159645 c!8420) b!159641))

(assert (= (and b!159645 (not c!8420)) b!159643))

(assert (= (and b!159641 res!133257) b!159638))

(assert (= (or b!159641 b!159643) bm!2687))

(assert (= (and b!159645 (not res!133256)) b!159644))

(assert (= start!32350 b!159642))

(declare-fun m!251707 () Bool)

(assert (=> b!159641 m!251707))

(declare-fun m!251709 () Bool)

(assert (=> b!159641 m!251709))

(declare-fun m!251711 () Bool)

(assert (=> b!159641 m!251711))

(declare-fun m!251713 () Bool)

(assert (=> b!159641 m!251713))

(declare-fun m!251715 () Bool)

(assert (=> b!159641 m!251715))

(declare-fun m!251717 () Bool)

(assert (=> b!159641 m!251717))

(declare-fun m!251719 () Bool)

(assert (=> b!159641 m!251719))

(assert (=> b!159641 m!251707))

(declare-fun m!251721 () Bool)

(assert (=> b!159641 m!251721))

(assert (=> b!159641 m!251707))

(declare-fun m!251723 () Bool)

(assert (=> b!159641 m!251723))

(declare-fun m!251725 () Bool)

(assert (=> b!159640 m!251725))

(assert (=> b!159640 m!251725))

(declare-fun m!251727 () Bool)

(assert (=> b!159640 m!251727))

(declare-fun m!251729 () Bool)

(assert (=> b!159638 m!251729))

(assert (=> bm!2687 m!251707))

(declare-fun m!251731 () Bool)

(assert (=> bm!2687 m!251731))

(declare-fun m!251733 () Bool)

(assert (=> bm!2687 m!251733))

(declare-fun m!251735 () Bool)

(assert (=> start!32350 m!251735))

(declare-fun m!251737 () Bool)

(assert (=> start!32350 m!251737))

(declare-fun m!251739 () Bool)

(assert (=> b!159644 m!251739))

(declare-fun m!251741 () Bool)

(assert (=> b!159642 m!251741))

(declare-fun m!251743 () Bool)

(assert (=> b!159639 m!251743))

(declare-fun m!251745 () Bool)

(assert (=> b!159639 m!251745))

(declare-fun m!251747 () Bool)

(assert (=> b!159639 m!251747))

(declare-fun m!251749 () Bool)

(assert (=> b!159639 m!251749))

(declare-fun m!251751 () Bool)

(assert (=> b!159639 m!251751))

(declare-fun m!251753 () Bool)

(assert (=> b!159639 m!251753))

(assert (=> b!159639 m!251721))

(declare-fun m!251755 () Bool)

(assert (=> b!159639 m!251755))

(assert (=> b!159639 m!251717))

(assert (=> b!159639 m!251725))

(declare-fun m!251757 () Bool)

(assert (=> b!159639 m!251757))

(declare-fun m!251759 () Bool)

(assert (=> b!159639 m!251759))

(push 1)

(assert (not start!32350))

(assert (not b!159644))

(assert (not b!159642))

(assert (not b!159640))

(assert (not bm!2687))

(assert (not b!159641))

(assert (not b!159639))

(assert (not b!159638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53773 () Bool)

(declare-fun res!133336 () Bool)

(declare-fun e!109199 () Bool)

(assert (=> d!53773 (=> res!133336 e!109199)))

(assert (=> d!53773 (= res!133336 (= #b00000000000000000000000000000000 (currentByte!7140 thiss!1602)))))

(assert (=> d!53773 (= (arrayRangesEq!496 (buf!3903 thiss!1602) (buf!3903 (_3!513 lt!252012)) #b00000000000000000000000000000000 (currentByte!7140 thiss!1602)) e!109199)))

(declare-fun b!159740 () Bool)

(declare-fun e!109200 () Bool)

(assert (=> b!159740 (= e!109199 e!109200)))

(declare-fun res!133337 () Bool)

(assert (=> b!159740 (=> (not res!133337) (not e!109200))))

(assert (=> b!159740 (= res!133337 (= (select (arr!4366 (buf!3903 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) #b00000000000000000000000000000000)))))

(declare-fun b!159741 () Bool)

(assert (=> b!159741 (= e!109200 (arrayRangesEq!496 (buf!3903 thiss!1602) (buf!3903 (_3!513 lt!252012)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7140 thiss!1602)))))

(assert (= (and d!53773 (not res!133336)) b!159740))

(assert (= (and b!159740 res!133337) b!159741))

(declare-fun m!251959 () Bool)

(assert (=> b!159740 m!251959))

(declare-fun m!251961 () Bool)

(assert (=> b!159740 m!251961))

(declare-fun m!251963 () Bool)

(assert (=> b!159741 m!251963))

(assert (=> b!159638 d!53773))

(declare-fun d!53775 () Bool)

(assert (=> d!53775 (= (array_inv!3192 (buf!3903 thiss!1602)) (bvsge (size!3445 (buf!3903 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159642 d!53775))

(declare-fun d!53777 () Bool)

(assert (=> d!53777 (= (byteRangesEq!0 (select (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602)) lt!252010 #b00000000000000000000000000000000 (currentBit!7135 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7135 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7135 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!252010) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7135 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13328 () Bool)

(assert (= bs!13328 d!53777))

(declare-fun m!251975 () Bool)

(assert (=> bs!13328 m!251975))

(declare-fun m!251977 () Bool)

(assert (=> bs!13328 m!251977))

(assert (=> b!159640 d!53777))

(declare-fun d!53789 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53789 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3445 (buf!3903 thiss!1602))) ((_ sign_extend 32) (currentByte!7140 thiss!1602)) ((_ sign_extend 32) (currentBit!7135 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3445 (buf!3903 thiss!1602))) ((_ sign_extend 32) (currentByte!7140 thiss!1602)) ((_ sign_extend 32) (currentBit!7135 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13329 () Bool)

(assert (= bs!13329 d!53789))

(declare-fun m!251979 () Bool)

(assert (=> bs!13329 m!251979))

(assert (=> start!32350 d!53789))

(declare-fun d!53793 () Bool)

(assert (=> d!53793 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7135 thiss!1602) (currentByte!7140 thiss!1602) (size!3445 (buf!3903 thiss!1602))))))

(declare-fun bs!13330 () Bool)

(assert (= bs!13330 d!53793))

(declare-fun m!251985 () Bool)

(assert (=> bs!13330 m!251985))

(assert (=> start!32350 d!53793))

(declare-fun d!53797 () Bool)

(declare-fun e!109217 () Bool)

(assert (=> d!53797 e!109217))

(declare-fun res!133354 () Bool)

(assert (=> d!53797 (=> (not res!133354) (not e!109217))))

(assert (=> d!53797 (= res!133354 (and (bvsge (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000000) (bvslt (currentByte!7140 (_3!513 lt!252012)) (size!3445 (buf!3903 thiss!1602)))))))

(declare-fun lt!252121 () Unit!10871)

(declare-fun choose!141 (array!7611 (_ BitVec 32) (_ BitVec 8)) Unit!10871)

(assert (=> d!53797 (= lt!252121 (choose!141 (buf!3903 thiss!1602) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))))))

(assert (=> d!53797 (and (bvsle #b00000000000000000000000000000000 (currentByte!7140 (_3!513 lt!252012))) (bvslt (currentByte!7140 (_3!513 lt!252012)) (size!3445 (buf!3903 thiss!1602))))))

(assert (=> d!53797 (= (arrayUpdatedAtPrefixLemma!104 (buf!3903 thiss!1602) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) lt!252121)))

(declare-fun b!159758 () Bool)

(assert (=> b!159758 (= e!109217 (arrayRangesEq!496 (buf!3903 thiss!1602) (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7140 (_3!513 lt!252012))))))

(assert (= (and d!53797 res!133354) b!159758))

(assert (=> d!53797 m!251707))

(declare-fun m!252001 () Bool)

(assert (=> d!53797 m!252001))

(assert (=> b!159758 m!251731))

(declare-fun m!252003 () Bool)

(assert (=> b!159758 m!252003))

(assert (=> b!159641 d!53797))

(declare-fun d!53811 () Bool)

(declare-fun res!133355 () Bool)

(declare-fun e!109218 () Bool)

(assert (=> d!53811 (=> res!133355 e!109218)))

(assert (=> d!53811 (= res!133355 (= #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(assert (=> d!53811 (= (arrayRangesEq!496 (buf!3903 thiss!1602) (buf!3903 (_3!513 lt!252012)) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)) e!109218)))

(declare-fun b!159759 () Bool)

(declare-fun e!109219 () Bool)

(assert (=> b!159759 (= e!109218 e!109219)))

(declare-fun res!133356 () Bool)

(assert (=> b!159759 (=> (not res!133356) (not e!109219))))

(assert (=> b!159759 (= res!133356 (= (select (arr!4366 (buf!3903 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) #b00000000000000000000000000000000)))))

(declare-fun b!159760 () Bool)

(assert (=> b!159760 (= e!109219 (arrayRangesEq!496 (buf!3903 thiss!1602) (buf!3903 (_3!513 lt!252012)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(assert (= (and d!53811 (not res!133355)) b!159759))

(assert (= (and b!159759 res!133356) b!159760))

(assert (=> b!159759 m!251959))

(assert (=> b!159759 m!251961))

(declare-fun m!252005 () Bool)

(assert (=> b!159760 m!252005))

(assert (=> b!159641 d!53811))

(declare-fun d!53813 () Bool)

(declare-fun e!109220 () Bool)

(assert (=> d!53813 e!109220))

(declare-fun res!133357 () Bool)

(assert (=> d!53813 (=> (not res!133357) (not e!109220))))

(assert (=> d!53813 (= res!133357 (and (bvsge (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000000) (bvslt (currentByte!7140 (_3!513 lt!252012)) (size!3445 lt!252005))))))

(declare-fun lt!252122 () Unit!10871)

(assert (=> d!53813 (= lt!252122 (choose!141 lt!252005 (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))))))

(assert (=> d!53813 (and (bvsle #b00000000000000000000000000000000 (currentByte!7140 (_3!513 lt!252012))) (bvslt (currentByte!7140 (_3!513 lt!252012)) (size!3445 lt!252005)))))

(assert (=> d!53813 (= (arrayUpdatedAtPrefixLemma!104 lt!252005 (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) lt!252122)))

(declare-fun b!159761 () Bool)

(assert (=> b!159761 (= e!109220 (arrayRangesEq!496 lt!252005 (array!7612 (store (arr!4366 lt!252005) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 lt!252005)) #b00000000000000000000000000000000 (currentByte!7140 (_3!513 lt!252012))))))

(assert (= (and d!53813 res!133357) b!159761))

(assert (=> d!53813 m!251707))

(declare-fun m!252007 () Bool)

(assert (=> d!53813 m!252007))

(declare-fun m!252009 () Bool)

(assert (=> b!159761 m!252009))

(declare-fun m!252011 () Bool)

(assert (=> b!159761 m!252011))

(assert (=> b!159641 d!53813))

(declare-fun d!53815 () Bool)

(declare-fun res!133358 () Bool)

(declare-fun e!109221 () Bool)

(assert (=> d!53815 (=> res!133358 e!109221)))

(assert (=> d!53815 (= res!133358 (= #b00000000000000000000000000000000 (currentByte!7140 (_3!513 lt!252012))))))

(assert (=> d!53815 (= (arrayRangesEq!496 lt!252005 (array!7612 (store (store (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602) lt!252004) (currentByte!7140 thiss!1602) lt!252010) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7140 (_3!513 lt!252012))) e!109221)))

(declare-fun b!159762 () Bool)

(declare-fun e!109222 () Bool)

(assert (=> b!159762 (= e!109221 e!109222)))

(declare-fun res!133359 () Bool)

(assert (=> b!159762 (=> (not res!133359) (not e!109222))))

(assert (=> b!159762 (= res!133359 (= (select (arr!4366 lt!252005) #b00000000000000000000000000000000) (select (arr!4366 (array!7612 (store (store (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602) lt!252004) (currentByte!7140 thiss!1602) lt!252010) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159763 () Bool)

(assert (=> b!159763 (= e!109222 (arrayRangesEq!496 lt!252005 (array!7612 (store (store (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 thiss!1602) lt!252004) (currentByte!7140 thiss!1602) lt!252010) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7140 (_3!513 lt!252012))))))

(assert (= (and d!53815 (not res!133358)) b!159762))

(assert (= (and b!159762 res!133359) b!159763))

(declare-fun m!252013 () Bool)

(assert (=> b!159762 m!252013))

(declare-fun m!252015 () Bool)

(assert (=> b!159762 m!252015))

(declare-fun m!252017 () Bool)

(assert (=> b!159763 m!252017))

(assert (=> b!159641 d!53815))

(declare-fun d!53817 () Bool)

(assert (=> d!53817 (arrayRangesEq!496 (buf!3903 thiss!1602) (buf!3903 (_3!513 lt!252012)) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001))))

(declare-fun lt!252125 () Unit!10871)

(declare-fun choose!142 (array!7611 array!7611 array!7611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10871)

(assert (=> d!53817 (= lt!252125 (choose!142 (buf!3903 thiss!1602) lt!252005 (buf!3903 (_3!513 lt!252012)) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) (currentByte!7140 (_3!513 lt!252012))))))

(assert (=> d!53817 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) (currentByte!7140 (_3!513 lt!252012))))))

(assert (=> d!53817 (= (arrayRangesEqTransitive!130 (buf!3903 thiss!1602) lt!252005 (buf!3903 (_3!513 lt!252012)) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) (currentByte!7140 (_3!513 lt!252012))) lt!252125)))

(declare-fun bs!13333 () Bool)

(assert (= bs!13333 d!53817))

(assert (=> bs!13333 m!251713))

(declare-fun m!252019 () Bool)

(assert (=> bs!13333 m!252019))

(assert (=> b!159641 d!53817))

(declare-fun d!53819 () Bool)

(declare-fun res!133360 () Bool)

(declare-fun e!109223 () Bool)

(assert (=> d!53819 (=> res!133360 e!109223)))

(assert (=> d!53819 (= res!133360 (= #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(assert (=> d!53819 (= (arrayRangesEq!496 (buf!3903 thiss!1602) lt!252005 #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)) e!109223)))

(declare-fun b!159764 () Bool)

(declare-fun e!109224 () Bool)

(assert (=> b!159764 (= e!109223 e!109224)))

(declare-fun res!133361 () Bool)

(assert (=> b!159764 (=> (not res!133361) (not e!109224))))

(assert (=> b!159764 (= res!133361 (= (select (arr!4366 (buf!3903 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4366 lt!252005) #b00000000000000000000000000000000)))))

(declare-fun b!159765 () Bool)

(assert (=> b!159765 (= e!109224 (arrayRangesEq!496 (buf!3903 thiss!1602) lt!252005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(assert (= (and d!53819 (not res!133360)) b!159764))

(assert (= (and b!159764 res!133361) b!159765))

(assert (=> b!159764 m!251959))

(assert (=> b!159764 m!252013))

(declare-fun m!252021 () Bool)

(assert (=> b!159765 m!252021))

(assert (=> b!159639 d!53819))

(declare-fun d!53821 () Bool)

(declare-fun res!133362 () Bool)

(declare-fun e!109225 () Bool)

(assert (=> d!53821 (=> res!133362 e!109225)))

(assert (=> d!53821 (= res!133362 (= #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(assert (=> d!53821 (= (arrayRangesEq!496 (buf!3903 thiss!1602) (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) lt!252001) (size!3445 (buf!3903 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)) e!109225)))

(declare-fun b!159766 () Bool)

(declare-fun e!109226 () Bool)

(assert (=> b!159766 (= e!109225 e!109226)))

(declare-fun res!133363 () Bool)

(assert (=> b!159766 (=> (not res!133363) (not e!109226))))

(assert (=> b!159766 (= res!133363 (= (select (arr!4366 (buf!3903 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4366 (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) lt!252001) (size!3445 (buf!3903 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159767 () Bool)

(assert (=> b!159767 (= e!109226 (arrayRangesEq!496 (buf!3903 thiss!1602) (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) lt!252001) (size!3445 (buf!3903 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(assert (= (and d!53821 (not res!133362)) b!159766))

(assert (= (and b!159766 res!133363) b!159767))

(assert (=> b!159766 m!251959))

(declare-fun m!252023 () Bool)

(assert (=> b!159766 m!252023))

(declare-fun m!252025 () Bool)

(assert (=> b!159767 m!252025))

(assert (=> b!159639 d!53821))

(declare-fun d!53823 () Bool)

(declare-fun e!109227 () Bool)

(assert (=> d!53823 e!109227))

(declare-fun res!133364 () Bool)

(assert (=> d!53823 (=> (not res!133364) (not e!109227))))

(assert (=> d!53823 (= res!133364 (and (bvsge (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) (size!3445 (buf!3903 thiss!1602)))))))

(declare-fun lt!252126 () Unit!10871)

(assert (=> d!53823 (= lt!252126 (choose!141 (buf!3903 thiss!1602) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) lt!252001))))

(assert (=> d!53823 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) (size!3445 (buf!3903 thiss!1602))))))

(assert (=> d!53823 (= (arrayUpdatedAtPrefixLemma!104 (buf!3903 thiss!1602) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) lt!252001) lt!252126)))

(declare-fun b!159768 () Bool)

(assert (=> b!159768 (= e!109227 (arrayRangesEq!496 (buf!3903 thiss!1602) (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001) lt!252001) (size!3445 (buf!3903 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000001)))))

(assert (= (and d!53823 res!133364) b!159768))

(declare-fun m!252027 () Bool)

(assert (=> d!53823 m!252027))

(assert (=> b!159768 m!251759))

(assert (=> b!159768 m!251753))

(assert (=> b!159639 d!53823))

(declare-fun d!53825 () Bool)

(assert (=> d!53825 (= (invariant!0 (currentBit!7135 (_3!513 lt!252012)) (currentByte!7140 (_3!513 lt!252012)) (size!3445 (buf!3903 (_3!513 lt!252012)))) (and (bvsge (currentBit!7135 (_3!513 lt!252012)) #b00000000000000000000000000000000) (bvslt (currentBit!7135 (_3!513 lt!252012)) #b00000000000000000000000000001000) (bvsge (currentByte!7140 (_3!513 lt!252012)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7140 (_3!513 lt!252012)) (size!3445 (buf!3903 (_3!513 lt!252012)))) (and (= (currentBit!7135 (_3!513 lt!252012)) #b00000000000000000000000000000000) (= (currentByte!7140 (_3!513 lt!252012)) (size!3445 (buf!3903 (_3!513 lt!252012))))))))))

(assert (=> b!159644 d!53825))

(declare-fun d!53827 () Bool)

(declare-fun res!133365 () Bool)

(declare-fun e!109228 () Bool)

(assert (=> d!53827 (=> res!133365 e!109228)))

(assert (=> d!53827 (= res!133365 (= #b00000000000000000000000000000000 (ite c!8420 (currentByte!7140 (_3!513 lt!252012)) (currentByte!7140 thiss!1602))))))

(assert (=> d!53827 (= (arrayRangesEq!496 (buf!3903 thiss!1602) (ite c!8420 (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602))) (buf!3903 (_3!513 lt!252012))) #b00000000000000000000000000000000 (ite c!8420 (currentByte!7140 (_3!513 lt!252012)) (currentByte!7140 thiss!1602))) e!109228)))

(declare-fun b!159769 () Bool)

(declare-fun e!109229 () Bool)

(assert (=> b!159769 (= e!109228 e!109229)))

(declare-fun res!133366 () Bool)

(assert (=> b!159769 (=> (not res!133366) (not e!109229))))

(assert (=> b!159769 (= res!133366 (= (select (arr!4366 (buf!3903 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4366 (ite c!8420 (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602))) (buf!3903 (_3!513 lt!252012)))) #b00000000000000000000000000000000)))))

(declare-fun b!159770 () Bool)

(assert (=> b!159770 (= e!109229 (arrayRangesEq!496 (buf!3903 thiss!1602) (ite c!8420 (array!7612 (store (arr!4366 (buf!3903 thiss!1602)) (currentByte!7140 (_3!513 lt!252012)) (select (arr!4366 (buf!3903 (_3!513 lt!252012))) (currentByte!7140 (_3!513 lt!252012)))) (size!3445 (buf!3903 thiss!1602))) (buf!3903 (_3!513 lt!252012))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8420 (currentByte!7140 (_3!513 lt!252012)) (currentByte!7140 thiss!1602))))))

(assert (= (and d!53827 (not res!133365)) b!159769))

(assert (= (and b!159769 res!133366) b!159770))

(assert (=> b!159769 m!251959))

(declare-fun m!252029 () Bool)

(assert (=> b!159769 m!252029))

(declare-fun m!252031 () Bool)

(assert (=> b!159770 m!252031))

(assert (=> bm!2687 d!53827))

(push 1)

(assert (not b!159760))

(assert (not b!159758))

(assert (not d!53797))

(assert (not d!53789))

(assert (not b!159768))

(assert (not d!53793))

(assert (not b!159770))

(assert (not d!53817))

(assert (not b!159763))

(assert (not d!53823))

(assert (not b!159767))

(assert (not b!159765))

(assert (not b!159741))

(assert (not d!53813))

(assert (not b!159761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

