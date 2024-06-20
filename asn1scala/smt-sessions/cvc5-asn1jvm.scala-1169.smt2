; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33080 () Bool)

(assert start!33080)

(declare-fun res!133930 () Bool)

(declare-fun e!110202 () Bool)

(assert (=> start!33080 (=> (not res!133930) (not e!110202))))

(declare-datatypes ((array!7814 0))(
  ( (array!7815 (arr!4441 (Array (_ BitVec 32) (_ BitVec 8))) (size!3520 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6208 0))(
  ( (BitStream!6209 (buf!3978 array!7814) (currentByte!7353 (_ BitVec 32)) (currentBit!7348 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6208)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33080 (= res!133930 (validate_offset_byte!0 ((_ sign_extend 32) (size!3520 (buf!3978 thiss!1602))) ((_ sign_extend 32) (currentByte!7353 thiss!1602)) ((_ sign_extend 32) (currentBit!7348 thiss!1602))))))

(assert (=> start!33080 e!110202))

(declare-fun e!110200 () Bool)

(declare-fun inv!12 (BitStream!6208) Bool)

(assert (=> start!33080 (and (inv!12 thiss!1602) e!110200)))

(assert (=> start!33080 true))

(declare-fun b!160624 () Bool)

(declare-fun lt!253016 () (_ BitVec 32))

(declare-fun lt!253017 () (_ BitVec 32))

(assert (=> b!160624 (= e!110202 (not (or (bvsle lt!253016 #b00000000000000000000000000000000) (bvslt (bvnot lt!253017) #b00000000000000000000000010000000))))))

(declare-fun e!110199 () Bool)

(assert (=> b!160624 e!110199))

(declare-fun res!133931 () Bool)

(assert (=> b!160624 (=> res!133931 e!110199)))

(assert (=> b!160624 (= res!133931 (bvsge (currentByte!7353 thiss!1602) (size!3520 (buf!3978 thiss!1602))))))

(assert (=> b!160624 (= lt!253017 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253016)))))))))))

(assert (=> b!160624 (= lt!253016 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7348 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160625 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160625 (= e!110199 (byteRangesEq!0 (select (arr!4441 (buf!3978 thiss!1602)) (currentByte!7353 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4441 (buf!3978 thiss!1602)) (currentByte!7353 thiss!1602))) lt!253017))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253016))) #b00000000000000000000000000000000 (currentBit!7348 thiss!1602)))))

(declare-fun b!160626 () Bool)

(declare-fun array_inv!3267 (array!7814) Bool)

(assert (=> b!160626 (= e!110200 (array_inv!3267 (buf!3978 thiss!1602)))))

(assert (= (and start!33080 res!133930) b!160624))

(assert (= (and b!160624 (not res!133931)) b!160625))

(assert (= start!33080 b!160626))

(declare-fun m!253687 () Bool)

(assert (=> start!33080 m!253687))

(declare-fun m!253689 () Bool)

(assert (=> start!33080 m!253689))

(declare-fun m!253691 () Bool)

(assert (=> b!160624 m!253691))

(declare-fun m!253693 () Bool)

(assert (=> b!160625 m!253693))

(assert (=> b!160625 m!253693))

(declare-fun m!253695 () Bool)

(assert (=> b!160625 m!253695))

(declare-fun m!253697 () Bool)

(assert (=> b!160626 m!253697))

(push 1)

(assert (not b!160625))

(assert (not start!33080))

(assert (not b!160626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

