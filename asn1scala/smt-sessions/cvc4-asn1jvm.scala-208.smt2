; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4148 () Bool)

(assert start!4148)

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1131 0))(
  ( (array!1132 (arr!912 (Array (_ BitVec 32) (_ BitVec 8))) (size!483 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!836 0))(
  ( (BitStream!837 (buf!801 array!1131) (currentByte!1989 (_ BitVec 32)) (currentBit!1984 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!836)

(assert (=> start!4148 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!483 (buf!801 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1989 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1984 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4148 true))

(declare-fun e!11177 () Bool)

(declare-fun inv!12 (BitStream!836) Bool)

(assert (=> start!4148 (and (inv!12 thiss!1917) e!11177)))

(declare-fun b!17462 () Bool)

(declare-fun array_inv!453 (array!1131) Bool)

(assert (=> b!17462 (= e!11177 (array_inv!453 (buf!801 thiss!1917)))))

(assert (= start!4148 b!17462))

(declare-fun m!23763 () Bool)

(assert (=> start!4148 m!23763))

(declare-fun m!23765 () Bool)

(assert (=> b!17462 m!23765))

(push 1)

(assert (not b!17462))

(assert (not start!4148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

