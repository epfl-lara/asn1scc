; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53728 () Bool)

(assert start!53728)

(declare-fun b!250050 () Bool)

(declare-fun e!173314 () Bool)

(declare-fun e!173316 () Bool)

(assert (=> b!250050 (= e!173314 e!173316)))

(declare-fun res!209313 () Bool)

(assert (=> b!250050 (=> (not res!209313) (not e!173316))))

(declare-fun lt!388637 () (_ BitVec 64))

(declare-fun lt!388635 () (_ BitVec 64))

(assert (=> b!250050 (= res!209313 (= lt!388637 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388635)))))

(declare-datatypes ((array!13637 0))(
  ( (array!13638 (arr!6969 (Array (_ BitVec 32) (_ BitVec 8))) (size!5982 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10886 0))(
  ( (BitStream!10887 (buf!6475 array!13637) (currentByte!11906 (_ BitVec 32)) (currentBit!11901 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18100 0))(
  ( (Unit!18101) )
))
(declare-datatypes ((tuple2!21444 0))(
  ( (tuple2!21445 (_1!11647 Unit!18100) (_2!11647 BitStream!10886)) )
))
(declare-fun lt!388630 () tuple2!21444)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250050 (= lt!388637 (bitIndex!0 (size!5982 (buf!6475 (_2!11647 lt!388630))) (currentByte!11906 (_2!11647 lt!388630)) (currentBit!11901 (_2!11647 lt!388630))))))

(declare-fun thiss!1005 () BitStream!10886)

(assert (=> b!250050 (= lt!388635 (bitIndex!0 (size!5982 (buf!6475 thiss!1005)) (currentByte!11906 thiss!1005) (currentBit!11901 thiss!1005)))))

(declare-fun b!250051 () Bool)

(declare-fun e!173312 () Bool)

(declare-fun array_inv!5723 (array!13637) Bool)

(assert (=> b!250051 (= e!173312 (array_inv!5723 (buf!6475 thiss!1005)))))

(declare-fun b!250052 () Bool)

(declare-fun e!173310 () Bool)

(declare-datatypes ((tuple2!21446 0))(
  ( (tuple2!21447 (_1!11648 BitStream!10886) (_2!11648 Bool)) )
))
(declare-fun lt!388633 () tuple2!21446)

(declare-datatypes ((tuple2!21448 0))(
  ( (tuple2!21449 (_1!11649 BitStream!10886) (_2!11649 BitStream!10886)) )
))
(declare-fun lt!388634 () tuple2!21448)

(assert (=> b!250052 (= e!173310 (not (or (not (_2!11648 lt!388633)) (not (= (_1!11648 lt!388633) (_2!11649 lt!388634))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10886 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21446)

(assert (=> b!250052 (= lt!388633 (checkBitsLoopPure!0 (_1!11649 lt!388634) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!388638 () tuple2!21444)

(declare-fun lt!388632 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250052 (validate_offset_bits!1 ((_ sign_extend 32) (size!5982 (buf!6475 (_2!11647 lt!388638)))) ((_ sign_extend 32) (currentByte!11906 (_2!11647 lt!388630))) ((_ sign_extend 32) (currentBit!11901 (_2!11647 lt!388630))) lt!388632)))

(declare-fun lt!388629 () Unit!18100)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10886 array!13637 (_ BitVec 64)) Unit!18100)

(assert (=> b!250052 (= lt!388629 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11647 lt!388630) (buf!6475 (_2!11647 lt!388638)) lt!388632))))

(declare-fun reader!0 (BitStream!10886 BitStream!10886) tuple2!21448)

(assert (=> b!250052 (= lt!388634 (reader!0 (_2!11647 lt!388630) (_2!11647 lt!388638)))))

(declare-fun b!250053 () Bool)

(declare-fun e!173317 () Bool)

(assert (=> b!250053 (= e!173316 e!173317)))

(declare-fun res!209312 () Bool)

(assert (=> b!250053 (=> (not res!209312) (not e!173317))))

(declare-fun lt!388631 () tuple2!21446)

(assert (=> b!250053 (= res!209312 (and (= (_2!11648 lt!388631) bit!26) (= (_1!11648 lt!388631) (_2!11647 lt!388630))))))

(declare-fun readBitPure!0 (BitStream!10886) tuple2!21446)

(declare-fun readerFrom!0 (BitStream!10886 (_ BitVec 32) (_ BitVec 32)) BitStream!10886)

(assert (=> b!250053 (= lt!388631 (readBitPure!0 (readerFrom!0 (_2!11647 lt!388630) (currentBit!11901 thiss!1005) (currentByte!11906 thiss!1005))))))

(declare-fun b!250054 () Bool)

(declare-fun res!209304 () Bool)

(declare-fun e!173315 () Bool)

(assert (=> b!250054 (=> (not res!209304) (not e!173315))))

(assert (=> b!250054 (= res!209304 (validate_offset_bits!1 ((_ sign_extend 32) (size!5982 (buf!6475 thiss!1005))) ((_ sign_extend 32) (currentByte!11906 thiss!1005)) ((_ sign_extend 32) (currentBit!11901 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250055 () Bool)

(assert (=> b!250055 (= e!173317 (= (bitIndex!0 (size!5982 (buf!6475 (_1!11648 lt!388631))) (currentByte!11906 (_1!11648 lt!388631)) (currentBit!11901 (_1!11648 lt!388631))) lt!388637))))

(declare-fun b!250056 () Bool)

(declare-fun res!209305 () Bool)

(assert (=> b!250056 (=> (not res!209305) (not e!173315))))

(assert (=> b!250056 (= res!209305 (bvslt from!289 nBits!297))))

(declare-fun res!209306 () Bool)

(assert (=> start!53728 (=> (not res!209306) (not e!173315))))

(assert (=> start!53728 (= res!209306 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53728 e!173315))

(assert (=> start!53728 true))

(declare-fun inv!12 (BitStream!10886) Bool)

(assert (=> start!53728 (and (inv!12 thiss!1005) e!173312)))

(declare-fun b!250057 () Bool)

(declare-fun e!173313 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10886 BitStream!10886) Bool)

(assert (=> b!250057 (= e!173313 (isPrefixOf!0 (_2!11647 lt!388630) (_2!11647 lt!388638)))))

(declare-fun b!250058 () Bool)

(declare-fun res!209308 () Bool)

(assert (=> b!250058 (=> (not res!209308) (not e!173316))))

(assert (=> b!250058 (= res!209308 (isPrefixOf!0 thiss!1005 (_2!11647 lt!388630)))))

(declare-fun b!250059 () Bool)

(declare-fun e!173318 () Bool)

(assert (=> b!250059 (= e!173318 e!173310)))

(declare-fun res!209309 () Bool)

(assert (=> b!250059 (=> (not res!209309) (not e!173310))))

(assert (=> b!250059 (= res!209309 (= (bitIndex!0 (size!5982 (buf!6475 (_2!11647 lt!388638))) (currentByte!11906 (_2!11647 lt!388638)) (currentBit!11901 (_2!11647 lt!388638))) (bvadd (bitIndex!0 (size!5982 (buf!6475 (_2!11647 lt!388630))) (currentByte!11906 (_2!11647 lt!388630)) (currentBit!11901 (_2!11647 lt!388630))) lt!388632)))))

(assert (=> b!250059 (= lt!388632 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250060 () Bool)

(assert (=> b!250060 (= e!173315 (not e!173313))))

(declare-fun res!209311 () Bool)

(assert (=> b!250060 (=> res!209311 e!173313)))

(assert (=> b!250060 (= res!209311 (not (isPrefixOf!0 thiss!1005 (_2!11647 lt!388630))))))

(assert (=> b!250060 e!173318))

(declare-fun res!209303 () Bool)

(assert (=> b!250060 (=> (not res!209303) (not e!173318))))

(assert (=> b!250060 (= res!209303 (= (size!5982 (buf!6475 (_2!11647 lt!388630))) (size!5982 (buf!6475 (_2!11647 lt!388638)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10886 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21444)

(assert (=> b!250060 (= lt!388638 (appendNBitsLoop!0 (_2!11647 lt!388630) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250060 (validate_offset_bits!1 ((_ sign_extend 32) (size!5982 (buf!6475 (_2!11647 lt!388630)))) ((_ sign_extend 32) (currentByte!11906 (_2!11647 lt!388630))) ((_ sign_extend 32) (currentBit!11901 (_2!11647 lt!388630))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388636 () Unit!18100)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10886 BitStream!10886 (_ BitVec 64) (_ BitVec 64)) Unit!18100)

(assert (=> b!250060 (= lt!388636 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11647 lt!388630) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!250060 e!173314))

(declare-fun res!209310 () Bool)

(assert (=> b!250060 (=> (not res!209310) (not e!173314))))

(assert (=> b!250060 (= res!209310 (= (size!5982 (buf!6475 thiss!1005)) (size!5982 (buf!6475 (_2!11647 lt!388630)))))))

(declare-fun appendBit!0 (BitStream!10886 Bool) tuple2!21444)

(assert (=> b!250060 (= lt!388630 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250061 () Bool)

(declare-fun res!209307 () Bool)

(assert (=> b!250061 (=> (not res!209307) (not e!173310))))

(assert (=> b!250061 (= res!209307 (isPrefixOf!0 (_2!11647 lt!388630) (_2!11647 lt!388638)))))

(assert (= (and start!53728 res!209306) b!250054))

(assert (= (and b!250054 res!209304) b!250056))

(assert (= (and b!250056 res!209305) b!250060))

(assert (= (and b!250060 res!209310) b!250050))

(assert (= (and b!250050 res!209313) b!250058))

(assert (= (and b!250058 res!209308) b!250053))

(assert (= (and b!250053 res!209312) b!250055))

(assert (= (and b!250060 res!209303) b!250059))

(assert (= (and b!250059 res!209309) b!250061))

(assert (= (and b!250061 res!209307) b!250052))

(assert (= (and b!250060 (not res!209311)) b!250057))

(assert (= start!53728 b!250051))

(declare-fun m!376447 () Bool)

(assert (=> b!250061 m!376447))

(declare-fun m!376449 () Bool)

(assert (=> b!250053 m!376449))

(assert (=> b!250053 m!376449))

(declare-fun m!376451 () Bool)

(assert (=> b!250053 m!376451))

(declare-fun m!376453 () Bool)

(assert (=> b!250055 m!376453))

(declare-fun m!376455 () Bool)

(assert (=> b!250060 m!376455))

(declare-fun m!376457 () Bool)

(assert (=> b!250060 m!376457))

(declare-fun m!376459 () Bool)

(assert (=> b!250060 m!376459))

(declare-fun m!376461 () Bool)

(assert (=> b!250060 m!376461))

(declare-fun m!376463 () Bool)

(assert (=> b!250060 m!376463))

(declare-fun m!376465 () Bool)

(assert (=> b!250059 m!376465))

(declare-fun m!376467 () Bool)

(assert (=> b!250059 m!376467))

(assert (=> b!250050 m!376467))

(declare-fun m!376469 () Bool)

(assert (=> b!250050 m!376469))

(declare-fun m!376471 () Bool)

(assert (=> start!53728 m!376471))

(declare-fun m!376473 () Bool)

(assert (=> b!250052 m!376473))

(declare-fun m!376475 () Bool)

(assert (=> b!250052 m!376475))

(declare-fun m!376477 () Bool)

(assert (=> b!250052 m!376477))

(declare-fun m!376479 () Bool)

(assert (=> b!250052 m!376479))

(declare-fun m!376481 () Bool)

(assert (=> b!250054 m!376481))

(assert (=> b!250057 m!376447))

(declare-fun m!376483 () Bool)

(assert (=> b!250051 m!376483))

(assert (=> b!250058 m!376459))

(push 1)

(assert (not b!250055))

(assert (not b!250060))

(assert (not b!250061))

(assert (not b!250052))

(assert (not b!250059))

(assert (not b!250054))

(assert (not b!250050))

(assert (not b!250057))

(assert (not b!250051))

(assert (not b!250058))

(assert (not b!250053))

(assert (not start!53728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

