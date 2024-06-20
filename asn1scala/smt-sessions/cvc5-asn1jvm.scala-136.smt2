; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3246 () Bool)

(assert start!3246)

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!819 0))(
  ( (array!820 (arr!778 (Array (_ BitVec 32) (_ BitVec 8))) (size!349 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!658 0))(
  ( (BitStream!659 (buf!700 array!819) (currentByte!1841 (_ BitVec 32)) (currentBit!1836 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!658)

(assert (=> start!3246 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!349 (buf!700 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1841 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1836 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3246 true))

(declare-fun e!9050 () Bool)

(declare-fun inv!12 (BitStream!658) Bool)

(assert (=> start!3246 (and (inv!12 thiss!1862) e!9050)))

(declare-fun b!14582 () Bool)

(declare-fun array_inv!338 (array!819) Bool)

(assert (=> b!14582 (= e!9050 (array_inv!338 (buf!700 thiss!1862)))))

(assert (= start!3246 b!14582))

(declare-fun m!21007 () Bool)

(assert (=> start!3246 m!21007))

(declare-fun m!21009 () Bool)

(assert (=> b!14582 m!21009))

(push 1)

(assert (not b!14582))

(assert (not start!3246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

