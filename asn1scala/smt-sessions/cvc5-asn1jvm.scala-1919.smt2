; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50202 () Bool)

(assert start!50202)

(declare-fun res!197060 () Bool)

(declare-fun e!162953 () Bool)

(assert (=> start!50202 (=> (not res!197060) (not e!162953))))

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> start!50202 (= res!197060 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50202 e!162953))

(assert (=> start!50202 true))

(declare-datatypes ((array!12420 0))(
  ( (array!12421 (arr!6442 (Array (_ BitVec 32) (_ BitVec 8))) (size!5455 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9874 0))(
  ( (BitStream!9875 (buf!5930 array!12420) (currentByte!11039 (_ BitVec 32)) (currentBit!11034 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9874)

(declare-fun e!162951 () Bool)

(declare-fun inv!12 (BitStream!9874) Bool)

(assert (=> start!50202 (and (inv!12 thiss!1848) e!162951)))

(declare-fun b!235728 () Bool)

(declare-fun res!197061 () Bool)

(assert (=> b!235728 (=> (not res!197061) (not e!162953))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235728 (= res!197061 (validate_offset_bits!1 ((_ sign_extend 32) (size!5455 (buf!5930 thiss!1848))) ((_ sign_extend 32) (currentByte!11039 thiss!1848)) ((_ sign_extend 32) (currentBit!11034 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(declare-fun b!235729 () Bool)

(assert (=> b!235729 (= e!162953 (bvsgt (bvsub nBits!593 i!756) #b00000000000000000000000001000000))))

(declare-fun b!235730 () Bool)

(declare-fun array_inv!5196 (array!12420) Bool)

(assert (=> b!235730 (= e!162951 (array_inv!5196 (buf!5930 thiss!1848)))))

(assert (= (and start!50202 res!197060) b!235728))

(assert (= (and b!235728 res!197061) b!235729))

(assert (= start!50202 b!235730))

(declare-fun m!358413 () Bool)

(assert (=> start!50202 m!358413))

(declare-fun m!358415 () Bool)

(assert (=> b!235728 m!358415))

(declare-fun m!358417 () Bool)

(assert (=> b!235730 m!358417))

(push 1)

(assert (not b!235730))

(assert (not start!50202))

(assert (not b!235728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

