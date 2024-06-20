; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32694 () Bool)

(assert start!32694)

(declare-fun res!133805 () Bool)

(declare-fun e!109848 () Bool)

(assert (=> start!32694 (=> (not res!133805) (not e!109848))))

(declare-datatypes ((array!7704 0))(
  ( (array!7705 (arr!4403 (Array (_ BitVec 32) (_ BitVec 8))) (size!3482 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6132 0))(
  ( (BitStream!6133 (buf!3940 array!7704) (currentByte!7231 (_ BitVec 32)) (currentBit!7226 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6132)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32694 (= res!133805 (validate_offset_byte!0 ((_ sign_extend 32) (size!3482 (buf!3940 thiss!1602))) ((_ sign_extend 32) (currentByte!7231 thiss!1602)) ((_ sign_extend 32) (currentBit!7226 thiss!1602))))))

(assert (=> start!32694 e!109848))

(declare-fun e!109847 () Bool)

(declare-fun inv!12 (BitStream!6132) Bool)

(assert (=> start!32694 (and (inv!12 thiss!1602) e!109847)))

(declare-fun b!160385 () Bool)

(declare-fun lt!252963 () (_ BitVec 32))

(assert (=> b!160385 (= e!109848 (and (bvslt lt!252963 #b00000000000000000000000010000000) (bvslt lt!252963 #b11111111111111111111111110000000)))))

(assert (=> b!160385 (= lt!252963 (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7226 thiss!1602))))))))))))

(declare-fun b!160386 () Bool)

(declare-fun array_inv!3229 (array!7704) Bool)

(assert (=> b!160386 (= e!109847 (array_inv!3229 (buf!3940 thiss!1602)))))

(assert (= (and start!32694 res!133805) b!160385))

(assert (= start!32694 b!160386))

(declare-fun m!253191 () Bool)

(assert (=> start!32694 m!253191))

(declare-fun m!253193 () Bool)

(assert (=> start!32694 m!253193))

(declare-fun m!253195 () Bool)

(assert (=> b!160385 m!253195))

(declare-fun m!253197 () Bool)

(assert (=> b!160386 m!253197))

(check-sat (not b!160386) (not start!32694))
(check-sat)
