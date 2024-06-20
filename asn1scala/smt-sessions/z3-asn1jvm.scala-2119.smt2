; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53702 () Bool)

(assert start!53702)

(declare-fun b!249652 () Bool)

(declare-fun res!208948 () Bool)

(declare-fun e!173009 () Bool)

(assert (=> b!249652 (=> (not res!208948) (not e!173009))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249652 (= res!208948 (bvslt from!289 nBits!297))))

(declare-fun b!249653 () Bool)

(declare-fun res!208947 () Bool)

(declare-fun e!173008 () Bool)

(assert (=> b!249653 (=> (not res!208947) (not e!173008))))

(declare-datatypes ((array!13611 0))(
  ( (array!13612 (arr!6956 (Array (_ BitVec 32) (_ BitVec 8))) (size!5969 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10860 0))(
  ( (BitStream!10861 (buf!6462 array!13611) (currentByte!11893 (_ BitVec 32)) (currentBit!11888 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10860)

(declare-datatypes ((Unit!18074 0))(
  ( (Unit!18075) )
))
(declare-datatypes ((tuple2!21382 0))(
  ( (tuple2!21383 (_1!11616 Unit!18074) (_2!11616 BitStream!10860)) )
))
(declare-fun lt!388341 () tuple2!21382)

(declare-fun isPrefixOf!0 (BitStream!10860 BitStream!10860) Bool)

(assert (=> b!249653 (= res!208947 (isPrefixOf!0 thiss!1005 (_2!11616 lt!388341)))))

(declare-fun b!249654 () Bool)

(declare-fun res!208945 () Bool)

(assert (=> b!249654 (=> (not res!208945) (not e!173009))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249654 (= res!208945 (validate_offset_bits!1 ((_ sign_extend 32) (size!5969 (buf!6462 thiss!1005))) ((_ sign_extend 32) (currentByte!11893 thiss!1005)) ((_ sign_extend 32) (currentBit!11888 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249655 () Bool)

(declare-fun e!173012 () Bool)

(declare-fun array_inv!5710 (array!13611) Bool)

(assert (=> b!249655 (= e!173012 (array_inv!5710 (buf!6462 thiss!1005)))))

(declare-fun res!208949 () Bool)

(assert (=> start!53702 (=> (not res!208949) (not e!173009))))

(assert (=> start!53702 (= res!208949 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53702 e!173009))

(assert (=> start!53702 true))

(declare-fun inv!12 (BitStream!10860) Bool)

(assert (=> start!53702 (and (inv!12 thiss!1005) e!173012)))

(declare-fun b!249656 () Bool)

(declare-fun e!173010 () Bool)

(declare-datatypes ((tuple2!21384 0))(
  ( (tuple2!21385 (_1!11617 BitStream!10860) (_2!11617 Bool)) )
))
(declare-fun lt!388344 () tuple2!21384)

(declare-fun lt!388343 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249656 (= e!173010 (= (bitIndex!0 (size!5969 (buf!6462 (_1!11617 lt!388344))) (currentByte!11893 (_1!11617 lt!388344)) (currentBit!11888 (_1!11617 lt!388344))) lt!388343))))

(declare-fun b!249657 () Bool)

(assert (=> b!249657 (= e!173009 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(assert (=> b!249657 (validate_offset_bits!1 ((_ sign_extend 32) (size!5969 (buf!6462 (_2!11616 lt!388341)))) ((_ sign_extend 32) (currentByte!11893 (_2!11616 lt!388341))) ((_ sign_extend 32) (currentBit!11888 (_2!11616 lt!388341))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388342 () Unit!18074)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10860 BitStream!10860 (_ BitVec 64) (_ BitVec 64)) Unit!18074)

(assert (=> b!249657 (= lt!388342 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11616 lt!388341) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173007 () Bool)

(assert (=> b!249657 e!173007))

(declare-fun res!208944 () Bool)

(assert (=> b!249657 (=> (not res!208944) (not e!173007))))

(assert (=> b!249657 (= res!208944 (= (size!5969 (buf!6462 thiss!1005)) (size!5969 (buf!6462 (_2!11616 lt!388341)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10860 Bool) tuple2!21382)

(assert (=> b!249657 (= lt!388341 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249658 () Bool)

(assert (=> b!249658 (= e!173007 e!173008)))

(declare-fun res!208950 () Bool)

(assert (=> b!249658 (=> (not res!208950) (not e!173008))))

(declare-fun lt!388340 () (_ BitVec 64))

(assert (=> b!249658 (= res!208950 (= lt!388343 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388340)))))

(assert (=> b!249658 (= lt!388343 (bitIndex!0 (size!5969 (buf!6462 (_2!11616 lt!388341))) (currentByte!11893 (_2!11616 lt!388341)) (currentBit!11888 (_2!11616 lt!388341))))))

(assert (=> b!249658 (= lt!388340 (bitIndex!0 (size!5969 (buf!6462 thiss!1005)) (currentByte!11893 thiss!1005) (currentBit!11888 thiss!1005)))))

(declare-fun b!249659 () Bool)

(assert (=> b!249659 (= e!173008 e!173010)))

(declare-fun res!208946 () Bool)

(assert (=> b!249659 (=> (not res!208946) (not e!173010))))

(assert (=> b!249659 (= res!208946 (and (= (_2!11617 lt!388344) bit!26) (= (_1!11617 lt!388344) (_2!11616 lt!388341))))))

(declare-fun readBitPure!0 (BitStream!10860) tuple2!21384)

(declare-fun readerFrom!0 (BitStream!10860 (_ BitVec 32) (_ BitVec 32)) BitStream!10860)

(assert (=> b!249659 (= lt!388344 (readBitPure!0 (readerFrom!0 (_2!11616 lt!388341) (currentBit!11888 thiss!1005) (currentByte!11893 thiss!1005))))))

(assert (= (and start!53702 res!208949) b!249654))

(assert (= (and b!249654 res!208945) b!249652))

(assert (= (and b!249652 res!208948) b!249657))

(assert (= (and b!249657 res!208944) b!249658))

(assert (= (and b!249658 res!208950) b!249653))

(assert (= (and b!249653 res!208947) b!249659))

(assert (= (and b!249659 res!208946) b!249656))

(assert (= start!53702 b!249655))

(declare-fun m!376053 () Bool)

(assert (=> b!249654 m!376053))

(declare-fun m!376055 () Bool)

(assert (=> b!249653 m!376055))

(declare-fun m!376057 () Bool)

(assert (=> b!249655 m!376057))

(declare-fun m!376059 () Bool)

(assert (=> b!249659 m!376059))

(assert (=> b!249659 m!376059))

(declare-fun m!376061 () Bool)

(assert (=> b!249659 m!376061))

(declare-fun m!376063 () Bool)

(assert (=> b!249658 m!376063))

(declare-fun m!376065 () Bool)

(assert (=> b!249658 m!376065))

(declare-fun m!376067 () Bool)

(assert (=> start!53702 m!376067))

(declare-fun m!376069 () Bool)

(assert (=> b!249656 m!376069))

(declare-fun m!376071 () Bool)

(assert (=> b!249657 m!376071))

(declare-fun m!376073 () Bool)

(assert (=> b!249657 m!376073))

(declare-fun m!376075 () Bool)

(assert (=> b!249657 m!376075))

(check-sat (not b!249653) (not b!249659) (not b!249657) (not b!249658) (not b!249654) (not start!53702) (not b!249655) (not b!249656))
(check-sat)
