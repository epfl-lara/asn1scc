; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68910 () Bool)

(assert start!68910)

(declare-fun b!310834 () Bool)

(declare-fun res!254822 () Bool)

(declare-fun e!223329 () Bool)

(assert (=> b!310834 (=> (not res!254822) (not e!223329))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> b!310834 (= res!254822 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310833 () Bool)

(declare-fun res!254824 () Bool)

(assert (=> b!310833 (=> (not res!254824) (not e!223329))))

(declare-datatypes ((array!18945 0))(
  ( (array!18946 (arr!9303 (Array (_ BitVec 32) (_ BitVec 8))) (size!8220 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13550 0))(
  ( (BitStream!13551 (buf!7836 array!18945) (currentByte!14424 (_ BitVec 32)) (currentBit!14419 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13550)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310833 (= res!254824 (validate_offset_bits!1 ((_ sign_extend 32) (size!8220 (buf!7836 bitStream!19))) ((_ sign_extend 32) (currentByte!14424 bitStream!19)) ((_ sign_extend 32) (currentBit!14419 bitStream!19)) nBits!480))))

(declare-fun b!310836 () Bool)

(declare-fun e!223331 () Bool)

(declare-fun array_inv!7775 (array!18945) Bool)

(assert (=> b!310836 (= e!223331 (array_inv!7775 (buf!7836 bitStream!19)))))

(declare-fun res!254823 () Bool)

(assert (=> start!68910 (=> (not res!254823) (not e!223329))))

(assert (=> start!68910 (= res!254823 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68910 e!223329))

(assert (=> start!68910 true))

(declare-fun inv!12 (BitStream!13550) Bool)

(assert (=> start!68910 (and (inv!12 bitStream!19) e!223331)))

(declare-fun b!310835 () Bool)

(assert (=> b!310835 (= e!223329 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!480))))

(declare-datatypes ((tuple2!23424 0))(
  ( (tuple2!23425 (_1!13305 Bool) (_2!13305 BitStream!13550)) )
))
(declare-fun lt!440688 () tuple2!23424)

(declare-fun readBit!0 (BitStream!13550) tuple2!23424)

(assert (=> b!310835 (= lt!440688 (readBit!0 bitStream!19))))

(assert (= (and start!68910 res!254823) b!310833))

(assert (= (and b!310833 res!254824) b!310834))

(assert (= (and b!310834 res!254822) b!310835))

(assert (= start!68910 b!310836))

(declare-fun m!448607 () Bool)

(assert (=> b!310833 m!448607))

(declare-fun m!448609 () Bool)

(assert (=> b!310836 m!448609))

(declare-fun m!448611 () Bool)

(assert (=> start!68910 m!448611))

(declare-fun m!448613 () Bool)

(assert (=> b!310835 m!448613))

(push 1)

(assert (not b!310836))

(assert (not b!310833))

(assert (not b!310835))

(assert (not start!68910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

