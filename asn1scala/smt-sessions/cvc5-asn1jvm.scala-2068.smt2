; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52466 () Bool)

(assert start!52466)

(declare-fun b!241815 () Bool)

(declare-fun e!167632 () Bool)

(declare-datatypes ((array!13277 0))(
  ( (array!13278 (arr!6805 (Array (_ BitVec 32) (_ BitVec 8))) (size!5818 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10558 0))(
  ( (BitStream!10559 (buf!6284 array!13277) (currentByte!11647 (_ BitVec 32)) (currentBit!11642 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20658 0))(
  ( (tuple2!20659 (_1!11251 BitStream!10558) (_2!11251 Bool)) )
))
(declare-fun lt!377259 () tuple2!20658)

(declare-datatypes ((tuple2!20660 0))(
  ( (tuple2!20661 (_1!11252 BitStream!10558) (_2!11252 BitStream!10558)) )
))
(declare-fun lt!377261 () tuple2!20660)

(assert (=> b!241815 (= e!167632 (not (or (not (_2!11251 lt!377259)) (not (= (_1!11251 lt!377259) (_2!11252 lt!377261))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10558 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20658)

(assert (=> b!241815 (= lt!377259 (checkBitsLoopPure!0 (_1!11252 lt!377261) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17719 0))(
  ( (Unit!17720) )
))
(declare-datatypes ((tuple2!20662 0))(
  ( (tuple2!20663 (_1!11253 Unit!17719) (_2!11253 BitStream!10558)) )
))
(declare-fun lt!377264 () tuple2!20662)

(declare-fun lt!377265 () tuple2!20662)

(declare-fun lt!377262 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241815 (validate_offset_bits!1 ((_ sign_extend 32) (size!5818 (buf!6284 (_2!11253 lt!377264)))) ((_ sign_extend 32) (currentByte!11647 (_2!11253 lt!377265))) ((_ sign_extend 32) (currentBit!11642 (_2!11253 lt!377265))) lt!377262)))

(declare-fun lt!377255 () Unit!17719)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10558 array!13277 (_ BitVec 64)) Unit!17719)

(assert (=> b!241815 (= lt!377255 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11253 lt!377265) (buf!6284 (_2!11253 lt!377264)) lt!377262))))

(declare-fun reader!0 (BitStream!10558 BitStream!10558) tuple2!20660)

(assert (=> b!241815 (= lt!377261 (reader!0 (_2!11253 lt!377265) (_2!11253 lt!377264)))))

(declare-fun b!241816 () Bool)

(declare-fun e!167628 () Bool)

(declare-fun e!167634 () Bool)

(assert (=> b!241816 (= e!167628 (not e!167634))))

(declare-fun res!201887 () Bool)

(assert (=> b!241816 (=> res!201887 e!167634)))

(declare-fun thiss!1005 () BitStream!10558)

(declare-fun isPrefixOf!0 (BitStream!10558 BitStream!10558) Bool)

(assert (=> b!241816 (= res!201887 (not (isPrefixOf!0 thiss!1005 (_2!11253 lt!377265))))))

(declare-fun e!167629 () Bool)

(assert (=> b!241816 e!167629))

(declare-fun res!201889 () Bool)

(assert (=> b!241816 (=> (not res!201889) (not e!167629))))

(assert (=> b!241816 (= res!201889 (= (size!5818 (buf!6284 (_2!11253 lt!377265))) (size!5818 (buf!6284 (_2!11253 lt!377264)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10558 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20662)

(assert (=> b!241816 (= lt!377264 (appendNBitsLoop!0 (_2!11253 lt!377265) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241816 (validate_offset_bits!1 ((_ sign_extend 32) (size!5818 (buf!6284 (_2!11253 lt!377265)))) ((_ sign_extend 32) (currentByte!11647 (_2!11253 lt!377265))) ((_ sign_extend 32) (currentBit!11642 (_2!11253 lt!377265))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377258 () Unit!17719)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10558 BitStream!10558 (_ BitVec 64) (_ BitVec 64)) Unit!17719)

(assert (=> b!241816 (= lt!377258 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11253 lt!377265) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167631 () Bool)

(assert (=> b!241816 e!167631))

(declare-fun res!201890 () Bool)

(assert (=> b!241816 (=> (not res!201890) (not e!167631))))

(assert (=> b!241816 (= res!201890 (= (size!5818 (buf!6284 thiss!1005)) (size!5818 (buf!6284 (_2!11253 lt!377265)))))))

(declare-fun appendBit!0 (BitStream!10558 Bool) tuple2!20662)

(assert (=> b!241816 (= lt!377265 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241817 () Bool)

(declare-fun res!201885 () Bool)

(assert (=> b!241817 (=> (not res!201885) (not e!167632))))

(assert (=> b!241817 (= res!201885 (isPrefixOf!0 (_2!11253 lt!377265) (_2!11253 lt!377264)))))

(declare-fun b!241818 () Bool)

(declare-fun e!167633 () Bool)

(assert (=> b!241818 (= e!167631 e!167633)))

(declare-fun res!201882 () Bool)

(assert (=> b!241818 (=> (not res!201882) (not e!167633))))

(declare-fun lt!377256 () (_ BitVec 64))

(declare-fun lt!377263 () (_ BitVec 64))

(assert (=> b!241818 (= res!201882 (= lt!377256 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377263)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241818 (= lt!377256 (bitIndex!0 (size!5818 (buf!6284 (_2!11253 lt!377265))) (currentByte!11647 (_2!11253 lt!377265)) (currentBit!11642 (_2!11253 lt!377265))))))

(assert (=> b!241818 (= lt!377263 (bitIndex!0 (size!5818 (buf!6284 thiss!1005)) (currentByte!11647 thiss!1005) (currentBit!11642 thiss!1005)))))

(declare-fun b!241819 () Bool)

(assert (=> b!241819 (= e!167629 e!167632)))

(declare-fun res!201883 () Bool)

(assert (=> b!241819 (=> (not res!201883) (not e!167632))))

(assert (=> b!241819 (= res!201883 (= (bitIndex!0 (size!5818 (buf!6284 (_2!11253 lt!377264))) (currentByte!11647 (_2!11253 lt!377264)) (currentBit!11642 (_2!11253 lt!377264))) (bvadd (bitIndex!0 (size!5818 (buf!6284 (_2!11253 lt!377265))) (currentByte!11647 (_2!11253 lt!377265)) (currentBit!11642 (_2!11253 lt!377265))) lt!377262)))))

(assert (=> b!241819 (= lt!377262 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!241820 () Bool)

(declare-fun res!201884 () Bool)

(assert (=> b!241820 (=> (not res!201884) (not e!167628))))

(assert (=> b!241820 (= res!201884 (validate_offset_bits!1 ((_ sign_extend 32) (size!5818 (buf!6284 thiss!1005))) ((_ sign_extend 32) (currentByte!11647 thiss!1005)) ((_ sign_extend 32) (currentBit!11642 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241821 () Bool)

(declare-fun res!201886 () Bool)

(assert (=> b!241821 (=> (not res!201886) (not e!167628))))

(assert (=> b!241821 (= res!201886 (bvslt from!289 nBits!297))))

(declare-fun b!241822 () Bool)

(declare-fun e!167630 () Bool)

(assert (=> b!241822 (= e!167633 e!167630)))

(declare-fun res!201891 () Bool)

(assert (=> b!241822 (=> (not res!201891) (not e!167630))))

(declare-fun lt!377257 () tuple2!20658)

(assert (=> b!241822 (= res!201891 (and (= (_2!11251 lt!377257) bit!26) (= (_1!11251 lt!377257) (_2!11253 lt!377265))))))

(declare-fun readBitPure!0 (BitStream!10558) tuple2!20658)

(declare-fun readerFrom!0 (BitStream!10558 (_ BitVec 32) (_ BitVec 32)) BitStream!10558)

(assert (=> b!241822 (= lt!377257 (readBitPure!0 (readerFrom!0 (_2!11253 lt!377265) (currentBit!11642 thiss!1005) (currentByte!11647 thiss!1005))))))

(declare-fun b!241823 () Bool)

(declare-fun res!201888 () Bool)

(assert (=> b!241823 (=> (not res!201888) (not e!167633))))

(assert (=> b!241823 (= res!201888 (isPrefixOf!0 thiss!1005 (_2!11253 lt!377265)))))

(declare-fun res!201881 () Bool)

(assert (=> start!52466 (=> (not res!201881) (not e!167628))))

(assert (=> start!52466 (= res!201881 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52466 e!167628))

(assert (=> start!52466 true))

(declare-fun e!167635 () Bool)

(declare-fun inv!12 (BitStream!10558) Bool)

(assert (=> start!52466 (and (inv!12 thiss!1005) e!167635)))

(declare-fun b!241824 () Bool)

(declare-fun array_inv!5559 (array!13277) Bool)

(assert (=> b!241824 (= e!167635 (array_inv!5559 (buf!6284 thiss!1005)))))

(declare-fun b!241825 () Bool)

(assert (=> b!241825 (= e!167630 (= (bitIndex!0 (size!5818 (buf!6284 (_1!11251 lt!377257))) (currentByte!11647 (_1!11251 lt!377257)) (currentBit!11642 (_1!11251 lt!377257))) lt!377256))))

(declare-fun b!241826 () Bool)

(assert (=> b!241826 (= e!167634 true)))

(declare-fun lt!377260 () Bool)

(assert (=> b!241826 (= lt!377260 (isPrefixOf!0 (_2!11253 lt!377265) (_2!11253 lt!377264)))))

(assert (= (and start!52466 res!201881) b!241820))

(assert (= (and b!241820 res!201884) b!241821))

(assert (= (and b!241821 res!201886) b!241816))

(assert (= (and b!241816 res!201890) b!241818))

(assert (= (and b!241818 res!201882) b!241823))

(assert (= (and b!241823 res!201888) b!241822))

(assert (= (and b!241822 res!201891) b!241825))

(assert (= (and b!241816 res!201889) b!241819))

(assert (= (and b!241819 res!201883) b!241817))

(assert (= (and b!241817 res!201885) b!241815))

(assert (= (and b!241816 (not res!201887)) b!241826))

(assert (= start!52466 b!241824))

(declare-fun m!364481 () Bool)

(assert (=> b!241825 m!364481))

(declare-fun m!364483 () Bool)

(assert (=> b!241818 m!364483))

(declare-fun m!364485 () Bool)

(assert (=> b!241818 m!364485))

(declare-fun m!364487 () Bool)

(assert (=> start!52466 m!364487))

(declare-fun m!364489 () Bool)

(assert (=> b!241817 m!364489))

(declare-fun m!364491 () Bool)

(assert (=> b!241819 m!364491))

(assert (=> b!241819 m!364483))

(declare-fun m!364493 () Bool)

(assert (=> b!241823 m!364493))

(declare-fun m!364495 () Bool)

(assert (=> b!241822 m!364495))

(assert (=> b!241822 m!364495))

(declare-fun m!364497 () Bool)

(assert (=> b!241822 m!364497))

(declare-fun m!364499 () Bool)

(assert (=> b!241820 m!364499))

(declare-fun m!364501 () Bool)

(assert (=> b!241824 m!364501))

(declare-fun m!364503 () Bool)

(assert (=> b!241816 m!364503))

(assert (=> b!241816 m!364493))

(declare-fun m!364505 () Bool)

(assert (=> b!241816 m!364505))

(declare-fun m!364507 () Bool)

(assert (=> b!241816 m!364507))

(declare-fun m!364509 () Bool)

(assert (=> b!241816 m!364509))

(assert (=> b!241826 m!364489))

(declare-fun m!364511 () Bool)

(assert (=> b!241815 m!364511))

(declare-fun m!364513 () Bool)

(assert (=> b!241815 m!364513))

(declare-fun m!364515 () Bool)

(assert (=> b!241815 m!364515))

(declare-fun m!364517 () Bool)

(assert (=> b!241815 m!364517))

(push 1)

(assert (not b!241818))

(assert (not b!241815))

(assert (not b!241822))

(assert (not b!241819))

(assert (not b!241816))

(assert (not b!241823))

(assert (not b!241820))

(assert (not b!241825))

(assert (not b!241824))

(assert (not b!241817))

(assert (not b!241826))

(assert (not start!52466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

