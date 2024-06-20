; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68836 () Bool)

(assert start!68836)

(declare-fun b!310656 () Bool)

(declare-fun e!223188 () Bool)

(declare-datatypes ((array!18922 0))(
  ( (array!18923 (arr!9293 (Array (_ BitVec 32) (_ BitVec 8))) (size!8210 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13530 0))(
  ( (BitStream!13531 (buf!7826 array!18922) (currentByte!14399 (_ BitVec 32)) (currentBit!14394 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13530)

(declare-fun array_inv!7765 (array!18922) Bool)

(assert (=> b!310656 (= e!223188 (array_inv!7765 (buf!7826 bitStream!19)))))

(declare-fun b!310654 () Bool)

(declare-fun res!254674 () Bool)

(declare-fun e!223189 () Bool)

(assert (=> b!310654 (=> (not res!254674) (not e!223189))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> b!310654 (= res!254674 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!254672 () Bool)

(assert (=> start!68836 (=> (not res!254672) (not e!223189))))

(assert (=> start!68836 (= res!254672 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68836 e!223189))

(assert (=> start!68836 true))

(declare-fun inv!12 (BitStream!13530) Bool)

(assert (=> start!68836 (and (inv!12 bitStream!19) e!223188)))

(declare-fun b!310655 () Bool)

(assert (=> b!310655 (= e!223189 (bvslt (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!23398 0))(
  ( (tuple2!23399 (_1!13292 Bool) (_2!13292 BitStream!13530)) )
))
(declare-fun lt!440478 () tuple2!23398)

(declare-fun readBit!0 (BitStream!13530) tuple2!23398)

(assert (=> b!310655 (= lt!440478 (readBit!0 bitStream!19))))

(declare-fun b!310653 () Bool)

(declare-fun res!254673 () Bool)

(assert (=> b!310653 (=> (not res!254673) (not e!223189))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310653 (= res!254673 (validate_offset_bits!1 ((_ sign_extend 32) (size!8210 (buf!7826 bitStream!19))) ((_ sign_extend 32) (currentByte!14399 bitStream!19)) ((_ sign_extend 32) (currentBit!14394 bitStream!19)) nBits!480))))

(assert (= (and start!68836 res!254672) b!310653))

(assert (= (and b!310653 res!254673) b!310654))

(assert (= (and b!310654 res!254674) b!310655))

(assert (= start!68836 b!310656))

(declare-fun m!448443 () Bool)

(assert (=> b!310656 m!448443))

(declare-fun m!448445 () Bool)

(assert (=> start!68836 m!448445))

(declare-fun m!448447 () Bool)

(assert (=> b!310655 m!448447))

(declare-fun m!448449 () Bool)

(assert (=> b!310653 m!448449))

(check-sat (not b!310656) (not b!310653) (not start!68836) (not b!310655))
(check-sat)
