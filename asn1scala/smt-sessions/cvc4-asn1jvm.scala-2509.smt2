; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63446 () Bool)

(assert start!63446)

(declare-fun res!235115 () Bool)

(declare-fun e!202641 () Bool)

(assert (=> start!63446 (=> (not res!235115) (not e!202641))))

(declare-datatypes ((array!16508 0))(
  ( (array!16509 (arr!8124 (Array (_ BitVec 32) (_ BitVec 8))) (size!7128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12626 0))(
  ( (BitStream!12627 (buf!7374 array!16508) (currentByte!13663 (_ BitVec 32)) (currentBit!13658 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12626)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63446 (= res!235115 (validate_offset_bits!1 ((_ sign_extend 32) (size!7128 (buf!7374 thiss!1939))) ((_ sign_extend 32) (currentByte!13663 thiss!1939)) ((_ sign_extend 32) (currentBit!13658 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13663 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13658 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63446 e!202641))

(declare-fun e!202639 () Bool)

(declare-fun inv!12 (BitStream!12626) Bool)

(assert (=> start!63446 (and (inv!12 thiss!1939) e!202639)))

(declare-fun b!283715 () Bool)

(assert (=> b!283715 (= e!202641 false)))

(declare-datatypes ((Unit!19869 0))(
  ( (Unit!19870) )
))
(declare-datatypes ((tuple2!22600 0))(
  ( (tuple2!22601 (_1!12494 Unit!19869) (_2!12494 BitStream!12626)) )
))
(declare-fun lt!418092 () tuple2!22600)

(declare-fun alignToByte!0 (BitStream!12626) tuple2!22600)

(assert (=> b!283715 (= lt!418092 (alignToByte!0 thiss!1939))))

(declare-fun b!283716 () Bool)

(declare-fun array_inv!6821 (array!16508) Bool)

(assert (=> b!283716 (= e!202639 (array_inv!6821 (buf!7374 thiss!1939)))))

(assert (= (and start!63446 res!235115) b!283715))

(assert (= start!63446 b!283716))

(declare-fun m!416801 () Bool)

(assert (=> start!63446 m!416801))

(declare-fun m!416803 () Bool)

(assert (=> start!63446 m!416803))

(declare-fun m!416805 () Bool)

(assert (=> b!283715 m!416805))

(declare-fun m!416807 () Bool)

(assert (=> b!283716 m!416807))

(push 1)

