; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52292 () Bool)

(assert start!52292)

(declare-fun res!200969 () Bool)

(declare-fun e!166841 () Bool)

(assert (=> start!52292 (=> (not res!200969) (not e!166841))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52292 (= res!200969 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52292 e!166841))

(assert (=> start!52292 true))

(declare-datatypes ((array!13172 0))(
  ( (array!13173 (arr!6756 (Array (_ BitVec 32) (_ BitVec 8))) (size!5769 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10460 0))(
  ( (BitStream!10461 (buf!6232 array!13172) (currentByte!11589 (_ BitVec 32)) (currentBit!11584 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10460)

(declare-fun e!166840 () Bool)

(declare-fun inv!12 (BitStream!10460) Bool)

(assert (=> start!52292 (and (inv!12 thiss!982) e!166840)))

(declare-fun b!240738 () Bool)

(declare-fun res!200970 () Bool)

(assert (=> b!240738 (=> (not res!200970) (not e!166841))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240738 (= res!200970 (validate_offset_bits!1 ((_ sign_extend 32) (size!5769 (buf!6232 thiss!982))) ((_ sign_extend 32) (currentByte!11589 thiss!982)) ((_ sign_extend 32) (currentBit!11584 thiss!982)) nBits!288))))

(declare-fun b!240739 () Bool)

(assert (=> b!240739 (= e!166841 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5769 (buf!6232 thiss!982))) ((_ sign_extend 32) (currentByte!11589 thiss!982)) ((_ sign_extend 32) (currentBit!11584 thiss!982)) nBits!288)))))

(declare-fun b!240740 () Bool)

(declare-fun array_inv!5510 (array!13172) Bool)

(assert (=> b!240740 (= e!166840 (array_inv!5510 (buf!6232 thiss!982)))))

(assert (= (and start!52292 res!200969) b!240738))

(assert (= (and b!240738 res!200970) b!240739))

(assert (= start!52292 b!240740))

(declare-fun m!363333 () Bool)

(assert (=> start!52292 m!363333))

(declare-fun m!363335 () Bool)

(assert (=> b!240738 m!363335))

(assert (=> b!240739 m!363335))

(declare-fun m!363337 () Bool)

(assert (=> b!240740 m!363337))

(push 1)

(assert (not start!52292))

(assert (not b!240739))

(assert (not b!240738))

(assert (not b!240740))

