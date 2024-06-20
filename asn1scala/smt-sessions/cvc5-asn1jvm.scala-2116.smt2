; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53682 () Bool)

(assert start!53682)

(declare-fun b!249412 () Bool)

(declare-fun res!208739 () Bool)

(declare-fun e!172829 () Bool)

(assert (=> b!249412 (=> (not res!208739) (not e!172829))))

(declare-datatypes ((array!13591 0))(
  ( (array!13592 (arr!6946 (Array (_ BitVec 32) (_ BitVec 8))) (size!5959 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10840 0))(
  ( (BitStream!10841 (buf!6452 array!13591) (currentByte!11883 (_ BitVec 32)) (currentBit!11878 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10840)

(declare-datatypes ((Unit!18054 0))(
  ( (Unit!18055) )
))
(declare-datatypes ((tuple2!21342 0))(
  ( (tuple2!21343 (_1!11596 Unit!18054) (_2!11596 BitStream!10840)) )
))
(declare-fun lt!388198 () tuple2!21342)

(declare-fun isPrefixOf!0 (BitStream!10840 BitStream!10840) Bool)

(assert (=> b!249412 (= res!208739 (isPrefixOf!0 thiss!1005 (_2!11596 lt!388198)))))

(declare-fun b!249413 () Bool)

(declare-fun e!172828 () Bool)

(assert (=> b!249413 (= e!172829 e!172828)))

(declare-fun res!208736 () Bool)

(assert (=> b!249413 (=> (not res!208736) (not e!172828))))

(declare-datatypes ((tuple2!21344 0))(
  ( (tuple2!21345 (_1!11597 BitStream!10840) (_2!11597 Bool)) )
))
(declare-fun lt!388197 () tuple2!21344)

(declare-fun bit!26 () Bool)

(assert (=> b!249413 (= res!208736 (and (= (_2!11597 lt!388197) bit!26) (= (_1!11597 lt!388197) (_2!11596 lt!388198))))))

(declare-fun readBitPure!0 (BitStream!10840) tuple2!21344)

(declare-fun readerFrom!0 (BitStream!10840 (_ BitVec 32) (_ BitVec 32)) BitStream!10840)

(assert (=> b!249413 (= lt!388197 (readBitPure!0 (readerFrom!0 (_2!11596 lt!388198) (currentBit!11878 thiss!1005) (currentByte!11883 thiss!1005))))))

(declare-fun b!249414 () Bool)

(declare-fun res!208738 () Bool)

(declare-fun e!172832 () Bool)

(assert (=> b!249414 (=> (not res!208738) (not e!172832))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249414 (= res!208738 (validate_offset_bits!1 ((_ sign_extend 32) (size!5959 (buf!6452 thiss!1005))) ((_ sign_extend 32) (currentByte!11883 thiss!1005)) ((_ sign_extend 32) (currentBit!11878 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249415 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249415 (= e!172832 (not (bvsle (bitIndex!0 (size!5959 (buf!6452 (_2!11596 lt!388198))) (currentByte!11883 (_2!11596 lt!388198)) (currentBit!11878 (_2!11596 lt!388198))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5959 (buf!6452 thiss!1005)) (currentByte!11883 thiss!1005) (currentBit!11878 thiss!1005))))))))

(declare-fun e!172827 () Bool)

(assert (=> b!249415 e!172827))

(declare-fun res!208734 () Bool)

(assert (=> b!249415 (=> (not res!208734) (not e!172827))))

(assert (=> b!249415 (= res!208734 (= (size!5959 (buf!6452 thiss!1005)) (size!5959 (buf!6452 (_2!11596 lt!388198)))))))

(declare-fun appendBit!0 (BitStream!10840 Bool) tuple2!21342)

(assert (=> b!249415 (= lt!388198 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249416 () Bool)

(declare-fun res!208740 () Bool)

(assert (=> b!249416 (=> (not res!208740) (not e!172832))))

(assert (=> b!249416 (= res!208740 (bvslt from!289 nBits!297))))

(declare-fun res!208735 () Bool)

(assert (=> start!53682 (=> (not res!208735) (not e!172832))))

(assert (=> start!53682 (= res!208735 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53682 e!172832))

(assert (=> start!53682 true))

(declare-fun e!172830 () Bool)

(declare-fun inv!12 (BitStream!10840) Bool)

(assert (=> start!53682 (and (inv!12 thiss!1005) e!172830)))

(declare-fun b!249417 () Bool)

(declare-fun array_inv!5700 (array!13591) Bool)

(assert (=> b!249417 (= e!172830 (array_inv!5700 (buf!6452 thiss!1005)))))

(declare-fun b!249418 () Bool)

(declare-fun lt!388200 () (_ BitVec 64))

(assert (=> b!249418 (= e!172828 (= (bitIndex!0 (size!5959 (buf!6452 (_1!11597 lt!388197))) (currentByte!11883 (_1!11597 lt!388197)) (currentBit!11878 (_1!11597 lt!388197))) lt!388200))))

(declare-fun b!249419 () Bool)

(assert (=> b!249419 (= e!172827 e!172829)))

(declare-fun res!208737 () Bool)

(assert (=> b!249419 (=> (not res!208737) (not e!172829))))

(declare-fun lt!388199 () (_ BitVec 64))

(assert (=> b!249419 (= res!208737 (= lt!388200 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388199)))))

(assert (=> b!249419 (= lt!388200 (bitIndex!0 (size!5959 (buf!6452 (_2!11596 lt!388198))) (currentByte!11883 (_2!11596 lt!388198)) (currentBit!11878 (_2!11596 lt!388198))))))

(assert (=> b!249419 (= lt!388199 (bitIndex!0 (size!5959 (buf!6452 thiss!1005)) (currentByte!11883 thiss!1005) (currentBit!11878 thiss!1005)))))

(assert (= (and start!53682 res!208735) b!249414))

(assert (= (and b!249414 res!208738) b!249416))

(assert (= (and b!249416 res!208740) b!249415))

(assert (= (and b!249415 res!208734) b!249419))

(assert (= (and b!249419 res!208737) b!249412))

(assert (= (and b!249412 res!208739) b!249413))

(assert (= (and b!249413 res!208736) b!249418))

(assert (= start!53682 b!249417))

(declare-fun m!375825 () Bool)

(assert (=> b!249419 m!375825))

(declare-fun m!375827 () Bool)

(assert (=> b!249419 m!375827))

(declare-fun m!375829 () Bool)

(assert (=> b!249418 m!375829))

(declare-fun m!375831 () Bool)

(assert (=> b!249414 m!375831))

(declare-fun m!375833 () Bool)

(assert (=> b!249417 m!375833))

(assert (=> b!249415 m!375825))

(assert (=> b!249415 m!375827))

(declare-fun m!375835 () Bool)

(assert (=> b!249415 m!375835))

(declare-fun m!375837 () Bool)

(assert (=> b!249413 m!375837))

(assert (=> b!249413 m!375837))

(declare-fun m!375839 () Bool)

(assert (=> b!249413 m!375839))

(declare-fun m!375841 () Bool)

(assert (=> start!53682 m!375841))

(declare-fun m!375843 () Bool)

(assert (=> b!249412 m!375843))

(push 1)

(assert (not b!249417))

(assert (not b!249418))

(assert (not b!249414))

(assert (not b!249413))

(assert (not b!249415))

(assert (not start!53682))

(assert (not b!249419))

(assert (not b!249412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

