; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63442 () Bool)

(assert start!63442)

(declare-fun res!235109 () Bool)

(declare-fun e!202622 () Bool)

(assert (=> start!63442 (=> (not res!235109) (not e!202622))))

(declare-datatypes ((array!16504 0))(
  ( (array!16505 (arr!8122 (Array (_ BitVec 32) (_ BitVec 8))) (size!7126 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12622 0))(
  ( (BitStream!12623 (buf!7372 array!16504) (currentByte!13661 (_ BitVec 32)) (currentBit!13656 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12622)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63442 (= res!235109 (validate_offset_bits!1 ((_ sign_extend 32) (size!7126 (buf!7372 thiss!1939))) ((_ sign_extend 32) (currentByte!13661 thiss!1939)) ((_ sign_extend 32) (currentBit!13656 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13661 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13656 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63442 e!202622))

(declare-fun e!202623 () Bool)

(declare-fun inv!12 (BitStream!12622) Bool)

(assert (=> start!63442 (and (inv!12 thiss!1939) e!202623)))

(declare-fun b!283703 () Bool)

(assert (=> b!283703 (= e!202622 false)))

(declare-datatypes ((Unit!19865 0))(
  ( (Unit!19866) )
))
(declare-datatypes ((tuple2!22596 0))(
  ( (tuple2!22597 (_1!12492 Unit!19865) (_2!12492 BitStream!12622)) )
))
(declare-fun lt!418086 () tuple2!22596)

(declare-fun alignToByte!0 (BitStream!12622) tuple2!22596)

(assert (=> b!283703 (= lt!418086 (alignToByte!0 thiss!1939))))

(declare-fun b!283704 () Bool)

(declare-fun array_inv!6819 (array!16504) Bool)

(assert (=> b!283704 (= e!202623 (array_inv!6819 (buf!7372 thiss!1939)))))

(assert (= (and start!63442 res!235109) b!283703))

(assert (= start!63442 b!283704))

(declare-fun m!416785 () Bool)

(assert (=> start!63442 m!416785))

(declare-fun m!416787 () Bool)

(assert (=> start!63442 m!416787))

(declare-fun m!416789 () Bool)

(assert (=> b!283703 m!416789))

(declare-fun m!416791 () Bool)

(assert (=> b!283704 m!416791))

(push 1)

(assert (not b!283703))

(assert (not b!283704))

(assert (not start!63442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

