; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!712 () Bool)

(assert start!712)

(declare-fun b!2196 () Bool)

(declare-fun res!3946 () Bool)

(declare-fun e!1557 () Bool)

(assert (=> b!2196 (=> (not res!3946) (not e!1557))))

(declare-datatypes ((array!209 0))(
  ( (array!210 (arr!470 (Array (_ BitVec 32) (_ BitVec 8))) (size!83 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!144 0))(
  ( (BitStream!145 (buf!392 array!209) (currentByte!1347 (_ BitVec 32)) (currentBit!1342 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!144)

(declare-datatypes ((Unit!120 0))(
  ( (Unit!121) )
))
(declare-datatypes ((tuple2!152 0))(
  ( (tuple2!153 (_1!83 Unit!120) (_2!83 BitStream!144)) )
))
(declare-fun lt!1756 () tuple2!152)

(assert (=> b!2196 (= res!3946 (= (size!83 (buf!392 thiss!1486)) (size!83 (buf!392 (_2!83 lt!1756)))))))

(declare-fun b!2197 () Bool)

(declare-fun res!3944 () Bool)

(assert (=> b!2197 (=> (not res!3944) (not e!1557))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2197 (= res!3944 (= (bitIndex!0 (size!83 (buf!392 (_2!83 lt!1756))) (currentByte!1347 (_2!83 lt!1756)) (currentBit!1342 (_2!83 lt!1756))) (bvadd (bitIndex!0 (size!83 (buf!392 thiss!1486)) (currentByte!1347 thiss!1486) (currentBit!1342 thiss!1486)) nBits!460)))))

(declare-fun res!3948 () Bool)

(declare-fun e!1558 () Bool)

(assert (=> start!712 (=> (not res!3948) (not e!1558))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!209)

(assert (=> start!712 (= res!3948 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!83 srcBuffer!6))))))))

(assert (=> start!712 e!1558))

(assert (=> start!712 true))

(declare-fun array_inv!78 (array!209) Bool)

(assert (=> start!712 (array_inv!78 srcBuffer!6)))

(declare-fun e!1559 () Bool)

(declare-fun inv!12 (BitStream!144) Bool)

(assert (=> start!712 (and (inv!12 thiss!1486) e!1559)))

(declare-fun b!2198 () Bool)

(assert (=> b!2198 (= e!1558 e!1557)))

(declare-fun res!3949 () Bool)

(assert (=> b!2198 (=> (not res!3949) (not e!1557))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2198 (= res!3949 (invariant!0 (currentBit!1342 (_2!83 lt!1756)) (currentByte!1347 (_2!83 lt!1756)) (size!83 (buf!392 (_2!83 lt!1756)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!144 array!209 (_ BitVec 64) (_ BitVec 64)) tuple2!152)

(assert (=> b!2198 (= lt!1756 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2199 () Bool)

(declare-fun res!3947 () Bool)

(assert (=> b!2199 (=> (not res!3947) (not e!1557))))

(declare-fun isPrefixOf!0 (BitStream!144 BitStream!144) Bool)

(assert (=> b!2199 (= res!3947 (isPrefixOf!0 thiss!1486 (_2!83 lt!1756)))))

(declare-fun b!2200 () Bool)

(declare-fun res!3945 () Bool)

(assert (=> b!2200 (=> (not res!3945) (not e!1558))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2200 (= res!3945 (validate_offset_bits!1 ((_ sign_extend 32) (size!83 (buf!392 thiss!1486))) ((_ sign_extend 32) (currentByte!1347 thiss!1486)) ((_ sign_extend 32) (currentBit!1342 thiss!1486)) nBits!460))))

(declare-fun b!2201 () Bool)

(assert (=> b!2201 (= e!1559 (array_inv!78 (buf!392 thiss!1486)))))

(declare-fun b!2202 () Bool)

(assert (=> b!2202 (= e!1557 false)))

(declare-datatypes ((tuple2!154 0))(
  ( (tuple2!155 (_1!84 BitStream!144) (_2!84 BitStream!144)) )
))
(declare-fun lt!1757 () tuple2!154)

(declare-fun reader!0 (BitStream!144 BitStream!144) tuple2!154)

(assert (=> b!2202 (= lt!1757 (reader!0 thiss!1486 (_2!83 lt!1756)))))

(assert (= (and start!712 res!3948) b!2200))

(assert (= (and b!2200 res!3945) b!2198))

(assert (= (and b!2198 res!3949) b!2196))

(assert (= (and b!2196 res!3946) b!2197))

(assert (= (and b!2197 res!3944) b!2199))

(assert (= (and b!2199 res!3947) b!2202))

(assert (= start!712 b!2201))

(declare-fun m!1835 () Bool)

(assert (=> start!712 m!1835))

(declare-fun m!1837 () Bool)

(assert (=> start!712 m!1837))

(declare-fun m!1839 () Bool)

(assert (=> b!2199 m!1839))

(declare-fun m!1841 () Bool)

(assert (=> b!2197 m!1841))

(declare-fun m!1843 () Bool)

(assert (=> b!2197 m!1843))

(declare-fun m!1845 () Bool)

(assert (=> b!2201 m!1845))

(declare-fun m!1847 () Bool)

(assert (=> b!2198 m!1847))

(declare-fun m!1849 () Bool)

(assert (=> b!2198 m!1849))

(declare-fun m!1851 () Bool)

(assert (=> b!2200 m!1851))

(declare-fun m!1853 () Bool)

(assert (=> b!2202 m!1853))

(check-sat (not b!2199) (not b!2201) (not b!2198) (not b!2197) (not start!712) (not b!2202) (not b!2200))
