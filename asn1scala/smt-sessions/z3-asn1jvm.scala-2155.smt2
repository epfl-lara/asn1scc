; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54788 () Bool)

(assert start!54788)

(declare-fun nBits!539 () (_ BitVec 64))

(declare-fun from!530 () (_ BitVec 64))

(declare-datatypes ((array!13848 0))(
  ( (array!13849 (arr!7064 (Array (_ BitVec 32) (_ BitVec 8))) (size!6077 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11076 0))(
  ( (BitStream!11077 (buf!6599 array!13848) (currentByte!12083 (_ BitVec 32)) (currentBit!12078 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11076)

(assert (=> start!54788 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (or (bvsgt ((_ sign_extend 32) (size!6077 (buf!6599 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12083 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12078 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!54788 true))

(declare-fun e!177843 () Bool)

(declare-fun inv!12 (BitStream!11076) Bool)

(assert (=> start!54788 (and (inv!12 thiss!1774) e!177843)))

(declare-fun b!256660 () Bool)

(declare-fun array_inv!5818 (array!13848) Bool)

(assert (=> b!256660 (= e!177843 (array_inv!5818 (buf!6599 thiss!1774)))))

(assert (= start!54788 b!256660))

(declare-fun m!386251 () Bool)

(assert (=> start!54788 m!386251))

(declare-fun m!386253 () Bool)

(assert (=> b!256660 m!386253))

(check-sat (not b!256660) (not start!54788))
(check-sat)
