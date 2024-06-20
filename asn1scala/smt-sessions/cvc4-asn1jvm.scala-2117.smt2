; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53692 () Bool)

(assert start!53692)

(declare-fun b!249532 () Bool)

(declare-fun e!172920 () Bool)

(declare-fun e!172917 () Bool)

(assert (=> b!249532 (= e!172920 e!172917)))

(declare-fun res!208844 () Bool)

(assert (=> b!249532 (=> (not res!208844) (not e!172917))))

(declare-fun lt!388267 () (_ BitVec 64))

(declare-fun lt!388265 () (_ BitVec 64))

(assert (=> b!249532 (= res!208844 (= lt!388267 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388265)))))

(declare-datatypes ((array!13601 0))(
  ( (array!13602 (arr!6951 (Array (_ BitVec 32) (_ BitVec 8))) (size!5964 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10850 0))(
  ( (BitStream!10851 (buf!6457 array!13601) (currentByte!11888 (_ BitVec 32)) (currentBit!11883 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18064 0))(
  ( (Unit!18065) )
))
(declare-datatypes ((tuple2!21362 0))(
  ( (tuple2!21363 (_1!11606 Unit!18064) (_2!11606 BitStream!10850)) )
))
(declare-fun lt!388268 () tuple2!21362)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249532 (= lt!388267 (bitIndex!0 (size!5964 (buf!6457 (_2!11606 lt!388268))) (currentByte!11888 (_2!11606 lt!388268)) (currentBit!11883 (_2!11606 lt!388268))))))

(declare-fun thiss!1005 () BitStream!10850)

(assert (=> b!249532 (= lt!388265 (bitIndex!0 (size!5964 (buf!6457 thiss!1005)) (currentByte!11888 thiss!1005) (currentBit!11883 thiss!1005)))))

(declare-fun b!249533 () Bool)

(declare-fun e!172918 () Bool)

(declare-datatypes ((tuple2!21364 0))(
  ( (tuple2!21365 (_1!11607 BitStream!10850) (_2!11607 Bool)) )
))
(declare-fun lt!388269 () tuple2!21364)

(assert (=> b!249533 (= e!172918 (= (bitIndex!0 (size!5964 (buf!6457 (_1!11607 lt!388269))) (currentByte!11888 (_1!11607 lt!388269)) (currentBit!11883 (_1!11607 lt!388269))) lt!388267))))

(declare-fun res!208841 () Bool)

(declare-fun e!172921 () Bool)

(assert (=> start!53692 (=> (not res!208841) (not e!172921))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53692 (= res!208841 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53692 e!172921))

(assert (=> start!53692 true))

(declare-fun e!172919 () Bool)

(declare-fun inv!12 (BitStream!10850) Bool)

(assert (=> start!53692 (and (inv!12 thiss!1005) e!172919)))

(declare-fun b!249534 () Bool)

(assert (=> b!249534 (= e!172917 e!172918)))

(declare-fun res!208842 () Bool)

(assert (=> b!249534 (=> (not res!208842) (not e!172918))))

(declare-fun bit!26 () Bool)

(assert (=> b!249534 (= res!208842 (and (= (_2!11607 lt!388269) bit!26) (= (_1!11607 lt!388269) (_2!11606 lt!388268))))))

(declare-fun readBitPure!0 (BitStream!10850) tuple2!21364)

(declare-fun readerFrom!0 (BitStream!10850 (_ BitVec 32) (_ BitVec 32)) BitStream!10850)

(assert (=> b!249534 (= lt!388269 (readBitPure!0 (readerFrom!0 (_2!11606 lt!388268) (currentBit!11883 thiss!1005) (currentByte!11888 thiss!1005))))))

(declare-fun b!249535 () Bool)

(declare-fun res!208839 () Bool)

(assert (=> b!249535 (=> (not res!208839) (not e!172921))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249535 (= res!208839 (validate_offset_bits!1 ((_ sign_extend 32) (size!5964 (buf!6457 thiss!1005))) ((_ sign_extend 32) (currentByte!11888 thiss!1005)) ((_ sign_extend 32) (currentBit!11883 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249536 () Bool)

(declare-fun res!208840 () Bool)

(assert (=> b!249536 (=> (not res!208840) (not e!172921))))

(assert (=> b!249536 (= res!208840 (bvslt from!289 nBits!297))))

(declare-fun b!249537 () Bool)

(assert (=> b!249537 (= e!172921 (not (or (not (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!249537 (validate_offset_bits!1 ((_ sign_extend 32) (size!5964 (buf!6457 (_2!11606 lt!388268)))) ((_ sign_extend 32) (currentByte!11888 (_2!11606 lt!388268))) ((_ sign_extend 32) (currentBit!11883 (_2!11606 lt!388268))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388266 () Unit!18064)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10850 BitStream!10850 (_ BitVec 64) (_ BitVec 64)) Unit!18064)

(assert (=> b!249537 (= lt!388266 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11606 lt!388268) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249537 e!172920))

(declare-fun res!208845 () Bool)

(assert (=> b!249537 (=> (not res!208845) (not e!172920))))

(assert (=> b!249537 (= res!208845 (= (size!5964 (buf!6457 thiss!1005)) (size!5964 (buf!6457 (_2!11606 lt!388268)))))))

(declare-fun appendBit!0 (BitStream!10850 Bool) tuple2!21362)

(assert (=> b!249537 (= lt!388268 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249538 () Bool)

(declare-fun res!208843 () Bool)

(assert (=> b!249538 (=> (not res!208843) (not e!172917))))

(declare-fun isPrefixOf!0 (BitStream!10850 BitStream!10850) Bool)

(assert (=> b!249538 (= res!208843 (isPrefixOf!0 thiss!1005 (_2!11606 lt!388268)))))

(declare-fun b!249539 () Bool)

(declare-fun array_inv!5705 (array!13601) Bool)

(assert (=> b!249539 (= e!172919 (array_inv!5705 (buf!6457 thiss!1005)))))

(assert (= (and start!53692 res!208841) b!249535))

(assert (= (and b!249535 res!208839) b!249536))

(assert (= (and b!249536 res!208840) b!249537))

(assert (= (and b!249537 res!208845) b!249532))

(assert (= (and b!249532 res!208844) b!249538))

(assert (= (and b!249538 res!208843) b!249534))

(assert (= (and b!249534 res!208842) b!249533))

(assert (= start!53692 b!249539))

(declare-fun m!375933 () Bool)

(assert (=> b!249532 m!375933))

(declare-fun m!375935 () Bool)

(assert (=> b!249532 m!375935))

(declare-fun m!375937 () Bool)

(assert (=> b!249533 m!375937))

(declare-fun m!375939 () Bool)

(assert (=> b!249534 m!375939))

(assert (=> b!249534 m!375939))

(declare-fun m!375941 () Bool)

(assert (=> b!249534 m!375941))

(declare-fun m!375943 () Bool)

(assert (=> b!249538 m!375943))

(declare-fun m!375945 () Bool)

(assert (=> start!53692 m!375945))

(declare-fun m!375947 () Bool)

(assert (=> b!249539 m!375947))

(declare-fun m!375949 () Bool)

(assert (=> b!249535 m!375949))

(declare-fun m!375951 () Bool)

(assert (=> b!249537 m!375951))

(declare-fun m!375953 () Bool)

(assert (=> b!249537 m!375953))

(declare-fun m!375955 () Bool)

(assert (=> b!249537 m!375955))

(push 1)

(assert (not b!249535))

(assert (not b!249532))

(assert (not b!249534))

(assert (not start!53692))

(assert (not b!249539))

(assert (not b!249537))

(assert (not b!249538))

(assert (not b!249533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

