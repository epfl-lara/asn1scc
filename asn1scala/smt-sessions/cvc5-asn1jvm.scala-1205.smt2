; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34214 () Bool)

(assert start!34214)

(declare-fun b!163008 () Bool)

(declare-fun res!135797 () Bool)

(declare-fun e!112533 () Bool)

(assert (=> b!163008 (=> (not res!135797) (not e!112533))))

(declare-datatypes ((array!8094 0))(
  ( (array!8095 (arr!4549 (Array (_ BitVec 32) (_ BitVec 8))) (size!3628 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6412 0))(
  ( (BitStream!6413 (buf!4080 array!8094) (currentByte!7599 (_ BitVec 32)) (currentBit!7594 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6412)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163008 (= res!135797 (bvsle (bvadd (currentBit!7594 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163009 () Bool)

(assert (=> b!163009 (= e!112533 (not (or (bvsgt #b00000000000000000000000000000000 (currentByte!7599 thiss!1577)) (bvsle (currentByte!7599 thiss!1577) (size!3628 (buf!4080 thiss!1577))))))))

(declare-fun lt!256150 () (_ BitVec 8))

(declare-fun arrayRangesEq!562 (array!8094 array!8094 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163009 (arrayRangesEq!562 (buf!4080 thiss!1577) (array!8095 (store (arr!4549 (buf!4080 thiss!1577)) (currentByte!7599 thiss!1577) lt!256150) (size!3628 (buf!4080 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7599 thiss!1577))))

(declare-datatypes ((Unit!11288 0))(
  ( (Unit!11289) )
))
(declare-fun lt!256152 () Unit!11288)

(declare-fun arrayUpdatedAtPrefixLemma!170 (array!8094 (_ BitVec 32) (_ BitVec 8)) Unit!11288)

(assert (=> b!163009 (= lt!256152 (arrayUpdatedAtPrefixLemma!170 (buf!4080 thiss!1577) (currentByte!7599 thiss!1577) lt!256150))))

(declare-fun lt!256151 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163009 (= lt!256150 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4549 (buf!4080 thiss!1577)) (currentByte!7599 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7594 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256151)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256151))))))

(assert (=> b!163009 (= lt!256151 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7594 thiss!1577) nBits!511)))))

(declare-fun b!163010 () Bool)

(declare-fun e!112534 () Bool)

(declare-fun array_inv!3369 (array!8094) Bool)

(assert (=> b!163010 (= e!112534 (array_inv!3369 (buf!4080 thiss!1577)))))

(declare-fun b!163007 () Bool)

(declare-fun res!135798 () Bool)

(assert (=> b!163007 (=> (not res!135798) (not e!112533))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163007 (= res!135798 (validate_offset_bits!1 ((_ sign_extend 32) (size!3628 (buf!4080 thiss!1577))) ((_ sign_extend 32) (currentByte!7599 thiss!1577)) ((_ sign_extend 32) (currentBit!7594 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!135799 () Bool)

(assert (=> start!34214 (=> (not res!135799) (not e!112533))))

(assert (=> start!34214 (= res!135799 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34214 e!112533))

(assert (=> start!34214 true))

(declare-fun inv!12 (BitStream!6412) Bool)

(assert (=> start!34214 (and (inv!12 thiss!1577) e!112534)))

(assert (= (and start!34214 res!135799) b!163007))

(assert (= (and b!163007 res!135798) b!163008))

(assert (= (and b!163008 res!135797) b!163009))

(assert (= start!34214 b!163010))

(declare-fun m!258823 () Bool)

(assert (=> b!163009 m!258823))

(declare-fun m!258825 () Bool)

(assert (=> b!163009 m!258825))

(declare-fun m!258827 () Bool)

(assert (=> b!163009 m!258827))

(declare-fun m!258829 () Bool)

(assert (=> b!163009 m!258829))

(declare-fun m!258831 () Bool)

(assert (=> b!163009 m!258831))

(declare-fun m!258833 () Bool)

(assert (=> b!163009 m!258833))

(declare-fun m!258835 () Bool)

(assert (=> b!163009 m!258835))

(declare-fun m!258837 () Bool)

(assert (=> b!163010 m!258837))

(declare-fun m!258839 () Bool)

(assert (=> b!163007 m!258839))

(declare-fun m!258841 () Bool)

(assert (=> start!34214 m!258841))

(push 1)

(assert (not b!163007))

(assert (not start!34214))

(assert (not b!163009))

(assert (not b!163010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

