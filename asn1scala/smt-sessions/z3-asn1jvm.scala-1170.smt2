; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33088 () Bool)

(assert start!33088)

(declare-fun res!133954 () Bool)

(declare-fun e!110249 () Bool)

(assert (=> start!33088 (=> (not res!133954) (not e!110249))))

(declare-datatypes ((array!7822 0))(
  ( (array!7823 (arr!4445 (Array (_ BitVec 32) (_ BitVec 8))) (size!3524 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6216 0))(
  ( (BitStream!6217 (buf!3982 array!7822) (currentByte!7357 (_ BitVec 32)) (currentBit!7352 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6216)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33088 (= res!133954 (validate_offset_byte!0 ((_ sign_extend 32) (size!3524 (buf!3982 thiss!1602))) ((_ sign_extend 32) (currentByte!7357 thiss!1602)) ((_ sign_extend 32) (currentBit!7352 thiss!1602))))))

(assert (=> start!33088 e!110249))

(declare-fun e!110248 () Bool)

(declare-fun inv!12 (BitStream!6216) Bool)

(assert (=> start!33088 (and (inv!12 thiss!1602) e!110248)))

(assert (=> start!33088 true))

(declare-fun b!160660 () Bool)

(declare-fun lt!253040 () (_ BitVec 32))

(declare-fun lt!253041 () (_ BitVec 32))

(assert (=> b!160660 (= e!110249 (not (or (bvsle lt!253040 #b00000000000000000000000000000000) (let ((bdg!9507 (bvnot lt!253041))) (or (bvsge bdg!9507 #b00000000000000000000000010000000) (bvsge bdg!9507 #b11111111111111111111111110000000))))))))

(declare-fun e!110247 () Bool)

(assert (=> b!160660 e!110247))

(declare-fun res!133955 () Bool)

(assert (=> b!160660 (=> res!133955 e!110247)))

(assert (=> b!160660 (= res!133955 (bvsge (currentByte!7357 thiss!1602) (size!3524 (buf!3982 thiss!1602))))))

(assert (=> b!160660 (= lt!253041 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253040)))))))))))

(assert (=> b!160660 (= lt!253040 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7352 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160661 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160661 (= e!110247 (byteRangesEq!0 (select (arr!4445 (buf!3982 thiss!1602)) (currentByte!7357 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4445 (buf!3982 thiss!1602)) (currentByte!7357 thiss!1602))) lt!253041))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253040))) #b00000000000000000000000000000000 (currentBit!7352 thiss!1602)))))

(declare-fun b!160662 () Bool)

(declare-fun array_inv!3271 (array!7822) Bool)

(assert (=> b!160662 (= e!110248 (array_inv!3271 (buf!3982 thiss!1602)))))

(assert (= (and start!33088 res!133954) b!160660))

(assert (= (and b!160660 (not res!133955)) b!160661))

(assert (= start!33088 b!160662))

(declare-fun m!253735 () Bool)

(assert (=> start!33088 m!253735))

(declare-fun m!253737 () Bool)

(assert (=> start!33088 m!253737))

(declare-fun m!253739 () Bool)

(assert (=> b!160660 m!253739))

(declare-fun m!253741 () Bool)

(assert (=> b!160661 m!253741))

(assert (=> b!160661 m!253741))

(declare-fun m!253743 () Bool)

(assert (=> b!160661 m!253743))

(declare-fun m!253745 () Bool)

(assert (=> b!160662 m!253745))

(check-sat (not b!160661) (not start!33088) (not b!160662))
(check-sat)
