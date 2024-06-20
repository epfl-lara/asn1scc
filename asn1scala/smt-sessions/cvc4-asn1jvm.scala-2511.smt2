; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63500 () Bool)

(assert start!63500)

(declare-fun res!235175 () Bool)

(declare-fun e!202724 () Bool)

(assert (=> start!63500 (=> (not res!235175) (not e!202724))))

(declare-datatypes ((array!16523 0))(
  ( (array!16524 (arr!8130 (Array (_ BitVec 32) (_ BitVec 8))) (size!7134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12638 0))(
  ( (BitStream!12639 (buf!7380 array!16523) (currentByte!13681 (_ BitVec 32)) (currentBit!13676 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12638)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63500 (= res!235175 (validate_offset_bits!1 ((_ sign_extend 32) (size!7134 (buf!7380 thiss!1939))) ((_ sign_extend 32) (currentByte!13681 thiss!1939)) ((_ sign_extend 32) (currentBit!13676 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13681 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13676 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63500 e!202724))

(declare-fun e!202723 () Bool)

(declare-fun inv!12 (BitStream!12638) Bool)

(assert (=> start!63500 (and (inv!12 thiss!1939) e!202723)))

(declare-fun b!283793 () Bool)

(assert (=> b!283793 (= e!202724 false)))

(declare-datatypes ((Unit!19893 0))(
  ( (Unit!19894) )
))
(declare-datatypes ((tuple2!22612 0))(
  ( (tuple2!22613 (_1!12500 Unit!19893) (_2!12500 BitStream!12638)) )
))
(declare-fun lt!418209 () tuple2!22612)

(declare-fun alignToByte!0 (BitStream!12638) tuple2!22612)

(assert (=> b!283793 (= lt!418209 (alignToByte!0 thiss!1939))))

(declare-fun b!283794 () Bool)

(declare-fun array_inv!6827 (array!16523) Bool)

(assert (=> b!283794 (= e!202723 (array_inv!6827 (buf!7380 thiss!1939)))))

(assert (= (and start!63500 res!235175) b!283793))

(assert (= start!63500 b!283794))

(declare-fun m!416891 () Bool)

(assert (=> start!63500 m!416891))

(declare-fun m!416893 () Bool)

(assert (=> start!63500 m!416893))

(declare-fun m!416895 () Bool)

(assert (=> b!283793 m!416895))

(declare-fun m!416897 () Bool)

(assert (=> b!283794 m!416897))

(push 1)

