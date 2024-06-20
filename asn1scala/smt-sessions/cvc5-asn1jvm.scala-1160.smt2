; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32794 () Bool)

(assert start!32794)

(declare-fun res!133838 () Bool)

(declare-fun e!109947 () Bool)

(assert (=> start!32794 (=> (not res!133838) (not e!109947))))

(declare-datatypes ((array!7735 0))(
  ( (array!7736 (arr!4414 (Array (_ BitVec 32) (_ BitVec 8))) (size!3493 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6154 0))(
  ( (BitStream!6155 (buf!3951 array!7735) (currentByte!7263 (_ BitVec 32)) (currentBit!7258 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6154)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32794 (= res!133838 (validate_offset_byte!0 ((_ sign_extend 32) (size!3493 (buf!3951 thiss!1602))) ((_ sign_extend 32) (currentByte!7263 thiss!1602)) ((_ sign_extend 32) (currentBit!7258 thiss!1602))))))

(assert (=> start!32794 e!109947))

(declare-fun e!109946 () Bool)

(declare-fun inv!12 (BitStream!6154) Bool)

(assert (=> start!32794 (and (inv!12 thiss!1602) e!109946)))

(assert (=> start!32794 true))

(declare-fun lt!252972 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160451 () Bool)

(declare-fun lt!252971 () (_ BitVec 32))

(assert (=> b!160451 (= e!109947 (not (inv!12 (BitStream!6155 (array!7736 (store (store (arr!4414 (buf!3951 thiss!1602)) (currentByte!7263 thiss!1602) lt!252972) (currentByte!7263 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252972) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252971)))) (size!3493 (buf!3951 thiss!1602))) (currentByte!7263 thiss!1602) (currentBit!7258 thiss!1602)))))))

(assert (=> b!160451 (= lt!252972 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4414 (buf!3951 thiss!1602)) (currentByte!7263 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252971)))))))))))))

(assert (=> b!160451 (= lt!252971 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7258 thiss!1602))))))

(declare-fun b!160452 () Bool)

(declare-fun array_inv!3240 (array!7735) Bool)

(assert (=> b!160452 (= e!109946 (array_inv!3240 (buf!3951 thiss!1602)))))

(assert (= (and start!32794 res!133838) b!160451))

(assert (= start!32794 b!160452))

(declare-fun m!253327 () Bool)

(assert (=> start!32794 m!253327))

(declare-fun m!253329 () Bool)

(assert (=> start!32794 m!253329))

(declare-fun m!253331 () Bool)

(assert (=> b!160451 m!253331))

(declare-fun m!253333 () Bool)

(assert (=> b!160451 m!253333))

(declare-fun m!253335 () Bool)

(assert (=> b!160451 m!253335))

(declare-fun m!253337 () Bool)

(assert (=> b!160451 m!253337))

(declare-fun m!253339 () Bool)

(assert (=> b!160451 m!253339))

(declare-fun m!253341 () Bool)

(assert (=> b!160452 m!253341))

(push 1)

(assert (not b!160451))

(assert (not start!32794))

(assert (not b!160452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

