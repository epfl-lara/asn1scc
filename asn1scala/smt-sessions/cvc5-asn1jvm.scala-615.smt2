; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17464 () Bool)

(assert start!17464)

(declare-fun b!84150 () Bool)

(declare-fun e!56265 () Bool)

(declare-datatypes ((array!3981 0))(
  ( (array!3982 (arr!2439 (Array (_ BitVec 32) (_ BitVec 8))) (size!1802 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3166 0))(
  ( (BitStream!3167 (buf!2192 array!3981) (currentByte!4350 (_ BitVec 32)) (currentBit!4345 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3166)

(declare-fun array_inv!1648 (array!3981) Bool)

(assert (=> b!84150 (= e!56265 (array_inv!1648 (buf!2192 thiss!1136)))))

(declare-fun res!69085 () Bool)

(declare-fun e!56263 () Bool)

(assert (=> start!17464 (=> (not res!69085) (not e!56263))))

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> start!17464 (= res!69085 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17464 e!56263))

(assert (=> start!17464 true))

(declare-fun inv!12 (BitStream!3166) Bool)

(assert (=> start!17464 (and (inv!12 thiss!1136) e!56265)))

(declare-fun b!84151 () Bool)

(declare-fun res!69087 () Bool)

(assert (=> b!84151 (=> (not res!69087) (not e!56263))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84151 (= res!69087 (validate_offset_bits!1 ((_ sign_extend 32) (size!1802 (buf!2192 thiss!1136))) ((_ sign_extend 32) (currentByte!4350 thiss!1136)) ((_ sign_extend 32) (currentBit!4345 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84152 () Bool)

(assert (=> b!84152 (= e!56263 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1802 (buf!2192 thiss!1136))) ((_ sign_extend 32) (currentByte!4350 thiss!1136)) ((_ sign_extend 32) (currentBit!4345 thiss!1136)) ((_ sign_extend 32) nBits!333))))))

(declare-fun lt!134163 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84152 (= lt!134163 (bitIndex!0 (size!1802 (buf!2192 thiss!1136)) (currentByte!4350 thiss!1136) (currentBit!4345 thiss!1136)))))

(declare-fun b!84153 () Bool)

(declare-fun res!69086 () Bool)

(assert (=> b!84153 (=> (not res!69086) (not e!56263))))

(assert (=> b!84153 (= res!69086 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84154 () Bool)

(declare-fun res!69088 () Bool)

(assert (=> b!84154 (=> (not res!69088) (not e!56263))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84154 (= res!69088 (invariant!0 (currentBit!4345 thiss!1136) (currentByte!4350 thiss!1136) (size!1802 (buf!2192 thiss!1136))))))

(assert (= (and start!17464 res!69085) b!84151))

(assert (= (and b!84151 res!69087) b!84154))

(assert (= (and b!84154 res!69088) b!84153))

(assert (= (and b!84153 res!69086) b!84152))

(assert (= start!17464 b!84150))

(declare-fun m!130847 () Bool)

(assert (=> b!84151 m!130847))

(declare-fun m!130849 () Bool)

(assert (=> b!84150 m!130849))

(declare-fun m!130851 () Bool)

(assert (=> start!17464 m!130851))

(assert (=> b!84152 m!130847))

(declare-fun m!130853 () Bool)

(assert (=> b!84152 m!130853))

(declare-fun m!130855 () Bool)

(assert (=> b!84154 m!130855))

(push 1)

(assert (not b!84154))

(assert (not start!17464))

(assert (not b!84152))

(assert (not b!84151))

(assert (not b!84150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

