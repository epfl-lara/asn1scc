; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27982 () Bool)

(assert start!27982)

(declare-fun b!144395 () Bool)

(declare-fun e!96213 () Bool)

(declare-datatypes ((array!6574 0))(
  ( (array!6575 (arr!3708 (Array (_ BitVec 32) (_ BitVec 8))) (size!2975 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5208 0))(
  ( (BitStream!5209 (buf!3414 array!6574) (currentByte!6304 (_ BitVec 32)) (currentBit!6299 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5208)

(declare-datatypes ((Unit!9023 0))(
  ( (Unit!9024) )
))
(declare-datatypes ((tuple2!12842 0))(
  ( (tuple2!12843 (_1!6767 Unit!9023) (_2!6767 BitStream!5208)) )
))
(declare-fun lt!223994 () tuple2!12842)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144395 (= e!96213 (invariant!0 (currentBit!6299 thiss!1634) (currentByte!6304 thiss!1634) (size!2975 (buf!3414 (_2!6767 lt!223994)))))))

(declare-fun b!144396 () Bool)

(declare-fun e!96206 () Bool)

(declare-fun e!96207 () Bool)

(assert (=> b!144396 (= e!96206 e!96207)))

(declare-fun res!120639 () Bool)

(assert (=> b!144396 (=> (not res!120639) (not e!96207))))

(declare-fun lt!223982 () (_ BitVec 64))

(declare-fun lt!223987 () tuple2!12842)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144396 (= res!120639 (= (bitIndex!0 (size!2975 (buf!3414 (_2!6767 lt!223987))) (currentByte!6304 (_2!6767 lt!223987)) (currentBit!6299 (_2!6767 lt!223987))) (bvadd (bitIndex!0 (size!2975 (buf!3414 (_2!6767 lt!223994))) (currentByte!6304 (_2!6767 lt!223994)) (currentBit!6299 (_2!6767 lt!223994))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!223982))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!144396 (= lt!223982 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144397 () Bool)

(declare-fun e!96212 () Bool)

(declare-fun array_inv!2764 (array!6574) Bool)

(assert (=> b!144397 (= e!96212 (array_inv!2764 (buf!3414 thiss!1634)))))

(declare-fun b!144398 () Bool)

(declare-fun e!96211 () Bool)

(assert (=> b!144398 (= e!96211 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun e!96214 () Bool)

(assert (=> b!144398 e!96214))

(declare-fun res!120649 () Bool)

(assert (=> b!144398 (=> (not res!120649) (not e!96214))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144398 (= res!120649 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2975 (buf!3414 (_2!6767 lt!223987)))) ((_ sign_extend 32) (currentByte!6304 thiss!1634)) ((_ sign_extend 32) (currentBit!6299 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!223985 () Unit!9023)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5208 array!6574 (_ BitVec 32)) Unit!9023)

(assert (=> b!144398 (= lt!223985 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3414 (_2!6767 lt!223987)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12844 0))(
  ( (tuple2!12845 (_1!6768 BitStream!5208) (_2!6768 BitStream!5208)) )
))
(declare-fun lt!223989 () tuple2!12844)

(declare-fun arr!237 () array!6574)

(declare-datatypes ((tuple2!12846 0))(
  ( (tuple2!12847 (_1!6769 BitStream!5208) (_2!6769 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5208) tuple2!12846)

(assert (=> b!144398 (= (_2!6769 (readBytePure!0 (_1!6768 lt!223989))) (select (arr!3708 arr!237) from!447))))

(declare-fun lt!223983 () tuple2!12844)

(declare-fun reader!0 (BitStream!5208 BitStream!5208) tuple2!12844)

(assert (=> b!144398 (= lt!223983 (reader!0 (_2!6767 lt!223994) (_2!6767 lt!223987)))))

(assert (=> b!144398 (= lt!223989 (reader!0 thiss!1634 (_2!6767 lt!223987)))))

(declare-fun e!96209 () Bool)

(assert (=> b!144398 e!96209))

(declare-fun res!120652 () Bool)

(assert (=> b!144398 (=> (not res!120652) (not e!96209))))

(declare-fun lt!223980 () tuple2!12846)

(declare-fun lt!223993 () tuple2!12846)

(assert (=> b!144398 (= res!120652 (= (bitIndex!0 (size!2975 (buf!3414 (_1!6769 lt!223980))) (currentByte!6304 (_1!6769 lt!223980)) (currentBit!6299 (_1!6769 lt!223980))) (bitIndex!0 (size!2975 (buf!3414 (_1!6769 lt!223993))) (currentByte!6304 (_1!6769 lt!223993)) (currentBit!6299 (_1!6769 lt!223993)))))))

(declare-fun lt!223981 () Unit!9023)

(declare-fun lt!223990 () BitStream!5208)

(declare-fun readBytePrefixLemma!0 (BitStream!5208 BitStream!5208) Unit!9023)

(assert (=> b!144398 (= lt!223981 (readBytePrefixLemma!0 lt!223990 (_2!6767 lt!223987)))))

(assert (=> b!144398 (= lt!223993 (readBytePure!0 (BitStream!5209 (buf!3414 (_2!6767 lt!223987)) (currentByte!6304 thiss!1634) (currentBit!6299 thiss!1634))))))

(assert (=> b!144398 (= lt!223980 (readBytePure!0 lt!223990))))

(assert (=> b!144398 (= lt!223990 (BitStream!5209 (buf!3414 (_2!6767 lt!223994)) (currentByte!6304 thiss!1634) (currentBit!6299 thiss!1634)))))

(assert (=> b!144398 e!96213))

(declare-fun res!120644 () Bool)

(assert (=> b!144398 (=> (not res!120644) (not e!96213))))

(declare-fun isPrefixOf!0 (BitStream!5208 BitStream!5208) Bool)

(assert (=> b!144398 (= res!120644 (isPrefixOf!0 thiss!1634 (_2!6767 lt!223987)))))

(declare-fun lt!223979 () Unit!9023)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5208 BitStream!5208 BitStream!5208) Unit!9023)

(assert (=> b!144398 (= lt!223979 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6767 lt!223994) (_2!6767 lt!223987)))))

(assert (=> b!144398 e!96206))

(declare-fun res!120646 () Bool)

(assert (=> b!144398 (=> (not res!120646) (not e!96206))))

(assert (=> b!144398 (= res!120646 (= (size!2975 (buf!3414 (_2!6767 lt!223994))) (size!2975 (buf!3414 (_2!6767 lt!223987)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5208 array!6574 (_ BitVec 32) (_ BitVec 32)) tuple2!12842)

(assert (=> b!144398 (= lt!223987 (appendByteArrayLoop!0 (_2!6767 lt!223994) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144398 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2975 (buf!3414 (_2!6767 lt!223994)))) ((_ sign_extend 32) (currentByte!6304 (_2!6767 lt!223994))) ((_ sign_extend 32) (currentBit!6299 (_2!6767 lt!223994))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!223992 () Unit!9023)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5208 BitStream!5208 (_ BitVec 64) (_ BitVec 32)) Unit!9023)

(assert (=> b!144398 (= lt!223992 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6767 lt!223994) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!96215 () Bool)

(assert (=> b!144398 e!96215))

(declare-fun res!120643 () Bool)

(assert (=> b!144398 (=> (not res!120643) (not e!96215))))

(assert (=> b!144398 (= res!120643 (= (size!2975 (buf!3414 thiss!1634)) (size!2975 (buf!3414 (_2!6767 lt!223994)))))))

(declare-fun appendByte!0 (BitStream!5208 (_ BitVec 8)) tuple2!12842)

(assert (=> b!144398 (= lt!223994 (appendByte!0 thiss!1634 (select (arr!3708 arr!237) from!447)))))

(declare-fun lt!223986 () tuple2!12846)

(declare-fun lt!223988 () tuple2!12844)

(declare-fun b!144399 () Bool)

(assert (=> b!144399 (= e!96215 (and (= (_2!6769 lt!223986) (select (arr!3708 arr!237) from!447)) (= (_1!6769 lt!223986) (_2!6768 lt!223988))))))

(assert (=> b!144399 (= lt!223986 (readBytePure!0 (_1!6768 lt!223988)))))

(assert (=> b!144399 (= lt!223988 (reader!0 thiss!1634 (_2!6767 lt!223994)))))

(declare-fun b!144400 () Bool)

(declare-fun res!120647 () Bool)

(assert (=> b!144400 (=> (not res!120647) (not e!96211))))

(assert (=> b!144400 (= res!120647 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2975 (buf!3414 thiss!1634))) ((_ sign_extend 32) (currentByte!6304 thiss!1634)) ((_ sign_extend 32) (currentBit!6299 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144401 () Bool)

(declare-datatypes ((tuple2!12848 0))(
  ( (tuple2!12849 (_1!6770 BitStream!5208) (_2!6770 array!6574)) )
))
(declare-fun lt!223995 () tuple2!12848)

(declare-fun e!96210 () Bool)

(declare-fun arrayRangesEq!291 (array!6574 array!6574 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144401 (= e!96210 (not (arrayRangesEq!291 arr!237 (_2!6770 lt!223995) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!120645 () Bool)

(assert (=> start!27982 (=> (not res!120645) (not e!96211))))

(assert (=> start!27982 (= res!120645 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2975 arr!237))))))

(assert (=> start!27982 e!96211))

(assert (=> start!27982 true))

(assert (=> start!27982 (array_inv!2764 arr!237)))

(declare-fun inv!12 (BitStream!5208) Bool)

(assert (=> start!27982 (and (inv!12 thiss!1634) e!96212)))

(declare-fun b!144402 () Bool)

(declare-fun res!120651 () Bool)

(assert (=> b!144402 (=> (not res!120651) (not e!96207))))

(assert (=> b!144402 (= res!120651 (isPrefixOf!0 (_2!6767 lt!223994) (_2!6767 lt!223987)))))

(declare-fun b!144403 () Bool)

(assert (=> b!144403 (= e!96207 (not e!96210))))

(declare-fun res!120641 () Bool)

(assert (=> b!144403 (=> res!120641 e!96210)))

(declare-fun lt!223984 () tuple2!12844)

(assert (=> b!144403 (= res!120641 (or (not (= (size!2975 (_2!6770 lt!223995)) (size!2975 arr!237))) (not (= (_1!6770 lt!223995) (_2!6768 lt!223984)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5208 array!6574 (_ BitVec 32) (_ BitVec 32)) tuple2!12848)

(assert (=> b!144403 (= lt!223995 (readByteArrayLoopPure!0 (_1!6768 lt!223984) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144403 (validate_offset_bits!1 ((_ sign_extend 32) (size!2975 (buf!3414 (_2!6767 lt!223987)))) ((_ sign_extend 32) (currentByte!6304 (_2!6767 lt!223994))) ((_ sign_extend 32) (currentBit!6299 (_2!6767 lt!223994))) lt!223982)))

(declare-fun lt!223991 () Unit!9023)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5208 array!6574 (_ BitVec 64)) Unit!9023)

(assert (=> b!144403 (= lt!223991 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6767 lt!223994) (buf!3414 (_2!6767 lt!223987)) lt!223982))))

(assert (=> b!144403 (= lt!223984 (reader!0 (_2!6767 lt!223994) (_2!6767 lt!223987)))))

(declare-fun b!144404 () Bool)

(declare-fun res!120642 () Bool)

(assert (=> b!144404 (=> (not res!120642) (not e!96211))))

(assert (=> b!144404 (= res!120642 (invariant!0 (currentBit!6299 thiss!1634) (currentByte!6304 thiss!1634) (size!2975 (buf!3414 thiss!1634))))))

(declare-fun b!144405 () Bool)

(assert (=> b!144405 (= e!96214 (= (_1!6770 (readByteArrayLoopPure!0 (_1!6768 lt!223989) arr!237 from!447 to!404)) (_2!6768 lt!223989)))))

(declare-fun b!144406 () Bool)

(declare-fun res!120640 () Bool)

(assert (=> b!144406 (=> (not res!120640) (not e!96211))))

(assert (=> b!144406 (= res!120640 (bvslt from!447 to!404))))

(declare-fun b!144407 () Bool)

(declare-fun res!120650 () Bool)

(assert (=> b!144407 (=> (not res!120650) (not e!96215))))

(assert (=> b!144407 (= res!120650 (= (bitIndex!0 (size!2975 (buf!3414 (_2!6767 lt!223994))) (currentByte!6304 (_2!6767 lt!223994)) (currentBit!6299 (_2!6767 lt!223994))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2975 (buf!3414 thiss!1634)) (currentByte!6304 thiss!1634) (currentBit!6299 thiss!1634)))))))

(declare-fun b!144408 () Bool)

(assert (=> b!144408 (= e!96209 (= (_2!6769 lt!223980) (_2!6769 lt!223993)))))

(declare-fun b!144409 () Bool)

(declare-fun res!120648 () Bool)

(assert (=> b!144409 (=> (not res!120648) (not e!96215))))

(assert (=> b!144409 (= res!120648 (isPrefixOf!0 thiss!1634 (_2!6767 lt!223994)))))

(assert (= (and start!27982 res!120645) b!144400))

(assert (= (and b!144400 res!120647) b!144406))

(assert (= (and b!144406 res!120640) b!144404))

(assert (= (and b!144404 res!120642) b!144398))

(assert (= (and b!144398 res!120643) b!144407))

(assert (= (and b!144407 res!120650) b!144409))

(assert (= (and b!144409 res!120648) b!144399))

(assert (= (and b!144398 res!120646) b!144396))

(assert (= (and b!144396 res!120639) b!144402))

(assert (= (and b!144402 res!120651) b!144403))

(assert (= (and b!144403 (not res!120641)) b!144401))

(assert (= (and b!144398 res!120644) b!144395))

(assert (= (and b!144398 res!120652) b!144408))

(assert (= (and b!144398 res!120649) b!144405))

(assert (= start!27982 b!144397))

(declare-fun m!222081 () Bool)

(assert (=> b!144405 m!222081))

(declare-fun m!222083 () Bool)

(assert (=> b!144402 m!222083))

(declare-fun m!222085 () Bool)

(assert (=> b!144407 m!222085))

(declare-fun m!222087 () Bool)

(assert (=> b!144407 m!222087))

(declare-fun m!222089 () Bool)

(assert (=> b!144404 m!222089))

(declare-fun m!222091 () Bool)

(assert (=> start!27982 m!222091))

(declare-fun m!222093 () Bool)

(assert (=> start!27982 m!222093))

(declare-fun m!222095 () Bool)

(assert (=> b!144396 m!222095))

(assert (=> b!144396 m!222085))

(declare-fun m!222097 () Bool)

(assert (=> b!144409 m!222097))

(declare-fun m!222099 () Bool)

(assert (=> b!144395 m!222099))

(declare-fun m!222101 () Bool)

(assert (=> b!144399 m!222101))

(declare-fun m!222103 () Bool)

(assert (=> b!144399 m!222103))

(declare-fun m!222105 () Bool)

(assert (=> b!144399 m!222105))

(declare-fun m!222107 () Bool)

(assert (=> b!144398 m!222107))

(declare-fun m!222109 () Bool)

(assert (=> b!144398 m!222109))

(declare-fun m!222111 () Bool)

(assert (=> b!144398 m!222111))

(declare-fun m!222113 () Bool)

(assert (=> b!144398 m!222113))

(declare-fun m!222115 () Bool)

(assert (=> b!144398 m!222115))

(declare-fun m!222117 () Bool)

(assert (=> b!144398 m!222117))

(declare-fun m!222119 () Bool)

(assert (=> b!144398 m!222119))

(declare-fun m!222121 () Bool)

(assert (=> b!144398 m!222121))

(declare-fun m!222123 () Bool)

(assert (=> b!144398 m!222123))

(declare-fun m!222125 () Bool)

(assert (=> b!144398 m!222125))

(declare-fun m!222127 () Bool)

(assert (=> b!144398 m!222127))

(assert (=> b!144398 m!222101))

(declare-fun m!222129 () Bool)

(assert (=> b!144398 m!222129))

(declare-fun m!222131 () Bool)

(assert (=> b!144398 m!222131))

(declare-fun m!222133 () Bool)

(assert (=> b!144398 m!222133))

(declare-fun m!222135 () Bool)

(assert (=> b!144398 m!222135))

(declare-fun m!222137 () Bool)

(assert (=> b!144398 m!222137))

(assert (=> b!144398 m!222101))

(declare-fun m!222139 () Bool)

(assert (=> b!144397 m!222139))

(declare-fun m!222141 () Bool)

(assert (=> b!144401 m!222141))

(declare-fun m!222143 () Bool)

(assert (=> b!144403 m!222143))

(declare-fun m!222145 () Bool)

(assert (=> b!144403 m!222145))

(declare-fun m!222147 () Bool)

(assert (=> b!144403 m!222147))

(assert (=> b!144403 m!222111))

(declare-fun m!222149 () Bool)

(assert (=> b!144400 m!222149))

(check-sat (not b!144396) (not b!144398) (not b!144403) (not b!144405) (not b!144402) (not b!144404) (not b!144401) (not start!27982) (not b!144400) (not b!144397) (not b!144399) (not b!144409) (not b!144407) (not b!144395))
(check-sat)
