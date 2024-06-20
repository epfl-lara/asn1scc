; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27702 () Bool)

(assert start!27702)

(declare-fun res!119040 () Bool)

(declare-fun e!94988 () Bool)

(assert (=> start!27702 (=> (not res!119040) (not e!94988))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6525 0))(
  ( (array!6526 (arr!3672 (Array (_ BitVec 32) (_ BitVec 8))) (size!2953 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6525)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27702 (= res!119040 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2953 arr!237))))))

(assert (=> start!27702 e!94988))

(assert (=> start!27702 true))

(declare-fun array_inv!2742 (array!6525) Bool)

(assert (=> start!27702 (array_inv!2742 arr!237)))

(declare-datatypes ((BitStream!5164 0))(
  ( (BitStream!5165 (buf!3380 array!6525) (currentByte!6258 (_ BitVec 32)) (currentBit!6253 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5164)

(declare-fun e!94986 () Bool)

(declare-fun inv!12 (BitStream!5164) Bool)

(assert (=> start!27702 (and (inv!12 thiss!1634) e!94986)))

(declare-fun b!142606 () Bool)

(declare-fun e!94982 () Bool)

(declare-fun e!94984 () Bool)

(assert (=> b!142606 (= e!94982 e!94984)))

(declare-fun res!119038 () Bool)

(assert (=> b!142606 (=> (not res!119038) (not e!94984))))

(declare-datatypes ((Unit!8900 0))(
  ( (Unit!8901) )
))
(declare-datatypes ((tuple2!12652 0))(
  ( (tuple2!12653 (_1!6665 Unit!8900) (_2!6665 BitStream!5164)) )
))
(declare-fun lt!221125 () tuple2!12652)

(declare-fun lt!221131 () tuple2!12652)

(declare-fun lt!221126 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142606 (= res!119038 (= (bitIndex!0 (size!2953 (buf!3380 (_2!6665 lt!221131))) (currentByte!6258 (_2!6665 lt!221131)) (currentBit!6253 (_2!6665 lt!221131))) (bvadd (bitIndex!0 (size!2953 (buf!3380 (_2!6665 lt!221125))) (currentByte!6258 (_2!6665 lt!221125)) (currentBit!6253 (_2!6665 lt!221125))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221126))))))

(assert (=> b!142606 (= lt!221126 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142607 () Bool)

(declare-fun res!119043 () Bool)

(declare-fun e!94989 () Bool)

(assert (=> b!142607 (=> (not res!119043) (not e!94989))))

(declare-fun isPrefixOf!0 (BitStream!5164 BitStream!5164) Bool)

(assert (=> b!142607 (= res!119043 (isPrefixOf!0 thiss!1634 (_2!6665 lt!221125)))))

(declare-fun b!142608 () Bool)

(assert (=> b!142608 (= e!94988 (not (bvslt from!447 (size!2953 arr!237))))))

(declare-datatypes ((tuple2!12654 0))(
  ( (tuple2!12655 (_1!6666 BitStream!5164) (_2!6666 (_ BitVec 8))) )
))
(declare-fun lt!221135 () tuple2!12654)

(declare-datatypes ((tuple2!12656 0))(
  ( (tuple2!12657 (_1!6667 BitStream!5164) (_2!6667 BitStream!5164)) )
))
(declare-fun lt!221130 () tuple2!12656)

(declare-fun readBytePure!0 (BitStream!5164) tuple2!12654)

(assert (=> b!142608 (= lt!221135 (readBytePure!0 (_1!6667 lt!221130)))))

(declare-fun lt!221123 () tuple2!12656)

(declare-fun reader!0 (BitStream!5164 BitStream!5164) tuple2!12656)

(assert (=> b!142608 (= lt!221123 (reader!0 (_2!6665 lt!221125) (_2!6665 lt!221131)))))

(assert (=> b!142608 (= lt!221130 (reader!0 thiss!1634 (_2!6665 lt!221131)))))

(declare-fun e!94983 () Bool)

(assert (=> b!142608 e!94983))

(declare-fun res!119032 () Bool)

(assert (=> b!142608 (=> (not res!119032) (not e!94983))))

(declare-fun lt!221129 () tuple2!12654)

(declare-fun lt!221122 () tuple2!12654)

(assert (=> b!142608 (= res!119032 (= (bitIndex!0 (size!2953 (buf!3380 (_1!6666 lt!221129))) (currentByte!6258 (_1!6666 lt!221129)) (currentBit!6253 (_1!6666 lt!221129))) (bitIndex!0 (size!2953 (buf!3380 (_1!6666 lt!221122))) (currentByte!6258 (_1!6666 lt!221122)) (currentBit!6253 (_1!6666 lt!221122)))))))

(declare-fun lt!221138 () Unit!8900)

(declare-fun lt!221133 () BitStream!5164)

(declare-fun readBytePrefixLemma!0 (BitStream!5164 BitStream!5164) Unit!8900)

(assert (=> b!142608 (= lt!221138 (readBytePrefixLemma!0 lt!221133 (_2!6665 lt!221131)))))

(assert (=> b!142608 (= lt!221122 (readBytePure!0 (BitStream!5165 (buf!3380 (_2!6665 lt!221131)) (currentByte!6258 thiss!1634) (currentBit!6253 thiss!1634))))))

(assert (=> b!142608 (= lt!221129 (readBytePure!0 lt!221133))))

(assert (=> b!142608 (= lt!221133 (BitStream!5165 (buf!3380 (_2!6665 lt!221125)) (currentByte!6258 thiss!1634) (currentBit!6253 thiss!1634)))))

(declare-fun e!94987 () Bool)

(assert (=> b!142608 e!94987))

(declare-fun res!119042 () Bool)

(assert (=> b!142608 (=> (not res!119042) (not e!94987))))

(assert (=> b!142608 (= res!119042 (isPrefixOf!0 thiss!1634 (_2!6665 lt!221131)))))

(declare-fun lt!221134 () Unit!8900)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5164 BitStream!5164 BitStream!5164) Unit!8900)

(assert (=> b!142608 (= lt!221134 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6665 lt!221125) (_2!6665 lt!221131)))))

(assert (=> b!142608 e!94982))

(declare-fun res!119033 () Bool)

(assert (=> b!142608 (=> (not res!119033) (not e!94982))))

(assert (=> b!142608 (= res!119033 (= (size!2953 (buf!3380 (_2!6665 lt!221125))) (size!2953 (buf!3380 (_2!6665 lt!221131)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5164 array!6525 (_ BitVec 32) (_ BitVec 32)) tuple2!12652)

(assert (=> b!142608 (= lt!221131 (appendByteArrayLoop!0 (_2!6665 lt!221125) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142608 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2953 (buf!3380 (_2!6665 lt!221125)))) ((_ sign_extend 32) (currentByte!6258 (_2!6665 lt!221125))) ((_ sign_extend 32) (currentBit!6253 (_2!6665 lt!221125))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221128 () Unit!8900)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5164 BitStream!5164 (_ BitVec 64) (_ BitVec 32)) Unit!8900)

(assert (=> b!142608 (= lt!221128 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6665 lt!221125) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142608 e!94989))

(declare-fun res!119034 () Bool)

(assert (=> b!142608 (=> (not res!119034) (not e!94989))))

(assert (=> b!142608 (= res!119034 (= (size!2953 (buf!3380 thiss!1634)) (size!2953 (buf!3380 (_2!6665 lt!221125)))))))

(declare-fun appendByte!0 (BitStream!5164 (_ BitVec 8)) tuple2!12652)

(assert (=> b!142608 (= lt!221125 (appendByte!0 thiss!1634 (select (arr!3672 arr!237) from!447)))))

(declare-fun b!142609 () Bool)

(declare-fun res!119035 () Bool)

(assert (=> b!142609 (=> (not res!119035) (not e!94984))))

(assert (=> b!142609 (= res!119035 (isPrefixOf!0 (_2!6665 lt!221125) (_2!6665 lt!221131)))))

(declare-fun b!142610 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142610 (= e!94987 (invariant!0 (currentBit!6253 thiss!1634) (currentByte!6258 thiss!1634) (size!2953 (buf!3380 (_2!6665 lt!221125)))))))

(declare-fun b!142611 () Bool)

(assert (=> b!142611 (= e!94983 (= (_2!6666 lt!221129) (_2!6666 lt!221122)))))

(declare-datatypes ((tuple2!12658 0))(
  ( (tuple2!12659 (_1!6668 BitStream!5164) (_2!6668 array!6525)) )
))
(declare-fun lt!221137 () tuple2!12658)

(declare-fun b!142612 () Bool)

(declare-fun e!94980 () Bool)

(declare-fun arrayRangesEq!269 (array!6525 array!6525 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142612 (= e!94980 (not (arrayRangesEq!269 arr!237 (_2!6668 lt!221137) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142613 () Bool)

(declare-fun res!119041 () Bool)

(assert (=> b!142613 (=> (not res!119041) (not e!94988))))

(assert (=> b!142613 (= res!119041 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2953 (buf!3380 thiss!1634))) ((_ sign_extend 32) (currentByte!6258 thiss!1634)) ((_ sign_extend 32) (currentBit!6253 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142614 () Bool)

(declare-fun res!119044 () Bool)

(assert (=> b!142614 (=> (not res!119044) (not e!94988))))

(assert (=> b!142614 (= res!119044 (invariant!0 (currentBit!6253 thiss!1634) (currentByte!6258 thiss!1634) (size!2953 (buf!3380 thiss!1634))))))

(declare-fun b!142615 () Bool)

(assert (=> b!142615 (= e!94986 (array_inv!2742 (buf!3380 thiss!1634)))))

(declare-fun lt!221124 () tuple2!12656)

(declare-fun lt!221127 () tuple2!12654)

(declare-fun b!142616 () Bool)

(assert (=> b!142616 (= e!94989 (and (= (_2!6666 lt!221127) (select (arr!3672 arr!237) from!447)) (= (_1!6666 lt!221127) (_2!6667 lt!221124))))))

(assert (=> b!142616 (= lt!221127 (readBytePure!0 (_1!6667 lt!221124)))))

(assert (=> b!142616 (= lt!221124 (reader!0 thiss!1634 (_2!6665 lt!221125)))))

(declare-fun b!142617 () Bool)

(assert (=> b!142617 (= e!94984 (not e!94980))))

(declare-fun res!119036 () Bool)

(assert (=> b!142617 (=> res!119036 e!94980)))

(declare-fun lt!221132 () tuple2!12656)

(assert (=> b!142617 (= res!119036 (or (not (= (size!2953 (_2!6668 lt!221137)) (size!2953 arr!237))) (not (= (_1!6668 lt!221137) (_2!6667 lt!221132)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5164 array!6525 (_ BitVec 32) (_ BitVec 32)) tuple2!12658)

(assert (=> b!142617 (= lt!221137 (readByteArrayLoopPure!0 (_1!6667 lt!221132) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142617 (validate_offset_bits!1 ((_ sign_extend 32) (size!2953 (buf!3380 (_2!6665 lt!221131)))) ((_ sign_extend 32) (currentByte!6258 (_2!6665 lt!221125))) ((_ sign_extend 32) (currentBit!6253 (_2!6665 lt!221125))) lt!221126)))

(declare-fun lt!221136 () Unit!8900)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5164 array!6525 (_ BitVec 64)) Unit!8900)

(assert (=> b!142617 (= lt!221136 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6665 lt!221125) (buf!3380 (_2!6665 lt!221131)) lt!221126))))

(assert (=> b!142617 (= lt!221132 (reader!0 (_2!6665 lt!221125) (_2!6665 lt!221131)))))

(declare-fun b!142618 () Bool)

(declare-fun res!119037 () Bool)

(assert (=> b!142618 (=> (not res!119037) (not e!94988))))

(assert (=> b!142618 (= res!119037 (bvslt from!447 to!404))))

(declare-fun b!142619 () Bool)

(declare-fun res!119039 () Bool)

(assert (=> b!142619 (=> (not res!119039) (not e!94989))))

(assert (=> b!142619 (= res!119039 (= (bitIndex!0 (size!2953 (buf!3380 (_2!6665 lt!221125))) (currentByte!6258 (_2!6665 lt!221125)) (currentBit!6253 (_2!6665 lt!221125))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2953 (buf!3380 thiss!1634)) (currentByte!6258 thiss!1634) (currentBit!6253 thiss!1634)))))))

(assert (= (and start!27702 res!119040) b!142613))

(assert (= (and b!142613 res!119041) b!142618))

(assert (= (and b!142618 res!119037) b!142614))

(assert (= (and b!142614 res!119044) b!142608))

(assert (= (and b!142608 res!119034) b!142619))

(assert (= (and b!142619 res!119039) b!142607))

(assert (= (and b!142607 res!119043) b!142616))

(assert (= (and b!142608 res!119033) b!142606))

(assert (= (and b!142606 res!119038) b!142609))

(assert (= (and b!142609 res!119035) b!142617))

(assert (= (and b!142617 (not res!119036)) b!142612))

(assert (= (and b!142608 res!119042) b!142610))

(assert (= (and b!142608 res!119032) b!142611))

(assert (= start!27702 b!142615))

(declare-fun m!218897 () Bool)

(assert (=> b!142609 m!218897))

(declare-fun m!218899 () Bool)

(assert (=> b!142614 m!218899))

(declare-fun m!218901 () Bool)

(assert (=> b!142613 m!218901))

(declare-fun m!218903 () Bool)

(assert (=> b!142619 m!218903))

(declare-fun m!218905 () Bool)

(assert (=> b!142619 m!218905))

(declare-fun m!218907 () Bool)

(assert (=> b!142616 m!218907))

(declare-fun m!218909 () Bool)

(assert (=> b!142616 m!218909))

(declare-fun m!218911 () Bool)

(assert (=> b!142616 m!218911))

(declare-fun m!218913 () Bool)

(assert (=> b!142606 m!218913))

(assert (=> b!142606 m!218903))

(declare-fun m!218915 () Bool)

(assert (=> b!142610 m!218915))

(declare-fun m!218917 () Bool)

(assert (=> b!142607 m!218917))

(declare-fun m!218919 () Bool)

(assert (=> start!27702 m!218919))

(declare-fun m!218921 () Bool)

(assert (=> start!27702 m!218921))

(declare-fun m!218923 () Bool)

(assert (=> b!142617 m!218923))

(declare-fun m!218925 () Bool)

(assert (=> b!142617 m!218925))

(declare-fun m!218927 () Bool)

(assert (=> b!142617 m!218927))

(declare-fun m!218929 () Bool)

(assert (=> b!142617 m!218929))

(declare-fun m!218931 () Bool)

(assert (=> b!142612 m!218931))

(declare-fun m!218933 () Bool)

(assert (=> b!142615 m!218933))

(declare-fun m!218935 () Bool)

(assert (=> b!142608 m!218935))

(declare-fun m!218937 () Bool)

(assert (=> b!142608 m!218937))

(declare-fun m!218939 () Bool)

(assert (=> b!142608 m!218939))

(declare-fun m!218941 () Bool)

(assert (=> b!142608 m!218941))

(declare-fun m!218943 () Bool)

(assert (=> b!142608 m!218943))

(declare-fun m!218945 () Bool)

(assert (=> b!142608 m!218945))

(declare-fun m!218947 () Bool)

(assert (=> b!142608 m!218947))

(declare-fun m!218949 () Bool)

(assert (=> b!142608 m!218949))

(declare-fun m!218951 () Bool)

(assert (=> b!142608 m!218951))

(assert (=> b!142608 m!218907))

(declare-fun m!218953 () Bool)

(assert (=> b!142608 m!218953))

(declare-fun m!218955 () Bool)

(assert (=> b!142608 m!218955))

(assert (=> b!142608 m!218929))

(declare-fun m!218957 () Bool)

(assert (=> b!142608 m!218957))

(declare-fun m!218959 () Bool)

(assert (=> b!142608 m!218959))

(assert (=> b!142608 m!218907))

(push 1)

(assert (not b!142609))

(assert (not b!142612))

(assert (not b!142610))

(assert (not b!142613))

(assert (not b!142616))

(assert (not start!27702))

(assert (not b!142614))

(assert (not b!142617))

(assert (not b!142606))

(assert (not b!142608))

(assert (not b!142619))

(assert (not b!142607))

(assert (not b!142615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

