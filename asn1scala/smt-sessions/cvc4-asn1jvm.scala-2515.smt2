; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63524 () Bool)

(assert start!63524)

(declare-datatypes ((array!16547 0))(
  ( (array!16548 (arr!8142 (Array (_ BitVec 32) (_ BitVec 8))) (size!7146 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12662 0))(
  ( (BitStream!12663 (buf!7392 array!16547) (currentByte!13693 (_ BitVec 32)) (currentBit!13688 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12662)

(assert (=> start!63524 (and (bvsle ((_ sign_extend 32) (size!7146 (buf!7392 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13693 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13688 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7146 (buf!7392 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13693 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13688 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!202814 () Bool)

(declare-fun inv!12 (BitStream!12662) Bool)

(assert (=> start!63524 (and (inv!12 thiss!1929) e!202814)))

(declare-fun b!283848 () Bool)

(declare-fun array_inv!6839 (array!16547) Bool)

(assert (=> b!283848 (= e!202814 (array_inv!6839 (buf!7392 thiss!1929)))))

(assert (= start!63524 b!283848))

(declare-fun m!416967 () Bool)

(assert (=> start!63524 m!416967))

(declare-fun m!416969 () Bool)

(assert (=> b!283848 m!416969))

(push 1)

(assert (not start!63524))

(assert (not b!283848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97516 () Bool)

