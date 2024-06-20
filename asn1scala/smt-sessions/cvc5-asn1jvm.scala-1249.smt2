; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35374 () Bool)

(assert start!35374)

(declare-fun b!165461 () Bool)

(declare-fun res!137818 () Bool)

(declare-fun e!114519 () Bool)

(assert (=> b!165461 (=> (not res!137818) (not e!114519))))

(declare-datatypes ((array!8424 0))(
  ( (array!8425 (arr!4681 (Array (_ BitVec 32) (_ BitVec 8))) (size!3760 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6676 0))(
  ( (BitStream!6677 (buf!4212 array!8424) (currentByte!7894 (_ BitVec 32)) (currentBit!7889 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6676)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165461 (= res!137818 (validate_offset_bits!1 ((_ sign_extend 32) (size!3760 (buf!4212 thiss!1577))) ((_ sign_extend 32) (currentByte!7894 thiss!1577)) ((_ sign_extend 32) (currentBit!7889 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165462 () Bool)

(declare-fun res!137817 () Bool)

(declare-fun e!114518 () Bool)

(assert (=> b!165462 (=> res!137817 e!114518)))

(declare-datatypes ((Unit!11510 0))(
  ( (Unit!11511) )
))
(declare-datatypes ((tuple2!14558 0))(
  ( (tuple2!14559 (_1!7870 Unit!11510) (_2!7870 BitStream!6676)) )
))
(declare-fun lt!258783 () tuple2!14558)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165462 (= res!137817 (not (= (bitIndex!0 (size!3760 (buf!4212 (_2!7870 lt!258783))) (currentByte!7894 (_2!7870 lt!258783)) (currentBit!7889 (_2!7870 lt!258783))) (bvadd (bitIndex!0 (size!3760 (buf!4212 thiss!1577)) (currentByte!7894 thiss!1577) (currentBit!7889 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!165463 () Bool)

(declare-fun e!114520 () Bool)

(assert (=> b!165463 (= e!114519 (not e!114520))))

(declare-fun res!137815 () Bool)

(assert (=> b!165463 (=> res!137815 e!114520)))

(declare-fun lt!258778 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165463 (= res!137815 (not (byteRangesEq!0 (select (arr!4681 (buf!4212 thiss!1577)) (currentByte!7894 thiss!1577)) lt!258778 #b00000000000000000000000000000000 (currentBit!7889 thiss!1577))))))

(declare-fun lt!258782 () array!8424)

(declare-fun arrayRangesEq!640 (array!8424 array!8424 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165463 (arrayRangesEq!640 (buf!4212 thiss!1577) lt!258782 #b00000000000000000000000000000000 (currentByte!7894 thiss!1577))))

(declare-fun lt!258780 () Unit!11510)

(declare-fun arrayUpdatedAtPrefixLemma!248 (array!8424 (_ BitVec 32) (_ BitVec 8)) Unit!11510)

(assert (=> b!165463 (= lt!258780 (arrayUpdatedAtPrefixLemma!248 (buf!4212 thiss!1577) (currentByte!7894 thiss!1577) lt!258778))))

(assert (=> b!165463 (= lt!258782 (array!8425 (store (arr!4681 (buf!4212 thiss!1577)) (currentByte!7894 thiss!1577) lt!258778) (size!3760 (buf!4212 thiss!1577))))))

(declare-fun lt!258779 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165463 (= lt!258778 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4681 (buf!4212 thiss!1577)) (currentByte!7894 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7889 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258779)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258779))))))

(assert (=> b!165463 (= lt!258779 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7889 thiss!1577) nBits!511)))))

(declare-fun res!137813 () Bool)

(assert (=> start!35374 (=> (not res!137813) (not e!114519))))

(assert (=> start!35374 (= res!137813 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35374 e!114519))

(assert (=> start!35374 true))

(declare-fun e!114521 () Bool)

(declare-fun inv!12 (BitStream!6676) Bool)

(assert (=> start!35374 (and (inv!12 thiss!1577) e!114521)))

(declare-fun b!165464 () Bool)

(declare-fun res!137816 () Bool)

(assert (=> b!165464 (=> (not res!137816) (not e!114519))))

(assert (=> b!165464 (= res!137816 (bvsle (bvadd (currentBit!7889 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!165465 () Bool)

(assert (=> b!165465 (= e!114518 (and (bvsge nBits!511 #b00000000000000000000000000000000) (bvslt nBits!511 #b00000000000000000000000000001001)))))

(declare-datatypes ((tuple2!14560 0))(
  ( (tuple2!14561 (_1!7871 BitStream!6676) (_2!7871 (_ BitVec 8))) )
))
(declare-fun lt!258781 () tuple2!14560)

(declare-fun readPartialBytePure!0 (BitStream!6676 (_ BitVec 32)) tuple2!14560)

(declare-datatypes ((tuple2!14562 0))(
  ( (tuple2!14563 (_1!7872 BitStream!6676) (_2!7872 BitStream!6676)) )
))
(declare-fun reader!0 (BitStream!6676 BitStream!6676) tuple2!14562)

(assert (=> b!165465 (= lt!258781 (readPartialBytePure!0 (_1!7872 (reader!0 thiss!1577 (_2!7870 lt!258783))) nBits!511))))

(declare-fun b!165466 () Bool)

(declare-fun res!137819 () Bool)

(assert (=> b!165466 (=> res!137819 e!114518)))

(declare-fun isPrefixOf!0 (BitStream!6676 BitStream!6676) Bool)

(assert (=> b!165466 (= res!137819 (not (isPrefixOf!0 thiss!1577 (_2!7870 lt!258783))))))

(declare-fun b!165467 () Bool)

(declare-fun array_inv!3501 (array!8424) Bool)

(assert (=> b!165467 (= e!114521 (array_inv!3501 (buf!4212 thiss!1577)))))

(declare-fun b!165468 () Bool)

(assert (=> b!165468 (= e!114520 e!114518)))

(declare-fun res!137814 () Bool)

(assert (=> b!165468 (=> res!137814 e!114518)))

(assert (=> b!165468 (= res!137814 (not (= (size!3760 (buf!4212 thiss!1577)) (size!3760 (buf!4212 (_2!7870 lt!258783))))))))

(declare-fun moveBitIndex!0 (BitStream!6676 (_ BitVec 64)) tuple2!14558)

(assert (=> b!165468 (= lt!258783 (moveBitIndex!0 (BitStream!6677 lt!258782 (currentByte!7894 thiss!1577) (currentBit!7889 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!35374 res!137813) b!165461))

(assert (= (and b!165461 res!137818) b!165464))

(assert (= (and b!165464 res!137816) b!165463))

(assert (= (and b!165463 (not res!137815)) b!165468))

(assert (= (and b!165468 (not res!137814)) b!165462))

(assert (= (and b!165462 (not res!137817)) b!165466))

(assert (= (and b!165466 (not res!137819)) b!165465))

(assert (= start!35374 b!165467))

(declare-fun m!262933 () Bool)

(assert (=> b!165468 m!262933))

(declare-fun m!262935 () Bool)

(assert (=> b!165463 m!262935))

(declare-fun m!262937 () Bool)

(assert (=> b!165463 m!262937))

(declare-fun m!262939 () Bool)

(assert (=> b!165463 m!262939))

(declare-fun m!262941 () Bool)

(assert (=> b!165463 m!262941))

(assert (=> b!165463 m!262935))

(declare-fun m!262943 () Bool)

(assert (=> b!165463 m!262943))

(declare-fun m!262945 () Bool)

(assert (=> b!165463 m!262945))

(declare-fun m!262947 () Bool)

(assert (=> b!165463 m!262947))

(declare-fun m!262949 () Bool)

(assert (=> b!165463 m!262949))

(declare-fun m!262951 () Bool)

(assert (=> b!165461 m!262951))

(declare-fun m!262953 () Bool)

(assert (=> b!165462 m!262953))

(declare-fun m!262955 () Bool)

(assert (=> b!165462 m!262955))

(declare-fun m!262957 () Bool)

(assert (=> b!165465 m!262957))

(declare-fun m!262959 () Bool)

(assert (=> b!165465 m!262959))

(declare-fun m!262961 () Bool)

(assert (=> start!35374 m!262961))

(declare-fun m!262963 () Bool)

(assert (=> b!165467 m!262963))

(declare-fun m!262965 () Bool)

(assert (=> b!165466 m!262965))

(push 1)

(assert (not b!165463))

(assert (not b!165467))

(assert (not start!35374))

(assert (not b!165462))

(assert (not b!165466))

(assert (not b!165465))

(assert (not b!165461))

(assert (not b!165468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

