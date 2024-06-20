; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53674 () Bool)

(assert start!53674)

(declare-fun res!208653 () Bool)

(declare-fun e!172755 () Bool)

(assert (=> start!53674 (=> (not res!208653) (not e!172755))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53674 (= res!208653 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53674 e!172755))

(assert (=> start!53674 true))

(declare-datatypes ((array!13583 0))(
  ( (array!13584 (arr!6942 (Array (_ BitVec 32) (_ BitVec 8))) (size!5955 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10832 0))(
  ( (BitStream!10833 (buf!6448 array!13583) (currentByte!11879 (_ BitVec 32)) (currentBit!11874 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10832)

(declare-fun e!172757 () Bool)

(declare-fun inv!12 (BitStream!10832) Bool)

(assert (=> start!53674 (and (inv!12 thiss!1005) e!172757)))

(declare-fun b!249316 () Bool)

(declare-fun array_inv!5696 (array!13583) Bool)

(assert (=> b!249316 (= e!172757 (array_inv!5696 (buf!6448 thiss!1005)))))

(declare-fun b!249317 () Bool)

(declare-fun res!208654 () Bool)

(declare-fun e!172759 () Bool)

(assert (=> b!249317 (=> (not res!208654) (not e!172759))))

(declare-datatypes ((Unit!18046 0))(
  ( (Unit!18047) )
))
(declare-datatypes ((tuple2!21326 0))(
  ( (tuple2!21327 (_1!11588 Unit!18046) (_2!11588 BitStream!10832)) )
))
(declare-fun lt!388151 () tuple2!21326)

(declare-fun isPrefixOf!0 (BitStream!10832 BitStream!10832) Bool)

(assert (=> b!249317 (= res!208654 (isPrefixOf!0 thiss!1005 (_2!11588 lt!388151)))))

(declare-fun b!249318 () Bool)

(assert (=> b!249318 (= e!172755 (not true))))

(declare-fun e!172758 () Bool)

(assert (=> b!249318 e!172758))

(declare-fun res!208650 () Bool)

(assert (=> b!249318 (=> (not res!208650) (not e!172758))))

(assert (=> b!249318 (= res!208650 (= (size!5955 (buf!6448 thiss!1005)) (size!5955 (buf!6448 (_2!11588 lt!388151)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10832 Bool) tuple2!21326)

(assert (=> b!249318 (= lt!388151 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249319 () Bool)

(declare-fun e!172756 () Bool)

(declare-datatypes ((tuple2!21328 0))(
  ( (tuple2!21329 (_1!11589 BitStream!10832) (_2!11589 Bool)) )
))
(declare-fun lt!388150 () tuple2!21328)

(declare-fun lt!388149 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249319 (= e!172756 (= (bitIndex!0 (size!5955 (buf!6448 (_1!11589 lt!388150))) (currentByte!11879 (_1!11589 lt!388150)) (currentBit!11874 (_1!11589 lt!388150))) lt!388149))))

(declare-fun b!249320 () Bool)

(assert (=> b!249320 (= e!172758 e!172759)))

(declare-fun res!208655 () Bool)

(assert (=> b!249320 (=> (not res!208655) (not e!172759))))

(declare-fun lt!388152 () (_ BitVec 64))

(assert (=> b!249320 (= res!208655 (= lt!388149 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388152)))))

(assert (=> b!249320 (= lt!388149 (bitIndex!0 (size!5955 (buf!6448 (_2!11588 lt!388151))) (currentByte!11879 (_2!11588 lt!388151)) (currentBit!11874 (_2!11588 lt!388151))))))

(assert (=> b!249320 (= lt!388152 (bitIndex!0 (size!5955 (buf!6448 thiss!1005)) (currentByte!11879 thiss!1005) (currentBit!11874 thiss!1005)))))

(declare-fun b!249321 () Bool)

(declare-fun res!208656 () Bool)

(assert (=> b!249321 (=> (not res!208656) (not e!172755))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249321 (= res!208656 (validate_offset_bits!1 ((_ sign_extend 32) (size!5955 (buf!6448 thiss!1005))) ((_ sign_extend 32) (currentByte!11879 thiss!1005)) ((_ sign_extend 32) (currentBit!11874 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249322 () Bool)

(assert (=> b!249322 (= e!172759 e!172756)))

(declare-fun res!208651 () Bool)

(assert (=> b!249322 (=> (not res!208651) (not e!172756))))

(assert (=> b!249322 (= res!208651 (and (= (_2!11589 lt!388150) bit!26) (= (_1!11589 lt!388150) (_2!11588 lt!388151))))))

(declare-fun readBitPure!0 (BitStream!10832) tuple2!21328)

(declare-fun readerFrom!0 (BitStream!10832 (_ BitVec 32) (_ BitVec 32)) BitStream!10832)

(assert (=> b!249322 (= lt!388150 (readBitPure!0 (readerFrom!0 (_2!11588 lt!388151) (currentBit!11874 thiss!1005) (currentByte!11879 thiss!1005))))))

(declare-fun b!249323 () Bool)

(declare-fun res!208652 () Bool)

(assert (=> b!249323 (=> (not res!208652) (not e!172755))))

(assert (=> b!249323 (= res!208652 (bvslt from!289 nBits!297))))

(assert (= (and start!53674 res!208653) b!249321))

(assert (= (and b!249321 res!208656) b!249323))

(assert (= (and b!249323 res!208652) b!249318))

(assert (= (and b!249318 res!208650) b!249320))

(assert (= (and b!249320 res!208655) b!249317))

(assert (= (and b!249317 res!208654) b!249322))

(assert (= (and b!249322 res!208651) b!249319))

(assert (= start!53674 b!249316))

(declare-fun m!375745 () Bool)

(assert (=> start!53674 m!375745))

(declare-fun m!375747 () Bool)

(assert (=> b!249321 m!375747))

(declare-fun m!375749 () Bool)

(assert (=> b!249322 m!375749))

(assert (=> b!249322 m!375749))

(declare-fun m!375751 () Bool)

(assert (=> b!249322 m!375751))

(declare-fun m!375753 () Bool)

(assert (=> b!249318 m!375753))

(declare-fun m!375755 () Bool)

(assert (=> b!249319 m!375755))

(declare-fun m!375757 () Bool)

(assert (=> b!249316 m!375757))

(declare-fun m!375759 () Bool)

(assert (=> b!249317 m!375759))

(declare-fun m!375761 () Bool)

(assert (=> b!249320 m!375761))

(declare-fun m!375763 () Bool)

(assert (=> b!249320 m!375763))

(push 1)

(assert (not b!249322))

(assert (not b!249318))

(assert (not b!249320))

(assert (not start!53674))

(assert (not b!249316))

(assert (not b!249319))

(assert (not b!249321))

(assert (not b!249317))

(check-sat)

(pop 1)

(push 1)

(check-sat)

