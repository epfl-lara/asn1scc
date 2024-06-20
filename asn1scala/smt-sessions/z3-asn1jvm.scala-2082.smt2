; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52750 () Bool)

(assert start!52750)

(declare-fun b!244117 () Bool)

(declare-fun e!169196 () Bool)

(declare-fun e!169198 () Bool)

(assert (=> b!244117 (= e!169196 e!169198)))

(declare-fun res!204010 () Bool)

(assert (=> b!244117 (=> (not res!204010) (not e!169198))))

(declare-datatypes ((array!13369 0))(
  ( (array!13370 (arr!6848 (Array (_ BitVec 32) (_ BitVec 8))) (size!5861 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10644 0))(
  ( (BitStream!10645 (buf!6333 array!13369) (currentByte!11711 (_ BitVec 32)) (currentBit!11706 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17817 0))(
  ( (Unit!17818) )
))
(declare-datatypes ((tuple2!20928 0))(
  ( (tuple2!20929 (_1!11386 Unit!17817) (_2!11386 BitStream!10644)) )
))
(declare-fun lt!380497 () tuple2!20928)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20930 0))(
  ( (tuple2!20931 (_1!11387 BitStream!10644) (_2!11387 Bool)) )
))
(declare-fun lt!380504 () tuple2!20930)

(assert (=> b!244117 (= res!204010 (and (= (_2!11387 lt!380504) bit!26) (= (_1!11387 lt!380504) (_2!11386 lt!380497))))))

(declare-fun thiss!1005 () BitStream!10644)

(declare-fun readBitPure!0 (BitStream!10644) tuple2!20930)

(declare-fun readerFrom!0 (BitStream!10644 (_ BitVec 32) (_ BitVec 32)) BitStream!10644)

(assert (=> b!244117 (= lt!380504 (readBitPure!0 (readerFrom!0 (_2!11386 lt!380497) (currentBit!11706 thiss!1005) (currentByte!11711 thiss!1005))))))

(declare-fun b!244118 () Bool)

(declare-fun e!169199 () Bool)

(declare-fun lt!380506 () tuple2!20930)

(declare-datatypes ((tuple2!20932 0))(
  ( (tuple2!20933 (_1!11388 BitStream!10644) (_2!11388 BitStream!10644)) )
))
(declare-fun lt!380498 () tuple2!20932)

(assert (=> b!244118 (= e!169199 (not (or (not (_2!11387 lt!380506)) (not (= (_1!11387 lt!380506) (_2!11388 lt!380498))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10644 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20930)

(assert (=> b!244118 (= lt!380506 (checkBitsLoopPure!0 (_1!11388 lt!380498) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380495 () tuple2!20928)

(declare-fun lt!380499 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244118 (validate_offset_bits!1 ((_ sign_extend 32) (size!5861 (buf!6333 (_2!11386 lt!380495)))) ((_ sign_extend 32) (currentByte!11711 (_2!11386 lt!380497))) ((_ sign_extend 32) (currentBit!11706 (_2!11386 lt!380497))) lt!380499)))

(declare-fun lt!380490 () Unit!17817)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10644 array!13369 (_ BitVec 64)) Unit!17817)

(assert (=> b!244118 (= lt!380490 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11386 lt!380497) (buf!6333 (_2!11386 lt!380495)) lt!380499))))

(declare-fun reader!0 (BitStream!10644 BitStream!10644) tuple2!20932)

(assert (=> b!244118 (= lt!380498 (reader!0 (_2!11386 lt!380497) (_2!11386 lt!380495)))))

(declare-fun b!244119 () Bool)

(declare-fun res!204012 () Bool)

(assert (=> b!244119 (=> (not res!204012) (not e!169196))))

(declare-fun isPrefixOf!0 (BitStream!10644 BitStream!10644) Bool)

(assert (=> b!244119 (= res!204012 (isPrefixOf!0 thiss!1005 (_2!11386 lt!380497)))))

(declare-fun b!244120 () Bool)

(declare-fun e!169202 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244120 (= e!169202 (invariant!0 (currentBit!11706 thiss!1005) (currentByte!11711 thiss!1005) (size!5861 (buf!6333 (_2!11386 lt!380495)))))))

(declare-fun b!244121 () Bool)

(declare-fun res!204017 () Bool)

(assert (=> b!244121 (=> (not res!204017) (not e!169202))))

(assert (=> b!244121 (= res!204017 (invariant!0 (currentBit!11706 thiss!1005) (currentByte!11711 thiss!1005) (size!5861 (buf!6333 (_2!11386 lt!380497)))))))

(declare-fun b!244122 () Bool)

(declare-fun res!204009 () Bool)

(declare-fun e!169197 () Bool)

(assert (=> b!244122 (=> (not res!204009) (not e!169197))))

(assert (=> b!244122 (= res!204009 (bvslt from!289 nBits!297))))

(declare-fun b!244123 () Bool)

(assert (=> b!244123 (= e!169197 (not true))))

(declare-fun lt!380492 () tuple2!20932)

(declare-fun lt!380502 () tuple2!20930)

(assert (=> b!244123 (= lt!380502 (checkBitsLoopPure!0 (_1!11388 lt!380492) nBits!297 bit!26 from!289))))

(assert (=> b!244123 (validate_offset_bits!1 ((_ sign_extend 32) (size!5861 (buf!6333 (_2!11386 lt!380495)))) ((_ sign_extend 32) (currentByte!11711 thiss!1005)) ((_ sign_extend 32) (currentBit!11706 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380500 () Unit!17817)

(assert (=> b!244123 (= lt!380500 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6333 (_2!11386 lt!380495)) (bvsub nBits!297 from!289)))))

(assert (=> b!244123 (= (_2!11387 (readBitPure!0 (_1!11388 lt!380492))) bit!26)))

(declare-fun lt!380503 () tuple2!20932)

(assert (=> b!244123 (= lt!380503 (reader!0 (_2!11386 lt!380497) (_2!11386 lt!380495)))))

(assert (=> b!244123 (= lt!380492 (reader!0 thiss!1005 (_2!11386 lt!380495)))))

(declare-fun e!169201 () Bool)

(assert (=> b!244123 e!169201))

(declare-fun res!204014 () Bool)

(assert (=> b!244123 (=> (not res!204014) (not e!169201))))

(declare-fun lt!380508 () tuple2!20930)

(declare-fun lt!380494 () tuple2!20930)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244123 (= res!204014 (= (bitIndex!0 (size!5861 (buf!6333 (_1!11387 lt!380508))) (currentByte!11711 (_1!11387 lt!380508)) (currentBit!11706 (_1!11387 lt!380508))) (bitIndex!0 (size!5861 (buf!6333 (_1!11387 lt!380494))) (currentByte!11711 (_1!11387 lt!380494)) (currentBit!11706 (_1!11387 lt!380494)))))))

(declare-fun lt!380507 () Unit!17817)

(declare-fun lt!380505 () BitStream!10644)

(declare-fun readBitPrefixLemma!0 (BitStream!10644 BitStream!10644) Unit!17817)

(assert (=> b!244123 (= lt!380507 (readBitPrefixLemma!0 lt!380505 (_2!11386 lt!380495)))))

(assert (=> b!244123 (= lt!380494 (readBitPure!0 (BitStream!10645 (buf!6333 (_2!11386 lt!380495)) (currentByte!11711 thiss!1005) (currentBit!11706 thiss!1005))))))

(assert (=> b!244123 (= lt!380508 (readBitPure!0 lt!380505))))

(assert (=> b!244123 (= lt!380505 (BitStream!10645 (buf!6333 (_2!11386 lt!380497)) (currentByte!11711 thiss!1005) (currentBit!11706 thiss!1005)))))

(assert (=> b!244123 e!169202))

(declare-fun res!204018 () Bool)

(assert (=> b!244123 (=> (not res!204018) (not e!169202))))

(assert (=> b!244123 (= res!204018 (isPrefixOf!0 thiss!1005 (_2!11386 lt!380495)))))

(declare-fun lt!380501 () Unit!17817)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10644 BitStream!10644 BitStream!10644) Unit!17817)

(assert (=> b!244123 (= lt!380501 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11386 lt!380497) (_2!11386 lt!380495)))))

(declare-fun e!169194 () Bool)

(assert (=> b!244123 e!169194))

(declare-fun res!204016 () Bool)

(assert (=> b!244123 (=> (not res!204016) (not e!169194))))

(assert (=> b!244123 (= res!204016 (= (size!5861 (buf!6333 (_2!11386 lt!380497))) (size!5861 (buf!6333 (_2!11386 lt!380495)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10644 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20928)

(assert (=> b!244123 (= lt!380495 (appendNBitsLoop!0 (_2!11386 lt!380497) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244123 (validate_offset_bits!1 ((_ sign_extend 32) (size!5861 (buf!6333 (_2!11386 lt!380497)))) ((_ sign_extend 32) (currentByte!11711 (_2!11386 lt!380497))) ((_ sign_extend 32) (currentBit!11706 (_2!11386 lt!380497))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380491 () Unit!17817)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10644 BitStream!10644 (_ BitVec 64) (_ BitVec 64)) Unit!17817)

(assert (=> b!244123 (= lt!380491 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11386 lt!380497) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169200 () Bool)

(assert (=> b!244123 e!169200))

(declare-fun res!204008 () Bool)

(assert (=> b!244123 (=> (not res!204008) (not e!169200))))

(assert (=> b!244123 (= res!204008 (= (size!5861 (buf!6333 thiss!1005)) (size!5861 (buf!6333 (_2!11386 lt!380497)))))))

(declare-fun appendBit!0 (BitStream!10644 Bool) tuple2!20928)

(assert (=> b!244123 (= lt!380497 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244124 () Bool)

(assert (=> b!244124 (= e!169194 e!169199)))

(declare-fun res!204011 () Bool)

(assert (=> b!244124 (=> (not res!204011) (not e!169199))))

(assert (=> b!244124 (= res!204011 (= (bitIndex!0 (size!5861 (buf!6333 (_2!11386 lt!380495))) (currentByte!11711 (_2!11386 lt!380495)) (currentBit!11706 (_2!11386 lt!380495))) (bvadd (bitIndex!0 (size!5861 (buf!6333 (_2!11386 lt!380497))) (currentByte!11711 (_2!11386 lt!380497)) (currentBit!11706 (_2!11386 lt!380497))) lt!380499)))))

(assert (=> b!244124 (= lt!380499 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!204007 () Bool)

(assert (=> start!52750 (=> (not res!204007) (not e!169197))))

(assert (=> start!52750 (= res!204007 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52750 e!169197))

(assert (=> start!52750 true))

(declare-fun e!169195 () Bool)

(declare-fun inv!12 (BitStream!10644) Bool)

(assert (=> start!52750 (and (inv!12 thiss!1005) e!169195)))

(declare-fun b!244125 () Bool)

(declare-fun lt!380493 () (_ BitVec 64))

(assert (=> b!244125 (= e!169198 (= (bitIndex!0 (size!5861 (buf!6333 (_1!11387 lt!380504))) (currentByte!11711 (_1!11387 lt!380504)) (currentBit!11706 (_1!11387 lt!380504))) lt!380493))))

(declare-fun b!244126 () Bool)

(declare-fun res!204015 () Bool)

(assert (=> b!244126 (=> (not res!204015) (not e!169199))))

(assert (=> b!244126 (= res!204015 (isPrefixOf!0 (_2!11386 lt!380497) (_2!11386 lt!380495)))))

(declare-fun b!244127 () Bool)

(assert (=> b!244127 (= e!169201 (= (_2!11387 lt!380508) (_2!11387 lt!380494)))))

(declare-fun b!244128 () Bool)

(declare-fun array_inv!5602 (array!13369) Bool)

(assert (=> b!244128 (= e!169195 (array_inv!5602 (buf!6333 thiss!1005)))))

(declare-fun b!244129 () Bool)

(assert (=> b!244129 (= e!169200 e!169196)))

(declare-fun res!204013 () Bool)

(assert (=> b!244129 (=> (not res!204013) (not e!169196))))

(declare-fun lt!380496 () (_ BitVec 64))

(assert (=> b!244129 (= res!204013 (= lt!380493 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380496)))))

(assert (=> b!244129 (= lt!380493 (bitIndex!0 (size!5861 (buf!6333 (_2!11386 lt!380497))) (currentByte!11711 (_2!11386 lt!380497)) (currentBit!11706 (_2!11386 lt!380497))))))

(assert (=> b!244129 (= lt!380496 (bitIndex!0 (size!5861 (buf!6333 thiss!1005)) (currentByte!11711 thiss!1005) (currentBit!11706 thiss!1005)))))

(declare-fun b!244130 () Bool)

(declare-fun res!204006 () Bool)

(assert (=> b!244130 (=> (not res!204006) (not e!169197))))

(assert (=> b!244130 (= res!204006 (validate_offset_bits!1 ((_ sign_extend 32) (size!5861 (buf!6333 thiss!1005))) ((_ sign_extend 32) (currentByte!11711 thiss!1005)) ((_ sign_extend 32) (currentBit!11706 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!52750 res!204007) b!244130))

(assert (= (and b!244130 res!204006) b!244122))

(assert (= (and b!244122 res!204009) b!244123))

(assert (= (and b!244123 res!204008) b!244129))

(assert (= (and b!244129 res!204013) b!244119))

(assert (= (and b!244119 res!204012) b!244117))

(assert (= (and b!244117 res!204010) b!244125))

(assert (= (and b!244123 res!204016) b!244124))

(assert (= (and b!244124 res!204011) b!244126))

(assert (= (and b!244126 res!204015) b!244118))

(assert (= (and b!244123 res!204018) b!244121))

(assert (= (and b!244121 res!204017) b!244120))

(assert (= (and b!244123 res!204014) b!244127))

(assert (= start!52750 b!244128))

(declare-fun m!367889 () Bool)

(assert (=> b!244121 m!367889))

(declare-fun m!367891 () Bool)

(assert (=> b!244119 m!367891))

(declare-fun m!367893 () Bool)

(assert (=> b!244126 m!367893))

(declare-fun m!367895 () Bool)

(assert (=> start!52750 m!367895))

(declare-fun m!367897 () Bool)

(assert (=> b!244125 m!367897))

(declare-fun m!367899 () Bool)

(assert (=> b!244130 m!367899))

(declare-fun m!367901 () Bool)

(assert (=> b!244129 m!367901))

(declare-fun m!367903 () Bool)

(assert (=> b!244129 m!367903))

(declare-fun m!367905 () Bool)

(assert (=> b!244124 m!367905))

(assert (=> b!244124 m!367901))

(declare-fun m!367907 () Bool)

(assert (=> b!244118 m!367907))

(declare-fun m!367909 () Bool)

(assert (=> b!244118 m!367909))

(declare-fun m!367911 () Bool)

(assert (=> b!244118 m!367911))

(declare-fun m!367913 () Bool)

(assert (=> b!244118 m!367913))

(declare-fun m!367915 () Bool)

(assert (=> b!244123 m!367915))

(declare-fun m!367917 () Bool)

(assert (=> b!244123 m!367917))

(declare-fun m!367919 () Bool)

(assert (=> b!244123 m!367919))

(declare-fun m!367921 () Bool)

(assert (=> b!244123 m!367921))

(declare-fun m!367923 () Bool)

(assert (=> b!244123 m!367923))

(declare-fun m!367925 () Bool)

(assert (=> b!244123 m!367925))

(declare-fun m!367927 () Bool)

(assert (=> b!244123 m!367927))

(declare-fun m!367929 () Bool)

(assert (=> b!244123 m!367929))

(assert (=> b!244123 m!367913))

(declare-fun m!367931 () Bool)

(assert (=> b!244123 m!367931))

(declare-fun m!367933 () Bool)

(assert (=> b!244123 m!367933))

(declare-fun m!367935 () Bool)

(assert (=> b!244123 m!367935))

(declare-fun m!367937 () Bool)

(assert (=> b!244123 m!367937))

(declare-fun m!367939 () Bool)

(assert (=> b!244123 m!367939))

(declare-fun m!367941 () Bool)

(assert (=> b!244123 m!367941))

(declare-fun m!367943 () Bool)

(assert (=> b!244123 m!367943))

(declare-fun m!367945 () Bool)

(assert (=> b!244123 m!367945))

(declare-fun m!367947 () Bool)

(assert (=> b!244120 m!367947))

(declare-fun m!367949 () Bool)

(assert (=> b!244128 m!367949))

(declare-fun m!367951 () Bool)

(assert (=> b!244117 m!367951))

(assert (=> b!244117 m!367951))

(declare-fun m!367953 () Bool)

(assert (=> b!244117 m!367953))

(check-sat (not b!244123) (not b!244121) (not b!244130) (not start!52750) (not b!244120) (not b!244118) (not b!244128) (not b!244119) (not b!244129) (not b!244126) (not b!244125) (not b!244124) (not b!244117))
