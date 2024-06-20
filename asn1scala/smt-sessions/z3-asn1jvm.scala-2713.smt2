; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66480 () Bool)

(assert start!66480)

(declare-fun b!297859 () Bool)

(declare-fun res!245824 () Bool)

(declare-fun e!213297 () Bool)

(assert (=> b!297859 (=> (not res!245824) (not e!213297))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297859 (= res!245824 (bvsge from!505 to!474))))

(declare-fun res!245825 () Bool)

(assert (=> start!66480 (=> (not res!245825) (not e!213297))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17839 0))(
  ( (array!17840 (arr!8810 (Array (_ BitVec 32) (_ BitVec 8))) (size!7730 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17839)

(assert (=> start!66480 (= res!245825 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7730 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66480 e!213297))

(declare-datatypes ((BitStream!13464 0))(
  ( (BitStream!13465 (buf!7793 array!17839) (currentByte!14347 (_ BitVec 32)) (currentBit!14342 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13464)

(declare-fun e!213293 () Bool)

(declare-fun inv!12 (BitStream!13464) Bool)

(assert (=> start!66480 (and (inv!12 thiss!1728) e!213293)))

(assert (=> start!66480 true))

(declare-fun array_inv!7342 (array!17839) Bool)

(assert (=> start!66480 (array_inv!7342 arr!273)))

(declare-fun b!297860 () Bool)

(declare-fun e!213294 () Bool)

(assert (=> b!297860 (= e!213297 (not e!213294))))

(declare-fun res!245822 () Bool)

(assert (=> b!297860 (=> res!245822 e!213294)))

(declare-fun lt!434089 () (_ BitVec 64))

(assert (=> b!297860 (= res!245822 (not (= (bvsub (bvadd lt!434089 to!474) from!505) lt!434089)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297860 (= lt!434089 (bitIndex!0 (size!7730 (buf!7793 thiss!1728)) (currentByte!14347 thiss!1728) (currentBit!14342 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17839 array!17839 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297860 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20781 0))(
  ( (Unit!20782) )
))
(declare-fun lt!434091 () Unit!20781)

(declare-fun lt!434088 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17839 array!17839 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20781)

(assert (=> b!297860 (= lt!434091 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434088 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297860 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434088)))

(assert (=> b!297860 (= lt!434088 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7730 arr!273))))))

(declare-fun lt!434090 () Unit!20781)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17839) Unit!20781)

(assert (=> b!297860 (= lt!434090 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297861 () Bool)

(assert (=> b!297861 (= e!213294 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!297862 () Bool)

(declare-fun res!245823 () Bool)

(assert (=> b!297862 (=> (not res!245823) (not e!213297))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297862 (= res!245823 (validate_offset_bits!1 ((_ sign_extend 32) (size!7730 (buf!7793 thiss!1728))) ((_ sign_extend 32) (currentByte!14347 thiss!1728)) ((_ sign_extend 32) (currentBit!14342 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297863 () Bool)

(declare-fun res!245821 () Bool)

(assert (=> b!297863 (=> res!245821 e!213294)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297863 (= res!245821 (not (invariant!0 (currentBit!14342 thiss!1728) (currentByte!14347 thiss!1728) (size!7730 (buf!7793 thiss!1728)))))))

(declare-fun b!297864 () Bool)

(assert (=> b!297864 (= e!213293 (array_inv!7342 (buf!7793 thiss!1728)))))

(assert (= (and start!66480 res!245825) b!297862))

(assert (= (and b!297862 res!245823) b!297859))

(assert (= (and b!297859 res!245824) b!297860))

(assert (= (and b!297860 (not res!245822)) b!297863))

(assert (= (and b!297863 (not res!245821)) b!297861))

(assert (= start!66480 b!297864))

(declare-fun m!436701 () Bool)

(assert (=> start!66480 m!436701))

(declare-fun m!436703 () Bool)

(assert (=> start!66480 m!436703))

(declare-fun m!436705 () Bool)

(assert (=> b!297860 m!436705))

(declare-fun m!436707 () Bool)

(assert (=> b!297860 m!436707))

(declare-fun m!436709 () Bool)

(assert (=> b!297860 m!436709))

(declare-fun m!436711 () Bool)

(assert (=> b!297860 m!436711))

(declare-fun m!436713 () Bool)

(assert (=> b!297860 m!436713))

(declare-fun m!436715 () Bool)

(assert (=> b!297863 m!436715))

(declare-fun m!436717 () Bool)

(assert (=> b!297864 m!436717))

(declare-fun m!436719 () Bool)

(assert (=> b!297862 m!436719))

(check-sat (not start!66480) (not b!297864) (not b!297863) (not b!297862) (not b!297860))
