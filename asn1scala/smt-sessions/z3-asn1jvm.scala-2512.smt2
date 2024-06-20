; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63504 () Bool)

(assert start!63504)

(declare-fun res!235181 () Bool)

(declare-fun e!202742 () Bool)

(assert (=> start!63504 (=> (not res!235181) (not e!202742))))

(declare-datatypes ((array!16527 0))(
  ( (array!16528 (arr!8132 (Array (_ BitVec 32) (_ BitVec 8))) (size!7136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12642 0))(
  ( (BitStream!12643 (buf!7382 array!16527) (currentByte!13683 (_ BitVec 32)) (currentBit!13678 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12642)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63504 (= res!235181 (validate_offset_bits!1 ((_ sign_extend 32) (size!7136 (buf!7382 thiss!1939))) ((_ sign_extend 32) (currentByte!13683 thiss!1939)) ((_ sign_extend 32) (currentBit!13678 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13683 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13678 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63504 e!202742))

(declare-fun e!202743 () Bool)

(declare-fun inv!12 (BitStream!12642) Bool)

(assert (=> start!63504 (and (inv!12 thiss!1939) e!202743)))

(declare-fun b!283805 () Bool)

(assert (=> b!283805 (= e!202742 false)))

(declare-datatypes ((Unit!19897 0))(
  ( (Unit!19898) )
))
(declare-datatypes ((tuple2!22616 0))(
  ( (tuple2!22617 (_1!12502 Unit!19897) (_2!12502 BitStream!12642)) )
))
(declare-fun lt!418215 () tuple2!22616)

(declare-fun alignToByte!0 (BitStream!12642) tuple2!22616)

(assert (=> b!283805 (= lt!418215 (alignToByte!0 thiss!1939))))

(declare-fun b!283806 () Bool)

(declare-fun array_inv!6829 (array!16527) Bool)

(assert (=> b!283806 (= e!202743 (array_inv!6829 (buf!7382 thiss!1939)))))

(assert (= (and start!63504 res!235181) b!283805))

(assert (= start!63504 b!283806))

(declare-fun m!416907 () Bool)

(assert (=> start!63504 m!416907))

(declare-fun m!416909 () Bool)

(assert (=> start!63504 m!416909))

(declare-fun m!416911 () Bool)

(assert (=> b!283805 m!416911))

(declare-fun m!416913 () Bool)

(assert (=> b!283806 m!416913))

(check-sat (not b!283805) (not b!283806) (not start!63504))
