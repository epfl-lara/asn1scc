; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68900 () Bool)

(assert start!68900)

(declare-fun res!254779 () Bool)

(declare-fun e!223285 () Bool)

(assert (=> start!68900 (=> (not res!254779) (not e!223285))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> start!68900 (= res!254779 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68900 e!223285))

(assert (=> start!68900 true))

(declare-datatypes ((array!18935 0))(
  ( (array!18936 (arr!9298 (Array (_ BitVec 32) (_ BitVec 8))) (size!8215 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13540 0))(
  ( (BitStream!13541 (buf!7831 array!18935) (currentByte!14419 (_ BitVec 32)) (currentBit!14414 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13540)

(declare-fun e!223286 () Bool)

(declare-fun inv!12 (BitStream!13540) Bool)

(assert (=> start!68900 (and (inv!12 bitStream!19) e!223286)))

(declare-fun b!310775 () Bool)

(assert (=> b!310775 (= e!223285 (and (not (= (bvand nBits!480 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23414 0))(
  ( (tuple2!23415 (_1!13300 Bool) (_2!13300 BitStream!13540)) )
))
(declare-fun lt!440673 () tuple2!23414)

(declare-fun readBit!0 (BitStream!13540) tuple2!23414)

(assert (=> b!310775 (= lt!440673 (readBit!0 bitStream!19))))

(declare-fun b!310776 () Bool)

(declare-fun array_inv!7770 (array!18935) Bool)

(assert (=> b!310776 (= e!223286 (array_inv!7770 (buf!7831 bitStream!19)))))

(declare-fun b!310773 () Bool)

(declare-fun res!254778 () Bool)

(assert (=> b!310773 (=> (not res!254778) (not e!223285))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310773 (= res!254778 (validate_offset_bits!1 ((_ sign_extend 32) (size!8215 (buf!7831 bitStream!19))) ((_ sign_extend 32) (currentByte!14419 bitStream!19)) ((_ sign_extend 32) (currentBit!14414 bitStream!19)) nBits!480))))

(declare-fun b!310774 () Bool)

(declare-fun res!254777 () Bool)

(assert (=> b!310774 (=> (not res!254777) (not e!223285))))

(assert (=> b!310774 (= res!254777 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!68900 res!254779) b!310773))

(assert (= (and b!310773 res!254778) b!310774))

(assert (= (and b!310774 res!254777) b!310775))

(assert (= start!68900 b!310776))

(declare-fun m!448567 () Bool)

(assert (=> start!68900 m!448567))

(declare-fun m!448569 () Bool)

(assert (=> b!310775 m!448569))

(declare-fun m!448571 () Bool)

(assert (=> b!310776 m!448571))

(declare-fun m!448573 () Bool)

(assert (=> b!310773 m!448573))

(push 1)

(assert (not b!310773))

(assert (not b!310775))

(assert (not start!68900))

(assert (not b!310776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

