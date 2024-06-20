; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32690 () Bool)

(assert start!32690)

(declare-fun res!133799 () Bool)

(declare-fun e!109828 () Bool)

(assert (=> start!32690 (=> (not res!133799) (not e!109828))))

(declare-datatypes ((array!7700 0))(
  ( (array!7701 (arr!4401 (Array (_ BitVec 32) (_ BitVec 8))) (size!3480 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6128 0))(
  ( (BitStream!6129 (buf!3938 array!7700) (currentByte!7229 (_ BitVec 32)) (currentBit!7224 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6128)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32690 (= res!133799 (validate_offset_byte!0 ((_ sign_extend 32) (size!3480 (buf!3938 thiss!1602))) ((_ sign_extend 32) (currentByte!7229 thiss!1602)) ((_ sign_extend 32) (currentBit!7224 thiss!1602))))))

(assert (=> start!32690 e!109828))

(declare-fun e!109829 () Bool)

(declare-fun inv!12 (BitStream!6128) Bool)

(assert (=> start!32690 (and (inv!12 thiss!1602) e!109829)))

(declare-fun b!160373 () Bool)

(assert (=> b!160373 (= e!109828 (bvsge (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7224 thiss!1602))))))))) #b00000000000000000000000010000000))))

(declare-fun b!160374 () Bool)

(declare-fun array_inv!3227 (array!7700) Bool)

(assert (=> b!160374 (= e!109829 (array_inv!3227 (buf!3938 thiss!1602)))))

(assert (= (and start!32690 res!133799) b!160373))

(assert (= start!32690 b!160374))

(declare-fun m!253175 () Bool)

(assert (=> start!32690 m!253175))

(declare-fun m!253177 () Bool)

(assert (=> start!32690 m!253177))

(declare-fun m!253179 () Bool)

(assert (=> b!160373 m!253179))

(declare-fun m!253181 () Bool)

(assert (=> b!160374 m!253181))

(push 1)

(assert (not start!32690))

(assert (not b!160374))

