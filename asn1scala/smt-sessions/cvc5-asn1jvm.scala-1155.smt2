; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32686 () Bool)

(assert start!32686)

(declare-fun res!133793 () Bool)

(declare-fun e!109810 () Bool)

(assert (=> start!32686 (=> (not res!133793) (not e!109810))))

(declare-datatypes ((array!7696 0))(
  ( (array!7697 (arr!4399 (Array (_ BitVec 32) (_ BitVec 8))) (size!3478 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6124 0))(
  ( (BitStream!6125 (buf!3936 array!7696) (currentByte!7227 (_ BitVec 32)) (currentBit!7222 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6124)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32686 (= res!133793 (validate_offset_byte!0 ((_ sign_extend 32) (size!3478 (buf!3936 thiss!1602))) ((_ sign_extend 32) (currentByte!7227 thiss!1602)) ((_ sign_extend 32) (currentBit!7222 thiss!1602))))))

(assert (=> start!32686 e!109810))

(declare-fun e!109811 () Bool)

(declare-fun inv!12 (BitStream!6124) Bool)

(assert (=> start!32686 (and (inv!12 thiss!1602) e!109811)))

(declare-fun b!160361 () Bool)

(assert (=> b!160361 (= e!109810 (bvsge (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7222 thiss!1602))))))))) #b00000000000000000000000010000000))))

(declare-fun b!160362 () Bool)

(declare-fun array_inv!3225 (array!7696) Bool)

(assert (=> b!160362 (= e!109811 (array_inv!3225 (buf!3936 thiss!1602)))))

(assert (= (and start!32686 res!133793) b!160361))

(assert (= start!32686 b!160362))

(declare-fun m!253159 () Bool)

(assert (=> start!32686 m!253159))

(declare-fun m!253161 () Bool)

(assert (=> start!32686 m!253161))

(declare-fun m!253163 () Bool)

(assert (=> b!160361 m!253163))

(declare-fun m!253165 () Bool)

(assert (=> b!160362 m!253165))

(push 1)

(assert (not b!160362))

(assert (not start!32686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

