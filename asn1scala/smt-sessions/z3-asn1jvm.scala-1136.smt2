; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32148 () Bool)

(assert start!32148)

(declare-fun b!159134 () Bool)

(declare-fun res!132827 () Bool)

(declare-fun e!108569 () Bool)

(assert (=> b!159134 (=> res!132827 e!108569)))

(declare-fun lt!251101 () (_ BitVec 32))

(assert (=> b!159134 (= res!132827 (bvsle lt!251101 #b00000000000000000000000000000000))))

(declare-fun b!159135 () Bool)

(declare-fun e!108566 () Bool)

(declare-datatypes ((array!7553 0))(
  ( (array!7554 (arr!4343 (Array (_ BitVec 32) (_ BitVec 8))) (size!3422 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6012 0))(
  ( (BitStream!6013 (buf!3880 array!7553) (currentByte!7105 (_ BitVec 32)) (currentBit!7100 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6012)

(declare-fun lt!251103 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159135 (= e!108566 (byteRangesEq!0 (select (arr!4343 (buf!3880 thiss!1602)) (currentByte!7105 thiss!1602)) lt!251103 #b00000000000000000000000000000000 (currentBit!7100 thiss!1602)))))

(declare-fun res!132825 () Bool)

(declare-fun e!108570 () Bool)

(assert (=> start!32148 (=> (not res!132825) (not e!108570))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32148 (= res!132825 (validate_offset_byte!0 ((_ sign_extend 32) (size!3422 (buf!3880 thiss!1602))) ((_ sign_extend 32) (currentByte!7105 thiss!1602)) ((_ sign_extend 32) (currentBit!7100 thiss!1602))))))

(assert (=> start!32148 e!108570))

(declare-fun e!108568 () Bool)

(declare-fun inv!12 (BitStream!6012) Bool)

(assert (=> start!32148 (and (inv!12 thiss!1602) e!108568)))

(assert (=> start!32148 true))

(declare-fun b!159136 () Bool)

(assert (=> b!159136 (= e!108570 (not e!108569))))

(declare-fun res!132826 () Bool)

(assert (=> b!159136 (=> res!132826 e!108569)))

(declare-fun lt!251100 () array!7553)

(declare-datatypes ((Unit!10779 0))(
  ( (Unit!10780) )
))
(declare-datatypes ((tuple3!746 0))(
  ( (tuple3!747 (_1!7721 Unit!10779) (_2!7721 (_ BitVec 8)) (_3!490 BitStream!6012)) )
))
(declare-fun lt!251108 () tuple3!746)

(declare-fun arrayRangesEq!473 (array!7553 array!7553 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159136 (= res!132826 (not (arrayRangesEq!473 (buf!3880 thiss!1602) lt!251100 #b00000000000000000000000000000000 (bvsub (currentByte!7105 (_3!490 lt!251108)) #b00000000000000000000000000000001))))))

(declare-fun lt!251105 () (_ BitVec 8))

(assert (=> b!159136 (arrayRangesEq!473 (buf!3880 thiss!1602) (array!7554 (store (arr!4343 (buf!3880 thiss!1602)) (bvsub (currentByte!7105 (_3!490 lt!251108)) #b00000000000000000000000000000001) lt!251105) (size!3422 (buf!3880 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7105 (_3!490 lt!251108)) #b00000000000000000000000000000001))))

(declare-fun lt!251099 () Unit!10779)

(declare-fun arrayUpdatedAtPrefixLemma!81 (array!7553 (_ BitVec 32) (_ BitVec 8)) Unit!10779)

(assert (=> b!159136 (= lt!251099 (arrayUpdatedAtPrefixLemma!81 (buf!3880 thiss!1602) (bvsub (currentByte!7105 (_3!490 lt!251108)) #b00000000000000000000000000000001) lt!251105))))

(assert (=> b!159136 (= lt!251105 (select (arr!4343 (buf!3880 (_3!490 lt!251108))) (bvsub (currentByte!7105 (_3!490 lt!251108)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251106 () (_ BitVec 32))

(declare-fun lt!251109 () (_ BitVec 8))

(declare-fun lt!251098 () (_ BitVec 8))

(declare-fun lt!251104 () (_ BitVec 32))

(declare-fun Unit!10781 () Unit!10779)

(declare-fun Unit!10782 () Unit!10779)

(assert (=> b!159136 (= lt!251108 (ite (bvsgt lt!251101 #b00000000000000000000000000000000) (let ((bdg!9307 ((_ extract 7 0) (bvnot lt!251106)))) (let ((bdg!9308 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4343 (buf!3880 thiss!1602)) (currentByte!7105 thiss!1602) lt!251098) (currentByte!7105 thiss!1602) lt!251103) (bvadd #b00000000000000000000000000000001 (currentByte!7105 thiss!1602)))) ((_ sign_extend 24) bdg!9307))))) (tuple3!747 Unit!10781 bdg!9307 (BitStream!6013 (array!7554 (store (arr!4343 (array!7554 (store (arr!4343 lt!251100) (bvadd #b00000000000000000000000000000001 (currentByte!7105 thiss!1602)) bdg!9308) (size!3422 lt!251100))) (bvadd #b00000000000000000000000000000001 (currentByte!7105 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9308) (bvshl ((_ sign_extend 24) v!222) lt!251104)))) (size!3422 (array!7554 (store (arr!4343 lt!251100) (bvadd #b00000000000000000000000000000001 (currentByte!7105 thiss!1602)) bdg!9308) (size!3422 lt!251100)))) (bvadd #b00000000000000000000000000000001 (currentByte!7105 thiss!1602)) (currentBit!7100 thiss!1602))))) (tuple3!747 Unit!10782 lt!251109 (BitStream!6013 lt!251100 (bvadd #b00000000000000000000000000000001 (currentByte!7105 thiss!1602)) (currentBit!7100 thiss!1602)))))))

(assert (=> b!159136 e!108566))

(declare-fun res!132824 () Bool)

(assert (=> b!159136 (=> res!132824 e!108566)))

(assert (=> b!159136 (= res!132824 (bvsge (currentByte!7105 thiss!1602) (size!3422 (buf!3880 thiss!1602))))))

(assert (=> b!159136 (= lt!251100 (array!7554 (store (store (arr!4343 (buf!3880 thiss!1602)) (currentByte!7105 thiss!1602) lt!251098) (currentByte!7105 thiss!1602) lt!251103) (size!3422 (buf!3880 thiss!1602))))))

(assert (=> b!159136 (= lt!251103 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251098) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251101))))))

(assert (=> b!159136 (= lt!251098 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4343 (buf!3880 thiss!1602)) (currentByte!7105 thiss!1602))) lt!251106)))))

(assert (=> b!159136 (= lt!251106 ((_ sign_extend 24) lt!251109))))

(assert (=> b!159136 (= lt!251109 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251104)))))))

(assert (=> b!159136 (= lt!251104 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251101))))))

(assert (=> b!159136 (= lt!251101 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7100 thiss!1602))))))

(declare-fun b!159137 () Bool)

(assert (=> b!159137 (= e!108569 true)))

(assert (=> b!159137 (arrayRangesEq!473 lt!251100 (array!7554 (store (store (store (arr!4343 (buf!3880 thiss!1602)) (currentByte!7105 thiss!1602) lt!251098) (currentByte!7105 thiss!1602) lt!251103) (currentByte!7105 (_3!490 lt!251108)) (select (arr!4343 (buf!3880 (_3!490 lt!251108))) (currentByte!7105 (_3!490 lt!251108)))) (size!3422 (buf!3880 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7105 (_3!490 lt!251108)))))

(declare-fun lt!251102 () Unit!10779)

(assert (=> b!159137 (= lt!251102 (arrayUpdatedAtPrefixLemma!81 lt!251100 (currentByte!7105 (_3!490 lt!251108)) (select (arr!4343 (buf!3880 (_3!490 lt!251108))) (currentByte!7105 (_3!490 lt!251108)))))))

(assert (=> b!159137 (arrayRangesEq!473 (buf!3880 thiss!1602) (array!7554 (store (arr!4343 (buf!3880 thiss!1602)) (currentByte!7105 (_3!490 lt!251108)) (select (arr!4343 (buf!3880 (_3!490 lt!251108))) (currentByte!7105 (_3!490 lt!251108)))) (size!3422 (buf!3880 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7105 (_3!490 lt!251108)))))

(declare-fun lt!251107 () Unit!10779)

(assert (=> b!159137 (= lt!251107 (arrayUpdatedAtPrefixLemma!81 (buf!3880 thiss!1602) (currentByte!7105 (_3!490 lt!251108)) (select (arr!4343 (buf!3880 (_3!490 lt!251108))) (currentByte!7105 (_3!490 lt!251108)))))))

(declare-fun b!159138 () Bool)

(declare-fun array_inv!3169 (array!7553) Bool)

(assert (=> b!159138 (= e!108568 (array_inv!3169 (buf!3880 thiss!1602)))))

(assert (= (and start!32148 res!132825) b!159136))

(assert (= (and b!159136 (not res!132824)) b!159135))

(assert (= (and b!159136 (not res!132826)) b!159134))

(assert (= (and b!159134 (not res!132827)) b!159137))

(assert (= start!32148 b!159138))

(declare-fun m!250367 () Bool)

(assert (=> b!159138 m!250367))

(declare-fun m!250369 () Bool)

(assert (=> start!32148 m!250369))

(declare-fun m!250371 () Bool)

(assert (=> start!32148 m!250371))

(declare-fun m!250373 () Bool)

(assert (=> b!159136 m!250373))

(declare-fun m!250375 () Bool)

(assert (=> b!159136 m!250375))

(declare-fun m!250377 () Bool)

(assert (=> b!159136 m!250377))

(declare-fun m!250379 () Bool)

(assert (=> b!159136 m!250379))

(declare-fun m!250381 () Bool)

(assert (=> b!159136 m!250381))

(declare-fun m!250383 () Bool)

(assert (=> b!159136 m!250383))

(declare-fun m!250385 () Bool)

(assert (=> b!159136 m!250385))

(declare-fun m!250387 () Bool)

(assert (=> b!159136 m!250387))

(declare-fun m!250389 () Bool)

(assert (=> b!159136 m!250389))

(declare-fun m!250391 () Bool)

(assert (=> b!159136 m!250391))

(declare-fun m!250393 () Bool)

(assert (=> b!159136 m!250393))

(declare-fun m!250395 () Bool)

(assert (=> b!159136 m!250395))

(declare-fun m!250397 () Bool)

(assert (=> b!159137 m!250397))

(declare-fun m!250399 () Bool)

(assert (=> b!159137 m!250399))

(declare-fun m!250401 () Bool)

(assert (=> b!159137 m!250401))

(assert (=> b!159137 m!250399))

(assert (=> b!159137 m!250381))

(declare-fun m!250403 () Bool)

(assert (=> b!159137 m!250403))

(assert (=> b!159137 m!250399))

(declare-fun m!250405 () Bool)

(assert (=> b!159137 m!250405))

(assert (=> b!159137 m!250389))

(declare-fun m!250407 () Bool)

(assert (=> b!159137 m!250407))

(declare-fun m!250409 () Bool)

(assert (=> b!159137 m!250409))

(assert (=> b!159135 m!250385))

(assert (=> b!159135 m!250385))

(declare-fun m!250411 () Bool)

(assert (=> b!159135 m!250411))

(check-sat (not b!159136) (not b!159135) (not b!159138) (not start!32148) (not b!159137))
