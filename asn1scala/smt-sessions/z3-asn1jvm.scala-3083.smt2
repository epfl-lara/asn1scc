; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71004 () Bool)

(assert start!71004)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20254 0))(
  ( (array!20255 (arr!9920 (Array (_ BitVec 32) (_ BitVec 8))) (size!8828 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13818 0))(
  ( (BitStream!13819 (buf!7970 array!20254) (currentByte!14701 (_ BitVec 32)) (currentBit!14696 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13818)

(assert (=> start!71004 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8828 (buf!7970 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14701 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14696 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71004 true))

(declare-fun e!230936 () Bool)

(declare-fun inv!12 (BitStream!13818) Bool)

(assert (=> start!71004 (and (inv!12 thiss!1780) e!230936)))

(declare-fun b!320767 () Bool)

(declare-fun array_inv!8380 (array!20254) Bool)

(assert (=> b!320767 (= e!230936 (array_inv!8380 (buf!7970 thiss!1780)))))

(assert (= start!71004 b!320767))

(declare-fun m!459133 () Bool)

(assert (=> start!71004 m!459133))

(declare-fun m!459135 () Bool)

(assert (=> b!320767 m!459135))

(check-sat (not start!71004) (not b!320767))
(check-sat)
