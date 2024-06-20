; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63518 () Bool)

(assert start!63518)

(declare-datatypes ((array!16541 0))(
  ( (array!16542 (arr!8139 (Array (_ BitVec 32) (_ BitVec 8))) (size!7143 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12656 0))(
  ( (BitStream!12657 (buf!7389 array!16541) (currentByte!13690 (_ BitVec 32)) (currentBit!13685 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12656)

(assert (=> start!63518 (or (bvsgt ((_ sign_extend 32) (size!7143 (buf!7389 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13690 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13685 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!202796 () Bool)

(declare-fun inv!12 (BitStream!12656) Bool)

(assert (=> start!63518 (and (inv!12 thiss!1929) e!202796)))

(declare-fun b!283839 () Bool)

(declare-fun array_inv!6836 (array!16541) Bool)

(assert (=> b!283839 (= e!202796 (array_inv!6836 (buf!7389 thiss!1929)))))

(assert (= start!63518 b!283839))

(declare-fun m!416955 () Bool)

(assert (=> start!63518 m!416955))

(declare-fun m!416957 () Bool)

(assert (=> b!283839 m!416957))

(push 1)

