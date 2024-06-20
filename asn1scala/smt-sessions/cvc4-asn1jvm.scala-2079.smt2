; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52638 () Bool)

(assert start!52638)

(declare-fun b!243526 () Bool)

(declare-fun e!168812 () Bool)

(declare-fun e!168821 () Bool)

(assert (=> b!243526 (= e!168812 e!168821)))

(declare-fun res!203468 () Bool)

(assert (=> b!243526 (=> (not res!203468) (not e!168821))))

(declare-fun lt!379464 () (_ BitVec 64))

(declare-fun lt!379470 () (_ BitVec 64))

(assert (=> b!243526 (= res!203468 (= lt!379464 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379470)))))

(declare-datatypes ((array!13350 0))(
  ( (array!13351 (arr!6840 (Array (_ BitVec 32) (_ BitVec 8))) (size!5853 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10628 0))(
  ( (BitStream!10629 (buf!6322 array!13350) (currentByte!11694 (_ BitVec 32)) (currentBit!11689 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17795 0))(
  ( (Unit!17796) )
))
(declare-datatypes ((tuple2!20874 0))(
  ( (tuple2!20875 (_1!11359 Unit!17795) (_2!11359 BitStream!10628)) )
))
(declare-fun lt!379469 () tuple2!20874)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243526 (= lt!379464 (bitIndex!0 (size!5853 (buf!6322 (_2!11359 lt!379469))) (currentByte!11694 (_2!11359 lt!379469)) (currentBit!11689 (_2!11359 lt!379469))))))

(declare-fun thiss!1005 () BitStream!10628)

(assert (=> b!243526 (= lt!379470 (bitIndex!0 (size!5853 (buf!6322 thiss!1005)) (currentByte!11694 thiss!1005) (currentBit!11689 thiss!1005)))))

(declare-fun b!243527 () Bool)

(declare-fun e!168814 () Bool)

(assert (=> b!243527 (= e!168821 e!168814)))

(declare-fun res!203474 () Bool)

(assert (=> b!243527 (=> (not res!203474) (not e!168814))))

(declare-datatypes ((tuple2!20876 0))(
  ( (tuple2!20877 (_1!11360 BitStream!10628) (_2!11360 Bool)) )
))
(declare-fun lt!379459 () tuple2!20876)

(declare-fun bit!26 () Bool)

(assert (=> b!243527 (= res!203474 (and (= (_2!11360 lt!379459) bit!26) (= (_1!11360 lt!379459) (_2!11359 lt!379469))))))

(declare-fun readBitPure!0 (BitStream!10628) tuple2!20876)

(declare-fun readerFrom!0 (BitStream!10628 (_ BitVec 32) (_ BitVec 32)) BitStream!10628)

(assert (=> b!243527 (= lt!379459 (readBitPure!0 (readerFrom!0 (_2!11359 lt!379469) (currentBit!11689 thiss!1005) (currentByte!11694 thiss!1005))))))

(declare-fun b!243528 () Bool)

(declare-fun e!168817 () Bool)

(declare-fun array_inv!5594 (array!13350) Bool)

(assert (=> b!243528 (= e!168817 (array_inv!5594 (buf!6322 thiss!1005)))))

(declare-fun b!243529 () Bool)

(declare-fun res!203473 () Bool)

(assert (=> b!243529 (=> (not res!203473) (not e!168821))))

(declare-fun isPrefixOf!0 (BitStream!10628 BitStream!10628) Bool)

(assert (=> b!243529 (= res!203473 (isPrefixOf!0 thiss!1005 (_2!11359 lt!379469)))))

(declare-fun b!243530 () Bool)

(declare-fun res!203475 () Bool)

(declare-fun e!168816 () Bool)

(assert (=> b!243530 (=> (not res!203475) (not e!168816))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243530 (= res!203475 (validate_offset_bits!1 ((_ sign_extend 32) (size!5853 (buf!6322 thiss!1005))) ((_ sign_extend 32) (currentByte!11694 thiss!1005)) ((_ sign_extend 32) (currentBit!11689 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243531 () Bool)

(declare-fun e!168819 () Bool)

(declare-fun e!168820 () Bool)

(assert (=> b!243531 (= e!168819 e!168820)))

(declare-fun res!203469 () Bool)

(assert (=> b!243531 (=> (not res!203469) (not e!168820))))

(declare-fun lt!379461 () tuple2!20874)

(declare-fun lt!379473 () (_ BitVec 64))

(assert (=> b!243531 (= res!203469 (= (bitIndex!0 (size!5853 (buf!6322 (_2!11359 lt!379461))) (currentByte!11694 (_2!11359 lt!379461)) (currentBit!11689 (_2!11359 lt!379461))) (bvadd (bitIndex!0 (size!5853 (buf!6322 (_2!11359 lt!379469))) (currentByte!11694 (_2!11359 lt!379469)) (currentBit!11689 (_2!11359 lt!379469))) lt!379473)))))

(assert (=> b!243531 (= lt!379473 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243532 () Bool)

(declare-fun res!203463 () Bool)

(assert (=> b!243532 (=> (not res!203463) (not e!168820))))

(assert (=> b!243532 (= res!203463 (isPrefixOf!0 (_2!11359 lt!379469) (_2!11359 lt!379461)))))

(declare-fun b!243533 () Bool)

(declare-fun res!203470 () Bool)

(assert (=> b!243533 (=> (not res!203470) (not e!168816))))

(assert (=> b!243533 (= res!203470 (bvslt from!289 nBits!297))))

(declare-fun b!243534 () Bool)

(assert (=> b!243534 (= e!168814 (= (bitIndex!0 (size!5853 (buf!6322 (_1!11360 lt!379459))) (currentByte!11694 (_1!11360 lt!379459)) (currentBit!11689 (_1!11360 lt!379459))) lt!379464))))

(declare-fun b!243535 () Bool)

(declare-fun lt!379462 () tuple2!20876)

(declare-datatypes ((tuple2!20878 0))(
  ( (tuple2!20879 (_1!11361 BitStream!10628) (_2!11361 BitStream!10628)) )
))
(declare-fun lt!379476 () tuple2!20878)

(assert (=> b!243535 (= e!168820 (not (or (not (_2!11360 lt!379462)) (not (= (_1!11360 lt!379462) (_2!11361 lt!379476))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10628 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20876)

(assert (=> b!243535 (= lt!379462 (checkBitsLoopPure!0 (_1!11361 lt!379476) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243535 (validate_offset_bits!1 ((_ sign_extend 32) (size!5853 (buf!6322 (_2!11359 lt!379461)))) ((_ sign_extend 32) (currentByte!11694 (_2!11359 lt!379469))) ((_ sign_extend 32) (currentBit!11689 (_2!11359 lt!379469))) lt!379473)))

(declare-fun lt!379465 () Unit!17795)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10628 array!13350 (_ BitVec 64)) Unit!17795)

(assert (=> b!243535 (= lt!379465 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11359 lt!379469) (buf!6322 (_2!11359 lt!379461)) lt!379473))))

(declare-fun reader!0 (BitStream!10628 BitStream!10628) tuple2!20878)

(assert (=> b!243535 (= lt!379476 (reader!0 (_2!11359 lt!379469) (_2!11359 lt!379461)))))

(declare-fun b!243536 () Bool)

(declare-fun e!168818 () Bool)

(declare-fun lt!379467 () tuple2!20876)

(declare-fun lt!379466 () tuple2!20876)

(assert (=> b!243536 (= e!168818 (= (_2!11360 lt!379467) (_2!11360 lt!379466)))))

(declare-fun res!203465 () Bool)

(assert (=> start!52638 (=> (not res!203465) (not e!168816))))

(assert (=> start!52638 (= res!203465 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52638 e!168816))

(assert (=> start!52638 true))

(declare-fun inv!12 (BitStream!10628) Bool)

(assert (=> start!52638 (and (inv!12 thiss!1005) e!168817)))

(declare-fun b!243537 () Bool)

(assert (=> b!243537 (= e!168816 (not true))))

(assert (=> b!243537 (validate_offset_bits!1 ((_ sign_extend 32) (size!5853 (buf!6322 (_2!11359 lt!379461)))) ((_ sign_extend 32) (currentByte!11694 thiss!1005)) ((_ sign_extend 32) (currentBit!11689 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379474 () Unit!17795)

(assert (=> b!243537 (= lt!379474 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6322 (_2!11359 lt!379461)) (bvsub nBits!297 from!289)))))

(declare-fun lt!379472 () tuple2!20878)

(assert (=> b!243537 (= (_2!11360 (readBitPure!0 (_1!11361 lt!379472))) bit!26)))

(declare-fun lt!379475 () tuple2!20878)

(assert (=> b!243537 (= lt!379475 (reader!0 (_2!11359 lt!379469) (_2!11359 lt!379461)))))

(assert (=> b!243537 (= lt!379472 (reader!0 thiss!1005 (_2!11359 lt!379461)))))

(assert (=> b!243537 e!168818))

(declare-fun res!203467 () Bool)

(assert (=> b!243537 (=> (not res!203467) (not e!168818))))

(assert (=> b!243537 (= res!203467 (= (bitIndex!0 (size!5853 (buf!6322 (_1!11360 lt!379467))) (currentByte!11694 (_1!11360 lt!379467)) (currentBit!11689 (_1!11360 lt!379467))) (bitIndex!0 (size!5853 (buf!6322 (_1!11360 lt!379466))) (currentByte!11694 (_1!11360 lt!379466)) (currentBit!11689 (_1!11360 lt!379466)))))))

(declare-fun lt!379471 () Unit!17795)

(declare-fun lt!379468 () BitStream!10628)

(declare-fun readBitPrefixLemma!0 (BitStream!10628 BitStream!10628) Unit!17795)

(assert (=> b!243537 (= lt!379471 (readBitPrefixLemma!0 lt!379468 (_2!11359 lt!379461)))))

(assert (=> b!243537 (= lt!379466 (readBitPure!0 (BitStream!10629 (buf!6322 (_2!11359 lt!379461)) (currentByte!11694 thiss!1005) (currentBit!11689 thiss!1005))))))

(assert (=> b!243537 (= lt!379467 (readBitPure!0 lt!379468))))

(assert (=> b!243537 (= lt!379468 (BitStream!10629 (buf!6322 (_2!11359 lt!379469)) (currentByte!11694 thiss!1005) (currentBit!11689 thiss!1005)))))

(declare-fun e!168813 () Bool)

(assert (=> b!243537 e!168813))

(declare-fun res!203472 () Bool)

(assert (=> b!243537 (=> (not res!203472) (not e!168813))))

(assert (=> b!243537 (= res!203472 (isPrefixOf!0 thiss!1005 (_2!11359 lt!379461)))))

(declare-fun lt!379460 () Unit!17795)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10628 BitStream!10628 BitStream!10628) Unit!17795)

(assert (=> b!243537 (= lt!379460 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11359 lt!379469) (_2!11359 lt!379461)))))

(assert (=> b!243537 e!168819))

(declare-fun res!203466 () Bool)

(assert (=> b!243537 (=> (not res!203466) (not e!168819))))

(assert (=> b!243537 (= res!203466 (= (size!5853 (buf!6322 (_2!11359 lt!379469))) (size!5853 (buf!6322 (_2!11359 lt!379461)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10628 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20874)

(assert (=> b!243537 (= lt!379461 (appendNBitsLoop!0 (_2!11359 lt!379469) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243537 (validate_offset_bits!1 ((_ sign_extend 32) (size!5853 (buf!6322 (_2!11359 lt!379469)))) ((_ sign_extend 32) (currentByte!11694 (_2!11359 lt!379469))) ((_ sign_extend 32) (currentBit!11689 (_2!11359 lt!379469))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379463 () Unit!17795)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10628 BitStream!10628 (_ BitVec 64) (_ BitVec 64)) Unit!17795)

(assert (=> b!243537 (= lt!379463 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11359 lt!379469) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!243537 e!168812))

(declare-fun res!203464 () Bool)

(assert (=> b!243537 (=> (not res!203464) (not e!168812))))

(assert (=> b!243537 (= res!203464 (= (size!5853 (buf!6322 thiss!1005)) (size!5853 (buf!6322 (_2!11359 lt!379469)))))))

(declare-fun appendBit!0 (BitStream!10628 Bool) tuple2!20874)

(assert (=> b!243537 (= lt!379469 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243538 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243538 (= e!168813 (invariant!0 (currentBit!11689 thiss!1005) (currentByte!11694 thiss!1005) (size!5853 (buf!6322 (_2!11359 lt!379461)))))))

(declare-fun b!243539 () Bool)

(declare-fun res!203471 () Bool)

(assert (=> b!243539 (=> (not res!203471) (not e!168813))))

(assert (=> b!243539 (= res!203471 (invariant!0 (currentBit!11689 thiss!1005) (currentByte!11694 thiss!1005) (size!5853 (buf!6322 (_2!11359 lt!379469)))))))

(assert (= (and start!52638 res!203465) b!243530))

(assert (= (and b!243530 res!203475) b!243533))

(assert (= (and b!243533 res!203470) b!243537))

(assert (= (and b!243537 res!203464) b!243526))

(assert (= (and b!243526 res!203468) b!243529))

(assert (= (and b!243529 res!203473) b!243527))

(assert (= (and b!243527 res!203474) b!243534))

(assert (= (and b!243537 res!203466) b!243531))

(assert (= (and b!243531 res!203469) b!243532))

(assert (= (and b!243532 res!203463) b!243535))

(assert (= (and b!243537 res!203472) b!243539))

(assert (= (and b!243539 res!203471) b!243538))

(assert (= (and b!243537 res!203467) b!243536))

(assert (= start!52638 b!243528))

(declare-fun m!366913 () Bool)

(assert (=> b!243529 m!366913))

(declare-fun m!366915 () Bool)

(assert (=> b!243535 m!366915))

(declare-fun m!366917 () Bool)

(assert (=> b!243535 m!366917))

(declare-fun m!366919 () Bool)

(assert (=> b!243535 m!366919))

(declare-fun m!366921 () Bool)

(assert (=> b!243535 m!366921))

(declare-fun m!366923 () Bool)

(assert (=> b!243527 m!366923))

(assert (=> b!243527 m!366923))

(declare-fun m!366925 () Bool)

(assert (=> b!243527 m!366925))

(declare-fun m!366927 () Bool)

(assert (=> b!243538 m!366927))

(declare-fun m!366929 () Bool)

(assert (=> b!243539 m!366929))

(declare-fun m!366931 () Bool)

(assert (=> b!243532 m!366931))

(declare-fun m!366933 () Bool)

(assert (=> b!243531 m!366933))

(declare-fun m!366935 () Bool)

(assert (=> b!243531 m!366935))

(declare-fun m!366937 () Bool)

(assert (=> start!52638 m!366937))

(declare-fun m!366939 () Bool)

(assert (=> b!243534 m!366939))

(declare-fun m!366941 () Bool)

(assert (=> b!243530 m!366941))

(declare-fun m!366943 () Bool)

(assert (=> b!243528 m!366943))

(declare-fun m!366945 () Bool)

(assert (=> b!243537 m!366945))

(declare-fun m!366947 () Bool)

(assert (=> b!243537 m!366947))

(declare-fun m!366949 () Bool)

(assert (=> b!243537 m!366949))

(declare-fun m!366951 () Bool)

(assert (=> b!243537 m!366951))

(declare-fun m!366953 () Bool)

(assert (=> b!243537 m!366953))

(declare-fun m!366955 () Bool)

(assert (=> b!243537 m!366955))

(declare-fun m!366957 () Bool)

(assert (=> b!243537 m!366957))

(declare-fun m!366959 () Bool)

(assert (=> b!243537 m!366959))

(declare-fun m!366961 () Bool)

(assert (=> b!243537 m!366961))

(declare-fun m!366963 () Bool)

(assert (=> b!243537 m!366963))

(declare-fun m!366965 () Bool)

(assert (=> b!243537 m!366965))

(declare-fun m!366967 () Bool)

(assert (=> b!243537 m!366967))

(declare-fun m!366969 () Bool)

(assert (=> b!243537 m!366969))

(declare-fun m!366971 () Bool)

(assert (=> b!243537 m!366971))

(assert (=> b!243537 m!366921))

(declare-fun m!366973 () Bool)

(assert (=> b!243537 m!366973))

(assert (=> b!243526 m!366935))

(declare-fun m!366975 () Bool)

(assert (=> b!243526 m!366975))

(push 1)

(assert (not b!243535))

(assert (not b!243538))

(assert (not b!243527))

(assert (not b!243528))

(assert (not b!243526))

(assert (not b!243537))

(assert (not b!243534))

(assert (not b!243539))

(assert (not start!52638))

(assert (not b!243531))

(assert (not b!243529))

(assert (not b!243530))

(assert (not b!243532))

(check-sat)

