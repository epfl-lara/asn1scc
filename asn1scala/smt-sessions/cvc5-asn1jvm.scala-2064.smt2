; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52442 () Bool)

(assert start!52442)

(declare-fun b!241483 () Bool)

(declare-fun e!167384 () Bool)

(declare-datatypes ((array!13253 0))(
  ( (array!13254 (arr!6793 (Array (_ BitVec 32) (_ BitVec 8))) (size!5806 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10534 0))(
  ( (BitStream!10535 (buf!6272 array!13253) (currentByte!11635 (_ BitVec 32)) (currentBit!11630 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10534)

(declare-fun array_inv!5547 (array!13253) Bool)

(assert (=> b!241483 (= e!167384 (array_inv!5547 (buf!6272 thiss!1005)))))

(declare-fun b!241484 () Bool)

(declare-fun e!167382 () Bool)

(declare-fun e!167380 () Bool)

(assert (=> b!241484 (= e!167382 e!167380)))

(declare-fun res!201585 () Bool)

(assert (=> b!241484 (=> (not res!201585) (not e!167380))))

(declare-fun lt!377011 () (_ BitVec 64))

(declare-fun lt!377009 () (_ BitVec 64))

(assert (=> b!241484 (= res!201585 (= lt!377011 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377009)))))

(declare-datatypes ((Unit!17695 0))(
  ( (Unit!17696) )
))
(declare-datatypes ((tuple2!20604 0))(
  ( (tuple2!20605 (_1!11224 Unit!17695) (_2!11224 BitStream!10534)) )
))
(declare-fun lt!377010 () tuple2!20604)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241484 (= lt!377011 (bitIndex!0 (size!5806 (buf!6272 (_2!11224 lt!377010))) (currentByte!11635 (_2!11224 lt!377010)) (currentBit!11630 (_2!11224 lt!377010))))))

(assert (=> b!241484 (= lt!377009 (bitIndex!0 (size!5806 (buf!6272 thiss!1005)) (currentByte!11635 thiss!1005) (currentBit!11630 thiss!1005)))))

(declare-fun b!241485 () Bool)

(declare-fun res!201586 () Bool)

(assert (=> b!241485 (=> (not res!201586) (not e!167380))))

(declare-fun isPrefixOf!0 (BitStream!10534 BitStream!10534) Bool)

(assert (=> b!241485 (= res!201586 (isPrefixOf!0 thiss!1005 (_2!11224 lt!377010)))))

(declare-fun b!241486 () Bool)

(declare-fun e!167379 () Bool)

(assert (=> b!241486 (= e!167379 (not true))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241486 (validate_offset_bits!1 ((_ sign_extend 32) (size!5806 (buf!6272 (_2!11224 lt!377010)))) ((_ sign_extend 32) (currentByte!11635 (_2!11224 lt!377010))) ((_ sign_extend 32) (currentBit!11630 (_2!11224 lt!377010))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377012 () Unit!17695)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10534 BitStream!10534 (_ BitVec 64) (_ BitVec 64)) Unit!17695)

(assert (=> b!241486 (= lt!377012 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11224 lt!377010) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241486 e!167382))

(declare-fun res!201587 () Bool)

(assert (=> b!241486 (=> (not res!201587) (not e!167382))))

(assert (=> b!241486 (= res!201587 (= (size!5806 (buf!6272 thiss!1005)) (size!5806 (buf!6272 (_2!11224 lt!377010)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10534 Bool) tuple2!20604)

(assert (=> b!241486 (= lt!377010 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!201589 () Bool)

(assert (=> start!52442 (=> (not res!201589) (not e!167379))))

(assert (=> start!52442 (= res!201589 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52442 e!167379))

(assert (=> start!52442 true))

(declare-fun inv!12 (BitStream!10534) Bool)

(assert (=> start!52442 (and (inv!12 thiss!1005) e!167384)))

(declare-fun b!241487 () Bool)

(declare-fun e!167381 () Bool)

(declare-datatypes ((tuple2!20606 0))(
  ( (tuple2!20607 (_1!11225 BitStream!10534) (_2!11225 Bool)) )
))
(declare-fun lt!377013 () tuple2!20606)

(assert (=> b!241487 (= e!167381 (= (bitIndex!0 (size!5806 (buf!6272 (_1!11225 lt!377013))) (currentByte!11635 (_1!11225 lt!377013)) (currentBit!11630 (_1!11225 lt!377013))) lt!377011))))

(declare-fun b!241488 () Bool)

(declare-fun res!201588 () Bool)

(assert (=> b!241488 (=> (not res!201588) (not e!167379))))

(assert (=> b!241488 (= res!201588 (validate_offset_bits!1 ((_ sign_extend 32) (size!5806 (buf!6272 thiss!1005))) ((_ sign_extend 32) (currentByte!11635 thiss!1005)) ((_ sign_extend 32) (currentBit!11630 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241489 () Bool)

(declare-fun res!201591 () Bool)

(assert (=> b!241489 (=> (not res!201591) (not e!167379))))

(assert (=> b!241489 (= res!201591 (bvslt from!289 nBits!297))))

(declare-fun b!241490 () Bool)

(assert (=> b!241490 (= e!167380 e!167381)))

(declare-fun res!201590 () Bool)

(assert (=> b!241490 (=> (not res!201590) (not e!167381))))

(assert (=> b!241490 (= res!201590 (and (= (_2!11225 lt!377013) bit!26) (= (_1!11225 lt!377013) (_2!11224 lt!377010))))))

(declare-fun readBitPure!0 (BitStream!10534) tuple2!20606)

(declare-fun readerFrom!0 (BitStream!10534 (_ BitVec 32) (_ BitVec 32)) BitStream!10534)

(assert (=> b!241490 (= lt!377013 (readBitPure!0 (readerFrom!0 (_2!11224 lt!377010) (currentBit!11630 thiss!1005) (currentByte!11635 thiss!1005))))))

(assert (= (and start!52442 res!201589) b!241488))

(assert (= (and b!241488 res!201588) b!241489))

(assert (= (and b!241489 res!201591) b!241486))

(assert (= (and b!241486 res!201587) b!241484))

(assert (= (and b!241484 res!201585) b!241485))

(assert (= (and b!241485 res!201586) b!241490))

(assert (= (and b!241490 res!201590) b!241487))

(assert (= start!52442 b!241483))

(declare-fun m!364151 () Bool)

(assert (=> b!241483 m!364151))

(declare-fun m!364153 () Bool)

(assert (=> b!241487 m!364153))

(declare-fun m!364155 () Bool)

(assert (=> b!241486 m!364155))

(declare-fun m!364157 () Bool)

(assert (=> b!241486 m!364157))

(declare-fun m!364159 () Bool)

(assert (=> b!241486 m!364159))

(declare-fun m!364161 () Bool)

(assert (=> start!52442 m!364161))

(declare-fun m!364163 () Bool)

(assert (=> b!241484 m!364163))

(declare-fun m!364165 () Bool)

(assert (=> b!241484 m!364165))

(declare-fun m!364167 () Bool)

(assert (=> b!241488 m!364167))

(declare-fun m!364169 () Bool)

(assert (=> b!241485 m!364169))

(declare-fun m!364171 () Bool)

(assert (=> b!241490 m!364171))

(assert (=> b!241490 m!364171))

(declare-fun m!364173 () Bool)

(assert (=> b!241490 m!364173))

(push 1)

(assert (not b!241486))

(assert (not start!52442))

(assert (not b!241484))

(assert (not b!241485))

(assert (not b!241487))

(assert (not b!241490))

(assert (not b!241488))

(assert (not b!241483))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

