; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50210 () Bool)

(assert start!50210)

(declare-fun b!235771 () Bool)

(declare-fun e!162988 () Bool)

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> b!235771 (= e!162988 (bvsgt #b00000000000000000000000000000000 nBits!593))))

(declare-fun b!235770 () Bool)

(declare-fun res!197091 () Bool)

(assert (=> b!235770 (=> (not res!197091) (not e!162988))))

(declare-fun acc!174 () (_ BitVec 64))

(declare-fun i!756 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235770 (= res!197091 (= (bvand acc!174 (onesLSBLong!0 (bvsub nBits!593 i!756))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235769 () Bool)

(declare-fun res!197089 () Bool)

(assert (=> b!235769 (=> (not res!197089) (not e!162988))))

(declare-datatypes ((array!12428 0))(
  ( (array!12429 (arr!6446 (Array (_ BitVec 32) (_ BitVec 8))) (size!5459 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9882 0))(
  ( (BitStream!9883 (buf!5934 array!12428) (currentByte!11043 (_ BitVec 32)) (currentBit!11038 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9882)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235769 (= res!197089 (validate_offset_bits!1 ((_ sign_extend 32) (size!5459 (buf!5934 thiss!1848))) ((_ sign_extend 32) (currentByte!11043 thiss!1848)) ((_ sign_extend 32) (currentBit!11038 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(declare-fun b!235772 () Bool)

(declare-fun e!162989 () Bool)

(declare-fun array_inv!5200 (array!12428) Bool)

(assert (=> b!235772 (= e!162989 (array_inv!5200 (buf!5934 thiss!1848)))))

(declare-fun res!197090 () Bool)

(assert (=> start!50210 (=> (not res!197090) (not e!162988))))

(assert (=> start!50210 (= res!197090 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50210 e!162988))

(assert (=> start!50210 true))

(declare-fun inv!12 (BitStream!9882) Bool)

(assert (=> start!50210 (and (inv!12 thiss!1848) e!162989)))

(assert (= (and start!50210 res!197090) b!235769))

(assert (= (and b!235769 res!197089) b!235770))

(assert (= (and b!235770 res!197091) b!235771))

(assert (= start!50210 b!235772))

(declare-fun m!358439 () Bool)

(assert (=> b!235770 m!358439))

(declare-fun m!358441 () Bool)

(assert (=> b!235769 m!358441))

(declare-fun m!358443 () Bool)

(assert (=> b!235772 m!358443))

(declare-fun m!358445 () Bool)

(assert (=> start!50210 m!358445))

(check-sat (not b!235772) (not b!235769) (not start!50210) (not b!235770))
(check-sat)
