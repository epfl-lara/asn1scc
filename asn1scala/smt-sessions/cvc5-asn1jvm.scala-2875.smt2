; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68834 () Bool)

(assert start!68834)

(declare-fun b!310644 () Bool)

(declare-fun e!223179 () Bool)

(declare-datatypes ((array!18920 0))(
  ( (array!18921 (arr!9292 (Array (_ BitVec 32) (_ BitVec 8))) (size!8209 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13528 0))(
  ( (BitStream!13529 (buf!7825 array!18920) (currentByte!14398 (_ BitVec 32)) (currentBit!14393 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13528)

(declare-fun array_inv!7764 (array!18920) Bool)

(assert (=> b!310644 (= e!223179 (array_inv!7764 (buf!7825 bitStream!19)))))

(declare-fun b!310643 () Bool)

(declare-fun e!223180 () Bool)

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> b!310643 (= e!223180 (bvslt (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!23396 0))(
  ( (tuple2!23397 (_1!13291 Bool) (_2!13291 BitStream!13528)) )
))
(declare-fun lt!440475 () tuple2!23396)

(declare-fun readBit!0 (BitStream!13528) tuple2!23396)

(assert (=> b!310643 (= lt!440475 (readBit!0 bitStream!19))))

(declare-fun res!254664 () Bool)

(assert (=> start!68834 (=> (not res!254664) (not e!223180))))

(assert (=> start!68834 (= res!254664 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68834 e!223180))

(assert (=> start!68834 true))

(declare-fun inv!12 (BitStream!13528) Bool)

(assert (=> start!68834 (and (inv!12 bitStream!19) e!223179)))

(declare-fun b!310641 () Bool)

(declare-fun res!254663 () Bool)

(assert (=> b!310641 (=> (not res!254663) (not e!223180))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310641 (= res!254663 (validate_offset_bits!1 ((_ sign_extend 32) (size!8209 (buf!7825 bitStream!19))) ((_ sign_extend 32) (currentByte!14398 bitStream!19)) ((_ sign_extend 32) (currentBit!14393 bitStream!19)) nBits!480))))

(declare-fun b!310642 () Bool)

(declare-fun res!254665 () Bool)

(assert (=> b!310642 (=> (not res!254665) (not e!223180))))

(assert (=> b!310642 (= res!254665 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!68834 res!254664) b!310641))

(assert (= (and b!310641 res!254663) b!310642))

(assert (= (and b!310642 res!254665) b!310643))

(assert (= start!68834 b!310644))

(declare-fun m!448435 () Bool)

(assert (=> b!310644 m!448435))

(declare-fun m!448437 () Bool)

(assert (=> b!310643 m!448437))

(declare-fun m!448439 () Bool)

(assert (=> start!68834 m!448439))

(declare-fun m!448441 () Bool)

(assert (=> b!310641 m!448441))

(push 1)

(assert (not start!68834))

(assert (not b!310643))

(assert (not b!310644))

(assert (not b!310641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

