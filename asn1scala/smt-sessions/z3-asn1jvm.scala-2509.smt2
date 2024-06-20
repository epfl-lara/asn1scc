; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63444 () Bool)

(assert start!63444)

(declare-fun res!235112 () Bool)

(declare-fun e!202630 () Bool)

(assert (=> start!63444 (=> (not res!235112) (not e!202630))))

(declare-datatypes ((array!16506 0))(
  ( (array!16507 (arr!8123 (Array (_ BitVec 32) (_ BitVec 8))) (size!7127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12624 0))(
  ( (BitStream!12625 (buf!7373 array!16506) (currentByte!13662 (_ BitVec 32)) (currentBit!13657 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12624)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63444 (= res!235112 (validate_offset_bits!1 ((_ sign_extend 32) (size!7127 (buf!7373 thiss!1939))) ((_ sign_extend 32) (currentByte!13662 thiss!1939)) ((_ sign_extend 32) (currentBit!13657 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13662 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13657 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63444 e!202630))

(declare-fun e!202632 () Bool)

(declare-fun inv!12 (BitStream!12624) Bool)

(assert (=> start!63444 (and (inv!12 thiss!1939) e!202632)))

(declare-fun b!283709 () Bool)

(assert (=> b!283709 (= e!202630 false)))

(declare-datatypes ((Unit!19867 0))(
  ( (Unit!19868) )
))
(declare-datatypes ((tuple2!22598 0))(
  ( (tuple2!22599 (_1!12493 Unit!19867) (_2!12493 BitStream!12624)) )
))
(declare-fun lt!418089 () tuple2!22598)

(declare-fun alignToByte!0 (BitStream!12624) tuple2!22598)

(assert (=> b!283709 (= lt!418089 (alignToByte!0 thiss!1939))))

(declare-fun b!283710 () Bool)

(declare-fun array_inv!6820 (array!16506) Bool)

(assert (=> b!283710 (= e!202632 (array_inv!6820 (buf!7373 thiss!1939)))))

(assert (= (and start!63444 res!235112) b!283709))

(assert (= start!63444 b!283710))

(declare-fun m!416793 () Bool)

(assert (=> start!63444 m!416793))

(declare-fun m!416795 () Bool)

(assert (=> start!63444 m!416795))

(declare-fun m!416797 () Bool)

(assert (=> b!283709 m!416797))

(declare-fun m!416799 () Bool)

(assert (=> b!283710 m!416799))

(check-sat (not b!283709) (not start!63444) (not b!283710))
