; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49524 () Bool)

(assert start!49524)

(declare-fun res!195861 () Bool)

(declare-fun e!161798 () Bool)

(assert (=> start!49524 (=> (not res!195861) (not e!161798))))

(declare-fun l!233 () (_ BitVec 64))

(declare-fun i!785 () (_ BitVec 32))

(assert (=> start!49524 (= res!195861 (and (bvsge l!233 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!785 #b00000000000000000000000000000000) (bvslt i!785 #b00000000000000000000000001000000) (or (and (= i!785 #b00000000000000000000000000000000) (bvsge #b0111111111111111111111111111111111111111111111111111111111111111 l!233)) (bvsge (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub #b00000000000000000000000000111111 i!785))) l!233)) (bvslt i!785 #b00000000000000000000000000111111) (not (= l!233 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 i!785) #b00000000000000000000000000111111) (not (= (bvlshr l!233 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!49524 e!161798))

(assert (=> start!49524 true))

(declare-fun b!234131 () Bool)

(declare-datatypes ((Unit!17257 0))(
  ( (Unit!17258) )
))
(declare-datatypes ((tuple3!1506 0))(
  ( (tuple3!1507 (_1!10733 Unit!17257) (_2!10733 (_ BitVec 64)) (_3!895 (_ BitVec 32))) )
))
(declare-fun lt!369879 () tuple3!1506)

(assert (=> b!234131 (= e!161798 false)))

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!1506)

(assert (=> b!234131 (= lt!369879 (GetBitCountUnsignedWhile!0 (bvlshr l!233 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!785)))))

(assert (= (and start!49524 res!195861) b!234131))

(declare-fun m!356879 () Bool)

(assert (=> b!234131 m!356879))

(push 1)

(assert (not b!234131))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

