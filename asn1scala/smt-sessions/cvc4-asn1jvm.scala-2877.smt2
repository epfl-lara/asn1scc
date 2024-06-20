; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68904 () Bool)

(assert start!68904)

(declare-fun b!310800 () Bool)

(declare-fun e!223302 () Bool)

(declare-datatypes ((array!18939 0))(
  ( (array!18940 (arr!9300 (Array (_ BitVec 32) (_ BitVec 8))) (size!8217 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13544 0))(
  ( (BitStream!13545 (buf!7833 array!18939) (currentByte!14421 (_ BitVec 32)) (currentBit!14416 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13544)

(declare-fun array_inv!7772 (array!18939) Bool)

(assert (=> b!310800 (= e!223302 (array_inv!7772 (buf!7833 bitStream!19)))))

(declare-fun res!254795 () Bool)

(declare-fun e!223303 () Bool)

(assert (=> start!68904 (=> (not res!254795) (not e!223303))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> start!68904 (= res!254795 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68904 e!223303))

(assert (=> start!68904 true))

(declare-fun inv!12 (BitStream!13544) Bool)

(assert (=> start!68904 (and (inv!12 bitStream!19) e!223302)))

(declare-fun b!310799 () Bool)

(assert (=> b!310799 (= e!223303 (and (not (= (bvand nBits!480 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23418 0))(
  ( (tuple2!23419 (_1!13302 Bool) (_2!13302 BitStream!13544)) )
))
(declare-fun lt!440679 () tuple2!23418)

(declare-fun readBit!0 (BitStream!13544) tuple2!23418)

(assert (=> b!310799 (= lt!440679 (readBit!0 bitStream!19))))

(declare-fun b!310797 () Bool)

(declare-fun res!254796 () Bool)

(assert (=> b!310797 (=> (not res!254796) (not e!223303))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310797 (= res!254796 (validate_offset_bits!1 ((_ sign_extend 32) (size!8217 (buf!7833 bitStream!19))) ((_ sign_extend 32) (currentByte!14421 bitStream!19)) ((_ sign_extend 32) (currentBit!14416 bitStream!19)) nBits!480))))

(declare-fun b!310798 () Bool)

(declare-fun res!254797 () Bool)

(assert (=> b!310798 (=> (not res!254797) (not e!223303))))

(assert (=> b!310798 (= res!254797 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!68904 res!254795) b!310797))

(assert (= (and b!310797 res!254796) b!310798))

(assert (= (and b!310798 res!254797) b!310799))

(assert (= start!68904 b!310800))

(declare-fun m!448583 () Bool)

(assert (=> b!310800 m!448583))

(declare-fun m!448585 () Bool)

(assert (=> start!68904 m!448585))

(declare-fun m!448587 () Bool)

(assert (=> b!310799 m!448587))

(declare-fun m!448589 () Bool)

(assert (=> b!310797 m!448589))

(push 1)

(assert (not b!310800))

(assert (not b!310797))

(assert (not start!68904))

(assert (not b!310799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

