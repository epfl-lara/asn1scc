; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33306 () Bool)

(assert start!33306)

(declare-fun res!134086 () Bool)

(declare-fun e!110494 () Bool)

(assert (=> start!33306 (=> (not res!134086) (not e!110494))))

(declare-datatypes ((array!7875 0))(
  ( (array!7876 (arr!4464 (Array (_ BitVec 32) (_ BitVec 8))) (size!3543 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6254 0))(
  ( (BitStream!6255 (buf!4001 array!7875) (currentByte!7421 (_ BitVec 32)) (currentBit!7416 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6254)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33306 (= res!134086 (validate_offset_byte!0 ((_ sign_extend 32) (size!3543 (buf!4001 thiss!1602))) ((_ sign_extend 32) (currentByte!7421 thiss!1602)) ((_ sign_extend 32) (currentBit!7416 thiss!1602))))))

(assert (=> start!33306 e!110494))

(declare-fun e!110495 () Bool)

(declare-fun inv!12 (BitStream!6254) Bool)

(assert (=> start!33306 (and (inv!12 thiss!1602) e!110495)))

(assert (=> start!33306 true))

(declare-fun b!160849 () Bool)

(declare-fun lt!253181 () (_ BitVec 32))

(declare-fun lt!253182 () (_ BitVec 32))

(assert (=> b!160849 (= e!110494 (not (or (bvsle lt!253181 #b00000000000000000000000000000000) (bvsle lt!253182 #b00000000000000000000000000100000))))))

(declare-fun e!110496 () Bool)

(assert (=> b!160849 e!110496))

(declare-fun res!134087 () Bool)

(assert (=> b!160849 (=> res!134087 e!110496)))

(assert (=> b!160849 (= res!134087 (bvsge (currentByte!7421 thiss!1602) (size!3543 (buf!4001 thiss!1602))))))

(assert (=> b!160849 (= lt!253182 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253181))))))

(assert (=> b!160849 (= lt!253181 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7416 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160850 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160850 (= e!110496 (byteRangesEq!0 (select (arr!4464 (buf!4001 thiss!1602)) (currentByte!7421 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4464 (buf!4001 thiss!1602)) (currentByte!7421 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253182)))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253181))) #b00000000000000000000000000000000 (currentBit!7416 thiss!1602)))))

(declare-fun b!160851 () Bool)

(declare-fun array_inv!3290 (array!7875) Bool)

(assert (=> b!160851 (= e!110495 (array_inv!3290 (buf!4001 thiss!1602)))))

(assert (= (and start!33306 res!134086) b!160849))

(assert (= (and b!160849 (not res!134087)) b!160850))

(assert (= start!33306 b!160851))

(declare-fun m!254161 () Bool)

(assert (=> start!33306 m!254161))

(declare-fun m!254163 () Bool)

(assert (=> start!33306 m!254163))

(declare-fun m!254165 () Bool)

(assert (=> b!160850 m!254165))

(declare-fun m!254167 () Bool)

(assert (=> b!160850 m!254167))

(assert (=> b!160850 m!254165))

(declare-fun m!254169 () Bool)

(assert (=> b!160850 m!254169))

(declare-fun m!254171 () Bool)

(assert (=> b!160851 m!254171))

(push 1)

