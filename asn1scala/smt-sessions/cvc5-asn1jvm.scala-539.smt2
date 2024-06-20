; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15736 () Bool)

(assert start!15736)

(declare-fun res!65827 () Bool)

(declare-fun e!52225 () Bool)

(assert (=> start!15736 (=> (not res!65827) (not e!52225))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3411 0))(
  ( (array!3412 (arr!2175 (Array (_ BitVec 32) (_ BitVec 8))) (size!1574 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2710 0))(
  ( (BitStream!2711 (buf!1964 array!3411) (currentByte!3842 (_ BitVec 32)) (currentBit!3837 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2710)

(assert (=> start!15736 (= res!65827 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1574 (buf!1964 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3842 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3837 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1574 (buf!1964 thiss!1716))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3842 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3837 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15736 e!52225))

(assert (=> start!15736 true))

(declare-fun e!52226 () Bool)

(declare-fun inv!12 (BitStream!2710) Bool)

(assert (=> start!15736 (and (inv!12 thiss!1716) e!52226)))

(declare-fun b!79511 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79511 (= e!52225 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3837 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3842 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (size!1574 (buf!1964 thiss!1716)))))))))

(declare-fun b!79512 () Bool)

(declare-fun array_inv!1420 (array!3411) Bool)

(assert (=> b!79512 (= e!52226 (array_inv!1420 (buf!1964 thiss!1716)))))

(assert (= (and start!15736 res!65827) b!79511))

(assert (= start!15736 b!79512))

(declare-fun m!124925 () Bool)

(assert (=> start!15736 m!124925))

(declare-fun m!124927 () Bool)

(assert (=> b!79511 m!124927))

(declare-fun m!124929 () Bool)

(assert (=> b!79512 m!124929))

(push 1)

(assert (not start!15736))

(assert (not b!79511))

(assert (not b!79512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

