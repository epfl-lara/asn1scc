; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63606 () Bool)

(assert start!63606)

(declare-fun res!235256 () Bool)

(declare-fun e!202922 () Bool)

(assert (=> start!63606 (=> (not res!235256) (not e!202922))))

(declare-datatypes ((array!16579 0))(
  ( (array!16580 (arr!8154 (Array (_ BitVec 32) (_ BitVec 8))) (size!7158 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12686 0))(
  ( (BitStream!12687 (buf!7404 array!16579) (currentByte!13718 (_ BitVec 32)) (currentBit!13713 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12686)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63606 (= res!235256 (validate_offset_bits!1 ((_ sign_extend 32) (size!7158 (buf!7404 thiss!1929))) ((_ sign_extend 32) (currentByte!13718 thiss!1929)) ((_ sign_extend 32) (currentBit!13713 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13713 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63606 e!202922))

(declare-fun e!202921 () Bool)

(declare-fun inv!12 (BitStream!12686) Bool)

(assert (=> start!63606 (and (inv!12 thiss!1929) e!202921)))

(declare-fun b!283945 () Bool)

(declare-fun res!235255 () Bool)

(assert (=> b!283945 (=> (not res!235255) (not e!202922))))

(assert (=> b!283945 (= res!235255 (not (= (currentBit!13713 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!283946 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283946 (= e!202922 (not (invariant!0 (currentBit!13713 thiss!1929) (currentByte!13718 thiss!1929) (size!7158 (buf!7404 thiss!1929)))))))

(declare-fun b!283947 () Bool)

(declare-fun array_inv!6851 (array!16579) Bool)

(assert (=> b!283947 (= e!202921 (array_inv!6851 (buf!7404 thiss!1929)))))

(assert (= (and start!63606 res!235256) b!283945))

(assert (= (and b!283945 res!235255) b!283946))

(assert (= start!63606 b!283947))

(declare-fun m!417067 () Bool)

(assert (=> start!63606 m!417067))

(declare-fun m!417069 () Bool)

(assert (=> start!63606 m!417069))

(declare-fun m!417071 () Bool)

(assert (=> b!283946 m!417071))

(declare-fun m!417073 () Bool)

(assert (=> b!283947 m!417073))

(push 1)

(assert (not b!283947))

(assert (not b!283946))

(assert (not start!63606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97584 () Bool)

