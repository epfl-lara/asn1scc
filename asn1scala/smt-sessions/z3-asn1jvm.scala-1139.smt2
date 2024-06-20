; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32208 () Bool)

(assert start!32208)

(declare-fun b!159326 () Bool)

(declare-fun e!108759 () Bool)

(declare-datatypes ((array!7574 0))(
  ( (array!7575 (arr!4352 (Array (_ BitVec 32) (_ BitVec 8))) (size!3431 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6030 0))(
  ( (BitStream!6031 (buf!3889 array!7574) (currentByte!7117 (_ BitVec 32)) (currentBit!7112 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6030)

(declare-fun array_inv!3178 (array!7574) Bool)

(assert (=> b!159326 (= e!108759 (array_inv!3178 (buf!3889 thiss!1602)))))

(declare-fun b!159327 () Bool)

(declare-fun e!108762 () Bool)

(declare-datatypes ((Unit!10815 0))(
  ( (Unit!10816) )
))
(declare-datatypes ((tuple3!764 0))(
  ( (tuple3!765 (_1!7730 Unit!10815) (_2!7730 (_ BitVec 8)) (_3!499 BitStream!6030)) )
))
(declare-fun lt!251469 () tuple3!764)

(assert (=> b!159327 (= e!108762 (or (bvsgt #b00000000000000000000000000000000 (currentByte!7117 thiss!1602)) (bvsle (size!3431 (buf!3889 thiss!1602)) (size!3431 (buf!3889 (_3!499 lt!251469))))))))

(declare-fun arrayRangesEq!482 (array!7574 array!7574 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159327 (arrayRangesEq!482 (buf!3889 thiss!1602) (buf!3889 (_3!499 lt!251469)) #b00000000000000000000000000000000 (bvsub (currentByte!7117 (_3!499 lt!251469)) #b00000000000000000000000000000001))))

(declare-fun lt!251463 () array!7574)

(declare-fun lt!251467 () Unit!10815)

(declare-fun arrayRangesEqTransitive!125 (array!7574 array!7574 array!7574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10815)

(assert (=> b!159327 (= lt!251467 (arrayRangesEqTransitive!125 (buf!3889 thiss!1602) lt!251463 (buf!3889 (_3!499 lt!251469)) #b00000000000000000000000000000000 (bvsub (currentByte!7117 (_3!499 lt!251469)) #b00000000000000000000000000000001) (currentByte!7117 (_3!499 lt!251469))))))

(declare-fun lt!251465 () (_ BitVec 8))

(declare-fun lt!251462 () (_ BitVec 8))

(assert (=> b!159327 (arrayRangesEq!482 lt!251463 (array!7575 (store (store (store (arr!4352 (buf!3889 thiss!1602)) (currentByte!7117 thiss!1602) lt!251465) (currentByte!7117 thiss!1602) lt!251462) (currentByte!7117 (_3!499 lt!251469)) (select (arr!4352 (buf!3889 (_3!499 lt!251469))) (currentByte!7117 (_3!499 lt!251469)))) (size!3431 (buf!3889 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7117 (_3!499 lt!251469)))))

(declare-fun lt!251461 () Unit!10815)

(declare-fun arrayUpdatedAtPrefixLemma!90 (array!7574 (_ BitVec 32) (_ BitVec 8)) Unit!10815)

(assert (=> b!159327 (= lt!251461 (arrayUpdatedAtPrefixLemma!90 lt!251463 (currentByte!7117 (_3!499 lt!251469)) (select (arr!4352 (buf!3889 (_3!499 lt!251469))) (currentByte!7117 (_3!499 lt!251469)))))))

(assert (=> b!159327 (arrayRangesEq!482 (buf!3889 thiss!1602) (array!7575 (store (arr!4352 (buf!3889 thiss!1602)) (currentByte!7117 (_3!499 lt!251469)) (select (arr!4352 (buf!3889 (_3!499 lt!251469))) (currentByte!7117 (_3!499 lt!251469)))) (size!3431 (buf!3889 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7117 (_3!499 lt!251469)))))

(declare-fun lt!251470 () Unit!10815)

(assert (=> b!159327 (= lt!251470 (arrayUpdatedAtPrefixLemma!90 (buf!3889 thiss!1602) (currentByte!7117 (_3!499 lt!251469)) (select (arr!4352 (buf!3889 (_3!499 lt!251469))) (currentByte!7117 (_3!499 lt!251469)))))))

(declare-fun b!159328 () Bool)

(declare-fun res!132992 () Bool)

(assert (=> b!159328 (=> res!132992 e!108762)))

(declare-fun lt!251468 () (_ BitVec 32))

(assert (=> b!159328 (= res!132992 (bvsle lt!251468 #b00000000000000000000000000000000))))

(declare-fun b!159329 () Bool)

(declare-fun e!108758 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159329 (= e!108758 (byteRangesEq!0 (select (arr!4352 (buf!3889 thiss!1602)) (currentByte!7117 thiss!1602)) lt!251462 #b00000000000000000000000000000000 (currentBit!7112 thiss!1602)))))

(declare-fun res!132989 () Bool)

(declare-fun e!108760 () Bool)

(assert (=> start!32208 (=> (not res!132989) (not e!108760))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32208 (= res!132989 (validate_offset_byte!0 ((_ sign_extend 32) (size!3431 (buf!3889 thiss!1602))) ((_ sign_extend 32) (currentByte!7117 thiss!1602)) ((_ sign_extend 32) (currentBit!7112 thiss!1602))))))

(assert (=> start!32208 e!108760))

(declare-fun inv!12 (BitStream!6030) Bool)

(assert (=> start!32208 (and (inv!12 thiss!1602) e!108759)))

(assert (=> start!32208 true))

(declare-fun b!159330 () Bool)

(assert (=> b!159330 (= e!108760 (not e!108762))))

(declare-fun res!132991 () Bool)

(assert (=> b!159330 (=> res!132991 e!108762)))

(assert (=> b!159330 (= res!132991 (not (arrayRangesEq!482 (buf!3889 thiss!1602) lt!251463 #b00000000000000000000000000000000 (bvsub (currentByte!7117 (_3!499 lt!251469)) #b00000000000000000000000000000001))))))

(declare-fun lt!251464 () (_ BitVec 8))

(assert (=> b!159330 (arrayRangesEq!482 (buf!3889 thiss!1602) (array!7575 (store (arr!4352 (buf!3889 thiss!1602)) (bvsub (currentByte!7117 (_3!499 lt!251469)) #b00000000000000000000000000000001) lt!251464) (size!3431 (buf!3889 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7117 (_3!499 lt!251469)) #b00000000000000000000000000000001))))

(declare-fun lt!251466 () Unit!10815)

(assert (=> b!159330 (= lt!251466 (arrayUpdatedAtPrefixLemma!90 (buf!3889 thiss!1602) (bvsub (currentByte!7117 (_3!499 lt!251469)) #b00000000000000000000000000000001) lt!251464))))

(assert (=> b!159330 (= lt!251464 (select (arr!4352 (buf!3889 (_3!499 lt!251469))) (bvsub (currentByte!7117 (_3!499 lt!251469)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251472 () (_ BitVec 32))

(declare-fun lt!251471 () (_ BitVec 8))

(declare-fun lt!251460 () (_ BitVec 32))

(declare-fun Unit!10817 () Unit!10815)

(declare-fun Unit!10818 () Unit!10815)

(assert (=> b!159330 (= lt!251469 (ite (bvsgt lt!251468 #b00000000000000000000000000000000) (let ((bdg!9350 ((_ extract 7 0) (bvnot lt!251472)))) (let ((bdg!9351 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4352 (buf!3889 thiss!1602)) (currentByte!7117 thiss!1602) lt!251465) (currentByte!7117 thiss!1602) lt!251462) (bvadd #b00000000000000000000000000000001 (currentByte!7117 thiss!1602)))) ((_ sign_extend 24) bdg!9350))))) (tuple3!765 Unit!10817 bdg!9350 (BitStream!6031 (array!7575 (store (arr!4352 (array!7575 (store (arr!4352 lt!251463) (bvadd #b00000000000000000000000000000001 (currentByte!7117 thiss!1602)) bdg!9351) (size!3431 lt!251463))) (bvadd #b00000000000000000000000000000001 (currentByte!7117 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9351) (bvshl ((_ sign_extend 24) v!222) lt!251460)))) (size!3431 (array!7575 (store (arr!4352 lt!251463) (bvadd #b00000000000000000000000000000001 (currentByte!7117 thiss!1602)) bdg!9351) (size!3431 lt!251463)))) (bvadd #b00000000000000000000000000000001 (currentByte!7117 thiss!1602)) (currentBit!7112 thiss!1602))))) (tuple3!765 Unit!10818 lt!251471 (BitStream!6031 lt!251463 (bvadd #b00000000000000000000000000000001 (currentByte!7117 thiss!1602)) (currentBit!7112 thiss!1602)))))))

(assert (=> b!159330 e!108758))

(declare-fun res!132990 () Bool)

(assert (=> b!159330 (=> res!132990 e!108758)))

(assert (=> b!159330 (= res!132990 (bvsge (currentByte!7117 thiss!1602) (size!3431 (buf!3889 thiss!1602))))))

(assert (=> b!159330 (= lt!251463 (array!7575 (store (store (arr!4352 (buf!3889 thiss!1602)) (currentByte!7117 thiss!1602) lt!251465) (currentByte!7117 thiss!1602) lt!251462) (size!3431 (buf!3889 thiss!1602))))))

(assert (=> b!159330 (= lt!251462 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251465) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251468))))))

(assert (=> b!159330 (= lt!251465 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4352 (buf!3889 thiss!1602)) (currentByte!7117 thiss!1602))) lt!251472)))))

(assert (=> b!159330 (= lt!251472 ((_ sign_extend 24) lt!251471))))

(assert (=> b!159330 (= lt!251471 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251460)))))))

(assert (=> b!159330 (= lt!251460 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251468))))))

(assert (=> b!159330 (= lt!251468 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7112 thiss!1602))))))

(assert (= (and start!32208 res!132989) b!159330))

(assert (= (and b!159330 (not res!132990)) b!159329))

(assert (= (and b!159330 (not res!132991)) b!159328))

(assert (= (and b!159328 (not res!132992)) b!159327))

(assert (= start!32208 b!159326))

(declare-fun m!250923 () Bool)

(assert (=> start!32208 m!250923))

(declare-fun m!250925 () Bool)

(assert (=> start!32208 m!250925))

(declare-fun m!250927 () Bool)

(assert (=> b!159330 m!250927))

(declare-fun m!250929 () Bool)

(assert (=> b!159330 m!250929))

(declare-fun m!250931 () Bool)

(assert (=> b!159330 m!250931))

(declare-fun m!250933 () Bool)

(assert (=> b!159330 m!250933))

(declare-fun m!250935 () Bool)

(assert (=> b!159330 m!250935))

(declare-fun m!250937 () Bool)

(assert (=> b!159330 m!250937))

(declare-fun m!250939 () Bool)

(assert (=> b!159330 m!250939))

(declare-fun m!250941 () Bool)

(assert (=> b!159330 m!250941))

(declare-fun m!250943 () Bool)

(assert (=> b!159330 m!250943))

(declare-fun m!250945 () Bool)

(assert (=> b!159330 m!250945))

(declare-fun m!250947 () Bool)

(assert (=> b!159330 m!250947))

(declare-fun m!250949 () Bool)

(assert (=> b!159330 m!250949))

(assert (=> b!159329 m!250939))

(assert (=> b!159329 m!250939))

(declare-fun m!250951 () Bool)

(assert (=> b!159329 m!250951))

(declare-fun m!250953 () Bool)

(assert (=> b!159327 m!250953))

(assert (=> b!159327 m!250935))

(assert (=> b!159327 m!250953))

(declare-fun m!250955 () Bool)

(assert (=> b!159327 m!250955))

(declare-fun m!250957 () Bool)

(assert (=> b!159327 m!250957))

(declare-fun m!250959 () Bool)

(assert (=> b!159327 m!250959))

(declare-fun m!250961 () Bool)

(assert (=> b!159327 m!250961))

(assert (=> b!159327 m!250927))

(declare-fun m!250963 () Bool)

(assert (=> b!159327 m!250963))

(assert (=> b!159327 m!250953))

(declare-fun m!250965 () Bool)

(assert (=> b!159327 m!250965))

(declare-fun m!250967 () Bool)

(assert (=> b!159327 m!250967))

(declare-fun m!250969 () Bool)

(assert (=> b!159327 m!250969))

(declare-fun m!250971 () Bool)

(assert (=> b!159326 m!250971))

(check-sat (not start!32208) (not b!159327) (not b!159329) (not b!159330) (not b!159326))
(check-sat)
