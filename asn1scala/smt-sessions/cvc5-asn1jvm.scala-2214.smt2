; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56152 () Bool)

(assert start!56152)

(declare-fun b!260414 () Bool)

(declare-fun res!218029 () Bool)

(declare-fun e!180849 () Bool)

(assert (=> b!260414 (=> (not res!218029) (not e!180849))))

(declare-datatypes ((array!14278 0))(
  ( (array!14279 (arr!7234 (Array (_ BitVec 32) (_ BitVec 8))) (size!6247 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14278)

(declare-datatypes ((BitStream!11416 0))(
  ( (BitStream!11417 (buf!6769 array!14278) (currentByte!12453 (_ BitVec 32)) (currentBit!12448 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11416)

(assert (=> b!260414 (= res!218029 (and (bvsle ((_ sign_extend 32) (size!6247 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12453 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12448 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6247 buf!79)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12453 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12448 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260416 () Bool)

(declare-fun e!180848 () Bool)

(declare-fun array_inv!5988 (array!14278) Bool)

(assert (=> b!260416 (= e!180848 (array_inv!5988 (buf!6769 b1!100)))))

(declare-fun res!218028 () Bool)

(assert (=> start!56152 (=> (not res!218028) (not e!180849))))

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56152 (= res!218028 (and (= (size!6247 (buf!6769 b1!100)) (size!6247 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56152 e!180849))

(declare-fun inv!12 (BitStream!11416) Bool)

(assert (=> start!56152 (and (inv!12 b1!100) e!180848)))

(assert (=> start!56152 (array_inv!5988 buf!79)))

(assert (=> start!56152 true))

(declare-fun b!260415 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260415 (= e!180849 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12448 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12453 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6247 buf!79))))))))

(declare-fun b!260413 () Bool)

(declare-fun res!218027 () Bool)

(assert (=> b!260413 (=> (not res!218027) (not e!180849))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260413 (= res!218027 (validate_offset_bits!1 ((_ sign_extend 32) (size!6247 (buf!6769 b1!100))) ((_ sign_extend 32) (currentByte!12453 b1!100)) ((_ sign_extend 32) (currentBit!12448 b1!100)) bits!81))))

(assert (= (and start!56152 res!218028) b!260413))

(assert (= (and b!260413 res!218027) b!260414))

(assert (= (and b!260414 res!218029) b!260415))

(assert (= start!56152 b!260416))

(declare-fun m!389681 () Bool)

(assert (=> b!260416 m!389681))

(declare-fun m!389683 () Bool)

(assert (=> start!56152 m!389683))

(declare-fun m!389685 () Bool)

(assert (=> start!56152 m!389685))

(declare-fun m!389687 () Bool)

(assert (=> b!260415 m!389687))

(declare-fun m!389689 () Bool)

(assert (=> b!260413 m!389689))

(push 1)

(assert (not b!260416))

(assert (not b!260415))

(assert (not start!56152))

(assert (not b!260413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87392 () Bool)

(assert (=> d!87392 (= (array_inv!5988 (buf!6769 b1!100)) (bvsge (size!6247 (buf!6769 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260416 d!87392))

