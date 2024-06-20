; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63498 () Bool)

(assert start!63498)

(declare-fun res!235172 () Bool)

(declare-fun e!202714 () Bool)

(assert (=> start!63498 (=> (not res!235172) (not e!202714))))

(declare-datatypes ((array!16521 0))(
  ( (array!16522 (arr!8129 (Array (_ BitVec 32) (_ BitVec 8))) (size!7133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12636 0))(
  ( (BitStream!12637 (buf!7379 array!16521) (currentByte!13680 (_ BitVec 32)) (currentBit!13675 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12636)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63498 (= res!235172 (validate_offset_bits!1 ((_ sign_extend 32) (size!7133 (buf!7379 thiss!1939))) ((_ sign_extend 32) (currentByte!13680 thiss!1939)) ((_ sign_extend 32) (currentBit!13675 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13680 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13675 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63498 e!202714))

(declare-fun e!202715 () Bool)

(declare-fun inv!12 (BitStream!12636) Bool)

(assert (=> start!63498 (and (inv!12 thiss!1939) e!202715)))

(declare-fun b!283787 () Bool)

(assert (=> b!283787 (= e!202714 false)))

(declare-datatypes ((Unit!19891 0))(
  ( (Unit!19892) )
))
(declare-datatypes ((tuple2!22610 0))(
  ( (tuple2!22611 (_1!12499 Unit!19891) (_2!12499 BitStream!12636)) )
))
(declare-fun lt!418206 () tuple2!22610)

(declare-fun alignToByte!0 (BitStream!12636) tuple2!22610)

(assert (=> b!283787 (= lt!418206 (alignToByte!0 thiss!1939))))

(declare-fun b!283788 () Bool)

(declare-fun array_inv!6826 (array!16521) Bool)

(assert (=> b!283788 (= e!202715 (array_inv!6826 (buf!7379 thiss!1939)))))

(assert (= (and start!63498 res!235172) b!283787))

(assert (= start!63498 b!283788))

(declare-fun m!416883 () Bool)

(assert (=> start!63498 m!416883))

(declare-fun m!416885 () Bool)

(assert (=> start!63498 m!416885))

(declare-fun m!416887 () Bool)

(assert (=> b!283787 m!416887))

(declare-fun m!416889 () Bool)

(assert (=> b!283788 m!416889))

(check-sat (not b!283787) (not b!283788) (not start!63498))
