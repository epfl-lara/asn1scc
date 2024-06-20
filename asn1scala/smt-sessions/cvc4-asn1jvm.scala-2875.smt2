; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68838 () Bool)

(assert start!68838)

(declare-fun res!254682 () Bool)

(declare-fun e!223198 () Bool)

(assert (=> start!68838 (=> (not res!254682) (not e!223198))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> start!68838 (= res!254682 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68838 e!223198))

(assert (=> start!68838 true))

(declare-datatypes ((array!18924 0))(
  ( (array!18925 (arr!9294 (Array (_ BitVec 32) (_ BitVec 8))) (size!8211 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13532 0))(
  ( (BitStream!13533 (buf!7827 array!18924) (currentByte!14400 (_ BitVec 32)) (currentBit!14395 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13532)

(declare-fun e!223197 () Bool)

(declare-fun inv!12 (BitStream!13532) Bool)

(assert (=> start!68838 (and (inv!12 bitStream!19) e!223197)))

(declare-fun b!310666 () Bool)

(declare-fun res!254683 () Bool)

(assert (=> b!310666 (=> (not res!254683) (not e!223198))))

(assert (=> b!310666 (= res!254683 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310667 () Bool)

(assert (=> b!310667 (= e!223198 (bvslt (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!23400 0))(
  ( (tuple2!23401 (_1!13293 Bool) (_2!13293 BitStream!13532)) )
))
(declare-fun lt!440481 () tuple2!23400)

(declare-fun readBit!0 (BitStream!13532) tuple2!23400)

(assert (=> b!310667 (= lt!440481 (readBit!0 bitStream!19))))

(declare-fun b!310668 () Bool)

(declare-fun array_inv!7766 (array!18924) Bool)

(assert (=> b!310668 (= e!223197 (array_inv!7766 (buf!7827 bitStream!19)))))

(declare-fun b!310665 () Bool)

(declare-fun res!254681 () Bool)

(assert (=> b!310665 (=> (not res!254681) (not e!223198))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310665 (= res!254681 (validate_offset_bits!1 ((_ sign_extend 32) (size!8211 (buf!7827 bitStream!19))) ((_ sign_extend 32) (currentByte!14400 bitStream!19)) ((_ sign_extend 32) (currentBit!14395 bitStream!19)) nBits!480))))

(assert (= (and start!68838 res!254682) b!310665))

(assert (= (and b!310665 res!254681) b!310666))

(assert (= (and b!310666 res!254683) b!310667))

(assert (= start!68838 b!310668))

(declare-fun m!448451 () Bool)

(assert (=> start!68838 m!448451))

(declare-fun m!448453 () Bool)

(assert (=> b!310667 m!448453))

(declare-fun m!448455 () Bool)

(assert (=> b!310668 m!448455))

(declare-fun m!448457 () Bool)

(assert (=> b!310665 m!448457))

(push 1)

(assert (not b!310665))

(assert (not start!68838))

(assert (not b!310667))

(assert (not b!310668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

