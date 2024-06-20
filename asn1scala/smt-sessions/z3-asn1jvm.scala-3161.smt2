; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72652 () Bool)

(assert start!72652)

(declare-datatypes ((array!20814 0))(
  ( (array!20815 (arr!10142 (Array (_ BitVec 32) (_ BitVec 8))) (size!9050 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14262 0))(
  ( (BitStream!14263 (buf!8192 array!20814) (currentByte!15144 (_ BitVec 32)) (currentBit!15139 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14262)

(assert (=> start!72652 (or (bvsgt ((_ sign_extend 32) (size!9050 (buf!8192 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15144 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15139 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233768 () Bool)

(declare-fun inv!12 (BitStream!14262) Bool)

(assert (=> start!72652 (and (inv!12 thiss!877) e!233768)))

(declare-fun b!324343 () Bool)

(declare-fun array_inv!8602 (array!20814) Bool)

(assert (=> b!324343 (= e!233768 (array_inv!8602 (buf!8192 thiss!877)))))

(assert (= start!72652 b!324343))

(declare-fun m!462459 () Bool)

(assert (=> start!72652 m!462459))

(declare-fun m!462461 () Bool)

(assert (=> b!324343 m!462461))

(check-sat (not start!72652) (not b!324343))
(check-sat)
