; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25942 () Bool)

(assert start!25942)

(declare-fun b!132643 () Bool)

(declare-fun e!87953 () Bool)

(declare-fun e!87950 () Bool)

(assert (=> b!132643 (= e!87953 (not e!87950))))

(declare-fun res!110156 () Bool)

(assert (=> b!132643 (=> res!110156 e!87950)))

(declare-datatypes ((array!6112 0))(
  ( (array!6113 (arr!3402 (Array (_ BitVec 32) (_ BitVec 8))) (size!2767 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6112)

(declare-datatypes ((BitStream!4798 0))(
  ( (BitStream!4799 (buf!3140 array!6112) (currentByte!5925 (_ BitVec 32)) (currentBit!5920 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11512 0))(
  ( (tuple2!11513 (_1!6062 BitStream!4798) (_2!6062 BitStream!4798)) )
))
(declare-fun lt!204781 () tuple2!11512)

(declare-datatypes ((tuple2!11514 0))(
  ( (tuple2!11515 (_1!6063 BitStream!4798) (_2!6063 array!6112)) )
))
(declare-fun lt!204776 () tuple2!11514)

(assert (=> b!132643 (= res!110156 (or (not (= (size!2767 (_2!6063 lt!204776)) (size!2767 arr!237))) (not (= (_1!6063 lt!204776) (_2!6062 lt!204781)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4798 array!6112 (_ BitVec 32) (_ BitVec 32)) tuple2!11514)

(assert (=> b!132643 (= lt!204776 (readByteArrayLoopPure!0 (_1!6062 lt!204781) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8166 0))(
  ( (Unit!8167) )
))
(declare-datatypes ((tuple2!11516 0))(
  ( (tuple2!11517 (_1!6064 Unit!8166) (_2!6064 BitStream!4798)) )
))
(declare-fun lt!204783 () tuple2!11516)

(declare-fun lt!204778 () tuple2!11516)

(declare-fun lt!204785 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132643 (validate_offset_bits!1 ((_ sign_extend 32) (size!2767 (buf!3140 (_2!6064 lt!204783)))) ((_ sign_extend 32) (currentByte!5925 (_2!6064 lt!204778))) ((_ sign_extend 32) (currentBit!5920 (_2!6064 lt!204778))) lt!204785)))

(declare-fun lt!204793 () Unit!8166)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4798 array!6112 (_ BitVec 64)) Unit!8166)

(assert (=> b!132643 (= lt!204793 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6064 lt!204778) (buf!3140 (_2!6064 lt!204783)) lt!204785))))

(declare-fun reader!0 (BitStream!4798 BitStream!4798) tuple2!11512)

(assert (=> b!132643 (= lt!204781 (reader!0 (_2!6064 lt!204778) (_2!6064 lt!204783)))))

(declare-fun b!132644 () Bool)

(declare-fun res!110150 () Bool)

(declare-fun e!87959 () Bool)

(assert (=> b!132644 (=> (not res!110150) (not e!87959))))

(declare-fun thiss!1634 () BitStream!4798)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132644 (= res!110150 (invariant!0 (currentBit!5920 thiss!1634) (currentByte!5925 thiss!1634) (size!2767 (buf!3140 thiss!1634))))))

(declare-fun b!132645 () Bool)

(declare-fun e!87956 () Bool)

(declare-datatypes ((tuple2!11518 0))(
  ( (tuple2!11519 (_1!6065 BitStream!4798) (_2!6065 (_ BitVec 8))) )
))
(declare-fun lt!204777 () tuple2!11518)

(declare-fun lt!204798 () tuple2!11518)

(assert (=> b!132645 (= e!87956 (= (_2!6065 lt!204777) (_2!6065 lt!204798)))))

(declare-fun res!110158 () Bool)

(assert (=> start!25942 (=> (not res!110158) (not e!87959))))

(assert (=> start!25942 (= res!110158 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2767 arr!237))))))

(assert (=> start!25942 e!87959))

(assert (=> start!25942 true))

(declare-fun array_inv!2556 (array!6112) Bool)

(assert (=> start!25942 (array_inv!2556 arr!237)))

(declare-fun e!87952 () Bool)

(declare-fun inv!12 (BitStream!4798) Bool)

(assert (=> start!25942 (and (inv!12 thiss!1634) e!87952)))

(declare-fun b!132646 () Bool)

(declare-fun res!110155 () Bool)

(declare-fun e!87958 () Bool)

(assert (=> b!132646 (=> (not res!110155) (not e!87958))))

(declare-fun isPrefixOf!0 (BitStream!4798 BitStream!4798) Bool)

(assert (=> b!132646 (= res!110155 (isPrefixOf!0 thiss!1634 (_2!6064 lt!204778)))))

(declare-fun b!132647 () Bool)

(declare-fun res!110159 () Bool)

(assert (=> b!132647 (=> (not res!110159) (not e!87959))))

(assert (=> b!132647 (= res!110159 (bvslt from!447 to!404))))

(declare-fun b!132648 () Bool)

(declare-fun res!110160 () Bool)

(assert (=> b!132648 (=> (not res!110160) (not e!87958))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132648 (= res!110160 (= (bitIndex!0 (size!2767 (buf!3140 (_2!6064 lt!204778))) (currentByte!5925 (_2!6064 lt!204778)) (currentBit!5920 (_2!6064 lt!204778))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2767 (buf!3140 thiss!1634)) (currentByte!5925 thiss!1634) (currentBit!5920 thiss!1634)))))))

(declare-fun b!132649 () Bool)

(declare-fun e!87951 () Bool)

(assert (=> b!132649 (= e!87951 e!87953)))

(declare-fun res!110154 () Bool)

(assert (=> b!132649 (=> (not res!110154) (not e!87953))))

(assert (=> b!132649 (= res!110154 (= (bitIndex!0 (size!2767 (buf!3140 (_2!6064 lt!204783))) (currentByte!5925 (_2!6064 lt!204783)) (currentBit!5920 (_2!6064 lt!204783))) (bvadd (bitIndex!0 (size!2767 (buf!3140 (_2!6064 lt!204778))) (currentByte!5925 (_2!6064 lt!204778)) (currentBit!5920 (_2!6064 lt!204778))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204785))))))

(assert (=> b!132649 (= lt!204785 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!204788 () tuple2!11512)

(declare-fun b!132650 () Bool)

(declare-fun lt!204791 () tuple2!11518)

(assert (=> b!132650 (= e!87958 (and (= (_2!6065 lt!204791) (select (arr!3402 arr!237) from!447)) (= (_1!6065 lt!204791) (_2!6062 lt!204788))))))

(declare-fun readBytePure!0 (BitStream!4798) tuple2!11518)

(assert (=> b!132650 (= lt!204791 (readBytePure!0 (_1!6062 lt!204788)))))

(assert (=> b!132650 (= lt!204788 (reader!0 thiss!1634 (_2!6064 lt!204778)))))

(declare-fun b!132651 () Bool)

(declare-fun res!110157 () Bool)

(assert (=> b!132651 (=> (not res!110157) (not e!87959))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132651 (= res!110157 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2767 (buf!3140 thiss!1634))) ((_ sign_extend 32) (currentByte!5925 thiss!1634)) ((_ sign_extend 32) (currentBit!5920 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132652 () Bool)

(declare-fun res!110161 () Bool)

(assert (=> b!132652 (=> (not res!110161) (not e!87953))))

(assert (=> b!132652 (= res!110161 (isPrefixOf!0 (_2!6064 lt!204778) (_2!6064 lt!204783)))))

(declare-fun b!132653 () Bool)

(declare-fun arrayRangesEq!170 (array!6112 array!6112 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132653 (= e!87950 (not (arrayRangesEq!170 arr!237 (_2!6063 lt!204776) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132654 () Bool)

(assert (=> b!132654 (= e!87952 (array_inv!2556 (buf!3140 thiss!1634)))))

(declare-fun b!132655 () Bool)

(declare-fun e!87955 () Bool)

(assert (=> b!132655 (= e!87955 (invariant!0 (currentBit!5920 thiss!1634) (currentByte!5925 thiss!1634) (size!2767 (buf!3140 (_2!6064 lt!204778)))))))

(declare-fun b!132656 () Bool)

(assert (=> b!132656 (= e!87959 (not (bvsle #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!204795 () tuple2!11514)

(declare-fun lt!204786 () tuple2!11514)

(assert (=> b!132656 (arrayRangesEq!170 (_2!6063 lt!204795) (_2!6063 lt!204786) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!204794 () Unit!8166)

(declare-fun lt!204784 () tuple2!11512)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4798 array!6112 (_ BitVec 32) (_ BitVec 32)) Unit!8166)

(assert (=> b!132656 (= lt!204794 (readByteArrayLoopArrayPrefixLemma!0 (_1!6062 lt!204784) arr!237 from!447 to!404))))

(declare-fun lt!204789 () array!6112)

(declare-fun withMovedByteIndex!0 (BitStream!4798 (_ BitVec 32)) BitStream!4798)

(assert (=> b!132656 (= lt!204786 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6062 lt!204784) #b00000000000000000000000000000001) lt!204789 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204782 () tuple2!11514)

(declare-fun lt!204780 () tuple2!11512)

(assert (=> b!132656 (= lt!204782 (readByteArrayLoopPure!0 (_1!6062 lt!204780) lt!204789 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204787 () tuple2!11518)

(assert (=> b!132656 (= lt!204789 (array!6113 (store (arr!3402 arr!237) from!447 (_2!6065 lt!204787)) (size!2767 arr!237)))))

(declare-fun lt!204799 () (_ BitVec 32))

(assert (=> b!132656 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2767 (buf!3140 (_2!6064 lt!204783)))) ((_ sign_extend 32) (currentByte!5925 (_2!6064 lt!204778))) ((_ sign_extend 32) (currentBit!5920 (_2!6064 lt!204778))) lt!204799)))

(declare-fun lt!204800 () Unit!8166)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4798 array!6112 (_ BitVec 32)) Unit!8166)

(assert (=> b!132656 (= lt!204800 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6064 lt!204778) (buf!3140 (_2!6064 lt!204783)) lt!204799))))

(assert (=> b!132656 (= (_1!6063 lt!204795) (_2!6062 lt!204784))))

(assert (=> b!132656 (= lt!204795 (readByteArrayLoopPure!0 (_1!6062 lt!204784) arr!237 from!447 to!404))))

(assert (=> b!132656 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2767 (buf!3140 (_2!6064 lt!204783)))) ((_ sign_extend 32) (currentByte!5925 thiss!1634)) ((_ sign_extend 32) (currentBit!5920 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!204790 () Unit!8166)

(assert (=> b!132656 (= lt!204790 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3140 (_2!6064 lt!204783)) (bvsub to!404 from!447)))))

(assert (=> b!132656 (= (_2!6065 lt!204787) (select (arr!3402 arr!237) from!447))))

(assert (=> b!132656 (= lt!204787 (readBytePure!0 (_1!6062 lt!204784)))))

(assert (=> b!132656 (= lt!204780 (reader!0 (_2!6064 lt!204778) (_2!6064 lt!204783)))))

(assert (=> b!132656 (= lt!204784 (reader!0 thiss!1634 (_2!6064 lt!204783)))))

(assert (=> b!132656 e!87956))

(declare-fun res!110151 () Bool)

(assert (=> b!132656 (=> (not res!110151) (not e!87956))))

(assert (=> b!132656 (= res!110151 (= (bitIndex!0 (size!2767 (buf!3140 (_1!6065 lt!204777))) (currentByte!5925 (_1!6065 lt!204777)) (currentBit!5920 (_1!6065 lt!204777))) (bitIndex!0 (size!2767 (buf!3140 (_1!6065 lt!204798))) (currentByte!5925 (_1!6065 lt!204798)) (currentBit!5920 (_1!6065 lt!204798)))))))

(declare-fun lt!204797 () Unit!8166)

(declare-fun lt!204796 () BitStream!4798)

(declare-fun readBytePrefixLemma!0 (BitStream!4798 BitStream!4798) Unit!8166)

(assert (=> b!132656 (= lt!204797 (readBytePrefixLemma!0 lt!204796 (_2!6064 lt!204783)))))

(assert (=> b!132656 (= lt!204798 (readBytePure!0 (BitStream!4799 (buf!3140 (_2!6064 lt!204783)) (currentByte!5925 thiss!1634) (currentBit!5920 thiss!1634))))))

(assert (=> b!132656 (= lt!204777 (readBytePure!0 lt!204796))))

(assert (=> b!132656 (= lt!204796 (BitStream!4799 (buf!3140 (_2!6064 lt!204778)) (currentByte!5925 thiss!1634) (currentBit!5920 thiss!1634)))))

(assert (=> b!132656 e!87955))

(declare-fun res!110152 () Bool)

(assert (=> b!132656 (=> (not res!110152) (not e!87955))))

(assert (=> b!132656 (= res!110152 (isPrefixOf!0 thiss!1634 (_2!6064 lt!204783)))))

(declare-fun lt!204779 () Unit!8166)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4798 BitStream!4798 BitStream!4798) Unit!8166)

(assert (=> b!132656 (= lt!204779 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6064 lt!204778) (_2!6064 lt!204783)))))

(assert (=> b!132656 e!87951))

(declare-fun res!110149 () Bool)

(assert (=> b!132656 (=> (not res!110149) (not e!87951))))

(assert (=> b!132656 (= res!110149 (= (size!2767 (buf!3140 (_2!6064 lt!204778))) (size!2767 (buf!3140 (_2!6064 lt!204783)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4798 array!6112 (_ BitVec 32) (_ BitVec 32)) tuple2!11516)

(assert (=> b!132656 (= lt!204783 (appendByteArrayLoop!0 (_2!6064 lt!204778) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132656 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2767 (buf!3140 (_2!6064 lt!204778)))) ((_ sign_extend 32) (currentByte!5925 (_2!6064 lt!204778))) ((_ sign_extend 32) (currentBit!5920 (_2!6064 lt!204778))) lt!204799)))

(assert (=> b!132656 (= lt!204799 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204792 () Unit!8166)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4798 BitStream!4798 (_ BitVec 64) (_ BitVec 32)) Unit!8166)

(assert (=> b!132656 (= lt!204792 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6064 lt!204778) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132656 e!87958))

(declare-fun res!110153 () Bool)

(assert (=> b!132656 (=> (not res!110153) (not e!87958))))

(assert (=> b!132656 (= res!110153 (= (size!2767 (buf!3140 thiss!1634)) (size!2767 (buf!3140 (_2!6064 lt!204778)))))))

(declare-fun appendByte!0 (BitStream!4798 (_ BitVec 8)) tuple2!11516)

(assert (=> b!132656 (= lt!204778 (appendByte!0 thiss!1634 (select (arr!3402 arr!237) from!447)))))

(assert (= (and start!25942 res!110158) b!132651))

(assert (= (and b!132651 res!110157) b!132647))

(assert (= (and b!132647 res!110159) b!132644))

(assert (= (and b!132644 res!110150) b!132656))

(assert (= (and b!132656 res!110153) b!132648))

(assert (= (and b!132648 res!110160) b!132646))

(assert (= (and b!132646 res!110155) b!132650))

(assert (= (and b!132656 res!110149) b!132649))

(assert (= (and b!132649 res!110154) b!132652))

(assert (= (and b!132652 res!110161) b!132643))

(assert (= (and b!132643 (not res!110156)) b!132653))

(assert (= (and b!132656 res!110152) b!132655))

(assert (= (and b!132656 res!110151) b!132645))

(assert (= start!25942 b!132654))

(declare-fun m!200455 () Bool)

(assert (=> b!132651 m!200455))

(declare-fun m!200457 () Bool)

(assert (=> b!132653 m!200457))

(declare-fun m!200459 () Bool)

(assert (=> start!25942 m!200459))

(declare-fun m!200461 () Bool)

(assert (=> start!25942 m!200461))

(declare-fun m!200463 () Bool)

(assert (=> b!132656 m!200463))

(declare-fun m!200465 () Bool)

(assert (=> b!132656 m!200465))

(declare-fun m!200467 () Bool)

(assert (=> b!132656 m!200467))

(declare-fun m!200469 () Bool)

(assert (=> b!132656 m!200469))

(declare-fun m!200471 () Bool)

(assert (=> b!132656 m!200471))

(declare-fun m!200473 () Bool)

(assert (=> b!132656 m!200473))

(declare-fun m!200475 () Bool)

(assert (=> b!132656 m!200475))

(declare-fun m!200477 () Bool)

(assert (=> b!132656 m!200477))

(declare-fun m!200479 () Bool)

(assert (=> b!132656 m!200479))

(declare-fun m!200481 () Bool)

(assert (=> b!132656 m!200481))

(declare-fun m!200483 () Bool)

(assert (=> b!132656 m!200483))

(declare-fun m!200485 () Bool)

(assert (=> b!132656 m!200485))

(declare-fun m!200487 () Bool)

(assert (=> b!132656 m!200487))

(declare-fun m!200489 () Bool)

(assert (=> b!132656 m!200489))

(declare-fun m!200491 () Bool)

(assert (=> b!132656 m!200491))

(declare-fun m!200493 () Bool)

(assert (=> b!132656 m!200493))

(declare-fun m!200495 () Bool)

(assert (=> b!132656 m!200495))

(declare-fun m!200497 () Bool)

(assert (=> b!132656 m!200497))

(declare-fun m!200499 () Bool)

(assert (=> b!132656 m!200499))

(declare-fun m!200501 () Bool)

(assert (=> b!132656 m!200501))

(declare-fun m!200503 () Bool)

(assert (=> b!132656 m!200503))

(assert (=> b!132656 m!200471))

(declare-fun m!200505 () Bool)

(assert (=> b!132656 m!200505))

(declare-fun m!200507 () Bool)

(assert (=> b!132656 m!200507))

(declare-fun m!200509 () Bool)

(assert (=> b!132656 m!200509))

(declare-fun m!200511 () Bool)

(assert (=> b!132656 m!200511))

(declare-fun m!200513 () Bool)

(assert (=> b!132656 m!200513))

(assert (=> b!132656 m!200501))

(declare-fun m!200515 () Bool)

(assert (=> b!132648 m!200515))

(declare-fun m!200517 () Bool)

(assert (=> b!132648 m!200517))

(declare-fun m!200519 () Bool)

(assert (=> b!132655 m!200519))

(declare-fun m!200521 () Bool)

(assert (=> b!132643 m!200521))

(declare-fun m!200523 () Bool)

(assert (=> b!132643 m!200523))

(declare-fun m!200525 () Bool)

(assert (=> b!132643 m!200525))

(assert (=> b!132643 m!200507))

(declare-fun m!200527 () Bool)

(assert (=> b!132652 m!200527))

(declare-fun m!200529 () Bool)

(assert (=> b!132644 m!200529))

(declare-fun m!200531 () Bool)

(assert (=> b!132654 m!200531))

(declare-fun m!200533 () Bool)

(assert (=> b!132649 m!200533))

(assert (=> b!132649 m!200515))

(declare-fun m!200535 () Bool)

(assert (=> b!132646 m!200535))

(assert (=> b!132650 m!200501))

(declare-fun m!200537 () Bool)

(assert (=> b!132650 m!200537))

(declare-fun m!200539 () Bool)

(assert (=> b!132650 m!200539))

(push 1)

(assert (not b!132654))

(assert (not b!132655))

(assert (not b!132643))

(assert (not b!132646))

(assert (not b!132653))

(assert (not b!132652))

(assert (not b!132650))

(assert (not b!132656))

(assert (not start!25942))

(assert (not b!132644))

(assert (not b!132649))

(assert (not b!132648))

(assert (not b!132651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

