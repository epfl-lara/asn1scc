; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28032 () Bool)

(assert start!28032)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!97032 () Bool)

(declare-datatypes ((array!6624 0))(
  ( (array!6625 (arr!3733 (Array (_ BitVec 32) (_ BitVec 8))) (size!3000 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5258 0))(
  ( (BitStream!5259 (buf!3439 array!6624) (currentByte!6329 (_ BitVec 32)) (currentBit!6324 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13042 0))(
  ( (tuple2!13043 (_1!6867 BitStream!5258) (_2!6867 BitStream!5258)) )
))
(declare-fun lt!225389 () tuple2!13042)

(declare-fun b!145520 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145520 (= e!97032 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6867 lt!225389)))) ((_ sign_extend 32) (currentByte!6329 (_1!6867 lt!225389))) ((_ sign_extend 32) (currentBit!6324 (_1!6867 lt!225389))) (bvsub to!404 from!447))))))

(declare-datatypes ((tuple2!13044 0))(
  ( (tuple2!13045 (_1!6868 BitStream!5258) (_2!6868 array!6624)) )
))
(declare-fun lt!225380 () tuple2!13044)

(declare-fun arr!237 () array!6624)

(declare-datatypes ((tuple2!13046 0))(
  ( (tuple2!13047 (_1!6869 BitStream!5258) (_2!6869 (_ BitVec 8))) )
))
(declare-fun lt!225376 () tuple2!13046)

(declare-fun lt!225382 () tuple2!13042)

(declare-fun readByteArrayLoopPure!0 (BitStream!5258 array!6624 (_ BitVec 32) (_ BitVec 32)) tuple2!13044)

(assert (=> b!145520 (= lt!225380 (readByteArrayLoopPure!0 (_1!6867 lt!225382) (array!6625 (store (arr!3733 arr!237) from!447 (_2!6869 lt!225376)) (size!3000 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!9073 0))(
  ( (Unit!9074) )
))
(declare-datatypes ((tuple2!13048 0))(
  ( (tuple2!13049 (_1!6870 Unit!9073) (_2!6870 BitStream!5258)) )
))
(declare-fun lt!225386 () tuple2!13048)

(declare-fun lt!225385 () tuple2!13048)

(declare-fun lt!225394 () (_ BitVec 32))

(assert (=> b!145520 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225394)))

(declare-fun lt!225390 () Unit!9073)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5258 array!6624 (_ BitVec 32)) Unit!9073)

(assert (=> b!145520 (= lt!225390 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6870 lt!225385) (buf!3439 (_2!6870 lt!225386)) lt!225394))))

(declare-fun e!97031 () Bool)

(assert (=> b!145520 e!97031))

(declare-fun res!121698 () Bool)

(assert (=> b!145520 (=> (not res!121698) (not e!97031))))

(declare-fun thiss!1634 () BitStream!5258)

(assert (=> b!145520 (= res!121698 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!225393 () Unit!9073)

(assert (=> b!145520 (= lt!225393 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3439 (_2!6870 lt!225386)) (bvsub to!404 from!447)))))

(assert (=> b!145520 (= (_2!6869 lt!225376) (select (arr!3733 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5258) tuple2!13046)

(assert (=> b!145520 (= lt!225376 (readBytePure!0 (_1!6867 lt!225389)))))

(declare-fun reader!0 (BitStream!5258 BitStream!5258) tuple2!13042)

(assert (=> b!145520 (= lt!225382 (reader!0 (_2!6870 lt!225385) (_2!6870 lt!225386)))))

(assert (=> b!145520 (= lt!225389 (reader!0 thiss!1634 (_2!6870 lt!225386)))))

(declare-fun e!97038 () Bool)

(assert (=> b!145520 e!97038))

(declare-fun res!121690 () Bool)

(assert (=> b!145520 (=> (not res!121690) (not e!97038))))

(declare-fun lt!225392 () tuple2!13046)

(declare-fun lt!225388 () tuple2!13046)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145520 (= res!121690 (= (bitIndex!0 (size!3000 (buf!3439 (_1!6869 lt!225392))) (currentByte!6329 (_1!6869 lt!225392)) (currentBit!6324 (_1!6869 lt!225392))) (bitIndex!0 (size!3000 (buf!3439 (_1!6869 lt!225388))) (currentByte!6329 (_1!6869 lt!225388)) (currentBit!6324 (_1!6869 lt!225388)))))))

(declare-fun lt!225383 () Unit!9073)

(declare-fun lt!225387 () BitStream!5258)

(declare-fun readBytePrefixLemma!0 (BitStream!5258 BitStream!5258) Unit!9073)

(assert (=> b!145520 (= lt!225383 (readBytePrefixLemma!0 lt!225387 (_2!6870 lt!225386)))))

(assert (=> b!145520 (= lt!225388 (readBytePure!0 (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634))))))

(assert (=> b!145520 (= lt!225392 (readBytePure!0 lt!225387))))

(assert (=> b!145520 (= lt!225387 (BitStream!5259 (buf!3439 (_2!6870 lt!225385)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))

(declare-fun e!97040 () Bool)

(assert (=> b!145520 e!97040))

(declare-fun res!121695 () Bool)

(assert (=> b!145520 (=> (not res!121695) (not e!97040))))

(declare-fun isPrefixOf!0 (BitStream!5258 BitStream!5258) Bool)

(assert (=> b!145520 (= res!121695 (isPrefixOf!0 thiss!1634 (_2!6870 lt!225386)))))

(declare-fun lt!225377 () Unit!9073)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5258 BitStream!5258 BitStream!5258) Unit!9073)

(assert (=> b!145520 (= lt!225377 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6870 lt!225385) (_2!6870 lt!225386)))))

(declare-fun e!97036 () Bool)

(assert (=> b!145520 e!97036))

(declare-fun res!121701 () Bool)

(assert (=> b!145520 (=> (not res!121701) (not e!97036))))

(assert (=> b!145520 (= res!121701 (= (size!3000 (buf!3439 (_2!6870 lt!225385))) (size!3000 (buf!3439 (_2!6870 lt!225386)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5258 array!6624 (_ BitVec 32) (_ BitVec 32)) tuple2!13048)

(assert (=> b!145520 (= lt!225386 (appendByteArrayLoop!0 (_2!6870 lt!225385) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145520 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225385)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225394)))

(assert (=> b!145520 (= lt!225394 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!225396 () Unit!9073)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5258 BitStream!5258 (_ BitVec 64) (_ BitVec 32)) Unit!9073)

(assert (=> b!145520 (= lt!225396 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6870 lt!225385) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!97041 () Bool)

(assert (=> b!145520 e!97041))

(declare-fun res!121700 () Bool)

(assert (=> b!145520 (=> (not res!121700) (not e!97041))))

(assert (=> b!145520 (= res!121700 (= (size!3000 (buf!3439 thiss!1634)) (size!3000 (buf!3439 (_2!6870 lt!225385)))))))

(declare-fun appendByte!0 (BitStream!5258 (_ BitVec 8)) tuple2!13048)

(assert (=> b!145520 (= lt!225385 (appendByte!0 thiss!1634 (select (arr!3733 arr!237) from!447)))))

(declare-fun b!145521 () Bool)

(declare-fun e!97035 () Bool)

(assert (=> b!145521 (= e!97036 e!97035)))

(declare-fun res!121697 () Bool)

(assert (=> b!145521 (=> (not res!121697) (not e!97035))))

(declare-fun lt!225381 () (_ BitVec 64))

(assert (=> b!145521 (= res!121697 (= (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225386))) (currentByte!6329 (_2!6870 lt!225386)) (currentBit!6324 (_2!6870 lt!225386))) (bvadd (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!225381))))))

(assert (=> b!145521 (= lt!225381 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!121694 () Bool)

(assert (=> start!28032 (=> (not res!121694) (not e!97032))))

(assert (=> start!28032 (= res!121694 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3000 arr!237))))))

(assert (=> start!28032 e!97032))

(assert (=> start!28032 true))

(declare-fun array_inv!2789 (array!6624) Bool)

(assert (=> start!28032 (array_inv!2789 arr!237)))

(declare-fun e!97039 () Bool)

(declare-fun inv!12 (BitStream!5258) Bool)

(assert (=> start!28032 (and (inv!12 thiss!1634) e!97039)))

(declare-fun b!145522 () Bool)

(declare-fun res!121689 () Bool)

(assert (=> b!145522 (=> (not res!121689) (not e!97032))))

(assert (=> b!145522 (= res!121689 (bvslt from!447 to!404))))

(declare-fun b!145523 () Bool)

(declare-fun e!97037 () Bool)

(assert (=> b!145523 (= e!97035 (not e!97037))))

(declare-fun res!121696 () Bool)

(assert (=> b!145523 (=> res!121696 e!97037)))

(declare-fun lt!225391 () tuple2!13042)

(declare-fun lt!225378 () tuple2!13044)

(assert (=> b!145523 (= res!121696 (or (not (= (size!3000 (_2!6868 lt!225378)) (size!3000 arr!237))) (not (= (_1!6868 lt!225378) (_2!6867 lt!225391)))))))

(assert (=> b!145523 (= lt!225378 (readByteArrayLoopPure!0 (_1!6867 lt!225391) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145523 (validate_offset_bits!1 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225381)))

(declare-fun lt!225379 () Unit!9073)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5258 array!6624 (_ BitVec 64)) Unit!9073)

(assert (=> b!145523 (= lt!225379 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6870 lt!225385) (buf!3439 (_2!6870 lt!225386)) lt!225381))))

(assert (=> b!145523 (= lt!225391 (reader!0 (_2!6870 lt!225385) (_2!6870 lt!225386)))))

(declare-fun b!145524 () Bool)

(declare-fun res!121702 () Bool)

(assert (=> b!145524 (=> (not res!121702) (not e!97032))))

(assert (=> b!145524 (= res!121702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 thiss!1634))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145525 () Bool)

(assert (=> b!145525 (= e!97039 (array_inv!2789 (buf!3439 thiss!1634)))))

(declare-fun b!145526 () Bool)

(declare-fun res!121691 () Bool)

(assert (=> b!145526 (=> (not res!121691) (not e!97041))))

(assert (=> b!145526 (= res!121691 (isPrefixOf!0 thiss!1634 (_2!6870 lt!225385)))))

(declare-fun b!145527 () Bool)

(declare-fun lt!225395 () tuple2!13046)

(declare-fun lt!225384 () tuple2!13042)

(assert (=> b!145527 (= e!97041 (and (= (_2!6869 lt!225395) (select (arr!3733 arr!237) from!447)) (= (_1!6869 lt!225395) (_2!6867 lt!225384))))))

(assert (=> b!145527 (= lt!225395 (readBytePure!0 (_1!6867 lt!225384)))))

(assert (=> b!145527 (= lt!225384 (reader!0 thiss!1634 (_2!6870 lt!225385)))))

(declare-fun b!145528 () Bool)

(declare-fun res!121693 () Bool)

(assert (=> b!145528 (=> (not res!121693) (not e!97035))))

(assert (=> b!145528 (= res!121693 (isPrefixOf!0 (_2!6870 lt!225385) (_2!6870 lt!225386)))))

(declare-fun b!145529 () Bool)

(assert (=> b!145529 (= e!97031 (= (_1!6868 (readByteArrayLoopPure!0 (_1!6867 lt!225389) arr!237 from!447 to!404)) (_2!6867 lt!225389)))))

(declare-fun b!145530 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145530 (= e!97040 (invariant!0 (currentBit!6324 thiss!1634) (currentByte!6329 thiss!1634) (size!3000 (buf!3439 (_2!6870 lt!225385)))))))

(declare-fun b!145531 () Bool)

(declare-fun res!121699 () Bool)

(assert (=> b!145531 (=> (not res!121699) (not e!97041))))

(assert (=> b!145531 (= res!121699 (= (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))))

(declare-fun b!145532 () Bool)

(assert (=> b!145532 (= e!97038 (= (_2!6869 lt!225392) (_2!6869 lt!225388)))))

(declare-fun b!145533 () Bool)

(declare-fun arrayRangesEq!316 (array!6624 array!6624 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145533 (= e!97037 (not (arrayRangesEq!316 arr!237 (_2!6868 lt!225378) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145534 () Bool)

(declare-fun res!121692 () Bool)

(assert (=> b!145534 (=> (not res!121692) (not e!97032))))

(assert (=> b!145534 (= res!121692 (invariant!0 (currentBit!6324 thiss!1634) (currentByte!6329 thiss!1634) (size!3000 (buf!3439 thiss!1634))))))

(assert (= (and start!28032 res!121694) b!145524))

(assert (= (and b!145524 res!121702) b!145522))

(assert (= (and b!145522 res!121689) b!145534))

(assert (= (and b!145534 res!121692) b!145520))

(assert (= (and b!145520 res!121700) b!145531))

(assert (= (and b!145531 res!121699) b!145526))

(assert (= (and b!145526 res!121691) b!145527))

(assert (= (and b!145520 res!121701) b!145521))

(assert (= (and b!145521 res!121697) b!145528))

(assert (= (and b!145528 res!121693) b!145523))

(assert (= (and b!145523 (not res!121696)) b!145533))

(assert (= (and b!145520 res!121695) b!145530))

(assert (= (and b!145520 res!121690) b!145532))

(assert (= (and b!145520 res!121698) b!145529))

(assert (= start!28032 b!145525))

(declare-fun m!223899 () Bool)

(assert (=> b!145527 m!223899))

(declare-fun m!223901 () Bool)

(assert (=> b!145527 m!223901))

(declare-fun m!223903 () Bool)

(assert (=> b!145527 m!223903))

(declare-fun m!223905 () Bool)

(assert (=> b!145530 m!223905))

(declare-fun m!223907 () Bool)

(assert (=> b!145520 m!223907))

(declare-fun m!223909 () Bool)

(assert (=> b!145520 m!223909))

(declare-fun m!223911 () Bool)

(assert (=> b!145520 m!223911))

(declare-fun m!223913 () Bool)

(assert (=> b!145520 m!223913))

(declare-fun m!223915 () Bool)

(assert (=> b!145520 m!223915))

(declare-fun m!223917 () Bool)

(assert (=> b!145520 m!223917))

(declare-fun m!223919 () Bool)

(assert (=> b!145520 m!223919))

(declare-fun m!223921 () Bool)

(assert (=> b!145520 m!223921))

(declare-fun m!223923 () Bool)

(assert (=> b!145520 m!223923))

(declare-fun m!223925 () Bool)

(assert (=> b!145520 m!223925))

(assert (=> b!145520 m!223899))

(declare-fun m!223927 () Bool)

(assert (=> b!145520 m!223927))

(declare-fun m!223929 () Bool)

(assert (=> b!145520 m!223929))

(declare-fun m!223931 () Bool)

(assert (=> b!145520 m!223931))

(declare-fun m!223933 () Bool)

(assert (=> b!145520 m!223933))

(declare-fun m!223935 () Bool)

(assert (=> b!145520 m!223935))

(declare-fun m!223937 () Bool)

(assert (=> b!145520 m!223937))

(declare-fun m!223939 () Bool)

(assert (=> b!145520 m!223939))

(declare-fun m!223941 () Bool)

(assert (=> b!145520 m!223941))

(declare-fun m!223943 () Bool)

(assert (=> b!145520 m!223943))

(assert (=> b!145520 m!223899))

(declare-fun m!223945 () Bool)

(assert (=> b!145520 m!223945))

(declare-fun m!223947 () Bool)

(assert (=> b!145520 m!223947))

(declare-fun m!223949 () Bool)

(assert (=> b!145524 m!223949))

(declare-fun m!223951 () Bool)

(assert (=> b!145523 m!223951))

(declare-fun m!223953 () Bool)

(assert (=> b!145523 m!223953))

(declare-fun m!223955 () Bool)

(assert (=> b!145523 m!223955))

(assert (=> b!145523 m!223947))

(declare-fun m!223957 () Bool)

(assert (=> b!145525 m!223957))

(declare-fun m!223959 () Bool)

(assert (=> b!145526 m!223959))

(declare-fun m!223961 () Bool)

(assert (=> b!145529 m!223961))

(declare-fun m!223963 () Bool)

(assert (=> b!145531 m!223963))

(declare-fun m!223965 () Bool)

(assert (=> b!145531 m!223965))

(declare-fun m!223967 () Bool)

(assert (=> start!28032 m!223967))

(declare-fun m!223969 () Bool)

(assert (=> start!28032 m!223969))

(declare-fun m!223971 () Bool)

(assert (=> b!145521 m!223971))

(assert (=> b!145521 m!223963))

(declare-fun m!223973 () Bool)

(assert (=> b!145534 m!223973))

(declare-fun m!223975 () Bool)

(assert (=> b!145528 m!223975))

(declare-fun m!223977 () Bool)

(assert (=> b!145533 m!223977))

(push 1)

(assert (not b!145528))

(assert (not b!145531))

(assert (not b!145530))

(assert (not b!145529))

(assert (not b!145524))

(assert (not start!28032))

(assert (not b!145520))

(assert (not b!145527))

(assert (not b!145534))

(assert (not b!145523))

(assert (not b!145525))

(assert (not b!145533))

(assert (not b!145526))

(assert (not b!145521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!46445 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!46445 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 thiss!1634))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 thiss!1634))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11396 () Bool)

(assert (= bs!11396 d!46445))

(declare-fun m!224051 () Bool)

(assert (=> bs!11396 m!224051))

(assert (=> b!145524 d!46445))

(declare-fun d!46453 () Bool)

(assert (=> d!46453 (= (array_inv!2789 (buf!3439 thiss!1634)) (bvsge (size!3000 (buf!3439 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!145525 d!46453))

(declare-fun d!46455 () Bool)

(declare-datatypes ((tuple3!560 0))(
  ( (tuple3!561 (_1!6873 Unit!9073) (_2!6873 BitStream!5258) (_3!347 array!6624)) )
))
(declare-fun lt!225517 () tuple3!560)

(declare-fun readByteArrayLoop!0 (BitStream!5258 array!6624 (_ BitVec 32) (_ BitVec 32)) tuple3!560)

(assert (=> d!46455 (= lt!225517 (readByteArrayLoop!0 (_1!6867 lt!225391) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46455 (= (readByteArrayLoopPure!0 (_1!6867 lt!225391) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13045 (_2!6873 lt!225517) (_3!347 lt!225517)))))

(declare-fun bs!11397 () Bool)

(assert (= bs!11397 d!46455))

(declare-fun m!224053 () Bool)

(assert (=> bs!11397 m!224053))

(assert (=> b!145523 d!46455))

(declare-fun d!46457 () Bool)

(assert (=> d!46457 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225381) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385)))) lt!225381))))

(declare-fun bs!11398 () Bool)

(assert (= bs!11398 d!46457))

(declare-fun m!224055 () Bool)

(assert (=> bs!11398 m!224055))

(assert (=> b!145523 d!46457))

(declare-fun d!46459 () Bool)

(assert (=> d!46459 (validate_offset_bits!1 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225381)))

(declare-fun lt!225520 () Unit!9073)

(declare-fun choose!9 (BitStream!5258 array!6624 (_ BitVec 64) BitStream!5258) Unit!9073)

(assert (=> d!46459 (= lt!225520 (choose!9 (_2!6870 lt!225385) (buf!3439 (_2!6870 lt!225386)) lt!225381 (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385)))))))

(assert (=> d!46459 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6870 lt!225385) (buf!3439 (_2!6870 lt!225386)) lt!225381) lt!225520)))

(declare-fun bs!11399 () Bool)

(assert (= bs!11399 d!46459))

(assert (=> bs!11399 m!223953))

(declare-fun m!224057 () Bool)

(assert (=> bs!11399 m!224057))

(assert (=> b!145523 d!46459))

(declare-fun b!145582 () Bool)

(declare-fun res!121740 () Bool)

(declare-fun e!97066 () Bool)

(assert (=> b!145582 (=> (not res!121740) (not e!97066))))

(declare-fun lt!225562 () tuple2!13042)

(assert (=> b!145582 (= res!121740 (isPrefixOf!0 (_2!6867 lt!225562) (_2!6870 lt!225386)))))

(declare-fun b!145583 () Bool)

(declare-fun e!97067 () Unit!9073)

(declare-fun Unit!9076 () Unit!9073)

(assert (=> b!145583 (= e!97067 Unit!9076)))

(declare-fun b!145584 () Bool)

(declare-fun lt!225565 () Unit!9073)

(assert (=> b!145584 (= e!97067 lt!225565)))

(declare-fun lt!225566 () (_ BitVec 64))

(assert (=> b!145584 (= lt!225566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!225564 () (_ BitVec 64))

(assert (=> b!145584 (= lt!225564 (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6624 array!6624 (_ BitVec 64) (_ BitVec 64)) Unit!9073)

(assert (=> b!145584 (= lt!225565 (arrayBitRangesEqSymmetric!0 (buf!3439 (_2!6870 lt!225385)) (buf!3439 (_2!6870 lt!225386)) lt!225566 lt!225564))))

(declare-fun arrayBitRangesEq!0 (array!6624 array!6624 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145584 (arrayBitRangesEq!0 (buf!3439 (_2!6870 lt!225386)) (buf!3439 (_2!6870 lt!225385)) lt!225566 lt!225564)))

(declare-fun b!145585 () Bool)

(declare-fun res!121741 () Bool)

(assert (=> b!145585 (=> (not res!121741) (not e!97066))))

(assert (=> b!145585 (= res!121741 (isPrefixOf!0 (_1!6867 lt!225562) (_2!6870 lt!225385)))))

(declare-fun b!145586 () Bool)

(declare-fun lt!225579 () (_ BitVec 64))

(declare-fun lt!225574 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5258 (_ BitVec 64)) BitStream!5258)

(assert (=> b!145586 (= e!97066 (= (_1!6867 lt!225562) (withMovedBitIndex!0 (_2!6867 lt!225562) (bvsub lt!225574 lt!225579))))))

(assert (=> b!145586 (or (= (bvand lt!225574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225574 lt!225579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145586 (= lt!225579 (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225386))) (currentByte!6329 (_2!6870 lt!225386)) (currentBit!6324 (_2!6870 lt!225386))))))

(assert (=> b!145586 (= lt!225574 (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))))))

(declare-fun d!46461 () Bool)

(assert (=> d!46461 e!97066))

(declare-fun res!121742 () Bool)

(assert (=> d!46461 (=> (not res!121742) (not e!97066))))

(assert (=> d!46461 (= res!121742 (isPrefixOf!0 (_1!6867 lt!225562) (_2!6867 lt!225562)))))

(declare-fun lt!225567 () BitStream!5258)

(assert (=> d!46461 (= lt!225562 (tuple2!13043 lt!225567 (_2!6870 lt!225386)))))

(declare-fun lt!225569 () Unit!9073)

(declare-fun lt!225578 () Unit!9073)

(assert (=> d!46461 (= lt!225569 lt!225578)))

(assert (=> d!46461 (isPrefixOf!0 lt!225567 (_2!6870 lt!225386))))

(assert (=> d!46461 (= lt!225578 (lemmaIsPrefixTransitive!0 lt!225567 (_2!6870 lt!225386) (_2!6870 lt!225386)))))

(declare-fun lt!225572 () Unit!9073)

(declare-fun lt!225571 () Unit!9073)

(assert (=> d!46461 (= lt!225572 lt!225571)))

(assert (=> d!46461 (isPrefixOf!0 lt!225567 (_2!6870 lt!225386))))

(assert (=> d!46461 (= lt!225571 (lemmaIsPrefixTransitive!0 lt!225567 (_2!6870 lt!225385) (_2!6870 lt!225386)))))

(declare-fun lt!225573 () Unit!9073)

(assert (=> d!46461 (= lt!225573 e!97067)))

(declare-fun c!7891 () Bool)

(assert (=> d!46461 (= c!7891 (not (= (size!3000 (buf!3439 (_2!6870 lt!225385))) #b00000000000000000000000000000000)))))

(declare-fun lt!225580 () Unit!9073)

(declare-fun lt!225576 () Unit!9073)

(assert (=> d!46461 (= lt!225580 lt!225576)))

(assert (=> d!46461 (isPrefixOf!0 (_2!6870 lt!225386) (_2!6870 lt!225386))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5258) Unit!9073)

(assert (=> d!46461 (= lt!225576 (lemmaIsPrefixRefl!0 (_2!6870 lt!225386)))))

(declare-fun lt!225568 () Unit!9073)

(declare-fun lt!225563 () Unit!9073)

(assert (=> d!46461 (= lt!225568 lt!225563)))

(assert (=> d!46461 (= lt!225563 (lemmaIsPrefixRefl!0 (_2!6870 lt!225386)))))

(declare-fun lt!225577 () Unit!9073)

(declare-fun lt!225570 () Unit!9073)

(assert (=> d!46461 (= lt!225577 lt!225570)))

(assert (=> d!46461 (isPrefixOf!0 lt!225567 lt!225567)))

(assert (=> d!46461 (= lt!225570 (lemmaIsPrefixRefl!0 lt!225567))))

(declare-fun lt!225575 () Unit!9073)

(declare-fun lt!225561 () Unit!9073)

(assert (=> d!46461 (= lt!225575 lt!225561)))

(assert (=> d!46461 (isPrefixOf!0 (_2!6870 lt!225385) (_2!6870 lt!225385))))

(assert (=> d!46461 (= lt!225561 (lemmaIsPrefixRefl!0 (_2!6870 lt!225385)))))

(assert (=> d!46461 (= lt!225567 (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))))))

(assert (=> d!46461 (isPrefixOf!0 (_2!6870 lt!225385) (_2!6870 lt!225386))))

(assert (=> d!46461 (= (reader!0 (_2!6870 lt!225385) (_2!6870 lt!225386)) lt!225562)))

(assert (= (and d!46461 c!7891) b!145584))

(assert (= (and d!46461 (not c!7891)) b!145583))

(assert (= (and d!46461 res!121742) b!145585))

(assert (= (and b!145585 res!121741) b!145582))

(assert (= (and b!145582 res!121740) b!145586))

(declare-fun m!224059 () Bool)

(assert (=> b!145585 m!224059))

(declare-fun m!224061 () Bool)

(assert (=> d!46461 m!224061))

(assert (=> d!46461 m!223975))

(declare-fun m!224063 () Bool)

(assert (=> d!46461 m!224063))

(declare-fun m!224065 () Bool)

(assert (=> d!46461 m!224065))

(declare-fun m!224067 () Bool)

(assert (=> d!46461 m!224067))

(declare-fun m!224069 () Bool)

(assert (=> d!46461 m!224069))

(declare-fun m!224071 () Bool)

(assert (=> d!46461 m!224071))

(declare-fun m!224073 () Bool)

(assert (=> d!46461 m!224073))

(declare-fun m!224075 () Bool)

(assert (=> d!46461 m!224075))

(declare-fun m!224077 () Bool)

(assert (=> d!46461 m!224077))

(declare-fun m!224079 () Bool)

(assert (=> d!46461 m!224079))

(declare-fun m!224081 () Bool)

(assert (=> b!145582 m!224081))

(assert (=> b!145584 m!223963))

(declare-fun m!224083 () Bool)

(assert (=> b!145584 m!224083))

(declare-fun m!224085 () Bool)

(assert (=> b!145584 m!224085))

(declare-fun m!224087 () Bool)

(assert (=> b!145586 m!224087))

(assert (=> b!145586 m!223971))

(assert (=> b!145586 m!223963))

(assert (=> b!145523 d!46461))

(declare-fun d!46463 () Bool)

(assert (=> d!46463 (= (invariant!0 (currentBit!6324 thiss!1634) (currentByte!6329 thiss!1634) (size!3000 (buf!3439 thiss!1634))) (and (bvsge (currentBit!6324 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6324 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6329 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6329 thiss!1634) (size!3000 (buf!3439 thiss!1634))) (and (= (currentBit!6324 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6329 thiss!1634) (size!3000 (buf!3439 thiss!1634)))))))))

(assert (=> b!145534 d!46463))

(declare-fun d!46465 () Bool)

(declare-fun res!121747 () Bool)

(declare-fun e!97072 () Bool)

(assert (=> d!46465 (=> res!121747 e!97072)))

(assert (=> d!46465 (= res!121747 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46465 (= (arrayRangesEq!316 arr!237 (_2!6868 lt!225378) #b00000000000000000000000000000000 to!404) e!97072)))

(declare-fun b!145591 () Bool)

(declare-fun e!97073 () Bool)

(assert (=> b!145591 (= e!97072 e!97073)))

(declare-fun res!121748 () Bool)

(assert (=> b!145591 (=> (not res!121748) (not e!97073))))

(assert (=> b!145591 (= res!121748 (= (select (arr!3733 arr!237) #b00000000000000000000000000000000) (select (arr!3733 (_2!6868 lt!225378)) #b00000000000000000000000000000000)))))

(declare-fun b!145592 () Bool)

(assert (=> b!145592 (= e!97073 (arrayRangesEq!316 arr!237 (_2!6868 lt!225378) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46465 (not res!121747)) b!145591))

(assert (= (and b!145591 res!121748) b!145592))

(declare-fun m!224089 () Bool)

(assert (=> b!145591 m!224089))

(declare-fun m!224091 () Bool)

(assert (=> b!145591 m!224091))

(declare-fun m!224093 () Bool)

(assert (=> b!145592 m!224093))

(assert (=> b!145533 d!46465))

(assert (=> b!145520 d!46461))

(declare-fun lt!225581 () tuple3!560)

(declare-fun d!46467 () Bool)

(assert (=> d!46467 (= lt!225581 (readByteArrayLoop!0 (_1!6867 lt!225382) (array!6625 (store (arr!3733 arr!237) from!447 (_2!6869 lt!225376)) (size!3000 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46467 (= (readByteArrayLoopPure!0 (_1!6867 lt!225382) (array!6625 (store (arr!3733 arr!237) from!447 (_2!6869 lt!225376)) (size!3000 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13045 (_2!6873 lt!225581) (_3!347 lt!225581)))))

(declare-fun bs!11400 () Bool)

(assert (= bs!11400 d!46467))

(declare-fun m!224095 () Bool)

(assert (=> bs!11400 m!224095))

(assert (=> b!145520 d!46467))

(declare-fun d!46469 () Bool)

(declare-fun res!121757 () Bool)

(declare-fun e!97078 () Bool)

(assert (=> d!46469 (=> (not res!121757) (not e!97078))))

(assert (=> d!46469 (= res!121757 (= (size!3000 (buf!3439 thiss!1634)) (size!3000 (buf!3439 (_2!6870 lt!225386)))))))

(assert (=> d!46469 (= (isPrefixOf!0 thiss!1634 (_2!6870 lt!225386)) e!97078)))

(declare-fun b!145599 () Bool)

(declare-fun res!121755 () Bool)

(assert (=> b!145599 (=> (not res!121755) (not e!97078))))

(assert (=> b!145599 (= res!121755 (bvsle (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)) (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225386))) (currentByte!6329 (_2!6870 lt!225386)) (currentBit!6324 (_2!6870 lt!225386)))))))

(declare-fun b!145600 () Bool)

(declare-fun e!97079 () Bool)

(assert (=> b!145600 (= e!97078 e!97079)))

(declare-fun res!121756 () Bool)

(assert (=> b!145600 (=> res!121756 e!97079)))

(assert (=> b!145600 (= res!121756 (= (size!3000 (buf!3439 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!145601 () Bool)

(assert (=> b!145601 (= e!97079 (arrayBitRangesEq!0 (buf!3439 thiss!1634) (buf!3439 (_2!6870 lt!225386)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634))))))

(assert (= (and d!46469 res!121757) b!145599))

(assert (= (and b!145599 res!121755) b!145600))

(assert (= (and b!145600 (not res!121756)) b!145601))

(assert (=> b!145599 m!223965))

(assert (=> b!145599 m!223971))

(assert (=> b!145601 m!223965))

(assert (=> b!145601 m!223965))

(declare-fun m!224097 () Bool)

(assert (=> b!145601 m!224097))

(assert (=> b!145520 d!46469))

(declare-fun d!46471 () Bool)

(declare-datatypes ((tuple2!13052 0))(
  ( (tuple2!13053 (_1!6874 (_ BitVec 8)) (_2!6874 BitStream!5258)) )
))
(declare-fun lt!225584 () tuple2!13052)

(declare-fun readByte!0 (BitStream!5258) tuple2!13052)

(assert (=> d!46471 (= lt!225584 (readByte!0 (_1!6867 lt!225389)))))

(assert (=> d!46471 (= (readBytePure!0 (_1!6867 lt!225389)) (tuple2!13047 (_2!6874 lt!225584) (_1!6874 lt!225584)))))

(declare-fun bs!11401 () Bool)

(assert (= bs!11401 d!46471))

(declare-fun m!224099 () Bool)

(assert (=> bs!11401 m!224099))

(assert (=> b!145520 d!46471))

(declare-fun d!46473 () Bool)

(declare-fun lt!225585 () tuple2!13052)

(assert (=> d!46473 (= lt!225585 (readByte!0 lt!225387))))

(assert (=> d!46473 (= (readBytePure!0 lt!225387) (tuple2!13047 (_2!6874 lt!225585) (_1!6874 lt!225585)))))

(declare-fun bs!11402 () Bool)

(assert (= bs!11402 d!46473))

(declare-fun m!224101 () Bool)

(assert (=> bs!11402 m!224101))

(assert (=> b!145520 d!46473))

(declare-fun d!46475 () Bool)

(declare-fun e!97091 () Bool)

(assert (=> d!46475 e!97091))

(declare-fun res!121778 () Bool)

(assert (=> d!46475 (=> (not res!121778) (not e!97091))))

(declare-fun lt!225628 () (_ BitVec 64))

(declare-fun lt!225629 () (_ BitVec 64))

(declare-fun lt!225627 () (_ BitVec 64))

(assert (=> d!46475 (= res!121778 (= lt!225628 (bvsub lt!225629 lt!225627)))))

(assert (=> d!46475 (or (= (bvand lt!225629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225629 lt!225627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46475 (= lt!225627 (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6869 lt!225392)))) ((_ sign_extend 32) (currentByte!6329 (_1!6869 lt!225392))) ((_ sign_extend 32) (currentBit!6324 (_1!6869 lt!225392)))))))

(declare-fun lt!225625 () (_ BitVec 64))

(declare-fun lt!225630 () (_ BitVec 64))

(assert (=> d!46475 (= lt!225629 (bvmul lt!225625 lt!225630))))

(assert (=> d!46475 (or (= lt!225625 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225630 (bvsdiv (bvmul lt!225625 lt!225630) lt!225625)))))

(assert (=> d!46475 (= lt!225630 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46475 (= lt!225625 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6869 lt!225392)))))))

(assert (=> d!46475 (= lt!225628 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6329 (_1!6869 lt!225392))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6324 (_1!6869 lt!225392)))))))

(assert (=> d!46475 (invariant!0 (currentBit!6324 (_1!6869 lt!225392)) (currentByte!6329 (_1!6869 lt!225392)) (size!3000 (buf!3439 (_1!6869 lt!225392))))))

(assert (=> d!46475 (= (bitIndex!0 (size!3000 (buf!3439 (_1!6869 lt!225392))) (currentByte!6329 (_1!6869 lt!225392)) (currentBit!6324 (_1!6869 lt!225392))) lt!225628)))

(declare-fun b!145621 () Bool)

(declare-fun res!121777 () Bool)

(assert (=> b!145621 (=> (not res!121777) (not e!97091))))

(assert (=> b!145621 (= res!121777 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225628))))

(declare-fun b!145622 () Bool)

(declare-fun lt!225626 () (_ BitVec 64))

(assert (=> b!145622 (= e!97091 (bvsle lt!225628 (bvmul lt!225626 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145622 (or (= lt!225626 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225626 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225626)))))

(assert (=> b!145622 (= lt!225626 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6869 lt!225392)))))))

(assert (= (and d!46475 res!121778) b!145621))

(assert (= (and b!145621 res!121777) b!145622))

(declare-fun m!224103 () Bool)

(assert (=> d!46475 m!224103))

(declare-fun m!224105 () Bool)

(assert (=> d!46475 m!224105))

(assert (=> b!145520 d!46475))

(declare-fun d!46477 () Bool)

(assert (=> d!46477 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225385)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225394) (bvsle ((_ sign_extend 32) lt!225394) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225385)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11403 () Bool)

(assert (= bs!11403 d!46477))

(declare-fun m!224111 () Bool)

(assert (=> bs!11403 m!224111))

(assert (=> b!145520 d!46477))

(declare-fun d!46479 () Bool)

(assert (=> d!46479 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225394) (bvsle ((_ sign_extend 32) lt!225394) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11404 () Bool)

(assert (= bs!11404 d!46479))

(assert (=> bs!11404 m!224055))

(assert (=> b!145520 d!46479))

(declare-fun d!46481 () Bool)

(assert (=> d!46481 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!225633 () Unit!9073)

(declare-fun choose!26 (BitStream!5258 array!6624 (_ BitVec 32) BitStream!5258) Unit!9073)

(assert (=> d!46481 (= lt!225633 (choose!26 thiss!1634 (buf!3439 (_2!6870 lt!225386)) (bvsub to!404 from!447) (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634))))))

(assert (=> d!46481 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3439 (_2!6870 lt!225386)) (bvsub to!404 from!447)) lt!225633)))

(declare-fun bs!11405 () Bool)

(assert (= bs!11405 d!46481))

(assert (=> bs!11405 m!223907))

(declare-fun m!224127 () Bool)

(assert (=> bs!11405 m!224127))

(assert (=> b!145520 d!46481))

(declare-fun d!46485 () Bool)

(assert (=> d!46485 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225394)))

(declare-fun lt!225634 () Unit!9073)

(assert (=> d!46485 (= lt!225634 (choose!26 (_2!6870 lt!225385) (buf!3439 (_2!6870 lt!225386)) lt!225394 (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385)))))))

(assert (=> d!46485 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6870 lt!225385) (buf!3439 (_2!6870 lt!225386)) lt!225394) lt!225634)))

(declare-fun bs!11406 () Bool)

(assert (= bs!11406 d!46485))

(assert (=> bs!11406 m!223923))

(declare-fun m!224129 () Bool)

(assert (=> bs!11406 m!224129))

(assert (=> b!145520 d!46485))

(declare-fun d!46487 () Bool)

(declare-fun e!97092 () Bool)

(assert (=> d!46487 e!97092))

(declare-fun res!121780 () Bool)

(assert (=> d!46487 (=> (not res!121780) (not e!97092))))

(declare-fun lt!225638 () (_ BitVec 64))

(declare-fun lt!225639 () (_ BitVec 64))

(declare-fun lt!225637 () (_ BitVec 64))

(assert (=> d!46487 (= res!121780 (= lt!225638 (bvsub lt!225639 lt!225637)))))

(assert (=> d!46487 (or (= (bvand lt!225639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225637 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225639 lt!225637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46487 (= lt!225637 (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6869 lt!225388)))) ((_ sign_extend 32) (currentByte!6329 (_1!6869 lt!225388))) ((_ sign_extend 32) (currentBit!6324 (_1!6869 lt!225388)))))))

(declare-fun lt!225635 () (_ BitVec 64))

(declare-fun lt!225640 () (_ BitVec 64))

(assert (=> d!46487 (= lt!225639 (bvmul lt!225635 lt!225640))))

(assert (=> d!46487 (or (= lt!225635 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225640 (bvsdiv (bvmul lt!225635 lt!225640) lt!225635)))))

(assert (=> d!46487 (= lt!225640 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46487 (= lt!225635 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6869 lt!225388)))))))

(assert (=> d!46487 (= lt!225638 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6329 (_1!6869 lt!225388))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6324 (_1!6869 lt!225388)))))))

(assert (=> d!46487 (invariant!0 (currentBit!6324 (_1!6869 lt!225388)) (currentByte!6329 (_1!6869 lt!225388)) (size!3000 (buf!3439 (_1!6869 lt!225388))))))

(assert (=> d!46487 (= (bitIndex!0 (size!3000 (buf!3439 (_1!6869 lt!225388))) (currentByte!6329 (_1!6869 lt!225388)) (currentBit!6324 (_1!6869 lt!225388))) lt!225638)))

(declare-fun b!145623 () Bool)

(declare-fun res!121779 () Bool)

(assert (=> b!145623 (=> (not res!121779) (not e!97092))))

(assert (=> b!145623 (= res!121779 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225638))))

(declare-fun b!145624 () Bool)

(declare-fun lt!225636 () (_ BitVec 64))

(assert (=> b!145624 (= e!97092 (bvsle lt!225638 (bvmul lt!225636 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145624 (or (= lt!225636 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225636 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225636)))))

(assert (=> b!145624 (= lt!225636 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6869 lt!225388)))))))

(assert (= (and d!46487 res!121780) b!145623))

(assert (= (and b!145623 res!121779) b!145624))

(declare-fun m!224131 () Bool)

(assert (=> d!46487 m!224131))

(declare-fun m!224133 () Bool)

(assert (=> d!46487 m!224133))

(assert (=> b!145520 d!46487))

(declare-fun d!46489 () Bool)

(assert (=> d!46489 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6867 lt!225389)))) ((_ sign_extend 32) (currentByte!6329 (_1!6867 lt!225389))) ((_ sign_extend 32) (currentBit!6324 (_1!6867 lt!225389))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_1!6867 lt!225389)))) ((_ sign_extend 32) (currentByte!6329 (_1!6867 lt!225389))) ((_ sign_extend 32) (currentBit!6324 (_1!6867 lt!225389)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11407 () Bool)

(assert (= bs!11407 d!46489))

(declare-fun m!224135 () Bool)

(assert (=> bs!11407 m!224135))

(assert (=> b!145520 d!46489))

(declare-fun b!145625 () Bool)

(declare-fun res!121781 () Bool)

(declare-fun e!97093 () Bool)

(assert (=> b!145625 (=> (not res!121781) (not e!97093))))

(declare-fun lt!225642 () tuple2!13042)

(assert (=> b!145625 (= res!121781 (isPrefixOf!0 (_2!6867 lt!225642) (_2!6870 lt!225386)))))

(declare-fun b!145626 () Bool)

(declare-fun e!97094 () Unit!9073)

(declare-fun Unit!9079 () Unit!9073)

(assert (=> b!145626 (= e!97094 Unit!9079)))

(declare-fun b!145627 () Bool)

(declare-fun lt!225645 () Unit!9073)

(assert (=> b!145627 (= e!97094 lt!225645)))

(declare-fun lt!225646 () (_ BitVec 64))

(assert (=> b!145627 (= lt!225646 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!225644 () (_ BitVec 64))

(assert (=> b!145627 (= lt!225644 (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))

(assert (=> b!145627 (= lt!225645 (arrayBitRangesEqSymmetric!0 (buf!3439 thiss!1634) (buf!3439 (_2!6870 lt!225386)) lt!225646 lt!225644))))

(assert (=> b!145627 (arrayBitRangesEq!0 (buf!3439 (_2!6870 lt!225386)) (buf!3439 thiss!1634) lt!225646 lt!225644)))

(declare-fun b!145628 () Bool)

(declare-fun res!121782 () Bool)

(assert (=> b!145628 (=> (not res!121782) (not e!97093))))

(assert (=> b!145628 (= res!121782 (isPrefixOf!0 (_1!6867 lt!225642) thiss!1634))))

(declare-fun lt!225654 () (_ BitVec 64))

(declare-fun lt!225659 () (_ BitVec 64))

(declare-fun b!145629 () Bool)

(assert (=> b!145629 (= e!97093 (= (_1!6867 lt!225642) (withMovedBitIndex!0 (_2!6867 lt!225642) (bvsub lt!225654 lt!225659))))))

(assert (=> b!145629 (or (= (bvand lt!225654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225659 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225654 lt!225659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145629 (= lt!225659 (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225386))) (currentByte!6329 (_2!6870 lt!225386)) (currentBit!6324 (_2!6870 lt!225386))))))

(assert (=> b!145629 (= lt!225654 (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))

(declare-fun d!46492 () Bool)

(assert (=> d!46492 e!97093))

(declare-fun res!121783 () Bool)

(assert (=> d!46492 (=> (not res!121783) (not e!97093))))

(assert (=> d!46492 (= res!121783 (isPrefixOf!0 (_1!6867 lt!225642) (_2!6867 lt!225642)))))

(declare-fun lt!225647 () BitStream!5258)

(assert (=> d!46492 (= lt!225642 (tuple2!13043 lt!225647 (_2!6870 lt!225386)))))

(declare-fun lt!225649 () Unit!9073)

(declare-fun lt!225658 () Unit!9073)

(assert (=> d!46492 (= lt!225649 lt!225658)))

(assert (=> d!46492 (isPrefixOf!0 lt!225647 (_2!6870 lt!225386))))

(assert (=> d!46492 (= lt!225658 (lemmaIsPrefixTransitive!0 lt!225647 (_2!6870 lt!225386) (_2!6870 lt!225386)))))

(declare-fun lt!225652 () Unit!9073)

(declare-fun lt!225651 () Unit!9073)

(assert (=> d!46492 (= lt!225652 lt!225651)))

(assert (=> d!46492 (isPrefixOf!0 lt!225647 (_2!6870 lt!225386))))

(assert (=> d!46492 (= lt!225651 (lemmaIsPrefixTransitive!0 lt!225647 thiss!1634 (_2!6870 lt!225386)))))

(declare-fun lt!225653 () Unit!9073)

(assert (=> d!46492 (= lt!225653 e!97094)))

(declare-fun c!7892 () Bool)

(assert (=> d!46492 (= c!7892 (not (= (size!3000 (buf!3439 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!225660 () Unit!9073)

(declare-fun lt!225656 () Unit!9073)

(assert (=> d!46492 (= lt!225660 lt!225656)))

(assert (=> d!46492 (isPrefixOf!0 (_2!6870 lt!225386) (_2!6870 lt!225386))))

(assert (=> d!46492 (= lt!225656 (lemmaIsPrefixRefl!0 (_2!6870 lt!225386)))))

(declare-fun lt!225648 () Unit!9073)

(declare-fun lt!225643 () Unit!9073)

(assert (=> d!46492 (= lt!225648 lt!225643)))

(assert (=> d!46492 (= lt!225643 (lemmaIsPrefixRefl!0 (_2!6870 lt!225386)))))

(declare-fun lt!225657 () Unit!9073)

(declare-fun lt!225650 () Unit!9073)

(assert (=> d!46492 (= lt!225657 lt!225650)))

(assert (=> d!46492 (isPrefixOf!0 lt!225647 lt!225647)))

(assert (=> d!46492 (= lt!225650 (lemmaIsPrefixRefl!0 lt!225647))))

(declare-fun lt!225655 () Unit!9073)

(declare-fun lt!225641 () Unit!9073)

(assert (=> d!46492 (= lt!225655 lt!225641)))

(assert (=> d!46492 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46492 (= lt!225641 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46492 (= lt!225647 (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))

(assert (=> d!46492 (isPrefixOf!0 thiss!1634 (_2!6870 lt!225386))))

(assert (=> d!46492 (= (reader!0 thiss!1634 (_2!6870 lt!225386)) lt!225642)))

(assert (= (and d!46492 c!7892) b!145627))

(assert (= (and d!46492 (not c!7892)) b!145626))

(assert (= (and d!46492 res!121783) b!145628))

(assert (= (and b!145628 res!121782) b!145625))

(assert (= (and b!145625 res!121781) b!145629))

(declare-fun m!224137 () Bool)

(assert (=> b!145628 m!224137))

(assert (=> d!46492 m!224061))

(assert (=> d!46492 m!223937))

(declare-fun m!224139 () Bool)

(assert (=> d!46492 m!224139))

(declare-fun m!224141 () Bool)

(assert (=> d!46492 m!224141))

(declare-fun m!224143 () Bool)

(assert (=> d!46492 m!224143))

(assert (=> d!46492 m!224069))

(declare-fun m!224145 () Bool)

(assert (=> d!46492 m!224145))

(declare-fun m!224147 () Bool)

(assert (=> d!46492 m!224147))

(declare-fun m!224149 () Bool)

(assert (=> d!46492 m!224149))

(declare-fun m!224151 () Bool)

(assert (=> d!46492 m!224151))

(declare-fun m!224153 () Bool)

(assert (=> d!46492 m!224153))

(declare-fun m!224155 () Bool)

(assert (=> b!145625 m!224155))

(assert (=> b!145627 m!223965))

(declare-fun m!224157 () Bool)

(assert (=> b!145627 m!224157))

(declare-fun m!224159 () Bool)

(assert (=> b!145627 m!224159))

(declare-fun m!224161 () Bool)

(assert (=> b!145629 m!224161))

(assert (=> b!145629 m!223971))

(assert (=> b!145629 m!223965))

(assert (=> b!145520 d!46492))

(declare-fun d!46494 () Bool)

(declare-fun e!97104 () Bool)

(assert (=> d!46494 e!97104))

(declare-fun res!121795 () Bool)

(assert (=> d!46494 (=> (not res!121795) (not e!97104))))

(assert (=> d!46494 (= res!121795 (and (or (let ((rhs!3220 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3220 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3220) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!46495 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!46495 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!46495 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3219 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3219 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3219) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!225718 () Unit!9073)

(declare-fun choose!57 (BitStream!5258 BitStream!5258 (_ BitVec 64) (_ BitVec 32)) Unit!9073)

(assert (=> d!46494 (= lt!225718 (choose!57 thiss!1634 (_2!6870 lt!225385) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!46494 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6870 lt!225385) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!225718)))

(declare-fun lt!225717 () (_ BitVec 32))

(declare-fun b!145645 () Bool)

(assert (=> b!145645 (= e!97104 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225385)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) (bvsub (bvsub to!404 from!447) lt!225717)))))

(assert (=> b!145645 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!225717 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!225717) #b10000000000000000000000000000000)))))

(declare-fun lt!225716 () (_ BitVec 64))

(assert (=> b!145645 (= lt!225717 ((_ extract 31 0) lt!225716))))

(assert (=> b!145645 (and (bvslt lt!225716 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!225716 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!145645 (= lt!225716 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!46494 res!121795) b!145645))

(declare-fun m!224193 () Bool)

(assert (=> d!46494 m!224193))

(declare-fun m!224195 () Bool)

(assert (=> b!145645 m!224195))

(assert (=> b!145520 d!46494))

(declare-fun d!46501 () Bool)

(assert (=> d!46501 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11408 () Bool)

(assert (= bs!11408 d!46501))

(declare-fun m!224201 () Bool)

(assert (=> bs!11408 m!224201))

(assert (=> b!145520 d!46501))

(declare-fun d!46503 () Bool)

(declare-fun lt!225719 () tuple2!13052)

(assert (=> d!46503 (= lt!225719 (readByte!0 (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634))))))

(assert (=> d!46503 (= (readBytePure!0 (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634))) (tuple2!13047 (_2!6874 lt!225719) (_1!6874 lt!225719)))))

(declare-fun bs!11409 () Bool)

(assert (= bs!11409 d!46503))

(declare-fun m!224211 () Bool)

(assert (=> bs!11409 m!224211))

(assert (=> b!145520 d!46503))

(declare-fun d!46505 () Bool)

(declare-fun e!97110 () Bool)

(assert (=> d!46505 e!97110))

(declare-fun res!121803 () Bool)

(assert (=> d!46505 (=> (not res!121803) (not e!97110))))

(declare-fun lt!225735 () tuple2!13046)

(declare-fun lt!225734 () tuple2!13046)

(assert (=> d!46505 (= res!121803 (= (bitIndex!0 (size!3000 (buf!3439 (_1!6869 lt!225735))) (currentByte!6329 (_1!6869 lt!225735)) (currentBit!6324 (_1!6869 lt!225735))) (bitIndex!0 (size!3000 (buf!3439 (_1!6869 lt!225734))) (currentByte!6329 (_1!6869 lt!225734)) (currentBit!6324 (_1!6869 lt!225734)))))))

(declare-fun lt!225737 () BitStream!5258)

(declare-fun lt!225736 () Unit!9073)

(declare-fun choose!14 (BitStream!5258 BitStream!5258 BitStream!5258 tuple2!13046 tuple2!13046 BitStream!5258 (_ BitVec 8) tuple2!13046 tuple2!13046 BitStream!5258 (_ BitVec 8)) Unit!9073)

(assert (=> d!46505 (= lt!225736 (choose!14 lt!225387 (_2!6870 lt!225386) lt!225737 lt!225735 (tuple2!13047 (_1!6869 lt!225735) (_2!6869 lt!225735)) (_1!6869 lt!225735) (_2!6869 lt!225735) lt!225734 (tuple2!13047 (_1!6869 lt!225734) (_2!6869 lt!225734)) (_1!6869 lt!225734) (_2!6869 lt!225734)))))

(assert (=> d!46505 (= lt!225734 (readBytePure!0 lt!225737))))

(assert (=> d!46505 (= lt!225735 (readBytePure!0 lt!225387))))

(assert (=> d!46505 (= lt!225737 (BitStream!5259 (buf!3439 (_2!6870 lt!225386)) (currentByte!6329 lt!225387) (currentBit!6324 lt!225387)))))

(assert (=> d!46505 (= (readBytePrefixLemma!0 lt!225387 (_2!6870 lt!225386)) lt!225736)))

(declare-fun b!145653 () Bool)

(assert (=> b!145653 (= e!97110 (= (_2!6869 lt!225735) (_2!6869 lt!225734)))))

(assert (= (and d!46505 res!121803) b!145653))

(declare-fun m!224229 () Bool)

(assert (=> d!46505 m!224229))

(declare-fun m!224231 () Bool)

(assert (=> d!46505 m!224231))

(declare-fun m!224233 () Bool)

(assert (=> d!46505 m!224233))

(assert (=> d!46505 m!223917))

(declare-fun m!224235 () Bool)

(assert (=> d!46505 m!224235))

(assert (=> b!145520 d!46505))

(declare-fun d!46513 () Bool)

(declare-fun e!97118 () Bool)

(assert (=> d!46513 e!97118))

(declare-fun res!121824 () Bool)

(assert (=> d!46513 (=> (not res!121824) (not e!97118))))

(declare-fun lt!225763 () tuple2!13048)

(assert (=> d!46513 (= res!121824 (= (size!3000 (buf!3439 thiss!1634)) (size!3000 (buf!3439 (_2!6870 lt!225763)))))))

(declare-fun choose!6 (BitStream!5258 (_ BitVec 8)) tuple2!13048)

(assert (=> d!46513 (= lt!225763 (choose!6 thiss!1634 (select (arr!3733 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!46513 (validate_offset_byte!0 ((_ sign_extend 32) (size!3000 (buf!3439 thiss!1634))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634)))))

(assert (=> d!46513 (= (appendByte!0 thiss!1634 (select (arr!3733 arr!237) from!447)) lt!225763)))

(declare-fun b!145672 () Bool)

(declare-fun res!121822 () Bool)

(assert (=> b!145672 (=> (not res!121822) (not e!97118))))

(declare-fun lt!225764 () (_ BitVec 64))

(declare-fun lt!225767 () (_ BitVec 64))

(assert (=> b!145672 (= res!121822 (= (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225763))) (currentByte!6329 (_2!6870 lt!225763)) (currentBit!6324 (_2!6870 lt!225763))) (bvadd lt!225764 lt!225767)))))

(assert (=> b!145672 (or (not (= (bvand lt!225764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225767 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!225764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!225764 lt!225767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145672 (= lt!225767 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!145672 (= lt!225764 (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))

(declare-fun b!145673 () Bool)

(declare-fun res!121823 () Bool)

(assert (=> b!145673 (=> (not res!121823) (not e!97118))))

(assert (=> b!145673 (= res!121823 (isPrefixOf!0 thiss!1634 (_2!6870 lt!225763)))))

(declare-fun lt!225766 () tuple2!13046)

(declare-fun b!145674 () Bool)

(declare-fun lt!225765 () tuple2!13042)

(assert (=> b!145674 (= e!97118 (and (= (_2!6869 lt!225766) (select (arr!3733 arr!237) from!447)) (= (_1!6869 lt!225766) (_2!6867 lt!225765))))))

(assert (=> b!145674 (= lt!225766 (readBytePure!0 (_1!6867 lt!225765)))))

(assert (=> b!145674 (= lt!225765 (reader!0 thiss!1634 (_2!6870 lt!225763)))))

(assert (= (and d!46513 res!121824) b!145672))

(assert (= (and b!145672 res!121822) b!145673))

(assert (= (and b!145673 res!121823) b!145674))

(assert (=> d!46513 m!223899))

(declare-fun m!224253 () Bool)

(assert (=> d!46513 m!224253))

(declare-fun m!224255 () Bool)

(assert (=> d!46513 m!224255))

(declare-fun m!224257 () Bool)

(assert (=> b!145672 m!224257))

(assert (=> b!145672 m!223965))

(declare-fun m!224259 () Bool)

(assert (=> b!145673 m!224259))

(declare-fun m!224261 () Bool)

(assert (=> b!145674 m!224261))

(declare-fun m!224263 () Bool)

(assert (=> b!145674 m!224263))

(assert (=> b!145520 d!46513))

(declare-fun d!46525 () Bool)

(assert (=> d!46525 (isPrefixOf!0 thiss!1634 (_2!6870 lt!225386))))

(declare-fun lt!225773 () Unit!9073)

(declare-fun choose!30 (BitStream!5258 BitStream!5258 BitStream!5258) Unit!9073)

(assert (=> d!46525 (= lt!225773 (choose!30 thiss!1634 (_2!6870 lt!225385) (_2!6870 lt!225386)))))

(assert (=> d!46525 (isPrefixOf!0 thiss!1634 (_2!6870 lt!225385))))

(assert (=> d!46525 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6870 lt!225385) (_2!6870 lt!225386)) lt!225773)))

(declare-fun bs!11413 () Bool)

(assert (= bs!11413 d!46525))

(assert (=> bs!11413 m!223937))

(declare-fun m!224265 () Bool)

(assert (=> bs!11413 m!224265))

(assert (=> bs!11413 m!223959))

(assert (=> b!145520 d!46525))

(declare-fun b!145693 () Bool)

(declare-fun e!97134 () Bool)

(declare-fun lt!225804 () (_ BitVec 64))

(assert (=> b!145693 (= e!97134 (validate_offset_bits!1 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225385)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225804))))

(declare-fun b!145694 () Bool)

(declare-fun res!121843 () Bool)

(declare-fun e!97132 () Bool)

(assert (=> b!145694 (=> (not res!121843) (not e!97132))))

(declare-fun lt!225801 () tuple2!13048)

(assert (=> b!145694 (= res!121843 (isPrefixOf!0 (_2!6870 lt!225385) (_2!6870 lt!225801)))))

(declare-fun b!145695 () Bool)

(declare-fun e!97133 () Bool)

(assert (=> b!145695 (= e!97132 e!97133)))

(declare-fun res!121847 () Bool)

(assert (=> b!145695 (=> (not res!121847) (not e!97133))))

(declare-fun lt!225802 () tuple2!13042)

(declare-fun lt!225805 () tuple2!13044)

(assert (=> b!145695 (= res!121847 (and (= (size!3000 (_2!6868 lt!225805)) (size!3000 arr!237)) (= (_1!6868 lt!225805) (_2!6867 lt!225802))))))

(assert (=> b!145695 (= lt!225805 (readByteArrayLoopPure!0 (_1!6867 lt!225802) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225806 () Unit!9073)

(declare-fun lt!225803 () Unit!9073)

(assert (=> b!145695 (= lt!225806 lt!225803)))

(assert (=> b!145695 (validate_offset_bits!1 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225801)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385))) lt!225804)))

(assert (=> b!145695 (= lt!225803 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6870 lt!225385) (buf!3439 (_2!6870 lt!225801)) lt!225804))))

(assert (=> b!145695 e!97134))

(declare-fun res!121846 () Bool)

(assert (=> b!145695 (=> (not res!121846) (not e!97134))))

(assert (=> b!145695 (= res!121846 (and (= (size!3000 (buf!3439 (_2!6870 lt!225385))) (size!3000 (buf!3439 (_2!6870 lt!225801)))) (bvsge lt!225804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145695 (= lt!225804 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!145695 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!145695 (= lt!225802 (reader!0 (_2!6870 lt!225385) (_2!6870 lt!225801)))))

(declare-fun d!46529 () Bool)

(assert (=> d!46529 e!97132))

(declare-fun res!121844 () Bool)

(assert (=> d!46529 (=> (not res!121844) (not e!97132))))

(assert (=> d!46529 (= res!121844 (= (size!3000 (buf!3439 (_2!6870 lt!225385))) (size!3000 (buf!3439 (_2!6870 lt!225801)))))))

(declare-fun choose!64 (BitStream!5258 array!6624 (_ BitVec 32) (_ BitVec 32)) tuple2!13048)

(assert (=> d!46529 (= lt!225801 (choose!64 (_2!6870 lt!225385) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46529 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3000 arr!237)))))

(assert (=> d!46529 (= (appendByteArrayLoop!0 (_2!6870 lt!225385) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!225801)))

(declare-fun b!145696 () Bool)

(declare-fun res!121845 () Bool)

(assert (=> b!145696 (=> (not res!121845) (not e!97132))))

(declare-fun lt!225807 () (_ BitVec 64))

(declare-fun lt!225800 () (_ BitVec 64))

(assert (=> b!145696 (= res!121845 (= (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225801))) (currentByte!6329 (_2!6870 lt!225801)) (currentBit!6324 (_2!6870 lt!225801))) (bvadd lt!225807 lt!225800)))))

(assert (=> b!145696 (or (not (= (bvand lt!225807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225800 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!225807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!225807 lt!225800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!225808 () (_ BitVec 64))

(assert (=> b!145696 (= lt!225800 (bvmul lt!225808 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!145696 (or (= lt!225808 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225808 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225808)))))

(assert (=> b!145696 (= lt!225808 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!145696 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!145696 (= lt!225807 (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))))))

(declare-fun b!145697 () Bool)

(assert (=> b!145697 (= e!97133 (arrayRangesEq!316 arr!237 (_2!6868 lt!225805) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!46529 res!121844) b!145696))

(assert (= (and b!145696 res!121845) b!145694))

(assert (= (and b!145694 res!121843) b!145695))

(assert (= (and b!145695 res!121846) b!145693))

(assert (= (and b!145695 res!121847) b!145697))

(declare-fun m!224281 () Bool)

(assert (=> d!46529 m!224281))

(declare-fun m!224283 () Bool)

(assert (=> b!145694 m!224283))

(declare-fun m!224285 () Bool)

(assert (=> b!145696 m!224285))

(assert (=> b!145696 m!223963))

(declare-fun m!224287 () Bool)

(assert (=> b!145693 m!224287))

(declare-fun m!224289 () Bool)

(assert (=> b!145695 m!224289))

(declare-fun m!224291 () Bool)

(assert (=> b!145695 m!224291))

(declare-fun m!224293 () Bool)

(assert (=> b!145695 m!224293))

(declare-fun m!224295 () Bool)

(assert (=> b!145695 m!224295))

(declare-fun m!224297 () Bool)

(assert (=> b!145697 m!224297))

(assert (=> b!145520 d!46529))

(declare-fun d!46541 () Bool)

(declare-fun e!97135 () Bool)

(assert (=> d!46541 e!97135))

(declare-fun res!121849 () Bool)

(assert (=> d!46541 (=> (not res!121849) (not e!97135))))

(declare-fun lt!225812 () (_ BitVec 64))

(declare-fun lt!225811 () (_ BitVec 64))

(declare-fun lt!225813 () (_ BitVec 64))

(assert (=> d!46541 (= res!121849 (= lt!225812 (bvsub lt!225813 lt!225811)))))

(assert (=> d!46541 (or (= (bvand lt!225813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225811 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225813 lt!225811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46541 (= lt!225811 (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225385)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385)))))))

(declare-fun lt!225809 () (_ BitVec 64))

(declare-fun lt!225814 () (_ BitVec 64))

(assert (=> d!46541 (= lt!225813 (bvmul lt!225809 lt!225814))))

(assert (=> d!46541 (or (= lt!225809 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225814 (bvsdiv (bvmul lt!225809 lt!225814) lt!225809)))))

(assert (=> d!46541 (= lt!225814 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46541 (= lt!225809 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225385)))))))

(assert (=> d!46541 (= lt!225812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225385))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225385)))))))

(assert (=> d!46541 (invariant!0 (currentBit!6324 (_2!6870 lt!225385)) (currentByte!6329 (_2!6870 lt!225385)) (size!3000 (buf!3439 (_2!6870 lt!225385))))))

(assert (=> d!46541 (= (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))) lt!225812)))

(declare-fun b!145698 () Bool)

(declare-fun res!121848 () Bool)

(assert (=> b!145698 (=> (not res!121848) (not e!97135))))

(assert (=> b!145698 (= res!121848 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225812))))

(declare-fun b!145699 () Bool)

(declare-fun lt!225810 () (_ BitVec 64))

(assert (=> b!145699 (= e!97135 (bvsle lt!225812 (bvmul lt!225810 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145699 (or (= lt!225810 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225810 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225810)))))

(assert (=> b!145699 (= lt!225810 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225385)))))))

(assert (= (and d!46541 res!121849) b!145698))

(assert (= (and b!145698 res!121848) b!145699))

(assert (=> d!46541 m!224111))

(declare-fun m!224299 () Bool)

(assert (=> d!46541 m!224299))

(assert (=> b!145531 d!46541))

(declare-fun d!46543 () Bool)

(declare-fun e!97136 () Bool)

(assert (=> d!46543 e!97136))

(declare-fun res!121851 () Bool)

(assert (=> d!46543 (=> (not res!121851) (not e!97136))))

(declare-fun lt!225818 () (_ BitVec 64))

(declare-fun lt!225817 () (_ BitVec 64))

(declare-fun lt!225819 () (_ BitVec 64))

(assert (=> d!46543 (= res!121851 (= lt!225818 (bvsub lt!225819 lt!225817)))))

(assert (=> d!46543 (or (= (bvand lt!225819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225817 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225819 lt!225817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46543 (= lt!225817 (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 thiss!1634))) ((_ sign_extend 32) (currentByte!6329 thiss!1634)) ((_ sign_extend 32) (currentBit!6324 thiss!1634))))))

(declare-fun lt!225815 () (_ BitVec 64))

(declare-fun lt!225820 () (_ BitVec 64))

(assert (=> d!46543 (= lt!225819 (bvmul lt!225815 lt!225820))))

(assert (=> d!46543 (or (= lt!225815 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225820 (bvsdiv (bvmul lt!225815 lt!225820) lt!225815)))))

(assert (=> d!46543 (= lt!225820 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46543 (= lt!225815 ((_ sign_extend 32) (size!3000 (buf!3439 thiss!1634))))))

(assert (=> d!46543 (= lt!225818 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6329 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6324 thiss!1634))))))

(assert (=> d!46543 (invariant!0 (currentBit!6324 thiss!1634) (currentByte!6329 thiss!1634) (size!3000 (buf!3439 thiss!1634)))))

(assert (=> d!46543 (= (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)) lt!225818)))

(declare-fun b!145700 () Bool)

(declare-fun res!121850 () Bool)

(assert (=> b!145700 (=> (not res!121850) (not e!97136))))

(assert (=> b!145700 (= res!121850 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225818))))

(declare-fun b!145701 () Bool)

(declare-fun lt!225816 () (_ BitVec 64))

(assert (=> b!145701 (= e!97136 (bvsle lt!225818 (bvmul lt!225816 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145701 (or (= lt!225816 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225816 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225816)))))

(assert (=> b!145701 (= lt!225816 ((_ sign_extend 32) (size!3000 (buf!3439 thiss!1634))))))

(assert (= (and d!46543 res!121851) b!145700))

(assert (= (and b!145700 res!121850) b!145701))

(assert (=> d!46543 m!224051))

(assert (=> d!46543 m!223973))

(assert (=> b!145531 d!46543))

(declare-fun d!46545 () Bool)

(assert (=> d!46545 (= (array_inv!2789 arr!237) (bvsge (size!3000 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28032 d!46545))

(declare-fun d!46547 () Bool)

(assert (=> d!46547 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6324 thiss!1634) (currentByte!6329 thiss!1634) (size!3000 (buf!3439 thiss!1634))))))

(declare-fun bs!11417 () Bool)

(assert (= bs!11417 d!46547))

(assert (=> bs!11417 m!223973))

(assert (=> start!28032 d!46547))

(declare-fun d!46549 () Bool)

(declare-fun e!97137 () Bool)

(assert (=> d!46549 e!97137))

(declare-fun res!121853 () Bool)

(assert (=> d!46549 (=> (not res!121853) (not e!97137))))

(declare-fun lt!225825 () (_ BitVec 64))

(declare-fun lt!225824 () (_ BitVec 64))

(declare-fun lt!225823 () (_ BitVec 64))

(assert (=> d!46549 (= res!121853 (= lt!225824 (bvsub lt!225825 lt!225823)))))

(assert (=> d!46549 (or (= (bvand lt!225825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225825 lt!225823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46549 (= lt!225823 (remainingBits!0 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))) ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225386))) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225386)))))))

(declare-fun lt!225821 () (_ BitVec 64))

(declare-fun lt!225826 () (_ BitVec 64))

(assert (=> d!46549 (= lt!225825 (bvmul lt!225821 lt!225826))))

(assert (=> d!46549 (or (= lt!225821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225826 (bvsdiv (bvmul lt!225821 lt!225826) lt!225821)))))

(assert (=> d!46549 (= lt!225826 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46549 (= lt!225821 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))))))

(assert (=> d!46549 (= lt!225824 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6329 (_2!6870 lt!225386))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6324 (_2!6870 lt!225386)))))))

(assert (=> d!46549 (invariant!0 (currentBit!6324 (_2!6870 lt!225386)) (currentByte!6329 (_2!6870 lt!225386)) (size!3000 (buf!3439 (_2!6870 lt!225386))))))

(assert (=> d!46549 (= (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225386))) (currentByte!6329 (_2!6870 lt!225386)) (currentBit!6324 (_2!6870 lt!225386))) lt!225824)))

(declare-fun b!145702 () Bool)

(declare-fun res!121852 () Bool)

(assert (=> b!145702 (=> (not res!121852) (not e!97137))))

(assert (=> b!145702 (= res!121852 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225824))))

(declare-fun b!145703 () Bool)

(declare-fun lt!225822 () (_ BitVec 64))

(assert (=> b!145703 (= e!97137 (bvsle lt!225824 (bvmul lt!225822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145703 (or (= lt!225822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225822)))))

(assert (=> b!145703 (= lt!225822 ((_ sign_extend 32) (size!3000 (buf!3439 (_2!6870 lt!225386)))))))

(assert (= (and d!46549 res!121853) b!145702))

(assert (= (and b!145702 res!121852) b!145703))

(declare-fun m!224301 () Bool)

(assert (=> d!46549 m!224301))

(declare-fun m!224303 () Bool)

(assert (=> d!46549 m!224303))

(assert (=> b!145521 d!46549))

(assert (=> b!145521 d!46541))

(declare-fun d!46551 () Bool)

(assert (=> d!46551 (= (invariant!0 (currentBit!6324 thiss!1634) (currentByte!6329 thiss!1634) (size!3000 (buf!3439 (_2!6870 lt!225385)))) (and (bvsge (currentBit!6324 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6324 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6329 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6329 thiss!1634) (size!3000 (buf!3439 (_2!6870 lt!225385)))) (and (= (currentBit!6324 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6329 thiss!1634) (size!3000 (buf!3439 (_2!6870 lt!225385))))))))))

(assert (=> b!145530 d!46551))

(declare-fun d!46553 () Bool)

(declare-fun res!121856 () Bool)

(declare-fun e!97138 () Bool)

(assert (=> d!46553 (=> (not res!121856) (not e!97138))))

(assert (=> d!46553 (= res!121856 (= (size!3000 (buf!3439 (_2!6870 lt!225385))) (size!3000 (buf!3439 (_2!6870 lt!225386)))))))

(assert (=> d!46553 (= (isPrefixOf!0 (_2!6870 lt!225385) (_2!6870 lt!225386)) e!97138)))

(declare-fun b!145704 () Bool)

(declare-fun res!121854 () Bool)

(assert (=> b!145704 (=> (not res!121854) (not e!97138))))

(assert (=> b!145704 (= res!121854 (bvsle (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))) (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225386))) (currentByte!6329 (_2!6870 lt!225386)) (currentBit!6324 (_2!6870 lt!225386)))))))

(declare-fun b!145705 () Bool)

(declare-fun e!97139 () Bool)

(assert (=> b!145705 (= e!97138 e!97139)))

(declare-fun res!121855 () Bool)

(assert (=> b!145705 (=> res!121855 e!97139)))

(assert (=> b!145705 (= res!121855 (= (size!3000 (buf!3439 (_2!6870 lt!225385))) #b00000000000000000000000000000000))))

(declare-fun b!145706 () Bool)

(assert (=> b!145706 (= e!97139 (arrayBitRangesEq!0 (buf!3439 (_2!6870 lt!225385)) (buf!3439 (_2!6870 lt!225386)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385)))))))

(assert (= (and d!46553 res!121856) b!145704))

(assert (= (and b!145704 res!121854) b!145705))

(assert (= (and b!145705 (not res!121855)) b!145706))

(assert (=> b!145704 m!223963))

(assert (=> b!145704 m!223971))

(assert (=> b!145706 m!223963))

(assert (=> b!145706 m!223963))

(declare-fun m!224305 () Bool)

(assert (=> b!145706 m!224305))

(assert (=> b!145528 d!46553))

(declare-fun lt!225827 () tuple3!560)

(declare-fun d!46555 () Bool)

(assert (=> d!46555 (= lt!225827 (readByteArrayLoop!0 (_1!6867 lt!225389) arr!237 from!447 to!404))))

(assert (=> d!46555 (= (readByteArrayLoopPure!0 (_1!6867 lt!225389) arr!237 from!447 to!404) (tuple2!13045 (_2!6873 lt!225827) (_3!347 lt!225827)))))

(declare-fun bs!11418 () Bool)

(assert (= bs!11418 d!46555))

(declare-fun m!224307 () Bool)

(assert (=> bs!11418 m!224307))

(assert (=> b!145529 d!46555))

(declare-fun d!46557 () Bool)

(declare-fun lt!225828 () tuple2!13052)

(assert (=> d!46557 (= lt!225828 (readByte!0 (_1!6867 lt!225384)))))

(assert (=> d!46557 (= (readBytePure!0 (_1!6867 lt!225384)) (tuple2!13047 (_2!6874 lt!225828) (_1!6874 lt!225828)))))

(declare-fun bs!11419 () Bool)

(assert (= bs!11419 d!46557))

(declare-fun m!224309 () Bool)

(assert (=> bs!11419 m!224309))

(assert (=> b!145527 d!46557))

(declare-fun b!145707 () Bool)

(declare-fun res!121857 () Bool)

(declare-fun e!97140 () Bool)

(assert (=> b!145707 (=> (not res!121857) (not e!97140))))

(declare-fun lt!225830 () tuple2!13042)

(assert (=> b!145707 (= res!121857 (isPrefixOf!0 (_2!6867 lt!225830) (_2!6870 lt!225385)))))

(declare-fun b!145708 () Bool)

(declare-fun e!97141 () Unit!9073)

(declare-fun Unit!9080 () Unit!9073)

(assert (=> b!145708 (= e!97141 Unit!9080)))

(declare-fun b!145709 () Bool)

(declare-fun lt!225833 () Unit!9073)

(assert (=> b!145709 (= e!97141 lt!225833)))

(declare-fun lt!225834 () (_ BitVec 64))

(assert (=> b!145709 (= lt!225834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!225832 () (_ BitVec 64))

(assert (=> b!145709 (= lt!225832 (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))

(assert (=> b!145709 (= lt!225833 (arrayBitRangesEqSymmetric!0 (buf!3439 thiss!1634) (buf!3439 (_2!6870 lt!225385)) lt!225834 lt!225832))))

(assert (=> b!145709 (arrayBitRangesEq!0 (buf!3439 (_2!6870 lt!225385)) (buf!3439 thiss!1634) lt!225834 lt!225832)))

(declare-fun b!145710 () Bool)

(declare-fun res!121858 () Bool)

(assert (=> b!145710 (=> (not res!121858) (not e!97140))))

(assert (=> b!145710 (= res!121858 (isPrefixOf!0 (_1!6867 lt!225830) thiss!1634))))

(declare-fun lt!225842 () (_ BitVec 64))

(declare-fun b!145711 () Bool)

(declare-fun lt!225847 () (_ BitVec 64))

(assert (=> b!145711 (= e!97140 (= (_1!6867 lt!225830) (withMovedBitIndex!0 (_2!6867 lt!225830) (bvsub lt!225842 lt!225847))))))

(assert (=> b!145711 (or (= (bvand lt!225842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225842 lt!225847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145711 (= lt!225847 (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385))))))

(assert (=> b!145711 (= lt!225842 (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))

(declare-fun d!46559 () Bool)

(assert (=> d!46559 e!97140))

(declare-fun res!121859 () Bool)

(assert (=> d!46559 (=> (not res!121859) (not e!97140))))

(assert (=> d!46559 (= res!121859 (isPrefixOf!0 (_1!6867 lt!225830) (_2!6867 lt!225830)))))

(declare-fun lt!225835 () BitStream!5258)

(assert (=> d!46559 (= lt!225830 (tuple2!13043 lt!225835 (_2!6870 lt!225385)))))

(declare-fun lt!225837 () Unit!9073)

(declare-fun lt!225846 () Unit!9073)

(assert (=> d!46559 (= lt!225837 lt!225846)))

(assert (=> d!46559 (isPrefixOf!0 lt!225835 (_2!6870 lt!225385))))

(assert (=> d!46559 (= lt!225846 (lemmaIsPrefixTransitive!0 lt!225835 (_2!6870 lt!225385) (_2!6870 lt!225385)))))

(declare-fun lt!225840 () Unit!9073)

(declare-fun lt!225839 () Unit!9073)

(assert (=> d!46559 (= lt!225840 lt!225839)))

(assert (=> d!46559 (isPrefixOf!0 lt!225835 (_2!6870 lt!225385))))

(assert (=> d!46559 (= lt!225839 (lemmaIsPrefixTransitive!0 lt!225835 thiss!1634 (_2!6870 lt!225385)))))

(declare-fun lt!225841 () Unit!9073)

(assert (=> d!46559 (= lt!225841 e!97141)))

(declare-fun c!7895 () Bool)

(assert (=> d!46559 (= c!7895 (not (= (size!3000 (buf!3439 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!225848 () Unit!9073)

(declare-fun lt!225844 () Unit!9073)

(assert (=> d!46559 (= lt!225848 lt!225844)))

(assert (=> d!46559 (isPrefixOf!0 (_2!6870 lt!225385) (_2!6870 lt!225385))))

(assert (=> d!46559 (= lt!225844 (lemmaIsPrefixRefl!0 (_2!6870 lt!225385)))))

(declare-fun lt!225836 () Unit!9073)

(declare-fun lt!225831 () Unit!9073)

(assert (=> d!46559 (= lt!225836 lt!225831)))

(assert (=> d!46559 (= lt!225831 (lemmaIsPrefixRefl!0 (_2!6870 lt!225385)))))

(declare-fun lt!225845 () Unit!9073)

(declare-fun lt!225838 () Unit!9073)

(assert (=> d!46559 (= lt!225845 lt!225838)))

(assert (=> d!46559 (isPrefixOf!0 lt!225835 lt!225835)))

(assert (=> d!46559 (= lt!225838 (lemmaIsPrefixRefl!0 lt!225835))))

(declare-fun lt!225843 () Unit!9073)

(declare-fun lt!225829 () Unit!9073)

(assert (=> d!46559 (= lt!225843 lt!225829)))

(assert (=> d!46559 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46559 (= lt!225829 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46559 (= lt!225835 (BitStream!5259 (buf!3439 (_2!6870 lt!225385)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)))))

(assert (=> d!46559 (isPrefixOf!0 thiss!1634 (_2!6870 lt!225385))))

(assert (=> d!46559 (= (reader!0 thiss!1634 (_2!6870 lt!225385)) lt!225830)))

(assert (= (and d!46559 c!7895) b!145709))

(assert (= (and d!46559 (not c!7895)) b!145708))

(assert (= (and d!46559 res!121859) b!145710))

(assert (= (and b!145710 res!121858) b!145707))

(assert (= (and b!145707 res!121857) b!145711))

(declare-fun m!224311 () Bool)

(assert (=> b!145710 m!224311))

(assert (=> d!46559 m!224079))

(assert (=> d!46559 m!223959))

(declare-fun m!224313 () Bool)

(assert (=> d!46559 m!224313))

(assert (=> d!46559 m!224141))

(declare-fun m!224315 () Bool)

(assert (=> d!46559 m!224315))

(assert (=> d!46559 m!224065))

(declare-fun m!224317 () Bool)

(assert (=> d!46559 m!224317))

(declare-fun m!224319 () Bool)

(assert (=> d!46559 m!224319))

(declare-fun m!224321 () Bool)

(assert (=> d!46559 m!224321))

(declare-fun m!224323 () Bool)

(assert (=> d!46559 m!224323))

(assert (=> d!46559 m!224153))

(declare-fun m!224325 () Bool)

(assert (=> b!145707 m!224325))

(assert (=> b!145709 m!223965))

(declare-fun m!224327 () Bool)

(assert (=> b!145709 m!224327))

(declare-fun m!224329 () Bool)

(assert (=> b!145709 m!224329))

(declare-fun m!224331 () Bool)

(assert (=> b!145711 m!224331))

(assert (=> b!145711 m!223963))

(assert (=> b!145711 m!223965))

(assert (=> b!145527 d!46559))

(declare-fun d!46561 () Bool)

(declare-fun res!121862 () Bool)

(declare-fun e!97142 () Bool)

(assert (=> d!46561 (=> (not res!121862) (not e!97142))))

(assert (=> d!46561 (= res!121862 (= (size!3000 (buf!3439 thiss!1634)) (size!3000 (buf!3439 (_2!6870 lt!225385)))))))

(assert (=> d!46561 (= (isPrefixOf!0 thiss!1634 (_2!6870 lt!225385)) e!97142)))

(declare-fun b!145712 () Bool)

(declare-fun res!121860 () Bool)

(assert (=> b!145712 (=> (not res!121860) (not e!97142))))

(assert (=> b!145712 (= res!121860 (bvsle (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634)) (bitIndex!0 (size!3000 (buf!3439 (_2!6870 lt!225385))) (currentByte!6329 (_2!6870 lt!225385)) (currentBit!6324 (_2!6870 lt!225385)))))))

(declare-fun b!145713 () Bool)

(declare-fun e!97143 () Bool)

(assert (=> b!145713 (= e!97142 e!97143)))

(declare-fun res!121861 () Bool)

(assert (=> b!145713 (=> res!121861 e!97143)))

(assert (=> b!145713 (= res!121861 (= (size!3000 (buf!3439 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!145714 () Bool)

(assert (=> b!145714 (= e!97143 (arrayBitRangesEq!0 (buf!3439 thiss!1634) (buf!3439 (_2!6870 lt!225385)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3000 (buf!3439 thiss!1634)) (currentByte!6329 thiss!1634) (currentBit!6324 thiss!1634))))))

(assert (= (and d!46561 res!121862) b!145712))

(assert (= (and b!145712 res!121860) b!145713))

(assert (= (and b!145713 (not res!121861)) b!145714))

(assert (=> b!145712 m!223965))

(assert (=> b!145712 m!223963))

(assert (=> b!145714 m!223965))

(assert (=> b!145714 m!223965))

(declare-fun m!224333 () Bool)

(assert (=> b!145714 m!224333))

(assert (=> b!145526 d!46561))

(push 1)

(assert (not d!46555))

(assert (not d!46471))

(assert (not b!145599))

(assert (not d!46455))

(assert (not d!46473))

(assert (not b!145694))

(assert (not b!145645))

(assert (not b!145712))

(assert (not b!145674))

(assert (not b!145710))

(assert (not b!145714))

(assert (not d!46479))

(assert (not b!145696))

(assert (not d!46494))

(assert (not d!46549))

(assert (not b!145693))

(assert (not d!46505))

(assert (not d!46467))

(assert (not d!46557))

(assert (not d!46481))

(assert (not d!46492))

(assert (not b!145585))

(assert (not d!46525))

(assert (not d!46501))

(assert (not b!145672))

(assert (not d!46529))

(assert (not b!145709))

(assert (not b!145627))

(assert (not d!46477))

(assert (not b!145711))

(assert (not b!145704))

(assert (not b!145582))

(assert (not b!145673))

(assert (not b!145629))

(assert (not b!145697))

(assert (not d!46513))

(assert (not d!46503))

(assert (not b!145706))

(assert (not d!46489))

(assert (not d!46457))

(assert (not b!145586))

(assert (not b!145584))

(assert (not d!46543))

(assert (not d!46459))

(assert (not d!46485))

(assert (not d!46559))

(assert (not d!46445))

(assert (not d!46547))

(assert (not b!145592))

(assert (not b!145625))

(assert (not b!145601))

(assert (not b!145707))

(assert (not b!145628))

(assert (not d!46541))

(assert (not b!145695))

(assert (not d!46487))

(assert (not d!46475))

(assert (not d!46461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

