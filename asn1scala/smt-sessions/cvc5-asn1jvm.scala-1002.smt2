; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28142 () Bool)

(assert start!28142)

(declare-fun b!145835 () Bool)

(declare-fun res!121978 () Bool)

(declare-fun e!97221 () Bool)

(assert (=> b!145835 (=> (not res!121978) (not e!97221))))

(declare-datatypes ((array!6629 0))(
  ( (array!6630 (arr!3740 (Array (_ BitVec 32) (_ BitVec 8))) (size!3001 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5260 0))(
  ( (BitStream!5261 (buf!3446 array!6629) (currentByte!6342 (_ BitVec 32)) (currentBit!6337 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9084 0))(
  ( (Unit!9085) )
))
(declare-datatypes ((tuple2!13056 0))(
  ( (tuple2!13057 (_1!6877 Unit!9084) (_2!6877 BitStream!5260)) )
))
(declare-fun lt!226132 () tuple2!13056)

(declare-fun lt!226138 () tuple2!13056)

(declare-fun isPrefixOf!0 (BitStream!5260 BitStream!5260) Bool)

(assert (=> b!145835 (= res!121978 (isPrefixOf!0 (_2!6877 lt!226132) (_2!6877 lt!226138)))))

(declare-fun b!145836 () Bool)

(declare-fun res!121973 () Bool)

(declare-fun e!97226 () Bool)

(assert (=> b!145836 (=> (not res!121973) (not e!97226))))

(declare-fun thiss!1634 () BitStream!5260)

(assert (=> b!145836 (= res!121973 (isPrefixOf!0 thiss!1634 (_2!6877 lt!226132)))))

(declare-fun b!145837 () Bool)

(declare-fun res!121972 () Bool)

(declare-fun e!97225 () Bool)

(assert (=> b!145837 (=> (not res!121972) (not e!97225))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!145837 (= res!121972 (bvslt from!447 to!404))))

(declare-fun b!145838 () Bool)

(declare-fun e!97227 () Bool)

(assert (=> b!145838 (= e!97225 (not e!97227))))

(declare-fun res!121975 () Bool)

(assert (=> b!145838 (=> res!121975 e!97227)))

(declare-datatypes ((tuple2!13058 0))(
  ( (tuple2!13059 (_1!6878 BitStream!5260) (_2!6878 array!6629)) )
))
(declare-fun lt!226129 () tuple2!13058)

(declare-fun lt!226142 () tuple2!13058)

(declare-fun arrayRangesEq!317 (array!6629 array!6629 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145838 (= res!121975 (not (arrayRangesEq!317 (_2!6878 lt!226129) (_2!6878 lt!226142) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!226144 () tuple2!13058)

(assert (=> b!145838 (arrayRangesEq!317 (_2!6878 lt!226129) (_2!6878 lt!226144) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!13060 0))(
  ( (tuple2!13061 (_1!6879 BitStream!5260) (_2!6879 BitStream!5260)) )
))
(declare-fun lt!226137 () tuple2!13060)

(declare-fun arr!237 () array!6629)

(declare-fun lt!226148 () Unit!9084)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5260 array!6629 (_ BitVec 32) (_ BitVec 32)) Unit!9084)

(assert (=> b!145838 (= lt!226148 (readByteArrayLoopArrayPrefixLemma!0 (_1!6879 lt!226137) arr!237 from!447 to!404))))

(declare-fun lt!226127 () array!6629)

(declare-fun readByteArrayLoopPure!0 (BitStream!5260 array!6629 (_ BitVec 32) (_ BitVec 32)) tuple2!13058)

(declare-fun withMovedByteIndex!0 (BitStream!5260 (_ BitVec 32)) BitStream!5260)

(assert (=> b!145838 (= lt!226144 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6879 lt!226137) #b00000000000000000000000000000001) lt!226127 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226126 () tuple2!13060)

(assert (=> b!145838 (= lt!226142 (readByteArrayLoopPure!0 (_1!6879 lt!226126) lt!226127 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13062 0))(
  ( (tuple2!13063 (_1!6880 BitStream!5260) (_2!6880 (_ BitVec 8))) )
))
(declare-fun lt!226143 () tuple2!13062)

(assert (=> b!145838 (= lt!226127 (array!6630 (store (arr!3740 arr!237) from!447 (_2!6880 lt!226143)) (size!3001 arr!237)))))

(declare-fun lt!226125 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145838 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226125)))

(declare-fun lt!226131 () Unit!9084)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5260 array!6629 (_ BitVec 32)) Unit!9084)

(assert (=> b!145838 (= lt!226131 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6877 lt!226132) (buf!3446 (_2!6877 lt!226138)) lt!226125))))

(assert (=> b!145838 (= (_1!6878 lt!226129) (_2!6879 lt!226137))))

(assert (=> b!145838 (= lt!226129 (readByteArrayLoopPure!0 (_1!6879 lt!226137) arr!237 from!447 to!404))))

(assert (=> b!145838 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!226147 () Unit!9084)

(assert (=> b!145838 (= lt!226147 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3446 (_2!6877 lt!226138)) (bvsub to!404 from!447)))))

(assert (=> b!145838 (= (_2!6880 lt!226143) (select (arr!3740 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5260) tuple2!13062)

(assert (=> b!145838 (= lt!226143 (readBytePure!0 (_1!6879 lt!226137)))))

(declare-fun reader!0 (BitStream!5260 BitStream!5260) tuple2!13060)

(assert (=> b!145838 (= lt!226126 (reader!0 (_2!6877 lt!226132) (_2!6877 lt!226138)))))

(assert (=> b!145838 (= lt!226137 (reader!0 thiss!1634 (_2!6877 lt!226138)))))

(declare-fun e!97217 () Bool)

(assert (=> b!145838 e!97217))

(declare-fun res!121971 () Bool)

(assert (=> b!145838 (=> (not res!121971) (not e!97217))))

(declare-fun lt!226145 () tuple2!13062)

(declare-fun lt!226134 () tuple2!13062)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145838 (= res!121971 (= (bitIndex!0 (size!3001 (buf!3446 (_1!6880 lt!226145))) (currentByte!6342 (_1!6880 lt!226145)) (currentBit!6337 (_1!6880 lt!226145))) (bitIndex!0 (size!3001 (buf!3446 (_1!6880 lt!226134))) (currentByte!6342 (_1!6880 lt!226134)) (currentBit!6337 (_1!6880 lt!226134)))))))

(declare-fun lt!226146 () Unit!9084)

(declare-fun lt!226133 () BitStream!5260)

(declare-fun readBytePrefixLemma!0 (BitStream!5260 BitStream!5260) Unit!9084)

(assert (=> b!145838 (= lt!226146 (readBytePrefixLemma!0 lt!226133 (_2!6877 lt!226138)))))

(assert (=> b!145838 (= lt!226134 (readBytePure!0 (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634))))))

(assert (=> b!145838 (= lt!226145 (readBytePure!0 lt!226133))))

(assert (=> b!145838 (= lt!226133 (BitStream!5261 (buf!3446 (_2!6877 lt!226132)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))

(declare-fun e!97222 () Bool)

(assert (=> b!145838 e!97222))

(declare-fun res!121980 () Bool)

(assert (=> b!145838 (=> (not res!121980) (not e!97222))))

(assert (=> b!145838 (= res!121980 (isPrefixOf!0 thiss!1634 (_2!6877 lt!226138)))))

(declare-fun lt!226135 () Unit!9084)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5260 BitStream!5260 BitStream!5260) Unit!9084)

(assert (=> b!145838 (= lt!226135 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6877 lt!226132) (_2!6877 lt!226138)))))

(declare-fun e!97220 () Bool)

(assert (=> b!145838 e!97220))

(declare-fun res!121984 () Bool)

(assert (=> b!145838 (=> (not res!121984) (not e!97220))))

(assert (=> b!145838 (= res!121984 (= (size!3001 (buf!3446 (_2!6877 lt!226132))) (size!3001 (buf!3446 (_2!6877 lt!226138)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5260 array!6629 (_ BitVec 32) (_ BitVec 32)) tuple2!13056)

(assert (=> b!145838 (= lt!226138 (appendByteArrayLoop!0 (_2!6877 lt!226132) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145838 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226132)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226125)))

(assert (=> b!145838 (= lt!226125 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!226149 () Unit!9084)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5260 BitStream!5260 (_ BitVec 64) (_ BitVec 32)) Unit!9084)

(assert (=> b!145838 (= lt!226149 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6877 lt!226132) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145838 e!97226))

(declare-fun res!121982 () Bool)

(assert (=> b!145838 (=> (not res!121982) (not e!97226))))

(assert (=> b!145838 (= res!121982 (= (size!3001 (buf!3446 thiss!1634)) (size!3001 (buf!3446 (_2!6877 lt!226132)))))))

(declare-fun appendByte!0 (BitStream!5260 (_ BitVec 8)) tuple2!13056)

(assert (=> b!145838 (= lt!226132 (appendByte!0 thiss!1634 (select (arr!3740 arr!237) from!447)))))

(declare-fun e!97223 () Bool)

(declare-fun lt!226136 () tuple2!13058)

(declare-fun b!145839 () Bool)

(assert (=> b!145839 (= e!97223 (not (arrayRangesEq!317 arr!237 (_2!6878 lt!226136) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145840 () Bool)

(declare-fun res!121977 () Bool)

(assert (=> b!145840 (=> (not res!121977) (not e!97225))))

(assert (=> b!145840 (= res!121977 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 thiss!1634))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!121976 () Bool)

(assert (=> start!28142 (=> (not res!121976) (not e!97225))))

(assert (=> start!28142 (= res!121976 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3001 arr!237))))))

(assert (=> start!28142 e!97225))

(assert (=> start!28142 true))

(declare-fun array_inv!2790 (array!6629) Bool)

(assert (=> start!28142 (array_inv!2790 arr!237)))

(declare-fun e!97219 () Bool)

(declare-fun inv!12 (BitStream!5260) Bool)

(assert (=> start!28142 (and (inv!12 thiss!1634) e!97219)))

(declare-fun b!145841 () Bool)

(assert (=> b!145841 (= e!97227 (and (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3001 (_2!6878 lt!226129)))))))

(declare-fun lt!226128 () tuple2!13060)

(declare-fun b!145842 () Bool)

(declare-fun lt!226141 () tuple2!13062)

(assert (=> b!145842 (= e!97226 (and (= (_2!6880 lt!226141) (select (arr!3740 arr!237) from!447)) (= (_1!6880 lt!226141) (_2!6879 lt!226128))))))

(assert (=> b!145842 (= lt!226141 (readBytePure!0 (_1!6879 lt!226128)))))

(assert (=> b!145842 (= lt!226128 (reader!0 thiss!1634 (_2!6877 lt!226132)))))

(declare-fun b!145843 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145843 (= e!97222 (invariant!0 (currentBit!6337 thiss!1634) (currentByte!6342 thiss!1634) (size!3001 (buf!3446 (_2!6877 lt!226132)))))))

(declare-fun b!145844 () Bool)

(assert (=> b!145844 (= e!97221 (not e!97223))))

(declare-fun res!121974 () Bool)

(assert (=> b!145844 (=> res!121974 e!97223)))

(declare-fun lt!226140 () tuple2!13060)

(assert (=> b!145844 (= res!121974 (or (not (= (size!3001 (_2!6878 lt!226136)) (size!3001 arr!237))) (not (= (_1!6878 lt!226136) (_2!6879 lt!226140)))))))

(assert (=> b!145844 (= lt!226136 (readByteArrayLoopPure!0 (_1!6879 lt!226140) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226130 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145844 (validate_offset_bits!1 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226130)))

(declare-fun lt!226139 () Unit!9084)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5260 array!6629 (_ BitVec 64)) Unit!9084)

(assert (=> b!145844 (= lt!226139 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6877 lt!226132) (buf!3446 (_2!6877 lt!226138)) lt!226130))))

(assert (=> b!145844 (= lt!226140 (reader!0 (_2!6877 lt!226132) (_2!6877 lt!226138)))))

(declare-fun b!145845 () Bool)

(assert (=> b!145845 (= e!97217 (= (_2!6880 lt!226145) (_2!6880 lt!226134)))))

(declare-fun b!145846 () Bool)

(assert (=> b!145846 (= e!97220 e!97221)))

(declare-fun res!121979 () Bool)

(assert (=> b!145846 (=> (not res!121979) (not e!97221))))

(assert (=> b!145846 (= res!121979 (= (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226138))) (currentByte!6342 (_2!6877 lt!226138)) (currentBit!6337 (_2!6877 lt!226138))) (bvadd (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!226130))))))

(assert (=> b!145846 (= lt!226130 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145847 () Bool)

(assert (=> b!145847 (= e!97219 (array_inv!2790 (buf!3446 thiss!1634)))))

(declare-fun b!145848 () Bool)

(declare-fun res!121981 () Bool)

(assert (=> b!145848 (=> (not res!121981) (not e!97226))))

(assert (=> b!145848 (= res!121981 (= (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))))

(declare-fun b!145849 () Bool)

(declare-fun res!121983 () Bool)

(assert (=> b!145849 (=> (not res!121983) (not e!97225))))

(assert (=> b!145849 (= res!121983 (invariant!0 (currentBit!6337 thiss!1634) (currentByte!6342 thiss!1634) (size!3001 (buf!3446 thiss!1634))))))

(assert (= (and start!28142 res!121976) b!145840))

(assert (= (and b!145840 res!121977) b!145837))

(assert (= (and b!145837 res!121972) b!145849))

(assert (= (and b!145849 res!121983) b!145838))

(assert (= (and b!145838 res!121982) b!145848))

(assert (= (and b!145848 res!121981) b!145836))

(assert (= (and b!145836 res!121973) b!145842))

(assert (= (and b!145838 res!121984) b!145846))

(assert (= (and b!145846 res!121979) b!145835))

(assert (= (and b!145835 res!121978) b!145844))

(assert (= (and b!145844 (not res!121974)) b!145839))

(assert (= (and b!145838 res!121980) b!145843))

(assert (= (and b!145838 res!121971) b!145845))

(assert (= (and b!145838 (not res!121975)) b!145841))

(assert (= start!28142 b!145847))

(declare-fun m!224513 () Bool)

(assert (=> b!145848 m!224513))

(declare-fun m!224515 () Bool)

(assert (=> b!145848 m!224515))

(declare-fun m!224517 () Bool)

(assert (=> b!145836 m!224517))

(declare-fun m!224519 () Bool)

(assert (=> b!145838 m!224519))

(declare-fun m!224521 () Bool)

(assert (=> b!145838 m!224521))

(declare-fun m!224523 () Bool)

(assert (=> b!145838 m!224523))

(declare-fun m!224525 () Bool)

(assert (=> b!145838 m!224525))

(declare-fun m!224527 () Bool)

(assert (=> b!145838 m!224527))

(declare-fun m!224529 () Bool)

(assert (=> b!145838 m!224529))

(declare-fun m!224531 () Bool)

(assert (=> b!145838 m!224531))

(declare-fun m!224533 () Bool)

(assert (=> b!145838 m!224533))

(declare-fun m!224535 () Bool)

(assert (=> b!145838 m!224535))

(declare-fun m!224537 () Bool)

(assert (=> b!145838 m!224537))

(declare-fun m!224539 () Bool)

(assert (=> b!145838 m!224539))

(declare-fun m!224541 () Bool)

(assert (=> b!145838 m!224541))

(assert (=> b!145838 m!224535))

(declare-fun m!224543 () Bool)

(assert (=> b!145838 m!224543))

(declare-fun m!224545 () Bool)

(assert (=> b!145838 m!224545))

(declare-fun m!224547 () Bool)

(assert (=> b!145838 m!224547))

(declare-fun m!224549 () Bool)

(assert (=> b!145838 m!224549))

(declare-fun m!224551 () Bool)

(assert (=> b!145838 m!224551))

(declare-fun m!224553 () Bool)

(assert (=> b!145838 m!224553))

(declare-fun m!224555 () Bool)

(assert (=> b!145838 m!224555))

(declare-fun m!224557 () Bool)

(assert (=> b!145838 m!224557))

(declare-fun m!224559 () Bool)

(assert (=> b!145838 m!224559))

(declare-fun m!224561 () Bool)

(assert (=> b!145838 m!224561))

(declare-fun m!224563 () Bool)

(assert (=> b!145838 m!224563))

(declare-fun m!224565 () Bool)

(assert (=> b!145838 m!224565))

(declare-fun m!224567 () Bool)

(assert (=> b!145838 m!224567))

(declare-fun m!224569 () Bool)

(assert (=> b!145838 m!224569))

(declare-fun m!224571 () Bool)

(assert (=> b!145838 m!224571))

(assert (=> b!145838 m!224559))

(assert (=> b!145842 m!224559))

(declare-fun m!224573 () Bool)

(assert (=> b!145842 m!224573))

(declare-fun m!224575 () Bool)

(assert (=> b!145842 m!224575))

(declare-fun m!224577 () Bool)

(assert (=> b!145849 m!224577))

(declare-fun m!224579 () Bool)

(assert (=> b!145839 m!224579))

(declare-fun m!224581 () Bool)

(assert (=> b!145847 m!224581))

(declare-fun m!224583 () Bool)

(assert (=> b!145844 m!224583))

(declare-fun m!224585 () Bool)

(assert (=> b!145844 m!224585))

(declare-fun m!224587 () Bool)

(assert (=> b!145844 m!224587))

(assert (=> b!145844 m!224541))

(declare-fun m!224589 () Bool)

(assert (=> b!145835 m!224589))

(declare-fun m!224591 () Bool)

(assert (=> b!145846 m!224591))

(assert (=> b!145846 m!224513))

(declare-fun m!224593 () Bool)

(assert (=> start!28142 m!224593))

(declare-fun m!224595 () Bool)

(assert (=> start!28142 m!224595))

(declare-fun m!224597 () Bool)

(assert (=> b!145840 m!224597))

(declare-fun m!224599 () Bool)

(assert (=> b!145843 m!224599))

(push 1)

(assert (not start!28142))

(assert (not b!145844))

(assert (not b!145847))

(assert (not b!145836))

(assert (not b!145835))

(assert (not b!145849))

(assert (not b!145840))

(assert (not b!145846))

(assert (not b!145843))

(assert (not b!145838))

(assert (not b!145842))

(assert (not b!145839))

(assert (not b!145848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!46642 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!46642 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 thiss!1634))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 thiss!1634))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11441 () Bool)

(assert (= bs!11441 d!46642))

(declare-fun m!224777 () Bool)

(assert (=> bs!11441 m!224777))

(assert (=> b!145840 d!46642))

(declare-fun d!46644 () Bool)

(declare-fun e!97296 () Bool)

(assert (=> d!46644 e!97296))

(declare-fun res!122074 () Bool)

(assert (=> d!46644 (=> (not res!122074) (not e!97296))))

(declare-fun lt!226315 () (_ BitVec 64))

(declare-fun lt!226313 () (_ BitVec 64))

(declare-fun lt!226314 () (_ BitVec 64))

(assert (=> d!46644 (= res!122074 (= lt!226313 (bvsub lt!226315 lt!226314)))))

(assert (=> d!46644 (or (= (bvand lt!226315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226314 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226315 lt!226314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46644 (= lt!226314 (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226132)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132)))))))

(declare-fun lt!226317 () (_ BitVec 64))

(declare-fun lt!226312 () (_ BitVec 64))

(assert (=> d!46644 (= lt!226315 (bvmul lt!226317 lt!226312))))

(assert (=> d!46644 (or (= lt!226317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226312 (bvsdiv (bvmul lt!226317 lt!226312) lt!226317)))))

(assert (=> d!46644 (= lt!226312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46644 (= lt!226317 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226132)))))))

(assert (=> d!46644 (= lt!226313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132)))))))

(assert (=> d!46644 (invariant!0 (currentBit!6337 (_2!6877 lt!226132)) (currentByte!6342 (_2!6877 lt!226132)) (size!3001 (buf!3446 (_2!6877 lt!226132))))))

(assert (=> d!46644 (= (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))) lt!226313)))

(declare-fun b!145944 () Bool)

(declare-fun res!122073 () Bool)

(assert (=> b!145944 (=> (not res!122073) (not e!97296))))

(assert (=> b!145944 (= res!122073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226313))))

(declare-fun b!145945 () Bool)

(declare-fun lt!226316 () (_ BitVec 64))

(assert (=> b!145945 (= e!97296 (bvsle lt!226313 (bvmul lt!226316 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145945 (or (= lt!226316 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226316 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226316)))))

(assert (=> b!145945 (= lt!226316 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226132)))))))

(assert (= (and d!46644 res!122074) b!145944))

(assert (= (and b!145944 res!122073) b!145945))

(declare-fun m!224779 () Bool)

(assert (=> d!46644 m!224779))

(declare-fun m!224781 () Bool)

(assert (=> d!46644 m!224781))

(assert (=> b!145848 d!46644))

(declare-fun d!46646 () Bool)

(declare-fun e!97297 () Bool)

(assert (=> d!46646 e!97297))

(declare-fun res!122076 () Bool)

(assert (=> d!46646 (=> (not res!122076) (not e!97297))))

(declare-fun lt!226320 () (_ BitVec 64))

(declare-fun lt!226319 () (_ BitVec 64))

(declare-fun lt!226321 () (_ BitVec 64))

(assert (=> d!46646 (= res!122076 (= lt!226319 (bvsub lt!226321 lt!226320)))))

(assert (=> d!46646 (or (= (bvand lt!226321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226321 lt!226320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46646 (= lt!226320 (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 thiss!1634))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634))))))

(declare-fun lt!226323 () (_ BitVec 64))

(declare-fun lt!226318 () (_ BitVec 64))

(assert (=> d!46646 (= lt!226321 (bvmul lt!226323 lt!226318))))

(assert (=> d!46646 (or (= lt!226323 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226318 (bvsdiv (bvmul lt!226323 lt!226318) lt!226323)))))

(assert (=> d!46646 (= lt!226318 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46646 (= lt!226323 ((_ sign_extend 32) (size!3001 (buf!3446 thiss!1634))))))

(assert (=> d!46646 (= lt!226319 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6342 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6337 thiss!1634))))))

(assert (=> d!46646 (invariant!0 (currentBit!6337 thiss!1634) (currentByte!6342 thiss!1634) (size!3001 (buf!3446 thiss!1634)))))

(assert (=> d!46646 (= (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)) lt!226319)))

(declare-fun b!145946 () Bool)

(declare-fun res!122075 () Bool)

(assert (=> b!145946 (=> (not res!122075) (not e!97297))))

(assert (=> b!145946 (= res!122075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226319))))

(declare-fun b!145947 () Bool)

(declare-fun lt!226322 () (_ BitVec 64))

(assert (=> b!145947 (= e!97297 (bvsle lt!226319 (bvmul lt!226322 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145947 (or (= lt!226322 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226322 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226322)))))

(assert (=> b!145947 (= lt!226322 ((_ sign_extend 32) (size!3001 (buf!3446 thiss!1634))))))

(assert (= (and d!46646 res!122076) b!145946))

(assert (= (and b!145946 res!122075) b!145947))

(assert (=> d!46646 m!224777))

(assert (=> d!46646 m!224577))

(assert (=> b!145848 d!46646))

(declare-fun d!46648 () Bool)

(assert (=> d!46648 (= (invariant!0 (currentBit!6337 thiss!1634) (currentByte!6342 thiss!1634) (size!3001 (buf!3446 thiss!1634))) (and (bvsge (currentBit!6337 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6337 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6342 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6342 thiss!1634) (size!3001 (buf!3446 thiss!1634))) (and (= (currentBit!6337 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6342 thiss!1634) (size!3001 (buf!3446 thiss!1634)))))))))

(assert (=> b!145849 d!46648))

(declare-fun d!46650 () Bool)

(assert (=> d!46650 (isPrefixOf!0 thiss!1634 (_2!6877 lt!226138))))

(declare-fun lt!226326 () Unit!9084)

(declare-fun choose!30 (BitStream!5260 BitStream!5260 BitStream!5260) Unit!9084)

(assert (=> d!46650 (= lt!226326 (choose!30 thiss!1634 (_2!6877 lt!226132) (_2!6877 lt!226138)))))

(assert (=> d!46650 (isPrefixOf!0 thiss!1634 (_2!6877 lt!226132))))

(assert (=> d!46650 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6877 lt!226132) (_2!6877 lt!226138)) lt!226326)))

(declare-fun bs!11442 () Bool)

(assert (= bs!11442 d!46650))

(assert (=> bs!11442 m!224555))

(declare-fun m!224783 () Bool)

(assert (=> bs!11442 m!224783))

(assert (=> bs!11442 m!224517))

(assert (=> b!145838 d!46650))

(declare-fun d!46652 () Bool)

(declare-fun e!97300 () Bool)

(assert (=> d!46652 e!97300))

(declare-fun res!122079 () Bool)

(assert (=> d!46652 (=> (not res!122079) (not e!97300))))

(declare-fun lt!226336 () tuple2!13062)

(declare-fun lt!226338 () tuple2!13062)

(assert (=> d!46652 (= res!122079 (= (bitIndex!0 (size!3001 (buf!3446 (_1!6880 lt!226336))) (currentByte!6342 (_1!6880 lt!226336)) (currentBit!6337 (_1!6880 lt!226336))) (bitIndex!0 (size!3001 (buf!3446 (_1!6880 lt!226338))) (currentByte!6342 (_1!6880 lt!226338)) (currentBit!6337 (_1!6880 lt!226338)))))))

(declare-fun lt!226335 () Unit!9084)

(declare-fun lt!226337 () BitStream!5260)

(declare-fun choose!14 (BitStream!5260 BitStream!5260 BitStream!5260 tuple2!13062 tuple2!13062 BitStream!5260 (_ BitVec 8) tuple2!13062 tuple2!13062 BitStream!5260 (_ BitVec 8)) Unit!9084)

(assert (=> d!46652 (= lt!226335 (choose!14 lt!226133 (_2!6877 lt!226138) lt!226337 lt!226336 (tuple2!13063 (_1!6880 lt!226336) (_2!6880 lt!226336)) (_1!6880 lt!226336) (_2!6880 lt!226336) lt!226338 (tuple2!13063 (_1!6880 lt!226338) (_2!6880 lt!226338)) (_1!6880 lt!226338) (_2!6880 lt!226338)))))

(assert (=> d!46652 (= lt!226338 (readBytePure!0 lt!226337))))

(assert (=> d!46652 (= lt!226336 (readBytePure!0 lt!226133))))

(assert (=> d!46652 (= lt!226337 (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 lt!226133) (currentBit!6337 lt!226133)))))

(assert (=> d!46652 (= (readBytePrefixLemma!0 lt!226133 (_2!6877 lt!226138)) lt!226335)))

(declare-fun b!145950 () Bool)

(assert (=> b!145950 (= e!97300 (= (_2!6880 lt!226336) (_2!6880 lt!226338)))))

(assert (= (and d!46652 res!122079) b!145950))

(declare-fun m!224785 () Bool)

(assert (=> d!46652 m!224785))

(declare-fun m!224787 () Bool)

(assert (=> d!46652 m!224787))

(assert (=> d!46652 m!224525))

(declare-fun m!224789 () Bool)

(assert (=> d!46652 m!224789))

(declare-fun m!224791 () Bool)

(assert (=> d!46652 m!224791))

(assert (=> b!145838 d!46652))

(declare-fun d!46654 () Bool)

(declare-fun e!97301 () Bool)

(assert (=> d!46654 e!97301))

(declare-fun res!122081 () Bool)

(assert (=> d!46654 (=> (not res!122081) (not e!97301))))

(declare-fun lt!226340 () (_ BitVec 64))

(declare-fun lt!226341 () (_ BitVec 64))

(declare-fun lt!226342 () (_ BitVec 64))

(assert (=> d!46654 (= res!122081 (= lt!226340 (bvsub lt!226342 lt!226341)))))

(assert (=> d!46654 (or (= (bvand lt!226342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226341 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226342 lt!226341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46654 (= lt!226341 (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_1!6880 lt!226145)))) ((_ sign_extend 32) (currentByte!6342 (_1!6880 lt!226145))) ((_ sign_extend 32) (currentBit!6337 (_1!6880 lt!226145)))))))

(declare-fun lt!226344 () (_ BitVec 64))

(declare-fun lt!226339 () (_ BitVec 64))

(assert (=> d!46654 (= lt!226342 (bvmul lt!226344 lt!226339))))

(assert (=> d!46654 (or (= lt!226344 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226339 (bvsdiv (bvmul lt!226344 lt!226339) lt!226344)))))

(assert (=> d!46654 (= lt!226339 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46654 (= lt!226344 ((_ sign_extend 32) (size!3001 (buf!3446 (_1!6880 lt!226145)))))))

(assert (=> d!46654 (= lt!226340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6342 (_1!6880 lt!226145))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6337 (_1!6880 lt!226145)))))))

(assert (=> d!46654 (invariant!0 (currentBit!6337 (_1!6880 lt!226145)) (currentByte!6342 (_1!6880 lt!226145)) (size!3001 (buf!3446 (_1!6880 lt!226145))))))

(assert (=> d!46654 (= (bitIndex!0 (size!3001 (buf!3446 (_1!6880 lt!226145))) (currentByte!6342 (_1!6880 lt!226145)) (currentBit!6337 (_1!6880 lt!226145))) lt!226340)))

(declare-fun b!145951 () Bool)

(declare-fun res!122080 () Bool)

(assert (=> b!145951 (=> (not res!122080) (not e!97301))))

(assert (=> b!145951 (= res!122080 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226340))))

(declare-fun b!145952 () Bool)

(declare-fun lt!226343 () (_ BitVec 64))

(assert (=> b!145952 (= e!97301 (bvsle lt!226340 (bvmul lt!226343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145952 (or (= lt!226343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226343)))))

(assert (=> b!145952 (= lt!226343 ((_ sign_extend 32) (size!3001 (buf!3446 (_1!6880 lt!226145)))))))

(assert (= (and d!46654 res!122081) b!145951))

(assert (= (and b!145951 res!122080) b!145952))

(declare-fun m!224793 () Bool)

(assert (=> d!46654 m!224793))

(declare-fun m!224795 () Bool)

(assert (=> d!46654 m!224795))

(assert (=> b!145838 d!46654))

(declare-fun b!145963 () Bool)

(declare-fun res!122088 () Bool)

(declare-fun e!97307 () Bool)

(assert (=> b!145963 (=> (not res!122088) (not e!97307))))

(declare-fun lt!226392 () tuple2!13060)

(assert (=> b!145963 (= res!122088 (isPrefixOf!0 (_2!6879 lt!226392) (_2!6877 lt!226138)))))

(declare-fun b!145964 () Bool)

(declare-fun res!122089 () Bool)

(assert (=> b!145964 (=> (not res!122089) (not e!97307))))

(assert (=> b!145964 (= res!122089 (isPrefixOf!0 (_1!6879 lt!226392) (_2!6877 lt!226132)))))

(declare-fun d!46656 () Bool)

(assert (=> d!46656 e!97307))

(declare-fun res!122090 () Bool)

(assert (=> d!46656 (=> (not res!122090) (not e!97307))))

(assert (=> d!46656 (= res!122090 (isPrefixOf!0 (_1!6879 lt!226392) (_2!6879 lt!226392)))))

(declare-fun lt!226403 () BitStream!5260)

(assert (=> d!46656 (= lt!226392 (tuple2!13061 lt!226403 (_2!6877 lt!226138)))))

(declare-fun lt!226393 () Unit!9084)

(declare-fun lt!226404 () Unit!9084)

(assert (=> d!46656 (= lt!226393 lt!226404)))

(assert (=> d!46656 (isPrefixOf!0 lt!226403 (_2!6877 lt!226138))))

(assert (=> d!46656 (= lt!226404 (lemmaIsPrefixTransitive!0 lt!226403 (_2!6877 lt!226138) (_2!6877 lt!226138)))))

(declare-fun lt!226390 () Unit!9084)

(declare-fun lt!226385 () Unit!9084)

(assert (=> d!46656 (= lt!226390 lt!226385)))

(assert (=> d!46656 (isPrefixOf!0 lt!226403 (_2!6877 lt!226138))))

(assert (=> d!46656 (= lt!226385 (lemmaIsPrefixTransitive!0 lt!226403 (_2!6877 lt!226132) (_2!6877 lt!226138)))))

(declare-fun lt!226394 () Unit!9084)

(declare-fun e!97306 () Unit!9084)

(assert (=> d!46656 (= lt!226394 e!97306)))

(declare-fun c!7903 () Bool)

(assert (=> d!46656 (= c!7903 (not (= (size!3001 (buf!3446 (_2!6877 lt!226132))) #b00000000000000000000000000000000)))))

(declare-fun lt!226389 () Unit!9084)

(declare-fun lt!226387 () Unit!9084)

(assert (=> d!46656 (= lt!226389 lt!226387)))

(assert (=> d!46656 (isPrefixOf!0 (_2!6877 lt!226138) (_2!6877 lt!226138))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5260) Unit!9084)

(assert (=> d!46656 (= lt!226387 (lemmaIsPrefixRefl!0 (_2!6877 lt!226138)))))

(declare-fun lt!226402 () Unit!9084)

(declare-fun lt!226398 () Unit!9084)

(assert (=> d!46656 (= lt!226402 lt!226398)))

(assert (=> d!46656 (= lt!226398 (lemmaIsPrefixRefl!0 (_2!6877 lt!226138)))))

(declare-fun lt!226397 () Unit!9084)

(declare-fun lt!226395 () Unit!9084)

(assert (=> d!46656 (= lt!226397 lt!226395)))

(assert (=> d!46656 (isPrefixOf!0 lt!226403 lt!226403)))

(assert (=> d!46656 (= lt!226395 (lemmaIsPrefixRefl!0 lt!226403))))

(declare-fun lt!226388 () Unit!9084)

(declare-fun lt!226400 () Unit!9084)

(assert (=> d!46656 (= lt!226388 lt!226400)))

(assert (=> d!46656 (isPrefixOf!0 (_2!6877 lt!226132) (_2!6877 lt!226132))))

(assert (=> d!46656 (= lt!226400 (lemmaIsPrefixRefl!0 (_2!6877 lt!226132)))))

(assert (=> d!46656 (= lt!226403 (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))))))

(assert (=> d!46656 (isPrefixOf!0 (_2!6877 lt!226132) (_2!6877 lt!226138))))

(assert (=> d!46656 (= (reader!0 (_2!6877 lt!226132) (_2!6877 lt!226138)) lt!226392)))

(declare-fun b!145965 () Bool)

(declare-fun Unit!9090 () Unit!9084)

(assert (=> b!145965 (= e!97306 Unit!9090)))

(declare-fun b!145966 () Bool)

(declare-fun lt!226391 () Unit!9084)

(assert (=> b!145966 (= e!97306 lt!226391)))

(declare-fun lt!226401 () (_ BitVec 64))

(assert (=> b!145966 (= lt!226401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226396 () (_ BitVec 64))

(assert (=> b!145966 (= lt!226396 (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6629 array!6629 (_ BitVec 64) (_ BitVec 64)) Unit!9084)

(assert (=> b!145966 (= lt!226391 (arrayBitRangesEqSymmetric!0 (buf!3446 (_2!6877 lt!226132)) (buf!3446 (_2!6877 lt!226138)) lt!226401 lt!226396))))

(declare-fun arrayBitRangesEq!0 (array!6629 array!6629 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145966 (arrayBitRangesEq!0 (buf!3446 (_2!6877 lt!226138)) (buf!3446 (_2!6877 lt!226132)) lt!226401 lt!226396)))

(declare-fun b!145967 () Bool)

(declare-fun lt!226399 () (_ BitVec 64))

(declare-fun lt!226386 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5260 (_ BitVec 64)) BitStream!5260)

(assert (=> b!145967 (= e!97307 (= (_1!6879 lt!226392) (withMovedBitIndex!0 (_2!6879 lt!226392) (bvsub lt!226399 lt!226386))))))

(assert (=> b!145967 (or (= (bvand lt!226399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226386 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226399 lt!226386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145967 (= lt!226386 (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226138))) (currentByte!6342 (_2!6877 lt!226138)) (currentBit!6337 (_2!6877 lt!226138))))))

(assert (=> b!145967 (= lt!226399 (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))))))

(assert (= (and d!46656 c!7903) b!145966))

(assert (= (and d!46656 (not c!7903)) b!145965))

(assert (= (and d!46656 res!122090) b!145964))

(assert (= (and b!145964 res!122089) b!145963))

(assert (= (and b!145963 res!122088) b!145967))

(declare-fun m!224797 () Bool)

(assert (=> b!145964 m!224797))

(declare-fun m!224799 () Bool)

(assert (=> d!46656 m!224799))

(declare-fun m!224801 () Bool)

(assert (=> d!46656 m!224801))

(declare-fun m!224803 () Bool)

(assert (=> d!46656 m!224803))

(declare-fun m!224805 () Bool)

(assert (=> d!46656 m!224805))

(declare-fun m!224807 () Bool)

(assert (=> d!46656 m!224807))

(declare-fun m!224809 () Bool)

(assert (=> d!46656 m!224809))

(declare-fun m!224811 () Bool)

(assert (=> d!46656 m!224811))

(assert (=> d!46656 m!224589))

(declare-fun m!224813 () Bool)

(assert (=> d!46656 m!224813))

(declare-fun m!224815 () Bool)

(assert (=> d!46656 m!224815))

(declare-fun m!224817 () Bool)

(assert (=> d!46656 m!224817))

(declare-fun m!224819 () Bool)

(assert (=> b!145963 m!224819))

(assert (=> b!145966 m!224513))

(declare-fun m!224821 () Bool)

(assert (=> b!145966 m!224821))

(declare-fun m!224823 () Bool)

(assert (=> b!145966 m!224823))

(declare-fun m!224825 () Bool)

(assert (=> b!145967 m!224825))

(assert (=> b!145967 m!224591))

(assert (=> b!145967 m!224513))

(assert (=> b!145838 d!46656))

(declare-fun d!46658 () Bool)

(assert (=> d!46658 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!226407 () Unit!9084)

(declare-fun choose!26 (BitStream!5260 array!6629 (_ BitVec 32) BitStream!5260) Unit!9084)

(assert (=> d!46658 (= lt!226407 (choose!26 thiss!1634 (buf!3446 (_2!6877 lt!226138)) (bvsub to!404 from!447) (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634))))))

(assert (=> d!46658 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3446 (_2!6877 lt!226138)) (bvsub to!404 from!447)) lt!226407)))

(declare-fun bs!11443 () Bool)

(assert (= bs!11443 d!46658))

(assert (=> bs!11443 m!224519))

(declare-fun m!224827 () Bool)

(assert (=> bs!11443 m!224827))

(assert (=> b!145838 d!46658))

(declare-fun d!46660 () Bool)

(assert (=> d!46660 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226125)))

(declare-fun lt!226408 () Unit!9084)

(assert (=> d!46660 (= lt!226408 (choose!26 (_2!6877 lt!226132) (buf!3446 (_2!6877 lt!226138)) lt!226125 (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132)))))))

(assert (=> d!46660 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6877 lt!226132) (buf!3446 (_2!6877 lt!226138)) lt!226125) lt!226408)))

(declare-fun bs!11444 () Bool)

(assert (= bs!11444 d!46660))

(assert (=> bs!11444 m!224565))

(declare-fun m!224829 () Bool)

(assert (=> bs!11444 m!224829))

(assert (=> b!145838 d!46660))

(declare-datatypes ((tuple3!564 0))(
  ( (tuple3!565 (_1!6889 Unit!9084) (_2!6889 BitStream!5260) (_3!349 array!6629)) )
))
(declare-fun lt!226411 () tuple3!564)

(declare-fun d!46662 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5260 array!6629 (_ BitVec 32) (_ BitVec 32)) tuple3!564)

(assert (=> d!46662 (= lt!226411 (readByteArrayLoop!0 (_1!6879 lt!226126) lt!226127 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46662 (= (readByteArrayLoopPure!0 (_1!6879 lt!226126) lt!226127 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13059 (_2!6889 lt!226411) (_3!349 lt!226411)))))

(declare-fun bs!11445 () Bool)

(assert (= bs!11445 d!46662))

(declare-fun m!224831 () Bool)

(assert (=> bs!11445 m!224831))

(assert (=> b!145838 d!46662))

(declare-fun d!46664 () Bool)

(declare-datatypes ((tuple2!13080 0))(
  ( (tuple2!13081 (_1!6890 (_ BitVec 8)) (_2!6890 BitStream!5260)) )
))
(declare-fun lt!226414 () tuple2!13080)

(declare-fun readByte!0 (BitStream!5260) tuple2!13080)

(assert (=> d!46664 (= lt!226414 (readByte!0 (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634))))))

(assert (=> d!46664 (= (readBytePure!0 (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634))) (tuple2!13063 (_2!6890 lt!226414) (_1!6890 lt!226414)))))

(declare-fun bs!11446 () Bool)

(assert (= bs!11446 d!46664))

(declare-fun m!224833 () Bool)

(assert (=> bs!11446 m!224833))

(assert (=> b!145838 d!46664))

(declare-fun d!46666 () Bool)

(declare-fun res!122095 () Bool)

(declare-fun e!97312 () Bool)

(assert (=> d!46666 (=> res!122095 e!97312)))

(assert (=> d!46666 (= res!122095 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46666 (= (arrayRangesEq!317 (_2!6878 lt!226129) (_2!6878 lt!226142) #b00000000000000000000000000000000 to!404) e!97312)))

(declare-fun b!145972 () Bool)

(declare-fun e!97313 () Bool)

(assert (=> b!145972 (= e!97312 e!97313)))

(declare-fun res!122096 () Bool)

(assert (=> b!145972 (=> (not res!122096) (not e!97313))))

(assert (=> b!145972 (= res!122096 (= (select (arr!3740 (_2!6878 lt!226129)) #b00000000000000000000000000000000) (select (arr!3740 (_2!6878 lt!226142)) #b00000000000000000000000000000000)))))

(declare-fun b!145973 () Bool)

(assert (=> b!145973 (= e!97313 (arrayRangesEq!317 (_2!6878 lt!226129) (_2!6878 lt!226142) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46666 (not res!122095)) b!145972))

(assert (= (and b!145972 res!122096) b!145973))

(declare-fun m!224835 () Bool)

(assert (=> b!145972 m!224835))

(declare-fun m!224837 () Bool)

(assert (=> b!145972 m!224837))

(declare-fun m!224839 () Bool)

(assert (=> b!145973 m!224839))

(assert (=> b!145838 d!46666))

(declare-fun d!46668 () Bool)

(declare-fun lt!226415 () tuple2!13080)

(assert (=> d!46668 (= lt!226415 (readByte!0 (_1!6879 lt!226137)))))

(assert (=> d!46668 (= (readBytePure!0 (_1!6879 lt!226137)) (tuple2!13063 (_2!6890 lt!226415) (_1!6890 lt!226415)))))

(declare-fun bs!11447 () Bool)

(assert (= bs!11447 d!46668))

(declare-fun m!224841 () Bool)

(assert (=> bs!11447 m!224841))

(assert (=> b!145838 d!46668))

(declare-fun d!46670 () Bool)

(declare-fun res!122104 () Bool)

(declare-fun e!97318 () Bool)

(assert (=> d!46670 (=> (not res!122104) (not e!97318))))

(assert (=> d!46670 (= res!122104 (= (size!3001 (buf!3446 thiss!1634)) (size!3001 (buf!3446 (_2!6877 lt!226138)))))))

(assert (=> d!46670 (= (isPrefixOf!0 thiss!1634 (_2!6877 lt!226138)) e!97318)))

(declare-fun b!145980 () Bool)

(declare-fun res!122103 () Bool)

(assert (=> b!145980 (=> (not res!122103) (not e!97318))))

(assert (=> b!145980 (= res!122103 (bvsle (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)) (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226138))) (currentByte!6342 (_2!6877 lt!226138)) (currentBit!6337 (_2!6877 lt!226138)))))))

(declare-fun b!145981 () Bool)

(declare-fun e!97319 () Bool)

(assert (=> b!145981 (= e!97318 e!97319)))

(declare-fun res!122105 () Bool)

(assert (=> b!145981 (=> res!122105 e!97319)))

(assert (=> b!145981 (= res!122105 (= (size!3001 (buf!3446 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!145982 () Bool)

(assert (=> b!145982 (= e!97319 (arrayBitRangesEq!0 (buf!3446 thiss!1634) (buf!3446 (_2!6877 lt!226138)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634))))))

(assert (= (and d!46670 res!122104) b!145980))

(assert (= (and b!145980 res!122103) b!145981))

(assert (= (and b!145981 (not res!122105)) b!145982))

(assert (=> b!145980 m!224515))

(assert (=> b!145980 m!224591))

(assert (=> b!145982 m!224515))

(assert (=> b!145982 m!224515))

(declare-fun m!224843 () Bool)

(assert (=> b!145982 m!224843))

(assert (=> b!145838 d!46670))

(declare-fun d!46672 () Bool)

(declare-fun e!97322 () Bool)

(assert (=> d!46672 e!97322))

(declare-fun res!122113 () Bool)

(assert (=> d!46672 (=> (not res!122113) (not e!97322))))

(declare-fun lt!226430 () tuple2!13056)

(assert (=> d!46672 (= res!122113 (= (size!3001 (buf!3446 thiss!1634)) (size!3001 (buf!3446 (_2!6877 lt!226430)))))))

(declare-fun choose!6 (BitStream!5260 (_ BitVec 8)) tuple2!13056)

(assert (=> d!46672 (= lt!226430 (choose!6 thiss!1634 (select (arr!3740 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!46672 (validate_offset_byte!0 ((_ sign_extend 32) (size!3001 (buf!3446 thiss!1634))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634)))))

(assert (=> d!46672 (= (appendByte!0 thiss!1634 (select (arr!3740 arr!237) from!447)) lt!226430)))

(declare-fun b!145989 () Bool)

(declare-fun res!122114 () Bool)

(assert (=> b!145989 (=> (not res!122114) (not e!97322))))

(declare-fun lt!226428 () (_ BitVec 64))

(declare-fun lt!226429 () (_ BitVec 64))

(assert (=> b!145989 (= res!122114 (= (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226430))) (currentByte!6342 (_2!6877 lt!226430)) (currentBit!6337 (_2!6877 lt!226430))) (bvadd lt!226428 lt!226429)))))

(assert (=> b!145989 (or (not (= (bvand lt!226428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226429 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!226428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!226428 lt!226429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145989 (= lt!226429 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!145989 (= lt!226428 (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))

(declare-fun b!145990 () Bool)

(declare-fun res!122112 () Bool)

(assert (=> b!145990 (=> (not res!122112) (not e!97322))))

(assert (=> b!145990 (= res!122112 (isPrefixOf!0 thiss!1634 (_2!6877 lt!226430)))))

(declare-fun lt!226427 () tuple2!13062)

(declare-fun lt!226426 () tuple2!13060)

(declare-fun b!145991 () Bool)

(assert (=> b!145991 (= e!97322 (and (= (_2!6880 lt!226427) (select (arr!3740 arr!237) from!447)) (= (_1!6880 lt!226427) (_2!6879 lt!226426))))))

(assert (=> b!145991 (= lt!226427 (readBytePure!0 (_1!6879 lt!226426)))))

(assert (=> b!145991 (= lt!226426 (reader!0 thiss!1634 (_2!6877 lt!226430)))))

(assert (= (and d!46672 res!122113) b!145989))

(assert (= (and b!145989 res!122114) b!145990))

(assert (= (and b!145990 res!122112) b!145991))

(assert (=> d!46672 m!224559))

(declare-fun m!224845 () Bool)

(assert (=> d!46672 m!224845))

(declare-fun m!224847 () Bool)

(assert (=> d!46672 m!224847))

(declare-fun m!224849 () Bool)

(assert (=> b!145989 m!224849))

(assert (=> b!145989 m!224515))

(declare-fun m!224851 () Bool)

(assert (=> b!145990 m!224851))

(declare-fun m!224853 () Bool)

(assert (=> b!145991 m!224853))

(declare-fun m!224855 () Bool)

(assert (=> b!145991 m!224855))

(assert (=> b!145838 d!46672))

(declare-fun d!46674 () Bool)

(declare-fun e!97323 () Bool)

(assert (=> d!46674 e!97323))

(declare-fun res!122116 () Bool)

(assert (=> d!46674 (=> (not res!122116) (not e!97323))))

(declare-fun lt!226432 () (_ BitVec 64))

(declare-fun lt!226434 () (_ BitVec 64))

(declare-fun lt!226433 () (_ BitVec 64))

(assert (=> d!46674 (= res!122116 (= lt!226432 (bvsub lt!226434 lt!226433)))))

(assert (=> d!46674 (or (= (bvand lt!226434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226433 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226434 lt!226433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46674 (= lt!226433 (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_1!6880 lt!226134)))) ((_ sign_extend 32) (currentByte!6342 (_1!6880 lt!226134))) ((_ sign_extend 32) (currentBit!6337 (_1!6880 lt!226134)))))))

(declare-fun lt!226436 () (_ BitVec 64))

(declare-fun lt!226431 () (_ BitVec 64))

(assert (=> d!46674 (= lt!226434 (bvmul lt!226436 lt!226431))))

(assert (=> d!46674 (or (= lt!226436 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226431 (bvsdiv (bvmul lt!226436 lt!226431) lt!226436)))))

(assert (=> d!46674 (= lt!226431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46674 (= lt!226436 ((_ sign_extend 32) (size!3001 (buf!3446 (_1!6880 lt!226134)))))))

(assert (=> d!46674 (= lt!226432 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6342 (_1!6880 lt!226134))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6337 (_1!6880 lt!226134)))))))

(assert (=> d!46674 (invariant!0 (currentBit!6337 (_1!6880 lt!226134)) (currentByte!6342 (_1!6880 lt!226134)) (size!3001 (buf!3446 (_1!6880 lt!226134))))))

(assert (=> d!46674 (= (bitIndex!0 (size!3001 (buf!3446 (_1!6880 lt!226134))) (currentByte!6342 (_1!6880 lt!226134)) (currentBit!6337 (_1!6880 lt!226134))) lt!226432)))

(declare-fun b!145992 () Bool)

(declare-fun res!122115 () Bool)

(assert (=> b!145992 (=> (not res!122115) (not e!97323))))

(assert (=> b!145992 (= res!122115 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226432))))

(declare-fun b!145993 () Bool)

(declare-fun lt!226435 () (_ BitVec 64))

(assert (=> b!145993 (= e!97323 (bvsle lt!226432 (bvmul lt!226435 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145993 (or (= lt!226435 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226435 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226435)))))

(assert (=> b!145993 (= lt!226435 ((_ sign_extend 32) (size!3001 (buf!3446 (_1!6880 lt!226134)))))))

(assert (= (and d!46674 res!122116) b!145992))

(assert (= (and b!145992 res!122115) b!145993))

(declare-fun m!224857 () Bool)

(assert (=> d!46674 m!224857))

(declare-fun m!224859 () Bool)

(assert (=> d!46674 m!224859))

(assert (=> b!145838 d!46674))

(declare-fun d!46676 () Bool)

(assert (=> d!46676 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226132)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226125) (bvsle ((_ sign_extend 32) lt!226125) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226132)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11448 () Bool)

(assert (= bs!11448 d!46676))

(assert (=> bs!11448 m!224779))

(assert (=> b!145838 d!46676))

(declare-fun d!46678 () Bool)

(declare-fun res!122117 () Bool)

(declare-fun e!97324 () Bool)

(assert (=> d!46678 (=> res!122117 e!97324)))

(assert (=> d!46678 (= res!122117 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46678 (= (arrayRangesEq!317 (_2!6878 lt!226129) (_2!6878 lt!226144) #b00000000000000000000000000000000 to!404) e!97324)))

(declare-fun b!145994 () Bool)

(declare-fun e!97325 () Bool)

(assert (=> b!145994 (= e!97324 e!97325)))

(declare-fun res!122118 () Bool)

(assert (=> b!145994 (=> (not res!122118) (not e!97325))))

(assert (=> b!145994 (= res!122118 (= (select (arr!3740 (_2!6878 lt!226129)) #b00000000000000000000000000000000) (select (arr!3740 (_2!6878 lt!226144)) #b00000000000000000000000000000000)))))

(declare-fun b!145995 () Bool)

(assert (=> b!145995 (= e!97325 (arrayRangesEq!317 (_2!6878 lt!226129) (_2!6878 lt!226144) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46678 (not res!122117)) b!145994))

(assert (= (and b!145994 res!122118) b!145995))

(assert (=> b!145994 m!224835))

(declare-fun m!224861 () Bool)

(assert (=> b!145994 m!224861))

(declare-fun m!224863 () Bool)

(assert (=> b!145995 m!224863))

(assert (=> b!145838 d!46678))

(declare-fun d!46680 () Bool)

(assert (=> d!46680 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226125) (bvsle ((_ sign_extend 32) lt!226125) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11449 () Bool)

(assert (= bs!11449 d!46680))

(declare-fun m!224865 () Bool)

(assert (=> bs!11449 m!224865))

(assert (=> b!145838 d!46680))

(declare-fun d!46682 () Bool)

(declare-fun lt!226445 () tuple2!13058)

(declare-fun lt!226447 () tuple2!13058)

(assert (=> d!46682 (arrayRangesEq!317 (_2!6878 lt!226445) (_2!6878 lt!226447) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!226448 () Unit!9084)

(declare-fun lt!226446 () BitStream!5260)

(declare-fun choose!35 (BitStream!5260 array!6629 (_ BitVec 32) (_ BitVec 32) tuple2!13058 array!6629 BitStream!5260 tuple2!13058 array!6629) Unit!9084)

(assert (=> d!46682 (= lt!226448 (choose!35 (_1!6879 lt!226137) arr!237 from!447 to!404 lt!226445 (_2!6878 lt!226445) lt!226446 lt!226447 (_2!6878 lt!226447)))))

(assert (=> d!46682 (= lt!226447 (readByteArrayLoopPure!0 lt!226446 (array!6630 (store (arr!3740 arr!237) from!447 (_2!6880 (readBytePure!0 (_1!6879 lt!226137)))) (size!3001 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!46682 (= lt!226446 (withMovedByteIndex!0 (_1!6879 lt!226137) #b00000000000000000000000000000001))))

(assert (=> d!46682 (= lt!226445 (readByteArrayLoopPure!0 (_1!6879 lt!226137) arr!237 from!447 to!404))))

(assert (=> d!46682 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6879 lt!226137) arr!237 from!447 to!404) lt!226448)))

(declare-fun bs!11451 () Bool)

(assert (= bs!11451 d!46682))

(declare-fun m!224867 () Bool)

(assert (=> bs!11451 m!224867))

(declare-fun m!224869 () Bool)

(assert (=> bs!11451 m!224869))

(assert (=> bs!11451 m!224535))

(assert (=> bs!11451 m!224545))

(assert (=> bs!11451 m!224557))

(declare-fun m!224871 () Bool)

(assert (=> bs!11451 m!224871))

(declare-fun m!224873 () Bool)

(assert (=> bs!11451 m!224873))

(assert (=> b!145838 d!46682))

(declare-fun d!46684 () Bool)

(declare-fun lt!226449 () tuple3!564)

(assert (=> d!46684 (= lt!226449 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6879 lt!226137) #b00000000000000000000000000000001) lt!226127 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46684 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6879 lt!226137) #b00000000000000000000000000000001) lt!226127 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13059 (_2!6889 lt!226449) (_3!349 lt!226449)))))

(declare-fun bs!11452 () Bool)

(assert (= bs!11452 d!46684))

(assert (=> bs!11452 m!224535))

(declare-fun m!224875 () Bool)

(assert (=> bs!11452 m!224875))

(assert (=> b!145838 d!46684))

(declare-fun b!145996 () Bool)

(declare-fun res!122119 () Bool)

(declare-fun e!97327 () Bool)

(assert (=> b!145996 (=> (not res!122119) (not e!97327))))

(declare-fun lt!226457 () tuple2!13060)

(assert (=> b!145996 (= res!122119 (isPrefixOf!0 (_2!6879 lt!226457) (_2!6877 lt!226138)))))

(declare-fun b!145997 () Bool)

(declare-fun res!122120 () Bool)

(assert (=> b!145997 (=> (not res!122120) (not e!97327))))

(assert (=> b!145997 (= res!122120 (isPrefixOf!0 (_1!6879 lt!226457) thiss!1634))))

(declare-fun d!46686 () Bool)

(assert (=> d!46686 e!97327))

(declare-fun res!122121 () Bool)

(assert (=> d!46686 (=> (not res!122121) (not e!97327))))

(assert (=> d!46686 (= res!122121 (isPrefixOf!0 (_1!6879 lt!226457) (_2!6879 lt!226457)))))

(declare-fun lt!226468 () BitStream!5260)

(assert (=> d!46686 (= lt!226457 (tuple2!13061 lt!226468 (_2!6877 lt!226138)))))

(declare-fun lt!226458 () Unit!9084)

(declare-fun lt!226469 () Unit!9084)

(assert (=> d!46686 (= lt!226458 lt!226469)))

(assert (=> d!46686 (isPrefixOf!0 lt!226468 (_2!6877 lt!226138))))

(assert (=> d!46686 (= lt!226469 (lemmaIsPrefixTransitive!0 lt!226468 (_2!6877 lt!226138) (_2!6877 lt!226138)))))

(declare-fun lt!226455 () Unit!9084)

(declare-fun lt!226450 () Unit!9084)

(assert (=> d!46686 (= lt!226455 lt!226450)))

(assert (=> d!46686 (isPrefixOf!0 lt!226468 (_2!6877 lt!226138))))

(assert (=> d!46686 (= lt!226450 (lemmaIsPrefixTransitive!0 lt!226468 thiss!1634 (_2!6877 lt!226138)))))

(declare-fun lt!226459 () Unit!9084)

(declare-fun e!97326 () Unit!9084)

(assert (=> d!46686 (= lt!226459 e!97326)))

(declare-fun c!7904 () Bool)

(assert (=> d!46686 (= c!7904 (not (= (size!3001 (buf!3446 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!226454 () Unit!9084)

(declare-fun lt!226452 () Unit!9084)

(assert (=> d!46686 (= lt!226454 lt!226452)))

(assert (=> d!46686 (isPrefixOf!0 (_2!6877 lt!226138) (_2!6877 lt!226138))))

(assert (=> d!46686 (= lt!226452 (lemmaIsPrefixRefl!0 (_2!6877 lt!226138)))))

(declare-fun lt!226467 () Unit!9084)

(declare-fun lt!226463 () Unit!9084)

(assert (=> d!46686 (= lt!226467 lt!226463)))

(assert (=> d!46686 (= lt!226463 (lemmaIsPrefixRefl!0 (_2!6877 lt!226138)))))

(declare-fun lt!226462 () Unit!9084)

(declare-fun lt!226460 () Unit!9084)

(assert (=> d!46686 (= lt!226462 lt!226460)))

(assert (=> d!46686 (isPrefixOf!0 lt!226468 lt!226468)))

(assert (=> d!46686 (= lt!226460 (lemmaIsPrefixRefl!0 lt!226468))))

(declare-fun lt!226453 () Unit!9084)

(declare-fun lt!226465 () Unit!9084)

(assert (=> d!46686 (= lt!226453 lt!226465)))

(assert (=> d!46686 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46686 (= lt!226465 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46686 (= lt!226468 (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))

(assert (=> d!46686 (isPrefixOf!0 thiss!1634 (_2!6877 lt!226138))))

(assert (=> d!46686 (= (reader!0 thiss!1634 (_2!6877 lt!226138)) lt!226457)))

(declare-fun b!145998 () Bool)

(declare-fun Unit!9091 () Unit!9084)

(assert (=> b!145998 (= e!97326 Unit!9091)))

(declare-fun b!145999 () Bool)

(declare-fun lt!226456 () Unit!9084)

(assert (=> b!145999 (= e!97326 lt!226456)))

(declare-fun lt!226466 () (_ BitVec 64))

(assert (=> b!145999 (= lt!226466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226461 () (_ BitVec 64))

(assert (=> b!145999 (= lt!226461 (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))

(assert (=> b!145999 (= lt!226456 (arrayBitRangesEqSymmetric!0 (buf!3446 thiss!1634) (buf!3446 (_2!6877 lt!226138)) lt!226466 lt!226461))))

(assert (=> b!145999 (arrayBitRangesEq!0 (buf!3446 (_2!6877 lt!226138)) (buf!3446 thiss!1634) lt!226466 lt!226461)))

(declare-fun lt!226451 () (_ BitVec 64))

(declare-fun b!146000 () Bool)

(declare-fun lt!226464 () (_ BitVec 64))

(assert (=> b!146000 (= e!97327 (= (_1!6879 lt!226457) (withMovedBitIndex!0 (_2!6879 lt!226457) (bvsub lt!226464 lt!226451))))))

(assert (=> b!146000 (or (= (bvand lt!226464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226464 lt!226451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146000 (= lt!226451 (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226138))) (currentByte!6342 (_2!6877 lt!226138)) (currentBit!6337 (_2!6877 lt!226138))))))

(assert (=> b!146000 (= lt!226464 (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))

(assert (= (and d!46686 c!7904) b!145999))

(assert (= (and d!46686 (not c!7904)) b!145998))

(assert (= (and d!46686 res!122121) b!145997))

(assert (= (and b!145997 res!122120) b!145996))

(assert (= (and b!145996 res!122119) b!146000))

(declare-fun m!224877 () Bool)

(assert (=> b!145997 m!224877))

(declare-fun m!224879 () Bool)

(assert (=> d!46686 m!224879))

(declare-fun m!224881 () Bool)

(assert (=> d!46686 m!224881))

(declare-fun m!224883 () Bool)

(assert (=> d!46686 m!224883))

(declare-fun m!224885 () Bool)

(assert (=> d!46686 m!224885))

(declare-fun m!224887 () Bool)

(assert (=> d!46686 m!224887))

(declare-fun m!224889 () Bool)

(assert (=> d!46686 m!224889))

(declare-fun m!224891 () Bool)

(assert (=> d!46686 m!224891))

(assert (=> d!46686 m!224555))

(declare-fun m!224893 () Bool)

(assert (=> d!46686 m!224893))

(assert (=> d!46686 m!224815))

(assert (=> d!46686 m!224817))

(declare-fun m!224895 () Bool)

(assert (=> b!145996 m!224895))

(assert (=> b!145999 m!224515))

(declare-fun m!224897 () Bool)

(assert (=> b!145999 m!224897))

(declare-fun m!224899 () Bool)

(assert (=> b!145999 m!224899))

(declare-fun m!224901 () Bool)

(assert (=> b!146000 m!224901))

(assert (=> b!146000 m!224591))

(assert (=> b!146000 m!224515))

(assert (=> b!145838 d!46686))

(declare-fun d!46688 () Bool)

(assert (=> d!46688 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 thiss!1634)) ((_ sign_extend 32) (currentBit!6337 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11453 () Bool)

(assert (= bs!11453 d!46688))

(declare-fun m!224903 () Bool)

(assert (=> bs!11453 m!224903))

(assert (=> b!145838 d!46688))

(declare-fun d!46690 () Bool)

(declare-fun lt!226470 () tuple2!13080)

(assert (=> d!46690 (= lt!226470 (readByte!0 lt!226133))))

(assert (=> d!46690 (= (readBytePure!0 lt!226133) (tuple2!13063 (_2!6890 lt!226470) (_1!6890 lt!226470)))))

(declare-fun bs!11454 () Bool)

(assert (= bs!11454 d!46690))

(declare-fun m!224905 () Bool)

(assert (=> bs!11454 m!224905))

(assert (=> b!145838 d!46690))

(declare-fun d!46692 () Bool)

(declare-fun lt!226471 () tuple3!564)

(assert (=> d!46692 (= lt!226471 (readByteArrayLoop!0 (_1!6879 lt!226137) arr!237 from!447 to!404))))

(assert (=> d!46692 (= (readByteArrayLoopPure!0 (_1!6879 lt!226137) arr!237 from!447 to!404) (tuple2!13059 (_2!6889 lt!226471) (_3!349 lt!226471)))))

(declare-fun bs!11455 () Bool)

(assert (= bs!11455 d!46692))

(declare-fun m!224907 () Bool)

(assert (=> bs!11455 m!224907))

(assert (=> b!145838 d!46692))

(declare-fun d!46694 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5260 (_ BitVec 32)) tuple2!13056)

(assert (=> d!46694 (= (withMovedByteIndex!0 (_1!6879 lt!226137) #b00000000000000000000000000000001) (_2!6877 (moveByteIndex!0 (_1!6879 lt!226137) #b00000000000000000000000000000001)))))

(declare-fun bs!11456 () Bool)

(assert (= bs!11456 d!46694))

(declare-fun m!224909 () Bool)

(assert (=> bs!11456 m!224909))

(assert (=> b!145838 d!46694))

(declare-fun b!146011 () Bool)

(declare-fun res!122135 () Bool)

(declare-fun e!97334 () Bool)

(assert (=> b!146011 (=> (not res!122135) (not e!97334))))

(declare-fun lt!226493 () tuple2!13056)

(assert (=> b!146011 (= res!122135 (isPrefixOf!0 (_2!6877 lt!226132) (_2!6877 lt!226493)))))

(declare-fun b!146012 () Bool)

(declare-fun e!97336 () Bool)

(assert (=> b!146012 (= e!97334 e!97336)))

(declare-fun res!122132 () Bool)

(assert (=> b!146012 (=> (not res!122132) (not e!97336))))

(declare-fun lt!226498 () tuple2!13060)

(declare-fun lt!226490 () tuple2!13058)

(assert (=> b!146012 (= res!122132 (and (= (size!3001 (_2!6878 lt!226490)) (size!3001 arr!237)) (= (_1!6878 lt!226490) (_2!6879 lt!226498))))))

(assert (=> b!146012 (= lt!226490 (readByteArrayLoopPure!0 (_1!6879 lt!226498) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226495 () Unit!9084)

(declare-fun lt!226494 () Unit!9084)

(assert (=> b!146012 (= lt!226495 lt!226494)))

(declare-fun lt!226497 () (_ BitVec 64))

(assert (=> b!146012 (validate_offset_bits!1 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226493)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226497)))

(assert (=> b!146012 (= lt!226494 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6877 lt!226132) (buf!3446 (_2!6877 lt!226493)) lt!226497))))

(declare-fun e!97335 () Bool)

(assert (=> b!146012 e!97335))

(declare-fun res!122133 () Bool)

(assert (=> b!146012 (=> (not res!122133) (not e!97335))))

(assert (=> b!146012 (= res!122133 (and (= (size!3001 (buf!3446 (_2!6877 lt!226132))) (size!3001 (buf!3446 (_2!6877 lt!226493)))) (bvsge lt!226497 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146012 (= lt!226497 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146012 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146012 (= lt!226498 (reader!0 (_2!6877 lt!226132) (_2!6877 lt!226493)))))

(declare-fun b!146013 () Bool)

(assert (=> b!146013 (= e!97336 (arrayRangesEq!317 arr!237 (_2!6878 lt!226490) #b00000000000000000000000000000000 to!404))))

(declare-fun d!46696 () Bool)

(assert (=> d!46696 e!97334))

(declare-fun res!122134 () Bool)

(assert (=> d!46696 (=> (not res!122134) (not e!97334))))

(assert (=> d!46696 (= res!122134 (= (size!3001 (buf!3446 (_2!6877 lt!226132))) (size!3001 (buf!3446 (_2!6877 lt!226493)))))))

(declare-fun choose!64 (BitStream!5260 array!6629 (_ BitVec 32) (_ BitVec 32)) tuple2!13056)

(assert (=> d!46696 (= lt!226493 (choose!64 (_2!6877 lt!226132) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46696 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3001 arr!237)))))

(assert (=> d!46696 (= (appendByteArrayLoop!0 (_2!6877 lt!226132) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!226493)))

(declare-fun b!146014 () Bool)

(declare-fun res!122136 () Bool)

(assert (=> b!146014 (=> (not res!122136) (not e!97334))))

(declare-fun lt!226496 () (_ BitVec 64))

(declare-fun lt!226491 () (_ BitVec 64))

(assert (=> b!146014 (= res!122136 (= (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226493))) (currentByte!6342 (_2!6877 lt!226493)) (currentBit!6337 (_2!6877 lt!226493))) (bvadd lt!226496 lt!226491)))))

(assert (=> b!146014 (or (not (= (bvand lt!226496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226491 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!226496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!226496 lt!226491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!226492 () (_ BitVec 64))

(assert (=> b!146014 (= lt!226491 (bvmul lt!226492 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!146014 (or (= lt!226492 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226492 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226492)))))

(assert (=> b!146014 (= lt!226492 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146014 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146014 (= lt!226496 (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))))))

(declare-fun b!146015 () Bool)

(assert (=> b!146015 (= e!97335 (validate_offset_bits!1 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226132)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226497))))

(assert (= (and d!46696 res!122134) b!146014))

(assert (= (and b!146014 res!122136) b!146011))

(assert (= (and b!146011 res!122135) b!146012))

(assert (= (and b!146012 res!122133) b!146015))

(assert (= (and b!146012 res!122132) b!146013))

(declare-fun m!224911 () Bool)

(assert (=> b!146015 m!224911))

(declare-fun m!224913 () Bool)

(assert (=> b!146011 m!224913))

(declare-fun m!224915 () Bool)

(assert (=> b!146012 m!224915))

(declare-fun m!224917 () Bool)

(assert (=> b!146012 m!224917))

(declare-fun m!224919 () Bool)

(assert (=> b!146012 m!224919))

(declare-fun m!224921 () Bool)

(assert (=> b!146012 m!224921))

(declare-fun m!224923 () Bool)

(assert (=> b!146014 m!224923))

(assert (=> b!146014 m!224513))

(declare-fun m!224925 () Bool)

(assert (=> d!46696 m!224925))

(declare-fun m!224927 () Bool)

(assert (=> b!146013 m!224927))

(assert (=> b!145838 d!46696))

(declare-fun d!46698 () Bool)

(declare-fun e!97339 () Bool)

(assert (=> d!46698 e!97339))

(declare-fun res!122139 () Bool)

(assert (=> d!46698 (=> (not res!122139) (not e!97339))))

(assert (=> d!46698 (= res!122139 (and (or (let ((rhs!3226 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3226 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3226) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!46699 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!46699 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!46699 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3225 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3225 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3225) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!226505 () Unit!9084)

(declare-fun choose!57 (BitStream!5260 BitStream!5260 (_ BitVec 64) (_ BitVec 32)) Unit!9084)

(assert (=> d!46698 (= lt!226505 (choose!57 thiss!1634 (_2!6877 lt!226132) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!46698 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6877 lt!226132) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!226505)))

(declare-fun lt!226506 () (_ BitVec 32))

(declare-fun b!146018 () Bool)

(assert (=> b!146018 (= e!97339 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226132)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) (bvsub (bvsub to!404 from!447) lt!226506)))))

(assert (=> b!146018 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!226506 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!226506) #b10000000000000000000000000000000)))))

(declare-fun lt!226507 () (_ BitVec 64))

(assert (=> b!146018 (= lt!226506 ((_ extract 31 0) lt!226507))))

(assert (=> b!146018 (and (bvslt lt!226507 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!226507 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!146018 (= lt!226507 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!46698 res!122139) b!146018))

(declare-fun m!224929 () Bool)

(assert (=> d!46698 m!224929))

(declare-fun m!224931 () Bool)

(assert (=> b!146018 m!224931))

(assert (=> b!145838 d!46698))

(declare-fun d!46701 () Bool)

(declare-fun res!122140 () Bool)

(declare-fun e!97340 () Bool)

(assert (=> d!46701 (=> res!122140 e!97340)))

(assert (=> d!46701 (= res!122140 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46701 (= (arrayRangesEq!317 arr!237 (_2!6878 lt!226136) #b00000000000000000000000000000000 to!404) e!97340)))

(declare-fun b!146019 () Bool)

(declare-fun e!97341 () Bool)

(assert (=> b!146019 (= e!97340 e!97341)))

(declare-fun res!122141 () Bool)

(assert (=> b!146019 (=> (not res!122141) (not e!97341))))

(assert (=> b!146019 (= res!122141 (= (select (arr!3740 arr!237) #b00000000000000000000000000000000) (select (arr!3740 (_2!6878 lt!226136)) #b00000000000000000000000000000000)))))

(declare-fun b!146020 () Bool)

(assert (=> b!146020 (= e!97341 (arrayRangesEq!317 arr!237 (_2!6878 lt!226136) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46701 (not res!122140)) b!146019))

(assert (= (and b!146019 res!122141) b!146020))

(declare-fun m!224933 () Bool)

(assert (=> b!146019 m!224933))

(declare-fun m!224935 () Bool)

(assert (=> b!146019 m!224935))

(declare-fun m!224937 () Bool)

(assert (=> b!146020 m!224937))

(assert (=> b!145839 d!46701))

(declare-fun d!46703 () Bool)

(assert (=> d!46703 (= (array_inv!2790 arr!237) (bvsge (size!3001 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28142 d!46703))

(declare-fun d!46705 () Bool)

(assert (=> d!46705 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6337 thiss!1634) (currentByte!6342 thiss!1634) (size!3001 (buf!3446 thiss!1634))))))

(declare-fun bs!11457 () Bool)

(assert (= bs!11457 d!46705))

(assert (=> bs!11457 m!224577))

(assert (=> start!28142 d!46705))

(declare-fun d!46707 () Bool)

(declare-fun res!122143 () Bool)

(declare-fun e!97342 () Bool)

(assert (=> d!46707 (=> (not res!122143) (not e!97342))))

(assert (=> d!46707 (= res!122143 (= (size!3001 (buf!3446 (_2!6877 lt!226132))) (size!3001 (buf!3446 (_2!6877 lt!226138)))))))

(assert (=> d!46707 (= (isPrefixOf!0 (_2!6877 lt!226132) (_2!6877 lt!226138)) e!97342)))

(declare-fun b!146021 () Bool)

(declare-fun res!122142 () Bool)

(assert (=> b!146021 (=> (not res!122142) (not e!97342))))

(assert (=> b!146021 (= res!122142 (bvsle (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))) (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226138))) (currentByte!6342 (_2!6877 lt!226138)) (currentBit!6337 (_2!6877 lt!226138)))))))

(declare-fun b!146022 () Bool)

(declare-fun e!97343 () Bool)

(assert (=> b!146022 (= e!97342 e!97343)))

(declare-fun res!122144 () Bool)

(assert (=> b!146022 (=> res!122144 e!97343)))

(assert (=> b!146022 (= res!122144 (= (size!3001 (buf!3446 (_2!6877 lt!226132))) #b00000000000000000000000000000000))))

(declare-fun b!146023 () Bool)

(assert (=> b!146023 (= e!97343 (arrayBitRangesEq!0 (buf!3446 (_2!6877 lt!226132)) (buf!3446 (_2!6877 lt!226138)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132)))))))

(assert (= (and d!46707 res!122143) b!146021))

(assert (= (and b!146021 res!122142) b!146022))

(assert (= (and b!146022 (not res!122144)) b!146023))

(assert (=> b!146021 m!224513))

(assert (=> b!146021 m!224591))

(assert (=> b!146023 m!224513))

(assert (=> b!146023 m!224513))

(declare-fun m!224939 () Bool)

(assert (=> b!146023 m!224939))

(assert (=> b!145835 d!46707))

(declare-fun d!46709 () Bool)

(declare-fun e!97344 () Bool)

(assert (=> d!46709 e!97344))

(declare-fun res!122146 () Bool)

(assert (=> d!46709 (=> (not res!122146) (not e!97344))))

(declare-fun lt!226511 () (_ BitVec 64))

(declare-fun lt!226509 () (_ BitVec 64))

(declare-fun lt!226510 () (_ BitVec 64))

(assert (=> d!46709 (= res!122146 (= lt!226509 (bvsub lt!226511 lt!226510)))))

(assert (=> d!46709 (or (= (bvand lt!226511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226510 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226511 lt!226510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46709 (= lt!226510 (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226138))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226138)))))))

(declare-fun lt!226513 () (_ BitVec 64))

(declare-fun lt!226508 () (_ BitVec 64))

(assert (=> d!46709 (= lt!226511 (bvmul lt!226513 lt!226508))))

(assert (=> d!46709 (or (= lt!226513 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226508 (bvsdiv (bvmul lt!226513 lt!226508) lt!226513)))))

(assert (=> d!46709 (= lt!226508 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46709 (= lt!226513 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))))))

(assert (=> d!46709 (= lt!226509 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226138))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226138)))))))

(assert (=> d!46709 (invariant!0 (currentBit!6337 (_2!6877 lt!226138)) (currentByte!6342 (_2!6877 lt!226138)) (size!3001 (buf!3446 (_2!6877 lt!226138))))))

(assert (=> d!46709 (= (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226138))) (currentByte!6342 (_2!6877 lt!226138)) (currentBit!6337 (_2!6877 lt!226138))) lt!226509)))

(declare-fun b!146024 () Bool)

(declare-fun res!122145 () Bool)

(assert (=> b!146024 (=> (not res!122145) (not e!97344))))

(assert (=> b!146024 (= res!122145 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226509))))

(declare-fun b!146025 () Bool)

(declare-fun lt!226512 () (_ BitVec 64))

(assert (=> b!146025 (= e!97344 (bvsle lt!226509 (bvmul lt!226512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146025 (or (= lt!226512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226512)))))

(assert (=> b!146025 (= lt!226512 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))))))

(assert (= (and d!46709 res!122146) b!146024))

(assert (= (and b!146024 res!122145) b!146025))

(declare-fun m!224941 () Bool)

(assert (=> d!46709 m!224941))

(declare-fun m!224943 () Bool)

(assert (=> d!46709 m!224943))

(assert (=> b!145846 d!46709))

(assert (=> b!145846 d!46644))

(declare-fun d!46711 () Bool)

(assert (=> d!46711 (= (array_inv!2790 (buf!3446 thiss!1634)) (bvsge (size!3001 (buf!3446 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!145847 d!46711))

(declare-fun d!46713 () Bool)

(declare-fun res!122148 () Bool)

(declare-fun e!97345 () Bool)

(assert (=> d!46713 (=> (not res!122148) (not e!97345))))

(assert (=> d!46713 (= res!122148 (= (size!3001 (buf!3446 thiss!1634)) (size!3001 (buf!3446 (_2!6877 lt!226132)))))))

(assert (=> d!46713 (= (isPrefixOf!0 thiss!1634 (_2!6877 lt!226132)) e!97345)))

(declare-fun b!146026 () Bool)

(declare-fun res!122147 () Bool)

(assert (=> b!146026 (=> (not res!122147) (not e!97345))))

(assert (=> b!146026 (= res!122147 (bvsle (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)) (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132)))))))

(declare-fun b!146027 () Bool)

(declare-fun e!97346 () Bool)

(assert (=> b!146027 (= e!97345 e!97346)))

(declare-fun res!122149 () Bool)

(assert (=> b!146027 (=> res!122149 e!97346)))

(assert (=> b!146027 (= res!122149 (= (size!3001 (buf!3446 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146028 () Bool)

(assert (=> b!146028 (= e!97346 (arrayBitRangesEq!0 (buf!3446 thiss!1634) (buf!3446 (_2!6877 lt!226132)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634))))))

(assert (= (and d!46713 res!122148) b!146026))

(assert (= (and b!146026 res!122147) b!146027))

(assert (= (and b!146027 (not res!122149)) b!146028))

(assert (=> b!146026 m!224515))

(assert (=> b!146026 m!224513))

(assert (=> b!146028 m!224515))

(assert (=> b!146028 m!224515))

(declare-fun m!224945 () Bool)

(assert (=> b!146028 m!224945))

(assert (=> b!145836 d!46713))

(declare-fun d!46715 () Bool)

(declare-fun lt!226514 () tuple2!13080)

(assert (=> d!46715 (= lt!226514 (readByte!0 (_1!6879 lt!226128)))))

(assert (=> d!46715 (= (readBytePure!0 (_1!6879 lt!226128)) (tuple2!13063 (_2!6890 lt!226514) (_1!6890 lt!226514)))))

(declare-fun bs!11458 () Bool)

(assert (= bs!11458 d!46715))

(declare-fun m!224947 () Bool)

(assert (=> bs!11458 m!224947))

(assert (=> b!145842 d!46715))

(declare-fun b!146029 () Bool)

(declare-fun res!122150 () Bool)

(declare-fun e!97348 () Bool)

(assert (=> b!146029 (=> (not res!122150) (not e!97348))))

(declare-fun lt!226522 () tuple2!13060)

(assert (=> b!146029 (= res!122150 (isPrefixOf!0 (_2!6879 lt!226522) (_2!6877 lt!226132)))))

(declare-fun b!146030 () Bool)

(declare-fun res!122151 () Bool)

(assert (=> b!146030 (=> (not res!122151) (not e!97348))))

(assert (=> b!146030 (= res!122151 (isPrefixOf!0 (_1!6879 lt!226522) thiss!1634))))

(declare-fun d!46717 () Bool)

(assert (=> d!46717 e!97348))

(declare-fun res!122152 () Bool)

(assert (=> d!46717 (=> (not res!122152) (not e!97348))))

(assert (=> d!46717 (= res!122152 (isPrefixOf!0 (_1!6879 lt!226522) (_2!6879 lt!226522)))))

(declare-fun lt!226533 () BitStream!5260)

(assert (=> d!46717 (= lt!226522 (tuple2!13061 lt!226533 (_2!6877 lt!226132)))))

(declare-fun lt!226523 () Unit!9084)

(declare-fun lt!226534 () Unit!9084)

(assert (=> d!46717 (= lt!226523 lt!226534)))

(assert (=> d!46717 (isPrefixOf!0 lt!226533 (_2!6877 lt!226132))))

(assert (=> d!46717 (= lt!226534 (lemmaIsPrefixTransitive!0 lt!226533 (_2!6877 lt!226132) (_2!6877 lt!226132)))))

(declare-fun lt!226520 () Unit!9084)

(declare-fun lt!226515 () Unit!9084)

(assert (=> d!46717 (= lt!226520 lt!226515)))

(assert (=> d!46717 (isPrefixOf!0 lt!226533 (_2!6877 lt!226132))))

(assert (=> d!46717 (= lt!226515 (lemmaIsPrefixTransitive!0 lt!226533 thiss!1634 (_2!6877 lt!226132)))))

(declare-fun lt!226524 () Unit!9084)

(declare-fun e!97347 () Unit!9084)

(assert (=> d!46717 (= lt!226524 e!97347)))

(declare-fun c!7905 () Bool)

(assert (=> d!46717 (= c!7905 (not (= (size!3001 (buf!3446 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!226519 () Unit!9084)

(declare-fun lt!226517 () Unit!9084)

(assert (=> d!46717 (= lt!226519 lt!226517)))

(assert (=> d!46717 (isPrefixOf!0 (_2!6877 lt!226132) (_2!6877 lt!226132))))

(assert (=> d!46717 (= lt!226517 (lemmaIsPrefixRefl!0 (_2!6877 lt!226132)))))

(declare-fun lt!226532 () Unit!9084)

(declare-fun lt!226528 () Unit!9084)

(assert (=> d!46717 (= lt!226532 lt!226528)))

(assert (=> d!46717 (= lt!226528 (lemmaIsPrefixRefl!0 (_2!6877 lt!226132)))))

(declare-fun lt!226527 () Unit!9084)

(declare-fun lt!226525 () Unit!9084)

(assert (=> d!46717 (= lt!226527 lt!226525)))

(assert (=> d!46717 (isPrefixOf!0 lt!226533 lt!226533)))

(assert (=> d!46717 (= lt!226525 (lemmaIsPrefixRefl!0 lt!226533))))

(declare-fun lt!226518 () Unit!9084)

(declare-fun lt!226530 () Unit!9084)

(assert (=> d!46717 (= lt!226518 lt!226530)))

(assert (=> d!46717 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46717 (= lt!226530 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46717 (= lt!226533 (BitStream!5261 (buf!3446 (_2!6877 lt!226132)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))

(assert (=> d!46717 (isPrefixOf!0 thiss!1634 (_2!6877 lt!226132))))

(assert (=> d!46717 (= (reader!0 thiss!1634 (_2!6877 lt!226132)) lt!226522)))

(declare-fun b!146031 () Bool)

(declare-fun Unit!9092 () Unit!9084)

(assert (=> b!146031 (= e!97347 Unit!9092)))

(declare-fun b!146032 () Bool)

(declare-fun lt!226521 () Unit!9084)

(assert (=> b!146032 (= e!97347 lt!226521)))

(declare-fun lt!226531 () (_ BitVec 64))

(assert (=> b!146032 (= lt!226531 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226526 () (_ BitVec 64))

(assert (=> b!146032 (= lt!226526 (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))

(assert (=> b!146032 (= lt!226521 (arrayBitRangesEqSymmetric!0 (buf!3446 thiss!1634) (buf!3446 (_2!6877 lt!226132)) lt!226531 lt!226526))))

(assert (=> b!146032 (arrayBitRangesEq!0 (buf!3446 (_2!6877 lt!226132)) (buf!3446 thiss!1634) lt!226531 lt!226526)))

(declare-fun b!146033 () Bool)

(declare-fun lt!226529 () (_ BitVec 64))

(declare-fun lt!226516 () (_ BitVec 64))

(assert (=> b!146033 (= e!97348 (= (_1!6879 lt!226522) (withMovedBitIndex!0 (_2!6879 lt!226522) (bvsub lt!226529 lt!226516))))))

(assert (=> b!146033 (or (= (bvand lt!226529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226529 lt!226516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146033 (= lt!226516 (bitIndex!0 (size!3001 (buf!3446 (_2!6877 lt!226132))) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132))))))

(assert (=> b!146033 (= lt!226529 (bitIndex!0 (size!3001 (buf!3446 thiss!1634)) (currentByte!6342 thiss!1634) (currentBit!6337 thiss!1634)))))

(assert (= (and d!46717 c!7905) b!146032))

(assert (= (and d!46717 (not c!7905)) b!146031))

(assert (= (and d!46717 res!122152) b!146030))

(assert (= (and b!146030 res!122151) b!146029))

(assert (= (and b!146029 res!122150) b!146033))

(declare-fun m!224949 () Bool)

(assert (=> b!146030 m!224949))

(declare-fun m!224951 () Bool)

(assert (=> d!46717 m!224951))

(declare-fun m!224953 () Bool)

(assert (=> d!46717 m!224953))

(declare-fun m!224955 () Bool)

(assert (=> d!46717 m!224955))

(assert (=> d!46717 m!224885))

(declare-fun m!224957 () Bool)

(assert (=> d!46717 m!224957))

(assert (=> d!46717 m!224889))

(declare-fun m!224959 () Bool)

(assert (=> d!46717 m!224959))

(assert (=> d!46717 m!224517))

(declare-fun m!224961 () Bool)

(assert (=> d!46717 m!224961))

(assert (=> d!46717 m!224809))

(assert (=> d!46717 m!224805))

(declare-fun m!224963 () Bool)

(assert (=> b!146029 m!224963))

(assert (=> b!146032 m!224515))

(declare-fun m!224965 () Bool)

(assert (=> b!146032 m!224965))

(declare-fun m!224967 () Bool)

(assert (=> b!146032 m!224967))

(declare-fun m!224969 () Bool)

(assert (=> b!146033 m!224969))

(assert (=> b!146033 m!224513))

(assert (=> b!146033 m!224515))

(assert (=> b!145842 d!46717))

(declare-fun d!46719 () Bool)

(assert (=> d!46719 (= (invariant!0 (currentBit!6337 thiss!1634) (currentByte!6342 thiss!1634) (size!3001 (buf!3446 (_2!6877 lt!226132)))) (and (bvsge (currentBit!6337 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6337 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6342 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6342 thiss!1634) (size!3001 (buf!3446 (_2!6877 lt!226132)))) (and (= (currentBit!6337 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6342 thiss!1634) (size!3001 (buf!3446 (_2!6877 lt!226132))))))))))

(assert (=> b!145843 d!46719))

(declare-fun lt!226535 () tuple3!564)

(declare-fun d!46721 () Bool)

(assert (=> d!46721 (= lt!226535 (readByteArrayLoop!0 (_1!6879 lt!226140) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46721 (= (readByteArrayLoopPure!0 (_1!6879 lt!226140) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13059 (_2!6889 lt!226535) (_3!349 lt!226535)))))

(declare-fun bs!11459 () Bool)

(assert (= bs!11459 d!46721))

(declare-fun m!224971 () Bool)

(assert (=> bs!11459 m!224971))

(assert (=> b!145844 d!46721))

(declare-fun d!46723 () Bool)

(assert (=> d!46723 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226130) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132)))) lt!226130))))

(declare-fun bs!11460 () Bool)

(assert (= bs!11460 d!46723))

(assert (=> bs!11460 m!224865))

(assert (=> b!145844 d!46723))

(declare-fun d!46725 () Bool)

(assert (=> d!46725 (validate_offset_bits!1 ((_ sign_extend 32) (size!3001 (buf!3446 (_2!6877 lt!226138)))) ((_ sign_extend 32) (currentByte!6342 (_2!6877 lt!226132))) ((_ sign_extend 32) (currentBit!6337 (_2!6877 lt!226132))) lt!226130)))

(declare-fun lt!226538 () Unit!9084)

(declare-fun choose!9 (BitStream!5260 array!6629 (_ BitVec 64) BitStream!5260) Unit!9084)

(assert (=> d!46725 (= lt!226538 (choose!9 (_2!6877 lt!226132) (buf!3446 (_2!6877 lt!226138)) lt!226130 (BitStream!5261 (buf!3446 (_2!6877 lt!226138)) (currentByte!6342 (_2!6877 lt!226132)) (currentBit!6337 (_2!6877 lt!226132)))))))

(assert (=> d!46725 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6877 lt!226132) (buf!3446 (_2!6877 lt!226138)) lt!226130) lt!226538)))

(declare-fun bs!11461 () Bool)

(assert (= bs!11461 d!46725))

(assert (=> bs!11461 m!224585))

(declare-fun m!224973 () Bool)

(assert (=> bs!11461 m!224973))

(assert (=> b!145844 d!46725))

(assert (=> b!145844 d!46656))

(push 1)

(assert (not b!146011))

(assert (not b!146018))

(assert (not d!46656))

(assert (not d!46684))

(assert (not b!145980))

(assert (not b!146026))

(assert (not d!46652))

(assert (not b!145963))

(assert (not b!145982))

(assert (not d!46650))

(assert (not d!46698))

(assert (not b!146012))

(assert (not b!146023))

(assert (not b!146014))

(assert (not b!146020))

(assert (not b!146000))

(assert (not b!145996))

(assert (not d!46642))

(assert (not d!46664))

(assert (not d!46646))

(assert (not b!145990))

(assert (not d!46668))

(assert (not d!46696))

(assert (not b!146015))

(assert (not d!46688))

(assert (not d!46705))

(assert (not d!46692))

(assert (not b!145964))

(assert (not b!145991))

(assert (not d!46723))

(assert (not d!46709))

(assert (not d!46682))

(assert (not d!46725))

(assert (not d!46674))

(assert (not b!145989))

(assert (not b!146021))

(assert (not b!146032))

(assert (not d!46686))

(assert (not b!145973))

(assert (not d!46721))

(assert (not b!145999))

(assert (not d!46715))

(assert (not b!145995))

(assert (not d!46644))

(assert (not b!146033))

(assert (not b!146028))

(assert (not d!46672))

(assert (not d!46662))

(assert (not b!145997))

(assert (not d!46690))

(assert (not d!46717))

(assert (not d!46680))

(assert (not d!46654))

(assert (not b!145966))

(assert (not d!46658))

(assert (not b!146030))

(assert (not b!146013))

(assert (not d!46660))

(assert (not b!145967))

(assert (not d!46694))

(assert (not b!146029))

(assert (not d!46676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

