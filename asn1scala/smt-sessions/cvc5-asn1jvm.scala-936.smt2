; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26390 () Bool)

(assert start!26390)

(declare-fun b!135651 () Bool)

(declare-fun e!90071 () Bool)

(declare-datatypes ((array!6190 0))(
  ( (array!6191 (arr!3468 (Array (_ BitVec 32) (_ BitVec 8))) (size!2803 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4870 0))(
  ( (BitStream!4871 (buf!3196 array!6190) (currentByte!5993 (_ BitVec 32)) (currentBit!5988 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4870)

(declare-fun array_inv!2592 (array!6190) Bool)

(assert (=> b!135651 (= e!90071 (array_inv!2592 (buf!3196 thiss!1634)))))

(declare-fun b!135652 () Bool)

(declare-fun res!112850 () Bool)

(declare-fun e!90068 () Bool)

(assert (=> b!135652 (=> (not res!112850) (not e!90068))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135652 (= res!112850 (invariant!0 (currentBit!5988 thiss!1634) (currentByte!5993 thiss!1634) (size!2803 (buf!3196 thiss!1634))))))

(declare-datatypes ((tuple2!11820 0))(
  ( (tuple2!11821 (_1!6226 BitStream!4870) (_2!6226 (_ BitVec 8))) )
))
(declare-fun lt!210607 () tuple2!11820)

(declare-fun b!135653 () Bool)

(declare-fun e!90072 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11822 0))(
  ( (tuple2!11823 (_1!6227 BitStream!4870) (_2!6227 BitStream!4870)) )
))
(declare-fun lt!210608 () tuple2!11822)

(declare-fun arr!237 () array!6190)

(assert (=> b!135653 (= e!90072 (and (= (_2!6226 lt!210607) (select (arr!3468 arr!237) from!447)) (= (_1!6226 lt!210607) (_2!6227 lt!210608))))))

(declare-fun readBytePure!0 (BitStream!4870) tuple2!11820)

(assert (=> b!135653 (= lt!210607 (readBytePure!0 (_1!6227 lt!210608)))))

(declare-datatypes ((Unit!8444 0))(
  ( (Unit!8445) )
))
(declare-datatypes ((tuple2!11824 0))(
  ( (tuple2!11825 (_1!6228 Unit!8444) (_2!6228 BitStream!4870)) )
))
(declare-fun lt!210617 () tuple2!11824)

(declare-fun reader!0 (BitStream!4870 BitStream!4870) tuple2!11822)

(assert (=> b!135653 (= lt!210608 (reader!0 thiss!1634 (_2!6228 lt!210617)))))

(declare-fun b!135654 () Bool)

(declare-fun e!90076 () Bool)

(declare-fun lt!210605 () tuple2!11820)

(declare-fun lt!210625 () tuple2!11820)

(assert (=> b!135654 (= e!90076 (= (_2!6226 lt!210605) (_2!6226 lt!210625)))))

(declare-fun b!135655 () Bool)

(declare-fun res!112845 () Bool)

(assert (=> b!135655 (=> (not res!112845) (not e!90068))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!135655 (= res!112845 (bvslt from!447 to!404))))

(declare-fun b!135656 () Bool)

(declare-fun e!90074 () Bool)

(declare-fun e!90077 () Bool)

(assert (=> b!135656 (= e!90074 e!90077)))

(declare-fun res!112841 () Bool)

(assert (=> b!135656 (=> (not res!112841) (not e!90077))))

(declare-fun lt!210629 () (_ BitVec 64))

(declare-fun lt!210610 () tuple2!11824)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135656 (= res!112841 (= (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210610))) (currentByte!5993 (_2!6228 lt!210610)) (currentBit!5988 (_2!6228 lt!210610))) (bvadd (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210629))))))

(assert (=> b!135656 (= lt!210629 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135657 () Bool)

(declare-fun res!112849 () Bool)

(assert (=> b!135657 (=> (not res!112849) (not e!90077))))

(declare-fun isPrefixOf!0 (BitStream!4870 BitStream!4870) Bool)

(assert (=> b!135657 (= res!112849 (isPrefixOf!0 (_2!6228 lt!210617) (_2!6228 lt!210610)))))

(declare-datatypes ((tuple2!11826 0))(
  ( (tuple2!11827 (_1!6229 BitStream!4870) (_2!6229 array!6190)) )
))
(declare-fun lt!210627 () tuple2!11826)

(declare-fun b!135658 () Bool)

(declare-fun e!90069 () Bool)

(declare-fun arrayRangesEq!206 (array!6190 array!6190 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135658 (= e!90069 (not (arrayRangesEq!206 arr!237 (_2!6229 lt!210627) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135659 () Bool)

(declare-fun res!112844 () Bool)

(assert (=> b!135659 (=> (not res!112844) (not e!90068))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135659 (= res!112844 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 thiss!1634))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!112847 () Bool)

(assert (=> start!26390 (=> (not res!112847) (not e!90068))))

(assert (=> start!26390 (= res!112847 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2803 arr!237))))))

(assert (=> start!26390 e!90068))

(assert (=> start!26390 true))

(assert (=> start!26390 (array_inv!2592 arr!237)))

(declare-fun inv!12 (BitStream!4870) Bool)

(assert (=> start!26390 (and (inv!12 thiss!1634) e!90071)))

(declare-fun b!135660 () Bool)

(assert (=> b!135660 (= e!90077 (not e!90069))))

(declare-fun res!112853 () Bool)

(assert (=> b!135660 (=> res!112853 e!90069)))

(declare-fun lt!210618 () tuple2!11822)

(assert (=> b!135660 (= res!112853 (or (not (= (size!2803 (_2!6229 lt!210627)) (size!2803 arr!237))) (not (= (_1!6229 lt!210627) (_2!6227 lt!210618)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4870 array!6190 (_ BitVec 32) (_ BitVec 32)) tuple2!11826)

(assert (=> b!135660 (= lt!210627 (readByteArrayLoopPure!0 (_1!6227 lt!210618) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135660 (validate_offset_bits!1 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210629)))

(declare-fun lt!210624 () Unit!8444)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4870 array!6190 (_ BitVec 64)) Unit!8444)

(assert (=> b!135660 (= lt!210624 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6228 lt!210617) (buf!3196 (_2!6228 lt!210610)) lt!210629))))

(assert (=> b!135660 (= lt!210618 (reader!0 (_2!6228 lt!210617) (_2!6228 lt!210610)))))

(declare-fun b!135661 () Bool)

(declare-fun res!112843 () Bool)

(assert (=> b!135661 (=> (not res!112843) (not e!90072))))

(assert (=> b!135661 (= res!112843 (= (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))))

(declare-fun b!135662 () Bool)

(declare-fun e!90070 () Bool)

(assert (=> b!135662 (= e!90068 (not e!90070))))

(declare-fun res!112846 () Bool)

(assert (=> b!135662 (=> res!112846 e!90070)))

(declare-fun lt!210620 () tuple2!11826)

(declare-fun lt!210612 () tuple2!11826)

(assert (=> b!135662 (= res!112846 (not (arrayRangesEq!206 (_2!6229 lt!210612) (_2!6229 lt!210620) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210611 () tuple2!11826)

(assert (=> b!135662 (arrayRangesEq!206 (_2!6229 lt!210612) (_2!6229 lt!210611) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210631 () tuple2!11822)

(declare-fun lt!210613 () Unit!8444)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4870 array!6190 (_ BitVec 32) (_ BitVec 32)) Unit!8444)

(assert (=> b!135662 (= lt!210613 (readByteArrayLoopArrayPrefixLemma!0 (_1!6227 lt!210631) arr!237 from!447 to!404))))

(declare-fun lt!210626 () array!6190)

(declare-fun withMovedByteIndex!0 (BitStream!4870 (_ BitVec 32)) BitStream!4870)

(assert (=> b!135662 (= lt!210611 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6227 lt!210631) #b00000000000000000000000000000001) lt!210626 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210621 () tuple2!11822)

(assert (=> b!135662 (= lt!210620 (readByteArrayLoopPure!0 (_1!6227 lt!210621) lt!210626 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210616 () tuple2!11820)

(assert (=> b!135662 (= lt!210626 (array!6191 (store (arr!3468 arr!237) from!447 (_2!6226 lt!210616)) (size!2803 arr!237)))))

(declare-fun lt!210606 () (_ BitVec 32))

(assert (=> b!135662 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210606)))

(declare-fun lt!210609 () Unit!8444)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4870 array!6190 (_ BitVec 32)) Unit!8444)

(assert (=> b!135662 (= lt!210609 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6228 lt!210617) (buf!3196 (_2!6228 lt!210610)) lt!210606))))

(assert (=> b!135662 (= (_1!6229 lt!210612) (_2!6227 lt!210631))))

(assert (=> b!135662 (= lt!210612 (readByteArrayLoopPure!0 (_1!6227 lt!210631) arr!237 from!447 to!404))))

(assert (=> b!135662 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210615 () Unit!8444)

(assert (=> b!135662 (= lt!210615 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3196 (_2!6228 lt!210610)) (bvsub to!404 from!447)))))

(assert (=> b!135662 (= (_2!6226 lt!210616) (select (arr!3468 arr!237) from!447))))

(assert (=> b!135662 (= lt!210616 (readBytePure!0 (_1!6227 lt!210631)))))

(assert (=> b!135662 (= lt!210621 (reader!0 (_2!6228 lt!210617) (_2!6228 lt!210610)))))

(assert (=> b!135662 (= lt!210631 (reader!0 thiss!1634 (_2!6228 lt!210610)))))

(assert (=> b!135662 e!90076))

(declare-fun res!112842 () Bool)

(assert (=> b!135662 (=> (not res!112842) (not e!90076))))

(assert (=> b!135662 (= res!112842 (= (bitIndex!0 (size!2803 (buf!3196 (_1!6226 lt!210605))) (currentByte!5993 (_1!6226 lt!210605)) (currentBit!5988 (_1!6226 lt!210605))) (bitIndex!0 (size!2803 (buf!3196 (_1!6226 lt!210625))) (currentByte!5993 (_1!6226 lt!210625)) (currentBit!5988 (_1!6226 lt!210625)))))))

(declare-fun lt!210630 () Unit!8444)

(declare-fun lt!210622 () BitStream!4870)

(declare-fun readBytePrefixLemma!0 (BitStream!4870 BitStream!4870) Unit!8444)

(assert (=> b!135662 (= lt!210630 (readBytePrefixLemma!0 lt!210622 (_2!6228 lt!210610)))))

(assert (=> b!135662 (= lt!210625 (readBytePure!0 (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634))))))

(assert (=> b!135662 (= lt!210605 (readBytePure!0 lt!210622))))

(assert (=> b!135662 (= lt!210622 (BitStream!4871 (buf!3196 (_2!6228 lt!210617)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))

(declare-fun e!90075 () Bool)

(assert (=> b!135662 e!90075))

(declare-fun res!112851 () Bool)

(assert (=> b!135662 (=> (not res!112851) (not e!90075))))

(assert (=> b!135662 (= res!112851 (isPrefixOf!0 thiss!1634 (_2!6228 lt!210610)))))

(declare-fun lt!210628 () Unit!8444)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4870 BitStream!4870 BitStream!4870) Unit!8444)

(assert (=> b!135662 (= lt!210628 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6228 lt!210617) (_2!6228 lt!210610)))))

(assert (=> b!135662 e!90074))

(declare-fun res!112848 () Bool)

(assert (=> b!135662 (=> (not res!112848) (not e!90074))))

(assert (=> b!135662 (= res!112848 (= (size!2803 (buf!3196 (_2!6228 lt!210617))) (size!2803 (buf!3196 (_2!6228 lt!210610)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4870 array!6190 (_ BitVec 32) (_ BitVec 32)) tuple2!11824)

(assert (=> b!135662 (= lt!210610 (appendByteArrayLoop!0 (_2!6228 lt!210617) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135662 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210617)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210606)))

(assert (=> b!135662 (= lt!210606 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210619 () Unit!8444)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4870 BitStream!4870 (_ BitVec 64) (_ BitVec 32)) Unit!8444)

(assert (=> b!135662 (= lt!210619 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6228 lt!210617) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135662 e!90072))

(declare-fun res!112852 () Bool)

(assert (=> b!135662 (=> (not res!112852) (not e!90072))))

(assert (=> b!135662 (= res!112852 (= (size!2803 (buf!3196 thiss!1634)) (size!2803 (buf!3196 (_2!6228 lt!210617)))))))

(declare-fun appendByte!0 (BitStream!4870 (_ BitVec 8)) tuple2!11824)

(assert (=> b!135662 (= lt!210617 (appendByte!0 thiss!1634 (select (arr!3468 arr!237) from!447)))))

(declare-fun b!135663 () Bool)

(declare-fun res!112854 () Bool)

(assert (=> b!135663 (=> (not res!112854) (not e!90072))))

(assert (=> b!135663 (= res!112854 (isPrefixOf!0 thiss!1634 (_2!6228 lt!210617)))))

(declare-fun b!135664 () Bool)

(assert (=> b!135664 (= e!90075 (invariant!0 (currentBit!5988 thiss!1634) (currentByte!5993 thiss!1634) (size!2803 (buf!3196 (_2!6228 lt!210617)))))))

(declare-fun b!135665 () Bool)

(assert (=> b!135665 (= e!90070 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsle (size!2803 arr!237) (size!2803 (_2!6229 lt!210612)))))))

(assert (=> b!135665 (arrayRangesEq!206 arr!237 (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210623 () Unit!8444)

(declare-fun arrayRangesEqTransitive!8 (array!6190 array!6190 array!6190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8444)

(assert (=> b!135665 (= lt!210623 (arrayRangesEqTransitive!8 arr!237 (_2!6229 lt!210620) (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!135665 (arrayRangesEq!206 (_2!6229 lt!210620) (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210614 () Unit!8444)

(declare-fun arrayRangesEqSymmetricLemma!19 (array!6190 array!6190 (_ BitVec 32) (_ BitVec 32)) Unit!8444)

(assert (=> b!135665 (= lt!210614 (arrayRangesEqSymmetricLemma!19 (_2!6229 lt!210612) (_2!6229 lt!210620) #b00000000000000000000000000000000 to!404))))

(assert (= (and start!26390 res!112847) b!135659))

(assert (= (and b!135659 res!112844) b!135655))

(assert (= (and b!135655 res!112845) b!135652))

(assert (= (and b!135652 res!112850) b!135662))

(assert (= (and b!135662 res!112852) b!135661))

(assert (= (and b!135661 res!112843) b!135663))

(assert (= (and b!135663 res!112854) b!135653))

(assert (= (and b!135662 res!112848) b!135656))

(assert (= (and b!135656 res!112841) b!135657))

(assert (= (and b!135657 res!112849) b!135660))

(assert (= (and b!135660 (not res!112853)) b!135658))

(assert (= (and b!135662 res!112851) b!135664))

(assert (= (and b!135662 res!112842) b!135654))

(assert (= (and b!135662 (not res!112846)) b!135665))

(assert (= start!26390 b!135651))

(declare-fun m!207067 () Bool)

(assert (=> b!135661 m!207067))

(declare-fun m!207069 () Bool)

(assert (=> b!135661 m!207069))

(declare-fun m!207071 () Bool)

(assert (=> b!135653 m!207071))

(declare-fun m!207073 () Bool)

(assert (=> b!135653 m!207073))

(declare-fun m!207075 () Bool)

(assert (=> b!135653 m!207075))

(declare-fun m!207077 () Bool)

(assert (=> b!135659 m!207077))

(declare-fun m!207079 () Bool)

(assert (=> b!135663 m!207079))

(declare-fun m!207081 () Bool)

(assert (=> b!135656 m!207081))

(assert (=> b!135656 m!207067))

(declare-fun m!207083 () Bool)

(assert (=> b!135664 m!207083))

(declare-fun m!207085 () Bool)

(assert (=> b!135658 m!207085))

(declare-fun m!207087 () Bool)

(assert (=> b!135651 m!207087))

(declare-fun m!207089 () Bool)

(assert (=> start!26390 m!207089))

(declare-fun m!207091 () Bool)

(assert (=> start!26390 m!207091))

(declare-fun m!207093 () Bool)

(assert (=> b!135660 m!207093))

(declare-fun m!207095 () Bool)

(assert (=> b!135660 m!207095))

(declare-fun m!207097 () Bool)

(assert (=> b!135660 m!207097))

(declare-fun m!207099 () Bool)

(assert (=> b!135660 m!207099))

(declare-fun m!207101 () Bool)

(assert (=> b!135652 m!207101))

(declare-fun m!207103 () Bool)

(assert (=> b!135657 m!207103))

(declare-fun m!207105 () Bool)

(assert (=> b!135665 m!207105))

(declare-fun m!207107 () Bool)

(assert (=> b!135665 m!207107))

(declare-fun m!207109 () Bool)

(assert (=> b!135665 m!207109))

(declare-fun m!207111 () Bool)

(assert (=> b!135665 m!207111))

(declare-fun m!207113 () Bool)

(assert (=> b!135662 m!207113))

(declare-fun m!207115 () Bool)

(assert (=> b!135662 m!207115))

(declare-fun m!207117 () Bool)

(assert (=> b!135662 m!207117))

(declare-fun m!207119 () Bool)

(assert (=> b!135662 m!207119))

(declare-fun m!207121 () Bool)

(assert (=> b!135662 m!207121))

(declare-fun m!207123 () Bool)

(assert (=> b!135662 m!207123))

(declare-fun m!207125 () Bool)

(assert (=> b!135662 m!207125))

(declare-fun m!207127 () Bool)

(assert (=> b!135662 m!207127))

(declare-fun m!207129 () Bool)

(assert (=> b!135662 m!207129))

(declare-fun m!207131 () Bool)

(assert (=> b!135662 m!207131))

(declare-fun m!207133 () Bool)

(assert (=> b!135662 m!207133))

(declare-fun m!207135 () Bool)

(assert (=> b!135662 m!207135))

(declare-fun m!207137 () Bool)

(assert (=> b!135662 m!207137))

(assert (=> b!135662 m!207099))

(declare-fun m!207139 () Bool)

(assert (=> b!135662 m!207139))

(declare-fun m!207141 () Bool)

(assert (=> b!135662 m!207141))

(declare-fun m!207143 () Bool)

(assert (=> b!135662 m!207143))

(declare-fun m!207145 () Bool)

(assert (=> b!135662 m!207145))

(assert (=> b!135662 m!207115))

(declare-fun m!207147 () Bool)

(assert (=> b!135662 m!207147))

(declare-fun m!207149 () Bool)

(assert (=> b!135662 m!207149))

(declare-fun m!207151 () Bool)

(assert (=> b!135662 m!207151))

(assert (=> b!135662 m!207071))

(declare-fun m!207153 () Bool)

(assert (=> b!135662 m!207153))

(declare-fun m!207155 () Bool)

(assert (=> b!135662 m!207155))

(declare-fun m!207157 () Bool)

(assert (=> b!135662 m!207157))

(declare-fun m!207159 () Bool)

(assert (=> b!135662 m!207159))

(declare-fun m!207161 () Bool)

(assert (=> b!135662 m!207161))

(assert (=> b!135662 m!207071))

(push 1)

(assert (not b!135664))

(assert (not b!135652))

(assert (not start!26390))

(assert (not b!135656))

(assert (not b!135660))

(assert (not b!135658))

(assert (not b!135661))

(assert (not b!135651))

(assert (not b!135665))

(assert (not b!135659))

(assert (not b!135662))

(assert (not b!135657))

(assert (not b!135653))

(assert (not b!135663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!43423 () Bool)

(declare-fun res!112943 () Bool)

(declare-fun e!90149 () Bool)

(assert (=> d!43423 (=> res!112943 e!90149)))

(assert (=> d!43423 (= res!112943 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43423 (= (arrayRangesEq!206 arr!237 (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404) e!90149)))

(declare-fun b!135760 () Bool)

(declare-fun e!90150 () Bool)

(assert (=> b!135760 (= e!90149 e!90150)))

(declare-fun res!112944 () Bool)

(assert (=> b!135760 (=> (not res!112944) (not e!90150))))

(assert (=> b!135760 (= res!112944 (= (select (arr!3468 arr!237) #b00000000000000000000000000000000) (select (arr!3468 (_2!6229 lt!210612)) #b00000000000000000000000000000000)))))

(declare-fun b!135761 () Bool)

(assert (=> b!135761 (= e!90150 (arrayRangesEq!206 arr!237 (_2!6229 lt!210612) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43423 (not res!112943)) b!135760))

(assert (= (and b!135760 res!112944) b!135761))

(declare-fun m!207355 () Bool)

(assert (=> b!135760 m!207355))

(declare-fun m!207357 () Bool)

(assert (=> b!135760 m!207357))

(declare-fun m!207359 () Bool)

(assert (=> b!135761 m!207359))

(assert (=> b!135665 d!43423))

(declare-fun d!43425 () Bool)

(assert (=> d!43425 (arrayRangesEq!206 arr!237 (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210796 () Unit!8444)

(declare-fun choose!67 (array!6190 array!6190 array!6190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8444)

(assert (=> d!43425 (= lt!210796 (choose!67 arr!237 (_2!6229 lt!210620) (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!43425 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!43425 (= (arrayRangesEqTransitive!8 arr!237 (_2!6229 lt!210620) (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404 to!404) lt!210796)))

(declare-fun bs!10595 () Bool)

(assert (= bs!10595 d!43425))

(assert (=> bs!10595 m!207105))

(declare-fun m!207361 () Bool)

(assert (=> bs!10595 m!207361))

(assert (=> b!135665 d!43425))

(declare-fun d!43427 () Bool)

(declare-fun res!112945 () Bool)

(declare-fun e!90151 () Bool)

(assert (=> d!43427 (=> res!112945 e!90151)))

(assert (=> d!43427 (= res!112945 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43427 (= (arrayRangesEq!206 (_2!6229 lt!210620) (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404) e!90151)))

(declare-fun b!135762 () Bool)

(declare-fun e!90152 () Bool)

(assert (=> b!135762 (= e!90151 e!90152)))

(declare-fun res!112946 () Bool)

(assert (=> b!135762 (=> (not res!112946) (not e!90152))))

(assert (=> b!135762 (= res!112946 (= (select (arr!3468 (_2!6229 lt!210620)) #b00000000000000000000000000000000) (select (arr!3468 (_2!6229 lt!210612)) #b00000000000000000000000000000000)))))

(declare-fun b!135763 () Bool)

(assert (=> b!135763 (= e!90152 (arrayRangesEq!206 (_2!6229 lt!210620) (_2!6229 lt!210612) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43427 (not res!112945)) b!135762))

(assert (= (and b!135762 res!112946) b!135763))

(declare-fun m!207363 () Bool)

(assert (=> b!135762 m!207363))

(assert (=> b!135762 m!207357))

(declare-fun m!207365 () Bool)

(assert (=> b!135763 m!207365))

(assert (=> b!135665 d!43427))

(declare-fun d!43429 () Bool)

(assert (=> d!43429 (arrayRangesEq!206 (_2!6229 lt!210620) (_2!6229 lt!210612) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210799 () Unit!8444)

(declare-fun choose!68 (array!6190 array!6190 (_ BitVec 32) (_ BitVec 32)) Unit!8444)

(assert (=> d!43429 (= lt!210799 (choose!68 (_2!6229 lt!210612) (_2!6229 lt!210620) #b00000000000000000000000000000000 to!404))))

(assert (=> d!43429 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!2803 (_2!6229 lt!210612))))))

(assert (=> d!43429 (= (arrayRangesEqSymmetricLemma!19 (_2!6229 lt!210612) (_2!6229 lt!210620) #b00000000000000000000000000000000 to!404) lt!210799)))

(declare-fun bs!10596 () Bool)

(assert (= bs!10596 d!43429))

(assert (=> bs!10596 m!207109))

(declare-fun m!207367 () Bool)

(assert (=> bs!10596 m!207367))

(assert (=> b!135665 d!43429))

(declare-fun d!43431 () Bool)

(assert (=> d!43431 (= (invariant!0 (currentBit!5988 thiss!1634) (currentByte!5993 thiss!1634) (size!2803 (buf!3196 (_2!6228 lt!210617)))) (and (bvsge (currentBit!5988 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5988 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5993 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5993 thiss!1634) (size!2803 (buf!3196 (_2!6228 lt!210617)))) (and (= (currentBit!5988 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5993 thiss!1634) (size!2803 (buf!3196 (_2!6228 lt!210617))))))))))

(assert (=> b!135664 d!43431))

(declare-fun d!43433 () Bool)

(declare-datatypes ((tuple2!11844 0))(
  ( (tuple2!11845 (_1!6238 (_ BitVec 8)) (_2!6238 BitStream!4870)) )
))
(declare-fun lt!210802 () tuple2!11844)

(declare-fun readByte!0 (BitStream!4870) tuple2!11844)

(assert (=> d!43433 (= lt!210802 (readByte!0 (_1!6227 lt!210608)))))

(assert (=> d!43433 (= (readBytePure!0 (_1!6227 lt!210608)) (tuple2!11821 (_2!6238 lt!210802) (_1!6238 lt!210802)))))

(declare-fun bs!10597 () Bool)

(assert (= bs!10597 d!43433))

(declare-fun m!207369 () Bool)

(assert (=> bs!10597 m!207369))

(assert (=> b!135653 d!43433))

(declare-fun b!135774 () Bool)

(declare-fun e!90157 () Unit!8444)

(declare-fun lt!210849 () Unit!8444)

(assert (=> b!135774 (= e!90157 lt!210849)))

(declare-fun lt!210862 () (_ BitVec 64))

(assert (=> b!135774 (= lt!210862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210857 () (_ BitVec 64))

(assert (=> b!135774 (= lt!210857 (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6190 array!6190 (_ BitVec 64) (_ BitVec 64)) Unit!8444)

(assert (=> b!135774 (= lt!210849 (arrayBitRangesEqSymmetric!0 (buf!3196 thiss!1634) (buf!3196 (_2!6228 lt!210617)) lt!210862 lt!210857))))

(declare-fun arrayBitRangesEq!0 (array!6190 array!6190 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135774 (arrayBitRangesEq!0 (buf!3196 (_2!6228 lt!210617)) (buf!3196 thiss!1634) lt!210862 lt!210857)))

(declare-fun b!135775 () Bool)

(declare-fun res!112954 () Bool)

(declare-fun e!90158 () Bool)

(assert (=> b!135775 (=> (not res!112954) (not e!90158))))

(declare-fun lt!210847 () tuple2!11822)

(assert (=> b!135775 (= res!112954 (isPrefixOf!0 (_1!6227 lt!210847) thiss!1634))))

(declare-fun b!135776 () Bool)

(declare-fun lt!210852 () (_ BitVec 64))

(declare-fun lt!210859 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4870 (_ BitVec 64)) BitStream!4870)

(assert (=> b!135776 (= e!90158 (= (_1!6227 lt!210847) (withMovedBitIndex!0 (_2!6227 lt!210847) (bvsub lt!210852 lt!210859))))))

(assert (=> b!135776 (or (= (bvand lt!210852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!210859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!210852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!210852 lt!210859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135776 (= lt!210859 (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))))))

(assert (=> b!135776 (= lt!210852 (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))

(declare-fun b!135777 () Bool)

(declare-fun res!112955 () Bool)

(assert (=> b!135777 (=> (not res!112955) (not e!90158))))

(assert (=> b!135777 (= res!112955 (isPrefixOf!0 (_2!6227 lt!210847) (_2!6228 lt!210617)))))

(declare-fun d!43435 () Bool)

(assert (=> d!43435 e!90158))

(declare-fun res!112953 () Bool)

(assert (=> d!43435 (=> (not res!112953) (not e!90158))))

(assert (=> d!43435 (= res!112953 (isPrefixOf!0 (_1!6227 lt!210847) (_2!6227 lt!210847)))))

(declare-fun lt!210856 () BitStream!4870)

(assert (=> d!43435 (= lt!210847 (tuple2!11823 lt!210856 (_2!6228 lt!210617)))))

(declare-fun lt!210853 () Unit!8444)

(declare-fun lt!210855 () Unit!8444)

(assert (=> d!43435 (= lt!210853 lt!210855)))

(assert (=> d!43435 (isPrefixOf!0 lt!210856 (_2!6228 lt!210617))))

(assert (=> d!43435 (= lt!210855 (lemmaIsPrefixTransitive!0 lt!210856 (_2!6228 lt!210617) (_2!6228 lt!210617)))))

(declare-fun lt!210854 () Unit!8444)

(declare-fun lt!210858 () Unit!8444)

(assert (=> d!43435 (= lt!210854 lt!210858)))

(assert (=> d!43435 (isPrefixOf!0 lt!210856 (_2!6228 lt!210617))))

(assert (=> d!43435 (= lt!210858 (lemmaIsPrefixTransitive!0 lt!210856 thiss!1634 (_2!6228 lt!210617)))))

(declare-fun lt!210846 () Unit!8444)

(assert (=> d!43435 (= lt!210846 e!90157)))

(declare-fun c!7681 () Bool)

(assert (=> d!43435 (= c!7681 (not (= (size!2803 (buf!3196 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!210850 () Unit!8444)

(declare-fun lt!210851 () Unit!8444)

(assert (=> d!43435 (= lt!210850 lt!210851)))

(assert (=> d!43435 (isPrefixOf!0 (_2!6228 lt!210617) (_2!6228 lt!210617))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4870) Unit!8444)

(assert (=> d!43435 (= lt!210851 (lemmaIsPrefixRefl!0 (_2!6228 lt!210617)))))

(declare-fun lt!210848 () Unit!8444)

(declare-fun lt!210861 () Unit!8444)

(assert (=> d!43435 (= lt!210848 lt!210861)))

(assert (=> d!43435 (= lt!210861 (lemmaIsPrefixRefl!0 (_2!6228 lt!210617)))))

(declare-fun lt!210844 () Unit!8444)

(declare-fun lt!210845 () Unit!8444)

(assert (=> d!43435 (= lt!210844 lt!210845)))

(assert (=> d!43435 (isPrefixOf!0 lt!210856 lt!210856)))

(assert (=> d!43435 (= lt!210845 (lemmaIsPrefixRefl!0 lt!210856))))

(declare-fun lt!210843 () Unit!8444)

(declare-fun lt!210860 () Unit!8444)

(assert (=> d!43435 (= lt!210843 lt!210860)))

(assert (=> d!43435 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43435 (= lt!210860 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43435 (= lt!210856 (BitStream!4871 (buf!3196 (_2!6228 lt!210617)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))

(assert (=> d!43435 (isPrefixOf!0 thiss!1634 (_2!6228 lt!210617))))

(assert (=> d!43435 (= (reader!0 thiss!1634 (_2!6228 lt!210617)) lt!210847)))

(declare-fun b!135778 () Bool)

(declare-fun Unit!8450 () Unit!8444)

(assert (=> b!135778 (= e!90157 Unit!8450)))

(assert (= (and d!43435 c!7681) b!135774))

(assert (= (and d!43435 (not c!7681)) b!135778))

(assert (= (and d!43435 res!112953) b!135775))

(assert (= (and b!135775 res!112954) b!135777))

(assert (= (and b!135777 res!112955) b!135776))

(declare-fun m!207371 () Bool)

(assert (=> b!135776 m!207371))

(assert (=> b!135776 m!207067))

(assert (=> b!135776 m!207069))

(declare-fun m!207373 () Bool)

(assert (=> d!43435 m!207373))

(declare-fun m!207375 () Bool)

(assert (=> d!43435 m!207375))

(declare-fun m!207377 () Bool)

(assert (=> d!43435 m!207377))

(declare-fun m!207379 () Bool)

(assert (=> d!43435 m!207379))

(declare-fun m!207381 () Bool)

(assert (=> d!43435 m!207381))

(declare-fun m!207383 () Bool)

(assert (=> d!43435 m!207383))

(declare-fun m!207385 () Bool)

(assert (=> d!43435 m!207385))

(assert (=> d!43435 m!207079))

(declare-fun m!207387 () Bool)

(assert (=> d!43435 m!207387))

(declare-fun m!207389 () Bool)

(assert (=> d!43435 m!207389))

(declare-fun m!207391 () Bool)

(assert (=> d!43435 m!207391))

(assert (=> b!135774 m!207069))

(declare-fun m!207393 () Bool)

(assert (=> b!135774 m!207393))

(declare-fun m!207395 () Bool)

(assert (=> b!135774 m!207395))

(declare-fun m!207397 () Bool)

(assert (=> b!135775 m!207397))

(declare-fun m!207399 () Bool)

(assert (=> b!135777 m!207399))

(assert (=> b!135653 d!43435))

(declare-fun d!43437 () Bool)

(assert (=> d!43437 (= (invariant!0 (currentBit!5988 thiss!1634) (currentByte!5993 thiss!1634) (size!2803 (buf!3196 thiss!1634))) (and (bvsge (currentBit!5988 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5988 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5993 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5993 thiss!1634) (size!2803 (buf!3196 thiss!1634))) (and (= (currentBit!5988 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5993 thiss!1634) (size!2803 (buf!3196 thiss!1634)))))))))

(assert (=> b!135652 d!43437))

(declare-fun d!43439 () Bool)

(declare-fun res!112963 () Bool)

(declare-fun e!90164 () Bool)

(assert (=> d!43439 (=> (not res!112963) (not e!90164))))

(assert (=> d!43439 (= res!112963 (= (size!2803 (buf!3196 thiss!1634)) (size!2803 (buf!3196 (_2!6228 lt!210617)))))))

(assert (=> d!43439 (= (isPrefixOf!0 thiss!1634 (_2!6228 lt!210617)) e!90164)))

(declare-fun b!135785 () Bool)

(declare-fun res!112964 () Bool)

(assert (=> b!135785 (=> (not res!112964) (not e!90164))))

(assert (=> b!135785 (= res!112964 (bvsle (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)) (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617)))))))

(declare-fun b!135786 () Bool)

(declare-fun e!90163 () Bool)

(assert (=> b!135786 (= e!90164 e!90163)))

(declare-fun res!112962 () Bool)

(assert (=> b!135786 (=> res!112962 e!90163)))

(assert (=> b!135786 (= res!112962 (= (size!2803 (buf!3196 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!135787 () Bool)

(assert (=> b!135787 (= e!90163 (arrayBitRangesEq!0 (buf!3196 thiss!1634) (buf!3196 (_2!6228 lt!210617)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634))))))

(assert (= (and d!43439 res!112963) b!135785))

(assert (= (and b!135785 res!112964) b!135786))

(assert (= (and b!135786 (not res!112962)) b!135787))

(assert (=> b!135785 m!207069))

(assert (=> b!135785 m!207067))

(assert (=> b!135787 m!207069))

(assert (=> b!135787 m!207069))

(declare-fun m!207401 () Bool)

(assert (=> b!135787 m!207401))

(assert (=> b!135663 d!43439))

(declare-fun d!43441 () Bool)

(declare-fun res!112966 () Bool)

(declare-fun e!90166 () Bool)

(assert (=> d!43441 (=> (not res!112966) (not e!90166))))

(assert (=> d!43441 (= res!112966 (= (size!2803 (buf!3196 (_2!6228 lt!210617))) (size!2803 (buf!3196 (_2!6228 lt!210610)))))))

(assert (=> d!43441 (= (isPrefixOf!0 (_2!6228 lt!210617) (_2!6228 lt!210610)) e!90166)))

(declare-fun b!135788 () Bool)

(declare-fun res!112967 () Bool)

(assert (=> b!135788 (=> (not res!112967) (not e!90166))))

(assert (=> b!135788 (= res!112967 (bvsle (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))) (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210610))) (currentByte!5993 (_2!6228 lt!210610)) (currentBit!5988 (_2!6228 lt!210610)))))))

(declare-fun b!135789 () Bool)

(declare-fun e!90165 () Bool)

(assert (=> b!135789 (= e!90166 e!90165)))

(declare-fun res!112965 () Bool)

(assert (=> b!135789 (=> res!112965 e!90165)))

(assert (=> b!135789 (= res!112965 (= (size!2803 (buf!3196 (_2!6228 lt!210617))) #b00000000000000000000000000000000))))

(declare-fun b!135790 () Bool)

(assert (=> b!135790 (= e!90165 (arrayBitRangesEq!0 (buf!3196 (_2!6228 lt!210617)) (buf!3196 (_2!6228 lt!210610)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617)))))))

(assert (= (and d!43441 res!112966) b!135788))

(assert (= (and b!135788 res!112967) b!135789))

(assert (= (and b!135789 (not res!112965)) b!135790))

(assert (=> b!135788 m!207067))

(assert (=> b!135788 m!207081))

(assert (=> b!135790 m!207067))

(assert (=> b!135790 m!207067))

(declare-fun m!207403 () Bool)

(assert (=> b!135790 m!207403))

(assert (=> b!135657 d!43441))

(declare-fun d!43443 () Bool)

(declare-fun e!90169 () Bool)

(assert (=> d!43443 e!90169))

(declare-fun res!112973 () Bool)

(assert (=> d!43443 (=> (not res!112973) (not e!90169))))

(declare-fun lt!210879 () (_ BitVec 64))

(declare-fun lt!210880 () (_ BitVec 64))

(declare-fun lt!210876 () (_ BitVec 64))

(assert (=> d!43443 (= res!112973 (= lt!210876 (bvsub lt!210879 lt!210880)))))

(assert (=> d!43443 (or (= (bvand lt!210879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!210880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!210879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!210879 lt!210880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!43443 (= lt!210880 (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210610))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210610)))))))

(declare-fun lt!210877 () (_ BitVec 64))

(declare-fun lt!210875 () (_ BitVec 64))

(assert (=> d!43443 (= lt!210879 (bvmul lt!210877 lt!210875))))

(assert (=> d!43443 (or (= lt!210877 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!210875 (bvsdiv (bvmul lt!210877 lt!210875) lt!210877)))))

(assert (=> d!43443 (= lt!210875 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43443 (= lt!210877 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))))))

(assert (=> d!43443 (= lt!210876 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210610))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210610)))))))

(assert (=> d!43443 (invariant!0 (currentBit!5988 (_2!6228 lt!210610)) (currentByte!5993 (_2!6228 lt!210610)) (size!2803 (buf!3196 (_2!6228 lt!210610))))))

(assert (=> d!43443 (= (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210610))) (currentByte!5993 (_2!6228 lt!210610)) (currentBit!5988 (_2!6228 lt!210610))) lt!210876)))

(declare-fun b!135795 () Bool)

(declare-fun res!112972 () Bool)

(assert (=> b!135795 (=> (not res!112972) (not e!90169))))

(assert (=> b!135795 (= res!112972 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!210876))))

(declare-fun b!135796 () Bool)

(declare-fun lt!210878 () (_ BitVec 64))

(assert (=> b!135796 (= e!90169 (bvsle lt!210876 (bvmul lt!210878 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135796 (or (= lt!210878 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!210878 #b0000000000000000000000000000000000000000000000000000000000001000) lt!210878)))))

(assert (=> b!135796 (= lt!210878 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))))))

(assert (= (and d!43443 res!112973) b!135795))

(assert (= (and b!135795 res!112972) b!135796))

(declare-fun m!207405 () Bool)

(assert (=> d!43443 m!207405))

(declare-fun m!207407 () Bool)

(assert (=> d!43443 m!207407))

(assert (=> b!135656 d!43443))

(declare-fun d!43445 () Bool)

(declare-fun e!90170 () Bool)

(assert (=> d!43445 e!90170))

(declare-fun res!112975 () Bool)

(assert (=> d!43445 (=> (not res!112975) (not e!90170))))

(declare-fun lt!210882 () (_ BitVec 64))

(declare-fun lt!210885 () (_ BitVec 64))

(declare-fun lt!210886 () (_ BitVec 64))

(assert (=> d!43445 (= res!112975 (= lt!210882 (bvsub lt!210885 lt!210886)))))

(assert (=> d!43445 (or (= (bvand lt!210885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!210886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!210885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!210885 lt!210886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43445 (= lt!210886 (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210617)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617)))))))

(declare-fun lt!210883 () (_ BitVec 64))

(declare-fun lt!210881 () (_ BitVec 64))

(assert (=> d!43445 (= lt!210885 (bvmul lt!210883 lt!210881))))

(assert (=> d!43445 (or (= lt!210883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!210881 (bvsdiv (bvmul lt!210883 lt!210881) lt!210883)))))

(assert (=> d!43445 (= lt!210881 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43445 (= lt!210883 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210617)))))))

(assert (=> d!43445 (= lt!210882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617)))))))

(assert (=> d!43445 (invariant!0 (currentBit!5988 (_2!6228 lt!210617)) (currentByte!5993 (_2!6228 lt!210617)) (size!2803 (buf!3196 (_2!6228 lt!210617))))))

(assert (=> d!43445 (= (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))) lt!210882)))

(declare-fun b!135797 () Bool)

(declare-fun res!112974 () Bool)

(assert (=> b!135797 (=> (not res!112974) (not e!90170))))

(assert (=> b!135797 (= res!112974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!210882))))

(declare-fun b!135798 () Bool)

(declare-fun lt!210884 () (_ BitVec 64))

(assert (=> b!135798 (= e!90170 (bvsle lt!210882 (bvmul lt!210884 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135798 (or (= lt!210884 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!210884 #b0000000000000000000000000000000000000000000000000000000000001000) lt!210884)))))

(assert (=> b!135798 (= lt!210884 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210617)))))))

(assert (= (and d!43445 res!112975) b!135797))

(assert (= (and b!135797 res!112974) b!135798))

(declare-fun m!207409 () Bool)

(assert (=> d!43445 m!207409))

(declare-fun m!207411 () Bool)

(assert (=> d!43445 m!207411))

(assert (=> b!135656 d!43445))

(declare-fun d!43447 () Bool)

(assert (=> d!43447 (= (array_inv!2592 arr!237) (bvsge (size!2803 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26390 d!43447))

(declare-fun d!43449 () Bool)

(assert (=> d!43449 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5988 thiss!1634) (currentByte!5993 thiss!1634) (size!2803 (buf!3196 thiss!1634))))))

(declare-fun bs!10598 () Bool)

(assert (= bs!10598 d!43449))

(assert (=> bs!10598 m!207101))

(assert (=> start!26390 d!43449))

(declare-fun d!43451 () Bool)

(assert (=> d!43451 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 thiss!1634))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 thiss!1634))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10599 () Bool)

(assert (= bs!10599 d!43451))

(declare-fun m!207413 () Bool)

(assert (=> bs!10599 m!207413))

(assert (=> b!135659 d!43451))

(declare-fun d!43453 () Bool)

(declare-fun res!112976 () Bool)

(declare-fun e!90171 () Bool)

(assert (=> d!43453 (=> res!112976 e!90171)))

(assert (=> d!43453 (= res!112976 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43453 (= (arrayRangesEq!206 arr!237 (_2!6229 lt!210627) #b00000000000000000000000000000000 to!404) e!90171)))

(declare-fun b!135799 () Bool)

(declare-fun e!90172 () Bool)

(assert (=> b!135799 (= e!90171 e!90172)))

(declare-fun res!112977 () Bool)

(assert (=> b!135799 (=> (not res!112977) (not e!90172))))

(assert (=> b!135799 (= res!112977 (= (select (arr!3468 arr!237) #b00000000000000000000000000000000) (select (arr!3468 (_2!6229 lt!210627)) #b00000000000000000000000000000000)))))

(declare-fun b!135800 () Bool)

(assert (=> b!135800 (= e!90172 (arrayRangesEq!206 arr!237 (_2!6229 lt!210627) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43453 (not res!112976)) b!135799))

(assert (= (and b!135799 res!112977) b!135800))

(assert (=> b!135799 m!207355))

(declare-fun m!207415 () Bool)

(assert (=> b!135799 m!207415))

(declare-fun m!207417 () Bool)

(assert (=> b!135800 m!207417))

(assert (=> b!135658 d!43453))

(declare-fun d!43455 () Bool)

(declare-fun res!112978 () Bool)

(declare-fun e!90173 () Bool)

(assert (=> d!43455 (=> res!112978 e!90173)))

(assert (=> d!43455 (= res!112978 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43455 (= (arrayRangesEq!206 (_2!6229 lt!210612) (_2!6229 lt!210620) #b00000000000000000000000000000000 to!404) e!90173)))

(declare-fun b!135801 () Bool)

(declare-fun e!90174 () Bool)

(assert (=> b!135801 (= e!90173 e!90174)))

(declare-fun res!112979 () Bool)

(assert (=> b!135801 (=> (not res!112979) (not e!90174))))

(assert (=> b!135801 (= res!112979 (= (select (arr!3468 (_2!6229 lt!210612)) #b00000000000000000000000000000000) (select (arr!3468 (_2!6229 lt!210620)) #b00000000000000000000000000000000)))))

(declare-fun b!135802 () Bool)

(assert (=> b!135802 (= e!90174 (arrayRangesEq!206 (_2!6229 lt!210612) (_2!6229 lt!210620) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43455 (not res!112978)) b!135801))

(assert (= (and b!135801 res!112979) b!135802))

(assert (=> b!135801 m!207357))

(assert (=> b!135801 m!207363))

(declare-fun m!207419 () Bool)

(assert (=> b!135802 m!207419))

(assert (=> b!135662 d!43455))

(declare-fun d!43457 () Bool)

(declare-fun e!90175 () Bool)

(assert (=> d!43457 e!90175))

(declare-fun res!112981 () Bool)

(assert (=> d!43457 (=> (not res!112981) (not e!90175))))

(declare-fun lt!210891 () (_ BitVec 64))

(declare-fun lt!210888 () (_ BitVec 64))

(declare-fun lt!210892 () (_ BitVec 64))

(assert (=> d!43457 (= res!112981 (= lt!210888 (bvsub lt!210891 lt!210892)))))

(assert (=> d!43457 (or (= (bvand lt!210891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!210892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!210891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!210891 lt!210892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43457 (= lt!210892 (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_1!6226 lt!210605)))) ((_ sign_extend 32) (currentByte!5993 (_1!6226 lt!210605))) ((_ sign_extend 32) (currentBit!5988 (_1!6226 lt!210605)))))))

(declare-fun lt!210889 () (_ BitVec 64))

(declare-fun lt!210887 () (_ BitVec 64))

(assert (=> d!43457 (= lt!210891 (bvmul lt!210889 lt!210887))))

(assert (=> d!43457 (or (= lt!210889 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!210887 (bvsdiv (bvmul lt!210889 lt!210887) lt!210889)))))

(assert (=> d!43457 (= lt!210887 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43457 (= lt!210889 ((_ sign_extend 32) (size!2803 (buf!3196 (_1!6226 lt!210605)))))))

(assert (=> d!43457 (= lt!210888 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5993 (_1!6226 lt!210605))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5988 (_1!6226 lt!210605)))))))

(assert (=> d!43457 (invariant!0 (currentBit!5988 (_1!6226 lt!210605)) (currentByte!5993 (_1!6226 lt!210605)) (size!2803 (buf!3196 (_1!6226 lt!210605))))))

(assert (=> d!43457 (= (bitIndex!0 (size!2803 (buf!3196 (_1!6226 lt!210605))) (currentByte!5993 (_1!6226 lt!210605)) (currentBit!5988 (_1!6226 lt!210605))) lt!210888)))

(declare-fun b!135803 () Bool)

(declare-fun res!112980 () Bool)

(assert (=> b!135803 (=> (not res!112980) (not e!90175))))

(assert (=> b!135803 (= res!112980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!210888))))

(declare-fun b!135804 () Bool)

(declare-fun lt!210890 () (_ BitVec 64))

(assert (=> b!135804 (= e!90175 (bvsle lt!210888 (bvmul lt!210890 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135804 (or (= lt!210890 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!210890 #b0000000000000000000000000000000000000000000000000000000000001000) lt!210890)))))

(assert (=> b!135804 (= lt!210890 ((_ sign_extend 32) (size!2803 (buf!3196 (_1!6226 lt!210605)))))))

(assert (= (and d!43457 res!112981) b!135803))

(assert (= (and b!135803 res!112980) b!135804))

(declare-fun m!207421 () Bool)

(assert (=> d!43457 m!207421))

(declare-fun m!207423 () Bool)

(assert (=> d!43457 m!207423))

(assert (=> b!135662 d!43457))

(declare-fun d!43459 () Bool)

(declare-fun e!90178 () Bool)

(assert (=> d!43459 e!90178))

(declare-fun res!112984 () Bool)

(assert (=> d!43459 (=> (not res!112984) (not e!90178))))

(assert (=> d!43459 (= res!112984 (and (or (let ((rhs!3131 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3131 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3131) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!43460 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!43460 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!43460 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3130 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3130 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3130) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!210899 () Unit!8444)

(declare-fun choose!57 (BitStream!4870 BitStream!4870 (_ BitVec 64) (_ BitVec 32)) Unit!8444)

(assert (=> d!43459 (= lt!210899 (choose!57 thiss!1634 (_2!6228 lt!210617) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!43459 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6228 lt!210617) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!210899)))

(declare-fun lt!210900 () (_ BitVec 32))

(declare-fun b!135807 () Bool)

(assert (=> b!135807 (= e!90178 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210617)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) (bvsub (bvsub to!404 from!447) lt!210900)))))

(assert (=> b!135807 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!210900 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!210900) #b10000000000000000000000000000000)))))

(declare-fun lt!210901 () (_ BitVec 64))

(assert (=> b!135807 (= lt!210900 ((_ extract 31 0) lt!210901))))

(assert (=> b!135807 (and (bvslt lt!210901 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!210901 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!135807 (= lt!210901 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!43459 res!112984) b!135807))

(declare-fun m!207425 () Bool)

(assert (=> d!43459 m!207425))

(declare-fun m!207427 () Bool)

(assert (=> b!135807 m!207427))

(assert (=> b!135662 d!43459))

(declare-fun d!43462 () Bool)

(declare-fun res!112985 () Bool)

(declare-fun e!90179 () Bool)

(assert (=> d!43462 (=> res!112985 e!90179)))

(assert (=> d!43462 (= res!112985 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43462 (= (arrayRangesEq!206 (_2!6229 lt!210612) (_2!6229 lt!210611) #b00000000000000000000000000000000 to!404) e!90179)))

(declare-fun b!135808 () Bool)

(declare-fun e!90180 () Bool)

(assert (=> b!135808 (= e!90179 e!90180)))

(declare-fun res!112986 () Bool)

(assert (=> b!135808 (=> (not res!112986) (not e!90180))))

(assert (=> b!135808 (= res!112986 (= (select (arr!3468 (_2!6229 lt!210612)) #b00000000000000000000000000000000) (select (arr!3468 (_2!6229 lt!210611)) #b00000000000000000000000000000000)))))

(declare-fun b!135809 () Bool)

(assert (=> b!135809 (= e!90180 (arrayRangesEq!206 (_2!6229 lt!210612) (_2!6229 lt!210611) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43462 (not res!112985)) b!135808))

(assert (= (and b!135808 res!112986) b!135809))

(assert (=> b!135808 m!207357))

(declare-fun m!207429 () Bool)

(assert (=> b!135808 m!207429))

(declare-fun m!207431 () Bool)

(assert (=> b!135809 m!207431))

(assert (=> b!135662 d!43462))

(declare-fun d!43464 () Bool)

(declare-fun e!90181 () Bool)

(assert (=> d!43464 e!90181))

(declare-fun res!112988 () Bool)

(assert (=> d!43464 (=> (not res!112988) (not e!90181))))

(declare-fun lt!210907 () (_ BitVec 64))

(declare-fun lt!210906 () (_ BitVec 64))

(declare-fun lt!210903 () (_ BitVec 64))

(assert (=> d!43464 (= res!112988 (= lt!210903 (bvsub lt!210906 lt!210907)))))

(assert (=> d!43464 (or (= (bvand lt!210906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!210907 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!210906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!210906 lt!210907) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43464 (= lt!210907 (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_1!6226 lt!210625)))) ((_ sign_extend 32) (currentByte!5993 (_1!6226 lt!210625))) ((_ sign_extend 32) (currentBit!5988 (_1!6226 lt!210625)))))))

(declare-fun lt!210904 () (_ BitVec 64))

(declare-fun lt!210902 () (_ BitVec 64))

(assert (=> d!43464 (= lt!210906 (bvmul lt!210904 lt!210902))))

(assert (=> d!43464 (or (= lt!210904 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!210902 (bvsdiv (bvmul lt!210904 lt!210902) lt!210904)))))

(assert (=> d!43464 (= lt!210902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43464 (= lt!210904 ((_ sign_extend 32) (size!2803 (buf!3196 (_1!6226 lt!210625)))))))

(assert (=> d!43464 (= lt!210903 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5993 (_1!6226 lt!210625))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5988 (_1!6226 lt!210625)))))))

(assert (=> d!43464 (invariant!0 (currentBit!5988 (_1!6226 lt!210625)) (currentByte!5993 (_1!6226 lt!210625)) (size!2803 (buf!3196 (_1!6226 lt!210625))))))

(assert (=> d!43464 (= (bitIndex!0 (size!2803 (buf!3196 (_1!6226 lt!210625))) (currentByte!5993 (_1!6226 lt!210625)) (currentBit!5988 (_1!6226 lt!210625))) lt!210903)))

(declare-fun b!135810 () Bool)

(declare-fun res!112987 () Bool)

(assert (=> b!135810 (=> (not res!112987) (not e!90181))))

(assert (=> b!135810 (= res!112987 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!210903))))

(declare-fun b!135811 () Bool)

(declare-fun lt!210905 () (_ BitVec 64))

(assert (=> b!135811 (= e!90181 (bvsle lt!210903 (bvmul lt!210905 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135811 (or (= lt!210905 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!210905 #b0000000000000000000000000000000000000000000000000000000000001000) lt!210905)))))

(assert (=> b!135811 (= lt!210905 ((_ sign_extend 32) (size!2803 (buf!3196 (_1!6226 lt!210625)))))))

(assert (= (and d!43464 res!112988) b!135810))

(assert (= (and b!135810 res!112987) b!135811))

(declare-fun m!207433 () Bool)

(assert (=> d!43464 m!207433))

(declare-fun m!207435 () Bool)

(assert (=> d!43464 m!207435))

(assert (=> b!135662 d!43464))

(declare-fun d!43466 () Bool)

(declare-fun e!90184 () Bool)

(assert (=> d!43466 e!90184))

(declare-fun res!112991 () Bool)

(assert (=> d!43466 (=> (not res!112991) (not e!90184))))

(declare-fun lt!210919 () tuple2!11820)

(declare-fun lt!210918 () tuple2!11820)

(assert (=> d!43466 (= res!112991 (= (bitIndex!0 (size!2803 (buf!3196 (_1!6226 lt!210919))) (currentByte!5993 (_1!6226 lt!210919)) (currentBit!5988 (_1!6226 lt!210919))) (bitIndex!0 (size!2803 (buf!3196 (_1!6226 lt!210918))) (currentByte!5993 (_1!6226 lt!210918)) (currentBit!5988 (_1!6226 lt!210918)))))))

(declare-fun lt!210916 () Unit!8444)

(declare-fun lt!210917 () BitStream!4870)

(declare-fun choose!14 (BitStream!4870 BitStream!4870 BitStream!4870 tuple2!11820 tuple2!11820 BitStream!4870 (_ BitVec 8) tuple2!11820 tuple2!11820 BitStream!4870 (_ BitVec 8)) Unit!8444)

(assert (=> d!43466 (= lt!210916 (choose!14 lt!210622 (_2!6228 lt!210610) lt!210917 lt!210919 (tuple2!11821 (_1!6226 lt!210919) (_2!6226 lt!210919)) (_1!6226 lt!210919) (_2!6226 lt!210919) lt!210918 (tuple2!11821 (_1!6226 lt!210918) (_2!6226 lt!210918)) (_1!6226 lt!210918) (_2!6226 lt!210918)))))

(assert (=> d!43466 (= lt!210918 (readBytePure!0 lt!210917))))

(assert (=> d!43466 (= lt!210919 (readBytePure!0 lt!210622))))

(assert (=> d!43466 (= lt!210917 (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 lt!210622) (currentBit!5988 lt!210622)))))

(assert (=> d!43466 (= (readBytePrefixLemma!0 lt!210622 (_2!6228 lt!210610)) lt!210916)))

(declare-fun b!135814 () Bool)

(assert (=> b!135814 (= e!90184 (= (_2!6226 lt!210919) (_2!6226 lt!210918)))))

(assert (= (and d!43466 res!112991) b!135814))

(declare-fun m!207437 () Bool)

(assert (=> d!43466 m!207437))

(assert (=> d!43466 m!207123))

(declare-fun m!207439 () Bool)

(assert (=> d!43466 m!207439))

(declare-fun m!207441 () Bool)

(assert (=> d!43466 m!207441))

(declare-fun m!207443 () Bool)

(assert (=> d!43466 m!207443))

(assert (=> b!135662 d!43466))

(declare-fun d!43468 () Bool)

(declare-fun lt!210920 () tuple2!11844)

(assert (=> d!43468 (= lt!210920 (readByte!0 lt!210622))))

(assert (=> d!43468 (= (readBytePure!0 lt!210622) (tuple2!11821 (_2!6238 lt!210920) (_1!6238 lt!210920)))))

(declare-fun bs!10600 () Bool)

(assert (= bs!10600 d!43468))

(declare-fun m!207445 () Bool)

(assert (=> bs!10600 m!207445))

(assert (=> b!135662 d!43468))

(declare-fun d!43470 () Bool)

(declare-fun lt!210929 () tuple2!11826)

(declare-fun lt!210931 () tuple2!11826)

(assert (=> d!43470 (arrayRangesEq!206 (_2!6229 lt!210929) (_2!6229 lt!210931) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210930 () BitStream!4870)

(declare-fun lt!210932 () Unit!8444)

(declare-fun choose!35 (BitStream!4870 array!6190 (_ BitVec 32) (_ BitVec 32) tuple2!11826 array!6190 BitStream!4870 tuple2!11826 array!6190) Unit!8444)

(assert (=> d!43470 (= lt!210932 (choose!35 (_1!6227 lt!210631) arr!237 from!447 to!404 lt!210929 (_2!6229 lt!210929) lt!210930 lt!210931 (_2!6229 lt!210931)))))

(assert (=> d!43470 (= lt!210931 (readByteArrayLoopPure!0 lt!210930 (array!6191 (store (arr!3468 arr!237) from!447 (_2!6226 (readBytePure!0 (_1!6227 lt!210631)))) (size!2803 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43470 (= lt!210930 (withMovedByteIndex!0 (_1!6227 lt!210631) #b00000000000000000000000000000001))))

(assert (=> d!43470 (= lt!210929 (readByteArrayLoopPure!0 (_1!6227 lt!210631) arr!237 from!447 to!404))))

(assert (=> d!43470 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6227 lt!210631) arr!237 from!447 to!404) lt!210932)))

(declare-fun bs!10602 () Bool)

(assert (= bs!10602 d!43470))

(declare-fun m!207447 () Bool)

(assert (=> bs!10602 m!207447))

(declare-fun m!207449 () Bool)

(assert (=> bs!10602 m!207449))

(assert (=> bs!10602 m!207141))

(assert (=> bs!10602 m!207115))

(declare-fun m!207451 () Bool)

(assert (=> bs!10602 m!207451))

(declare-fun m!207453 () Bool)

(assert (=> bs!10602 m!207453))

(assert (=> bs!10602 m!207143))

(assert (=> b!135662 d!43470))

(declare-datatypes ((tuple3!514 0))(
  ( (tuple3!515 (_1!6239 Unit!8444) (_2!6239 BitStream!4870) (_3!316 array!6190)) )
))
(declare-fun lt!210935 () tuple3!514)

(declare-fun d!43472 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4870 array!6190 (_ BitVec 32) (_ BitVec 32)) tuple3!514)

(assert (=> d!43472 (= lt!210935 (readByteArrayLoop!0 (_1!6227 lt!210621) lt!210626 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43472 (= (readByteArrayLoopPure!0 (_1!6227 lt!210621) lt!210626 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11827 (_2!6239 lt!210935) (_3!316 lt!210935)))))

(declare-fun bs!10603 () Bool)

(assert (= bs!10603 d!43472))

(declare-fun m!207455 () Bool)

(assert (=> bs!10603 m!207455))

(assert (=> b!135662 d!43472))

(declare-fun d!43474 () Bool)

(assert (=> d!43474 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210938 () Unit!8444)

(declare-fun choose!26 (BitStream!4870 array!6190 (_ BitVec 32) BitStream!4870) Unit!8444)

(assert (=> d!43474 (= lt!210938 (choose!26 thiss!1634 (buf!3196 (_2!6228 lt!210610)) (bvsub to!404 from!447) (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634))))))

(assert (=> d!43474 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3196 (_2!6228 lt!210610)) (bvsub to!404 from!447)) lt!210938)))

(declare-fun bs!10604 () Bool)

(assert (= bs!10604 d!43474))

(assert (=> bs!10604 m!207161))

(declare-fun m!207457 () Bool)

(assert (=> bs!10604 m!207457))

(assert (=> b!135662 d!43474))

(declare-fun d!43476 () Bool)

(assert (=> d!43476 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210606)))

(declare-fun lt!210939 () Unit!8444)

(assert (=> d!43476 (= lt!210939 (choose!26 (_2!6228 lt!210617) (buf!3196 (_2!6228 lt!210610)) lt!210606 (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617)))))))

(assert (=> d!43476 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6228 lt!210617) (buf!3196 (_2!6228 lt!210610)) lt!210606) lt!210939)))

(declare-fun bs!10605 () Bool)

(assert (= bs!10605 d!43476))

(assert (=> bs!10605 m!207133))

(declare-fun m!207459 () Bool)

(assert (=> bs!10605 m!207459))

(assert (=> b!135662 d!43476))

(declare-fun d!43478 () Bool)

(assert (=> d!43478 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210617)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210606) (bvsle ((_ sign_extend 32) lt!210606) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210617)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10606 () Bool)

(assert (= bs!10606 d!43478))

(assert (=> bs!10606 m!207409))

(assert (=> b!135662 d!43478))

(declare-fun b!135815 () Bool)

(declare-fun e!90185 () Unit!8444)

(declare-fun lt!210946 () Unit!8444)

(assert (=> b!135815 (= e!90185 lt!210946)))

(declare-fun lt!210959 () (_ BitVec 64))

(assert (=> b!135815 (= lt!210959 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!210954 () (_ BitVec 64))

(assert (=> b!135815 (= lt!210954 (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))

(assert (=> b!135815 (= lt!210946 (arrayBitRangesEqSymmetric!0 (buf!3196 thiss!1634) (buf!3196 (_2!6228 lt!210610)) lt!210959 lt!210954))))

(assert (=> b!135815 (arrayBitRangesEq!0 (buf!3196 (_2!6228 lt!210610)) (buf!3196 thiss!1634) lt!210959 lt!210954)))

(declare-fun b!135816 () Bool)

(declare-fun res!112993 () Bool)

(declare-fun e!90186 () Bool)

(assert (=> b!135816 (=> (not res!112993) (not e!90186))))

(declare-fun lt!210944 () tuple2!11822)

(assert (=> b!135816 (= res!112993 (isPrefixOf!0 (_1!6227 lt!210944) thiss!1634))))

(declare-fun b!135817 () Bool)

(declare-fun lt!210949 () (_ BitVec 64))

(declare-fun lt!210956 () (_ BitVec 64))

(assert (=> b!135817 (= e!90186 (= (_1!6227 lt!210944) (withMovedBitIndex!0 (_2!6227 lt!210944) (bvsub lt!210949 lt!210956))))))

(assert (=> b!135817 (or (= (bvand lt!210949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!210956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!210949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!210949 lt!210956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135817 (= lt!210956 (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210610))) (currentByte!5993 (_2!6228 lt!210610)) (currentBit!5988 (_2!6228 lt!210610))))))

(assert (=> b!135817 (= lt!210949 (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))

(declare-fun b!135818 () Bool)

(declare-fun res!112994 () Bool)

(assert (=> b!135818 (=> (not res!112994) (not e!90186))))

(assert (=> b!135818 (= res!112994 (isPrefixOf!0 (_2!6227 lt!210944) (_2!6228 lt!210610)))))

(declare-fun d!43480 () Bool)

(assert (=> d!43480 e!90186))

(declare-fun res!112992 () Bool)

(assert (=> d!43480 (=> (not res!112992) (not e!90186))))

(assert (=> d!43480 (= res!112992 (isPrefixOf!0 (_1!6227 lt!210944) (_2!6227 lt!210944)))))

(declare-fun lt!210953 () BitStream!4870)

(assert (=> d!43480 (= lt!210944 (tuple2!11823 lt!210953 (_2!6228 lt!210610)))))

(declare-fun lt!210950 () Unit!8444)

(declare-fun lt!210952 () Unit!8444)

(assert (=> d!43480 (= lt!210950 lt!210952)))

(assert (=> d!43480 (isPrefixOf!0 lt!210953 (_2!6228 lt!210610))))

(assert (=> d!43480 (= lt!210952 (lemmaIsPrefixTransitive!0 lt!210953 (_2!6228 lt!210610) (_2!6228 lt!210610)))))

(declare-fun lt!210951 () Unit!8444)

(declare-fun lt!210955 () Unit!8444)

(assert (=> d!43480 (= lt!210951 lt!210955)))

(assert (=> d!43480 (isPrefixOf!0 lt!210953 (_2!6228 lt!210610))))

(assert (=> d!43480 (= lt!210955 (lemmaIsPrefixTransitive!0 lt!210953 thiss!1634 (_2!6228 lt!210610)))))

(declare-fun lt!210943 () Unit!8444)

(assert (=> d!43480 (= lt!210943 e!90185)))

(declare-fun c!7682 () Bool)

(assert (=> d!43480 (= c!7682 (not (= (size!2803 (buf!3196 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!210947 () Unit!8444)

(declare-fun lt!210948 () Unit!8444)

(assert (=> d!43480 (= lt!210947 lt!210948)))

(assert (=> d!43480 (isPrefixOf!0 (_2!6228 lt!210610) (_2!6228 lt!210610))))

(assert (=> d!43480 (= lt!210948 (lemmaIsPrefixRefl!0 (_2!6228 lt!210610)))))

(declare-fun lt!210945 () Unit!8444)

(declare-fun lt!210958 () Unit!8444)

(assert (=> d!43480 (= lt!210945 lt!210958)))

(assert (=> d!43480 (= lt!210958 (lemmaIsPrefixRefl!0 (_2!6228 lt!210610)))))

(declare-fun lt!210941 () Unit!8444)

(declare-fun lt!210942 () Unit!8444)

(assert (=> d!43480 (= lt!210941 lt!210942)))

(assert (=> d!43480 (isPrefixOf!0 lt!210953 lt!210953)))

(assert (=> d!43480 (= lt!210942 (lemmaIsPrefixRefl!0 lt!210953))))

(declare-fun lt!210940 () Unit!8444)

(declare-fun lt!210957 () Unit!8444)

(assert (=> d!43480 (= lt!210940 lt!210957)))

(assert (=> d!43480 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43480 (= lt!210957 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43480 (= lt!210953 (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))

(assert (=> d!43480 (isPrefixOf!0 thiss!1634 (_2!6228 lt!210610))))

(assert (=> d!43480 (= (reader!0 thiss!1634 (_2!6228 lt!210610)) lt!210944)))

(declare-fun b!135819 () Bool)

(declare-fun Unit!8451 () Unit!8444)

(assert (=> b!135819 (= e!90185 Unit!8451)))

(assert (= (and d!43480 c!7682) b!135815))

(assert (= (and d!43480 (not c!7682)) b!135819))

(assert (= (and d!43480 res!112992) b!135816))

(assert (= (and b!135816 res!112993) b!135818))

(assert (= (and b!135818 res!112994) b!135817))

(declare-fun m!207461 () Bool)

(assert (=> b!135817 m!207461))

(assert (=> b!135817 m!207081))

(assert (=> b!135817 m!207069))

(declare-fun m!207463 () Bool)

(assert (=> d!43480 m!207463))

(declare-fun m!207465 () Bool)

(assert (=> d!43480 m!207465))

(declare-fun m!207467 () Bool)

(assert (=> d!43480 m!207467))

(declare-fun m!207469 () Bool)

(assert (=> d!43480 m!207469))

(declare-fun m!207471 () Bool)

(assert (=> d!43480 m!207471))

(declare-fun m!207473 () Bool)

(assert (=> d!43480 m!207473))

(declare-fun m!207475 () Bool)

(assert (=> d!43480 m!207475))

(assert (=> d!43480 m!207113))

(assert (=> d!43480 m!207387))

(assert (=> d!43480 m!207389))

(declare-fun m!207477 () Bool)

(assert (=> d!43480 m!207477))

(assert (=> b!135815 m!207069))

(declare-fun m!207479 () Bool)

(assert (=> b!135815 m!207479))

(declare-fun m!207481 () Bool)

(assert (=> b!135815 m!207481))

(declare-fun m!207483 () Bool)

(assert (=> b!135816 m!207483))

(declare-fun m!207485 () Bool)

(assert (=> b!135818 m!207485))

(assert (=> b!135662 d!43480))

(declare-fun d!43482 () Bool)

(declare-fun lt!210960 () tuple2!11844)

(assert (=> d!43482 (= lt!210960 (readByte!0 (_1!6227 lt!210631)))))

(assert (=> d!43482 (= (readBytePure!0 (_1!6227 lt!210631)) (tuple2!11821 (_2!6238 lt!210960) (_1!6238 lt!210960)))))

(declare-fun bs!10607 () Bool)

(assert (= bs!10607 d!43482))

(declare-fun m!207487 () Bool)

(assert (=> bs!10607 m!207487))

(assert (=> b!135662 d!43482))

(declare-fun d!43484 () Bool)

(declare-fun res!112996 () Bool)

(declare-fun e!90188 () Bool)

(assert (=> d!43484 (=> (not res!112996) (not e!90188))))

(assert (=> d!43484 (= res!112996 (= (size!2803 (buf!3196 thiss!1634)) (size!2803 (buf!3196 (_2!6228 lt!210610)))))))

(assert (=> d!43484 (= (isPrefixOf!0 thiss!1634 (_2!6228 lt!210610)) e!90188)))

(declare-fun b!135820 () Bool)

(declare-fun res!112997 () Bool)

(assert (=> b!135820 (=> (not res!112997) (not e!90188))))

(assert (=> b!135820 (= res!112997 (bvsle (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)) (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210610))) (currentByte!5993 (_2!6228 lt!210610)) (currentBit!5988 (_2!6228 lt!210610)))))))

(declare-fun b!135821 () Bool)

(declare-fun e!90187 () Bool)

(assert (=> b!135821 (= e!90188 e!90187)))

(declare-fun res!112995 () Bool)

(assert (=> b!135821 (=> res!112995 e!90187)))

(assert (=> b!135821 (= res!112995 (= (size!2803 (buf!3196 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!135822 () Bool)

(assert (=> b!135822 (= e!90187 (arrayBitRangesEq!0 (buf!3196 thiss!1634) (buf!3196 (_2!6228 lt!210610)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634))))))

(assert (= (and d!43484 res!112996) b!135820))

(assert (= (and b!135820 res!112997) b!135821))

(assert (= (and b!135821 (not res!112995)) b!135822))

(assert (=> b!135820 m!207069))

(assert (=> b!135820 m!207081))

(assert (=> b!135822 m!207069))

(assert (=> b!135822 m!207069))

(declare-fun m!207489 () Bool)

(assert (=> b!135822 m!207489))

(assert (=> b!135662 d!43484))

(declare-fun d!43486 () Bool)

(assert (=> d!43486 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210606) (bvsle ((_ sign_extend 32) lt!210606) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10608 () Bool)

(assert (= bs!10608 d!43486))

(declare-fun m!207491 () Bool)

(assert (=> bs!10608 m!207491))

(assert (=> b!135662 d!43486))

(declare-fun d!43488 () Bool)

(declare-fun e!90196 () Bool)

(assert (=> d!43488 e!90196))

(declare-fun res!113011 () Bool)

(assert (=> d!43488 (=> (not res!113011) (not e!90196))))

(declare-fun lt!210985 () tuple2!11824)

(assert (=> d!43488 (= res!113011 (= (size!2803 (buf!3196 (_2!6228 lt!210617))) (size!2803 (buf!3196 (_2!6228 lt!210985)))))))

(declare-fun choose!64 (BitStream!4870 array!6190 (_ BitVec 32) (_ BitVec 32)) tuple2!11824)

(assert (=> d!43488 (= lt!210985 (choose!64 (_2!6228 lt!210617) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43488 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2803 arr!237)))))

(assert (=> d!43488 (= (appendByteArrayLoop!0 (_2!6228 lt!210617) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!210985)))

(declare-fun b!135833 () Bool)

(declare-fun e!90197 () Bool)

(assert (=> b!135833 (= e!90196 e!90197)))

(declare-fun res!113008 () Bool)

(assert (=> b!135833 (=> (not res!113008) (not e!90197))))

(declare-fun lt!210987 () tuple2!11822)

(declare-fun lt!210980 () tuple2!11826)

(assert (=> b!135833 (= res!113008 (and (= (size!2803 (_2!6229 lt!210980)) (size!2803 arr!237)) (= (_1!6229 lt!210980) (_2!6227 lt!210987))))))

(assert (=> b!135833 (= lt!210980 (readByteArrayLoopPure!0 (_1!6227 lt!210987) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210979 () Unit!8444)

(declare-fun lt!210983 () Unit!8444)

(assert (=> b!135833 (= lt!210979 lt!210983)))

(declare-fun lt!210984 () (_ BitVec 64))

(assert (=> b!135833 (validate_offset_bits!1 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210985)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210984)))

(assert (=> b!135833 (= lt!210983 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6228 lt!210617) (buf!3196 (_2!6228 lt!210985)) lt!210984))))

(declare-fun e!90195 () Bool)

(assert (=> b!135833 e!90195))

(declare-fun res!113010 () Bool)

(assert (=> b!135833 (=> (not res!113010) (not e!90195))))

(assert (=> b!135833 (= res!113010 (and (= (size!2803 (buf!3196 (_2!6228 lt!210617))) (size!2803 (buf!3196 (_2!6228 lt!210985)))) (bvsge lt!210984 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135833 (= lt!210984 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!135833 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!135833 (= lt!210987 (reader!0 (_2!6228 lt!210617) (_2!6228 lt!210985)))))

(declare-fun b!135834 () Bool)

(declare-fun res!113012 () Bool)

(assert (=> b!135834 (=> (not res!113012) (not e!90196))))

(declare-fun lt!210982 () (_ BitVec 64))

(declare-fun lt!210981 () (_ BitVec 64))

(assert (=> b!135834 (= res!113012 (= (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210985))) (currentByte!5993 (_2!6228 lt!210985)) (currentBit!5988 (_2!6228 lt!210985))) (bvadd lt!210981 lt!210982)))))

(assert (=> b!135834 (or (not (= (bvand lt!210981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!210982 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!210981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!210981 lt!210982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!210986 () (_ BitVec 64))

(assert (=> b!135834 (= lt!210982 (bvmul lt!210986 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!135834 (or (= lt!210986 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!210986 #b0000000000000000000000000000000000000000000000000000000000001000) lt!210986)))))

(assert (=> b!135834 (= lt!210986 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!135834 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!135834 (= lt!210981 (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))))))

(declare-fun b!135835 () Bool)

(assert (=> b!135835 (= e!90197 (arrayRangesEq!206 arr!237 (_2!6229 lt!210980) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135836 () Bool)

(declare-fun res!113009 () Bool)

(assert (=> b!135836 (=> (not res!113009) (not e!90196))))

(assert (=> b!135836 (= res!113009 (isPrefixOf!0 (_2!6228 lt!210617) (_2!6228 lt!210985)))))

(declare-fun b!135837 () Bool)

(assert (=> b!135837 (= e!90195 (validate_offset_bits!1 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210617)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210984))))

(assert (= (and d!43488 res!113011) b!135834))

(assert (= (and b!135834 res!113012) b!135836))

(assert (= (and b!135836 res!113009) b!135833))

(assert (= (and b!135833 res!113010) b!135837))

(assert (= (and b!135833 res!113008) b!135835))

(declare-fun m!207493 () Bool)

(assert (=> b!135835 m!207493))

(declare-fun m!207495 () Bool)

(assert (=> b!135833 m!207495))

(declare-fun m!207497 () Bool)

(assert (=> b!135833 m!207497))

(declare-fun m!207499 () Bool)

(assert (=> b!135833 m!207499))

(declare-fun m!207501 () Bool)

(assert (=> b!135833 m!207501))

(declare-fun m!207503 () Bool)

(assert (=> b!135837 m!207503))

(declare-fun m!207505 () Bool)

(assert (=> d!43488 m!207505))

(declare-fun m!207507 () Bool)

(assert (=> b!135834 m!207507))

(assert (=> b!135834 m!207067))

(declare-fun m!207509 () Bool)

(assert (=> b!135836 m!207509))

(assert (=> b!135662 d!43488))

(declare-fun d!43490 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4870 (_ BitVec 32)) tuple2!11824)

(assert (=> d!43490 (= (withMovedByteIndex!0 (_1!6227 lt!210631) #b00000000000000000000000000000001) (_2!6228 (moveByteIndex!0 (_1!6227 lt!210631) #b00000000000000000000000000000001)))))

(declare-fun bs!10609 () Bool)

(assert (= bs!10609 d!43490))

(declare-fun m!207511 () Bool)

(assert (=> bs!10609 m!207511))

(assert (=> b!135662 d!43490))

(declare-fun lt!210988 () tuple3!514)

(declare-fun d!43492 () Bool)

(assert (=> d!43492 (= lt!210988 (readByteArrayLoop!0 (_1!6227 lt!210631) arr!237 from!447 to!404))))

(assert (=> d!43492 (= (readByteArrayLoopPure!0 (_1!6227 lt!210631) arr!237 from!447 to!404) (tuple2!11827 (_2!6239 lt!210988) (_3!316 lt!210988)))))

(declare-fun bs!10610 () Bool)

(assert (= bs!10610 d!43492))

(declare-fun m!207513 () Bool)

(assert (=> bs!10610 m!207513))

(assert (=> b!135662 d!43492))

(declare-fun d!43494 () Bool)

(declare-fun lt!210989 () tuple2!11844)

(assert (=> d!43494 (= lt!210989 (readByte!0 (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634))))))

(assert (=> d!43494 (= (readBytePure!0 (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634))) (tuple2!11821 (_2!6238 lt!210989) (_1!6238 lt!210989)))))

(declare-fun bs!10611 () Bool)

(assert (= bs!10611 d!43494))

(declare-fun m!207515 () Bool)

(assert (=> bs!10611 m!207515))

(assert (=> b!135662 d!43494))

(declare-fun d!43496 () Bool)

(assert (=> d!43496 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10612 () Bool)

(assert (= bs!10612 d!43496))

(declare-fun m!207517 () Bool)

(assert (=> bs!10612 m!207517))

(assert (=> b!135662 d!43496))

(declare-fun b!135838 () Bool)

(declare-fun e!90198 () Unit!8444)

(declare-fun lt!210996 () Unit!8444)

(assert (=> b!135838 (= e!90198 lt!210996)))

(declare-fun lt!211009 () (_ BitVec 64))

(assert (=> b!135838 (= lt!211009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211004 () (_ BitVec 64))

(assert (=> b!135838 (= lt!211004 (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))))))

(assert (=> b!135838 (= lt!210996 (arrayBitRangesEqSymmetric!0 (buf!3196 (_2!6228 lt!210617)) (buf!3196 (_2!6228 lt!210610)) lt!211009 lt!211004))))

(assert (=> b!135838 (arrayBitRangesEq!0 (buf!3196 (_2!6228 lt!210610)) (buf!3196 (_2!6228 lt!210617)) lt!211009 lt!211004)))

(declare-fun b!135839 () Bool)

(declare-fun res!113014 () Bool)

(declare-fun e!90199 () Bool)

(assert (=> b!135839 (=> (not res!113014) (not e!90199))))

(declare-fun lt!210994 () tuple2!11822)

(assert (=> b!135839 (= res!113014 (isPrefixOf!0 (_1!6227 lt!210994) (_2!6228 lt!210617)))))

(declare-fun b!135840 () Bool)

(declare-fun lt!211006 () (_ BitVec 64))

(declare-fun lt!210999 () (_ BitVec 64))

(assert (=> b!135840 (= e!90199 (= (_1!6227 lt!210994) (withMovedBitIndex!0 (_2!6227 lt!210994) (bvsub lt!210999 lt!211006))))))

(assert (=> b!135840 (or (= (bvand lt!210999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211006 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!210999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!210999 lt!211006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135840 (= lt!211006 (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210610))) (currentByte!5993 (_2!6228 lt!210610)) (currentBit!5988 (_2!6228 lt!210610))))))

(assert (=> b!135840 (= lt!210999 (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!210617))) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))))))

(declare-fun b!135841 () Bool)

(declare-fun res!113015 () Bool)

(assert (=> b!135841 (=> (not res!113015) (not e!90199))))

(assert (=> b!135841 (= res!113015 (isPrefixOf!0 (_2!6227 lt!210994) (_2!6228 lt!210610)))))

(declare-fun d!43498 () Bool)

(assert (=> d!43498 e!90199))

(declare-fun res!113013 () Bool)

(assert (=> d!43498 (=> (not res!113013) (not e!90199))))

(assert (=> d!43498 (= res!113013 (isPrefixOf!0 (_1!6227 lt!210994) (_2!6227 lt!210994)))))

(declare-fun lt!211003 () BitStream!4870)

(assert (=> d!43498 (= lt!210994 (tuple2!11823 lt!211003 (_2!6228 lt!210610)))))

(declare-fun lt!211000 () Unit!8444)

(declare-fun lt!211002 () Unit!8444)

(assert (=> d!43498 (= lt!211000 lt!211002)))

(assert (=> d!43498 (isPrefixOf!0 lt!211003 (_2!6228 lt!210610))))

(assert (=> d!43498 (= lt!211002 (lemmaIsPrefixTransitive!0 lt!211003 (_2!6228 lt!210610) (_2!6228 lt!210610)))))

(declare-fun lt!211001 () Unit!8444)

(declare-fun lt!211005 () Unit!8444)

(assert (=> d!43498 (= lt!211001 lt!211005)))

(assert (=> d!43498 (isPrefixOf!0 lt!211003 (_2!6228 lt!210610))))

(assert (=> d!43498 (= lt!211005 (lemmaIsPrefixTransitive!0 lt!211003 (_2!6228 lt!210617) (_2!6228 lt!210610)))))

(declare-fun lt!210993 () Unit!8444)

(assert (=> d!43498 (= lt!210993 e!90198)))

(declare-fun c!7683 () Bool)

(assert (=> d!43498 (= c!7683 (not (= (size!2803 (buf!3196 (_2!6228 lt!210617))) #b00000000000000000000000000000000)))))

(declare-fun lt!210997 () Unit!8444)

(declare-fun lt!210998 () Unit!8444)

(assert (=> d!43498 (= lt!210997 lt!210998)))

(assert (=> d!43498 (isPrefixOf!0 (_2!6228 lt!210610) (_2!6228 lt!210610))))

(assert (=> d!43498 (= lt!210998 (lemmaIsPrefixRefl!0 (_2!6228 lt!210610)))))

(declare-fun lt!210995 () Unit!8444)

(declare-fun lt!211008 () Unit!8444)

(assert (=> d!43498 (= lt!210995 lt!211008)))

(assert (=> d!43498 (= lt!211008 (lemmaIsPrefixRefl!0 (_2!6228 lt!210610)))))

(declare-fun lt!210991 () Unit!8444)

(declare-fun lt!210992 () Unit!8444)

(assert (=> d!43498 (= lt!210991 lt!210992)))

(assert (=> d!43498 (isPrefixOf!0 lt!211003 lt!211003)))

(assert (=> d!43498 (= lt!210992 (lemmaIsPrefixRefl!0 lt!211003))))

(declare-fun lt!210990 () Unit!8444)

(declare-fun lt!211007 () Unit!8444)

(assert (=> d!43498 (= lt!210990 lt!211007)))

(assert (=> d!43498 (isPrefixOf!0 (_2!6228 lt!210617) (_2!6228 lt!210617))))

(assert (=> d!43498 (= lt!211007 (lemmaIsPrefixRefl!0 (_2!6228 lt!210617)))))

(assert (=> d!43498 (= lt!211003 (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617))))))

(assert (=> d!43498 (isPrefixOf!0 (_2!6228 lt!210617) (_2!6228 lt!210610))))

(assert (=> d!43498 (= (reader!0 (_2!6228 lt!210617) (_2!6228 lt!210610)) lt!210994)))

(declare-fun b!135842 () Bool)

(declare-fun Unit!8452 () Unit!8444)

(assert (=> b!135842 (= e!90198 Unit!8452)))

(assert (= (and d!43498 c!7683) b!135838))

(assert (= (and d!43498 (not c!7683)) b!135842))

(assert (= (and d!43498 res!113013) b!135839))

(assert (= (and b!135839 res!113014) b!135841))

(assert (= (and b!135841 res!113015) b!135840))

(declare-fun m!207519 () Bool)

(assert (=> b!135840 m!207519))

(assert (=> b!135840 m!207081))

(assert (=> b!135840 m!207067))

(assert (=> d!43498 m!207463))

(declare-fun m!207521 () Bool)

(assert (=> d!43498 m!207521))

(declare-fun m!207523 () Bool)

(assert (=> d!43498 m!207523))

(assert (=> d!43498 m!207469))

(declare-fun m!207525 () Bool)

(assert (=> d!43498 m!207525))

(declare-fun m!207527 () Bool)

(assert (=> d!43498 m!207527))

(declare-fun m!207529 () Bool)

(assert (=> d!43498 m!207529))

(assert (=> d!43498 m!207103))

(assert (=> d!43498 m!207379))

(assert (=> d!43498 m!207373))

(declare-fun m!207531 () Bool)

(assert (=> d!43498 m!207531))

(assert (=> b!135838 m!207067))

(declare-fun m!207533 () Bool)

(assert (=> b!135838 m!207533))

(declare-fun m!207535 () Bool)

(assert (=> b!135838 m!207535))

(declare-fun m!207537 () Bool)

(assert (=> b!135839 m!207537))

(declare-fun m!207539 () Bool)

(assert (=> b!135841 m!207539))

(assert (=> b!135662 d!43498))

(declare-fun d!43500 () Bool)

(declare-fun e!90202 () Bool)

(assert (=> d!43500 e!90202))

(declare-fun res!113023 () Bool)

(assert (=> d!43500 (=> (not res!113023) (not e!90202))))

(declare-fun lt!211021 () tuple2!11824)

(assert (=> d!43500 (= res!113023 (= (size!2803 (buf!3196 thiss!1634)) (size!2803 (buf!3196 (_2!6228 lt!211021)))))))

(declare-fun choose!6 (BitStream!4870 (_ BitVec 8)) tuple2!11824)

(assert (=> d!43500 (= lt!211021 (choose!6 thiss!1634 (select (arr!3468 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!43500 (validate_offset_byte!0 ((_ sign_extend 32) (size!2803 (buf!3196 thiss!1634))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634)))))

(assert (=> d!43500 (= (appendByte!0 thiss!1634 (select (arr!3468 arr!237) from!447)) lt!211021)))

(declare-fun b!135849 () Bool)

(declare-fun res!113022 () Bool)

(assert (=> b!135849 (=> (not res!113022) (not e!90202))))

(declare-fun lt!211024 () (_ BitVec 64))

(declare-fun lt!211020 () (_ BitVec 64))

(assert (=> b!135849 (= res!113022 (= (bitIndex!0 (size!2803 (buf!3196 (_2!6228 lt!211021))) (currentByte!5993 (_2!6228 lt!211021)) (currentBit!5988 (_2!6228 lt!211021))) (bvadd lt!211024 lt!211020)))))

(assert (=> b!135849 (or (not (= (bvand lt!211024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211020 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!211024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!211024 lt!211020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!135849 (= lt!211020 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!135849 (= lt!211024 (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)))))

(declare-fun b!135850 () Bool)

(declare-fun res!113024 () Bool)

(assert (=> b!135850 (=> (not res!113024) (not e!90202))))

(assert (=> b!135850 (= res!113024 (isPrefixOf!0 thiss!1634 (_2!6228 lt!211021)))))

(declare-fun lt!211022 () tuple2!11822)

(declare-fun b!135851 () Bool)

(declare-fun lt!211023 () tuple2!11820)

(assert (=> b!135851 (= e!90202 (and (= (_2!6226 lt!211023) (select (arr!3468 arr!237) from!447)) (= (_1!6226 lt!211023) (_2!6227 lt!211022))))))

(assert (=> b!135851 (= lt!211023 (readBytePure!0 (_1!6227 lt!211022)))))

(assert (=> b!135851 (= lt!211022 (reader!0 thiss!1634 (_2!6228 lt!211021)))))

(assert (= (and d!43500 res!113023) b!135849))

(assert (= (and b!135849 res!113022) b!135850))

(assert (= (and b!135850 res!113024) b!135851))

(assert (=> d!43500 m!207071))

(declare-fun m!207543 () Bool)

(assert (=> d!43500 m!207543))

(declare-fun m!207545 () Bool)

(assert (=> d!43500 m!207545))

(declare-fun m!207547 () Bool)

(assert (=> b!135849 m!207547))

(assert (=> b!135849 m!207069))

(declare-fun m!207549 () Bool)

(assert (=> b!135850 m!207549))

(declare-fun m!207551 () Bool)

(assert (=> b!135851 m!207551))

(declare-fun m!207553 () Bool)

(assert (=> b!135851 m!207553))

(assert (=> b!135662 d!43500))

(declare-fun d!43506 () Bool)

(assert (=> d!43506 (isPrefixOf!0 thiss!1634 (_2!6228 lt!210610))))

(declare-fun lt!211035 () Unit!8444)

(declare-fun choose!30 (BitStream!4870 BitStream!4870 BitStream!4870) Unit!8444)

(assert (=> d!43506 (= lt!211035 (choose!30 thiss!1634 (_2!6228 lt!210617) (_2!6228 lt!210610)))))

(assert (=> d!43506 (isPrefixOf!0 thiss!1634 (_2!6228 lt!210617))))

(assert (=> d!43506 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6228 lt!210617) (_2!6228 lt!210610)) lt!211035)))

(declare-fun bs!10614 () Bool)

(assert (= bs!10614 d!43506))

(assert (=> bs!10614 m!207113))

(declare-fun m!207555 () Bool)

(assert (=> bs!10614 m!207555))

(assert (=> bs!10614 m!207079))

(assert (=> b!135662 d!43506))

(declare-fun d!43508 () Bool)

(declare-fun lt!211036 () tuple3!514)

(assert (=> d!43508 (= lt!211036 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6227 lt!210631) #b00000000000000000000000000000001) lt!210626 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43508 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6227 lt!210631) #b00000000000000000000000000000001) lt!210626 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11827 (_2!6239 lt!211036) (_3!316 lt!211036)))))

(declare-fun bs!10615 () Bool)

(assert (= bs!10615 d!43508))

(assert (=> bs!10615 m!207115))

(declare-fun m!207557 () Bool)

(assert (=> bs!10615 m!207557))

(assert (=> b!135662 d!43508))

(declare-fun d!43510 () Bool)

(assert (=> d!43510 (= (array_inv!2592 (buf!3196 thiss!1634)) (bvsge (size!2803 (buf!3196 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!135651 d!43510))

(assert (=> b!135661 d!43445))

(declare-fun d!43512 () Bool)

(declare-fun e!90205 () Bool)

(assert (=> d!43512 e!90205))

(declare-fun res!113028 () Bool)

(assert (=> d!43512 (=> (not res!113028) (not e!90205))))

(declare-fun lt!211041 () (_ BitVec 64))

(declare-fun lt!211042 () (_ BitVec 64))

(declare-fun lt!211038 () (_ BitVec 64))

(assert (=> d!43512 (= res!113028 (= lt!211038 (bvsub lt!211041 lt!211042)))))

(assert (=> d!43512 (or (= (bvand lt!211041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!211042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!211041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!211041 lt!211042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43512 (= lt!211042 (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 thiss!1634))) ((_ sign_extend 32) (currentByte!5993 thiss!1634)) ((_ sign_extend 32) (currentBit!5988 thiss!1634))))))

(declare-fun lt!211039 () (_ BitVec 64))

(declare-fun lt!211037 () (_ BitVec 64))

(assert (=> d!43512 (= lt!211041 (bvmul lt!211039 lt!211037))))

(assert (=> d!43512 (or (= lt!211039 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!211037 (bvsdiv (bvmul lt!211039 lt!211037) lt!211039)))))

(assert (=> d!43512 (= lt!211037 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43512 (= lt!211039 ((_ sign_extend 32) (size!2803 (buf!3196 thiss!1634))))))

(assert (=> d!43512 (= lt!211038 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5993 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5988 thiss!1634))))))

(assert (=> d!43512 (invariant!0 (currentBit!5988 thiss!1634) (currentByte!5993 thiss!1634) (size!2803 (buf!3196 thiss!1634)))))

(assert (=> d!43512 (= (bitIndex!0 (size!2803 (buf!3196 thiss!1634)) (currentByte!5993 thiss!1634) (currentBit!5988 thiss!1634)) lt!211038)))

(declare-fun b!135854 () Bool)

(declare-fun res!113027 () Bool)

(assert (=> b!135854 (=> (not res!113027) (not e!90205))))

(assert (=> b!135854 (= res!113027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!211038))))

(declare-fun b!135855 () Bool)

(declare-fun lt!211040 () (_ BitVec 64))

(assert (=> b!135855 (= e!90205 (bvsle lt!211038 (bvmul lt!211040 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!135855 (or (= lt!211040 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!211040 #b0000000000000000000000000000000000000000000000000000000000001000) lt!211040)))))

(assert (=> b!135855 (= lt!211040 ((_ sign_extend 32) (size!2803 (buf!3196 thiss!1634))))))

(assert (= (and d!43512 res!113028) b!135854))

(assert (= (and b!135854 res!113027) b!135855))

(assert (=> d!43512 m!207413))

(assert (=> d!43512 m!207101))

(assert (=> b!135661 d!43512))

(declare-fun lt!211047 () tuple3!514)

(declare-fun d!43514 () Bool)

(assert (=> d!43514 (= lt!211047 (readByteArrayLoop!0 (_1!6227 lt!210618) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43514 (= (readByteArrayLoopPure!0 (_1!6227 lt!210618) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11827 (_2!6239 lt!211047) (_3!316 lt!211047)))))

(declare-fun bs!10616 () Bool)

(assert (= bs!10616 d!43514))

(declare-fun m!207559 () Bool)

(assert (=> bs!10616 m!207559))

(assert (=> b!135660 d!43514))

(declare-fun d!43516 () Bool)

(assert (=> d!43516 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210629) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617)))) lt!210629))))

(declare-fun bs!10617 () Bool)

(assert (= bs!10617 d!43516))

(assert (=> bs!10617 m!207491))

(assert (=> b!135660 d!43516))

(declare-fun d!43518 () Bool)

(assert (=> d!43518 (validate_offset_bits!1 ((_ sign_extend 32) (size!2803 (buf!3196 (_2!6228 lt!210610)))) ((_ sign_extend 32) (currentByte!5993 (_2!6228 lt!210617))) ((_ sign_extend 32) (currentBit!5988 (_2!6228 lt!210617))) lt!210629)))

(declare-fun lt!211050 () Unit!8444)

(declare-fun choose!9 (BitStream!4870 array!6190 (_ BitVec 64) BitStream!4870) Unit!8444)

(assert (=> d!43518 (= lt!211050 (choose!9 (_2!6228 lt!210617) (buf!3196 (_2!6228 lt!210610)) lt!210629 (BitStream!4871 (buf!3196 (_2!6228 lt!210610)) (currentByte!5993 (_2!6228 lt!210617)) (currentBit!5988 (_2!6228 lt!210617)))))))

(assert (=> d!43518 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6228 lt!210617) (buf!3196 (_2!6228 lt!210610)) lt!210629) lt!211050)))

(declare-fun bs!10618 () Bool)

(assert (= bs!10618 d!43518))

(assert (=> bs!10618 m!207095))

(declare-fun m!207569 () Bool)

(assert (=> bs!10618 m!207569))

(assert (=> b!135660 d!43518))

(assert (=> b!135660 d!43498))

(push 1)

(assert (not d!43508))

(assert (not d!43498))

(assert (not b!135818))

(assert (not b!135820))

(assert (not b!135777))

(assert (not d!43492))

(assert (not d!43490))

(assert (not b!135774))

(assert (not d!43445))

(assert (not b!135788))

(assert (not d!43459))

(assert (not d!43457))

(assert (not b!135815))

(assert (not d!43443))

(assert (not d!43514))

(assert (not b!135807))

(assert (not d!43516))

(assert (not b!135839))

(assert (not b!135835))

(assert (not d!43474))

(assert (not d!43512))

(assert (not b!135822))

(assert (not b!135836))

(assert (not b!135776))

(assert (not d!43451))

(assert (not b!135802))

(assert (not b!135775))

(assert (not b!135816))

(assert (not b!135817))

(assert (not b!135763))

(assert (not b!135833))

(assert (not b!135841))

(assert (not b!135790))

(assert (not d!43480))

(assert (not d!43488))

(assert (not d!43506))

(assert (not d!43496))

(assert (not b!135800))

(assert (not d!43486))

(assert (not d!43472))

(assert (not b!135849))

(assert (not d!43466))

(assert (not d!43476))

(assert (not b!135785))

(assert (not b!135761))

(assert (not d!43468))

(assert (not d!43482))

(assert (not b!135809))

(assert (not d!43425))

(assert (not b!135840))

(assert (not d!43435))

(assert (not b!135834))

(assert (not d!43449))

(assert (not d!43433))

(assert (not b!135787))

(assert (not b!135850))

(assert (not d!43470))

(assert (not d!43429))

(assert (not b!135837))

(assert (not b!135851))

(assert (not d!43478))

(assert (not d!43464))

(assert (not d!43494))

(assert (not d!43500))

(assert (not d!43518))

(assert (not b!135838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

