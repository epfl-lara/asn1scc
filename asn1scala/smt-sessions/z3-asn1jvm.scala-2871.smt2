; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68762 () Bool)

(assert start!68762)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18891 0))(
  ( (array!18892 (arr!9281 (Array (_ BitVec 32) (_ BitVec 8))) (size!8198 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13506 0))(
  ( (BitStream!13507 (buf!7814 array!18891) (currentByte!14377 (_ BitVec 32)) (currentBit!14372 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13506)

(assert (=> start!68762 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!8198 (buf!7814 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14377 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14372 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!68762 true))

(declare-fun e!223093 () Bool)

(declare-fun inv!12 (BitStream!13506) Bool)

(assert (=> start!68762 (and (inv!12 bitStream!19) e!223093)))

(declare-fun b!310566 () Bool)

(declare-fun array_inv!7753 (array!18891) Bool)

(assert (=> b!310566 (= e!223093 (array_inv!7753 (buf!7814 bitStream!19)))))

(assert (= start!68762 b!310566))

(declare-fun m!448351 () Bool)

(assert (=> start!68762 m!448351))

(declare-fun m!448353 () Bool)

(assert (=> b!310566 m!448353))

(check-sat (not start!68762) (not b!310566))
(check-sat)
