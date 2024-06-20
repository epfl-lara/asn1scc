; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!596 () Bool)

(assert start!596)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!141 0))(
  ( (array!142 (arr!440 (Array (_ BitVec 32) (_ BitVec 8))) (size!53 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!141)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((BitStream!84 0))(
  ( (BitStream!85 (buf!362 array!141) (currentByte!1308 (_ BitVec 32)) (currentBit!1303 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!84)

(assert (=> start!596 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!53 srcBuffer!6)))) (or (bvsgt ((_ sign_extend 32) (size!53 (buf!362 thiss!1486))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1308 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1303 thiss!1486)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!596 true))

(declare-fun array_inv!48 (array!141) Bool)

(assert (=> start!596 (array_inv!48 srcBuffer!6)))

(declare-fun e!1159 () Bool)

(declare-fun inv!12 (BitStream!84) Bool)

(assert (=> start!596 (and (inv!12 thiss!1486) e!1159)))

(declare-fun b!1815 () Bool)

(assert (=> b!1815 (= e!1159 (array_inv!48 (buf!362 thiss!1486)))))

(assert (= start!596 b!1815))

(declare-fun m!1241 () Bool)

(assert (=> start!596 m!1241))

(declare-fun m!1243 () Bool)

(assert (=> start!596 m!1243))

(declare-fun m!1245 () Bool)

(assert (=> b!1815 m!1245))

(check-sat (not b!1815) (not start!596))
(check-sat)
