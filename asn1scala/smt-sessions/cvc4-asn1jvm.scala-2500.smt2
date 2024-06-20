; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63280 () Bool)

(assert start!63280)

(declare-fun res!235028 () Bool)

(declare-fun e!202447 () Bool)

(assert (=> start!63280 (=> (not res!235028) (not e!202447))))

(declare-datatypes ((array!16451 0))(
  ( (array!16452 (arr!8103 (Array (_ BitVec 32) (_ BitVec 8))) (size!7107 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12584 0))(
  ( (BitStream!12585 (buf!7353 array!16451) (currentByte!13619 (_ BitVec 32)) (currentBit!13614 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12584)

(assert (=> start!63280 (= res!235028 (and (bvsle ((_ sign_extend 32) (size!7107 (buf!7353 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13619 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13614 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7107 (buf!7353 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13619 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13614 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63280 e!202447))

(declare-fun e!202448 () Bool)

(declare-fun inv!12 (BitStream!12584) Bool)

(assert (=> start!63280 (and (inv!12 thiss!1939) e!202448)))

(declare-fun b!283565 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283565 (= e!202447 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13614 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13619 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7107 (buf!7353 thiss!1939)))))))))

(declare-fun b!283566 () Bool)

(declare-fun array_inv!6800 (array!16451) Bool)

(assert (=> b!283566 (= e!202448 (array_inv!6800 (buf!7353 thiss!1939)))))

(assert (= (and start!63280 res!235028) b!283565))

(assert (= start!63280 b!283566))

(declare-fun m!416593 () Bool)

(assert (=> start!63280 m!416593))

(declare-fun m!416595 () Bool)

(assert (=> b!283565 m!416595))

(declare-fun m!416597 () Bool)

(assert (=> b!283566 m!416597))

(push 1)

(assert (not b!283566))

(assert (not start!63280))

(assert (not b!283565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

