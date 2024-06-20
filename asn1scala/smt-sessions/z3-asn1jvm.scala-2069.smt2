; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52474 () Bool)

(assert start!52474)

(declare-fun b!241969 () Bool)

(declare-fun e!167741 () Bool)

(declare-datatypes ((array!13285 0))(
  ( (array!13286 (arr!6809 (Array (_ BitVec 32) (_ BitVec 8))) (size!5822 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10566 0))(
  ( (BitStream!10567 (buf!6288 array!13285) (currentByte!11651 (_ BitVec 32)) (currentBit!11646 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20682 0))(
  ( (tuple2!20683 (_1!11263 BitStream!10566) (_2!11263 Bool)) )
))
(declare-fun lt!377399 () tuple2!20682)

(declare-fun lt!377400 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241969 (= e!167741 (= (bitIndex!0 (size!5822 (buf!6288 (_1!11263 lt!377399))) (currentByte!11651 (_1!11263 lt!377399)) (currentBit!11646 (_1!11263 lt!377399))) lt!377400))))

(declare-fun b!241970 () Bool)

(declare-fun res!202025 () Bool)

(declare-fun e!167745 () Bool)

(assert (=> b!241970 (=> (not res!202025) (not e!167745))))

(declare-fun thiss!1005 () BitStream!10566)

(declare-datatypes ((Unit!17727 0))(
  ( (Unit!17728) )
))
(declare-datatypes ((tuple2!20684 0))(
  ( (tuple2!20685 (_1!11264 Unit!17727) (_2!11264 BitStream!10566)) )
))
(declare-fun lt!377403 () tuple2!20684)

(declare-fun isPrefixOf!0 (BitStream!10566 BitStream!10566) Bool)

(assert (=> b!241970 (= res!202025 (isPrefixOf!0 thiss!1005 (_2!11264 lt!377403)))))

(declare-fun b!241971 () Bool)

(declare-fun e!167747 () Bool)

(declare-fun array_inv!5563 (array!13285) Bool)

(assert (=> b!241971 (= e!167747 (array_inv!5563 (buf!6288 thiss!1005)))))

(declare-fun b!241972 () Bool)

(declare-fun res!202026 () Bool)

(declare-fun e!167748 () Bool)

(assert (=> b!241972 (=> (not res!202026) (not e!167748))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241972 (= res!202026 (validate_offset_bits!1 ((_ sign_extend 32) (size!5822 (buf!6288 thiss!1005))) ((_ sign_extend 32) (currentByte!11651 thiss!1005)) ((_ sign_extend 32) (currentBit!11646 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241973 () Bool)

(assert (=> b!241973 (= e!167745 e!167741)))

(declare-fun res!202032 () Bool)

(assert (=> b!241973 (=> (not res!202032) (not e!167741))))

(declare-fun bit!26 () Bool)

(assert (=> b!241973 (= res!202032 (and (= (_2!11263 lt!377399) bit!26) (= (_1!11263 lt!377399) (_2!11264 lt!377403))))))

(declare-fun readBitPure!0 (BitStream!10566) tuple2!20682)

(declare-fun readerFrom!0 (BitStream!10566 (_ BitVec 32) (_ BitVec 32)) BitStream!10566)

(assert (=> b!241973 (= lt!377399 (readBitPure!0 (readerFrom!0 (_2!11264 lt!377403) (currentBit!11646 thiss!1005) (currentByte!11651 thiss!1005))))))

(declare-fun b!241974 () Bool)

(declare-fun res!202034 () Bool)

(declare-fun e!167743 () Bool)

(assert (=> b!241974 (=> res!202034 e!167743)))

(declare-fun lt!377397 () tuple2!20684)

(declare-fun arrayBitRangesEq!0 (array!13285 array!13285 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241974 (= res!202034 (not (arrayBitRangesEq!0 (buf!6288 (_2!11264 lt!377403)) (buf!6288 (_2!11264 lt!377397)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5822 (buf!6288 (_2!11264 lt!377403))) (currentByte!11651 thiss!1005) (currentBit!11646 thiss!1005))))))))

(declare-fun b!241975 () Bool)

(assert (=> b!241975 (= e!167748 (not e!167743))))

(declare-fun res!202024 () Bool)

(assert (=> b!241975 (=> res!202024 e!167743)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241975 (= res!202024 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5822 (buf!6288 (_2!11264 lt!377403)))) ((_ sign_extend 32) (currentByte!11651 thiss!1005)) ((_ sign_extend 32) (currentBit!11646 thiss!1005)))))))

(declare-fun e!167750 () Bool)

(assert (=> b!241975 e!167750))

(declare-fun res!202029 () Bool)

(assert (=> b!241975 (=> (not res!202029) (not e!167750))))

(assert (=> b!241975 (= res!202029 (isPrefixOf!0 thiss!1005 (_2!11264 lt!377397)))))

(declare-fun lt!377404 () Unit!17727)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10566 BitStream!10566 BitStream!10566) Unit!17727)

(assert (=> b!241975 (= lt!377404 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11264 lt!377403) (_2!11264 lt!377397)))))

(declare-fun e!167742 () Bool)

(assert (=> b!241975 e!167742))

(declare-fun res!202028 () Bool)

(assert (=> b!241975 (=> (not res!202028) (not e!167742))))

(assert (=> b!241975 (= res!202028 (= (size!5822 (buf!6288 (_2!11264 lt!377403))) (size!5822 (buf!6288 (_2!11264 lt!377397)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10566 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20684)

(assert (=> b!241975 (= lt!377397 (appendNBitsLoop!0 (_2!11264 lt!377403) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241975 (validate_offset_bits!1 ((_ sign_extend 32) (size!5822 (buf!6288 (_2!11264 lt!377403)))) ((_ sign_extend 32) (currentByte!11651 (_2!11264 lt!377403))) ((_ sign_extend 32) (currentBit!11646 (_2!11264 lt!377403))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377398 () Unit!17727)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10566 BitStream!10566 (_ BitVec 64) (_ BitVec 64)) Unit!17727)

(assert (=> b!241975 (= lt!377398 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11264 lt!377403) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167746 () Bool)

(assert (=> b!241975 e!167746))

(declare-fun res!202023 () Bool)

(assert (=> b!241975 (=> (not res!202023) (not e!167746))))

(assert (=> b!241975 (= res!202023 (= (size!5822 (buf!6288 thiss!1005)) (size!5822 (buf!6288 (_2!11264 lt!377403)))))))

(declare-fun appendBit!0 (BitStream!10566 Bool) tuple2!20684)

(assert (=> b!241975 (= lt!377403 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241976 () Bool)

(declare-fun res!202030 () Bool)

(declare-fun e!167744 () Bool)

(assert (=> b!241976 (=> (not res!202030) (not e!167744))))

(assert (=> b!241976 (= res!202030 (isPrefixOf!0 (_2!11264 lt!377403) (_2!11264 lt!377397)))))

(declare-fun res!202033 () Bool)

(assert (=> start!52474 (=> (not res!202033) (not e!167748))))

(assert (=> start!52474 (= res!202033 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52474 e!167748))

(assert (=> start!52474 true))

(declare-fun inv!12 (BitStream!10566) Bool)

(assert (=> start!52474 (and (inv!12 thiss!1005) e!167747)))

(declare-fun b!241977 () Bool)

(assert (=> b!241977 (= e!167742 e!167744)))

(declare-fun res!202027 () Bool)

(assert (=> b!241977 (=> (not res!202027) (not e!167744))))

(declare-fun lt!377407 () (_ BitVec 64))

(assert (=> b!241977 (= res!202027 (= (bitIndex!0 (size!5822 (buf!6288 (_2!11264 lt!377397))) (currentByte!11651 (_2!11264 lt!377397)) (currentBit!11646 (_2!11264 lt!377397))) (bvadd (bitIndex!0 (size!5822 (buf!6288 (_2!11264 lt!377403))) (currentByte!11651 (_2!11264 lt!377403)) (currentBit!11646 (_2!11264 lt!377403))) lt!377407)))))

(assert (=> b!241977 (= lt!377407 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!241978 () Bool)

(assert (=> b!241978 (= e!167746 e!167745)))

(declare-fun res!202035 () Bool)

(assert (=> b!241978 (=> (not res!202035) (not e!167745))))

(declare-fun lt!377402 () (_ BitVec 64))

(assert (=> b!241978 (= res!202035 (= lt!377400 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377402)))))

(assert (=> b!241978 (= lt!377400 (bitIndex!0 (size!5822 (buf!6288 (_2!11264 lt!377403))) (currentByte!11651 (_2!11264 lt!377403)) (currentBit!11646 (_2!11264 lt!377403))))))

(assert (=> b!241978 (= lt!377402 (bitIndex!0 (size!5822 (buf!6288 thiss!1005)) (currentByte!11651 thiss!1005) (currentBit!11646 thiss!1005)))))

(declare-fun b!241979 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241979 (= e!167750 (invariant!0 (currentBit!11646 thiss!1005) (currentByte!11651 thiss!1005) (size!5822 (buf!6288 (_2!11264 lt!377403)))))))

(declare-fun b!241980 () Bool)

(declare-fun lt!377405 () tuple2!20682)

(declare-datatypes ((tuple2!20686 0))(
  ( (tuple2!20687 (_1!11265 BitStream!10566) (_2!11265 BitStream!10566)) )
))
(declare-fun lt!377408 () tuple2!20686)

(assert (=> b!241980 (= e!167744 (not (or (not (_2!11263 lt!377405)) (not (= (_1!11263 lt!377405) (_2!11265 lt!377408))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10566 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20682)

(assert (=> b!241980 (= lt!377405 (checkBitsLoopPure!0 (_1!11265 lt!377408) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241980 (validate_offset_bits!1 ((_ sign_extend 32) (size!5822 (buf!6288 (_2!11264 lt!377397)))) ((_ sign_extend 32) (currentByte!11651 (_2!11264 lt!377403))) ((_ sign_extend 32) (currentBit!11646 (_2!11264 lt!377403))) lt!377407)))

(declare-fun lt!377406 () Unit!17727)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10566 array!13285 (_ BitVec 64)) Unit!17727)

(assert (=> b!241980 (= lt!377406 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11264 lt!377403) (buf!6288 (_2!11264 lt!377397)) lt!377407))))

(declare-fun reader!0 (BitStream!10566 BitStream!10566) tuple2!20686)

(assert (=> b!241980 (= lt!377408 (reader!0 (_2!11264 lt!377403) (_2!11264 lt!377397)))))

(declare-fun b!241981 () Bool)

(declare-fun res!202031 () Bool)

(assert (=> b!241981 (=> (not res!202031) (not e!167748))))

(assert (=> b!241981 (= res!202031 (bvslt from!289 nBits!297))))

(declare-fun b!241982 () Bool)

(assert (=> b!241982 (= e!167743 true)))

(declare-fun lt!377409 () tuple2!20682)

(assert (=> b!241982 (= lt!377409 (readBitPure!0 (BitStream!10567 (buf!6288 (_2!11264 lt!377397)) (currentByte!11651 thiss!1005) (currentBit!11646 thiss!1005))))))

(declare-fun lt!377401 () tuple2!20682)

(assert (=> b!241982 (= lt!377401 (readBitPure!0 (BitStream!10567 (buf!6288 (_2!11264 lt!377403)) (currentByte!11651 thiss!1005) (currentBit!11646 thiss!1005))))))

(assert (=> b!241982 (invariant!0 (currentBit!11646 thiss!1005) (currentByte!11651 thiss!1005) (size!5822 (buf!6288 (_2!11264 lt!377397))))))

(assert (= (and start!52474 res!202033) b!241972))

(assert (= (and b!241972 res!202026) b!241981))

(assert (= (and b!241981 res!202031) b!241975))

(assert (= (and b!241975 res!202023) b!241978))

(assert (= (and b!241978 res!202035) b!241970))

(assert (= (and b!241970 res!202025) b!241973))

(assert (= (and b!241973 res!202032) b!241969))

(assert (= (and b!241975 res!202028) b!241977))

(assert (= (and b!241977 res!202027) b!241976))

(assert (= (and b!241976 res!202030) b!241980))

(assert (= (and b!241975 res!202029) b!241979))

(assert (= (and b!241975 (not res!202024)) b!241974))

(assert (= (and b!241974 (not res!202034)) b!241982))

(assert (= start!52474 b!241971))

(declare-fun m!364651 () Bool)

(assert (=> b!241976 m!364651))

(declare-fun m!364653 () Bool)

(assert (=> b!241969 m!364653))

(declare-fun m!364655 () Bool)

(assert (=> b!241980 m!364655))

(declare-fun m!364657 () Bool)

(assert (=> b!241980 m!364657))

(declare-fun m!364659 () Bool)

(assert (=> b!241980 m!364659))

(declare-fun m!364661 () Bool)

(assert (=> b!241980 m!364661))

(declare-fun m!364663 () Bool)

(assert (=> b!241979 m!364663))

(declare-fun m!364665 () Bool)

(assert (=> b!241971 m!364665))

(declare-fun m!364667 () Bool)

(assert (=> start!52474 m!364667))

(declare-fun m!364669 () Bool)

(assert (=> b!241977 m!364669))

(declare-fun m!364671 () Bool)

(assert (=> b!241977 m!364671))

(declare-fun m!364673 () Bool)

(assert (=> b!241975 m!364673))

(declare-fun m!364675 () Bool)

(assert (=> b!241975 m!364675))

(declare-fun m!364677 () Bool)

(assert (=> b!241975 m!364677))

(declare-fun m!364679 () Bool)

(assert (=> b!241975 m!364679))

(declare-fun m!364681 () Bool)

(assert (=> b!241975 m!364681))

(declare-fun m!364683 () Bool)

(assert (=> b!241975 m!364683))

(declare-fun m!364685 () Bool)

(assert (=> b!241975 m!364685))

(declare-fun m!364687 () Bool)

(assert (=> b!241970 m!364687))

(declare-fun m!364689 () Bool)

(assert (=> b!241982 m!364689))

(declare-fun m!364691 () Bool)

(assert (=> b!241982 m!364691))

(declare-fun m!364693 () Bool)

(assert (=> b!241982 m!364693))

(assert (=> b!241978 m!364671))

(declare-fun m!364695 () Bool)

(assert (=> b!241978 m!364695))

(declare-fun m!364697 () Bool)

(assert (=> b!241974 m!364697))

(declare-fun m!364699 () Bool)

(assert (=> b!241974 m!364699))

(declare-fun m!364701 () Bool)

(assert (=> b!241972 m!364701))

(declare-fun m!364703 () Bool)

(assert (=> b!241973 m!364703))

(assert (=> b!241973 m!364703))

(declare-fun m!364705 () Bool)

(assert (=> b!241973 m!364705))

(check-sat (not b!241979) (not b!241976) (not b!241977) (not b!241980) (not b!241978) (not b!241969) (not b!241982) (not b!241972) (not b!241975) (not b!241973) (not b!241971) (not b!241974) (not start!52474) (not b!241970))
