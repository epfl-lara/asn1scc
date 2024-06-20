; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35378 () Bool)

(assert start!35378)

(declare-fun b!165509 () Bool)

(declare-fun res!137859 () Bool)

(declare-fun e!114548 () Bool)

(assert (=> b!165509 (=> (not res!137859) (not e!114548))))

(declare-datatypes ((array!8428 0))(
  ( (array!8429 (arr!4683 (Array (_ BitVec 32) (_ BitVec 8))) (size!3762 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6680 0))(
  ( (BitStream!6681 (buf!4214 array!8428) (currentByte!7896 (_ BitVec 32)) (currentBit!7891 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6680)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165509 (= res!137859 (validate_offset_bits!1 ((_ sign_extend 32) (size!3762 (buf!4214 thiss!1577))) ((_ sign_extend 32) (currentByte!7896 thiss!1577)) ((_ sign_extend 32) (currentBit!7891 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!137855 () Bool)

(assert (=> start!35378 (=> (not res!137855) (not e!114548))))

(assert (=> start!35378 (= res!137855 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35378 e!114548))

(assert (=> start!35378 true))

(declare-fun e!114551 () Bool)

(declare-fun inv!12 (BitStream!6680) Bool)

(assert (=> start!35378 (and (inv!12 thiss!1577) e!114551)))

(declare-fun b!165510 () Bool)

(declare-fun e!114549 () Bool)

(assert (=> b!165510 (= e!114548 (not e!114549))))

(declare-fun res!137861 () Bool)

(assert (=> b!165510 (=> res!137861 e!114549)))

(declare-fun lt!258815 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165510 (= res!137861 (not (byteRangesEq!0 (select (arr!4683 (buf!4214 thiss!1577)) (currentByte!7896 thiss!1577)) lt!258815 #b00000000000000000000000000000000 (currentBit!7891 thiss!1577))))))

(declare-fun lt!258818 () array!8428)

(declare-fun arrayRangesEq!642 (array!8428 array!8428 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165510 (arrayRangesEq!642 (buf!4214 thiss!1577) lt!258818 #b00000000000000000000000000000000 (currentByte!7896 thiss!1577))))

(declare-datatypes ((Unit!11514 0))(
  ( (Unit!11515) )
))
(declare-fun lt!258814 () Unit!11514)

(declare-fun arrayUpdatedAtPrefixLemma!250 (array!8428 (_ BitVec 32) (_ BitVec 8)) Unit!11514)

(assert (=> b!165510 (= lt!258814 (arrayUpdatedAtPrefixLemma!250 (buf!4214 thiss!1577) (currentByte!7896 thiss!1577) lt!258815))))

(assert (=> b!165510 (= lt!258818 (array!8429 (store (arr!4683 (buf!4214 thiss!1577)) (currentByte!7896 thiss!1577) lt!258815) (size!3762 (buf!4214 thiss!1577))))))

(declare-fun lt!258816 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165510 (= lt!258815 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4683 (buf!4214 thiss!1577)) (currentByte!7896 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7891 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258816)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258816))))))

(assert (=> b!165510 (= lt!258816 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7891 thiss!1577) nBits!511)))))

(declare-fun b!165511 () Bool)

(declare-fun array_inv!3503 (array!8428) Bool)

(assert (=> b!165511 (= e!114551 (array_inv!3503 (buf!4214 thiss!1577)))))

(declare-fun b!165512 () Bool)

(declare-fun e!114552 () Bool)

(assert (=> b!165512 (= e!114552 (and (bvsge nBits!511 #b00000000000000000000000000000000) (bvslt nBits!511 #b00000000000000000000000000001001)))))

(declare-datatypes ((tuple2!14570 0))(
  ( (tuple2!14571 (_1!7876 BitStream!6680) (_2!7876 (_ BitVec 8))) )
))
(declare-fun lt!258819 () tuple2!14570)

(declare-datatypes ((tuple2!14572 0))(
  ( (tuple2!14573 (_1!7877 Unit!11514) (_2!7877 BitStream!6680)) )
))
(declare-fun lt!258817 () tuple2!14572)

(declare-fun readPartialBytePure!0 (BitStream!6680 (_ BitVec 32)) tuple2!14570)

(declare-datatypes ((tuple2!14574 0))(
  ( (tuple2!14575 (_1!7878 BitStream!6680) (_2!7878 BitStream!6680)) )
))
(declare-fun reader!0 (BitStream!6680 BitStream!6680) tuple2!14574)

(assert (=> b!165512 (= lt!258819 (readPartialBytePure!0 (_1!7878 (reader!0 thiss!1577 (_2!7877 lt!258817))) nBits!511))))

(declare-fun b!165513 () Bool)

(declare-fun res!137858 () Bool)

(assert (=> b!165513 (=> res!137858 e!114552)))

(declare-fun isPrefixOf!0 (BitStream!6680 BitStream!6680) Bool)

(assert (=> b!165513 (= res!137858 (not (isPrefixOf!0 thiss!1577 (_2!7877 lt!258817))))))

(declare-fun b!165514 () Bool)

(declare-fun res!137860 () Bool)

(assert (=> b!165514 (=> res!137860 e!114552)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165514 (= res!137860 (not (= (bitIndex!0 (size!3762 (buf!4214 (_2!7877 lt!258817))) (currentByte!7896 (_2!7877 lt!258817)) (currentBit!7891 (_2!7877 lt!258817))) (bvadd (bitIndex!0 (size!3762 (buf!4214 thiss!1577)) (currentByte!7896 thiss!1577) (currentBit!7891 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!165515 () Bool)

(declare-fun res!137857 () Bool)

(assert (=> b!165515 (=> (not res!137857) (not e!114548))))

(assert (=> b!165515 (= res!137857 (bvsle (bvadd (currentBit!7891 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!165516 () Bool)

(assert (=> b!165516 (= e!114549 e!114552)))

(declare-fun res!137856 () Bool)

(assert (=> b!165516 (=> res!137856 e!114552)))

(assert (=> b!165516 (= res!137856 (not (= (size!3762 (buf!4214 thiss!1577)) (size!3762 (buf!4214 (_2!7877 lt!258817))))))))

(declare-fun moveBitIndex!0 (BitStream!6680 (_ BitVec 64)) tuple2!14572)

(assert (=> b!165516 (= lt!258817 (moveBitIndex!0 (BitStream!6681 lt!258818 (currentByte!7896 thiss!1577) (currentBit!7891 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!35378 res!137855) b!165509))

(assert (= (and b!165509 res!137859) b!165515))

(assert (= (and b!165515 res!137857) b!165510))

(assert (= (and b!165510 (not res!137861)) b!165516))

(assert (= (and b!165516 (not res!137856)) b!165514))

(assert (= (and b!165514 (not res!137860)) b!165513))

(assert (= (and b!165513 (not res!137858)) b!165512))

(assert (= start!35378 b!165511))

(declare-fun m!263001 () Bool)

(assert (=> start!35378 m!263001))

(declare-fun m!263003 () Bool)

(assert (=> b!165509 m!263003))

(declare-fun m!263005 () Bool)

(assert (=> b!165511 m!263005))

(declare-fun m!263007 () Bool)

(assert (=> b!165514 m!263007))

(declare-fun m!263009 () Bool)

(assert (=> b!165514 m!263009))

(declare-fun m!263011 () Bool)

(assert (=> b!165510 m!263011))

(declare-fun m!263013 () Bool)

(assert (=> b!165510 m!263013))

(declare-fun m!263015 () Bool)

(assert (=> b!165510 m!263015))

(declare-fun m!263017 () Bool)

(assert (=> b!165510 m!263017))

(declare-fun m!263019 () Bool)

(assert (=> b!165510 m!263019))

(declare-fun m!263021 () Bool)

(assert (=> b!165510 m!263021))

(declare-fun m!263023 () Bool)

(assert (=> b!165510 m!263023))

(assert (=> b!165510 m!263017))

(declare-fun m!263025 () Bool)

(assert (=> b!165510 m!263025))

(declare-fun m!263027 () Bool)

(assert (=> b!165512 m!263027))

(declare-fun m!263029 () Bool)

(assert (=> b!165512 m!263029))

(declare-fun m!263031 () Bool)

(assert (=> b!165513 m!263031))

(declare-fun m!263033 () Bool)

(assert (=> b!165516 m!263033))

(push 1)

(assert (not start!35378))

(assert (not b!165511))

(assert (not b!165512))

(assert (not b!165514))

(assert (not b!165510))

(assert (not b!165513))

(assert (not b!165509))

(assert (not b!165516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

