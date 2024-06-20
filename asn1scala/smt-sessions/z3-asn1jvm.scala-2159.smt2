; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54826 () Bool)

(assert start!54826)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-datatypes ((array!13869 0))(
  ( (array!13870 (arr!7073 (Array (_ BitVec 32) (_ BitVec 8))) (size!6086 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11094 0))(
  ( (BitStream!11095 (buf!6608 array!13869) (currentByte!12094 (_ BitVec 32)) (currentBit!12089 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11094)

(assert (=> start!54826 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (or (bvsgt ((_ sign_extend 32) (size!6086 (buf!6608 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12094 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12089 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!54826 true))

(declare-fun e!177906 () Bool)

(declare-fun inv!12 (BitStream!11094) Bool)

(assert (=> start!54826 (and (inv!12 thiss!1754) e!177906)))

(declare-fun b!256696 () Bool)

(declare-fun array_inv!5827 (array!13869) Bool)

(assert (=> b!256696 (= e!177906 (array_inv!5827 (buf!6608 thiss!1754)))))

(assert (= start!54826 b!256696))

(declare-fun m!386297 () Bool)

(assert (=> start!54826 m!386297))

(declare-fun m!386299 () Bool)

(assert (=> b!256696 m!386299))

(check-sat (not b!256696) (not start!54826))
(check-sat)
