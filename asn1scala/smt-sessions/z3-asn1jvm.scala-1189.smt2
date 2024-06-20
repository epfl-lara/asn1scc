; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33814 () Bool)

(assert start!33814)

(declare-fun b!161558 () Bool)

(declare-fun e!111277 () Bool)

(declare-datatypes ((array!7985 0))(
  ( (array!7986 (arr!4502 (Array (_ BitVec 32) (_ BitVec 8))) (size!3581 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6330 0))(
  ( (BitStream!6331 (buf!4039 array!7985) (currentByte!7530 (_ BitVec 32)) (currentBit!7525 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6330)

(declare-fun array_inv!3328 (array!7985) Bool)

(assert (=> b!161558 (= e!111277 (array_inv!3328 (buf!4039 thiss!1602)))))

(declare-fun res!134681 () Bool)

(declare-fun e!111279 () Bool)

(assert (=> start!33814 (=> (not res!134681) (not e!111279))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33814 (= res!134681 (validate_offset_byte!0 ((_ sign_extend 32) (size!3581 (buf!4039 thiss!1602))) ((_ sign_extend 32) (currentByte!7530 thiss!1602)) ((_ sign_extend 32) (currentBit!7525 thiss!1602))))))

(assert (=> start!33814 e!111279))

(declare-fun inv!12 (BitStream!6330) Bool)

(assert (=> start!33814 (and (inv!12 thiss!1602) e!111277)))

(assert (=> start!33814 true))

(declare-fun b!161559 () Bool)

(declare-fun e!111275 () Bool)

(assert (=> b!161559 (= e!111279 (not e!111275))))

(declare-fun res!134684 () Bool)

(assert (=> b!161559 (=> res!134684 e!111275)))

(declare-fun lt!254297 () array!7985)

(declare-datatypes ((Unit!11094 0))(
  ( (Unit!11095) )
))
(declare-datatypes ((tuple3!890 0))(
  ( (tuple3!891 (_1!7796 Unit!11094) (_2!7796 (_ BitVec 8)) (_3!562 BitStream!6330)) )
))
(declare-fun lt!254299 () tuple3!890)

(declare-fun arrayRangesEq!533 (array!7985 array!7985 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161559 (= res!134684 (not (arrayRangesEq!533 (buf!4039 thiss!1602) lt!254297 #b00000000000000000000000000000000 (bvsub (currentByte!7530 (_3!562 lt!254299)) #b00000000000000000000000000000001))))))

(declare-fun lt!254302 () (_ BitVec 8))

(assert (=> b!161559 (arrayRangesEq!533 (buf!4039 thiss!1602) (array!7986 (store (arr!4502 (buf!4039 thiss!1602)) (bvsub (currentByte!7530 (_3!562 lt!254299)) #b00000000000000000000000000000001) lt!254302) (size!3581 (buf!4039 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7530 (_3!562 lt!254299)) #b00000000000000000000000000000001))))

(declare-fun lt!254295 () Unit!11094)

(declare-fun arrayUpdatedAtPrefixLemma!141 (array!7985 (_ BitVec 32) (_ BitVec 8)) Unit!11094)

(assert (=> b!161559 (= lt!254295 (arrayUpdatedAtPrefixLemma!141 (buf!4039 thiss!1602) (bvsub (currentByte!7530 (_3!562 lt!254299)) #b00000000000000000000000000000001) lt!254302))))

(assert (=> b!161559 (= lt!254302 (select (arr!4502 (buf!4039 (_3!562 lt!254299))) (bvsub (currentByte!7530 (_3!562 lt!254299)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254304 () (_ BitVec 8))

(declare-fun lt!254301 () (_ BitVec 32))

(declare-fun lt!254293 () (_ BitVec 32))

(declare-fun lt!254294 () (_ BitVec 32))

(declare-fun lt!254303 () (_ BitVec 8))

(declare-fun lt!254298 () (_ BitVec 8))

(declare-fun Unit!11096 () Unit!11094)

(declare-fun Unit!11097 () Unit!11094)

(assert (=> b!161559 (= lt!254299 (ite (bvsgt lt!254293 #b00000000000000000000000000000000) (let ((bdg!9663 ((_ extract 7 0) (bvnot lt!254294)))) (let ((bdg!9664 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4502 (buf!4039 thiss!1602)) (currentByte!7530 thiss!1602) lt!254298) (currentByte!7530 thiss!1602) lt!254303) (bvadd #b00000000000000000000000000000001 (currentByte!7530 thiss!1602)))) ((_ sign_extend 24) bdg!9663))))) (tuple3!891 Unit!11096 bdg!9663 (BitStream!6331 (array!7986 (store (arr!4502 (array!7986 (store (arr!4502 lt!254297) (bvadd #b00000000000000000000000000000001 (currentByte!7530 thiss!1602)) bdg!9664) (size!3581 lt!254297))) (bvadd #b00000000000000000000000000000001 (currentByte!7530 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9664) (bvshl ((_ sign_extend 24) v!222) lt!254301)))) (size!3581 (array!7986 (store (arr!4502 lt!254297) (bvadd #b00000000000000000000000000000001 (currentByte!7530 thiss!1602)) bdg!9664) (size!3581 lt!254297)))) (bvadd #b00000000000000000000000000000001 (currentByte!7530 thiss!1602)) (currentBit!7525 thiss!1602))))) (tuple3!891 Unit!11097 lt!254304 (BitStream!6331 lt!254297 (bvadd #b00000000000000000000000000000001 (currentByte!7530 thiss!1602)) (currentBit!7525 thiss!1602)))))))

(declare-fun e!111276 () Bool)

(assert (=> b!161559 e!111276))

(declare-fun res!134682 () Bool)

(assert (=> b!161559 (=> res!134682 e!111276)))

(assert (=> b!161559 (= res!134682 (bvsge (currentByte!7530 thiss!1602) (size!3581 (buf!4039 thiss!1602))))))

(assert (=> b!161559 (= lt!254297 (array!7986 (store (store (arr!4502 (buf!4039 thiss!1602)) (currentByte!7530 thiss!1602) lt!254298) (currentByte!7530 thiss!1602) lt!254303) (size!3581 (buf!4039 thiss!1602))))))

(assert (=> b!161559 (= lt!254303 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254298) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254293))))))

(assert (=> b!161559 (= lt!254298 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4502 (buf!4039 thiss!1602)) (currentByte!7530 thiss!1602))) lt!254294)))))

(assert (=> b!161559 (= lt!254294 ((_ sign_extend 24) lt!254304))))

(assert (=> b!161559 (= lt!254304 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254301)))))))

(assert (=> b!161559 (= lt!254301 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254293))))))

(assert (=> b!161559 (= lt!254293 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7525 thiss!1602))))))

(declare-fun b!161560 () Bool)

(declare-fun res!134683 () Bool)

(assert (=> b!161560 (=> res!134683 e!111275)))

(assert (=> b!161560 (= res!134683 (bvsle lt!254293 #b00000000000000000000000000000000))))

(declare-fun b!161561 () Bool)

(assert (=> b!161561 (= e!111275 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7530 (_3!562 lt!254299)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7530 (_3!562 lt!254299)) #b00000000000000000000000000000001) (currentByte!7530 (_3!562 lt!254299))) (bvsle (size!3581 (buf!4039 thiss!1602)) (size!3581 (buf!4039 (_3!562 lt!254299))))))))

(assert (=> b!161561 (arrayRangesEq!533 lt!254297 (array!7986 (store (store (store (arr!4502 (buf!4039 thiss!1602)) (currentByte!7530 thiss!1602) lt!254298) (currentByte!7530 thiss!1602) lt!254303) (currentByte!7530 (_3!562 lt!254299)) (select (arr!4502 (buf!4039 (_3!562 lt!254299))) (currentByte!7530 (_3!562 lt!254299)))) (size!3581 (buf!4039 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7530 (_3!562 lt!254299)))))

(declare-fun lt!254296 () Unit!11094)

(assert (=> b!161561 (= lt!254296 (arrayUpdatedAtPrefixLemma!141 lt!254297 (currentByte!7530 (_3!562 lt!254299)) (select (arr!4502 (buf!4039 (_3!562 lt!254299))) (currentByte!7530 (_3!562 lt!254299)))))))

(assert (=> b!161561 (arrayRangesEq!533 (buf!4039 thiss!1602) (array!7986 (store (arr!4502 (buf!4039 thiss!1602)) (currentByte!7530 (_3!562 lt!254299)) (select (arr!4502 (buf!4039 (_3!562 lt!254299))) (currentByte!7530 (_3!562 lt!254299)))) (size!3581 (buf!4039 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7530 (_3!562 lt!254299)))))

(declare-fun lt!254300 () Unit!11094)

(assert (=> b!161561 (= lt!254300 (arrayUpdatedAtPrefixLemma!141 (buf!4039 thiss!1602) (currentByte!7530 (_3!562 lt!254299)) (select (arr!4502 (buf!4039 (_3!562 lt!254299))) (currentByte!7530 (_3!562 lt!254299)))))))

(declare-fun b!161562 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161562 (= e!111276 (byteRangesEq!0 (select (arr!4502 (buf!4039 thiss!1602)) (currentByte!7530 thiss!1602)) lt!254303 #b00000000000000000000000000000000 (currentBit!7525 thiss!1602)))))

(assert (= (and start!33814 res!134681) b!161559))

(assert (= (and b!161559 (not res!134682)) b!161562))

(assert (= (and b!161559 (not res!134684)) b!161560))

(assert (= (and b!161560 (not res!134683)) b!161561))

(assert (= start!33814 b!161558))

(declare-fun m!255967 () Bool)

(assert (=> b!161559 m!255967))

(declare-fun m!255969 () Bool)

(assert (=> b!161559 m!255969))

(declare-fun m!255971 () Bool)

(assert (=> b!161559 m!255971))

(declare-fun m!255973 () Bool)

(assert (=> b!161559 m!255973))

(declare-fun m!255975 () Bool)

(assert (=> b!161559 m!255975))

(declare-fun m!255977 () Bool)

(assert (=> b!161559 m!255977))

(declare-fun m!255979 () Bool)

(assert (=> b!161559 m!255979))

(declare-fun m!255981 () Bool)

(assert (=> b!161559 m!255981))

(declare-fun m!255983 () Bool)

(assert (=> b!161559 m!255983))

(declare-fun m!255985 () Bool)

(assert (=> b!161559 m!255985))

(declare-fun m!255987 () Bool)

(assert (=> b!161559 m!255987))

(declare-fun m!255989 () Bool)

(assert (=> b!161559 m!255989))

(assert (=> b!161562 m!255971))

(assert (=> b!161562 m!255971))

(declare-fun m!255991 () Bool)

(assert (=> b!161562 m!255991))

(declare-fun m!255993 () Bool)

(assert (=> b!161558 m!255993))

(assert (=> b!161561 m!255969))

(declare-fun m!255995 () Bool)

(assert (=> b!161561 m!255995))

(declare-fun m!255997 () Bool)

(assert (=> b!161561 m!255997))

(declare-fun m!255999 () Bool)

(assert (=> b!161561 m!255999))

(declare-fun m!256001 () Bool)

(assert (=> b!161561 m!256001))

(assert (=> b!161561 m!255997))

(declare-fun m!256003 () Bool)

(assert (=> b!161561 m!256003))

(declare-fun m!256005 () Bool)

(assert (=> b!161561 m!256005))

(assert (=> b!161561 m!255997))

(declare-fun m!256007 () Bool)

(assert (=> b!161561 m!256007))

(assert (=> b!161561 m!255977))

(declare-fun m!256009 () Bool)

(assert (=> start!33814 m!256009))

(declare-fun m!256011 () Bool)

(assert (=> start!33814 m!256011))

(check-sat (not start!33814) (not b!161558) (not b!161559) (not b!161561) (not b!161562))
(check-sat)
