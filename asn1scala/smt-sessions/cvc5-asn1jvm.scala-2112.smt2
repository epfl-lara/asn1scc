; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53658 () Bool)

(assert start!53658)

(declare-fun b!249124 () Bool)

(declare-fun e!172611 () Bool)

(declare-fun e!172613 () Bool)

(assert (=> b!249124 (= e!172611 e!172613)))

(declare-fun res!208487 () Bool)

(assert (=> b!249124 (=> (not res!208487) (not e!172613))))

(declare-fun lt!388056 () (_ BitVec 64))

(declare-fun lt!388054 () (_ BitVec 64))

(assert (=> b!249124 (= res!208487 (= lt!388056 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388054)))))

(declare-datatypes ((array!13567 0))(
  ( (array!13568 (arr!6934 (Array (_ BitVec 32) (_ BitVec 8))) (size!5947 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10816 0))(
  ( (BitStream!10817 (buf!6440 array!13567) (currentByte!11871 (_ BitVec 32)) (currentBit!11866 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18030 0))(
  ( (Unit!18031) )
))
(declare-datatypes ((tuple2!21294 0))(
  ( (tuple2!21295 (_1!11572 Unit!18030) (_2!11572 BitStream!10816)) )
))
(declare-fun lt!388053 () tuple2!21294)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249124 (= lt!388056 (bitIndex!0 (size!5947 (buf!6440 (_2!11572 lt!388053))) (currentByte!11871 (_2!11572 lt!388053)) (currentBit!11866 (_2!11572 lt!388053))))))

(declare-fun thiss!1005 () BitStream!10816)

(assert (=> b!249124 (= lt!388054 (bitIndex!0 (size!5947 (buf!6440 thiss!1005)) (currentByte!11871 thiss!1005) (currentBit!11866 thiss!1005)))))

(declare-fun b!249125 () Bool)

(declare-fun res!208483 () Bool)

(assert (=> b!249125 (=> (not res!208483) (not e!172613))))

(declare-fun isPrefixOf!0 (BitStream!10816 BitStream!10816) Bool)

(assert (=> b!249125 (= res!208483 (isPrefixOf!0 thiss!1005 (_2!11572 lt!388053)))))

(declare-fun res!208488 () Bool)

(declare-fun e!172616 () Bool)

(assert (=> start!53658 (=> (not res!208488) (not e!172616))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53658 (= res!208488 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53658 e!172616))

(assert (=> start!53658 true))

(declare-fun e!172614 () Bool)

(declare-fun inv!12 (BitStream!10816) Bool)

(assert (=> start!53658 (and (inv!12 thiss!1005) e!172614)))

(declare-fun b!249126 () Bool)

(declare-fun e!172615 () Bool)

(assert (=> b!249126 (= e!172613 e!172615)))

(declare-fun res!208482 () Bool)

(assert (=> b!249126 (=> (not res!208482) (not e!172615))))

(declare-datatypes ((tuple2!21296 0))(
  ( (tuple2!21297 (_1!11573 BitStream!10816) (_2!11573 Bool)) )
))
(declare-fun lt!388055 () tuple2!21296)

(declare-fun bit!26 () Bool)

(assert (=> b!249126 (= res!208482 (and (= (_2!11573 lt!388055) bit!26) (= (_1!11573 lt!388055) (_2!11572 lt!388053))))))

(declare-fun readBitPure!0 (BitStream!10816) tuple2!21296)

(declare-fun readerFrom!0 (BitStream!10816 (_ BitVec 32) (_ BitVec 32)) BitStream!10816)

(assert (=> b!249126 (= lt!388055 (readBitPure!0 (readerFrom!0 (_2!11572 lt!388053) (currentBit!11866 thiss!1005) (currentByte!11871 thiss!1005))))))

(declare-fun b!249127 () Bool)

(assert (=> b!249127 (= e!172616 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!249127 e!172611))

(declare-fun res!208484 () Bool)

(assert (=> b!249127 (=> (not res!208484) (not e!172611))))

(assert (=> b!249127 (= res!208484 (= (size!5947 (buf!6440 thiss!1005)) (size!5947 (buf!6440 (_2!11572 lt!388053)))))))

(declare-fun appendBit!0 (BitStream!10816 Bool) tuple2!21294)

(assert (=> b!249127 (= lt!388053 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249128 () Bool)

(declare-fun res!208486 () Bool)

(assert (=> b!249128 (=> (not res!208486) (not e!172616))))

(assert (=> b!249128 (= res!208486 (bvslt from!289 nBits!297))))

(declare-fun b!249129 () Bool)

(assert (=> b!249129 (= e!172615 (= (bitIndex!0 (size!5947 (buf!6440 (_1!11573 lt!388055))) (currentByte!11871 (_1!11573 lt!388055)) (currentBit!11866 (_1!11573 lt!388055))) lt!388056))))

(declare-fun b!249130 () Bool)

(declare-fun array_inv!5688 (array!13567) Bool)

(assert (=> b!249130 (= e!172614 (array_inv!5688 (buf!6440 thiss!1005)))))

(declare-fun b!249131 () Bool)

(declare-fun res!208485 () Bool)

(assert (=> b!249131 (=> (not res!208485) (not e!172616))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249131 (= res!208485 (validate_offset_bits!1 ((_ sign_extend 32) (size!5947 (buf!6440 thiss!1005))) ((_ sign_extend 32) (currentByte!11871 thiss!1005)) ((_ sign_extend 32) (currentBit!11866 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53658 res!208488) b!249131))

(assert (= (and b!249131 res!208485) b!249128))

(assert (= (and b!249128 res!208486) b!249127))

(assert (= (and b!249127 res!208484) b!249124))

(assert (= (and b!249124 res!208487) b!249125))

(assert (= (and b!249125 res!208483) b!249126))

(assert (= (and b!249126 res!208482) b!249129))

(assert (= start!53658 b!249130))

(declare-fun m!375585 () Bool)

(assert (=> b!249131 m!375585))

(declare-fun m!375587 () Bool)

(assert (=> b!249127 m!375587))

(declare-fun m!375589 () Bool)

(assert (=> b!249126 m!375589))

(assert (=> b!249126 m!375589))

(declare-fun m!375591 () Bool)

(assert (=> b!249126 m!375591))

(declare-fun m!375593 () Bool)

(assert (=> b!249124 m!375593))

(declare-fun m!375595 () Bool)

(assert (=> b!249124 m!375595))

(declare-fun m!375597 () Bool)

(assert (=> b!249130 m!375597))

(declare-fun m!375599 () Bool)

(assert (=> start!53658 m!375599))

(declare-fun m!375601 () Bool)

(assert (=> b!249129 m!375601))

(declare-fun m!375603 () Bool)

(assert (=> b!249125 m!375603))

(push 1)

(assert (not b!249127))

(assert (not b!249126))

(assert (not b!249130))

(assert (not b!249125))

(assert (not start!53658))

(assert (not b!249124))

(assert (not b!249129))

(assert (not b!249131))

(check-sat)

(pop 1)

(push 1)

(check-sat)

