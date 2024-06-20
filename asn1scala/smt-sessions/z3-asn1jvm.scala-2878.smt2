; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68908 () Bool)

(assert start!68908)

(declare-fun res!254813 () Bool)

(declare-fun e!223321 () Bool)

(assert (=> start!68908 (=> (not res!254813) (not e!223321))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> start!68908 (= res!254813 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68908 e!223321))

(assert (=> start!68908 true))

(declare-datatypes ((array!18943 0))(
  ( (array!18944 (arr!9302 (Array (_ BitVec 32) (_ BitVec 8))) (size!8219 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13548 0))(
  ( (BitStream!13549 (buf!7835 array!18943) (currentByte!14423 (_ BitVec 32)) (currentBit!14418 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13548)

(declare-fun e!223322 () Bool)

(declare-fun inv!12 (BitStream!13548) Bool)

(assert (=> start!68908 (and (inv!12 bitStream!19) e!223322)))

(declare-fun b!310822 () Bool)

(declare-fun res!254815 () Bool)

(assert (=> b!310822 (=> (not res!254815) (not e!223321))))

(assert (=> b!310822 (= res!254815 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310821 () Bool)

(declare-fun res!254814 () Bool)

(assert (=> b!310821 (=> (not res!254814) (not e!223321))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310821 (= res!254814 (validate_offset_bits!1 ((_ sign_extend 32) (size!8219 (buf!7835 bitStream!19))) ((_ sign_extend 32) (currentByte!14423 bitStream!19)) ((_ sign_extend 32) (currentBit!14418 bitStream!19)) nBits!480))))

(declare-fun b!310823 () Bool)

(assert (=> b!310823 (= e!223321 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!480))))

(declare-datatypes ((tuple2!23422 0))(
  ( (tuple2!23423 (_1!13304 Bool) (_2!13304 BitStream!13548)) )
))
(declare-fun lt!440685 () tuple2!23422)

(declare-fun readBit!0 (BitStream!13548) tuple2!23422)

(assert (=> b!310823 (= lt!440685 (readBit!0 bitStream!19))))

(declare-fun b!310824 () Bool)

(declare-fun array_inv!7774 (array!18943) Bool)

(assert (=> b!310824 (= e!223322 (array_inv!7774 (buf!7835 bitStream!19)))))

(assert (= (and start!68908 res!254813) b!310821))

(assert (= (and b!310821 res!254814) b!310822))

(assert (= (and b!310822 res!254815) b!310823))

(assert (= start!68908 b!310824))

(declare-fun m!448599 () Bool)

(assert (=> start!68908 m!448599))

(declare-fun m!448601 () Bool)

(assert (=> b!310821 m!448601))

(declare-fun m!448603 () Bool)

(assert (=> b!310823 m!448603))

(declare-fun m!448605 () Bool)

(assert (=> b!310824 m!448605))

(check-sat (not b!310824) (not start!68908) (not b!310823) (not b!310821))
(check-sat)
