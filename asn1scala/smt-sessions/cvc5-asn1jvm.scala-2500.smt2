; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63276 () Bool)

(assert start!63276)

(declare-fun res!235022 () Bool)

(declare-fun e!202429 () Bool)

(assert (=> start!63276 (=> (not res!235022) (not e!202429))))

(declare-datatypes ((array!16447 0))(
  ( (array!16448 (arr!8101 (Array (_ BitVec 32) (_ BitVec 8))) (size!7105 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12580 0))(
  ( (BitStream!12581 (buf!7351 array!16447) (currentByte!13617 (_ BitVec 32)) (currentBit!13612 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12580)

(assert (=> start!63276 (= res!235022 (and (bvsle ((_ sign_extend 32) (size!7105 (buf!7351 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13617 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13612 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7105 (buf!7351 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13617 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13612 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63276 e!202429))

(declare-fun e!202430 () Bool)

(declare-fun inv!12 (BitStream!12580) Bool)

(assert (=> start!63276 (and (inv!12 thiss!1939) e!202430)))

(declare-fun b!283553 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283553 (= e!202429 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13612 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13617 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7105 (buf!7351 thiss!1939)))))))))

(declare-fun b!283554 () Bool)

(declare-fun array_inv!6798 (array!16447) Bool)

(assert (=> b!283554 (= e!202430 (array_inv!6798 (buf!7351 thiss!1939)))))

(assert (= (and start!63276 res!235022) b!283553))

(assert (= start!63276 b!283554))

(declare-fun m!416581 () Bool)

(assert (=> start!63276 m!416581))

(declare-fun m!416583 () Bool)

(assert (=> b!283553 m!416583))

(declare-fun m!416585 () Bool)

(assert (=> b!283554 m!416585))

(push 1)

(assert (not b!283554))

(assert (not start!63276))

(assert (not b!283553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

