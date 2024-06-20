; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51848 () Bool)

(assert start!51848)

(declare-datatypes ((array!13019 0))(
  ( (array!13020 (arr!6692 (Array (_ BitVec 32) (_ BitVec 8))) (size!5705 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10332 0))(
  ( (BitStream!10333 (buf!6159 array!13019) (currentByte!11471 (_ BitVec 32)) (currentBit!11466 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10332)

(assert (=> start!51848 (not (= (bvand (currentByte!11471 thiss!1948) #b00000000000000000000000000000011) (bvsdiv (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11471 thiss!1948) #b00000000000000000000000000000011)) #b00000000000000000000000000001000)))))

(declare-fun e!165964 () Bool)

(declare-fun inv!12 (BitStream!10332) Bool)

(assert (=> start!51848 (and (inv!12 thiss!1948) e!165964)))

(declare-fun b!239582 () Bool)

(declare-fun array_inv!5446 (array!13019) Bool)

(assert (=> b!239582 (= e!165964 (array_inv!5446 (buf!6159 thiss!1948)))))

(assert (= start!51848 b!239582))

(declare-fun m!361823 () Bool)

(assert (=> start!51848 m!361823))

(declare-fun m!361825 () Bool)

(assert (=> b!239582 m!361825))

(check-sat (not start!51848) (not b!239582))
