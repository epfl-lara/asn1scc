; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52468 () Bool)

(assert start!52468)

(declare-fun b!241851 () Bool)

(declare-fun res!201918 () Bool)

(declare-fun e!167663 () Bool)

(assert (=> b!241851 (=> (not res!201918) (not e!167663))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13279 0))(
  ( (array!13280 (arr!6806 (Array (_ BitVec 32) (_ BitVec 8))) (size!5819 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10560 0))(
  ( (BitStream!10561 (buf!6285 array!13279) (currentByte!11648 (_ BitVec 32)) (currentBit!11643 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10560)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241851 (= res!201918 (validate_offset_bits!1 ((_ sign_extend 32) (size!5819 (buf!6285 thiss!1005))) ((_ sign_extend 32) (currentByte!11648 thiss!1005)) ((_ sign_extend 32) (currentBit!11643 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241852 () Bool)

(declare-fun e!167662 () Bool)

(declare-datatypes ((tuple2!20664 0))(
  ( (tuple2!20665 (_1!11254 BitStream!10560) (_2!11254 Bool)) )
))
(declare-fun lt!377297 () tuple2!20664)

(declare-fun lt!377298 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241852 (= e!167662 (= (bitIndex!0 (size!5819 (buf!6285 (_1!11254 lt!377297))) (currentByte!11648 (_1!11254 lt!377297)) (currentBit!11643 (_1!11254 lt!377297))) lt!377298))))

(declare-fun b!241853 () Bool)

(declare-fun res!201916 () Bool)

(declare-fun e!167655 () Bool)

(assert (=> b!241853 (=> (not res!201916) (not e!167655))))

(declare-datatypes ((Unit!17721 0))(
  ( (Unit!17722) )
))
(declare-datatypes ((tuple2!20666 0))(
  ( (tuple2!20667 (_1!11255 Unit!17721) (_2!11255 BitStream!10560)) )
))
(declare-fun lt!377296 () tuple2!20666)

(declare-fun isPrefixOf!0 (BitStream!10560 BitStream!10560) Bool)

(assert (=> b!241853 (= res!201916 (isPrefixOf!0 thiss!1005 (_2!11255 lt!377296)))))

(declare-fun b!241854 () Bool)

(declare-fun e!167659 () Bool)

(declare-fun lt!377295 () tuple2!20664)

(declare-datatypes ((tuple2!20668 0))(
  ( (tuple2!20669 (_1!11256 BitStream!10560) (_2!11256 BitStream!10560)) )
))
(declare-fun lt!377294 () tuple2!20668)

(assert (=> b!241854 (= e!167659 (not (or (not (_2!11254 lt!377295)) (not (= (_1!11254 lt!377295) (_2!11256 lt!377294))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10560 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20664)

(assert (=> b!241854 (= lt!377295 (checkBitsLoopPure!0 (_1!11256 lt!377294) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!377291 () tuple2!20666)

(declare-fun lt!377288 () (_ BitVec 64))

(assert (=> b!241854 (validate_offset_bits!1 ((_ sign_extend 32) (size!5819 (buf!6285 (_2!11255 lt!377291)))) ((_ sign_extend 32) (currentByte!11648 (_2!11255 lt!377296))) ((_ sign_extend 32) (currentBit!11643 (_2!11255 lt!377296))) lt!377288)))

(declare-fun lt!377293 () Unit!17721)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10560 array!13279 (_ BitVec 64)) Unit!17721)

(assert (=> b!241854 (= lt!377293 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11255 lt!377296) (buf!6285 (_2!11255 lt!377291)) lt!377288))))

(declare-fun reader!0 (BitStream!10560 BitStream!10560) tuple2!20668)

(assert (=> b!241854 (= lt!377294 (reader!0 (_2!11255 lt!377296) (_2!11255 lt!377291)))))

(declare-fun b!241855 () Bool)

(declare-fun e!167660 () Bool)

(declare-fun array_inv!5560 (array!13279) Bool)

(assert (=> b!241855 (= e!167660 (array_inv!5560 (buf!6285 thiss!1005)))))

(declare-fun b!241857 () Bool)

(assert (=> b!241857 (= e!167655 e!167662)))

(declare-fun res!201915 () Bool)

(assert (=> b!241857 (=> (not res!201915) (not e!167662))))

(assert (=> b!241857 (= res!201915 (and (= (_2!11254 lt!377297) bit!26) (= (_1!11254 lt!377297) (_2!11255 lt!377296))))))

(declare-fun readBitPure!0 (BitStream!10560) tuple2!20664)

(declare-fun readerFrom!0 (BitStream!10560 (_ BitVec 32) (_ BitVec 32)) BitStream!10560)

(assert (=> b!241857 (= lt!377297 (readBitPure!0 (readerFrom!0 (_2!11255 lt!377296) (currentBit!11643 thiss!1005) (currentByte!11648 thiss!1005))))))

(declare-fun b!241858 () Bool)

(declare-fun e!167657 () Bool)

(assert (=> b!241858 (= e!167657 true)))

(declare-fun lt!377290 () Bool)

(assert (=> b!241858 (= lt!377290 (isPrefixOf!0 (_2!11255 lt!377296) (_2!11255 lt!377291)))))

(declare-fun b!241859 () Bool)

(declare-fun res!201924 () Bool)

(assert (=> b!241859 (=> (not res!201924) (not e!167659))))

(assert (=> b!241859 (= res!201924 (isPrefixOf!0 (_2!11255 lt!377296) (_2!11255 lt!377291)))))

(declare-fun b!241860 () Bool)

(declare-fun e!167656 () Bool)

(assert (=> b!241860 (= e!167656 e!167659)))

(declare-fun res!201922 () Bool)

(assert (=> b!241860 (=> (not res!201922) (not e!167659))))

(assert (=> b!241860 (= res!201922 (= (bitIndex!0 (size!5819 (buf!6285 (_2!11255 lt!377291))) (currentByte!11648 (_2!11255 lt!377291)) (currentBit!11643 (_2!11255 lt!377291))) (bvadd (bitIndex!0 (size!5819 (buf!6285 (_2!11255 lt!377296))) (currentByte!11648 (_2!11255 lt!377296)) (currentBit!11643 (_2!11255 lt!377296))) lt!377288)))))

(assert (=> b!241860 (= lt!377288 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!201923 () Bool)

(assert (=> start!52468 (=> (not res!201923) (not e!167663))))

(assert (=> start!52468 (= res!201923 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52468 e!167663))

(assert (=> start!52468 true))

(declare-fun inv!12 (BitStream!10560) Bool)

(assert (=> start!52468 (and (inv!12 thiss!1005) e!167660)))

(declare-fun b!241856 () Bool)

(assert (=> b!241856 (= e!167663 (not e!167657))))

(declare-fun res!201921 () Bool)

(assert (=> b!241856 (=> res!201921 e!167657)))

(assert (=> b!241856 (= res!201921 (not (isPrefixOf!0 thiss!1005 (_2!11255 lt!377296))))))

(assert (=> b!241856 e!167656))

(declare-fun res!201917 () Bool)

(assert (=> b!241856 (=> (not res!201917) (not e!167656))))

(assert (=> b!241856 (= res!201917 (= (size!5819 (buf!6285 (_2!11255 lt!377296))) (size!5819 (buf!6285 (_2!11255 lt!377291)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10560 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20666)

(assert (=> b!241856 (= lt!377291 (appendNBitsLoop!0 (_2!11255 lt!377296) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241856 (validate_offset_bits!1 ((_ sign_extend 32) (size!5819 (buf!6285 (_2!11255 lt!377296)))) ((_ sign_extend 32) (currentByte!11648 (_2!11255 lt!377296))) ((_ sign_extend 32) (currentBit!11643 (_2!11255 lt!377296))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377289 () Unit!17721)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10560 BitStream!10560 (_ BitVec 64) (_ BitVec 64)) Unit!17721)

(assert (=> b!241856 (= lt!377289 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11255 lt!377296) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167661 () Bool)

(assert (=> b!241856 e!167661))

(declare-fun res!201914 () Bool)

(assert (=> b!241856 (=> (not res!201914) (not e!167661))))

(assert (=> b!241856 (= res!201914 (= (size!5819 (buf!6285 thiss!1005)) (size!5819 (buf!6285 (_2!11255 lt!377296)))))))

(declare-fun appendBit!0 (BitStream!10560 Bool) tuple2!20666)

(assert (=> b!241856 (= lt!377296 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241861 () Bool)

(declare-fun res!201920 () Bool)

(assert (=> b!241861 (=> (not res!201920) (not e!167663))))

(assert (=> b!241861 (= res!201920 (bvslt from!289 nBits!297))))

(declare-fun b!241862 () Bool)

(assert (=> b!241862 (= e!167661 e!167655)))

(declare-fun res!201919 () Bool)

(assert (=> b!241862 (=> (not res!201919) (not e!167655))))

(declare-fun lt!377292 () (_ BitVec 64))

(assert (=> b!241862 (= res!201919 (= lt!377298 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377292)))))

(assert (=> b!241862 (= lt!377298 (bitIndex!0 (size!5819 (buf!6285 (_2!11255 lt!377296))) (currentByte!11648 (_2!11255 lt!377296)) (currentBit!11643 (_2!11255 lt!377296))))))

(assert (=> b!241862 (= lt!377292 (bitIndex!0 (size!5819 (buf!6285 thiss!1005)) (currentByte!11648 thiss!1005) (currentBit!11643 thiss!1005)))))

(assert (= (and start!52468 res!201923) b!241851))

(assert (= (and b!241851 res!201918) b!241861))

(assert (= (and b!241861 res!201920) b!241856))

(assert (= (and b!241856 res!201914) b!241862))

(assert (= (and b!241862 res!201919) b!241853))

(assert (= (and b!241853 res!201916) b!241857))

(assert (= (and b!241857 res!201915) b!241852))

(assert (= (and b!241856 res!201917) b!241860))

(assert (= (and b!241860 res!201922) b!241859))

(assert (= (and b!241859 res!201924) b!241854))

(assert (= (and b!241856 (not res!201921)) b!241858))

(assert (= start!52468 b!241855))

(declare-fun m!364519 () Bool)

(assert (=> b!241852 m!364519))

(declare-fun m!364521 () Bool)

(assert (=> b!241858 m!364521))

(declare-fun m!364523 () Bool)

(assert (=> b!241856 m!364523))

(declare-fun m!364525 () Bool)

(assert (=> b!241856 m!364525))

(declare-fun m!364527 () Bool)

(assert (=> b!241856 m!364527))

(declare-fun m!364529 () Bool)

(assert (=> b!241856 m!364529))

(declare-fun m!364531 () Bool)

(assert (=> b!241856 m!364531))

(assert (=> b!241859 m!364521))

(declare-fun m!364533 () Bool)

(assert (=> b!241851 m!364533))

(declare-fun m!364535 () Bool)

(assert (=> b!241860 m!364535))

(declare-fun m!364537 () Bool)

(assert (=> b!241860 m!364537))

(declare-fun m!364539 () Bool)

(assert (=> start!52468 m!364539))

(declare-fun m!364541 () Bool)

(assert (=> b!241854 m!364541))

(declare-fun m!364543 () Bool)

(assert (=> b!241854 m!364543))

(declare-fun m!364545 () Bool)

(assert (=> b!241854 m!364545))

(declare-fun m!364547 () Bool)

(assert (=> b!241854 m!364547))

(assert (=> b!241862 m!364537))

(declare-fun m!364549 () Bool)

(assert (=> b!241862 m!364549))

(assert (=> b!241853 m!364531))

(declare-fun m!364551 () Bool)

(assert (=> b!241857 m!364551))

(assert (=> b!241857 m!364551))

(declare-fun m!364553 () Bool)

(assert (=> b!241857 m!364553))

(declare-fun m!364555 () Bool)

(assert (=> b!241855 m!364555))

(check-sat (not b!241853) (not b!241855) (not b!241858) (not b!241862) (not start!52468) (not b!241857) (not b!241852) (not b!241856) (not b!241851) (not b!241854) (not b!241859) (not b!241860))
