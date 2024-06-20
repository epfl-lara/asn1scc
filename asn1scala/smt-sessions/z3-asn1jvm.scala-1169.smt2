; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33082 () Bool)

(assert start!33082)

(declare-fun res!133937 () Bool)

(declare-fun e!110211 () Bool)

(assert (=> start!33082 (=> (not res!133937) (not e!110211))))

(declare-datatypes ((array!7816 0))(
  ( (array!7817 (arr!4442 (Array (_ BitVec 32) (_ BitVec 8))) (size!3521 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6210 0))(
  ( (BitStream!6211 (buf!3979 array!7816) (currentByte!7354 (_ BitVec 32)) (currentBit!7349 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6210)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33082 (= res!133937 (validate_offset_byte!0 ((_ sign_extend 32) (size!3521 (buf!3979 thiss!1602))) ((_ sign_extend 32) (currentByte!7354 thiss!1602)) ((_ sign_extend 32) (currentBit!7349 thiss!1602))))))

(assert (=> start!33082 e!110211))

(declare-fun e!110212 () Bool)

(declare-fun inv!12 (BitStream!6210) Bool)

(assert (=> start!33082 (and (inv!12 thiss!1602) e!110212)))

(assert (=> start!33082 true))

(declare-fun b!160633 () Bool)

(declare-fun lt!253022 () (_ BitVec 32))

(declare-fun lt!253023 () (_ BitVec 32))

(assert (=> b!160633 (= e!110211 (not (or (bvsle lt!253022 #b00000000000000000000000000000000) (bvslt (bvnot lt!253023) #b00000000000000000000000010000000))))))

(declare-fun e!110213 () Bool)

(assert (=> b!160633 e!110213))

(declare-fun res!133936 () Bool)

(assert (=> b!160633 (=> res!133936 e!110213)))

(assert (=> b!160633 (= res!133936 (bvsge (currentByte!7354 thiss!1602) (size!3521 (buf!3979 thiss!1602))))))

(assert (=> b!160633 (= lt!253023 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253022)))))))))))

(assert (=> b!160633 (= lt!253022 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7349 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160634 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160634 (= e!110213 (byteRangesEq!0 (select (arr!4442 (buf!3979 thiss!1602)) (currentByte!7354 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4442 (buf!3979 thiss!1602)) (currentByte!7354 thiss!1602))) lt!253023))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253022))) #b00000000000000000000000000000000 (currentBit!7349 thiss!1602)))))

(declare-fun b!160635 () Bool)

(declare-fun array_inv!3268 (array!7816) Bool)

(assert (=> b!160635 (= e!110212 (array_inv!3268 (buf!3979 thiss!1602)))))

(assert (= (and start!33082 res!133937) b!160633))

(assert (= (and b!160633 (not res!133936)) b!160634))

(assert (= start!33082 b!160635))

(declare-fun m!253699 () Bool)

(assert (=> start!33082 m!253699))

(declare-fun m!253701 () Bool)

(assert (=> start!33082 m!253701))

(declare-fun m!253703 () Bool)

(assert (=> b!160633 m!253703))

(declare-fun m!253705 () Bool)

(assert (=> b!160634 m!253705))

(assert (=> b!160634 m!253705))

(declare-fun m!253707 () Bool)

(assert (=> b!160634 m!253707))

(declare-fun m!253709 () Bool)

(assert (=> b!160635 m!253709))

(check-sat (not b!160634) (not start!33082) (not b!160635))
(check-sat)
