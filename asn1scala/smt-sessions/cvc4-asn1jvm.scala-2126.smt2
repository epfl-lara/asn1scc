; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53746 () Bool)

(assert start!53746)

(declare-fun b!250365 () Bool)

(declare-fun e!173549 () Bool)

(declare-fun e!173550 () Bool)

(assert (=> b!250365 (= e!173549 e!173550)))

(declare-fun res!209594 () Bool)

(assert (=> b!250365 (=> (not res!209594) (not e!173550))))

(declare-fun lt!388929 () (_ BitVec 64))

(declare-fun lt!388925 () (_ BitVec 64))

(assert (=> b!250365 (= res!209594 (= lt!388929 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388925)))))

(declare-datatypes ((array!13655 0))(
  ( (array!13656 (arr!6978 (Array (_ BitVec 32) (_ BitVec 8))) (size!5991 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10904 0))(
  ( (BitStream!10905 (buf!6484 array!13655) (currentByte!11915 (_ BitVec 32)) (currentBit!11910 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18118 0))(
  ( (Unit!18119) )
))
(declare-datatypes ((tuple2!21498 0))(
  ( (tuple2!21499 (_1!11674 Unit!18118) (_2!11674 BitStream!10904)) )
))
(declare-fun lt!388930 () tuple2!21498)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250365 (= lt!388929 (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930))))))

(declare-fun thiss!1005 () BitStream!10904)

(assert (=> b!250365 (= lt!388925 (bitIndex!0 (size!5991 (buf!6484 thiss!1005)) (currentByte!11915 thiss!1005) (currentBit!11910 thiss!1005)))))

(declare-fun b!250366 () Bool)

(declare-fun e!173552 () Bool)

(declare-datatypes ((tuple2!21500 0))(
  ( (tuple2!21501 (_1!11675 BitStream!10904) (_2!11675 Bool)) )
))
(declare-fun lt!388926 () tuple2!21500)

(declare-datatypes ((tuple2!21502 0))(
  ( (tuple2!21503 (_1!11676 BitStream!10904) (_2!11676 BitStream!10904)) )
))
(declare-fun lt!388927 () tuple2!21502)

(assert (=> b!250366 (= e!173552 (not (or (not (_2!11675 lt!388926)) (not (= (_1!11675 lt!388926) (_2!11676 lt!388927))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10904 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21500)

(assert (=> b!250366 (= lt!388926 (checkBitsLoopPure!0 (_1!11676 lt!388927) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!388934 () tuple2!21498)

(declare-fun lt!388932 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250366 (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388934)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930))) lt!388932)))

(declare-fun lt!388928 () Unit!18118)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10904 array!13655 (_ BitVec 64)) Unit!18118)

(assert (=> b!250366 (= lt!388928 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11674 lt!388930) (buf!6484 (_2!11674 lt!388934)) lt!388932))))

(declare-fun reader!0 (BitStream!10904 BitStream!10904) tuple2!21502)

(assert (=> b!250366 (= lt!388927 (reader!0 (_2!11674 lt!388930) (_2!11674 lt!388934)))))

(declare-fun b!250367 () Bool)

(declare-fun res!209595 () Bool)

(assert (=> b!250367 (=> (not res!209595) (not e!173552))))

(declare-fun isPrefixOf!0 (BitStream!10904 BitStream!10904) Bool)

(assert (=> b!250367 (= res!209595 (isPrefixOf!0 (_2!11674 lt!388930) (_2!11674 lt!388934)))))

(declare-fun b!250368 () Bool)

(declare-fun res!209596 () Bool)

(assert (=> b!250368 (=> (not res!209596) (not e!173550))))

(assert (=> b!250368 (= res!209596 (isPrefixOf!0 thiss!1005 (_2!11674 lt!388930)))))

(declare-fun b!250370 () Bool)

(declare-fun res!209598 () Bool)

(declare-fun e!173545 () Bool)

(assert (=> b!250370 (=> (not res!209598) (not e!173545))))

(assert (=> b!250370 (= res!209598 (bvslt from!289 nBits!297))))

(declare-fun b!250371 () Bool)

(declare-fun e!173548 () Bool)

(declare-fun array_inv!5732 (array!13655) Bool)

(assert (=> b!250371 (= e!173548 (array_inv!5732 (buf!6484 thiss!1005)))))

(declare-fun b!250372 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250372 (= e!173545 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 thiss!1005)) ((_ sign_extend 32) (currentBit!11910 thiss!1005)))))))

(declare-fun e!173551 () Bool)

(assert (=> b!250372 e!173551))

(declare-fun res!209591 () Bool)

(assert (=> b!250372 (=> (not res!209591) (not e!173551))))

(assert (=> b!250372 (= res!209591 (isPrefixOf!0 thiss!1005 (_2!11674 lt!388934)))))

(declare-fun lt!388931 () Unit!18118)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10904 BitStream!10904 BitStream!10904) Unit!18118)

(assert (=> b!250372 (= lt!388931 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11674 lt!388930) (_2!11674 lt!388934)))))

(declare-fun e!173546 () Bool)

(assert (=> b!250372 e!173546))

(declare-fun res!209593 () Bool)

(assert (=> b!250372 (=> (not res!209593) (not e!173546))))

(assert (=> b!250372 (= res!209593 (= (size!5991 (buf!6484 (_2!11674 lt!388930))) (size!5991 (buf!6484 (_2!11674 lt!388934)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10904 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21498)

(assert (=> b!250372 (= lt!388934 (appendNBitsLoop!0 (_2!11674 lt!388930) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250372 (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388933 () Unit!18118)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10904 BitStream!10904 (_ BitVec 64) (_ BitVec 64)) Unit!18118)

(assert (=> b!250372 (= lt!388933 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11674 lt!388930) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!250372 e!173549))

(declare-fun res!209592 () Bool)

(assert (=> b!250372 (=> (not res!209592) (not e!173549))))

(assert (=> b!250372 (= res!209592 (= (size!5991 (buf!6484 thiss!1005)) (size!5991 (buf!6484 (_2!11674 lt!388930)))))))

(declare-fun appendBit!0 (BitStream!10904 Bool) tuple2!21498)

(assert (=> b!250372 (= lt!388930 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250373 () Bool)

(declare-fun res!209597 () Bool)

(assert (=> b!250373 (=> (not res!209597) (not e!173545))))

(assert (=> b!250373 (= res!209597 (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 thiss!1005))) ((_ sign_extend 32) (currentByte!11915 thiss!1005)) ((_ sign_extend 32) (currentBit!11910 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250374 () Bool)

(assert (=> b!250374 (= e!173546 e!173552)))

(declare-fun res!209601 () Bool)

(assert (=> b!250374 (=> (not res!209601) (not e!173552))))

(assert (=> b!250374 (= res!209601 (= (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388934))) (currentByte!11915 (_2!11674 lt!388934)) (currentBit!11910 (_2!11674 lt!388934))) (bvadd (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930))) lt!388932)))))

(assert (=> b!250374 (= lt!388932 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250375 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250375 (= e!173551 (invariant!0 (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005) (size!5991 (buf!6484 (_2!11674 lt!388930)))))))

(declare-fun b!250376 () Bool)

(declare-fun e!173544 () Bool)

(assert (=> b!250376 (= e!173550 e!173544)))

(declare-fun res!209600 () Bool)

(assert (=> b!250376 (=> (not res!209600) (not e!173544))))

(declare-fun lt!388935 () tuple2!21500)

(assert (=> b!250376 (= res!209600 (and (= (_2!11675 lt!388935) bit!26) (= (_1!11675 lt!388935) (_2!11674 lt!388930))))))

(declare-fun readBitPure!0 (BitStream!10904) tuple2!21500)

(declare-fun readerFrom!0 (BitStream!10904 (_ BitVec 32) (_ BitVec 32)) BitStream!10904)

(assert (=> b!250376 (= lt!388935 (readBitPure!0 (readerFrom!0 (_2!11674 lt!388930) (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005))))))

(declare-fun b!250369 () Bool)

(assert (=> b!250369 (= e!173544 (= (bitIndex!0 (size!5991 (buf!6484 (_1!11675 lt!388935))) (currentByte!11915 (_1!11675 lt!388935)) (currentBit!11910 (_1!11675 lt!388935))) lt!388929))))

(declare-fun res!209599 () Bool)

(assert (=> start!53746 (=> (not res!209599) (not e!173545))))

(assert (=> start!53746 (= res!209599 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53746 e!173545))

(assert (=> start!53746 true))

(declare-fun inv!12 (BitStream!10904) Bool)

(assert (=> start!53746 (and (inv!12 thiss!1005) e!173548)))

(assert (= (and start!53746 res!209599) b!250373))

(assert (= (and b!250373 res!209597) b!250370))

(assert (= (and b!250370 res!209598) b!250372))

(assert (= (and b!250372 res!209592) b!250365))

(assert (= (and b!250365 res!209594) b!250368))

(assert (= (and b!250368 res!209596) b!250376))

(assert (= (and b!250376 res!209600) b!250369))

(assert (= (and b!250372 res!209593) b!250374))

(assert (= (and b!250374 res!209601) b!250367))

(assert (= (and b!250367 res!209595) b!250366))

(assert (= (and b!250372 res!209591) b!250375))

(assert (= start!53746 b!250371))

(declare-fun m!376835 () Bool)

(assert (=> b!250367 m!376835))

(declare-fun m!376837 () Bool)

(assert (=> b!250372 m!376837))

(declare-fun m!376839 () Bool)

(assert (=> b!250372 m!376839))

(declare-fun m!376841 () Bool)

(assert (=> b!250372 m!376841))

(declare-fun m!376843 () Bool)

(assert (=> b!250372 m!376843))

(declare-fun m!376845 () Bool)

(assert (=> b!250372 m!376845))

(declare-fun m!376847 () Bool)

(assert (=> b!250372 m!376847))

(declare-fun m!376849 () Bool)

(assert (=> b!250372 m!376849))

(declare-fun m!376851 () Bool)

(assert (=> b!250365 m!376851))

(declare-fun m!376853 () Bool)

(assert (=> b!250365 m!376853))

(declare-fun m!376855 () Bool)

(assert (=> b!250368 m!376855))

(declare-fun m!376857 () Bool)

(assert (=> b!250373 m!376857))

(declare-fun m!376859 () Bool)

(assert (=> b!250374 m!376859))

(assert (=> b!250374 m!376851))

(declare-fun m!376861 () Bool)

(assert (=> b!250366 m!376861))

(declare-fun m!376863 () Bool)

(assert (=> b!250366 m!376863))

(declare-fun m!376865 () Bool)

(assert (=> b!250366 m!376865))

(declare-fun m!376867 () Bool)

(assert (=> b!250366 m!376867))

(declare-fun m!376869 () Bool)

(assert (=> b!250376 m!376869))

(assert (=> b!250376 m!376869))

(declare-fun m!376871 () Bool)

(assert (=> b!250376 m!376871))

(declare-fun m!376873 () Bool)

(assert (=> start!53746 m!376873))

(declare-fun m!376875 () Bool)

(assert (=> b!250371 m!376875))

(declare-fun m!376877 () Bool)

(assert (=> b!250369 m!376877))

(declare-fun m!376879 () Bool)

(assert (=> b!250375 m!376879))

(push 1)

(assert (not b!250365))

(assert (not b!250368))

(assert (not start!53746))

(assert (not b!250366))

(assert (not b!250376))

(assert (not b!250372))

(assert (not b!250371))

(assert (not b!250367))

(assert (not b!250373))

(assert (not b!250375))

(assert (not b!250374))

(assert (not b!250369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83818 () Bool)

(declare-fun e!173608 () Bool)

(assert (=> d!83818 e!173608))

(declare-fun res!209695 () Bool)

(assert (=> d!83818 (=> (not res!209695) (not e!173608))))

(declare-fun lt!389112 () (_ BitVec 64))

(declare-fun lt!389110 () (_ BitVec 64))

(declare-fun lt!389114 () (_ BitVec 64))

(assert (=> d!83818 (= res!209695 (= lt!389112 (bvsub lt!389110 lt!389114)))))

(assert (=> d!83818 (or (= (bvand lt!389110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389114 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389110 lt!389114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83818 (= lt!389114 (remainingBits!0 ((_ sign_extend 32) (size!5991 (buf!6484 (_1!11675 lt!388935)))) ((_ sign_extend 32) (currentByte!11915 (_1!11675 lt!388935))) ((_ sign_extend 32) (currentBit!11910 (_1!11675 lt!388935)))))))

(declare-fun lt!389111 () (_ BitVec 64))

(declare-fun lt!389115 () (_ BitVec 64))

(assert (=> d!83818 (= lt!389110 (bvmul lt!389111 lt!389115))))

(assert (=> d!83818 (or (= lt!389111 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389115 (bvsdiv (bvmul lt!389111 lt!389115) lt!389111)))))

(assert (=> d!83818 (= lt!389115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83818 (= lt!389111 ((_ sign_extend 32) (size!5991 (buf!6484 (_1!11675 lt!388935)))))))

(assert (=> d!83818 (= lt!389112 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11915 (_1!11675 lt!388935))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11910 (_1!11675 lt!388935)))))))

(assert (=> d!83818 (invariant!0 (currentBit!11910 (_1!11675 lt!388935)) (currentByte!11915 (_1!11675 lt!388935)) (size!5991 (buf!6484 (_1!11675 lt!388935))))))

(assert (=> d!83818 (= (bitIndex!0 (size!5991 (buf!6484 (_1!11675 lt!388935))) (currentByte!11915 (_1!11675 lt!388935)) (currentBit!11910 (_1!11675 lt!388935))) lt!389112)))

(declare-fun b!250475 () Bool)

(declare-fun res!209694 () Bool)

(assert (=> b!250475 (=> (not res!209694) (not e!173608))))

(assert (=> b!250475 (= res!209694 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389112))))

(declare-fun b!250476 () Bool)

(declare-fun lt!389113 () (_ BitVec 64))

(assert (=> b!250476 (= e!173608 (bvsle lt!389112 (bvmul lt!389113 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250476 (or (= lt!389113 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389113 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389113)))))

(assert (=> b!250476 (= lt!389113 ((_ sign_extend 32) (size!5991 (buf!6484 (_1!11675 lt!388935)))))))

(assert (= (and d!83818 res!209695) b!250475))

(assert (= (and b!250475 res!209694) b!250476))

(declare-fun m!376985 () Bool)

(assert (=> d!83818 m!376985))

(declare-fun m!376987 () Bool)

(assert (=> d!83818 m!376987))

(assert (=> b!250369 d!83818))

(declare-fun d!83824 () Bool)

(declare-fun res!209711 () Bool)

(declare-fun e!173618 () Bool)

(assert (=> d!83824 (=> (not res!209711) (not e!173618))))

(assert (=> d!83824 (= res!209711 (= (size!5991 (buf!6484 thiss!1005)) (size!5991 (buf!6484 (_2!11674 lt!388930)))))))

(assert (=> d!83824 (= (isPrefixOf!0 thiss!1005 (_2!11674 lt!388930)) e!173618)))

(declare-fun b!250492 () Bool)

(declare-fun res!209712 () Bool)

(assert (=> b!250492 (=> (not res!209712) (not e!173618))))

(assert (=> b!250492 (= res!209712 (bvsle (bitIndex!0 (size!5991 (buf!6484 thiss!1005)) (currentByte!11915 thiss!1005) (currentBit!11910 thiss!1005)) (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930)))))))

(declare-fun b!250493 () Bool)

(declare-fun e!173619 () Bool)

(assert (=> b!250493 (= e!173618 e!173619)))

(declare-fun res!209713 () Bool)

(assert (=> b!250493 (=> res!209713 e!173619)))

(assert (=> b!250493 (= res!209713 (= (size!5991 (buf!6484 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250494 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13655 array!13655 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250494 (= e!173619 (arrayBitRangesEq!0 (buf!6484 thiss!1005) (buf!6484 (_2!11674 lt!388930)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5991 (buf!6484 thiss!1005)) (currentByte!11915 thiss!1005) (currentBit!11910 thiss!1005))))))

(assert (= (and d!83824 res!209711) b!250492))

(assert (= (and b!250492 res!209712) b!250493))

(assert (= (and b!250493 (not res!209713)) b!250494))

(assert (=> b!250492 m!376853))

(assert (=> b!250492 m!376851))

(assert (=> b!250494 m!376853))

(assert (=> b!250494 m!376853))

(declare-fun m!376991 () Bool)

(assert (=> b!250494 m!376991))

(assert (=> b!250368 d!83824))

(declare-fun d!83828 () Bool)

(declare-fun res!209716 () Bool)

(declare-fun e!173622 () Bool)

(assert (=> d!83828 (=> (not res!209716) (not e!173622))))

(assert (=> d!83828 (= res!209716 (= (size!5991 (buf!6484 (_2!11674 lt!388930))) (size!5991 (buf!6484 (_2!11674 lt!388934)))))))

(assert (=> d!83828 (= (isPrefixOf!0 (_2!11674 lt!388930) (_2!11674 lt!388934)) e!173622)))

(declare-fun b!250497 () Bool)

(declare-fun res!209717 () Bool)

(assert (=> b!250497 (=> (not res!209717) (not e!173622))))

(assert (=> b!250497 (= res!209717 (bvsle (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930))) (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388934))) (currentByte!11915 (_2!11674 lt!388934)) (currentBit!11910 (_2!11674 lt!388934)))))))

(declare-fun b!250498 () Bool)

(declare-fun e!173623 () Bool)

(assert (=> b!250498 (= e!173622 e!173623)))

(declare-fun res!209718 () Bool)

(assert (=> b!250498 (=> res!209718 e!173623)))

(assert (=> b!250498 (= res!209718 (= (size!5991 (buf!6484 (_2!11674 lt!388930))) #b00000000000000000000000000000000))))

(declare-fun b!250499 () Bool)

(assert (=> b!250499 (= e!173623 (arrayBitRangesEq!0 (buf!6484 (_2!11674 lt!388930)) (buf!6484 (_2!11674 lt!388934)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930)))))))

(assert (= (and d!83828 res!209716) b!250497))

(assert (= (and b!250497 res!209717) b!250498))

(assert (= (and b!250498 (not res!209718)) b!250499))

(assert (=> b!250497 m!376851))

(assert (=> b!250497 m!376859))

(assert (=> b!250499 m!376851))

(assert (=> b!250499 m!376851))

(declare-fun m!376995 () Bool)

(assert (=> b!250499 m!376995))

(assert (=> b!250367 d!83828))

(declare-fun d!83832 () Bool)

(assert (=> d!83832 (= (array_inv!5732 (buf!6484 thiss!1005)) (bvsge (size!5991 (buf!6484 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!250371 d!83832))

(declare-fun d!83834 () Bool)

(declare-fun e!173624 () Bool)

(assert (=> d!83834 e!173624))

(declare-fun res!209720 () Bool)

(assert (=> d!83834 (=> (not res!209720) (not e!173624))))

(declare-fun lt!389142 () (_ BitVec 64))

(declare-fun lt!389140 () (_ BitVec 64))

(declare-fun lt!389138 () (_ BitVec 64))

(assert (=> d!83834 (= res!209720 (= lt!389140 (bvsub lt!389138 lt!389142)))))

(assert (=> d!83834 (or (= (bvand lt!389138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389142 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389138 lt!389142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83834 (= lt!389142 (remainingBits!0 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388934)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388934))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388934)))))))

(declare-fun lt!389139 () (_ BitVec 64))

(declare-fun lt!389143 () (_ BitVec 64))

(assert (=> d!83834 (= lt!389138 (bvmul lt!389139 lt!389143))))

(assert (=> d!83834 (or (= lt!389139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389143 (bvsdiv (bvmul lt!389139 lt!389143) lt!389139)))))

(assert (=> d!83834 (= lt!389143 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83834 (= lt!389139 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388934)))))))

(assert (=> d!83834 (= lt!389140 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388934))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388934)))))))

(assert (=> d!83834 (invariant!0 (currentBit!11910 (_2!11674 lt!388934)) (currentByte!11915 (_2!11674 lt!388934)) (size!5991 (buf!6484 (_2!11674 lt!388934))))))

(assert (=> d!83834 (= (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388934))) (currentByte!11915 (_2!11674 lt!388934)) (currentBit!11910 (_2!11674 lt!388934))) lt!389140)))

(declare-fun b!250500 () Bool)

(declare-fun res!209719 () Bool)

(assert (=> b!250500 (=> (not res!209719) (not e!173624))))

(assert (=> b!250500 (= res!209719 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389140))))

(declare-fun b!250501 () Bool)

(declare-fun lt!389141 () (_ BitVec 64))

(assert (=> b!250501 (= e!173624 (bvsle lt!389140 (bvmul lt!389141 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250501 (or (= lt!389141 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389141 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389141)))))

(assert (=> b!250501 (= lt!389141 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388934)))))))

(assert (= (and d!83834 res!209720) b!250500))

(assert (= (and b!250500 res!209719) b!250501))

(declare-fun m!376997 () Bool)

(assert (=> d!83834 m!376997))

(declare-fun m!376999 () Bool)

(assert (=> d!83834 m!376999))

(assert (=> b!250374 d!83834))

(declare-fun d!83836 () Bool)

(declare-fun e!173625 () Bool)

(assert (=> d!83836 e!173625))

(declare-fun res!209722 () Bool)

(assert (=> d!83836 (=> (not res!209722) (not e!173625))))

(declare-fun lt!389144 () (_ BitVec 64))

(declare-fun lt!389148 () (_ BitVec 64))

(declare-fun lt!389146 () (_ BitVec 64))

(assert (=> d!83836 (= res!209722 (= lt!389146 (bvsub lt!389144 lt!389148)))))

(assert (=> d!83836 (or (= (bvand lt!389144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389144 lt!389148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83836 (= lt!389148 (remainingBits!0 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930)))))))

(declare-fun lt!389145 () (_ BitVec 64))

(declare-fun lt!389149 () (_ BitVec 64))

(assert (=> d!83836 (= lt!389144 (bvmul lt!389145 lt!389149))))

(assert (=> d!83836 (or (= lt!389145 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389149 (bvsdiv (bvmul lt!389145 lt!389149) lt!389145)))))

(assert (=> d!83836 (= lt!389149 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83836 (= lt!389145 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))))))

(assert (=> d!83836 (= lt!389146 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930)))))))

(assert (=> d!83836 (invariant!0 (currentBit!11910 (_2!11674 lt!388930)) (currentByte!11915 (_2!11674 lt!388930)) (size!5991 (buf!6484 (_2!11674 lt!388930))))))

(assert (=> d!83836 (= (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930))) lt!389146)))

(declare-fun b!250502 () Bool)

(declare-fun res!209721 () Bool)

(assert (=> b!250502 (=> (not res!209721) (not e!173625))))

(assert (=> b!250502 (= res!209721 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389146))))

(declare-fun b!250503 () Bool)

(declare-fun lt!389147 () (_ BitVec 64))

(assert (=> b!250503 (= e!173625 (bvsle lt!389146 (bvmul lt!389147 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250503 (or (= lt!389147 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389147 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389147)))))

(assert (=> b!250503 (= lt!389147 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))))))

(assert (= (and d!83836 res!209722) b!250502))

(assert (= (and b!250502 res!209721) b!250503))

(declare-fun m!377001 () Bool)

(assert (=> d!83836 m!377001))

(declare-fun m!377003 () Bool)

(assert (=> d!83836 m!377003))

(assert (=> b!250374 d!83836))

(declare-fun d!83838 () Bool)

(assert (=> d!83838 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 thiss!1005))) ((_ sign_extend 32) (currentByte!11915 thiss!1005)) ((_ sign_extend 32) (currentBit!11910 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5991 (buf!6484 thiss!1005))) ((_ sign_extend 32) (currentByte!11915 thiss!1005)) ((_ sign_extend 32) (currentBit!11910 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21245 () Bool)

(assert (= bs!21245 d!83838))

(declare-fun m!377005 () Bool)

(assert (=> bs!21245 m!377005))

(assert (=> b!250373 d!83838))

(declare-fun b!250523 () Bool)

(declare-fun res!209743 () Bool)

(declare-fun e!173636 () Bool)

(assert (=> b!250523 (=> (not res!209743) (not e!173636))))

(declare-fun lt!389173 () tuple2!21498)

(assert (=> b!250523 (= res!209743 (isPrefixOf!0 thiss!1005 (_2!11674 lt!389173)))))

(declare-fun d!83840 () Bool)

(assert (=> d!83840 e!173636))

(declare-fun res!209740 () Bool)

(assert (=> d!83840 (=> (not res!209740) (not e!173636))))

(assert (=> d!83840 (= res!209740 (= (size!5991 (buf!6484 thiss!1005)) (size!5991 (buf!6484 (_2!11674 lt!389173)))))))

(declare-fun choose!16 (BitStream!10904 Bool) tuple2!21498)

(assert (=> d!83840 (= lt!389173 (choose!16 thiss!1005 bit!26))))

(assert (=> d!83840 (validate_offset_bit!0 ((_ sign_extend 32) (size!5991 (buf!6484 thiss!1005))) ((_ sign_extend 32) (currentByte!11915 thiss!1005)) ((_ sign_extend 32) (currentBit!11910 thiss!1005)))))

(assert (=> d!83840 (= (appendBit!0 thiss!1005 bit!26) lt!389173)))

(declare-fun b!250525 () Bool)

(declare-fun e!173635 () Bool)

(declare-fun lt!389172 () tuple2!21500)

(assert (=> b!250525 (= e!173635 (= (bitIndex!0 (size!5991 (buf!6484 (_1!11675 lt!389172))) (currentByte!11915 (_1!11675 lt!389172)) (currentBit!11910 (_1!11675 lt!389172))) (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!389173))) (currentByte!11915 (_2!11674 lt!389173)) (currentBit!11910 (_2!11674 lt!389173)))))))

(declare-fun b!250524 () Bool)

(assert (=> b!250524 (= e!173636 e!173635)))

(declare-fun res!209741 () Bool)

(assert (=> b!250524 (=> (not res!209741) (not e!173635))))

(assert (=> b!250524 (= res!209741 (and (= (_2!11675 lt!389172) bit!26) (= (_1!11675 lt!389172) (_2!11674 lt!389173))))))

(assert (=> b!250524 (= lt!389172 (readBitPure!0 (readerFrom!0 (_2!11674 lt!389173) (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005))))))

(declare-fun b!250522 () Bool)

(declare-fun res!209742 () Bool)

(assert (=> b!250522 (=> (not res!209742) (not e!173636))))

(declare-fun lt!389174 () (_ BitVec 64))

(declare-fun lt!389175 () (_ BitVec 64))

(assert (=> b!250522 (= res!209742 (= (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!389173))) (currentByte!11915 (_2!11674 lt!389173)) (currentBit!11910 (_2!11674 lt!389173))) (bvadd lt!389174 lt!389175)))))

(assert (=> b!250522 (or (not (= (bvand lt!389174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389175 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389174 lt!389175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250522 (= lt!389175 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!250522 (= lt!389174 (bitIndex!0 (size!5991 (buf!6484 thiss!1005)) (currentByte!11915 thiss!1005) (currentBit!11910 thiss!1005)))))

(assert (= (and d!83840 res!209740) b!250522))

(assert (= (and b!250522 res!209742) b!250523))

(assert (= (and b!250523 res!209743) b!250524))

(assert (= (and b!250524 res!209741) b!250525))

(declare-fun m!377031 () Bool)

(assert (=> b!250522 m!377031))

(assert (=> b!250522 m!376853))

(declare-fun m!377033 () Bool)

(assert (=> d!83840 m!377033))

(declare-fun m!377035 () Bool)

(assert (=> d!83840 m!377035))

(declare-fun m!377037 () Bool)

(assert (=> b!250525 m!377037))

(assert (=> b!250525 m!377031))

(declare-fun m!377039 () Bool)

(assert (=> b!250524 m!377039))

(assert (=> b!250524 m!377039))

(declare-fun m!377041 () Bool)

(assert (=> b!250524 m!377041))

(declare-fun m!377043 () Bool)

(assert (=> b!250523 m!377043))

(assert (=> b!250372 d!83840))

(declare-fun d!83850 () Bool)

(assert (=> d!83850 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21248 () Bool)

(assert (= bs!21248 d!83850))

(assert (=> bs!21248 m!377001))

(assert (=> b!250372 d!83850))

(declare-fun d!83852 () Bool)

(assert (=> d!83852 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 thiss!1005)) ((_ sign_extend 32) (currentBit!11910 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 thiss!1005)) ((_ sign_extend 32) (currentBit!11910 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21249 () Bool)

(assert (= bs!21249 d!83852))

(declare-fun m!377045 () Bool)

(assert (=> bs!21249 m!377045))

(assert (=> b!250372 d!83852))

(declare-fun d!83854 () Bool)

(declare-fun res!209744 () Bool)

(declare-fun e!173637 () Bool)

(assert (=> d!83854 (=> (not res!209744) (not e!173637))))

(assert (=> d!83854 (= res!209744 (= (size!5991 (buf!6484 thiss!1005)) (size!5991 (buf!6484 (_2!11674 lt!388934)))))))

(assert (=> d!83854 (= (isPrefixOf!0 thiss!1005 (_2!11674 lt!388934)) e!173637)))

(declare-fun b!250526 () Bool)

(declare-fun res!209745 () Bool)

(assert (=> b!250526 (=> (not res!209745) (not e!173637))))

(assert (=> b!250526 (= res!209745 (bvsle (bitIndex!0 (size!5991 (buf!6484 thiss!1005)) (currentByte!11915 thiss!1005) (currentBit!11910 thiss!1005)) (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388934))) (currentByte!11915 (_2!11674 lt!388934)) (currentBit!11910 (_2!11674 lt!388934)))))))

(declare-fun b!250527 () Bool)

(declare-fun e!173638 () Bool)

(assert (=> b!250527 (= e!173637 e!173638)))

(declare-fun res!209746 () Bool)

(assert (=> b!250527 (=> res!209746 e!173638)))

(assert (=> b!250527 (= res!209746 (= (size!5991 (buf!6484 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250528 () Bool)

(assert (=> b!250528 (= e!173638 (arrayBitRangesEq!0 (buf!6484 thiss!1005) (buf!6484 (_2!11674 lt!388934)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5991 (buf!6484 thiss!1005)) (currentByte!11915 thiss!1005) (currentBit!11910 thiss!1005))))))

(assert (= (and d!83854 res!209744) b!250526))

(assert (= (and b!250526 res!209745) b!250527))

(assert (= (and b!250527 (not res!209746)) b!250528))

(assert (=> b!250526 m!376853))

(assert (=> b!250526 m!376859))

(assert (=> b!250528 m!376853))

(assert (=> b!250528 m!376853))

(declare-fun m!377047 () Bool)

(assert (=> b!250528 m!377047))

(assert (=> b!250372 d!83854))

(declare-fun b!250551 () Bool)

(declare-fun e!173649 () Bool)

(declare-fun lt!389223 () tuple2!21500)

(declare-fun lt!389226 () tuple2!21502)

(assert (=> b!250551 (= e!173649 (and (_2!11675 lt!389223) (= (_1!11675 lt!389223) (_2!11676 lt!389226))))))

(assert (=> b!250551 (= lt!389223 (checkBitsLoopPure!0 (_1!11676 lt!389226) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!389222 () Unit!18118)

(declare-fun lt!389228 () Unit!18118)

(assert (=> b!250551 (= lt!389222 lt!389228)))

(declare-fun lt!389229 () tuple2!21498)

(declare-fun lt!389227 () (_ BitVec 64))

(assert (=> b!250551 (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!389229)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930))) lt!389227)))

(assert (=> b!250551 (= lt!389228 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11674 lt!388930) (buf!6484 (_2!11674 lt!389229)) lt!389227))))

(declare-fun e!173650 () Bool)

(assert (=> b!250551 e!173650))

(declare-fun res!209767 () Bool)

(assert (=> b!250551 (=> (not res!209767) (not e!173650))))

(assert (=> b!250551 (= res!209767 (and (= (size!5991 (buf!6484 (_2!11674 lt!388930))) (size!5991 (buf!6484 (_2!11674 lt!389229)))) (bvsge lt!389227 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250551 (= lt!389227 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250551 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250551 (= lt!389226 (reader!0 (_2!11674 lt!388930) (_2!11674 lt!389229)))))

(declare-fun b!250552 () Bool)

(assert (=> b!250552 (= e!173650 (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930))) lt!389227))))

(declare-fun b!250550 () Bool)

(declare-fun res!209768 () Bool)

(assert (=> b!250550 (=> (not res!209768) (not e!173649))))

(assert (=> b!250550 (= res!209768 (isPrefixOf!0 (_2!11674 lt!388930) (_2!11674 lt!389229)))))

(declare-fun d!83856 () Bool)

(assert (=> d!83856 e!173649))

(declare-fun res!209770 () Bool)

(assert (=> d!83856 (=> (not res!209770) (not e!173649))))

(assert (=> d!83856 (= res!209770 (= (size!5991 (buf!6484 (_2!11674 lt!388930))) (size!5991 (buf!6484 (_2!11674 lt!389229)))))))

(declare-fun choose!51 (BitStream!10904 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21498)

(assert (=> d!83856 (= lt!389229 (choose!51 (_2!11674 lt!388930) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83856 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83856 (= (appendNBitsLoop!0 (_2!11674 lt!388930) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!389229)))

(declare-fun b!250549 () Bool)

(declare-fun res!209769 () Bool)

(assert (=> b!250549 (=> (not res!209769) (not e!173649))))

(declare-fun lt!389224 () (_ BitVec 64))

(declare-fun lt!389225 () (_ BitVec 64))

(assert (=> b!250549 (= res!209769 (= (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!389229))) (currentByte!11915 (_2!11674 lt!389229)) (currentBit!11910 (_2!11674 lt!389229))) (bvadd lt!389225 lt!389224)))))

(assert (=> b!250549 (or (not (= (bvand lt!389225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389224 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389225 lt!389224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250549 (= lt!389224 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250549 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250549 (= lt!389225 (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930))))))

(assert (= (and d!83856 res!209770) b!250549))

(assert (= (and b!250549 res!209769) b!250550))

(assert (= (and b!250550 res!209768) b!250551))

(assert (= (and b!250551 res!209767) b!250552))

(declare-fun m!377073 () Bool)

(assert (=> b!250549 m!377073))

(assert (=> b!250549 m!376851))

(declare-fun m!377075 () Bool)

(assert (=> b!250551 m!377075))

(declare-fun m!377077 () Bool)

(assert (=> b!250551 m!377077))

(declare-fun m!377079 () Bool)

(assert (=> b!250551 m!377079))

(declare-fun m!377081 () Bool)

(assert (=> b!250551 m!377081))

(declare-fun m!377083 () Bool)

(assert (=> b!250552 m!377083))

(declare-fun m!377085 () Bool)

(assert (=> d!83856 m!377085))

(declare-fun m!377087 () Bool)

(assert (=> b!250550 m!377087))

(assert (=> b!250372 d!83856))

(declare-fun d!83868 () Bool)

(assert (=> d!83868 (isPrefixOf!0 thiss!1005 (_2!11674 lt!388934))))

(declare-fun lt!389232 () Unit!18118)

(declare-fun choose!30 (BitStream!10904 BitStream!10904 BitStream!10904) Unit!18118)

(assert (=> d!83868 (= lt!389232 (choose!30 thiss!1005 (_2!11674 lt!388930) (_2!11674 lt!388934)))))

(assert (=> d!83868 (isPrefixOf!0 thiss!1005 (_2!11674 lt!388930))))

(assert (=> d!83868 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11674 lt!388930) (_2!11674 lt!388934)) lt!389232)))

(declare-fun bs!21254 () Bool)

(assert (= bs!21254 d!83868))

(assert (=> bs!21254 m!376837))

(declare-fun m!377089 () Bool)

(assert (=> bs!21254 m!377089))

(assert (=> bs!21254 m!376855))

(assert (=> b!250372 d!83868))

(declare-fun d!83870 () Bool)

(declare-fun e!173653 () Bool)

(assert (=> d!83870 e!173653))

(declare-fun res!209773 () Bool)

(assert (=> d!83870 (=> (not res!209773) (not e!173653))))

(assert (=> d!83870 (= res!209773 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!389235 () Unit!18118)

(declare-fun choose!27 (BitStream!10904 BitStream!10904 (_ BitVec 64) (_ BitVec 64)) Unit!18118)

(assert (=> d!83870 (= lt!389235 (choose!27 thiss!1005 (_2!11674 lt!388930) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83870 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!83870 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11674 lt!388930) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!389235)))

(declare-fun b!250555 () Bool)

(assert (=> b!250555 (= e!173653 (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388930)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!83870 res!209773) b!250555))

(declare-fun m!377091 () Bool)

(assert (=> d!83870 m!377091))

(assert (=> b!250555 m!376841))

(assert (=> b!250372 d!83870))

(declare-fun d!83872 () Bool)

(declare-datatypes ((tuple2!21508 0))(
  ( (tuple2!21509 (_1!11679 Bool) (_2!11679 BitStream!10904)) )
))
(declare-fun lt!389278 () tuple2!21508)

(declare-fun checkBitsLoop!0 (BitStream!10904 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21508)

(assert (=> d!83872 (= lt!389278 (checkBitsLoop!0 (_1!11676 lt!388927) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83872 (= (checkBitsLoopPure!0 (_1!11676 lt!388927) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21501 (_2!11679 lt!389278) (_1!11679 lt!389278)))))

(declare-fun bs!21255 () Bool)

(assert (= bs!21255 d!83872))

(declare-fun m!377093 () Bool)

(assert (=> bs!21255 m!377093))

(assert (=> b!250366 d!83872))

(declare-fun d!83874 () Bool)

(assert (=> d!83874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388934)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930))) lt!388932) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388934)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930)))) lt!388932))))

(declare-fun bs!21256 () Bool)

(assert (= bs!21256 d!83874))

(declare-fun m!377095 () Bool)

(assert (=> bs!21256 m!377095))

(assert (=> b!250366 d!83874))

(declare-fun d!83876 () Bool)

(assert (=> d!83876 (validate_offset_bits!1 ((_ sign_extend 32) (size!5991 (buf!6484 (_2!11674 lt!388934)))) ((_ sign_extend 32) (currentByte!11915 (_2!11674 lt!388930))) ((_ sign_extend 32) (currentBit!11910 (_2!11674 lt!388930))) lt!388932)))

(declare-fun lt!389281 () Unit!18118)

(declare-fun choose!9 (BitStream!10904 array!13655 (_ BitVec 64) BitStream!10904) Unit!18118)

(assert (=> d!83876 (= lt!389281 (choose!9 (_2!11674 lt!388930) (buf!6484 (_2!11674 lt!388934)) lt!388932 (BitStream!10905 (buf!6484 (_2!11674 lt!388934)) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930)))))))

(assert (=> d!83876 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11674 lt!388930) (buf!6484 (_2!11674 lt!388934)) lt!388932) lt!389281)))

(declare-fun bs!21257 () Bool)

(assert (= bs!21257 d!83876))

(assert (=> bs!21257 m!376863))

(declare-fun m!377097 () Bool)

(assert (=> bs!21257 m!377097))

(assert (=> b!250366 d!83876))

(declare-fun b!250586 () Bool)

(declare-fun res!209794 () Bool)

(declare-fun e!173668 () Bool)

(assert (=> b!250586 (=> (not res!209794) (not e!173668))))

(declare-fun lt!389360 () tuple2!21502)

(assert (=> b!250586 (= res!209794 (isPrefixOf!0 (_2!11676 lt!389360) (_2!11674 lt!388934)))))

(declare-fun b!250587 () Bool)

(declare-fun e!173667 () Unit!18118)

(declare-fun lt!389351 () Unit!18118)

(assert (=> b!250587 (= e!173667 lt!389351)))

(declare-fun lt!389353 () (_ BitVec 64))

(assert (=> b!250587 (= lt!389353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!389354 () (_ BitVec 64))

(assert (=> b!250587 (= lt!389354 (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13655 array!13655 (_ BitVec 64) (_ BitVec 64)) Unit!18118)

(assert (=> b!250587 (= lt!389351 (arrayBitRangesEqSymmetric!0 (buf!6484 (_2!11674 lt!388930)) (buf!6484 (_2!11674 lt!388934)) lt!389353 lt!389354))))

(assert (=> b!250587 (arrayBitRangesEq!0 (buf!6484 (_2!11674 lt!388934)) (buf!6484 (_2!11674 lt!388930)) lt!389353 lt!389354)))

(declare-fun d!83878 () Bool)

(assert (=> d!83878 e!173668))

(declare-fun res!209795 () Bool)

(assert (=> d!83878 (=> (not res!209795) (not e!173668))))

(assert (=> d!83878 (= res!209795 (isPrefixOf!0 (_1!11676 lt!389360) (_2!11676 lt!389360)))))

(declare-fun lt!389364 () BitStream!10904)

(assert (=> d!83878 (= lt!389360 (tuple2!21503 lt!389364 (_2!11674 lt!388934)))))

(declare-fun lt!389348 () Unit!18118)

(declare-fun lt!389349 () Unit!18118)

(assert (=> d!83878 (= lt!389348 lt!389349)))

(assert (=> d!83878 (isPrefixOf!0 lt!389364 (_2!11674 lt!388934))))

(assert (=> d!83878 (= lt!389349 (lemmaIsPrefixTransitive!0 lt!389364 (_2!11674 lt!388934) (_2!11674 lt!388934)))))

(declare-fun lt!389361 () Unit!18118)

(declare-fun lt!389367 () Unit!18118)

(assert (=> d!83878 (= lt!389361 lt!389367)))

(assert (=> d!83878 (isPrefixOf!0 lt!389364 (_2!11674 lt!388934))))

(assert (=> d!83878 (= lt!389367 (lemmaIsPrefixTransitive!0 lt!389364 (_2!11674 lt!388930) (_2!11674 lt!388934)))))

(declare-fun lt!389366 () Unit!18118)

(assert (=> d!83878 (= lt!389366 e!173667)))

(declare-fun c!11596 () Bool)

(assert (=> d!83878 (= c!11596 (not (= (size!5991 (buf!6484 (_2!11674 lt!388930))) #b00000000000000000000000000000000)))))

(declare-fun lt!389365 () Unit!18118)

(declare-fun lt!389358 () Unit!18118)

(assert (=> d!83878 (= lt!389365 lt!389358)))

(assert (=> d!83878 (isPrefixOf!0 (_2!11674 lt!388934) (_2!11674 lt!388934))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10904) Unit!18118)

(assert (=> d!83878 (= lt!389358 (lemmaIsPrefixRefl!0 (_2!11674 lt!388934)))))

(declare-fun lt!389350 () Unit!18118)

(declare-fun lt!389356 () Unit!18118)

(assert (=> d!83878 (= lt!389350 lt!389356)))

(assert (=> d!83878 (= lt!389356 (lemmaIsPrefixRefl!0 (_2!11674 lt!388934)))))

(declare-fun lt!389355 () Unit!18118)

(declare-fun lt!389362 () Unit!18118)

(assert (=> d!83878 (= lt!389355 lt!389362)))

(assert (=> d!83878 (isPrefixOf!0 lt!389364 lt!389364)))

(assert (=> d!83878 (= lt!389362 (lemmaIsPrefixRefl!0 lt!389364))))

(declare-fun lt!389352 () Unit!18118)

(declare-fun lt!389359 () Unit!18118)

(assert (=> d!83878 (= lt!389352 lt!389359)))

(assert (=> d!83878 (isPrefixOf!0 (_2!11674 lt!388930) (_2!11674 lt!388930))))

(assert (=> d!83878 (= lt!389359 (lemmaIsPrefixRefl!0 (_2!11674 lt!388930)))))

(assert (=> d!83878 (= lt!389364 (BitStream!10905 (buf!6484 (_2!11674 lt!388934)) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930))))))

(assert (=> d!83878 (isPrefixOf!0 (_2!11674 lt!388930) (_2!11674 lt!388934))))

(assert (=> d!83878 (= (reader!0 (_2!11674 lt!388930) (_2!11674 lt!388934)) lt!389360)))

(declare-fun b!250588 () Bool)

(declare-fun res!209796 () Bool)

(assert (=> b!250588 (=> (not res!209796) (not e!173668))))

(assert (=> b!250588 (= res!209796 (isPrefixOf!0 (_1!11676 lt!389360) (_2!11674 lt!388930)))))

(declare-fun b!250589 () Bool)

(declare-fun Unit!18122 () Unit!18118)

(assert (=> b!250589 (= e!173667 Unit!18122)))

(declare-fun lt!389357 () (_ BitVec 64))

(declare-fun b!250590 () Bool)

(declare-fun lt!389363 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10904 (_ BitVec 64)) BitStream!10904)

(assert (=> b!250590 (= e!173668 (= (_1!11676 lt!389360) (withMovedBitIndex!0 (_2!11676 lt!389360) (bvsub lt!389363 lt!389357))))))

(assert (=> b!250590 (or (= (bvand lt!389363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389357 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389363 lt!389357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250590 (= lt!389357 (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388934))) (currentByte!11915 (_2!11674 lt!388934)) (currentBit!11910 (_2!11674 lt!388934))))))

(assert (=> b!250590 (= lt!389363 (bitIndex!0 (size!5991 (buf!6484 (_2!11674 lt!388930))) (currentByte!11915 (_2!11674 lt!388930)) (currentBit!11910 (_2!11674 lt!388930))))))

(assert (= (and d!83878 c!11596) b!250587))

(assert (= (and d!83878 (not c!11596)) b!250589))

(assert (= (and d!83878 res!209795) b!250588))

(assert (= (and b!250588 res!209796) b!250586))

(assert (= (and b!250586 res!209794) b!250590))

(declare-fun m!377135 () Bool)

(assert (=> b!250588 m!377135))

(declare-fun m!377137 () Bool)

(assert (=> b!250586 m!377137))

(declare-fun m!377139 () Bool)

(assert (=> d!83878 m!377139))

(declare-fun m!377141 () Bool)

(assert (=> d!83878 m!377141))

(declare-fun m!377143 () Bool)

(assert (=> d!83878 m!377143))

(assert (=> d!83878 m!376835))

(declare-fun m!377145 () Bool)

(assert (=> d!83878 m!377145))

(declare-fun m!377147 () Bool)

(assert (=> d!83878 m!377147))

(declare-fun m!377149 () Bool)

(assert (=> d!83878 m!377149))

(declare-fun m!377151 () Bool)

(assert (=> d!83878 m!377151))

(declare-fun m!377153 () Bool)

(assert (=> d!83878 m!377153))

(declare-fun m!377155 () Bool)

(assert (=> d!83878 m!377155))

(declare-fun m!377157 () Bool)

(assert (=> d!83878 m!377157))

(assert (=> b!250587 m!376851))

(declare-fun m!377159 () Bool)

(assert (=> b!250587 m!377159))

(declare-fun m!377161 () Bool)

(assert (=> b!250587 m!377161))

(declare-fun m!377163 () Bool)

(assert (=> b!250590 m!377163))

(assert (=> b!250590 m!376859))

(assert (=> b!250590 m!376851))

(assert (=> b!250366 d!83878))

(declare-fun d!83888 () Bool)

(declare-fun lt!389370 () tuple2!21508)

(declare-fun readBit!0 (BitStream!10904) tuple2!21508)

(assert (=> d!83888 (= lt!389370 (readBit!0 (readerFrom!0 (_2!11674 lt!388930) (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005))))))

(assert (=> d!83888 (= (readBitPure!0 (readerFrom!0 (_2!11674 lt!388930) (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005))) (tuple2!21501 (_2!11679 lt!389370) (_1!11679 lt!389370)))))

(declare-fun bs!21258 () Bool)

(assert (= bs!21258 d!83888))

(assert (=> bs!21258 m!376869))

(declare-fun m!377165 () Bool)

(assert (=> bs!21258 m!377165))

(assert (=> b!250376 d!83888))

(declare-fun d!83890 () Bool)

(declare-fun e!173671 () Bool)

(assert (=> d!83890 e!173671))

(declare-fun res!209800 () Bool)

(assert (=> d!83890 (=> (not res!209800) (not e!173671))))

(assert (=> d!83890 (= res!209800 (invariant!0 (currentBit!11910 (_2!11674 lt!388930)) (currentByte!11915 (_2!11674 lt!388930)) (size!5991 (buf!6484 (_2!11674 lt!388930)))))))

(assert (=> d!83890 (= (readerFrom!0 (_2!11674 lt!388930) (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005)) (BitStream!10905 (buf!6484 (_2!11674 lt!388930)) (currentByte!11915 thiss!1005) (currentBit!11910 thiss!1005)))))

(declare-fun b!250593 () Bool)

(assert (=> b!250593 (= e!173671 (invariant!0 (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005) (size!5991 (buf!6484 (_2!11674 lt!388930)))))))

(assert (= (and d!83890 res!209800) b!250593))

(assert (=> d!83890 m!377003))

(assert (=> b!250593 m!376879))

(assert (=> b!250376 d!83890))

(assert (=> b!250365 d!83836))

(declare-fun d!83892 () Bool)

(declare-fun e!173672 () Bool)

(assert (=> d!83892 e!173672))

(declare-fun res!209802 () Bool)

(assert (=> d!83892 (=> (not res!209802) (not e!173672))))

(declare-fun lt!389371 () (_ BitVec 64))

(declare-fun lt!389375 () (_ BitVec 64))

(declare-fun lt!389373 () (_ BitVec 64))

(assert (=> d!83892 (= res!209802 (= lt!389373 (bvsub lt!389371 lt!389375)))))

(assert (=> d!83892 (or (= (bvand lt!389371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389371 lt!389375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83892 (= lt!389375 (remainingBits!0 ((_ sign_extend 32) (size!5991 (buf!6484 thiss!1005))) ((_ sign_extend 32) (currentByte!11915 thiss!1005)) ((_ sign_extend 32) (currentBit!11910 thiss!1005))))))

(declare-fun lt!389372 () (_ BitVec 64))

(declare-fun lt!389376 () (_ BitVec 64))

(assert (=> d!83892 (= lt!389371 (bvmul lt!389372 lt!389376))))

(assert (=> d!83892 (or (= lt!389372 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389376 (bvsdiv (bvmul lt!389372 lt!389376) lt!389372)))))

(assert (=> d!83892 (= lt!389376 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83892 (= lt!389372 ((_ sign_extend 32) (size!5991 (buf!6484 thiss!1005))))))

(assert (=> d!83892 (= lt!389373 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11915 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11910 thiss!1005))))))

(assert (=> d!83892 (invariant!0 (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005) (size!5991 (buf!6484 thiss!1005)))))

(assert (=> d!83892 (= (bitIndex!0 (size!5991 (buf!6484 thiss!1005)) (currentByte!11915 thiss!1005) (currentBit!11910 thiss!1005)) lt!389373)))

(declare-fun b!250594 () Bool)

(declare-fun res!209801 () Bool)

(assert (=> b!250594 (=> (not res!209801) (not e!173672))))

(assert (=> b!250594 (= res!209801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389373))))

(declare-fun b!250595 () Bool)

(declare-fun lt!389374 () (_ BitVec 64))

(assert (=> b!250595 (= e!173672 (bvsle lt!389373 (bvmul lt!389374 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250595 (or (= lt!389374 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389374 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389374)))))

(assert (=> b!250595 (= lt!389374 ((_ sign_extend 32) (size!5991 (buf!6484 thiss!1005))))))

(assert (= (and d!83892 res!209802) b!250594))

(assert (= (and b!250594 res!209801) b!250595))

(assert (=> d!83892 m!377005))

(declare-fun m!377167 () Bool)

(assert (=> d!83892 m!377167))

(assert (=> b!250365 d!83892))

(declare-fun d!83894 () Bool)

(assert (=> d!83894 (= (invariant!0 (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005) (size!5991 (buf!6484 (_2!11674 lt!388930)))) (and (bvsge (currentBit!11910 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11910 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11915 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11915 thiss!1005) (size!5991 (buf!6484 (_2!11674 lt!388930)))) (and (= (currentBit!11910 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11915 thiss!1005) (size!5991 (buf!6484 (_2!11674 lt!388930))))))))))

(assert (=> b!250375 d!83894))

(declare-fun d!83896 () Bool)

(assert (=> d!83896 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11910 thiss!1005) (currentByte!11915 thiss!1005) (size!5991 (buf!6484 thiss!1005))))))

(declare-fun bs!21259 () Bool)

(assert (= bs!21259 d!83896))

(assert (=> bs!21259 m!377167))

(assert (=> start!53746 d!83896))

(push 1)

(assert (not b!250588))

(assert (not b!250525))

(assert (not d!83890))

(assert (not b!250494))

(assert (not d!83850))

(assert (not b!250550))

(assert (not d!83868))

(assert (not b!250523))

(assert (not b!250552))

(assert (not b!250492))

(assert (not d!83876))

(assert (not b!250524))

(assert (not b!250522))

(assert (not d!83892))

(assert (not d!83870))

(assert (not b!250526))

(assert (not b!250549))

(assert (not b!250587))

(assert (not d!83818))

(assert (not d!83838))

(assert (not b!250586))

(assert (not b!250551))

(assert (not d!83856))

(assert (not b!250555))

(assert (not b!250499))

(assert (not b!250528))

(assert (not d!83888))

(assert (not b!250590))

(assert (not b!250593))

(assert (not d!83874))

(assert (not d!83836))

(assert (not d!83834))

(assert (not b!250497))

(assert (not d!83872))

(assert (not d!83852))

(assert (not d!83878))

(assert (not d!83840))

(assert (not d!83896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

