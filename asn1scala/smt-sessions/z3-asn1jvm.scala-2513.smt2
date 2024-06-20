; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63510 () Bool)

(assert start!63510)

(declare-fun res!235190 () Bool)

(declare-fun e!202768 () Bool)

(assert (=> start!63510 (=> (not res!235190) (not e!202768))))

(declare-datatypes ((array!16533 0))(
  ( (array!16534 (arr!8135 (Array (_ BitVec 32) (_ BitVec 8))) (size!7139 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12648 0))(
  ( (BitStream!12649 (buf!7385 array!16533) (currentByte!13686 (_ BitVec 32)) (currentBit!13681 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12648)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63510 (= res!235190 (validate_offset_bits!1 ((_ sign_extend 32) (size!7139 (buf!7385 thiss!1939))) ((_ sign_extend 32) (currentByte!13686 thiss!1939)) ((_ sign_extend 32) (currentBit!13681 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13686 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13681 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63510 e!202768))

(declare-fun e!202770 () Bool)

(declare-fun inv!12 (BitStream!12648) Bool)

(assert (=> start!63510 (and (inv!12 thiss!1939) e!202770)))

(declare-fun b!283823 () Bool)

(declare-fun lt!418224 () (_ BitVec 32))

(assert (=> b!283823 (= e!202768 (and (not (= lt!418224 #b00000000000000000000000000000000)) (not (= #b00000000000000000000000000000010 (bvsdiv (bvmul #b00000000000000000000000000000010 lt!418224) lt!418224)))))))

(declare-datatypes ((Unit!19903 0))(
  ( (Unit!19904) )
))
(declare-datatypes ((tuple2!22622 0))(
  ( (tuple2!22623 (_1!12505 Unit!19903) (_2!12505 BitStream!12648)) )
))
(declare-fun alignToByte!0 (BitStream!12648) tuple2!22622)

(assert (=> b!283823 (= lt!418224 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13686 (_2!12505 (alignToByte!0 thiss!1939)))) #b00000000000000000000000000000010))))

(declare-fun b!283824 () Bool)

(declare-fun array_inv!6832 (array!16533) Bool)

(assert (=> b!283824 (= e!202770 (array_inv!6832 (buf!7385 thiss!1939)))))

(assert (= (and start!63510 res!235190) b!283823))

(assert (= start!63510 b!283824))

(declare-fun m!416931 () Bool)

(assert (=> start!63510 m!416931))

(declare-fun m!416933 () Bool)

(assert (=> start!63510 m!416933))

(declare-fun m!416935 () Bool)

(assert (=> b!283823 m!416935))

(declare-fun m!416937 () Bool)

(assert (=> b!283824 m!416937))

(check-sat (not b!283823) (not b!283824) (not start!63510))
(check-sat)
