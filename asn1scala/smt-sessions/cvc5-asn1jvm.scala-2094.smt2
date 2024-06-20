; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53120 () Bool)

(assert start!53120)

(declare-fun b!246559 () Bool)

(declare-fun e!170815 () Bool)

(declare-datatypes ((array!13448 0))(
  ( (array!13449 (arr!6883 (Array (_ BitVec 32) (_ BitVec 8))) (size!5896 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10714 0))(
  ( (BitStream!10715 (buf!6377 array!13448) (currentByte!11773 (_ BitVec 32)) (currentBit!11768 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21156 0))(
  ( (tuple2!21157 (_1!11500 BitStream!10714) (_2!11500 Bool)) )
))
(declare-fun lt!384624 () tuple2!21156)

(declare-fun lt!384623 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246559 (= e!170815 (= (bitIndex!0 (size!5896 (buf!6377 (_1!11500 lt!384624))) (currentByte!11773 (_1!11500 lt!384624)) (currentBit!11768 (_1!11500 lt!384624))) lt!384623))))

(declare-fun b!246560 () Bool)

(declare-fun res!206281 () Bool)

(declare-fun e!170816 () Bool)

(assert (=> b!246560 (=> (not res!206281) (not e!170816))))

(declare-fun thiss!1005 () BitStream!10714)

(declare-datatypes ((Unit!17904 0))(
  ( (Unit!17905) )
))
(declare-datatypes ((tuple2!21158 0))(
  ( (tuple2!21159 (_1!11501 Unit!17904) (_2!11501 BitStream!10714)) )
))
(declare-fun lt!384628 () tuple2!21158)

(declare-fun isPrefixOf!0 (BitStream!10714 BitStream!10714) Bool)

(assert (=> b!246560 (= res!206281 (isPrefixOf!0 thiss!1005 (_2!11501 lt!384628)))))

(declare-fun b!246561 () Bool)

(declare-fun res!206280 () Bool)

(declare-fun e!170823 () Bool)

(assert (=> b!246561 (=> (not res!206280) (not e!170823))))

(declare-fun lt!384617 () tuple2!21158)

(assert (=> b!246561 (= res!206280 (isPrefixOf!0 (_2!11501 lt!384628) (_2!11501 lt!384617)))))

(declare-fun b!246562 () Bool)

(declare-fun e!170820 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246562 (= e!170820 (invariant!0 (currentBit!11768 thiss!1005) (currentByte!11773 thiss!1005) (size!5896 (buf!6377 (_2!11501 lt!384617)))))))

(declare-fun b!246563 () Bool)

(declare-fun e!170817 () Bool)

(declare-fun array_inv!5637 (array!13448) Bool)

(assert (=> b!246563 (= e!170817 (array_inv!5637 (buf!6377 thiss!1005)))))

(declare-fun b!246564 () Bool)

(assert (=> b!246564 (= e!170816 e!170815)))

(declare-fun res!206270 () Bool)

(assert (=> b!246564 (=> (not res!206270) (not e!170815))))

(declare-fun bit!26 () Bool)

(assert (=> b!246564 (= res!206270 (and (= (_2!11500 lt!384624) bit!26) (= (_1!11500 lt!384624) (_2!11501 lt!384628))))))

(declare-fun readBitPure!0 (BitStream!10714) tuple2!21156)

(declare-fun readerFrom!0 (BitStream!10714 (_ BitVec 32) (_ BitVec 32)) BitStream!10714)

(assert (=> b!246564 (= lt!384624 (readBitPure!0 (readerFrom!0 (_2!11501 lt!384628) (currentBit!11768 thiss!1005) (currentByte!11773 thiss!1005))))))

(declare-fun b!246565 () Bool)

(declare-fun e!170818 () Bool)

(assert (=> b!246565 (= e!170818 e!170823)))

(declare-fun res!206278 () Bool)

(assert (=> b!246565 (=> (not res!206278) (not e!170823))))

(declare-fun lt!384611 () (_ BitVec 64))

(assert (=> b!246565 (= res!206278 (= (bitIndex!0 (size!5896 (buf!6377 (_2!11501 lt!384617))) (currentByte!11773 (_2!11501 lt!384617)) (currentBit!11768 (_2!11501 lt!384617))) (bvadd (bitIndex!0 (size!5896 (buf!6377 (_2!11501 lt!384628))) (currentByte!11773 (_2!11501 lt!384628)) (currentBit!11768 (_2!11501 lt!384628))) lt!384611)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!246565 (= lt!384611 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246566 () Bool)

(declare-fun e!170824 () Bool)

(declare-fun e!170814 () Bool)

(assert (=> b!246566 (= e!170824 e!170814)))

(declare-fun res!206277 () Bool)

(assert (=> b!246566 (=> res!206277 e!170814)))

(assert (=> b!246566 (= res!206277 (not (= (size!5896 (buf!6377 thiss!1005)) (size!5896 (buf!6377 (_2!11501 lt!384617))))))))

(declare-fun lt!384610 () tuple2!21156)

(declare-fun lt!384621 () tuple2!21156)

(declare-datatypes ((tuple2!21160 0))(
  ( (tuple2!21161 (_1!11502 BitStream!10714) (_2!11502 BitStream!10714)) )
))
(declare-fun lt!384613 () tuple2!21160)

(assert (=> b!246566 (and (= (_2!11500 lt!384610) (_2!11500 lt!384621)) (= (_1!11500 lt!384610) (_2!11502 lt!384613)))))

(declare-fun b!246567 () Bool)

(declare-fun res!206279 () Bool)

(assert (=> b!246567 (=> (not res!206279) (not e!170820))))

(assert (=> b!246567 (= res!206279 (invariant!0 (currentBit!11768 thiss!1005) (currentByte!11773 thiss!1005) (size!5896 (buf!6377 (_2!11501 lt!384628)))))))

(declare-fun b!246568 () Bool)

(declare-fun e!170821 () Bool)

(assert (=> b!246568 (= e!170821 (not e!170824))))

(declare-fun res!206271 () Bool)

(assert (=> b!246568 (=> res!206271 e!170824)))

(declare-fun lt!384625 () tuple2!21160)

(assert (=> b!246568 (= res!206271 (not (= (_1!11500 lt!384621) (_2!11502 lt!384625))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10714 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21156)

(assert (=> b!246568 (= lt!384621 (checkBitsLoopPure!0 (_1!11502 lt!384625) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384627 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246568 (validate_offset_bits!1 ((_ sign_extend 32) (size!5896 (buf!6377 (_2!11501 lt!384617)))) ((_ sign_extend 32) (currentByte!11773 (_2!11501 lt!384628))) ((_ sign_extend 32) (currentBit!11768 (_2!11501 lt!384628))) lt!384627)))

(declare-fun lt!384614 () Unit!17904)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10714 array!13448 (_ BitVec 64)) Unit!17904)

(assert (=> b!246568 (= lt!384614 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11501 lt!384628) (buf!6377 (_2!11501 lt!384617)) lt!384627))))

(assert (=> b!246568 (= lt!384610 (checkBitsLoopPure!0 (_1!11502 lt!384613) nBits!297 bit!26 from!289))))

(assert (=> b!246568 (validate_offset_bits!1 ((_ sign_extend 32) (size!5896 (buf!6377 (_2!11501 lt!384617)))) ((_ sign_extend 32) (currentByte!11773 thiss!1005)) ((_ sign_extend 32) (currentBit!11768 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384630 () Unit!17904)

(assert (=> b!246568 (= lt!384630 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6377 (_2!11501 lt!384617)) (bvsub nBits!297 from!289)))))

(assert (=> b!246568 (= (_2!11500 (readBitPure!0 (_1!11502 lt!384613))) bit!26)))

(declare-fun reader!0 (BitStream!10714 BitStream!10714) tuple2!21160)

(assert (=> b!246568 (= lt!384625 (reader!0 (_2!11501 lt!384628) (_2!11501 lt!384617)))))

(assert (=> b!246568 (= lt!384613 (reader!0 thiss!1005 (_2!11501 lt!384617)))))

(declare-fun e!170825 () Bool)

(assert (=> b!246568 e!170825))

(declare-fun res!206272 () Bool)

(assert (=> b!246568 (=> (not res!206272) (not e!170825))))

(declare-fun lt!384629 () tuple2!21156)

(declare-fun lt!384608 () tuple2!21156)

(assert (=> b!246568 (= res!206272 (= (bitIndex!0 (size!5896 (buf!6377 (_1!11500 lt!384629))) (currentByte!11773 (_1!11500 lt!384629)) (currentBit!11768 (_1!11500 lt!384629))) (bitIndex!0 (size!5896 (buf!6377 (_1!11500 lt!384608))) (currentByte!11773 (_1!11500 lt!384608)) (currentBit!11768 (_1!11500 lt!384608)))))))

(declare-fun lt!384626 () Unit!17904)

(declare-fun lt!384619 () BitStream!10714)

(declare-fun readBitPrefixLemma!0 (BitStream!10714 BitStream!10714) Unit!17904)

(assert (=> b!246568 (= lt!384626 (readBitPrefixLemma!0 lt!384619 (_2!11501 lt!384617)))))

(assert (=> b!246568 (= lt!384608 (readBitPure!0 (BitStream!10715 (buf!6377 (_2!11501 lt!384617)) (currentByte!11773 thiss!1005) (currentBit!11768 thiss!1005))))))

(assert (=> b!246568 (= lt!384629 (readBitPure!0 lt!384619))))

(assert (=> b!246568 (= lt!384619 (BitStream!10715 (buf!6377 (_2!11501 lt!384628)) (currentByte!11773 thiss!1005) (currentBit!11768 thiss!1005)))))

(assert (=> b!246568 e!170820))

(declare-fun res!206269 () Bool)

(assert (=> b!246568 (=> (not res!206269) (not e!170820))))

(assert (=> b!246568 (= res!206269 (isPrefixOf!0 thiss!1005 (_2!11501 lt!384617)))))

(declare-fun lt!384620 () Unit!17904)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10714 BitStream!10714 BitStream!10714) Unit!17904)

(assert (=> b!246568 (= lt!384620 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11501 lt!384628) (_2!11501 lt!384617)))))

(assert (=> b!246568 e!170818))

(declare-fun res!206276 () Bool)

(assert (=> b!246568 (=> (not res!206276) (not e!170818))))

(assert (=> b!246568 (= res!206276 (= (size!5896 (buf!6377 (_2!11501 lt!384628))) (size!5896 (buf!6377 (_2!11501 lt!384617)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10714 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21158)

(assert (=> b!246568 (= lt!384617 (appendNBitsLoop!0 (_2!11501 lt!384628) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246568 (validate_offset_bits!1 ((_ sign_extend 32) (size!5896 (buf!6377 (_2!11501 lt!384628)))) ((_ sign_extend 32) (currentByte!11773 (_2!11501 lt!384628))) ((_ sign_extend 32) (currentBit!11768 (_2!11501 lt!384628))) lt!384627)))

(assert (=> b!246568 (= lt!384627 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384618 () Unit!17904)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10714 BitStream!10714 (_ BitVec 64) (_ BitVec 64)) Unit!17904)

(assert (=> b!246568 (= lt!384618 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11501 lt!384628) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170822 () Bool)

(assert (=> b!246568 e!170822))

(declare-fun res!206275 () Bool)

(assert (=> b!246568 (=> (not res!206275) (not e!170822))))

(assert (=> b!246568 (= res!206275 (= (size!5896 (buf!6377 thiss!1005)) (size!5896 (buf!6377 (_2!11501 lt!384628)))))))

(declare-fun appendBit!0 (BitStream!10714 Bool) tuple2!21158)

(assert (=> b!246568 (= lt!384628 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246570 () Bool)

(assert (=> b!246570 (= e!170822 e!170816)))

(declare-fun res!206273 () Bool)

(assert (=> b!246570 (=> (not res!206273) (not e!170816))))

(declare-fun lt!384609 () (_ BitVec 64))

(assert (=> b!246570 (= res!206273 (= lt!384623 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384609)))))

(assert (=> b!246570 (= lt!384623 (bitIndex!0 (size!5896 (buf!6377 (_2!11501 lt!384628))) (currentByte!11773 (_2!11501 lt!384628)) (currentBit!11768 (_2!11501 lt!384628))))))

(assert (=> b!246570 (= lt!384609 (bitIndex!0 (size!5896 (buf!6377 thiss!1005)) (currentByte!11773 thiss!1005) (currentBit!11768 thiss!1005)))))

(declare-fun b!246571 () Bool)

(assert (=> b!246571 (= e!170814 true)))

(declare-fun lt!384612 () (_ BitVec 64))

(assert (=> b!246571 (= lt!384612 (bitIndex!0 (size!5896 (buf!6377 (_2!11501 lt!384617))) (currentByte!11773 (_2!11501 lt!384617)) (currentBit!11768 (_2!11501 lt!384617))))))

(declare-fun lt!384607 () (_ BitVec 64))

(assert (=> b!246571 (= lt!384607 (bitIndex!0 (size!5896 (buf!6377 thiss!1005)) (currentByte!11773 thiss!1005) (currentBit!11768 thiss!1005)))))

(declare-fun b!246572 () Bool)

(declare-fun res!206268 () Bool)

(assert (=> b!246572 (=> (not res!206268) (not e!170821))))

(assert (=> b!246572 (= res!206268 (bvslt from!289 nBits!297))))

(declare-fun b!246573 () Bool)

(assert (=> b!246573 (= e!170825 (= (_2!11500 lt!384629) (_2!11500 lt!384608)))))

(declare-fun b!246574 () Bool)

(declare-fun lt!384622 () tuple2!21156)

(declare-fun lt!384616 () tuple2!21160)

(assert (=> b!246574 (= e!170823 (not (or (not (_2!11500 lt!384622)) (not (= (_1!11500 lt!384622) (_2!11502 lt!384616))))))))

(assert (=> b!246574 (= lt!384622 (checkBitsLoopPure!0 (_1!11502 lt!384616) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246574 (validate_offset_bits!1 ((_ sign_extend 32) (size!5896 (buf!6377 (_2!11501 lt!384617)))) ((_ sign_extend 32) (currentByte!11773 (_2!11501 lt!384628))) ((_ sign_extend 32) (currentBit!11768 (_2!11501 lt!384628))) lt!384611)))

(declare-fun lt!384615 () Unit!17904)

(assert (=> b!246574 (= lt!384615 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11501 lt!384628) (buf!6377 (_2!11501 lt!384617)) lt!384611))))

(assert (=> b!246574 (= lt!384616 (reader!0 (_2!11501 lt!384628) (_2!11501 lt!384617)))))

(declare-fun b!246575 () Bool)

(declare-fun res!206274 () Bool)

(assert (=> b!246575 (=> res!206274 e!170824)))

(declare-fun withMovedBitIndex!0 (BitStream!10714 (_ BitVec 64)) BitStream!10714)

(assert (=> b!246575 (= res!206274 (not (= (_1!11502 lt!384625) (withMovedBitIndex!0 (_1!11502 lt!384613) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!206283 () Bool)

(assert (=> start!53120 (=> (not res!206283) (not e!170821))))

(assert (=> start!53120 (= res!206283 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53120 e!170821))

(assert (=> start!53120 true))

(declare-fun inv!12 (BitStream!10714) Bool)

(assert (=> start!53120 (and (inv!12 thiss!1005) e!170817)))

(declare-fun b!246569 () Bool)

(declare-fun res!206282 () Bool)

(assert (=> b!246569 (=> (not res!206282) (not e!170821))))

(assert (=> b!246569 (= res!206282 (validate_offset_bits!1 ((_ sign_extend 32) (size!5896 (buf!6377 thiss!1005))) ((_ sign_extend 32) (currentByte!11773 thiss!1005)) ((_ sign_extend 32) (currentBit!11768 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53120 res!206283) b!246569))

(assert (= (and b!246569 res!206282) b!246572))

(assert (= (and b!246572 res!206268) b!246568))

(assert (= (and b!246568 res!206275) b!246570))

(assert (= (and b!246570 res!206273) b!246560))

(assert (= (and b!246560 res!206281) b!246564))

(assert (= (and b!246564 res!206270) b!246559))

(assert (= (and b!246568 res!206276) b!246565))

(assert (= (and b!246565 res!206278) b!246561))

(assert (= (and b!246561 res!206280) b!246574))

(assert (= (and b!246568 res!206269) b!246567))

(assert (= (and b!246567 res!206279) b!246562))

(assert (= (and b!246568 res!206272) b!246573))

(assert (= (and b!246568 (not res!206271)) b!246575))

(assert (= (and b!246575 (not res!206274)) b!246566))

(assert (= (and b!246566 (not res!206277)) b!246571))

(assert (= start!53120 b!246563))

(declare-fun m!371849 () Bool)

(assert (=> b!246561 m!371849))

(declare-fun m!371851 () Bool)

(assert (=> b!246567 m!371851))

(declare-fun m!371853 () Bool)

(assert (=> b!246564 m!371853))

(assert (=> b!246564 m!371853))

(declare-fun m!371855 () Bool)

(assert (=> b!246564 m!371855))

(declare-fun m!371857 () Bool)

(assert (=> b!246570 m!371857))

(declare-fun m!371859 () Bool)

(assert (=> b!246570 m!371859))

(declare-fun m!371861 () Bool)

(assert (=> b!246562 m!371861))

(declare-fun m!371863 () Bool)

(assert (=> b!246569 m!371863))

(declare-fun m!371865 () Bool)

(assert (=> b!246565 m!371865))

(assert (=> b!246565 m!371857))

(assert (=> b!246571 m!371865))

(assert (=> b!246571 m!371859))

(declare-fun m!371867 () Bool)

(assert (=> b!246574 m!371867))

(declare-fun m!371869 () Bool)

(assert (=> b!246574 m!371869))

(declare-fun m!371871 () Bool)

(assert (=> b!246574 m!371871))

(declare-fun m!371873 () Bool)

(assert (=> b!246574 m!371873))

(declare-fun m!371875 () Bool)

(assert (=> b!246568 m!371875))

(declare-fun m!371877 () Bool)

(assert (=> b!246568 m!371877))

(declare-fun m!371879 () Bool)

(assert (=> b!246568 m!371879))

(declare-fun m!371881 () Bool)

(assert (=> b!246568 m!371881))

(declare-fun m!371883 () Bool)

(assert (=> b!246568 m!371883))

(declare-fun m!371885 () Bool)

(assert (=> b!246568 m!371885))

(declare-fun m!371887 () Bool)

(assert (=> b!246568 m!371887))

(declare-fun m!371889 () Bool)

(assert (=> b!246568 m!371889))

(declare-fun m!371891 () Bool)

(assert (=> b!246568 m!371891))

(declare-fun m!371893 () Bool)

(assert (=> b!246568 m!371893))

(declare-fun m!371895 () Bool)

(assert (=> b!246568 m!371895))

(assert (=> b!246568 m!371873))

(declare-fun m!371897 () Bool)

(assert (=> b!246568 m!371897))

(declare-fun m!371899 () Bool)

(assert (=> b!246568 m!371899))

(declare-fun m!371901 () Bool)

(assert (=> b!246568 m!371901))

(declare-fun m!371903 () Bool)

(assert (=> b!246568 m!371903))

(declare-fun m!371905 () Bool)

(assert (=> b!246568 m!371905))

(declare-fun m!371907 () Bool)

(assert (=> b!246568 m!371907))

(declare-fun m!371909 () Bool)

(assert (=> b!246568 m!371909))

(declare-fun m!371911 () Bool)

(assert (=> b!246568 m!371911))

(declare-fun m!371913 () Bool)

(assert (=> b!246559 m!371913))

(declare-fun m!371915 () Bool)

(assert (=> b!246563 m!371915))

(declare-fun m!371917 () Bool)

(assert (=> start!53120 m!371917))

(declare-fun m!371919 () Bool)

(assert (=> b!246560 m!371919))

(declare-fun m!371921 () Bool)

(assert (=> b!246575 m!371921))

(push 1)

(assert (not b!246574))

(assert (not b!246559))

(assert (not b!246563))

(assert (not b!246567))

(assert (not b!246564))

(assert (not b!246565))

(assert (not b!246560))

(assert (not b!246571))

(assert (not b!246575))

