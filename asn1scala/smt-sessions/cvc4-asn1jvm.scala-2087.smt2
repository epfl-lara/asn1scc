; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52878 () Bool)

(assert start!52878)

(declare-fun res!204891 () Bool)

(declare-fun e!169839 () Bool)

(assert (=> start!52878 (=> (not res!204891) (not e!169839))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52878 (= res!204891 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52878 e!169839))

(assert (=> start!52878 true))

(declare-datatypes ((array!13404 0))(
  ( (array!13405 (arr!6864 (Array (_ BitVec 32) (_ BitVec 8))) (size!5877 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10676 0))(
  ( (BitStream!10677 (buf!6352 array!13404) (currentByte!11736 (_ BitVec 32)) (currentBit!11731 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10676)

(declare-fun e!169841 () Bool)

(declare-fun inv!12 (BitStream!10676) Bool)

(assert (=> start!52878 (and (inv!12 thiss!1005) e!169841)))

(declare-fun b!245061 () Bool)

(declare-fun res!204879 () Bool)

(declare-fun e!169831 () Bool)

(assert (=> b!245061 (=> (not res!204879) (not e!169831))))

(declare-datatypes ((Unit!17855 0))(
  ( (Unit!17856) )
))
(declare-datatypes ((tuple2!21030 0))(
  ( (tuple2!21031 (_1!11437 Unit!17855) (_2!11437 BitStream!10676)) )
))
(declare-fun lt!382081 () tuple2!21030)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245061 (= res!204879 (invariant!0 (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382081)))))))

(declare-fun b!245062 () Bool)

(declare-fun e!169840 () Bool)

(declare-datatypes ((tuple2!21032 0))(
  ( (tuple2!21033 (_1!11438 BitStream!10676) (_2!11438 BitStream!10676)) )
))
(declare-fun lt!382082 () tuple2!21032)

(declare-fun moveBitIndexPrecond!0 (BitStream!10676 (_ BitVec 64)) Bool)

(assert (=> b!245062 (= e!169840 (moveBitIndexPrecond!0 (_1!11438 lt!382082) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!245063 () Bool)

(declare-fun e!169836 () Bool)

(declare-fun e!169834 () Bool)

(assert (=> b!245063 (= e!169836 e!169834)))

(declare-fun res!204881 () Bool)

(assert (=> b!245063 (=> (not res!204881) (not e!169834))))

(declare-fun lt!382074 () (_ BitVec 64))

(declare-fun lt!382066 () tuple2!21030)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245063 (= res!204881 (= (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382066))) (currentByte!11736 (_2!11437 lt!382066)) (currentBit!11731 (_2!11437 lt!382066))) (bvadd (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081))) lt!382074)))))

(assert (=> b!245063 (= lt!382074 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!245064 () Bool)

(declare-fun array_inv!5618 (array!13404) Bool)

(assert (=> b!245064 (= e!169841 (array_inv!5618 (buf!6352 thiss!1005)))))

(declare-fun b!245065 () Bool)

(declare-fun res!204878 () Bool)

(declare-fun e!169837 () Bool)

(assert (=> b!245065 (=> (not res!204878) (not e!169837))))

(declare-fun isPrefixOf!0 (BitStream!10676 BitStream!10676) Bool)

(assert (=> b!245065 (= res!204878 (isPrefixOf!0 thiss!1005 (_2!11437 lt!382081)))))

(declare-fun b!245066 () Bool)

(declare-fun res!204883 () Bool)

(assert (=> b!245066 (=> (not res!204883) (not e!169839))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245066 (= res!204883 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 thiss!1005))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!245067 () Bool)

(declare-datatypes ((tuple2!21034 0))(
  ( (tuple2!21035 (_1!11439 BitStream!10676) (_2!11439 Bool)) )
))
(declare-fun lt!382067 () tuple2!21034)

(declare-fun lt!382068 () tuple2!21032)

(assert (=> b!245067 (= e!169834 (not (or (not (_2!11439 lt!382067)) (not (= (_1!11439 lt!382067) (_2!11438 lt!382068))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10676 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21034)

(assert (=> b!245067 (= lt!382067 (checkBitsLoopPure!0 (_1!11438 lt!382068) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245067 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382074)))

(declare-fun lt!382079 () Unit!17855)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10676 array!13404 (_ BitVec 64)) Unit!17855)

(assert (=> b!245067 (= lt!382079 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11437 lt!382081) (buf!6352 (_2!11437 lt!382066)) lt!382074))))

(declare-fun reader!0 (BitStream!10676 BitStream!10676) tuple2!21032)

(assert (=> b!245067 (= lt!382068 (reader!0 (_2!11437 lt!382081) (_2!11437 lt!382066)))))

(declare-fun b!245068 () Bool)

(assert (=> b!245068 (= e!169831 (invariant!0 (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382066)))))))

(declare-fun b!245069 () Bool)

(declare-fun e!169832 () Bool)

(declare-fun lt!382080 () tuple2!21034)

(declare-fun lt!382069 () tuple2!21034)

(assert (=> b!245069 (= e!169832 (= (_2!11439 lt!382080) (_2!11439 lt!382069)))))

(declare-fun b!245070 () Bool)

(declare-fun e!169838 () Bool)

(assert (=> b!245070 (= e!169838 e!169837)))

(declare-fun res!204887 () Bool)

(assert (=> b!245070 (=> (not res!204887) (not e!169837))))

(declare-fun lt!382065 () (_ BitVec 64))

(declare-fun lt!382075 () (_ BitVec 64))

(assert (=> b!245070 (= res!204887 (= lt!382065 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!382075)))))

(assert (=> b!245070 (= lt!382065 (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081))))))

(assert (=> b!245070 (= lt!382075 (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)))))

(declare-fun b!245071 () Bool)

(declare-fun e!169835 () Bool)

(declare-fun lt!382072 () tuple2!21034)

(assert (=> b!245071 (= e!169835 (= (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382072))) (currentByte!11736 (_1!11439 lt!382072)) (currentBit!11731 (_1!11439 lt!382072))) lt!382065))))

(declare-fun b!245072 () Bool)

(assert (=> b!245072 (= e!169837 e!169835)))

(declare-fun res!204890 () Bool)

(assert (=> b!245072 (=> (not res!204890) (not e!169835))))

(assert (=> b!245072 (= res!204890 (and (= (_2!11439 lt!382072) bit!26) (= (_1!11439 lt!382072) (_2!11437 lt!382081))))))

(declare-fun readBitPure!0 (BitStream!10676) tuple2!21034)

(declare-fun readerFrom!0 (BitStream!10676 (_ BitVec 32) (_ BitVec 32)) BitStream!10676)

(assert (=> b!245072 (= lt!382072 (readBitPure!0 (readerFrom!0 (_2!11437 lt!382081) (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005))))))

(declare-fun b!245073 () Bool)

(declare-fun res!204888 () Bool)

(assert (=> b!245073 (=> (not res!204888) (not e!169839))))

(assert (=> b!245073 (= res!204888 (bvslt from!289 nBits!297))))

(declare-fun b!245074 () Bool)

(assert (=> b!245074 (= e!169839 (not e!169840))))

(declare-fun res!204886 () Bool)

(assert (=> b!245074 (=> res!204886 e!169840)))

(declare-fun lt!382083 () tuple2!21032)

(assert (=> b!245074 (= res!204886 (not (= (_1!11439 (checkBitsLoopPure!0 (_1!11438 lt!382083) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11438 lt!382083))))))

(declare-fun lt!382064 () (_ BitVec 64))

(assert (=> b!245074 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382064)))

(declare-fun lt!382070 () Unit!17855)

(assert (=> b!245074 (= lt!382070 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11437 lt!382081) (buf!6352 (_2!11437 lt!382066)) lt!382064))))

(declare-fun lt!382073 () tuple2!21034)

(assert (=> b!245074 (= lt!382073 (checkBitsLoopPure!0 (_1!11438 lt!382082) nBits!297 bit!26 from!289))))

(assert (=> b!245074 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!382071 () Unit!17855)

(assert (=> b!245074 (= lt!382071 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6352 (_2!11437 lt!382066)) (bvsub nBits!297 from!289)))))

(assert (=> b!245074 (= (_2!11439 (readBitPure!0 (_1!11438 lt!382082))) bit!26)))

(assert (=> b!245074 (= lt!382083 (reader!0 (_2!11437 lt!382081) (_2!11437 lt!382066)))))

(assert (=> b!245074 (= lt!382082 (reader!0 thiss!1005 (_2!11437 lt!382066)))))

(assert (=> b!245074 e!169832))

(declare-fun res!204889 () Bool)

(assert (=> b!245074 (=> (not res!204889) (not e!169832))))

(assert (=> b!245074 (= res!204889 (= (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382080))) (currentByte!11736 (_1!11439 lt!382080)) (currentBit!11731 (_1!11439 lt!382080))) (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382069))) (currentByte!11736 (_1!11439 lt!382069)) (currentBit!11731 (_1!11439 lt!382069)))))))

(declare-fun lt!382076 () Unit!17855)

(declare-fun lt!382077 () BitStream!10676)

(declare-fun readBitPrefixLemma!0 (BitStream!10676 BitStream!10676) Unit!17855)

(assert (=> b!245074 (= lt!382076 (readBitPrefixLemma!0 lt!382077 (_2!11437 lt!382066)))))

(assert (=> b!245074 (= lt!382069 (readBitPure!0 (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005))))))

(assert (=> b!245074 (= lt!382080 (readBitPure!0 lt!382077))))

(assert (=> b!245074 (= lt!382077 (BitStream!10677 (buf!6352 (_2!11437 lt!382081)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)))))

(assert (=> b!245074 e!169831))

(declare-fun res!204880 () Bool)

(assert (=> b!245074 (=> (not res!204880) (not e!169831))))

(assert (=> b!245074 (= res!204880 (isPrefixOf!0 thiss!1005 (_2!11437 lt!382066)))))

(declare-fun lt!382078 () Unit!17855)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10676 BitStream!10676 BitStream!10676) Unit!17855)

(assert (=> b!245074 (= lt!382078 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11437 lt!382081) (_2!11437 lt!382066)))))

(assert (=> b!245074 e!169836))

(declare-fun res!204885 () Bool)

(assert (=> b!245074 (=> (not res!204885) (not e!169836))))

(assert (=> b!245074 (= res!204885 (= (size!5877 (buf!6352 (_2!11437 lt!382081))) (size!5877 (buf!6352 (_2!11437 lt!382066)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10676 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21030)

(assert (=> b!245074 (= lt!382066 (appendNBitsLoop!0 (_2!11437 lt!382081) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245074 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382081)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382064)))

(assert (=> b!245074 (= lt!382064 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!382063 () Unit!17855)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10676 BitStream!10676 (_ BitVec 64) (_ BitVec 64)) Unit!17855)

(assert (=> b!245074 (= lt!382063 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11437 lt!382081) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!245074 e!169838))

(declare-fun res!204884 () Bool)

(assert (=> b!245074 (=> (not res!204884) (not e!169838))))

(assert (=> b!245074 (= res!204884 (= (size!5877 (buf!6352 thiss!1005)) (size!5877 (buf!6352 (_2!11437 lt!382081)))))))

(declare-fun appendBit!0 (BitStream!10676 Bool) tuple2!21030)

(assert (=> b!245074 (= lt!382081 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!245075 () Bool)

(declare-fun res!204882 () Bool)

(assert (=> b!245075 (=> (not res!204882) (not e!169834))))

(assert (=> b!245075 (= res!204882 (isPrefixOf!0 (_2!11437 lt!382081) (_2!11437 lt!382066)))))

(assert (= (and start!52878 res!204891) b!245066))

(assert (= (and b!245066 res!204883) b!245073))

(assert (= (and b!245073 res!204888) b!245074))

(assert (= (and b!245074 res!204884) b!245070))

(assert (= (and b!245070 res!204887) b!245065))

(assert (= (and b!245065 res!204878) b!245072))

(assert (= (and b!245072 res!204890) b!245071))

(assert (= (and b!245074 res!204885) b!245063))

(assert (= (and b!245063 res!204881) b!245075))

(assert (= (and b!245075 res!204882) b!245067))

(assert (= (and b!245074 res!204880) b!245061))

(assert (= (and b!245061 res!204879) b!245068))

(assert (= (and b!245074 res!204889) b!245069))

(assert (= (and b!245074 (not res!204886)) b!245062))

(assert (= start!52878 b!245064))

(declare-fun m!369471 () Bool)

(assert (=> b!245071 m!369471))

(declare-fun m!369473 () Bool)

(assert (=> b!245068 m!369473))

(declare-fun m!369475 () Bool)

(assert (=> b!245075 m!369475))

(declare-fun m!369477 () Bool)

(assert (=> start!52878 m!369477))

(declare-fun m!369479 () Bool)

(assert (=> b!245070 m!369479))

(declare-fun m!369481 () Bool)

(assert (=> b!245070 m!369481))

(declare-fun m!369483 () Bool)

(assert (=> b!245074 m!369483))

(declare-fun m!369485 () Bool)

(assert (=> b!245074 m!369485))

(declare-fun m!369487 () Bool)

(assert (=> b!245074 m!369487))

(declare-fun m!369489 () Bool)

(assert (=> b!245074 m!369489))

(declare-fun m!369491 () Bool)

(assert (=> b!245074 m!369491))

(declare-fun m!369493 () Bool)

(assert (=> b!245074 m!369493))

(declare-fun m!369495 () Bool)

(assert (=> b!245074 m!369495))

(declare-fun m!369497 () Bool)

(assert (=> b!245074 m!369497))

(declare-fun m!369499 () Bool)

(assert (=> b!245074 m!369499))

(declare-fun m!369501 () Bool)

(assert (=> b!245074 m!369501))

(declare-fun m!369503 () Bool)

(assert (=> b!245074 m!369503))

(declare-fun m!369505 () Bool)

(assert (=> b!245074 m!369505))

(declare-fun m!369507 () Bool)

(assert (=> b!245074 m!369507))

(declare-fun m!369509 () Bool)

(assert (=> b!245074 m!369509))

(declare-fun m!369511 () Bool)

(assert (=> b!245074 m!369511))

(declare-fun m!369513 () Bool)

(assert (=> b!245074 m!369513))

(declare-fun m!369515 () Bool)

(assert (=> b!245074 m!369515))

(declare-fun m!369517 () Bool)

(assert (=> b!245074 m!369517))

(declare-fun m!369519 () Bool)

(assert (=> b!245074 m!369519))

(declare-fun m!369521 () Bool)

(assert (=> b!245074 m!369521))

(declare-fun m!369523 () Bool)

(assert (=> b!245064 m!369523))

(declare-fun m!369525 () Bool)

(assert (=> b!245062 m!369525))

(declare-fun m!369527 () Bool)

(assert (=> b!245067 m!369527))

(declare-fun m!369529 () Bool)

(assert (=> b!245067 m!369529))

(declare-fun m!369531 () Bool)

(assert (=> b!245067 m!369531))

(assert (=> b!245067 m!369501))

(declare-fun m!369533 () Bool)

(assert (=> b!245065 m!369533))

(declare-fun m!369535 () Bool)

(assert (=> b!245066 m!369535))

(declare-fun m!369537 () Bool)

(assert (=> b!245072 m!369537))

(assert (=> b!245072 m!369537))

(declare-fun m!369539 () Bool)

(assert (=> b!245072 m!369539))

(declare-fun m!369541 () Bool)

(assert (=> b!245063 m!369541))

(assert (=> b!245063 m!369479))

(declare-fun m!369543 () Bool)

(assert (=> b!245061 m!369543))

(push 1)

(assert (not b!245074))

(assert (not start!52878))

(assert (not b!245072))

(assert (not b!245075))

(assert (not b!245064))

(assert (not b!245061))

(assert (not b!245065))

(assert (not b!245068))

(assert (not b!245066))

(assert (not b!245063))

(assert (not b!245071))

(assert (not b!245067))

(assert (not b!245062))

(assert (not b!245070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82250 () Bool)

(declare-fun res!205022 () Bool)

(declare-fun e!169923 () Bool)

(assert (=> d!82250 (=> (not res!205022) (not e!169923))))

(assert (=> d!82250 (= res!205022 (= (size!5877 (buf!6352 thiss!1005)) (size!5877 (buf!6352 (_2!11437 lt!382081)))))))

(assert (=> d!82250 (= (isPrefixOf!0 thiss!1005 (_2!11437 lt!382081)) e!169923)))

(declare-fun b!245224 () Bool)

(declare-fun res!205023 () Bool)

(assert (=> b!245224 (=> (not res!205023) (not e!169923))))

(assert (=> b!245224 (= res!205023 (bvsle (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)) (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081)))))))

(declare-fun b!245225 () Bool)

(declare-fun e!169924 () Bool)

(assert (=> b!245225 (= e!169923 e!169924)))

(declare-fun res!205024 () Bool)

(assert (=> b!245225 (=> res!205024 e!169924)))

(assert (=> b!245225 (= res!205024 (= (size!5877 (buf!6352 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245226 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13404 array!13404 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245226 (= e!169924 (arrayBitRangesEq!0 (buf!6352 thiss!1005) (buf!6352 (_2!11437 lt!382081)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005))))))

(assert (= (and d!82250 res!205022) b!245224))

(assert (= (and b!245224 res!205023) b!245225))

(assert (= (and b!245225 (not res!205024)) b!245226))

(assert (=> b!245224 m!369481))

(assert (=> b!245224 m!369479))

(assert (=> b!245226 m!369481))

(assert (=> b!245226 m!369481))

(declare-fun m!369811 () Bool)

(assert (=> b!245226 m!369811))

(assert (=> b!245065 d!82250))

(declare-fun d!82252 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82252 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 thiss!1005))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 thiss!1005))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20813 () Bool)

(assert (= bs!20813 d!82252))

(declare-fun m!369813 () Bool)

(assert (=> bs!20813 m!369813))

(assert (=> b!245066 d!82252))

(declare-fun d!82254 () Bool)

(assert (=> d!82254 (= (array_inv!5618 (buf!6352 thiss!1005)) (bvsge (size!5877 (buf!6352 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!245064 d!82254))

(declare-fun d!82256 () Bool)

(declare-fun res!205033 () Bool)

(declare-fun e!169929 () Bool)

(assert (=> d!82256 (=> (not res!205033) (not e!169929))))

(assert (=> d!82256 (= res!205033 (= (size!5877 (buf!6352 (_2!11437 lt!382081))) (size!5877 (buf!6352 (_2!11437 lt!382066)))))))

(assert (=> d!82256 (= (isPrefixOf!0 (_2!11437 lt!382081) (_2!11437 lt!382066)) e!169929)))

(declare-fun b!245235 () Bool)

(declare-fun res!205034 () Bool)

(assert (=> b!245235 (=> (not res!205034) (not e!169929))))

(assert (=> b!245235 (= res!205034 (bvsle (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081))) (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382066))) (currentByte!11736 (_2!11437 lt!382066)) (currentBit!11731 (_2!11437 lt!382066)))))))

(declare-fun b!245236 () Bool)

(declare-fun e!169930 () Bool)

(assert (=> b!245236 (= e!169929 e!169930)))

(declare-fun res!205035 () Bool)

(assert (=> b!245236 (=> res!205035 e!169930)))

(assert (=> b!245236 (= res!205035 (= (size!5877 (buf!6352 (_2!11437 lt!382081))) #b00000000000000000000000000000000))))

(declare-fun b!245237 () Bool)

(assert (=> b!245237 (= e!169930 (arrayBitRangesEq!0 (buf!6352 (_2!11437 lt!382081)) (buf!6352 (_2!11437 lt!382066)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081)))))))

(assert (= (and d!82256 res!205033) b!245235))

(assert (= (and b!245235 res!205034) b!245236))

(assert (= (and b!245236 (not res!205035)) b!245237))

(assert (=> b!245235 m!369479))

(assert (=> b!245235 m!369541))

(assert (=> b!245237 m!369479))

(assert (=> b!245237 m!369479))

(declare-fun m!369815 () Bool)

(assert (=> b!245237 m!369815))

(assert (=> b!245075 d!82256))

(declare-fun d!82258 () Bool)

(declare-fun e!169940 () Bool)

(assert (=> d!82258 e!169940))

(declare-fun res!205050 () Bool)

(assert (=> d!82258 (=> (not res!205050) (not e!169940))))

(declare-fun lt!382476 () (_ BitVec 64))

(declare-fun lt!382474 () (_ BitVec 64))

(declare-fun lt!382472 () (_ BitVec 64))

(assert (=> d!82258 (= res!205050 (= lt!382474 (bvsub lt!382472 lt!382476)))))

(assert (=> d!82258 (or (= (bvand lt!382472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382472 lt!382476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82258 (= lt!382476 (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382066))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382066)))))))

(declare-fun lt!382473 () (_ BitVec 64))

(declare-fun lt!382477 () (_ BitVec 64))

(assert (=> d!82258 (= lt!382472 (bvmul lt!382473 lt!382477))))

(assert (=> d!82258 (or (= lt!382473 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382477 (bvsdiv (bvmul lt!382473 lt!382477) lt!382473)))))

(assert (=> d!82258 (= lt!382477 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82258 (= lt!382473 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))))))

(assert (=> d!82258 (= lt!382474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382066))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382066)))))))

(assert (=> d!82258 (invariant!0 (currentBit!11731 (_2!11437 lt!382066)) (currentByte!11736 (_2!11437 lt!382066)) (size!5877 (buf!6352 (_2!11437 lt!382066))))))

(assert (=> d!82258 (= (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382066))) (currentByte!11736 (_2!11437 lt!382066)) (currentBit!11731 (_2!11437 lt!382066))) lt!382474)))

(declare-fun b!245252 () Bool)

(declare-fun res!205049 () Bool)

(assert (=> b!245252 (=> (not res!205049) (not e!169940))))

(assert (=> b!245252 (= res!205049 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382474))))

(declare-fun b!245253 () Bool)

(declare-fun lt!382475 () (_ BitVec 64))

(assert (=> b!245253 (= e!169940 (bvsle lt!382474 (bvmul lt!382475 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245253 (or (= lt!382475 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382475 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382475)))))

(assert (=> b!245253 (= lt!382475 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))))))

(assert (= (and d!82258 res!205050) b!245252))

(assert (= (and b!245252 res!205049) b!245253))

(declare-fun m!369845 () Bool)

(assert (=> d!82258 m!369845))

(declare-fun m!369847 () Bool)

(assert (=> d!82258 m!369847))

(assert (=> b!245063 d!82258))

(declare-fun d!82280 () Bool)

(declare-fun e!169942 () Bool)

(assert (=> d!82280 e!169942))

(declare-fun res!205053 () Bool)

(assert (=> d!82280 (=> (not res!205053) (not e!169942))))

(declare-fun lt!382481 () (_ BitVec 64))

(declare-fun lt!382483 () (_ BitVec 64))

(declare-fun lt!382479 () (_ BitVec 64))

(assert (=> d!82280 (= res!205053 (= lt!382481 (bvsub lt!382479 lt!382483)))))

(assert (=> d!82280 (or (= (bvand lt!382479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382479 lt!382483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82280 (= lt!382483 (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382081)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081)))))))

(declare-fun lt!382480 () (_ BitVec 64))

(declare-fun lt!382484 () (_ BitVec 64))

(assert (=> d!82280 (= lt!382479 (bvmul lt!382480 lt!382484))))

(assert (=> d!82280 (or (= lt!382480 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382484 (bvsdiv (bvmul lt!382480 lt!382484) lt!382480)))))

(assert (=> d!82280 (= lt!382484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82280 (= lt!382480 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382081)))))))

(assert (=> d!82280 (= lt!382481 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081)))))))

(assert (=> d!82280 (invariant!0 (currentBit!11731 (_2!11437 lt!382081)) (currentByte!11736 (_2!11437 lt!382081)) (size!5877 (buf!6352 (_2!11437 lt!382081))))))

(assert (=> d!82280 (= (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081))) lt!382481)))

(declare-fun b!245255 () Bool)

(declare-fun res!205052 () Bool)

(assert (=> b!245255 (=> (not res!205052) (not e!169942))))

(assert (=> b!245255 (= res!205052 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382481))))

(declare-fun b!245256 () Bool)

(declare-fun lt!382482 () (_ BitVec 64))

(assert (=> b!245256 (= e!169942 (bvsle lt!382481 (bvmul lt!382482 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245256 (or (= lt!382482 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382482 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382482)))))

(assert (=> b!245256 (= lt!382482 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382081)))))))

(assert (= (and d!82280 res!205053) b!245255))

(assert (= (and b!245255 res!205052) b!245256))

(declare-fun m!369851 () Bool)

(assert (=> d!82280 m!369851))

(declare-fun m!369853 () Bool)

(assert (=> d!82280 m!369853))

(assert (=> b!245063 d!82280))

(declare-fun d!82284 () Bool)

(declare-fun e!169956 () Bool)

(assert (=> d!82284 e!169956))

(declare-fun res!205074 () Bool)

(assert (=> d!82284 (=> (not res!205074) (not e!169956))))

(declare-fun lt!382520 () tuple2!21034)

(declare-fun lt!382521 () tuple2!21034)

(assert (=> d!82284 (= res!205074 (= (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382520))) (currentByte!11736 (_1!11439 lt!382520)) (currentBit!11731 (_1!11439 lt!382520))) (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382521))) (currentByte!11736 (_1!11439 lt!382521)) (currentBit!11731 (_1!11439 lt!382521)))))))

(declare-fun lt!382518 () BitStream!10676)

(declare-fun lt!382519 () Unit!17855)

(declare-fun choose!50 (BitStream!10676 BitStream!10676 BitStream!10676 tuple2!21034 tuple2!21034 BitStream!10676 Bool tuple2!21034 tuple2!21034 BitStream!10676 Bool) Unit!17855)

(assert (=> d!82284 (= lt!382519 (choose!50 lt!382077 (_2!11437 lt!382066) lt!382518 lt!382520 (tuple2!21035 (_1!11439 lt!382520) (_2!11439 lt!382520)) (_1!11439 lt!382520) (_2!11439 lt!382520) lt!382521 (tuple2!21035 (_1!11439 lt!382521) (_2!11439 lt!382521)) (_1!11439 lt!382521) (_2!11439 lt!382521)))))

(assert (=> d!82284 (= lt!382521 (readBitPure!0 lt!382518))))

(assert (=> d!82284 (= lt!382520 (readBitPure!0 lt!382077))))

(assert (=> d!82284 (= lt!382518 (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 lt!382077) (currentBit!11731 lt!382077)))))

(assert (=> d!82284 (invariant!0 (currentBit!11731 lt!382077) (currentByte!11736 lt!382077) (size!5877 (buf!6352 (_2!11437 lt!382066))))))

(assert (=> d!82284 (= (readBitPrefixLemma!0 lt!382077 (_2!11437 lt!382066)) lt!382519)))

(declare-fun b!245276 () Bool)

(assert (=> b!245276 (= e!169956 (= (_2!11439 lt!382520) (_2!11439 lt!382521)))))

(assert (= (and d!82284 res!205074) b!245276))

(assert (=> d!82284 m!369505))

(declare-fun m!369875 () Bool)

(assert (=> d!82284 m!369875))

(declare-fun m!369877 () Bool)

(assert (=> d!82284 m!369877))

(declare-fun m!369879 () Bool)

(assert (=> d!82284 m!369879))

(declare-fun m!369881 () Bool)

(assert (=> d!82284 m!369881))

(declare-fun m!369883 () Bool)

(assert (=> d!82284 m!369883))

(assert (=> b!245074 d!82284))

(declare-fun d!82304 () Bool)

(declare-fun e!169957 () Bool)

(assert (=> d!82304 e!169957))

(declare-fun res!205076 () Bool)

(assert (=> d!82304 (=> (not res!205076) (not e!169957))))

(declare-fun lt!382526 () (_ BitVec 64))

(declare-fun lt!382524 () (_ BitVec 64))

(declare-fun lt!382522 () (_ BitVec 64))

(assert (=> d!82304 (= res!205076 (= lt!382524 (bvsub lt!382522 lt!382526)))))

(assert (=> d!82304 (or (= (bvand lt!382522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382522 lt!382526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82304 (= lt!382526 (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382069)))) ((_ sign_extend 32) (currentByte!11736 (_1!11439 lt!382069))) ((_ sign_extend 32) (currentBit!11731 (_1!11439 lt!382069)))))))

(declare-fun lt!382523 () (_ BitVec 64))

(declare-fun lt!382527 () (_ BitVec 64))

(assert (=> d!82304 (= lt!382522 (bvmul lt!382523 lt!382527))))

(assert (=> d!82304 (or (= lt!382523 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382527 (bvsdiv (bvmul lt!382523 lt!382527) lt!382523)))))

(assert (=> d!82304 (= lt!382527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82304 (= lt!382523 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382069)))))))

(assert (=> d!82304 (= lt!382524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11736 (_1!11439 lt!382069))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11731 (_1!11439 lt!382069)))))))

(assert (=> d!82304 (invariant!0 (currentBit!11731 (_1!11439 lt!382069)) (currentByte!11736 (_1!11439 lt!382069)) (size!5877 (buf!6352 (_1!11439 lt!382069))))))

(assert (=> d!82304 (= (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382069))) (currentByte!11736 (_1!11439 lt!382069)) (currentBit!11731 (_1!11439 lt!382069))) lt!382524)))

(declare-fun b!245277 () Bool)

(declare-fun res!205075 () Bool)

(assert (=> b!245277 (=> (not res!205075) (not e!169957))))

(assert (=> b!245277 (= res!205075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382524))))

(declare-fun b!245278 () Bool)

(declare-fun lt!382525 () (_ BitVec 64))

(assert (=> b!245278 (= e!169957 (bvsle lt!382524 (bvmul lt!382525 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245278 (or (= lt!382525 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382525 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382525)))))

(assert (=> b!245278 (= lt!382525 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382069)))))))

(assert (= (and d!82304 res!205076) b!245277))

(assert (= (and b!245277 res!205075) b!245278))

(declare-fun m!369885 () Bool)

(assert (=> d!82304 m!369885))

(declare-fun m!369887 () Bool)

(assert (=> d!82304 m!369887))

(assert (=> b!245074 d!82304))

(declare-fun b!245289 () Bool)

(declare-fun e!169962 () Bool)

(declare-fun lt!382549 () tuple2!21034)

(declare-fun lt!382545 () tuple2!21032)

(assert (=> b!245289 (= e!169962 (and (_2!11439 lt!382549) (= (_1!11439 lt!382549) (_2!11438 lt!382545))))))

(assert (=> b!245289 (= lt!382549 (checkBitsLoopPure!0 (_1!11438 lt!382545) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!382550 () Unit!17855)

(declare-fun lt!382551 () Unit!17855)

(assert (=> b!245289 (= lt!382550 lt!382551)))

(declare-fun lt!382548 () tuple2!21030)

(declare-fun lt!382546 () (_ BitVec 64))

(assert (=> b!245289 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382548)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382546)))

(assert (=> b!245289 (= lt!382551 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11437 lt!382081) (buf!6352 (_2!11437 lt!382548)) lt!382546))))

(declare-fun e!169963 () Bool)

(assert (=> b!245289 e!169963))

(declare-fun res!205085 () Bool)

(assert (=> b!245289 (=> (not res!205085) (not e!169963))))

(assert (=> b!245289 (= res!205085 (and (= (size!5877 (buf!6352 (_2!11437 lt!382081))) (size!5877 (buf!6352 (_2!11437 lt!382548)))) (bvsge lt!382546 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245289 (= lt!382546 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245289 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245289 (= lt!382545 (reader!0 (_2!11437 lt!382081) (_2!11437 lt!382548)))))

(declare-fun b!245290 () Bool)

(assert (=> b!245290 (= e!169963 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382081)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382546))))

(declare-fun b!245288 () Bool)

(declare-fun res!205086 () Bool)

(assert (=> b!245288 (=> (not res!205086) (not e!169962))))

(assert (=> b!245288 (= res!205086 (isPrefixOf!0 (_2!11437 lt!382081) (_2!11437 lt!382548)))))

(declare-fun b!245287 () Bool)

(declare-fun res!205087 () Bool)

(assert (=> b!245287 (=> (not res!205087) (not e!169962))))

(declare-fun lt!382547 () (_ BitVec 64))

(declare-fun lt!382544 () (_ BitVec 64))

(assert (=> b!245287 (= res!205087 (= (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382548))) (currentByte!11736 (_2!11437 lt!382548)) (currentBit!11731 (_2!11437 lt!382548))) (bvadd lt!382544 lt!382547)))))

(assert (=> b!245287 (or (not (= (bvand lt!382544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382547 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!382544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!382544 lt!382547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245287 (= lt!382547 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245287 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245287 (= lt!382544 (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081))))))

(declare-fun d!82306 () Bool)

(assert (=> d!82306 e!169962))

(declare-fun res!205088 () Bool)

(assert (=> d!82306 (=> (not res!205088) (not e!169962))))

(assert (=> d!82306 (= res!205088 (= (size!5877 (buf!6352 (_2!11437 lt!382081))) (size!5877 (buf!6352 (_2!11437 lt!382548)))))))

(declare-fun choose!51 (BitStream!10676 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21030)

(assert (=> d!82306 (= lt!382548 (choose!51 (_2!11437 lt!382081) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82306 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82306 (= (appendNBitsLoop!0 (_2!11437 lt!382081) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!382548)))

(assert (= (and d!82306 res!205088) b!245287))

(assert (= (and b!245287 res!205087) b!245288))

(assert (= (and b!245288 res!205086) b!245289))

(assert (= (and b!245289 res!205085) b!245290))

(declare-fun m!369889 () Bool)

(assert (=> b!245290 m!369889))

(declare-fun m!369891 () Bool)

(assert (=> d!82306 m!369891))

(declare-fun m!369893 () Bool)

(assert (=> b!245287 m!369893))

(assert (=> b!245287 m!369479))

(declare-fun m!369895 () Bool)

(assert (=> b!245288 m!369895))

(declare-fun m!369897 () Bool)

(assert (=> b!245289 m!369897))

(declare-fun m!369899 () Bool)

(assert (=> b!245289 m!369899))

(declare-fun m!369901 () Bool)

(assert (=> b!245289 m!369901))

(declare-fun m!369903 () Bool)

(assert (=> b!245289 m!369903))

(assert (=> b!245074 d!82306))

(declare-fun b!245302 () Bool)

(declare-fun e!169968 () Bool)

(declare-fun e!169969 () Bool)

(assert (=> b!245302 (= e!169968 e!169969)))

(declare-fun res!205100 () Bool)

(assert (=> b!245302 (=> (not res!205100) (not e!169969))))

(declare-fun lt!382560 () tuple2!21030)

(declare-fun lt!382562 () tuple2!21034)

(assert (=> b!245302 (= res!205100 (and (= (_2!11439 lt!382562) bit!26) (= (_1!11439 lt!382562) (_2!11437 lt!382560))))))

(assert (=> b!245302 (= lt!382562 (readBitPure!0 (readerFrom!0 (_2!11437 lt!382560) (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005))))))

(declare-fun b!245303 () Bool)

(assert (=> b!245303 (= e!169969 (= (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382562))) (currentByte!11736 (_1!11439 lt!382562)) (currentBit!11731 (_1!11439 lt!382562))) (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382560))) (currentByte!11736 (_2!11437 lt!382560)) (currentBit!11731 (_2!11437 lt!382560)))))))

(declare-fun b!245300 () Bool)

(declare-fun res!205097 () Bool)

(assert (=> b!245300 (=> (not res!205097) (not e!169968))))

(declare-fun lt!382563 () (_ BitVec 64))

(declare-fun lt!382561 () (_ BitVec 64))

(assert (=> b!245300 (= res!205097 (= (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382560))) (currentByte!11736 (_2!11437 lt!382560)) (currentBit!11731 (_2!11437 lt!382560))) (bvadd lt!382563 lt!382561)))))

(assert (=> b!245300 (or (not (= (bvand lt!382563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382561 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!382563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!382563 lt!382561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245300 (= lt!382561 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!245300 (= lt!382563 (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)))))

(declare-fun b!245301 () Bool)

(declare-fun res!205099 () Bool)

(assert (=> b!245301 (=> (not res!205099) (not e!169968))))

(assert (=> b!245301 (= res!205099 (isPrefixOf!0 thiss!1005 (_2!11437 lt!382560)))))

(declare-fun d!82308 () Bool)

(assert (=> d!82308 e!169968))

(declare-fun res!205098 () Bool)

(assert (=> d!82308 (=> (not res!205098) (not e!169968))))

(assert (=> d!82308 (= res!205098 (= (size!5877 (buf!6352 thiss!1005)) (size!5877 (buf!6352 (_2!11437 lt!382560)))))))

(declare-fun choose!16 (BitStream!10676 Bool) tuple2!21030)

(assert (=> d!82308 (= lt!382560 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82308 (validate_offset_bit!0 ((_ sign_extend 32) (size!5877 (buf!6352 thiss!1005))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005)))))

(assert (=> d!82308 (= (appendBit!0 thiss!1005 bit!26) lt!382560)))

(assert (= (and d!82308 res!205098) b!245300))

(assert (= (and b!245300 res!205097) b!245301))

(assert (= (and b!245301 res!205099) b!245302))

(assert (= (and b!245302 res!205100) b!245303))

(declare-fun m!369905 () Bool)

(assert (=> d!82308 m!369905))

(declare-fun m!369907 () Bool)

(assert (=> d!82308 m!369907))

(declare-fun m!369909 () Bool)

(assert (=> b!245303 m!369909))

(declare-fun m!369911 () Bool)

(assert (=> b!245303 m!369911))

(declare-fun m!369913 () Bool)

(assert (=> b!245302 m!369913))

(assert (=> b!245302 m!369913))

(declare-fun m!369915 () Bool)

(assert (=> b!245302 m!369915))

(declare-fun m!369917 () Bool)

(assert (=> b!245301 m!369917))

(assert (=> b!245300 m!369911))

(assert (=> b!245300 m!369481))

(assert (=> b!245074 d!82308))

(declare-fun d!82310 () Bool)

(assert (=> d!82310 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!382566 () Unit!17855)

(declare-fun choose!9 (BitStream!10676 array!13404 (_ BitVec 64) BitStream!10676) Unit!17855)

(assert (=> d!82310 (= lt!382566 (choose!9 thiss!1005 (buf!6352 (_2!11437 lt!382066)) (bvsub nBits!297 from!289) (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005))))))

(assert (=> d!82310 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6352 (_2!11437 lt!382066)) (bvsub nBits!297 from!289)) lt!382566)))

(declare-fun bs!20822 () Bool)

(assert (= bs!20822 d!82310))

(assert (=> bs!20822 m!369515))

(declare-fun m!369919 () Bool)

(assert (=> bs!20822 m!369919))

(assert (=> b!245074 d!82310))

(declare-fun d!82312 () Bool)

(declare-datatypes ((tuple2!21040 0))(
  ( (tuple2!21041 (_1!11442 Bool) (_2!11442 BitStream!10676)) )
))
(declare-fun lt!382569 () tuple2!21040)

(declare-fun checkBitsLoop!0 (BitStream!10676 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21040)

(assert (=> d!82312 (= lt!382569 (checkBitsLoop!0 (_1!11438 lt!382083) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82312 (= (checkBitsLoopPure!0 (_1!11438 lt!382083) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21035 (_2!11442 lt!382569) (_1!11442 lt!382569)))))

(declare-fun bs!20823 () Bool)

(assert (= bs!20823 d!82312))

(declare-fun m!369921 () Bool)

(assert (=> bs!20823 m!369921))

(assert (=> b!245074 d!82312))

(declare-fun d!82314 () Bool)

(declare-fun lt!382572 () tuple2!21040)

(declare-fun readBit!0 (BitStream!10676) tuple2!21040)

(assert (=> d!82314 (= lt!382572 (readBit!0 (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005))))))

(assert (=> d!82314 (= (readBitPure!0 (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005))) (tuple2!21035 (_2!11442 lt!382572) (_1!11442 lt!382572)))))

(declare-fun bs!20824 () Bool)

(assert (= bs!20824 d!82314))

(declare-fun m!369923 () Bool)

(assert (=> bs!20824 m!369923))

(assert (=> b!245074 d!82314))

(declare-fun d!82316 () Bool)

(assert (=> d!82316 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382064)))

(declare-fun lt!382573 () Unit!17855)

(assert (=> d!82316 (= lt!382573 (choose!9 (_2!11437 lt!382081) (buf!6352 (_2!11437 lt!382066)) lt!382064 (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081)))))))

(assert (=> d!82316 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11437 lt!382081) (buf!6352 (_2!11437 lt!382066)) lt!382064) lt!382573)))

(declare-fun bs!20825 () Bool)

(assert (= bs!20825 d!82316))

(assert (=> bs!20825 m!369521))

(declare-fun m!369925 () Bool)

(assert (=> bs!20825 m!369925))

(assert (=> b!245074 d!82316))

(declare-fun d!82318 () Bool)

(declare-fun lt!382574 () tuple2!21040)

(assert (=> d!82318 (= lt!382574 (readBit!0 lt!382077))))

(assert (=> d!82318 (= (readBitPure!0 lt!382077) (tuple2!21035 (_2!11442 lt!382574) (_1!11442 lt!382574)))))

(declare-fun bs!20826 () Bool)

(assert (= bs!20826 d!82318))

(declare-fun m!369927 () Bool)

(assert (=> bs!20826 m!369927))

(assert (=> b!245074 d!82318))

(declare-fun d!82320 () Bool)

(declare-fun lt!382575 () tuple2!21040)

(assert (=> d!82320 (= lt!382575 (readBit!0 (_1!11438 lt!382082)))))

(assert (=> d!82320 (= (readBitPure!0 (_1!11438 lt!382082)) (tuple2!21035 (_2!11442 lt!382575) (_1!11442 lt!382575)))))

(declare-fun bs!20827 () Bool)

(assert (= bs!20827 d!82320))

(declare-fun m!369929 () Bool)

(assert (=> bs!20827 m!369929))

(assert (=> b!245074 d!82320))

(declare-fun d!82322 () Bool)

(declare-fun lt!382576 () tuple2!21040)

(assert (=> d!82322 (= lt!382576 (checkBitsLoop!0 (_1!11438 lt!382082) nBits!297 bit!26 from!289))))

(assert (=> d!82322 (= (checkBitsLoopPure!0 (_1!11438 lt!382082) nBits!297 bit!26 from!289) (tuple2!21035 (_2!11442 lt!382576) (_1!11442 lt!382576)))))

(declare-fun bs!20828 () Bool)

(assert (= bs!20828 d!82322))

(declare-fun m!369931 () Bool)

(assert (=> bs!20828 m!369931))

(assert (=> b!245074 d!82322))

(declare-fun b!245314 () Bool)

(declare-fun res!205109 () Bool)

(declare-fun e!169974 () Bool)

(assert (=> b!245314 (=> (not res!205109) (not e!169974))))

(declare-fun lt!382623 () tuple2!21032)

(assert (=> b!245314 (= res!205109 (isPrefixOf!0 (_2!11438 lt!382623) (_2!11437 lt!382066)))))

(declare-fun b!245315 () Bool)

(declare-fun e!169975 () Unit!17855)

(declare-fun Unit!17861 () Unit!17855)

(assert (=> b!245315 (= e!169975 Unit!17861)))

(declare-fun b!245316 () Bool)

(declare-fun lt!382630 () Unit!17855)

(assert (=> b!245316 (= e!169975 lt!382630)))

(declare-fun lt!382631 () (_ BitVec 64))

(assert (=> b!245316 (= lt!382631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!382629 () (_ BitVec 64))

(assert (=> b!245316 (= lt!382629 (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13404 array!13404 (_ BitVec 64) (_ BitVec 64)) Unit!17855)

(assert (=> b!245316 (= lt!382630 (arrayBitRangesEqSymmetric!0 (buf!6352 thiss!1005) (buf!6352 (_2!11437 lt!382066)) lt!382631 lt!382629))))

(assert (=> b!245316 (arrayBitRangesEq!0 (buf!6352 (_2!11437 lt!382066)) (buf!6352 thiss!1005) lt!382631 lt!382629)))

(declare-fun b!245317 () Bool)

(declare-fun res!205107 () Bool)

(assert (=> b!245317 (=> (not res!205107) (not e!169974))))

(assert (=> b!245317 (= res!205107 (isPrefixOf!0 (_1!11438 lt!382623) thiss!1005))))

(declare-fun d!82324 () Bool)

(assert (=> d!82324 e!169974))

(declare-fun res!205108 () Bool)

(assert (=> d!82324 (=> (not res!205108) (not e!169974))))

(assert (=> d!82324 (= res!205108 (isPrefixOf!0 (_1!11438 lt!382623) (_2!11438 lt!382623)))))

(declare-fun lt!382625 () BitStream!10676)

(assert (=> d!82324 (= lt!382623 (tuple2!21033 lt!382625 (_2!11437 lt!382066)))))

(declare-fun lt!382633 () Unit!17855)

(declare-fun lt!382617 () Unit!17855)

(assert (=> d!82324 (= lt!382633 lt!382617)))

(assert (=> d!82324 (isPrefixOf!0 lt!382625 (_2!11437 lt!382066))))

(assert (=> d!82324 (= lt!382617 (lemmaIsPrefixTransitive!0 lt!382625 (_2!11437 lt!382066) (_2!11437 lt!382066)))))

(declare-fun lt!382628 () Unit!17855)

(declare-fun lt!382634 () Unit!17855)

(assert (=> d!82324 (= lt!382628 lt!382634)))

(assert (=> d!82324 (isPrefixOf!0 lt!382625 (_2!11437 lt!382066))))

(assert (=> d!82324 (= lt!382634 (lemmaIsPrefixTransitive!0 lt!382625 thiss!1005 (_2!11437 lt!382066)))))

(declare-fun lt!382624 () Unit!17855)

(assert (=> d!82324 (= lt!382624 e!169975)))

(declare-fun c!11487 () Bool)

(assert (=> d!82324 (= c!11487 (not (= (size!5877 (buf!6352 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!382622 () Unit!17855)

(declare-fun lt!382618 () Unit!17855)

(assert (=> d!82324 (= lt!382622 lt!382618)))

(assert (=> d!82324 (isPrefixOf!0 (_2!11437 lt!382066) (_2!11437 lt!382066))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10676) Unit!17855)

(assert (=> d!82324 (= lt!382618 (lemmaIsPrefixRefl!0 (_2!11437 lt!382066)))))

(declare-fun lt!382636 () Unit!17855)

(declare-fun lt!382621 () Unit!17855)

(assert (=> d!82324 (= lt!382636 lt!382621)))

(assert (=> d!82324 (= lt!382621 (lemmaIsPrefixRefl!0 (_2!11437 lt!382066)))))

(declare-fun lt!382632 () Unit!17855)

(declare-fun lt!382619 () Unit!17855)

(assert (=> d!82324 (= lt!382632 lt!382619)))

(assert (=> d!82324 (isPrefixOf!0 lt!382625 lt!382625)))

(assert (=> d!82324 (= lt!382619 (lemmaIsPrefixRefl!0 lt!382625))))

(declare-fun lt!382626 () Unit!17855)

(declare-fun lt!382627 () Unit!17855)

(assert (=> d!82324 (= lt!382626 lt!382627)))

(assert (=> d!82324 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82324 (= lt!382627 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82324 (= lt!382625 (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)))))

(assert (=> d!82324 (isPrefixOf!0 thiss!1005 (_2!11437 lt!382066))))

(assert (=> d!82324 (= (reader!0 thiss!1005 (_2!11437 lt!382066)) lt!382623)))

(declare-fun b!245318 () Bool)

(declare-fun lt!382635 () (_ BitVec 64))

(declare-fun lt!382620 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10676 (_ BitVec 64)) BitStream!10676)

(assert (=> b!245318 (= e!169974 (= (_1!11438 lt!382623) (withMovedBitIndex!0 (_2!11438 lt!382623) (bvsub lt!382620 lt!382635))))))

(assert (=> b!245318 (or (= (bvand lt!382620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382620 lt!382635) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245318 (= lt!382635 (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382066))) (currentByte!11736 (_2!11437 lt!382066)) (currentBit!11731 (_2!11437 lt!382066))))))

(assert (=> b!245318 (= lt!382620 (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)))))

(assert (= (and d!82324 c!11487) b!245316))

(assert (= (and d!82324 (not c!11487)) b!245315))

(assert (= (and d!82324 res!205108) b!245317))

(assert (= (and b!245317 res!205107) b!245314))

(assert (= (and b!245314 res!205109) b!245318))

(declare-fun m!369933 () Bool)

(assert (=> b!245314 m!369933))

(declare-fun m!369935 () Bool)

(assert (=> b!245318 m!369935))

(assert (=> b!245318 m!369541))

(assert (=> b!245318 m!369481))

(declare-fun m!369937 () Bool)

(assert (=> d!82324 m!369937))

(declare-fun m!369939 () Bool)

(assert (=> d!82324 m!369939))

(declare-fun m!369941 () Bool)

(assert (=> d!82324 m!369941))

(declare-fun m!369943 () Bool)

(assert (=> d!82324 m!369943))

(declare-fun m!369945 () Bool)

(assert (=> d!82324 m!369945))

(declare-fun m!369947 () Bool)

(assert (=> d!82324 m!369947))

(declare-fun m!369949 () Bool)

(assert (=> d!82324 m!369949))

(declare-fun m!369951 () Bool)

(assert (=> d!82324 m!369951))

(declare-fun m!369953 () Bool)

(assert (=> d!82324 m!369953))

(assert (=> d!82324 m!369485))

(declare-fun m!369955 () Bool)

(assert (=> d!82324 m!369955))

(declare-fun m!369957 () Bool)

(assert (=> b!245317 m!369957))

(assert (=> b!245316 m!369481))

(declare-fun m!369959 () Bool)

(assert (=> b!245316 m!369959))

(declare-fun m!369961 () Bool)

(assert (=> b!245316 m!369961))

(assert (=> b!245074 d!82324))

(declare-fun d!82326 () Bool)

(assert (=> d!82326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382064) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081)))) lt!382064))))

(declare-fun bs!20829 () Bool)

(assert (= bs!20829 d!82326))

(declare-fun m!369963 () Bool)

(assert (=> bs!20829 m!369963))

(assert (=> b!245074 d!82326))

(declare-fun d!82328 () Bool)

(declare-fun e!169976 () Bool)

(assert (=> d!82328 e!169976))

(declare-fun res!205111 () Bool)

(assert (=> d!82328 (=> (not res!205111) (not e!169976))))

(declare-fun lt!382641 () (_ BitVec 64))

(declare-fun lt!382637 () (_ BitVec 64))

(declare-fun lt!382639 () (_ BitVec 64))

(assert (=> d!82328 (= res!205111 (= lt!382639 (bvsub lt!382637 lt!382641)))))

(assert (=> d!82328 (or (= (bvand lt!382637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382641 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382637 lt!382641) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82328 (= lt!382641 (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382080)))) ((_ sign_extend 32) (currentByte!11736 (_1!11439 lt!382080))) ((_ sign_extend 32) (currentBit!11731 (_1!11439 lt!382080)))))))

(declare-fun lt!382638 () (_ BitVec 64))

(declare-fun lt!382642 () (_ BitVec 64))

(assert (=> d!82328 (= lt!382637 (bvmul lt!382638 lt!382642))))

(assert (=> d!82328 (or (= lt!382638 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382642 (bvsdiv (bvmul lt!382638 lt!382642) lt!382638)))))

(assert (=> d!82328 (= lt!382642 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82328 (= lt!382638 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382080)))))))

(assert (=> d!82328 (= lt!382639 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11736 (_1!11439 lt!382080))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11731 (_1!11439 lt!382080)))))))

(assert (=> d!82328 (invariant!0 (currentBit!11731 (_1!11439 lt!382080)) (currentByte!11736 (_1!11439 lt!382080)) (size!5877 (buf!6352 (_1!11439 lt!382080))))))

(assert (=> d!82328 (= (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382080))) (currentByte!11736 (_1!11439 lt!382080)) (currentBit!11731 (_1!11439 lt!382080))) lt!382639)))

(declare-fun b!245319 () Bool)

(declare-fun res!205110 () Bool)

(assert (=> b!245319 (=> (not res!205110) (not e!169976))))

(assert (=> b!245319 (= res!205110 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382639))))

(declare-fun b!245320 () Bool)

(declare-fun lt!382640 () (_ BitVec 64))

(assert (=> b!245320 (= e!169976 (bvsle lt!382639 (bvmul lt!382640 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245320 (or (= lt!382640 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382640 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382640)))))

(assert (=> b!245320 (= lt!382640 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382080)))))))

(assert (= (and d!82328 res!205111) b!245319))

(assert (= (and b!245319 res!205110) b!245320))

(declare-fun m!369965 () Bool)

(assert (=> d!82328 m!369965))

(declare-fun m!369967 () Bool)

(assert (=> d!82328 m!369967))

(assert (=> b!245074 d!82328))

(declare-fun d!82330 () Bool)

(assert (=> d!82330 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382081)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382064) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382081)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081)))) lt!382064))))

(declare-fun bs!20830 () Bool)

(assert (= bs!20830 d!82330))

(assert (=> bs!20830 m!369851))

(assert (=> b!245074 d!82330))

(declare-fun d!82332 () Bool)

(assert (=> d!82332 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20831 () Bool)

(assert (= bs!20831 d!82332))

(declare-fun m!369969 () Bool)

(assert (=> bs!20831 m!369969))

(assert (=> b!245074 d!82332))

(declare-fun d!82334 () Bool)

(declare-fun res!205112 () Bool)

(declare-fun e!169977 () Bool)

(assert (=> d!82334 (=> (not res!205112) (not e!169977))))

(assert (=> d!82334 (= res!205112 (= (size!5877 (buf!6352 thiss!1005)) (size!5877 (buf!6352 (_2!11437 lt!382066)))))))

(assert (=> d!82334 (= (isPrefixOf!0 thiss!1005 (_2!11437 lt!382066)) e!169977)))

(declare-fun b!245321 () Bool)

(declare-fun res!205113 () Bool)

(assert (=> b!245321 (=> (not res!205113) (not e!169977))))

(assert (=> b!245321 (= res!205113 (bvsle (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)) (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382066))) (currentByte!11736 (_2!11437 lt!382066)) (currentBit!11731 (_2!11437 lt!382066)))))))

(declare-fun b!245322 () Bool)

(declare-fun e!169978 () Bool)

(assert (=> b!245322 (= e!169977 e!169978)))

(declare-fun res!205114 () Bool)

(assert (=> b!245322 (=> res!205114 e!169978)))

(assert (=> b!245322 (= res!205114 (= (size!5877 (buf!6352 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!245323 () Bool)

(assert (=> b!245323 (= e!169978 (arrayBitRangesEq!0 (buf!6352 thiss!1005) (buf!6352 (_2!11437 lt!382066)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005))))))

(assert (= (and d!82334 res!205112) b!245321))

(assert (= (and b!245321 res!205113) b!245322))

(assert (= (and b!245322 (not res!205114)) b!245323))

(assert (=> b!245321 m!369481))

(assert (=> b!245321 m!369541))

(assert (=> b!245323 m!369481))

(assert (=> b!245323 m!369481))

(declare-fun m!369971 () Bool)

(assert (=> b!245323 m!369971))

(assert (=> b!245074 d!82334))

(declare-fun b!245324 () Bool)

(declare-fun res!205117 () Bool)

(declare-fun e!169979 () Bool)

(assert (=> b!245324 (=> (not res!205117) (not e!169979))))

(declare-fun lt!382649 () tuple2!21032)

(assert (=> b!245324 (= res!205117 (isPrefixOf!0 (_2!11438 lt!382649) (_2!11437 lt!382066)))))

(declare-fun b!245325 () Bool)

(declare-fun e!169980 () Unit!17855)

(declare-fun Unit!17862 () Unit!17855)

(assert (=> b!245325 (= e!169980 Unit!17862)))

(declare-fun b!245326 () Bool)

(declare-fun lt!382656 () Unit!17855)

(assert (=> b!245326 (= e!169980 lt!382656)))

(declare-fun lt!382657 () (_ BitVec 64))

(assert (=> b!245326 (= lt!382657 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!382655 () (_ BitVec 64))

(assert (=> b!245326 (= lt!382655 (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081))))))

(assert (=> b!245326 (= lt!382656 (arrayBitRangesEqSymmetric!0 (buf!6352 (_2!11437 lt!382081)) (buf!6352 (_2!11437 lt!382066)) lt!382657 lt!382655))))

(assert (=> b!245326 (arrayBitRangesEq!0 (buf!6352 (_2!11437 lt!382066)) (buf!6352 (_2!11437 lt!382081)) lt!382657 lt!382655)))

(declare-fun b!245327 () Bool)

(declare-fun res!205115 () Bool)

(assert (=> b!245327 (=> (not res!205115) (not e!169979))))

(assert (=> b!245327 (= res!205115 (isPrefixOf!0 (_1!11438 lt!382649) (_2!11437 lt!382081)))))

(declare-fun d!82336 () Bool)

(assert (=> d!82336 e!169979))

(declare-fun res!205116 () Bool)

(assert (=> d!82336 (=> (not res!205116) (not e!169979))))

(assert (=> d!82336 (= res!205116 (isPrefixOf!0 (_1!11438 lt!382649) (_2!11438 lt!382649)))))

(declare-fun lt!382651 () BitStream!10676)

(assert (=> d!82336 (= lt!382649 (tuple2!21033 lt!382651 (_2!11437 lt!382066)))))

(declare-fun lt!382659 () Unit!17855)

(declare-fun lt!382643 () Unit!17855)

(assert (=> d!82336 (= lt!382659 lt!382643)))

(assert (=> d!82336 (isPrefixOf!0 lt!382651 (_2!11437 lt!382066))))

(assert (=> d!82336 (= lt!382643 (lemmaIsPrefixTransitive!0 lt!382651 (_2!11437 lt!382066) (_2!11437 lt!382066)))))

(declare-fun lt!382654 () Unit!17855)

(declare-fun lt!382660 () Unit!17855)

(assert (=> d!82336 (= lt!382654 lt!382660)))

(assert (=> d!82336 (isPrefixOf!0 lt!382651 (_2!11437 lt!382066))))

(assert (=> d!82336 (= lt!382660 (lemmaIsPrefixTransitive!0 lt!382651 (_2!11437 lt!382081) (_2!11437 lt!382066)))))

(declare-fun lt!382650 () Unit!17855)

(assert (=> d!82336 (= lt!382650 e!169980)))

(declare-fun c!11488 () Bool)

(assert (=> d!82336 (= c!11488 (not (= (size!5877 (buf!6352 (_2!11437 lt!382081))) #b00000000000000000000000000000000)))))

(declare-fun lt!382648 () Unit!17855)

(declare-fun lt!382644 () Unit!17855)

(assert (=> d!82336 (= lt!382648 lt!382644)))

(assert (=> d!82336 (isPrefixOf!0 (_2!11437 lt!382066) (_2!11437 lt!382066))))

(assert (=> d!82336 (= lt!382644 (lemmaIsPrefixRefl!0 (_2!11437 lt!382066)))))

(declare-fun lt!382662 () Unit!17855)

(declare-fun lt!382647 () Unit!17855)

(assert (=> d!82336 (= lt!382662 lt!382647)))

(assert (=> d!82336 (= lt!382647 (lemmaIsPrefixRefl!0 (_2!11437 lt!382066)))))

(declare-fun lt!382658 () Unit!17855)

(declare-fun lt!382645 () Unit!17855)

(assert (=> d!82336 (= lt!382658 lt!382645)))

(assert (=> d!82336 (isPrefixOf!0 lt!382651 lt!382651)))

(assert (=> d!82336 (= lt!382645 (lemmaIsPrefixRefl!0 lt!382651))))

(declare-fun lt!382652 () Unit!17855)

(declare-fun lt!382653 () Unit!17855)

(assert (=> d!82336 (= lt!382652 lt!382653)))

(assert (=> d!82336 (isPrefixOf!0 (_2!11437 lt!382081) (_2!11437 lt!382081))))

(assert (=> d!82336 (= lt!382653 (lemmaIsPrefixRefl!0 (_2!11437 lt!382081)))))

(assert (=> d!82336 (= lt!382651 (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081))))))

(assert (=> d!82336 (isPrefixOf!0 (_2!11437 lt!382081) (_2!11437 lt!382066))))

(assert (=> d!82336 (= (reader!0 (_2!11437 lt!382081) (_2!11437 lt!382066)) lt!382649)))

(declare-fun lt!382646 () (_ BitVec 64))

(declare-fun b!245328 () Bool)

(declare-fun lt!382661 () (_ BitVec 64))

(assert (=> b!245328 (= e!169979 (= (_1!11438 lt!382649) (withMovedBitIndex!0 (_2!11438 lt!382649) (bvsub lt!382646 lt!382661))))))

(assert (=> b!245328 (or (= (bvand lt!382646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382661 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382646 lt!382661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!245328 (= lt!382661 (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382066))) (currentByte!11736 (_2!11437 lt!382066)) (currentBit!11731 (_2!11437 lt!382066))))))

(assert (=> b!245328 (= lt!382646 (bitIndex!0 (size!5877 (buf!6352 (_2!11437 lt!382081))) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081))))))

(assert (= (and d!82336 c!11488) b!245326))

(assert (= (and d!82336 (not c!11488)) b!245325))

(assert (= (and d!82336 res!205116) b!245327))

(assert (= (and b!245327 res!205115) b!245324))

(assert (= (and b!245324 res!205117) b!245328))

(declare-fun m!369973 () Bool)

(assert (=> b!245324 m!369973))

(declare-fun m!369975 () Bool)

(assert (=> b!245328 m!369975))

(assert (=> b!245328 m!369541))

(assert (=> b!245328 m!369479))

(declare-fun m!369977 () Bool)

(assert (=> d!82336 m!369977))

(declare-fun m!369979 () Bool)

(assert (=> d!82336 m!369979))

(declare-fun m!369981 () Bool)

(assert (=> d!82336 m!369981))

(assert (=> d!82336 m!369943))

(declare-fun m!369983 () Bool)

(assert (=> d!82336 m!369983))

(declare-fun m!369985 () Bool)

(assert (=> d!82336 m!369985))

(declare-fun m!369987 () Bool)

(assert (=> d!82336 m!369987))

(declare-fun m!369989 () Bool)

(assert (=> d!82336 m!369989))

(assert (=> d!82336 m!369953))

(assert (=> d!82336 m!369475))

(declare-fun m!369991 () Bool)

(assert (=> d!82336 m!369991))

(declare-fun m!369993 () Bool)

(assert (=> b!245327 m!369993))

(assert (=> b!245326 m!369479))

(declare-fun m!369995 () Bool)

(assert (=> b!245326 m!369995))

(declare-fun m!369997 () Bool)

(assert (=> b!245326 m!369997))

(assert (=> b!245074 d!82336))

(declare-fun d!82338 () Bool)

(assert (=> d!82338 (isPrefixOf!0 thiss!1005 (_2!11437 lt!382066))))

(declare-fun lt!382665 () Unit!17855)

(declare-fun choose!30 (BitStream!10676 BitStream!10676 BitStream!10676) Unit!17855)

(assert (=> d!82338 (= lt!382665 (choose!30 thiss!1005 (_2!11437 lt!382081) (_2!11437 lt!382066)))))

(assert (=> d!82338 (isPrefixOf!0 thiss!1005 (_2!11437 lt!382081))))

(assert (=> d!82338 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11437 lt!382081) (_2!11437 lt!382066)) lt!382665)))

(declare-fun bs!20832 () Bool)

(assert (= bs!20832 d!82338))

(assert (=> bs!20832 m!369485))

(declare-fun m!369999 () Bool)

(assert (=> bs!20832 m!369999))

(assert (=> bs!20832 m!369533))

(assert (=> b!245074 d!82338))

(declare-fun d!82340 () Bool)

(declare-fun e!169983 () Bool)

(assert (=> d!82340 e!169983))

(declare-fun res!205120 () Bool)

(assert (=> d!82340 (=> (not res!205120) (not e!169983))))

(assert (=> d!82340 (= res!205120 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!382668 () Unit!17855)

(declare-fun choose!27 (BitStream!10676 BitStream!10676 (_ BitVec 64) (_ BitVec 64)) Unit!17855)

(assert (=> d!82340 (= lt!382668 (choose!27 thiss!1005 (_2!11437 lt!382081) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82340 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11437 lt!382081) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!382668)))

(declare-fun b!245331 () Bool)

(assert (=> b!245331 (= e!169983 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382081)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82340 res!205120) b!245331))

(declare-fun m!370001 () Bool)

(assert (=> d!82340 m!370001))

(declare-fun m!370003 () Bool)

(assert (=> b!245331 m!370003))

(assert (=> b!245074 d!82340))

(declare-fun d!82342 () Bool)

(assert (=> d!82342 (= (invariant!0 (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382081)))) (and (bvsge (currentBit!11731 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11731 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11736 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382081)))) (and (= (currentBit!11731 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382081))))))))))

(assert (=> b!245061 d!82342))

(declare-fun d!82344 () Bool)

(declare-fun lt!382669 () tuple2!21040)

(assert (=> d!82344 (= lt!382669 (readBit!0 (readerFrom!0 (_2!11437 lt!382081) (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005))))))

(assert (=> d!82344 (= (readBitPure!0 (readerFrom!0 (_2!11437 lt!382081) (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005))) (tuple2!21035 (_2!11442 lt!382669) (_1!11442 lt!382669)))))

(declare-fun bs!20833 () Bool)

(assert (= bs!20833 d!82344))

(assert (=> bs!20833 m!369537))

(declare-fun m!370005 () Bool)

(assert (=> bs!20833 m!370005))

(assert (=> b!245072 d!82344))

(declare-fun d!82346 () Bool)

(declare-fun e!169986 () Bool)

(assert (=> d!82346 e!169986))

(declare-fun res!205124 () Bool)

(assert (=> d!82346 (=> (not res!205124) (not e!169986))))

(assert (=> d!82346 (= res!205124 (invariant!0 (currentBit!11731 (_2!11437 lt!382081)) (currentByte!11736 (_2!11437 lt!382081)) (size!5877 (buf!6352 (_2!11437 lt!382081)))))))

(assert (=> d!82346 (= (readerFrom!0 (_2!11437 lt!382081) (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005)) (BitStream!10677 (buf!6352 (_2!11437 lt!382081)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)))))

(declare-fun b!245334 () Bool)

(assert (=> b!245334 (= e!169986 (invariant!0 (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382081)))))))

(assert (= (and d!82346 res!205124) b!245334))

(assert (=> d!82346 m!369853))

(assert (=> b!245334 m!369543))

(assert (=> b!245072 d!82346))

(declare-fun d!82348 () Bool)

(assert (=> d!82348 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005) (size!5877 (buf!6352 thiss!1005))))))

(declare-fun bs!20834 () Bool)

(assert (= bs!20834 d!82348))

(declare-fun m!370007 () Bool)

(assert (=> bs!20834 m!370007))

(assert (=> start!52878 d!82348))

(declare-fun d!82350 () Bool)

(declare-fun res!205127 () Bool)

(declare-fun e!169989 () Bool)

(assert (=> d!82350 (=> (not res!205127) (not e!169989))))

(assert (=> d!82350 (= res!205127 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11438 lt!382082))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11438 lt!382082))))))))))

(assert (=> d!82350 (= (moveBitIndexPrecond!0 (_1!11438 lt!382082) #b0000000000000000000000000000000000000000000000000000000000000001) e!169989)))

(declare-fun b!245338 () Bool)

(declare-fun lt!382672 () (_ BitVec 64))

(assert (=> b!245338 (= e!169989 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382672) (bvsle lt!382672 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11438 lt!382082))))))))))

(assert (=> b!245338 (= lt!382672 (bvadd (bitIndex!0 (size!5877 (buf!6352 (_1!11438 lt!382082))) (currentByte!11736 (_1!11438 lt!382082)) (currentBit!11731 (_1!11438 lt!382082))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!82350 res!205127) b!245338))

(declare-fun m!370009 () Bool)

(assert (=> b!245338 m!370009))

(assert (=> b!245062 d!82350))

(declare-fun d!82352 () Bool)

(declare-fun e!169990 () Bool)

(assert (=> d!82352 e!169990))

(declare-fun res!205129 () Bool)

(assert (=> d!82352 (=> (not res!205129) (not e!169990))))

(declare-fun lt!382677 () (_ BitVec 64))

(declare-fun lt!382673 () (_ BitVec 64))

(declare-fun lt!382675 () (_ BitVec 64))

(assert (=> d!82352 (= res!205129 (= lt!382675 (bvsub lt!382673 lt!382677)))))

(assert (=> d!82352 (or (= (bvand lt!382673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382677 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382673 lt!382677) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82352 (= lt!382677 (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382072)))) ((_ sign_extend 32) (currentByte!11736 (_1!11439 lt!382072))) ((_ sign_extend 32) (currentBit!11731 (_1!11439 lt!382072)))))))

(declare-fun lt!382674 () (_ BitVec 64))

(declare-fun lt!382678 () (_ BitVec 64))

(assert (=> d!82352 (= lt!382673 (bvmul lt!382674 lt!382678))))

(assert (=> d!82352 (or (= lt!382674 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382678 (bvsdiv (bvmul lt!382674 lt!382678) lt!382674)))))

(assert (=> d!82352 (= lt!382678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82352 (= lt!382674 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382072)))))))

(assert (=> d!82352 (= lt!382675 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11736 (_1!11439 lt!382072))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11731 (_1!11439 lt!382072)))))))

(assert (=> d!82352 (invariant!0 (currentBit!11731 (_1!11439 lt!382072)) (currentByte!11736 (_1!11439 lt!382072)) (size!5877 (buf!6352 (_1!11439 lt!382072))))))

(assert (=> d!82352 (= (bitIndex!0 (size!5877 (buf!6352 (_1!11439 lt!382072))) (currentByte!11736 (_1!11439 lt!382072)) (currentBit!11731 (_1!11439 lt!382072))) lt!382675)))

(declare-fun b!245339 () Bool)

(declare-fun res!205128 () Bool)

(assert (=> b!245339 (=> (not res!205128) (not e!169990))))

(assert (=> b!245339 (= res!205128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382675))))

(declare-fun b!245340 () Bool)

(declare-fun lt!382676 () (_ BitVec 64))

(assert (=> b!245340 (= e!169990 (bvsle lt!382675 (bvmul lt!382676 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245340 (or (= lt!382676 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382676 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382676)))))

(assert (=> b!245340 (= lt!382676 ((_ sign_extend 32) (size!5877 (buf!6352 (_1!11439 lt!382072)))))))

(assert (= (and d!82352 res!205129) b!245339))

(assert (= (and b!245339 res!205128) b!245340))

(declare-fun m!370011 () Bool)

(assert (=> d!82352 m!370011))

(declare-fun m!370013 () Bool)

(assert (=> d!82352 m!370013))

(assert (=> b!245071 d!82352))

(assert (=> b!245070 d!82280))

(declare-fun d!82354 () Bool)

(declare-fun e!169991 () Bool)

(assert (=> d!82354 e!169991))

(declare-fun res!205131 () Bool)

(assert (=> d!82354 (=> (not res!205131) (not e!169991))))

(declare-fun lt!382679 () (_ BitVec 64))

(declare-fun lt!382681 () (_ BitVec 64))

(declare-fun lt!382683 () (_ BitVec 64))

(assert (=> d!82354 (= res!205131 (= lt!382681 (bvsub lt!382679 lt!382683)))))

(assert (=> d!82354 (or (= (bvand lt!382679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!382683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!382679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!382679 lt!382683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82354 (= lt!382683 (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 thiss!1005))) ((_ sign_extend 32) (currentByte!11736 thiss!1005)) ((_ sign_extend 32) (currentBit!11731 thiss!1005))))))

(declare-fun lt!382680 () (_ BitVec 64))

(declare-fun lt!382684 () (_ BitVec 64))

(assert (=> d!82354 (= lt!382679 (bvmul lt!382680 lt!382684))))

(assert (=> d!82354 (or (= lt!382680 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!382684 (bvsdiv (bvmul lt!382680 lt!382684) lt!382680)))))

(assert (=> d!82354 (= lt!382684 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82354 (= lt!382680 ((_ sign_extend 32) (size!5877 (buf!6352 thiss!1005))))))

(assert (=> d!82354 (= lt!382681 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11736 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11731 thiss!1005))))))

(assert (=> d!82354 (invariant!0 (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005) (size!5877 (buf!6352 thiss!1005)))))

(assert (=> d!82354 (= (bitIndex!0 (size!5877 (buf!6352 thiss!1005)) (currentByte!11736 thiss!1005) (currentBit!11731 thiss!1005)) lt!382681)))

(declare-fun b!245341 () Bool)

(declare-fun res!205130 () Bool)

(assert (=> b!245341 (=> (not res!205130) (not e!169991))))

(assert (=> b!245341 (= res!205130 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!382681))))

(declare-fun b!245342 () Bool)

(declare-fun lt!382682 () (_ BitVec 64))

(assert (=> b!245342 (= e!169991 (bvsle lt!382681 (bvmul lt!382682 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!245342 (or (= lt!382682 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!382682 #b0000000000000000000000000000000000000000000000000000000000001000) lt!382682)))))

(assert (=> b!245342 (= lt!382682 ((_ sign_extend 32) (size!5877 (buf!6352 thiss!1005))))))

(assert (= (and d!82354 res!205131) b!245341))

(assert (= (and b!245341 res!205130) b!245342))

(assert (=> d!82354 m!369813))

(assert (=> d!82354 m!370007))

(assert (=> b!245070 d!82354))

(declare-fun d!82356 () Bool)

(assert (=> d!82356 (= (invariant!0 (currentBit!11731 thiss!1005) (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382066)))) (and (bvsge (currentBit!11731 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11731 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11736 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382066)))) (and (= (currentBit!11731 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11736 thiss!1005) (size!5877 (buf!6352 (_2!11437 lt!382066))))))))))

(assert (=> b!245068 d!82356))

(declare-fun lt!382685 () tuple2!21040)

(declare-fun d!82358 () Bool)

(assert (=> d!82358 (= lt!382685 (checkBitsLoop!0 (_1!11438 lt!382068) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82358 (= (checkBitsLoopPure!0 (_1!11438 lt!382068) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21035 (_2!11442 lt!382685) (_1!11442 lt!382685)))))

(declare-fun bs!20835 () Bool)

(assert (= bs!20835 d!82358))

(declare-fun m!370015 () Bool)

(assert (=> bs!20835 m!370015))

(assert (=> b!245067 d!82358))

(declare-fun d!82360 () Bool)

(assert (=> d!82360 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382074) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081)))) lt!382074))))

(declare-fun bs!20836 () Bool)

(assert (= bs!20836 d!82360))

(assert (=> bs!20836 m!369963))

(assert (=> b!245067 d!82360))

(declare-fun d!82362 () Bool)

(assert (=> d!82362 (validate_offset_bits!1 ((_ sign_extend 32) (size!5877 (buf!6352 (_2!11437 lt!382066)))) ((_ sign_extend 32) (currentByte!11736 (_2!11437 lt!382081))) ((_ sign_extend 32) (currentBit!11731 (_2!11437 lt!382081))) lt!382074)))

(declare-fun lt!382686 () Unit!17855)

(assert (=> d!82362 (= lt!382686 (choose!9 (_2!11437 lt!382081) (buf!6352 (_2!11437 lt!382066)) lt!382074 (BitStream!10677 (buf!6352 (_2!11437 lt!382066)) (currentByte!11736 (_2!11437 lt!382081)) (currentBit!11731 (_2!11437 lt!382081)))))))

(assert (=> d!82362 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11437 lt!382081) (buf!6352 (_2!11437 lt!382066)) lt!382074) lt!382686)))

(declare-fun bs!20837 () Bool)

(assert (= bs!20837 d!82362))

(assert (=> bs!20837 m!369529))

(declare-fun m!370017 () Bool)

(assert (=> bs!20837 m!370017))

(assert (=> b!245067 d!82362))

(assert (=> b!245067 d!82336))

(push 1)

(assert (not d!82306))

(assert (not b!245318))

(assert (not d!82284))

(assert (not d!82252))

(assert (not d!82354))

(assert (not d!82312))

(assert (not b!245323))

(assert (not d!82318))

(assert (not d!82304))

(assert (not d!82358))

(assert (not b!245288))

(assert (not b!245314))

(assert (not d!82324))

(assert (not b!245317))

(assert (not b!245235))

(assert (not b!245226))

(assert (not b!245327))

(assert (not b!245303))

(assert (not b!245290))

(assert (not b!245324))

(assert (not d!82352))

(assert (not d!82326))

(assert (not d!82346))

(assert (not d!82330))

(assert (not b!245301))

(assert (not d!82336))

(assert (not b!245300))

(assert (not d!82258))

(assert (not d!82360))

(assert (not b!245316))

(assert (not d!82314))

(assert (not d!82310))

(assert (not b!245287))

(assert (not b!245331))

(assert (not b!245237))

(assert (not b!245289))

(assert (not d!82344))

(assert (not b!245302))

(assert (not b!245338))

(assert (not d!82348))

(assert (not d!82362))

(assert (not b!245334))

(assert (not d!82316))

(assert (not d!82328))

(assert (not d!82280))

(assert (not d!82332))

(assert (not d!82340))

(assert (not d!82322))

(assert (not b!245321))

(assert (not d!82308))

(assert (not b!245326))

(assert (not b!245328))

(assert (not d!82338))

(assert (not b!245224))

(assert (not d!82320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

