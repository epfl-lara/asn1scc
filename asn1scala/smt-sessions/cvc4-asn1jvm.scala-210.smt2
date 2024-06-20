; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4178 () Bool)

(assert start!4178)

(declare-fun res!15440 () Bool)

(declare-fun e!11221 () Bool)

(assert (=> start!4178 (=> (not res!15440) (not e!11221))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1146 0))(
  ( (array!1147 (arr!918 (Array (_ BitVec 32) (_ BitVec 8))) (size!489 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!848 0))(
  ( (BitStream!849 (buf!807 array!1146) (currentByte!1998 (_ BitVec 32)) (currentBit!1993 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!848)

(assert (=> start!4178 (= res!15440 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!489 (buf!807 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1998 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1993 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!489 (buf!807 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1998 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1993 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4178 e!11221))

(assert (=> start!4178 true))

(declare-fun e!11222 () Bool)

(declare-fun inv!12 (BitStream!848) Bool)

(assert (=> start!4178 (and (inv!12 thiss!1917) e!11222)))

(declare-fun b!17488 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17488 (= e!11221 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1993 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1998 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!489 (buf!807 thiss!1917)))))))))

(declare-fun b!17489 () Bool)

(declare-fun array_inv!459 (array!1146) Bool)

(assert (=> b!17489 (= e!11222 (array_inv!459 (buf!807 thiss!1917)))))

(assert (= (and start!4178 res!15440) b!17488))

(assert (= start!4178 b!17489))

(declare-fun m!23797 () Bool)

(assert (=> start!4178 m!23797))

(declare-fun m!23799 () Bool)

(assert (=> b!17488 m!23799))

(declare-fun m!23801 () Bool)

(assert (=> b!17489 m!23801))

(push 1)

(assert (not b!17489))

(assert (not start!4178))

(assert (not b!17488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

