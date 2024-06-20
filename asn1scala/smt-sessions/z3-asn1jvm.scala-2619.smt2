; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64632 () Bool)

(assert start!64632)

(declare-fun b!290183 () Bool)

(declare-fun e!206641 () Bool)

(assert (=> b!290183 (= e!206641 (not true))))

(declare-datatypes ((array!17221 0))(
  ( (array!17222 (arr!8456 (Array (_ BitVec 32) (_ BitVec 8))) (size!7454 (_ BitVec 32))) )
))
(declare-fun lt!420876 () array!17221)

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((BitStream!12918 0))(
  ( (BitStream!12919 (buf!7520 array!17221) (currentByte!13927 (_ BitVec 32)) (currentBit!13922 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20149 0))(
  ( (Unit!20150) )
))
(declare-datatypes ((tuple3!1652 0))(
  ( (tuple3!1653 (_1!12631 Unit!20149) (_2!12631 BitStream!12918) (_3!1240 array!17221)) )
))
(declare-fun lt!420881 () tuple3!1652)

(declare-fun bitAt!0 (array!17221 (_ BitVec 64)) Bool)

(assert (=> b!290183 (= (bitAt!0 lt!420876 from!505) (bitAt!0 (_3!1240 lt!420881) from!505))))

(declare-fun lt!420880 () Unit!20149)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17221 array!17221 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20149)

(assert (=> b!290183 (= lt!420880 (arrayBitRangesEqImpliesEq!0 lt!420876 (_3!1240 lt!420881) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17221)

(declare-fun arrayBitRangesEq!0 (array!17221 array!17221 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290183 (arrayBitRangesEq!0 arr!273 (_3!1240 lt!420881) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420882 () Unit!20149)

(declare-fun arrayBitRangesEqTransitive!0 (array!17221 array!17221 array!17221 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20149)

(assert (=> b!290183 (= lt!420882 (arrayBitRangesEqTransitive!0 arr!273 lt!420876 (_3!1240 lt!420881) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290183 (arrayBitRangesEq!0 arr!273 lt!420876 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22782 0))(
  ( (tuple2!22783 (_1!12632 Bool) (_2!12632 BitStream!12918)) )
))
(declare-fun lt!420875 () tuple2!22782)

(declare-fun lt!420874 () Unit!20149)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17221 (_ BitVec 64) Bool) Unit!20149)

(assert (=> b!290183 (= lt!420874 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12632 lt!420875)))))

(declare-fun e!206639 () Bool)

(assert (=> b!290183 e!206639))

(declare-fun res!239741 () Bool)

(assert (=> b!290183 (=> (not res!239741) (not e!206639))))

(declare-fun thiss!1728 () BitStream!12918)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290183 (= res!239741 (= (bvsub (bvadd (bitIndex!0 (size!7454 (buf!7520 thiss!1728)) (currentByte!13927 thiss!1728) (currentBit!13922 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7454 (buf!7520 (_2!12631 lt!420881))) (currentByte!13927 (_2!12631 lt!420881)) (currentBit!13922 (_2!12631 lt!420881)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12918 (_ BitVec 64) array!17221 (_ BitVec 64) (_ BitVec 64)) tuple3!1652)

(assert (=> b!290183 (= lt!420881 (readBitsLoop!0 (_2!12632 lt!420875) nBits!523 lt!420876 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290183 (validate_offset_bits!1 ((_ sign_extend 32) (size!7454 (buf!7520 (_2!12632 lt!420875)))) ((_ sign_extend 32) (currentByte!13927 (_2!12632 lt!420875))) ((_ sign_extend 32) (currentBit!13922 (_2!12632 lt!420875))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420879 () Unit!20149)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12918 BitStream!12918 (_ BitVec 64) (_ BitVec 64)) Unit!20149)

(assert (=> b!290183 (= lt!420879 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12632 lt!420875) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420878 () (_ BitVec 32))

(declare-fun lt!420877 () (_ BitVec 32))

(assert (=> b!290183 (= lt!420876 (array!17222 (store (arr!8456 arr!273) lt!420878 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8456 arr!273) lt!420878)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420877)))) ((_ sign_extend 24) (ite (_1!12632 lt!420875) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420877) #b00000000))))) (size!7454 arr!273)))))

(assert (=> b!290183 (= lt!420877 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290183 (= lt!420878 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12918) tuple2!22782)

(assert (=> b!290183 (= lt!420875 (readBit!0 thiss!1728))))

(declare-fun b!290184 () Bool)

(declare-fun res!239740 () Bool)

(assert (=> b!290184 (=> (not res!239740) (not e!206641))))

(assert (=> b!290184 (= res!239740 (validate_offset_bits!1 ((_ sign_extend 32) (size!7454 (buf!7520 thiss!1728))) ((_ sign_extend 32) (currentByte!13927 thiss!1728)) ((_ sign_extend 32) (currentBit!13922 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290185 () Bool)

(assert (=> b!290185 (= e!206639 (and (= (buf!7520 thiss!1728) (buf!7520 (_2!12631 lt!420881))) (= (size!7454 arr!273) (size!7454 (_3!1240 lt!420881)))))))

(declare-fun res!239739 () Bool)

(assert (=> start!64632 (=> (not res!239739) (not e!206641))))

(assert (=> start!64632 (= res!239739 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7454 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64632 e!206641))

(declare-fun e!206643 () Bool)

(declare-fun inv!12 (BitStream!12918) Bool)

(assert (=> start!64632 (and (inv!12 thiss!1728) e!206643)))

(assert (=> start!64632 true))

(declare-fun array_inv!7066 (array!17221) Bool)

(assert (=> start!64632 (array_inv!7066 arr!273)))

(declare-fun b!290186 () Bool)

(assert (=> b!290186 (= e!206643 (array_inv!7066 (buf!7520 thiss!1728)))))

(declare-fun b!290187 () Bool)

(declare-fun res!239738 () Bool)

(assert (=> b!290187 (=> (not res!239738) (not e!206641))))

(assert (=> b!290187 (= res!239738 (bvslt from!505 to!474))))

(assert (= (and start!64632 res!239739) b!290184))

(assert (= (and b!290184 res!239740) b!290187))

(assert (= (and b!290187 res!239738) b!290183))

(assert (= (and b!290183 res!239741) b!290185))

(assert (= start!64632 b!290186))

(declare-fun m!423935 () Bool)

(assert (=> b!290183 m!423935))

(declare-fun m!423937 () Bool)

(assert (=> b!290183 m!423937))

(declare-fun m!423939 () Bool)

(assert (=> b!290183 m!423939))

(declare-fun m!423941 () Bool)

(assert (=> b!290183 m!423941))

(declare-fun m!423943 () Bool)

(assert (=> b!290183 m!423943))

(declare-fun m!423945 () Bool)

(assert (=> b!290183 m!423945))

(declare-fun m!423947 () Bool)

(assert (=> b!290183 m!423947))

(declare-fun m!423949 () Bool)

(assert (=> b!290183 m!423949))

(declare-fun m!423951 () Bool)

(assert (=> b!290183 m!423951))

(declare-fun m!423953 () Bool)

(assert (=> b!290183 m!423953))

(declare-fun m!423955 () Bool)

(assert (=> b!290183 m!423955))

(declare-fun m!423957 () Bool)

(assert (=> b!290183 m!423957))

(declare-fun m!423959 () Bool)

(assert (=> b!290183 m!423959))

(declare-fun m!423961 () Bool)

(assert (=> b!290183 m!423961))

(declare-fun m!423963 () Bool)

(assert (=> b!290183 m!423963))

(declare-fun m!423965 () Bool)

(assert (=> b!290183 m!423965))

(declare-fun m!423967 () Bool)

(assert (=> b!290184 m!423967))

(declare-fun m!423969 () Bool)

(assert (=> start!64632 m!423969))

(declare-fun m!423971 () Bool)

(assert (=> start!64632 m!423971))

(declare-fun m!423973 () Bool)

(assert (=> b!290186 m!423973))

(check-sat (not b!290184) (not b!290186) (not start!64632) (not b!290183))
