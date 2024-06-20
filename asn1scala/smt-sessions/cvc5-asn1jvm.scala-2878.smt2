; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68906 () Bool)

(assert start!68906)

(declare-fun b!310812 () Bool)

(declare-fun e!223312 () Bool)

(declare-datatypes ((array!18941 0))(
  ( (array!18942 (arr!9301 (Array (_ BitVec 32) (_ BitVec 8))) (size!8218 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13546 0))(
  ( (BitStream!13547 (buf!7834 array!18941) (currentByte!14422 (_ BitVec 32)) (currentBit!14417 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13546)

(declare-fun array_inv!7773 (array!18941) Bool)

(assert (=> b!310812 (= e!223312 (array_inv!7773 (buf!7834 bitStream!19)))))

(declare-fun b!310810 () Bool)

(declare-fun res!254806 () Bool)

(declare-fun e!223311 () Bool)

(assert (=> b!310810 (=> (not res!254806) (not e!223311))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> b!310810 (= res!254806 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310811 () Bool)

(assert (=> b!310811 (= e!223311 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!480))))

(declare-datatypes ((tuple2!23420 0))(
  ( (tuple2!23421 (_1!13303 Bool) (_2!13303 BitStream!13546)) )
))
(declare-fun lt!440682 () tuple2!23420)

(declare-fun readBit!0 (BitStream!13546) tuple2!23420)

(assert (=> b!310811 (= lt!440682 (readBit!0 bitStream!19))))

(declare-fun b!310809 () Bool)

(declare-fun res!254805 () Bool)

(assert (=> b!310809 (=> (not res!254805) (not e!223311))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310809 (= res!254805 (validate_offset_bits!1 ((_ sign_extend 32) (size!8218 (buf!7834 bitStream!19))) ((_ sign_extend 32) (currentByte!14422 bitStream!19)) ((_ sign_extend 32) (currentBit!14417 bitStream!19)) nBits!480))))

(declare-fun res!254804 () Bool)

(assert (=> start!68906 (=> (not res!254804) (not e!223311))))

(assert (=> start!68906 (= res!254804 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68906 e!223311))

(assert (=> start!68906 true))

(declare-fun inv!12 (BitStream!13546) Bool)

(assert (=> start!68906 (and (inv!12 bitStream!19) e!223312)))

(assert (= (and start!68906 res!254804) b!310809))

(assert (= (and b!310809 res!254805) b!310810))

(assert (= (and b!310810 res!254806) b!310811))

(assert (= start!68906 b!310812))

(declare-fun m!448591 () Bool)

(assert (=> b!310812 m!448591))

(declare-fun m!448593 () Bool)

(assert (=> b!310811 m!448593))

(declare-fun m!448595 () Bool)

(assert (=> b!310809 m!448595))

(declare-fun m!448597 () Bool)

(assert (=> start!68906 m!448597))

(push 1)

(assert (not b!310809))

(assert (not start!68906))

(assert (not b!310811))

(assert (not b!310812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

