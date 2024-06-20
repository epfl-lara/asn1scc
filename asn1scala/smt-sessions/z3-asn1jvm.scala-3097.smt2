; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71352 () Bool)

(assert start!71352)

(declare-datatypes ((array!20369 0))(
  ( (array!20370 (arr!9962 (Array (_ BitVec 32) (_ BitVec 8))) (size!8870 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13902 0))(
  ( (BitStream!13903 (buf!8012 array!20369) (currentByte!14783 (_ BitVec 32)) (currentBit!14778 (_ BitVec 32))) )
))
(declare-fun b!176 () BitStream!13902)

(declare-fun diffInBytes!20 () (_ BitVec 32))

(assert (=> start!71352 (and (bvsle (bvneg (size!8870 (buf!8012 b!176))) diffInBytes!20) (bvsle diffInBytes!20 (size!8870 (buf!8012 b!176))) (let ((bdg!18809 (bvand ((_ sign_extend 32) (currentByte!14783 b!176)) #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18809 (bvand ((_ sign_extend 32) diffInBytes!20) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18809 (bvand (bvadd ((_ sign_extend 32) (currentByte!14783 b!176)) ((_ sign_extend 32) diffInBytes!20)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!231467 () Bool)

(declare-fun inv!12 (BitStream!13902) Bool)

(assert (=> start!71352 (and (inv!12 b!176) e!231467)))

(assert (=> start!71352 true))

(declare-fun b!321430 () Bool)

(declare-fun array_inv!8422 (array!20369) Bool)

(assert (=> b!321430 (= e!231467 (array_inv!8422 (buf!8012 b!176)))))

(assert (= start!71352 b!321430))

(declare-fun m!459751 () Bool)

(assert (=> start!71352 m!459751))

(declare-fun m!459753 () Bool)

(assert (=> b!321430 m!459753))

(check-sat (not start!71352) (not b!321430))
(check-sat)
