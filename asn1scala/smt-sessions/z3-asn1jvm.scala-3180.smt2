; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73108 () Bool)

(assert start!73108)

(declare-fun res!266851 () Bool)

(declare-fun e!234382 () Bool)

(assert (=> start!73108 (=> (not res!266851) (not e!234382))))

(declare-datatypes ((array!20968 0))(
  ( (array!20969 (arr!10199 (Array (_ BitVec 32) (_ BitVec 8))) (size!9107 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14376 0))(
  ( (BitStream!14377 (buf!8249 array!20968) (currentByte!15290 (_ BitVec 32)) (currentBit!15285 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14376)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73108 (= res!266851 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9107 (buf!8249 thiss!877))) ((_ sign_extend 32) (currentByte!15290 thiss!877)) ((_ sign_extend 32) (currentBit!15285 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73108 e!234382))

(declare-fun e!234383 () Bool)

(declare-fun inv!12 (BitStream!14376) Bool)

(assert (=> start!73108 (and (inv!12 thiss!877) e!234383)))

(declare-fun b!325152 () Bool)

(assert (=> b!325152 (= e!234382 false)))

(declare-fun b!325153 () Bool)

(declare-fun array_inv!8659 (array!20968) Bool)

(assert (=> b!325153 (= e!234383 (array_inv!8659 (buf!8249 thiss!877)))))

(assert (= (and start!73108 res!266851) b!325152))

(assert (= start!73108 b!325153))

(declare-fun m!463147 () Bool)

(assert (=> start!73108 m!463147))

(declare-fun m!463149 () Bool)

(assert (=> start!73108 m!463149))

(declare-fun m!463151 () Bool)

(assert (=> b!325153 m!463151))

(check-sat (not start!73108) (not b!325153))
