; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63506 () Bool)

(assert start!63506)

(declare-fun res!235184 () Bool)

(declare-fun e!202752 () Bool)

(assert (=> start!63506 (=> (not res!235184) (not e!202752))))

(declare-datatypes ((array!16529 0))(
  ( (array!16530 (arr!8133 (Array (_ BitVec 32) (_ BitVec 8))) (size!7137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12644 0))(
  ( (BitStream!12645 (buf!7383 array!16529) (currentByte!13684 (_ BitVec 32)) (currentBit!13679 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12644)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63506 (= res!235184 (validate_offset_bits!1 ((_ sign_extend 32) (size!7137 (buf!7383 thiss!1939))) ((_ sign_extend 32) (currentByte!13684 thiss!1939)) ((_ sign_extend 32) (currentBit!13679 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13684 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13679 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63506 e!202752))

(declare-fun e!202751 () Bool)

(declare-fun inv!12 (BitStream!12644) Bool)

(assert (=> start!63506 (and (inv!12 thiss!1939) e!202751)))

(declare-fun b!283811 () Bool)

(assert (=> b!283811 (= e!202752 false)))

(declare-datatypes ((Unit!19899 0))(
  ( (Unit!19900) )
))
(declare-datatypes ((tuple2!22618 0))(
  ( (tuple2!22619 (_1!12503 Unit!19899) (_2!12503 BitStream!12644)) )
))
(declare-fun lt!418218 () tuple2!22618)

(declare-fun alignToByte!0 (BitStream!12644) tuple2!22618)

(assert (=> b!283811 (= lt!418218 (alignToByte!0 thiss!1939))))

(declare-fun b!283812 () Bool)

(declare-fun array_inv!6830 (array!16529) Bool)

(assert (=> b!283812 (= e!202751 (array_inv!6830 (buf!7383 thiss!1939)))))

(assert (= (and start!63506 res!235184) b!283811))

(assert (= start!63506 b!283812))

(declare-fun m!416915 () Bool)

(assert (=> start!63506 m!416915))

(declare-fun m!416917 () Bool)

(assert (=> start!63506 m!416917))

(declare-fun m!416919 () Bool)

(assert (=> b!283811 m!416919))

(declare-fun m!416921 () Bool)

(assert (=> b!283812 m!416921))

(push 1)

(assert (not b!283812))

(assert (not start!63506))

(assert (not b!283811))

(check-sat)

