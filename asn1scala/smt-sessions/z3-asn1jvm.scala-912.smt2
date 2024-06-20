; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25656 () Bool)

(assert start!25656)

(declare-fun b!130543 () Bool)

(declare-fun e!86506 () Bool)

(declare-fun e!86505 () Bool)

(assert (=> b!130543 (= e!86506 e!86505)))

(declare-fun res!108214 () Bool)

(assert (=> b!130543 (=> (not res!108214) (not e!86505))))

(declare-datatypes ((array!6036 0))(
  ( (array!6037 (arr!3355 (Array (_ BitVec 32) (_ BitVec 8))) (size!2732 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4728 0))(
  ( (BitStream!4729 (buf!3093 array!6036) (currentByte!5866 (_ BitVec 32)) (currentBit!5861 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8078 0))(
  ( (Unit!8079) )
))
(declare-datatypes ((tuple2!11220 0))(
  ( (tuple2!11221 (_1!5910 Unit!8078) (_2!5910 BitStream!4728)) )
))
(declare-fun lt!201524 () tuple2!11220)

(declare-fun lt!201522 () (_ BitVec 64))

(declare-fun lt!201516 () tuple2!11220)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130543 (= res!108214 (= (bitIndex!0 (size!2732 (buf!3093 (_2!5910 lt!201524))) (currentByte!5866 (_2!5910 lt!201524)) (currentBit!5861 (_2!5910 lt!201524))) (bvadd (bitIndex!0 (size!2732 (buf!3093 (_2!5910 lt!201516))) (currentByte!5866 (_2!5910 lt!201516)) (currentBit!5861 (_2!5910 lt!201516))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201522))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!130543 (= lt!201522 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130544 () Bool)

(declare-fun e!86511 () Bool)

(assert (=> b!130544 (= e!86505 (not e!86511))))

(declare-fun res!108218 () Bool)

(assert (=> b!130544 (=> res!108218 e!86511)))

(declare-datatypes ((tuple2!11222 0))(
  ( (tuple2!11223 (_1!5911 BitStream!4728) (_2!5911 array!6036)) )
))
(declare-fun lt!201517 () tuple2!11222)

(declare-fun arr!237 () array!6036)

(declare-datatypes ((tuple2!11224 0))(
  ( (tuple2!11225 (_1!5912 BitStream!4728) (_2!5912 BitStream!4728)) )
))
(declare-fun lt!201518 () tuple2!11224)

(assert (=> b!130544 (= res!108218 (or (not (= (size!2732 (_2!5911 lt!201517)) (size!2732 arr!237))) (not (= (_1!5911 lt!201517) (_2!5912 lt!201518)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4728 array!6036 (_ BitVec 32) (_ BitVec 32)) tuple2!11222)

(assert (=> b!130544 (= lt!201517 (readByteArrayLoopPure!0 (_1!5912 lt!201518) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130544 (validate_offset_bits!1 ((_ sign_extend 32) (size!2732 (buf!3093 (_2!5910 lt!201524)))) ((_ sign_extend 32) (currentByte!5866 (_2!5910 lt!201516))) ((_ sign_extend 32) (currentBit!5861 (_2!5910 lt!201516))) lt!201522)))

(declare-fun lt!201509 () Unit!8078)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4728 array!6036 (_ BitVec 64)) Unit!8078)

(assert (=> b!130544 (= lt!201509 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5910 lt!201516) (buf!3093 (_2!5910 lt!201524)) lt!201522))))

(declare-fun reader!0 (BitStream!4728 BitStream!4728) tuple2!11224)

(assert (=> b!130544 (= lt!201518 (reader!0 (_2!5910 lt!201516) (_2!5910 lt!201524)))))

(declare-fun b!130545 () Bool)

(declare-fun res!108216 () Bool)

(assert (=> b!130545 (=> (not res!108216) (not e!86505))))

(declare-fun isPrefixOf!0 (BitStream!4728 BitStream!4728) Bool)

(assert (=> b!130545 (= res!108216 (isPrefixOf!0 (_2!5910 lt!201516) (_2!5910 lt!201524)))))

(declare-fun b!130546 () Bool)

(declare-fun e!86508 () Bool)

(declare-fun thiss!1634 () BitStream!4728)

(declare-fun array_inv!2521 (array!6036) Bool)

(assert (=> b!130546 (= e!86508 (array_inv!2521 (buf!3093 thiss!1634)))))

(declare-fun b!130547 () Bool)

(declare-fun res!108222 () Bool)

(declare-fun e!86512 () Bool)

(assert (=> b!130547 (=> (not res!108222) (not e!86512))))

(assert (=> b!130547 (= res!108222 (bvslt from!447 to!404))))

(declare-fun b!130548 () Bool)

(declare-fun res!108217 () Bool)

(declare-fun e!86507 () Bool)

(assert (=> b!130548 (=> (not res!108217) (not e!86507))))

(assert (=> b!130548 (= res!108217 (isPrefixOf!0 thiss!1634 (_2!5910 lt!201516)))))

(declare-fun b!130549 () Bool)

(declare-fun e!86513 () Bool)

(declare-datatypes ((tuple2!11226 0))(
  ( (tuple2!11227 (_1!5913 BitStream!4728) (_2!5913 (_ BitVec 8))) )
))
(declare-fun lt!201520 () tuple2!11226)

(declare-fun lt!201523 () tuple2!11226)

(assert (=> b!130549 (= e!86513 (= (_2!5913 lt!201520) (_2!5913 lt!201523)))))

(declare-fun res!108223 () Bool)

(assert (=> start!25656 (=> (not res!108223) (not e!86512))))

(assert (=> start!25656 (= res!108223 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2732 arr!237))))))

(assert (=> start!25656 e!86512))

(assert (=> start!25656 true))

(assert (=> start!25656 (array_inv!2521 arr!237)))

(declare-fun inv!12 (BitStream!4728) Bool)

(assert (=> start!25656 (and (inv!12 thiss!1634) e!86508)))

(declare-fun b!130550 () Bool)

(declare-fun arrayRangesEq!135 (array!6036 array!6036 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130550 (= e!86511 (not (arrayRangesEq!135 arr!237 (_2!5911 lt!201517) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!201512 () tuple2!11224)

(declare-fun b!130551 () Bool)

(declare-fun lt!201513 () tuple2!11226)

(assert (=> b!130551 (= e!86507 (and (= (_2!5913 lt!201513) (select (arr!3355 arr!237) from!447)) (= (_1!5913 lt!201513) (_2!5912 lt!201512))))))

(declare-fun readBytePure!0 (BitStream!4728) tuple2!11226)

(assert (=> b!130551 (= lt!201513 (readBytePure!0 (_1!5912 lt!201512)))))

(assert (=> b!130551 (= lt!201512 (reader!0 thiss!1634 (_2!5910 lt!201516)))))

(declare-fun b!130552 () Bool)

(declare-fun res!108226 () Bool)

(assert (=> b!130552 (=> (not res!108226) (not e!86512))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130552 (= res!108226 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2732 (buf!3093 thiss!1634))) ((_ sign_extend 32) (currentByte!5866 thiss!1634)) ((_ sign_extend 32) (currentBit!5861 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130553 () Bool)

(assert (=> b!130553 (= e!86512 (not true))))

(declare-fun lt!201511 () tuple2!11224)

(assert (=> b!130553 (= (_2!5913 (readBytePure!0 (_1!5912 lt!201511))) (select (arr!3355 arr!237) from!447))))

(declare-fun lt!201510 () tuple2!11224)

(assert (=> b!130553 (= lt!201510 (reader!0 (_2!5910 lt!201516) (_2!5910 lt!201524)))))

(assert (=> b!130553 (= lt!201511 (reader!0 thiss!1634 (_2!5910 lt!201524)))))

(assert (=> b!130553 e!86513))

(declare-fun res!108220 () Bool)

(assert (=> b!130553 (=> (not res!108220) (not e!86513))))

(assert (=> b!130553 (= res!108220 (= (bitIndex!0 (size!2732 (buf!3093 (_1!5913 lt!201520))) (currentByte!5866 (_1!5913 lt!201520)) (currentBit!5861 (_1!5913 lt!201520))) (bitIndex!0 (size!2732 (buf!3093 (_1!5913 lt!201523))) (currentByte!5866 (_1!5913 lt!201523)) (currentBit!5861 (_1!5913 lt!201523)))))))

(declare-fun lt!201521 () Unit!8078)

(declare-fun lt!201519 () BitStream!4728)

(declare-fun readBytePrefixLemma!0 (BitStream!4728 BitStream!4728) Unit!8078)

(assert (=> b!130553 (= lt!201521 (readBytePrefixLemma!0 lt!201519 (_2!5910 lt!201524)))))

(assert (=> b!130553 (= lt!201523 (readBytePure!0 (BitStream!4729 (buf!3093 (_2!5910 lt!201524)) (currentByte!5866 thiss!1634) (currentBit!5861 thiss!1634))))))

(assert (=> b!130553 (= lt!201520 (readBytePure!0 lt!201519))))

(assert (=> b!130553 (= lt!201519 (BitStream!4729 (buf!3093 (_2!5910 lt!201516)) (currentByte!5866 thiss!1634) (currentBit!5861 thiss!1634)))))

(declare-fun e!86504 () Bool)

(assert (=> b!130553 e!86504))

(declare-fun res!108215 () Bool)

(assert (=> b!130553 (=> (not res!108215) (not e!86504))))

(assert (=> b!130553 (= res!108215 (isPrefixOf!0 thiss!1634 (_2!5910 lt!201524)))))

(declare-fun lt!201514 () Unit!8078)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4728 BitStream!4728 BitStream!4728) Unit!8078)

(assert (=> b!130553 (= lt!201514 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5910 lt!201516) (_2!5910 lt!201524)))))

(assert (=> b!130553 e!86506))

(declare-fun res!108225 () Bool)

(assert (=> b!130553 (=> (not res!108225) (not e!86506))))

(assert (=> b!130553 (= res!108225 (= (size!2732 (buf!3093 (_2!5910 lt!201516))) (size!2732 (buf!3093 (_2!5910 lt!201524)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4728 array!6036 (_ BitVec 32) (_ BitVec 32)) tuple2!11220)

(assert (=> b!130553 (= lt!201524 (appendByteArrayLoop!0 (_2!5910 lt!201516) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130553 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2732 (buf!3093 (_2!5910 lt!201516)))) ((_ sign_extend 32) (currentByte!5866 (_2!5910 lt!201516))) ((_ sign_extend 32) (currentBit!5861 (_2!5910 lt!201516))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201515 () Unit!8078)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4728 BitStream!4728 (_ BitVec 64) (_ BitVec 32)) Unit!8078)

(assert (=> b!130553 (= lt!201515 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5910 lt!201516) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130553 e!86507))

(declare-fun res!108221 () Bool)

(assert (=> b!130553 (=> (not res!108221) (not e!86507))))

(assert (=> b!130553 (= res!108221 (= (size!2732 (buf!3093 thiss!1634)) (size!2732 (buf!3093 (_2!5910 lt!201516)))))))

(declare-fun appendByte!0 (BitStream!4728 (_ BitVec 8)) tuple2!11220)

(assert (=> b!130553 (= lt!201516 (appendByte!0 thiss!1634 (select (arr!3355 arr!237) from!447)))))

(declare-fun b!130554 () Bool)

(declare-fun res!108224 () Bool)

(assert (=> b!130554 (=> (not res!108224) (not e!86507))))

(assert (=> b!130554 (= res!108224 (= (bitIndex!0 (size!2732 (buf!3093 (_2!5910 lt!201516))) (currentByte!5866 (_2!5910 lt!201516)) (currentBit!5861 (_2!5910 lt!201516))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2732 (buf!3093 thiss!1634)) (currentByte!5866 thiss!1634) (currentBit!5861 thiss!1634)))))))

(declare-fun b!130555 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130555 (= e!86504 (invariant!0 (currentBit!5861 thiss!1634) (currentByte!5866 thiss!1634) (size!2732 (buf!3093 (_2!5910 lt!201516)))))))

(declare-fun b!130556 () Bool)

(declare-fun res!108219 () Bool)

(assert (=> b!130556 (=> (not res!108219) (not e!86512))))

(assert (=> b!130556 (= res!108219 (invariant!0 (currentBit!5861 thiss!1634) (currentByte!5866 thiss!1634) (size!2732 (buf!3093 thiss!1634))))))

(assert (= (and start!25656 res!108223) b!130552))

(assert (= (and b!130552 res!108226) b!130547))

(assert (= (and b!130547 res!108222) b!130556))

(assert (= (and b!130556 res!108219) b!130553))

(assert (= (and b!130553 res!108221) b!130554))

(assert (= (and b!130554 res!108224) b!130548))

(assert (= (and b!130548 res!108217) b!130551))

(assert (= (and b!130553 res!108225) b!130543))

(assert (= (and b!130543 res!108214) b!130545))

(assert (= (and b!130545 res!108216) b!130544))

(assert (= (and b!130544 (not res!108218)) b!130550))

(assert (= (and b!130553 res!108215) b!130555))

(assert (= (and b!130553 res!108220) b!130549))

(assert (= start!25656 b!130546))

(declare-fun m!196901 () Bool)

(assert (=> b!130546 m!196901))

(declare-fun m!196903 () Bool)

(assert (=> b!130551 m!196903))

(declare-fun m!196905 () Bool)

(assert (=> b!130551 m!196905))

(declare-fun m!196907 () Bool)

(assert (=> b!130551 m!196907))

(declare-fun m!196909 () Bool)

(assert (=> b!130553 m!196909))

(declare-fun m!196911 () Bool)

(assert (=> b!130553 m!196911))

(declare-fun m!196913 () Bool)

(assert (=> b!130553 m!196913))

(declare-fun m!196915 () Bool)

(assert (=> b!130553 m!196915))

(declare-fun m!196917 () Bool)

(assert (=> b!130553 m!196917))

(declare-fun m!196919 () Bool)

(assert (=> b!130553 m!196919))

(declare-fun m!196921 () Bool)

(assert (=> b!130553 m!196921))

(assert (=> b!130553 m!196903))

(declare-fun m!196923 () Bool)

(assert (=> b!130553 m!196923))

(declare-fun m!196925 () Bool)

(assert (=> b!130553 m!196925))

(declare-fun m!196927 () Bool)

(assert (=> b!130553 m!196927))

(declare-fun m!196929 () Bool)

(assert (=> b!130553 m!196929))

(declare-fun m!196931 () Bool)

(assert (=> b!130553 m!196931))

(declare-fun m!196933 () Bool)

(assert (=> b!130553 m!196933))

(declare-fun m!196935 () Bool)

(assert (=> b!130553 m!196935))

(assert (=> b!130553 m!196903))

(declare-fun m!196937 () Bool)

(assert (=> b!130554 m!196937))

(declare-fun m!196939 () Bool)

(assert (=> b!130554 m!196939))

(declare-fun m!196941 () Bool)

(assert (=> b!130556 m!196941))

(declare-fun m!196943 () Bool)

(assert (=> b!130552 m!196943))

(declare-fun m!196945 () Bool)

(assert (=> b!130555 m!196945))

(declare-fun m!196947 () Bool)

(assert (=> b!130543 m!196947))

(assert (=> b!130543 m!196937))

(declare-fun m!196949 () Bool)

(assert (=> b!130548 m!196949))

(declare-fun m!196951 () Bool)

(assert (=> b!130550 m!196951))

(declare-fun m!196953 () Bool)

(assert (=> b!130545 m!196953))

(declare-fun m!196955 () Bool)

(assert (=> b!130544 m!196955))

(declare-fun m!196957 () Bool)

(assert (=> b!130544 m!196957))

(declare-fun m!196959 () Bool)

(assert (=> b!130544 m!196959))

(assert (=> b!130544 m!196921))

(declare-fun m!196961 () Bool)

(assert (=> start!25656 m!196961))

(declare-fun m!196963 () Bool)

(assert (=> start!25656 m!196963))

(check-sat (not b!130546) (not b!130554) (not b!130543) (not b!130555) (not b!130551) (not b!130544) (not b!130550) (not b!130556) (not b!130548) (not b!130553) (not b!130545) (not start!25656) (not b!130552))
