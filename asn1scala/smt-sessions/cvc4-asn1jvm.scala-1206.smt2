; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34234 () Bool)

(assert start!34234)

(declare-fun b!163078 () Bool)

(declare-fun e!112589 () Bool)

(declare-datatypes ((array!8105 0))(
  ( (array!8106 (arr!4554 (Array (_ BitVec 32) (_ BitVec 8))) (size!3633 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6422 0))(
  ( (BitStream!6423 (buf!4085 array!8105) (currentByte!7605 (_ BitVec 32)) (currentBit!7600 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6422)

(assert (=> b!163078 (= e!112589 (not (and (bvsle #b00000000000000000000000000000000 (currentBit!7600 thiss!1577)) (bvsle (currentBit!7600 thiss!1577) #b00000000000000000000000000001000))))))

(declare-fun lt!256198 () (_ BitVec 8))

(declare-fun arrayRangesEq!567 (array!8105 array!8105 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163078 (arrayRangesEq!567 (buf!4085 thiss!1577) (array!8106 (store (arr!4554 (buf!4085 thiss!1577)) (currentByte!7605 thiss!1577) lt!256198) (size!3633 (buf!4085 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7605 thiss!1577))))

(declare-datatypes ((Unit!11298 0))(
  ( (Unit!11299) )
))
(declare-fun lt!256200 () Unit!11298)

(declare-fun arrayUpdatedAtPrefixLemma!175 (array!8105 (_ BitVec 32) (_ BitVec 8)) Unit!11298)

(assert (=> b!163078 (= lt!256200 (arrayUpdatedAtPrefixLemma!175 (buf!4085 thiss!1577) (currentByte!7605 thiss!1577) lt!256198))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun lt!256199 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163078 (= lt!256198 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4554 (buf!4085 thiss!1577)) (currentByte!7605 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7600 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256199)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256199))))))

(assert (=> b!163078 (= lt!256199 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7600 thiss!1577) nBits!511)))))

(declare-fun b!163076 () Bool)

(declare-fun res!135853 () Bool)

(assert (=> b!163076 (=> (not res!135853) (not e!112589))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163076 (= res!135853 (validate_offset_bits!1 ((_ sign_extend 32) (size!3633 (buf!4085 thiss!1577))) ((_ sign_extend 32) (currentByte!7605 thiss!1577)) ((_ sign_extend 32) (currentBit!7600 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!135852 () Bool)

(assert (=> start!34234 (=> (not res!135852) (not e!112589))))

(assert (=> start!34234 (= res!135852 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34234 e!112589))

(assert (=> start!34234 true))

(declare-fun e!112588 () Bool)

(declare-fun inv!12 (BitStream!6422) Bool)

(assert (=> start!34234 (and (inv!12 thiss!1577) e!112588)))

(declare-fun b!163079 () Bool)

(declare-fun array_inv!3374 (array!8105) Bool)

(assert (=> b!163079 (= e!112588 (array_inv!3374 (buf!4085 thiss!1577)))))

(declare-fun b!163077 () Bool)

(declare-fun res!135851 () Bool)

(assert (=> b!163077 (=> (not res!135851) (not e!112589))))

(assert (=> b!163077 (= res!135851 (bvsle (bvadd (currentBit!7600 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34234 res!135852) b!163076))

(assert (= (and b!163076 res!135853) b!163077))

(assert (= (and b!163077 res!135851) b!163078))

(assert (= start!34234 b!163079))

(declare-fun m!258935 () Bool)

(assert (=> b!163078 m!258935))

(declare-fun m!258937 () Bool)

(assert (=> b!163078 m!258937))

(declare-fun m!258939 () Bool)

(assert (=> b!163078 m!258939))

(declare-fun m!258941 () Bool)

(assert (=> b!163078 m!258941))

(declare-fun m!258943 () Bool)

(assert (=> b!163078 m!258943))

(declare-fun m!258945 () Bool)

(assert (=> b!163078 m!258945))

(declare-fun m!258947 () Bool)

(assert (=> b!163078 m!258947))

(declare-fun m!258949 () Bool)

(assert (=> b!163076 m!258949))

(declare-fun m!258951 () Bool)

(assert (=> start!34234 m!258951))

(declare-fun m!258953 () Bool)

(assert (=> b!163079 m!258953))

(push 1)

(assert (not b!163079))

(assert (not b!163078))

(assert (not start!34234))

(assert (not b!163076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

