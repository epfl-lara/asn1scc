; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50220 () Bool)

(assert start!50220)

(declare-fun res!197106 () Bool)

(declare-fun e!163006 () Bool)

(assert (=> start!50220 (=> (not res!197106) (not e!163006))))

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> start!50220 (= res!197106 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50220 e!163006))

(assert (=> start!50220 true))

(declare-datatypes ((array!12432 0))(
  ( (array!12433 (arr!6448 (Array (_ BitVec 32) (_ BitVec 8))) (size!5461 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9886 0))(
  ( (BitStream!9887 (buf!5936 array!12432) (currentByte!11045 (_ BitVec 32)) (currentBit!11040 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9886)

(declare-fun e!163007 () Bool)

(declare-fun inv!12 (BitStream!9886) Bool)

(assert (=> start!50220 (and (inv!12 thiss!1848) e!163007)))

(declare-fun b!235791 () Bool)

(declare-fun res!197105 () Bool)

(assert (=> b!235791 (=> (not res!197105) (not e!163006))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235791 (= res!197105 (validate_offset_bits!1 ((_ sign_extend 32) (size!5461 (buf!5936 thiss!1848))) ((_ sign_extend 32) (currentByte!11045 thiss!1848)) ((_ sign_extend 32) (currentBit!11040 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(declare-fun b!235792 () Bool)

(assert (=> b!235792 (= e!163006 (and (not (= (bvand nBits!593 #b10000000000000000000000000000000) (bvand i!756 #b10000000000000000000000000000000))) (not (= (bvand nBits!593 #b10000000000000000000000000000000) (bvand (bvsub nBits!593 i!756) #b10000000000000000000000000000000)))))))

(declare-fun b!235793 () Bool)

(declare-fun array_inv!5202 (array!12432) Bool)

(assert (=> b!235793 (= e!163007 (array_inv!5202 (buf!5936 thiss!1848)))))

(assert (= (and start!50220 res!197106) b!235791))

(assert (= (and b!235791 res!197105) b!235792))

(assert (= start!50220 b!235793))

(declare-fun m!358455 () Bool)

(assert (=> start!50220 m!358455))

(declare-fun m!358457 () Bool)

(assert (=> b!235791 m!358457))

(declare-fun m!358459 () Bool)

(assert (=> b!235793 m!358459))

(push 1)

(assert (not start!50220))

(assert (not b!235791))

(assert (not b!235793))

(check-sat)

(pop 1)

(push 1)

(check-sat)

