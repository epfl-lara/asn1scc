; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33302 () Bool)

(assert start!33302)

(declare-fun res!134074 () Bool)

(declare-fun e!110472 () Bool)

(assert (=> start!33302 (=> (not res!134074) (not e!110472))))

(declare-datatypes ((array!7871 0))(
  ( (array!7872 (arr!4462 (Array (_ BitVec 32) (_ BitVec 8))) (size!3541 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6250 0))(
  ( (BitStream!6251 (buf!3999 array!7871) (currentByte!7419 (_ BitVec 32)) (currentBit!7414 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6250)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33302 (= res!134074 (validate_offset_byte!0 ((_ sign_extend 32) (size!3541 (buf!3999 thiss!1602))) ((_ sign_extend 32) (currentByte!7419 thiss!1602)) ((_ sign_extend 32) (currentBit!7414 thiss!1602))))))

(assert (=> start!33302 e!110472))

(declare-fun e!110470 () Bool)

(declare-fun inv!12 (BitStream!6250) Bool)

(assert (=> start!33302 (and (inv!12 thiss!1602) e!110470)))

(assert (=> start!33302 true))

(declare-fun b!160831 () Bool)

(declare-fun lt!253169 () (_ BitVec 32))

(declare-fun lt!253170 () (_ BitVec 32))

(assert (=> b!160831 (= e!110472 (not (or (bvsle lt!253169 #b00000000000000000000000000000000) (bvsle lt!253170 #b00000000000000000000000000100000))))))

(declare-fun e!110469 () Bool)

(assert (=> b!160831 e!110469))

(declare-fun res!134075 () Bool)

(assert (=> b!160831 (=> res!134075 e!110469)))

(assert (=> b!160831 (= res!134075 (bvsge (currentByte!7419 thiss!1602) (size!3541 (buf!3999 thiss!1602))))))

(assert (=> b!160831 (= lt!253170 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253169))))))

(assert (=> b!160831 (= lt!253169 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7414 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160832 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160832 (= e!110469 (byteRangesEq!0 (select (arr!4462 (buf!3999 thiss!1602)) (currentByte!7419 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4462 (buf!3999 thiss!1602)) (currentByte!7419 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253170)))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253169))) #b00000000000000000000000000000000 (currentBit!7414 thiss!1602)))))

(declare-fun b!160833 () Bool)

(declare-fun array_inv!3288 (array!7871) Bool)

(assert (=> b!160833 (= e!110470 (array_inv!3288 (buf!3999 thiss!1602)))))

(assert (= (and start!33302 res!134074) b!160831))

(assert (= (and b!160831 (not res!134075)) b!160832))

(assert (= start!33302 b!160833))

(declare-fun m!254137 () Bool)

(assert (=> start!33302 m!254137))

(declare-fun m!254139 () Bool)

(assert (=> start!33302 m!254139))

(declare-fun m!254141 () Bool)

(assert (=> b!160832 m!254141))

(declare-fun m!254143 () Bool)

(assert (=> b!160832 m!254143))

(assert (=> b!160832 m!254141))

(declare-fun m!254145 () Bool)

(assert (=> b!160832 m!254145))

(declare-fun m!254147 () Bool)

(assert (=> b!160833 m!254147))

(push 1)

(assert (not b!160832))

(assert (not start!33302))

(assert (not b!160833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

