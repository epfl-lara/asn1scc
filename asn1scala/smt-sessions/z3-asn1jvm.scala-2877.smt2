; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68902 () Bool)

(assert start!68902)

(declare-fun b!310786 () Bool)

(declare-fun res!254787 () Bool)

(declare-fun e!223295 () Bool)

(assert (=> b!310786 (=> (not res!254787) (not e!223295))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> b!310786 (= res!254787 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310785 () Bool)

(declare-fun res!254786 () Bool)

(assert (=> b!310785 (=> (not res!254786) (not e!223295))))

(declare-datatypes ((array!18937 0))(
  ( (array!18938 (arr!9299 (Array (_ BitVec 32) (_ BitVec 8))) (size!8216 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13542 0))(
  ( (BitStream!13543 (buf!7832 array!18937) (currentByte!14420 (_ BitVec 32)) (currentBit!14415 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13542)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310785 (= res!254786 (validate_offset_bits!1 ((_ sign_extend 32) (size!8216 (buf!7832 bitStream!19))) ((_ sign_extend 32) (currentByte!14420 bitStream!19)) ((_ sign_extend 32) (currentBit!14415 bitStream!19)) nBits!480))))

(declare-fun b!310788 () Bool)

(declare-fun e!223294 () Bool)

(declare-fun array_inv!7771 (array!18937) Bool)

(assert (=> b!310788 (= e!223294 (array_inv!7771 (buf!7832 bitStream!19)))))

(declare-fun b!310787 () Bool)

(assert (=> b!310787 (= e!223295 (and (not (= (bvand nBits!480 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23416 0))(
  ( (tuple2!23417 (_1!13301 Bool) (_2!13301 BitStream!13542)) )
))
(declare-fun lt!440676 () tuple2!23416)

(declare-fun readBit!0 (BitStream!13542) tuple2!23416)

(assert (=> b!310787 (= lt!440676 (readBit!0 bitStream!19))))

(declare-fun res!254788 () Bool)

(assert (=> start!68902 (=> (not res!254788) (not e!223295))))

(assert (=> start!68902 (= res!254788 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68902 e!223295))

(assert (=> start!68902 true))

(declare-fun inv!12 (BitStream!13542) Bool)

(assert (=> start!68902 (and (inv!12 bitStream!19) e!223294)))

(assert (= (and start!68902 res!254788) b!310785))

(assert (= (and b!310785 res!254786) b!310786))

(assert (= (and b!310786 res!254787) b!310787))

(assert (= start!68902 b!310788))

(declare-fun m!448575 () Bool)

(assert (=> b!310785 m!448575))

(declare-fun m!448577 () Bool)

(assert (=> b!310788 m!448577))

(declare-fun m!448579 () Bool)

(assert (=> b!310787 m!448579))

(declare-fun m!448581 () Bool)

(assert (=> start!68902 m!448581))

(check-sat (not start!68902) (not b!310787) (not b!310788) (not b!310785))
