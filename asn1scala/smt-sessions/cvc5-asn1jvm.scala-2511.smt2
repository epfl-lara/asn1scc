; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63496 () Bool)

(assert start!63496)

(declare-fun res!235169 () Bool)

(declare-fun e!202706 () Bool)

(assert (=> start!63496 (=> (not res!235169) (not e!202706))))

(declare-datatypes ((array!16519 0))(
  ( (array!16520 (arr!8128 (Array (_ BitVec 32) (_ BitVec 8))) (size!7132 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12634 0))(
  ( (BitStream!12635 (buf!7378 array!16519) (currentByte!13679 (_ BitVec 32)) (currentBit!13674 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12634)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63496 (= res!235169 (validate_offset_bits!1 ((_ sign_extend 32) (size!7132 (buf!7378 thiss!1939))) ((_ sign_extend 32) (currentByte!13679 thiss!1939)) ((_ sign_extend 32) (currentBit!13674 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13679 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13674 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63496 e!202706))

(declare-fun e!202707 () Bool)

(declare-fun inv!12 (BitStream!12634) Bool)

(assert (=> start!63496 (and (inv!12 thiss!1939) e!202707)))

(declare-fun b!283781 () Bool)

(assert (=> b!283781 (= e!202706 false)))

(declare-datatypes ((Unit!19889 0))(
  ( (Unit!19890) )
))
(declare-datatypes ((tuple2!22608 0))(
  ( (tuple2!22609 (_1!12498 Unit!19889) (_2!12498 BitStream!12634)) )
))
(declare-fun lt!418203 () tuple2!22608)

(declare-fun alignToByte!0 (BitStream!12634) tuple2!22608)

(assert (=> b!283781 (= lt!418203 (alignToByte!0 thiss!1939))))

(declare-fun b!283782 () Bool)

(declare-fun array_inv!6825 (array!16519) Bool)

(assert (=> b!283782 (= e!202707 (array_inv!6825 (buf!7378 thiss!1939)))))

(assert (= (and start!63496 res!235169) b!283781))

(assert (= start!63496 b!283782))

(declare-fun m!416875 () Bool)

(assert (=> start!63496 m!416875))

(declare-fun m!416877 () Bool)

(assert (=> start!63496 m!416877))

(declare-fun m!416879 () Bool)

(assert (=> b!283781 m!416879))

(declare-fun m!416881 () Bool)

(assert (=> b!283782 m!416881))

(push 1)

(assert (not b!283782))

(assert (not start!63496))

(assert (not b!283781))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

