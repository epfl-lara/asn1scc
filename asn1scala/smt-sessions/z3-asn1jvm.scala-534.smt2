; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15650 () Bool)

(assert start!15650)

(declare-fun b!79185 () Bool)

(declare-fun e!51957 () Bool)

(declare-datatypes ((array!3378 0))(
  ( (array!3379 (arr!2161 (Array (_ BitVec 32) (_ BitVec 8))) (size!1560 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2682 0))(
  ( (BitStream!2683 (buf!1950 array!3378) (currentByte!3821 (_ BitVec 32)) (currentBit!3816 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2682)

(declare-fun array_inv!1406 (array!3378) Bool)

(assert (=> b!79185 (= e!51957 (array_inv!1406 (buf!1950 thiss!1107)))))

(declare-fun b!79186 () Bool)

(declare-fun e!51956 () Bool)

(assert (=> b!79186 (= e!51956 (not true))))

(declare-fun e!51960 () Bool)

(assert (=> b!79186 e!51960))

(declare-fun res!65543 () Bool)

(assert (=> b!79186 (=> (not res!65543) (not e!51960))))

(declare-datatypes ((Unit!5205 0))(
  ( (Unit!5206) )
))
(declare-datatypes ((tuple2!7062 0))(
  ( (tuple2!7063 (_1!3668 Unit!5205) (_2!3668 BitStream!2682)) )
))
(declare-fun lt!126066 () tuple2!7062)

(assert (=> b!79186 (= res!65543 (= (size!1560 (buf!1950 thiss!1107)) (size!1560 (buf!1950 (_2!3668 lt!126066)))))))

(declare-fun lt!126065 () Bool)

(declare-fun appendBit!0 (BitStream!2682 Bool) tuple2!7062)

(assert (=> b!79186 (= lt!126066 (appendBit!0 thiss!1107 lt!126065))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!79186 (= lt!126065 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79187 () Bool)

(declare-fun res!65545 () Bool)

(assert (=> b!79187 (=> (not res!65545) (not e!51956))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79187 (= res!65545 (validate_offset_bit!0 ((_ sign_extend 32) (size!1560 (buf!1950 thiss!1107))) ((_ sign_extend 32) (currentByte!3821 thiss!1107)) ((_ sign_extend 32) (currentBit!3816 thiss!1107))))))

(declare-fun b!79188 () Bool)

(declare-fun e!51959 () Bool)

(declare-datatypes ((tuple2!7064 0))(
  ( (tuple2!7065 (_1!3669 BitStream!2682) (_2!3669 Bool)) )
))
(declare-fun lt!126069 () tuple2!7064)

(declare-fun lt!126068 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79188 (= e!51959 (= (bitIndex!0 (size!1560 (buf!1950 (_1!3669 lt!126069))) (currentByte!3821 (_1!3669 lt!126069)) (currentBit!3816 (_1!3669 lt!126069))) lt!126068))))

(declare-fun b!79189 () Bool)

(declare-fun e!51958 () Bool)

(assert (=> b!79189 (= e!51960 e!51958)))

(declare-fun res!65544 () Bool)

(assert (=> b!79189 (=> (not res!65544) (not e!51958))))

(declare-fun lt!126067 () (_ BitVec 64))

(assert (=> b!79189 (= res!65544 (= lt!126068 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126067)))))

(assert (=> b!79189 (= lt!126068 (bitIndex!0 (size!1560 (buf!1950 (_2!3668 lt!126066))) (currentByte!3821 (_2!3668 lt!126066)) (currentBit!3816 (_2!3668 lt!126066))))))

(assert (=> b!79189 (= lt!126067 (bitIndex!0 (size!1560 (buf!1950 thiss!1107)) (currentByte!3821 thiss!1107) (currentBit!3816 thiss!1107)))))

(declare-fun b!79190 () Bool)

(declare-fun res!65546 () Bool)

(assert (=> b!79190 (=> (not res!65546) (not e!51958))))

(declare-fun isPrefixOf!0 (BitStream!2682 BitStream!2682) Bool)

(assert (=> b!79190 (= res!65546 (isPrefixOf!0 thiss!1107 (_2!3668 lt!126066)))))

(declare-fun b!79191 () Bool)

(assert (=> b!79191 (= e!51958 e!51959)))

(declare-fun res!65547 () Bool)

(assert (=> b!79191 (=> (not res!65547) (not e!51959))))

(assert (=> b!79191 (= res!65547 (and (= (_2!3669 lt!126069) lt!126065) (= (_1!3669 lt!126069) (_2!3668 lt!126066))))))

(declare-fun readBitPure!0 (BitStream!2682) tuple2!7064)

(declare-fun readerFrom!0 (BitStream!2682 (_ BitVec 32) (_ BitVec 32)) BitStream!2682)

(assert (=> b!79191 (= lt!126069 (readBitPure!0 (readerFrom!0 (_2!3668 lt!126066) (currentBit!3816 thiss!1107) (currentByte!3821 thiss!1107))))))

(declare-fun res!65548 () Bool)

(assert (=> start!15650 (=> (not res!65548) (not e!51956))))

(assert (=> start!15650 (= res!65548 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15650 e!51956))

(assert (=> start!15650 true))

(declare-fun inv!12 (BitStream!2682) Bool)

(assert (=> start!15650 (and (inv!12 thiss!1107) e!51957)))

(assert (= (and start!15650 res!65548) b!79187))

(assert (= (and b!79187 res!65545) b!79186))

(assert (= (and b!79186 res!65543) b!79189))

(assert (= (and b!79189 res!65544) b!79190))

(assert (= (and b!79190 res!65546) b!79191))

(assert (= (and b!79191 res!65547) b!79188))

(assert (= start!15650 b!79185))

(declare-fun m!124615 () Bool)

(assert (=> b!79189 m!124615))

(declare-fun m!124617 () Bool)

(assert (=> b!79189 m!124617))

(declare-fun m!124619 () Bool)

(assert (=> b!79186 m!124619))

(declare-fun m!124621 () Bool)

(assert (=> b!79186 m!124621))

(declare-fun m!124623 () Bool)

(assert (=> b!79185 m!124623))

(declare-fun m!124625 () Bool)

(assert (=> b!79187 m!124625))

(declare-fun m!124627 () Bool)

(assert (=> start!15650 m!124627))

(declare-fun m!124629 () Bool)

(assert (=> b!79190 m!124629))

(declare-fun m!124631 () Bool)

(assert (=> b!79188 m!124631))

(declare-fun m!124633 () Bool)

(assert (=> b!79191 m!124633))

(assert (=> b!79191 m!124633))

(declare-fun m!124635 () Bool)

(assert (=> b!79191 m!124635))

(check-sat (not b!79190) (not b!79186) (not b!79191) (not b!79185) (not b!79187) (not b!79189) (not start!15650) (not b!79188))
