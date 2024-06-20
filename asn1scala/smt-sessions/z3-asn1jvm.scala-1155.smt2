; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32688 () Bool)

(assert start!32688)

(declare-fun res!133796 () Bool)

(declare-fun e!109819 () Bool)

(assert (=> start!32688 (=> (not res!133796) (not e!109819))))

(declare-datatypes ((array!7698 0))(
  ( (array!7699 (arr!4400 (Array (_ BitVec 32) (_ BitVec 8))) (size!3479 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6126 0))(
  ( (BitStream!6127 (buf!3937 array!7698) (currentByte!7228 (_ BitVec 32)) (currentBit!7223 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6126)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32688 (= res!133796 (validate_offset_byte!0 ((_ sign_extend 32) (size!3479 (buf!3937 thiss!1602))) ((_ sign_extend 32) (currentByte!7228 thiss!1602)) ((_ sign_extend 32) (currentBit!7223 thiss!1602))))))

(assert (=> start!32688 e!109819))

(declare-fun e!109820 () Bool)

(declare-fun inv!12 (BitStream!6126) Bool)

(assert (=> start!32688 (and (inv!12 thiss!1602) e!109820)))

(declare-fun b!160367 () Bool)

(assert (=> b!160367 (= e!109819 (bvsge (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7223 thiss!1602))))))))) #b00000000000000000000000010000000))))

(declare-fun b!160368 () Bool)

(declare-fun array_inv!3226 (array!7698) Bool)

(assert (=> b!160368 (= e!109820 (array_inv!3226 (buf!3937 thiss!1602)))))

(assert (= (and start!32688 res!133796) b!160367))

(assert (= start!32688 b!160368))

(declare-fun m!253167 () Bool)

(assert (=> start!32688 m!253167))

(declare-fun m!253169 () Bool)

(assert (=> start!32688 m!253169))

(declare-fun m!253171 () Bool)

(assert (=> b!160367 m!253171))

(declare-fun m!253173 () Bool)

(assert (=> b!160368 m!253173))

(check-sat (not start!32688) (not b!160368))
(check-sat)
