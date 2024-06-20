; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33090 () Bool)

(assert start!33090)

(declare-fun res!133961 () Bool)

(declare-fun e!110262 () Bool)

(assert (=> start!33090 (=> (not res!133961) (not e!110262))))

(declare-datatypes ((array!7824 0))(
  ( (array!7825 (arr!4446 (Array (_ BitVec 32) (_ BitVec 8))) (size!3525 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6218 0))(
  ( (BitStream!6219 (buf!3983 array!7824) (currentByte!7358 (_ BitVec 32)) (currentBit!7353 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6218)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33090 (= res!133961 (validate_offset_byte!0 ((_ sign_extend 32) (size!3525 (buf!3983 thiss!1602))) ((_ sign_extend 32) (currentByte!7358 thiss!1602)) ((_ sign_extend 32) (currentBit!7353 thiss!1602))))))

(assert (=> start!33090 e!110262))

(declare-fun e!110260 () Bool)

(declare-fun inv!12 (BitStream!6218) Bool)

(assert (=> start!33090 (and (inv!12 thiss!1602) e!110260)))

(assert (=> start!33090 true))

(declare-fun b!160669 () Bool)

(declare-fun lt!253046 () (_ BitVec 32))

(declare-fun lt!253047 () (_ BitVec 32))

(assert (=> b!160669 (= e!110262 (not (or (bvsle lt!253046 #b00000000000000000000000000000000) (let ((bdg!9507 (bvnot lt!253047))) (or (bvsge bdg!9507 #b00000000000000000000000010000000) (bvsge bdg!9507 #b11111111111111111111111110000000))))))))

(declare-fun e!110259 () Bool)

(assert (=> b!160669 e!110259))

(declare-fun res!133960 () Bool)

(assert (=> b!160669 (=> res!133960 e!110259)))

(assert (=> b!160669 (= res!133960 (bvsge (currentByte!7358 thiss!1602) (size!3525 (buf!3983 thiss!1602))))))

(assert (=> b!160669 (= lt!253047 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253046)))))))))))

(assert (=> b!160669 (= lt!253046 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7353 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160670 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160670 (= e!110259 (byteRangesEq!0 (select (arr!4446 (buf!3983 thiss!1602)) (currentByte!7358 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4446 (buf!3983 thiss!1602)) (currentByte!7358 thiss!1602))) lt!253047))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253046))) #b00000000000000000000000000000000 (currentBit!7353 thiss!1602)))))

(declare-fun b!160671 () Bool)

(declare-fun array_inv!3272 (array!7824) Bool)

(assert (=> b!160671 (= e!110260 (array_inv!3272 (buf!3983 thiss!1602)))))

(assert (= (and start!33090 res!133961) b!160669))

(assert (= (and b!160669 (not res!133960)) b!160670))

(assert (= start!33090 b!160671))

(declare-fun m!253747 () Bool)

(assert (=> start!33090 m!253747))

(declare-fun m!253749 () Bool)

(assert (=> start!33090 m!253749))

(declare-fun m!253751 () Bool)

(assert (=> b!160669 m!253751))

(declare-fun m!253753 () Bool)

(assert (=> b!160670 m!253753))

(assert (=> b!160670 m!253753))

(declare-fun m!253755 () Bool)

(assert (=> b!160670 m!253755))

(declare-fun m!253757 () Bool)

(assert (=> b!160671 m!253757))

(push 1)

(assert (not b!160670))

(assert (not start!33090))

(assert (not b!160671))

(check-sat)

