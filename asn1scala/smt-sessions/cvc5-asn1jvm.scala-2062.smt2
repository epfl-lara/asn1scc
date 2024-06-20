; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52430 () Bool)

(assert start!52430)

(declare-fun b!241339 () Bool)

(declare-fun e!167276 () Bool)

(declare-fun e!167271 () Bool)

(assert (=> b!241339 (= e!167276 e!167271)))

(declare-fun res!201464 () Bool)

(assert (=> b!241339 (=> (not res!201464) (not e!167271))))

(declare-datatypes ((array!13241 0))(
  ( (array!13242 (arr!6787 (Array (_ BitVec 32) (_ BitVec 8))) (size!5800 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10522 0))(
  ( (BitStream!10523 (buf!6266 array!13241) (currentByte!11629 (_ BitVec 32)) (currentBit!11624 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20580 0))(
  ( (tuple2!20581 (_1!11212 BitStream!10522) (_2!11212 Bool)) )
))
(declare-fun lt!376908 () tuple2!20580)

(declare-datatypes ((Unit!17683 0))(
  ( (Unit!17684) )
))
(declare-datatypes ((tuple2!20582 0))(
  ( (tuple2!20583 (_1!11213 Unit!17683) (_2!11213 BitStream!10522)) )
))
(declare-fun lt!376907 () tuple2!20582)

(declare-fun bit!26 () Bool)

(assert (=> b!241339 (= res!201464 (and (= (_2!11212 lt!376908) bit!26) (= (_1!11212 lt!376908) (_2!11213 lt!376907))))))

(declare-fun thiss!1005 () BitStream!10522)

(declare-fun readBitPure!0 (BitStream!10522) tuple2!20580)

(declare-fun readerFrom!0 (BitStream!10522 (_ BitVec 32) (_ BitVec 32)) BitStream!10522)

(assert (=> b!241339 (= lt!376908 (readBitPure!0 (readerFrom!0 (_2!11213 lt!376907) (currentBit!11624 thiss!1005) (currentByte!11629 thiss!1005))))))

(declare-fun b!241340 () Bool)

(declare-fun e!167272 () Bool)

(assert (=> b!241340 (= e!167272 e!167276)))

(declare-fun res!201463 () Bool)

(assert (=> b!241340 (=> (not res!201463) (not e!167276))))

(declare-fun lt!376904 () (_ BitVec 64))

(declare-fun lt!376903 () (_ BitVec 64))

(assert (=> b!241340 (= res!201463 (= lt!376904 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376903)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241340 (= lt!376904 (bitIndex!0 (size!5800 (buf!6266 (_2!11213 lt!376907))) (currentByte!11629 (_2!11213 lt!376907)) (currentBit!11624 (_2!11213 lt!376907))))))

(assert (=> b!241340 (= lt!376903 (bitIndex!0 (size!5800 (buf!6266 thiss!1005)) (currentByte!11629 thiss!1005) (currentBit!11624 thiss!1005)))))

(declare-fun b!241341 () Bool)

(assert (=> b!241341 (= e!167271 (= (bitIndex!0 (size!5800 (buf!6266 (_1!11212 lt!376908))) (currentByte!11629 (_1!11212 lt!376908)) (currentBit!11624 (_1!11212 lt!376908))) lt!376904))))

(declare-fun b!241343 () Bool)

(declare-fun res!201462 () Bool)

(assert (=> b!241343 (=> (not res!201462) (not e!167276))))

(declare-fun isPrefixOf!0 (BitStream!10522 BitStream!10522) Bool)

(assert (=> b!241343 (= res!201462 (isPrefixOf!0 thiss!1005 (_2!11213 lt!376907)))))

(declare-fun b!241344 () Bool)

(declare-fun e!167273 () Bool)

(assert (=> b!241344 (= e!167273 (not true))))

(declare-fun lt!376906 () (_ BitVec 64))

(assert (=> b!241344 (= lt!376906 (bitIndex!0 (size!5800 (buf!6266 (_2!11213 lt!376907))) (currentByte!11629 (_2!11213 lt!376907)) (currentBit!11624 (_2!11213 lt!376907))))))

(declare-fun lt!376905 () (_ BitVec 64))

(assert (=> b!241344 (= lt!376905 (bitIndex!0 (size!5800 (buf!6266 thiss!1005)) (currentByte!11629 thiss!1005) (currentBit!11624 thiss!1005)))))

(assert (=> b!241344 e!167272))

(declare-fun res!201459 () Bool)

(assert (=> b!241344 (=> (not res!201459) (not e!167272))))

(assert (=> b!241344 (= res!201459 (= (size!5800 (buf!6266 thiss!1005)) (size!5800 (buf!6266 (_2!11213 lt!376907)))))))

(declare-fun appendBit!0 (BitStream!10522 Bool) tuple2!20582)

(assert (=> b!241344 (= lt!376907 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241345 () Bool)

(declare-fun res!201461 () Bool)

(assert (=> b!241345 (=> (not res!201461) (not e!167273))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241345 (= res!201461 (validate_offset_bits!1 ((_ sign_extend 32) (size!5800 (buf!6266 thiss!1005))) ((_ sign_extend 32) (currentByte!11629 thiss!1005)) ((_ sign_extend 32) (currentBit!11624 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241346 () Bool)

(declare-fun res!201465 () Bool)

(assert (=> b!241346 (=> (not res!201465) (not e!167273))))

(assert (=> b!241346 (= res!201465 (bvslt from!289 nBits!297))))

(declare-fun res!201460 () Bool)

(assert (=> start!52430 (=> (not res!201460) (not e!167273))))

(assert (=> start!52430 (= res!201460 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52430 e!167273))

(assert (=> start!52430 true))

(declare-fun e!167274 () Bool)

(declare-fun inv!12 (BitStream!10522) Bool)

(assert (=> start!52430 (and (inv!12 thiss!1005) e!167274)))

(declare-fun b!241342 () Bool)

(declare-fun array_inv!5541 (array!13241) Bool)

(assert (=> b!241342 (= e!167274 (array_inv!5541 (buf!6266 thiss!1005)))))

(assert (= (and start!52430 res!201460) b!241345))

(assert (= (and b!241345 res!201461) b!241346))

(assert (= (and b!241346 res!201465) b!241344))

(assert (= (and b!241344 res!201459) b!241340))

(assert (= (and b!241340 res!201463) b!241343))

(assert (= (and b!241343 res!201462) b!241339))

(assert (= (and b!241339 res!201464) b!241341))

(assert (= start!52430 b!241342))

(declare-fun m!364031 () Bool)

(assert (=> b!241341 m!364031))

(declare-fun m!364033 () Bool)

(assert (=> b!241342 m!364033))

(declare-fun m!364035 () Bool)

(assert (=> b!241345 m!364035))

(declare-fun m!364037 () Bool)

(assert (=> b!241339 m!364037))

(assert (=> b!241339 m!364037))

(declare-fun m!364039 () Bool)

(assert (=> b!241339 m!364039))

(declare-fun m!364041 () Bool)

(assert (=> start!52430 m!364041))

(declare-fun m!364043 () Bool)

(assert (=> b!241343 m!364043))

(declare-fun m!364045 () Bool)

(assert (=> b!241344 m!364045))

(declare-fun m!364047 () Bool)

(assert (=> b!241344 m!364047))

(declare-fun m!364049 () Bool)

(assert (=> b!241344 m!364049))

(assert (=> b!241340 m!364045))

(assert (=> b!241340 m!364047))

(push 1)

(assert (not b!241343))

(assert (not b!241340))

(assert (not b!241345))

(assert (not start!52430))

(assert (not b!241339))

(assert (not b!241344))

(assert (not b!241342))

(assert (not b!241341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

